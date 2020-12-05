module namespace page = "http://basex.org/examples/web-page";

(: Adiciona um documento a base de Dados :)

declare %updating
%rest:path("/adddocument")
%rest:consumes("application/xml", "text/xml")
%rest:POST("{$body}")
function page:addToDatabase($body as document-node()) {

let $schema := doc("../xsd/validation.xsd")

let $res := validate:xsd-report($body, $schema)

return if($res//status/text() = "valid") then db:add("BuyTeckDB", $body, concat($body//UID,".xml"))

};

(: Retorna uma listagem de todos os produtos de um certo vendedor :)

declare
%rest:path("/getproducts")
%rest:consumes("application/xml", "text/xml")
%rest:query-param("seller", "{$seller}")
%rest:GET
function page:getProducts($seller) {
for $doc in db:open("BuyTeckDB")/DOCUMENT
where $doc/SELLER/UID = $seller
return <all>{$doc/PRODUCTS/PRODUCT/PRODUCT_INFO}</all>
};

(: Retorna todos os negócios de um certo vendedor :)

declare
%rest:path("/getsales")
%rest:consumes("application/xml", "text/xml")
%rest:query-param("seller", "{$seller}")
%rest:GET
function page:getSales($seller) {
let $docs := for $doc in db:open("BuyTeckDB")/DOCUMENT
             where $doc/SELLER/UID = $seller
             return $doc
for $doc in $docs
where $doc//PRODUCT/SALE_INFO[@status="active"]
return <all>$doc/PRODUCTS/PRODUCT</all>
};


(: Retorna o stock de um determinado produto se este estiver a ser vendido por venda direta, independentemente do negócio estar ativo, ou de ser de vendedores diferentes :)

declare
%rest:path("/getstock")
%rest:consumes("application/xml", "text/xml")
%rest:query-param("product", "{$product}")
%rest:GET
function page:getStock($product) {
let $res := for $prod in db:open("BuyTeckDB")//PRODUCT_INFO
            where $prod/NAME = $product
            return <stocks>{$prod/STOCK}</stocks>
return <stock>{sum($res//STOCK)}</stock>
};

(: Apaga todos os documentos relacionados a um seller :)

declare %updating
%rest:path("/cancelcontract")
%rest:consumes("application/xml", "text/xml")
%rest:query-param("seller", "{$seller}")
%output:media-type("text/html")
%rest:GET
function page:cancelContract($seller) {
  db:delete("BuyTeckDB", concat($seller, ".xml"))
};

(: Cancela um negócio :)

declare %updating
%rest:path("/cancelselling")
%rest:consumes("application/xml", "text/xml")
%output:media-type("text/html")
%rest:query-param("id", "{$id}")
%rest:GET
function page:cancelSale($id) {
for $doc in db:open("BuyTeckDB")//SALE_INFO
where $doc/ID = $id
return replace value of node $doc/@status with "canceled"

};

(: Ativa um negócio :)

declare %updating
%rest:path("/activateselling")
%rest:consumes("application/xml", "text/xml")
%output:media-type("text/html")
%rest:query-param("id", "{$id}")
%rest:GET
function page:activateSale($id) {
for $doc in db:open("BuyTeckDB")//SALE_INFO
where $doc/ID = $id
return replace value of node $doc/@status with "active"
};

(: Altera a data de fim de negócio :)

declare %updating
%rest:path("/extenddate")
%rest:consumes("application/xml", "text/xml")
%rest:query-param("id", "{$id}")
%rest:query-param("newDate", "{$newDate}")
%output:media-type("text/html")
%rest:GET
function page:extendDate($id, $newDate) {
for $doc in db:open("BuyTeckDB")//SALE_INFO
where $doc/ID = $id
return replace value of node $doc/END_DATE with $newDate
};

(: Altera o preço de um negócio :)

declare %updating
%rest:path("/updateprice")
%rest:consumes("application/xml", "text/xml")
%rest:query-param("id", "{$id}")
%rest:query-param("newPrice", "{$newPrice}")
%output:media-type("text/html")
%rest:GET
function page:updatePrice($id, $newPrice) {
for $doc in db:open("BuyTeckDB")//SALE_INFO
where $doc/ID = $id
return replace value of node $doc/PRICE with $newPrice
};

(: Atualiza o stock de um produto :)

declare %updating
%rest:path("/updatestock")
%rest:consumes("application/xml", "text/xml")
%rest:query-param("id", "{$id}")
%rest:query-param("stock", "{$stock}")
%output:media-type("text/html")
%rest:GET
function page:updateStock($id, $stock) {
for $doc in db:open("BuyTeckDB")//PRODUCT
where $doc/SALE_INFO/ID = $id
return replace value of node $doc/PRODUCT_INFO/STOCK with $stock
};


(: Retorna uma transformação do resumo da DB para html :)

declare
%rest:path("/resume")
%output:media-type("text/html")
%rest:GET
function page:getHTML(){
let $r := <all>{db:open("BuyTeckDB")//DOCUMENT}</all>
let $style := doc("../xsl/html_transform_Home.xsl")
return xslt:transform($r, $style) 
};

declare
%rest:path("/resume/sellers")
%output:media-type("text/html")
%rest:GET
function page:getHTMLVendedores(){
let $r := <all>{db:open("BuyTeckDB")//DOCUMENT}</all>
let $style := doc("../xsl/html_transform_sellers.xsl")
return xslt:transform($r, $style)
};

declare
%rest:path("/resume/products")
%output:media-type("text/html")
%rest:GET
function page:getHTMLProdutos(){
let $r := <all>{db:open("BuyTeckDB")//DOCUMENT}</all>
let $style := doc("../xsl/html_transform_Products.xsl")
return xslt:transform($r, $style)
};

declare
%rest:path("/resume/activesales")
%output:media-type("html")
%rest:GET
function page:getHTMLVendasAtivas(){
let $r := <all>{
for $sale in db:open("BuyTeckDB")//PRODUCT/SALE_INFO
where $sale/@status = "active"
return $sale
}</all>
let $style := doc("../xsl/html_transform_ActiveSales.xsl")
return xslt:transform($r, $style)
};

declare
%rest:path("/resume/getproducts")
%rest:consumes("application/xml", "text/xml")
%rest:query-param("seller", "{$seller}")
%output:media-type("html")
%rest:GET
function page:getProductsHTML($seller) {
let $res := for $doc in db:open("BuyTeckDB")//DOCUMENT
where $doc/SELLER/UID = $seller
return <all>{$doc/PRODUCTS/PRODUCT}</all>

let $style := doc("..\xsl\html_transform_seller_products.xsl")

return xslt:transform($res, $style)
};

declare
%rest:path("/resume/getsales")
%rest:consumes("application/xml", "text/xml")
%rest:query-param("seller", "{$seller}")
%output:media-type("html")
%rest:GET
function page:getSalesHTML($seller) {

let $style := doc("../xsl/html_transform_seller_sales.xsl")

let $res := <all>{
let $docs := for $doc in db:open("BuyTeckDB")/DOCUMENT
where $doc/SELLER/UID = $seller
return $doc
for $doc in $docs
where $doc//PRODUCT/SALE_INFO
return $doc/PRODUCTS/PRODUCT}</all>

return xslt:transform($res, $style)
};

