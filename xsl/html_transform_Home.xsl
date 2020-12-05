<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0" xmlns:msxsl="urn:schemas-microsoft-com:xslt">
    <xsl:output method="xml" indent="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.1//EN" doctype-system="http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd" omit-xml-declaration="no"/>
    <xsl:template match="/">
        <html>
            <style type="text/css">
                @import "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css";
                
                * {
                    font-family: Verdana, sans-serif;
                }
                
                .whiteSpace {
                    padding-left: 10px;
                }
                
                h2,
                h1 {
                    font-family: Verdana, sans-serif;
                    text-align: center;
                }
                
                #chart {
                    width: 500px;
                    height: auto;
                }
                
                .label-color {
                    margin-left: 20px;
                }
                
                .piechart {
                    margin-left: 150px;
                    width: 200px;
                    height: 200px;
                    border-radius: 50%;
                    justify-content: center;
                    align-items: center;
                }
                
                h2 {
                    text-align: center;
                    padding-top: 20px;
                    padding-bottom: 20px;
                }
                
                button {
                    margin-top: 20px;
                }
                
                .mb {
                    margin-bottom: 20px;
                }
                
            </style>
            
            
            
            <header>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="#">BuyTeckDB</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon" />
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <a class="nav-link" href="http://localhost:8984/resume/sellers">Sellers</a>
                            <a class="nav-link" href="http://localhost:8984/resume/products">Products</a>
                            <a class="nav-link" href="http://localhost:8984/resume/activesales">Active Sales</a>
                        </div>
                    </div>
                </nav>
            </header>
            <body>
                <p>
                    <h1>ACTIONS</h1>
                </p>
                
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card mb">
                                <div class="card-body">
                                    <form method="get" action="http://localhost:8984/resume/getproducts" id="form2">
                                        <div class="form-group">
                                            <label>Check products of a seller:</label>
                                            <input id="sellerid" type="text" class="form-control" placeholder="Insert here the ID of the seller that you want to check" name="seller"/>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-dark" onclick="(document.getElementById('sellerid').value == '') ? alert('Please, fill in the field.') : document.getElementById('form2').submit()">Submit</button>
                                    <button type="reset" class="btn btn-gray" onclick="document.getElementById('sellerid').value = ''">Reset</button>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <form method="get" action="http://localhost:8984/resume/getsales" id="form3">
                                        <div class="form-group">
                                            <label for="formGroupExampleInput">Check sales of a seller:</label>
                                            <input id="sellerid2" type="text" class="form-control" placeholder="Insert here the ID of the seller that you want to check" name="seller"/>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-dark" onclick="(document.getElementById('sellerid2').value == '') ? alert('Please, fill in the field.') : document.getElementById('form3').submit()">Submit</button>
                                    <button type="reset" class="btn btn-gray" onclick="document.getElementById('sellerid2').value = ''">Reset</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <form id="form4" action="http://localhost:8984/getstock">
                                        <div class="form-group">
                                            <label>Check stock of a product:</label>
                                            <input id="productid" type="text" class="form-control" placeholder="Insert here the name of the product that you want to check the stock" name="product"/>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-dark" onclick="(document.getElementById('productid').value == '') ? alert('Please, fill in the field.') : document.getElementById('form4').submit()">Submit</button>
                                    <button type="reset" class="btn btn-gray" onclick="document.getElementById('productid').value = ''">Reset</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <hr/>
               <p>
                <h1>UPDATE</h1>
                </p>
                
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card mb">
                                <div class="card-body">
                                    <form method="get" name="adddoc" action="http://localhost:8984/cancelcontract" id="form5">
                                        <div class="form-group pad_b">
                                            <label for="formGroupExampleInput">Cancel contract of a seller:</label>
                                            <input id="sellerid3" type="text" class="form-control mb" placeholder="Insert here the seller id that you want to cancel." name="seller"/>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-dark" onclick="(document.getElementById('sellerid3').value == '') ? alert('Please, fill in the field.') : document.getElementById('form5').submit();">Submit</button>
                                    <button type="reset" class="btn btn-gray" onclick="document.getElementById('sellerid3').value = ''">Reset</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card mb">
                                <div class="card-body">
                                    <form action="http://localhost:8984/cancelselling" id="form6">
                                        <div class="form-group">
                                            <label for="formGroupExampleInput">Cancel one sale:</label>
                                            <input id="saleid1" type="text" class="form-control" placeholder="Insert here the ID of the sale that you want to cancel" name="id"/>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-dark mb" onclick="(document.getElementById('saleid1').value == '') ? alert('Please, fill in the field.') : document.getElementById('form6').submit()">Submit</button>
                                    <button type="reset" class="btn btn-gray mb" onclick="document.getElementById('saleid1').value = ''">Reset</button>
                                    <form action="http://localhost:8984/activateselling" id="form11">
                                        <div class="form-group">
                                            <label for="formGroupExampleInput">Activate one sale:</label>
                                            <input id="saleid11" type="text" class="form-control" placeholder="Insert here the ID of the sale that you want to activate" name="id"/>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-dark" onclick="(document.getElementById('saleid11').value == '') ? alert('Please, fill in the field.') : document.getElementById('form11').submit()">Submit</button>
                                    <button type="reset" class="btn btn-gray" onclick="document.getElementById('saleid11').value = ''">Reset</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card mb">
                                <div class="card-body">
                                    <form action="http://localhost:8984/extenddate" id="form7">
                                        <div class="form-group">
                                            <label for="formGroupExampleInput">Extend date for one sale:</label>
                                            <input id="saleid2" type="text" class="form-control mb" placeholder="Insert here the ID of the sale" name="id"/>
                                            <input id="newDate" type="date" class="form-control" placeholder="Insert here the new date" name="newDate"/>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-dark" onclick="(document.getElementById('saleid2').value == '' || document.getElementById('newDate').value == '') ? alert('Please, fill in the field.') :  document.getElementById('form7').submit()">Submit</button>
                                    <button type="reset" class="btn btn-gray" onclick="document.getElementById('saleid2').value = ''; document.getElementById('newDate').value = ''">Reset</button>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card mb">
                                <div class="card-body">
                                    <form action="http://localhost:8984/updateprice" id="form8">
                                        <div class="form-group">
                                            <label>Change the price of a product:</label>
                                            <input id="saleid3" type="text" class="form-control mb" placeholder="Insert here the ID of the sale" name="id"/>
                                            <input id="newPrice" type="text" class="form-control" placeholder="Insert here the new price" name="newPrice"/>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-dark" onclick="(document.getElementById('newPrice').value == '' || document.getElementById('saleid3').value == '') ? alert('Please, fill in the field.') :  document.getElementById('form8').submit()">Submit</button>
                                    <button type="reset" class="btn btn-gray" onclick="document.getElementById('newPrice').value = ''; document.getElementById('saleid3').value = ''">Reset</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <form action="http://localhost:8984/updatestock" id="form9">
                                        <div class="form-group">
                                            <label>Update stock of a product:</label>
                                            <input id="saleid4" type="text" class="form-control mb" placeholder="Insert here the sale id" name="id"/>
                                            <input id="newStock" type="text" class="form-control" placeholder="Insert here the new stock" name="stock"/>
                                        </div>
                                    </form>
                                    <button type="submit" class="btn btn-dark" onclick="(document.getElementById('saleid4').value == '' || document.getElementById('newStock').value == '') ? alert('Please, fill in the field.') :  document.getElementById('form9').submit()">Submit</button>
                                    <button type="reset" class="btn btn-gray" onclick="document.getElementById('saleid4').value = ''; document.getElementById('newStock').value = ''">Reset</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </body> 
        </html>
        
        
    </xsl:template>
    
    
</xsl:stylesheet>