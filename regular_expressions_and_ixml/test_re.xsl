<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    
    <xsl:param name="re" select="'^(\d+)\-(\d+)\-(\d+)$'"/>
    <xsl:param name="test" select="'2026-07-01'"/>
    
    <xsl:template name="main">
        <xsl:copy-of select="analyze-string($test,$re)"/>
    </xsl:template>
    
</xsl:stylesheet>