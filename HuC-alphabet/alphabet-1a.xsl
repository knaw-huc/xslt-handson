<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">

    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="lookup">
        <html>
            <head>
                <title>HuC alphabet</title>
            </head>
            <body>
                <xsl:for-each select="entry">
                    <p>
                        <strong>
                            <xsl:value-of select="substring(abbr, 1, 1)"/>
                            <!--<xsl:value-of select="replace(abbr,'^([a-zA-Z]).*$','$1')"/>--> 
                        </strong>
                        <xsl:text> is for </xsl:text>
                        <abbr title="{full}">
                            <xsl:value-of select="abbr"/>
                        </abbr>
                        <xsl:text>!</xsl:text>
                    </p>
                </xsl:for-each>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
