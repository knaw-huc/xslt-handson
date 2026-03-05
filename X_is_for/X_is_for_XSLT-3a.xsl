<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:template match="@*">
        <xsl:copy/>
    </xsl:template>

    <xsl:template match="node()">
        <xsl:text>[pre]</xsl:text>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:text>[inner prologue]</xsl:text>
            <xsl:apply-templates select="node()"/>
            <xsl:text>[inner epilogue]</xsl:text>
        </xsl:copy>
        <xsl:text>[post]</xsl:text>
    </xsl:template>
    
</xsl:stylesheet>