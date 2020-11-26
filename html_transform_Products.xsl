<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <style type="text/css">
                @import "bootstrap.min.css";
                
                * {
                    font-family: Lobster, monospace;
                }
                
                h2 {
                    text-align: center;
                }
            </style>
            <body>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="#">BuyTeckDB</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon" />
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <a class="nav-link" href="http://localhost:8984/getResume">Inicio</a>
                            <a class="nav-link" href="http://localhost:8984/getResume/vendedores">Vendedores</a>
                            <a class="nav-link active" href="http://localhost:8984/getResume/produtos">Produtos</a>
                            <a class="nav-link" href="http://localhost:8984/getResume/vendasAtivas">Vendas ativas</a>
                        </div>
                    </div>
                </nav>
                <h2>PRODUTOS REGISTADOS: <xsl:value-of select="count(all//PRODUCT_INFO)"/>
                </h2>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">SALE TYPE</th>
                            <th scope="col">PRODUCT</th>
                            <th scope="col">BRAND</th>
                            <th scope="col">STOCK</th>
                            <th scope="col">DESCRIPTION</th>
                        </tr>
                    </thead>
                    <xsl:for-each select="//DOCUMENT//PRODUCT">
                        <tr>
                            <td>
                                <xsl:value-of select="SALE_INFO/@type"/>
                            </td>
                            <td>
                                <xsl:value-of select="PRODUCT_INFO/NAME"/>
                            </td>
                            <td>
                                <xsl:value-of select="PRODUCT_INFO/BRAND"/>
                            </td>
                            <td>
                                <xsl:value-of select="PRODUCT_INFO/STOCK"/>
                            </td>
                            <td>
                                <xsl:value-of select="PRODUCT_INFO/DESCRIPTION"/>
                            </td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>