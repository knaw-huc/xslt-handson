<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:js="http://www.w3.org/2005/xpath-functions"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    xmlns:ed="http://xmlschema.huygens.knaw.nl/ns/editem"
    exclude-result-prefixes="xs" version="3.0">

    <xsl:output method="text" encoding="UTF-8"/>

    <xsl:param name="js-uri" select="'../in/dataset.js'"/>
    <xsl:param name="js-doc" select="
            if (js:unparsed-text-available($js-uri)) then
                (unparsed-text($js-uri))
            else
                ()"/>
    <xsl:param name="js-xml" select="json-to-xml($js-doc)"/>
    
    <xsl:param name="tei" select="doc('../in/artwork.xml')"/>

    <xsl:template name="main">
        <xsl:variable name="xml-js">
            <xsl:apply-templates select="$js-xml"/>
        </xsl:variable>
        <!--<xsl:copy-of select="$xml-js"/>-->
        <xsl:value-of select="js:xml-to-json($xml-js)"/>
    </xsl:template>

    <xsl:template match="text()"/>

    <xsl:template match="/">
        <js:array>
            <xsl:apply-templates/>
        </js:array>
    </xsl:template>

    <xsl:template match="/js:array/js:map/js:string[@key = '@id'][contains(., '/artwork/')]">
        <js:map>
            <js:string key="id">
                <xsl:value-of select="."/>
            </js:string>
        </js:map>
    </xsl:template>

</xsl:stylesheet>
