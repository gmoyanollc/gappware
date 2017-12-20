<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:gxln="http://www.gappware.com/gxsllistname" gxln:version="1.0.1" 
    exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="text"/>

    <xsl:template match="node() | @*">
        <xsl:apply-templates select="node() | @*"/>
    </xsl:template>

    <xsl:template match="/">XmlType,name<xsl:apply-templates select="node() | @*"/>
    </xsl:template>

    <xsl:template match="@name">
        <!-- newline -->
        <xsl:text>&#xa;</xsl:text>
        <xsl:value-of select="local-name(..)"/>
        <xsl:text>,&quot;</xsl:text>
        <xsl:value-of select="." />
        <xsl:text>&quot;</xsl:text>
    </xsl:template>

</xsl:stylesheet>
