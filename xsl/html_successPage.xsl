<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <style type="text/css">
                @import "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css";
                
                * {
                font-family: Verdana, sans-serif;
                }
                
                h1 {
                font-family: Verdana, sans-serif;
                font-size: 100px;
                text-align: center;
                padding-top: 30px;
                padding-bottom: 20px;
                color: green;
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
                            <a class="nav-link" href="http://localhost:8984/resume/activesales">Active Sales</a>
                        </div>
                    </div>
                </nav>
            </header>
            
            <body>
                <h1>SUCCSESS</h1>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>