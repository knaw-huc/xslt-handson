<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:functx="http://www.functx.com"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs math functx"
    version="3.0">
    
    <xsl:function name="functx:node-kind" as="xs:string*">
        <xsl:param name="nodes" as="node()*"/>
        
        <xsl:sequence select="
            for $node in $nodes
            return
            if ($node instance of element()) then 'element'
            else if ($node instance of attribute()) then 'attribute'
            else if ($node instance of text()) then 'text'
            else if ($node instance of document-node()) then 'document-node'
            else if ($node instance of comment()) then 'comment'
            else if ($node instance of processing-instruction())
            then 'processing-instruction'
            else 'unknown'
            "/>
        
    </xsl:function>
    
    <xsl:template match="@*">
        <xsl:copy/>
    </xsl:template>
    
    <xsl:template match="node()">
        <xsl:element name="pre_{(local-name()[.!=''],functx:node-kind(.))[1]}"/>
        <xsl:copy>
            <xsl:apply-templates select="@*"/>
            <xsl:text>[inner prologue]</xsl:text>
            <xsl:apply-templates select="node()"/>
            <xsl:text>[inner epilogue]</xsl:text>
        </xsl:copy>
        <xsl:element name="post_{(local-name()[.!=''],functx:node-kind(.))[1]}"/>
    </xsl:template>
    
    <xsl:template match="/">
        <root>
            <xsl:apply-templates/>
        </root>
    </xsl:template>
    
</xsl:stylesheet>