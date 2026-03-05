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
                <ul>
                    <xsl:apply-templates select="*">
                        <xsl:sort select="."/>
                    </xsl:apply-templates>
                </ul>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="*">
        <li>
            <strong>
                <xsl:value-of select="substring(local-name(), 1, 1)"/>
            </strong>
            <xsl:text> is for </xsl:text>
            <abbr title="{.}">
                <xsl:value-of select="local-name()"/>
            </abbr>
            <xsl:text>!</xsl:text>
        </li>
    </xsl:template>

</xsl:stylesheet>
