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
        <xsl:for-each select="parse-json($js-doc)?*">
            <xsl:variable name="id" select=".('@id')"/>
            <xsl:if test="contains($id,'/artwork/')">
                <xsl:message expand-text="yes">DBG? artwork ID[{$id}]</xsl:message>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
