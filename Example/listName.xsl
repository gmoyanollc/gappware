<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions"
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>

    <xsl:template match="node() | @*">
        <xsl:apply-templates select="node() | @*"/>
    </xsl:template>

    <xsl:template match="/">name=<xsl:apply-templates select="node() | @*"/>
    </xsl:template>

    <xsl:template match="@name">
        <xsl:text>&#xa;</xsl:text>
        <xsl:value-of select="."/>
        <xsl:value-of select="fn:node."/>
    </xsl:template>

</xsl:stylesheet>
