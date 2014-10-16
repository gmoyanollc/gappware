<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" 
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:str="http://www.metaphoricalweb.org/xmlns/string-utilities"
    xmlns="http://www.gappware.com/gxsltransform"
    xmlns:gxt="http://www.gappware.com/gxsltransform" gxt:version="1.00" version="2.0">
    <xsl:output method="xml" indent="no"/>

    <xsl:variable name="INPUT_DOCUMENT_XML_SCHEMA_PREFIX_XS" select="'xs'"/>
    <xsl:variable name="INPUT_DOCUMENT_XML_SCHEMA_PREFIX_XSD" select="'xsd'"/>
    <!-- The following is for the input document prefix name, if one exists. 
        An input document may declare it's namespace using the XML statement 'xmlns='  
        and a prefix that matches the namespace value using 'xmlns:' + <prefix-name> + '='.  -->
    <xsl:variable name="INPUT_DOCUMENT_PREFIX" select="''"/>
    <xsl:variable name="CHARACTER_OR_REGULAR_EXPRESSION_WORD_DELIMITER" select="'_'"/>
    <xsl:variable name="REMOTE_SERVICE_LOWER_CAMEL_CASE"
        >http://127.0.0.1:5555/gxslservice/string/lowercamelcase</xsl:variable>
    <!--<xsl:variable name="REMOTE_SERVICE_LOWER_CAMEL_CASE"
        >http://gappware-gmoyano.rhcloud.com/gxslservice/string/lowercamelcase</xsl:variable>-->

    <!-- The following function originally only converted to CamelCase.  It was published by http://www.metaphoricalweb.org .
         Function was refactored and conversion to lowerCamelCase was added by George Moyano, Oct 2014.
         Conversion to lowerCamelCase calls a remote service and returns a node containing the converted value.
         For more information on the XPath 2.0 function doc() see http://www.w3.org/TR/xpath-functions/#func-doc .
    -->
    <xsl:function name="str:title-case" as="xs:string">
        <xsl:param name="paramNode"/>
        <!-- gINSERT begin -->
        <xsl:param name="paramCamelCase"/>
        <xsl:param name="paramDelimiter"/>
        <!-- gINSERT end -->

        <!-- gINSERT
        // PURPOSE
        // Split expression at delimiter, change case to a CamelCase, and concatenate.
        
        // RESULT
        // For example, 
        //      Delimiter: '_'
        //      CamelCase: unspecified  
        
        //          "TASK_STATUS"    ->    "TaskStatus"
        //          "GEOREMARK"      ->    "Georemark"

        //      CamelCase: 'lowerCamelCase'  
        
        //          "TASK_STATUS"    ->    "taskStatus"
        //          "GEOREMARK"      ->    "georemark"
        
        // CAVEAT
        // Manual intervention is required for compound words that are not delimited.
        // Edit each reference in the output document.
        
        -->

        <!-- gINSERT begin -->
        <xsl:choose>
            <xsl:when test="$paramCamelCase='lowerCamelCase'">
                <xsl:value-of
                    select="fn:doc(fn:concat($REMOTE_SERVICE_LOWER_CAMEL_CASE, '?string='
                        , $paramNode, '&amp;delimiter=', $paramDelimiter))"
                />
            </xsl:when>
            <xsl:otherwise>
                <!-- gINSERT end -->
                <!-- gMODIFY -->
                <!--        <xsl:variable name="tokens" select="tokenize($paramNode,' ')"/>-->
                <xsl:variable name="tokens" select="tokenize($paramNode,$paramDelimiter)"/>
                <xsl:variable name="titledTokens"
                    select="for $token in $tokens return
                    concat(upper-case(substring($token,1,1)),
                    lower-case(substring($token,2)))"/>
                <xsl:value-of select="string-join($titledTokens,'')"/>
                <!-- gINSERT begin -->
            </xsl:otherwise>
        </xsl:choose>
        <!-- gINSERT end -->
    </xsl:function>

    <xsl:template match="node() | @*">
        <xsl:copy>
            <xsl:apply-templates select="node() | @*"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match="@name">
        <xsl:attribute name="name">
            <xsl:choose>
                <xsl:when test="name(..)=fn:concat($INPUT_DOCUMENT_XML_SCHEMA_PREFIX_XS, ':element') 
                        or fn:concat($INPUT_DOCUMENT_XML_SCHEMA_PREFIX_XSD, ':element')">
                    <xsl:value-of
                        select="str:title-case(., 'CamelCase', $CHARACTER_OR_REGULAR_EXPRESSION_WORD_DELIMITER)"
                    />
                </xsl:when>
                <xsl:when test="name(..)=fn:concat($INPUT_DOCUMENT_XML_SCHEMA_PREFIX_XS, ':attribute')
                        or fn:concat($INPUT_DOCUMENT_XML_SCHEMA_PREFIX_XSD, ':element')">
                    <xsl:value-of
                        select="str:title-case(., 'lowerCamelCase', $CHARACTER_OR_REGULAR_EXPRESSION_WORD_DELIMITER)"
                    />
                </xsl:when>
                <xsl:otherwise>
<!--                    <xsl:value-of
                        select="str:title-case(., '', $CHARACTER_OR_REGULAR_EXPRESSION_WORD_DELIMITER)"
                    />-->
                    <xsl:value-of
                        select="."
                    />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>


    <xsl:template match="@ref">
        <xsl:attribute name="ref">
            <xsl:variable name="prefix" select="tokenize(., ':')"/>
            <xsl:choose>
                <xsl:when test="$prefix[1]=$INPUT_DOCUMENT_PREFIX">
                    <xsl:value-of
                        select="concat($prefix[1], ':', str:title-case($prefix[2], 'CamelCase', $CHARACTER_OR_REGULAR_EXPRESSION_WORD_DELIMITER))"
                    />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="."/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:attribute>
    </xsl:template>

</xsl:stylesheet>
