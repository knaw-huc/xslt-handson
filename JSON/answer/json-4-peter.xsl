<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:js="http://www.w3.org/2005/xpath-functions"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:ed="http://xmlschema.huygens.knaw.nl/ns/editem"
    xmlns:file="http://expath.org/ns/file"
    exclude-result-prefixes="xs" version="3.0">
    
    <!--<xsl:output method="text" encoding="UTF-8"/>-->
    
    <xsl:variable name="stylesheet-uri" select="document-uri(document(''))"/> <!--says claude-->
    
    <xsl:param name="js-uri" select="resolve-uri('./in/dataset.js',$stylesheet-uri)"/>
    
    <xsl:param name="js-doc" select="
        if (js:unparsed-text-available($js-uri)) then
        (unparsed-text($js-uri))
        else
        ()"/>
    <xsl:param name="js-xml" select="json-to-xml($js-doc)"/>
    
    <xsl:param name="tei" select="doc(resolve-uri('./in/artwork.xml',$stylesheet-uri))"/>
    
    <xsl:template name="main">
        <xsl:variable name="xml-js">
            <xsl:apply-templates select="$js-xml"/>
        </xsl:variable>
        <xsl:copy-of select="$xml-js"/>
        <xsl:variable name="string-out" select="js:xml-to-json($xml-js)"/>
        <xsl:message>iets</xsl:message>
    </xsl:template>
    
    <xsl:template match="text()"/>
    
    <xsl:template match="/">
        <js:array>
            <xsl:apply-templates/>
        </js:array>
    </xsl:template>
    
    <xsl:template match="/js:array/js:map/js:string[@key = '@id'][contains(., '/artwork/')]">
        <js:map>
            <xsl:variable name="id-alpha" select="replace(.,'^.*/(.*?)(\d+)V.*$','$1')"/>
            <xsl:variable name="id-num" select="format-number(number(replace(.,'^.*/(.*?)(\d+)V.*$','$2')),'0000')"/>
            <xsl:variable name="id"  select="concat($id-alpha,$id-num)"/>
            <js:string key="id">
                <xsl:value-of select="$id"/>
            </js:string>
            <xsl:for-each select="$tei//ed:artwork/tei:idno[@type='inventory']">
                <xsl:variable name="idno-alpha" select="substring(.,1,1)"/>
                <xsl:variable name="idno-num" select="substring(.,2)"/>
                <xsl:if test="matches($idno-num,'^\d{1,4}$')">
                    <xsl:variable name="newidno" select="concat($idno-alpha,format-number(number($idno-num),'0000'))"/>
                    <xsl:if test="$id = $newidno">
                        <js:string key="artwork">
                            <xsl:value-of select="parent::*/@xml:id"/>
                        </js:string>
                        <js:string key="invno">
                            <xsl:value-of select="."/>
                        </js:string>
                        <js:string key="newinvno">
                            <xsl:value-of select="$newidno"/>
                        </js:string>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </js:map>
    </xsl:template>
    
</xsl:stylesheet>