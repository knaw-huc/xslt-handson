<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
    version="3.0">

    <xsl:output method="html" encoding="UTF-8"/>

    <xsl:template match="lookup">
        <xsl:for-each-group select="entry" group-by="substring(abbr, 1, 1)">
            <xsl:result-document href="out/alphabet-1-{current-grouping-key()}.html" method="html" encoding="UTF-8">
                <html>
                    <head>
                        <title>HuC alphabet</title>
                    </head>
                    <body>
                        <p>
                            <strong>
                                <xsl:value-of select="current-grouping-key()"/>
                            </strong>
                            <xsl:text> is for </xsl:text>
                            <xsl:for-each select="current-group()">
                                <xsl:sort order="ascending"/>
                                <abbr title="{full}">
                                    <xsl:value-of select="abbr"/>
                                </abbr>
                                <xsl:choose>
                                    <xsl:when test="position() = (last() - 1)">
                                        <xsl:text> or </xsl:text>
                                    </xsl:when>
                                    <xsl:when test="position() != last()">
                                        <xsl:text>, </xsl:text>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:text>!</xsl:text>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:for-each>
                        </p>
                    </body>
                </html>
            </xsl:result-document>
        </xsl:for-each-group>
    </xsl:template>

</xsl:stylesheet>
