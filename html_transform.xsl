<?xml version="1.0" encoding="UTF-8"?>
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
                <h2>VENDEDORES REGISTADOS: <xsl:value-of select="count(all//SELLER)"/></h2>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">SELLER NAME</th>
                            <th scope="col">SELLER NIF</th>
                        </tr>
                    </thead>
                    <tbody>
                    <xsl:for-each select="/all//SELLER">
                        <tr>
                            <td><xsl:value-of select="NAME"/></td>
                            <td><xsl:value-of select="NIF"/></td>
                        </tr>
                    </xsl:for-each>
                    </tbody>
                </table>
                <h2>PRODUTOS REGISTADOS: <xsl:value-of select="count(all//PRODUCT_INFO)"/></h2>
                <table class="table">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">PRODUCT</th>
                            <th scope="col">BRAND</th>
                            <th scope="col">STOCK</th>
                            <th scope="col">DESCRIPTION</th>
                        </tr>
                    </thead>
                    <xsl:for-each select="/all//PRODUCT_INFO">
                        <tr>
                            <td><xsl:value-of select="NAME"/></td>
                            <td><xsl:value-of select="BRAND"/></td>
                            <td><xsl:value-of select="STOCK"/></td>
                            <td><xsl:value-of select="DESCRIPTION"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>