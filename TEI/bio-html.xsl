<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs math tei"
    version="3.0">
    
    <xsl:output method="html" encoding="UTF-8"/>
    
    <xsl:template match="text()"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>
                    <xsl:value-of select="/tei:TEI/tei:teiHeader/tei:fileDesc/tei:titleStmt/tei:title"/>
                </title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tei:listPerson">
        <dl>
            <xsl:apply-templates/>
        </dl>
    </xsl:template>
    
    <xsl:template match="tei:person">
        <dt>
            <xsl:value-of select="tei:persName"/>
        </dt>
        <dd>
            <ul>
            <xsl:for-each select="* except tei:persName">
                <li>
                    <xsl:value-of select="local-name()"/>
                    <xsl:text>:</xsl:text>
                    <xsl:value-of select="(.,@when)[normalize-space(.)!=''][1]"/>
                </li>
            </xsl:for-each>
            </ul>
        </dd>
    </xsl:template>
    
</xsl:stylesheet>