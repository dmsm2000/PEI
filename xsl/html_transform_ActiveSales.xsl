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
                            <a class="nav-link" href="http://localhost:8984/resume/products">Products</a>
                            <a class="nav-link active" href="http://localhost:8984/resume/activesales">Active Sales</a>
                        </div>
                    </div>
                </nav>
            </header>
            
            <body>
                <h2>Number of Active Sales: <span class="whiteSpace"><xsl:value-of select="count(all//SALE_INFO)"/></span>
                </h2>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">UID</th>
                            <th scope="col">PRODUCT</th>
                            <th scope="col">SALE TYPE</th>
                            <th scope="col">START DATE</th>
                            <th scope="col">END DATE</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="all">
                            <tr>
                                <td>
                                    <xsl:value-of select="SALE_INFO/ID"/>
                                </td>
                                <td>
                                    <xsl:value-of select="PRODUCT/NAME"/>
                                </td>
                                <td>
                                    <xsl:value-of select="SALE_INFO/@type"/>
                                </td>
                                <td>
                                    <xsl:value-of select="SALE_INFO/START_DATE"/>
                                </td>
                                <td>
                                    <xsl:value-of select="SALE_INFO/END_DATE"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>