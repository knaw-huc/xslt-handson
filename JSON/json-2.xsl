<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:js="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs"
    version="3.0">
    
    <xsl:param name="js-uri" select="'./in/dataset.js'"/>
    <xsl:param name="js-doc" select="
        if (js:unparsed-text-available($js-uri)) then
        (unparsed-text($js-uri))
        else
        ()"/>
    <xsl:param name="js-xml" select="json-to-xml($js-doc)"/>
    
    <xsl:template name="main">
        
        <!-- TODO: find all the artwork IDs in in/dataset.js list them via messages, a JSON, a CSV, or ... -->
        
    </xsl:template>
    
</xsl:stylesheet>