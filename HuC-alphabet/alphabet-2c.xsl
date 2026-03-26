<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">
    

    <xsl:variable name="debug" select="false()" static="yes"/>
    
    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="lookup">
        <xsl:message use-when="$debug">?DBG: Welcome at [<xsl:value-of select="current-time()"/>]</xsl:message>
        <html>
            <head>
                <title>HuC alphabet</title>
            </head>
            <body>
                <ul>
                    <xsl:apply-templates select="*">
                        <xsl:sort select="."/>
                        <xsl:with-param name="letter" select="'strong'" tunnel="yes"/>
                    </xsl:apply-templates>
                </ul>
            </body>
        </html>
        <xsl:message use-when="$debug" expand-text="yes">?DBG: Goodbye at [{current-time()}]</xsl:message>
    </xsl:template>
    
    <xsl:template name="is_for">
        <xsl:param name="letter" tunnel="yes"/>
        <xsl:element name="{$letter}">
            <xsl:value-of select="substring(local-name(), 1, 1)"/>
        </xsl:element>
        <xsl:text> is for </xsl:text>
        <abbr title="{.}">
            <xsl:value-of select="local-name()"/>
        </abbr>
        <xsl:text>!</xsl:text>
    </xsl:template>

    <xsl:template match="*">
        <li>
            <xsl:call-template name="is_for"/>
        </li>
    </xsl:template>

</xsl:stylesheet>
