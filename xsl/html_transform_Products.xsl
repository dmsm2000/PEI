<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
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
                
                h2 {
                    font-family: Verdana, sans-serif;
                    text-align: center;
                    padding-top: 20px;
                    padding-bottom: 20px;
                }
            </style>
            
            <header>
                <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                    <a class="navbar-brand" href="http://localhost:8984/resume">BuyTeckDB</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon" />
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <a class="nav-link" href="http://localhost:8984/resume/sellers">Sellers</a>
                            <a class="nav-link active" href="http://localhost:8984/resume/products">Products</a>
                            <a class="nav-link" href="http://localhost:8984/resume/activesales">Active Sales</a>
                        </div>
                    </div>
                </nav>
            </header>
            
            <body>
                <h2>Number of Products: <span class="whiteSpace"><xsl:value-of select="count(all//PRODUCT_INFO)"/></span>
                </h2>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">PRODUCT</th>
                            <th scope="col">BRAND</th>
                            <th scope="col">STOCK</th>
                            <th scope="col">DESCRIPTION</th>
                        </tr>
                    </thead>
                    <xsl:for-each select="//DOCUMENT//PRODUCT">
                        <tr>
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