<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="tei:text//tei:p">
        <xsl:copy >
            <xsl:attribute name="n" select="count(preceding::tei:p[exists(ancestor::tei:text)]) + 1"/>
            <xsl:apply-templates select="node() | @* except @n"/>
        </xsl:copy>
    </xsl:template>
    
</xsl:stylesheet>