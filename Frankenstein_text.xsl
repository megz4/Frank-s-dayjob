<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" /> -->
   <xsl:template match="tei:teiHeader"/>
   
    <xsl:template match="tei:body">
        <div class="row">
        <div class="col-3"><br/><br/><br/><br/><br/>
        <span class="leftMargin">
            <xsl:for-each select="//tei:add[@place = 'marginleft']">
                <xsl:choose>
                    <xsl:when test="parent::tei:del">
                        <del>
                            <xsl:attribute name="class">
                                <xsl:value-of select="attribute::hand" />
                            </xsl:attribute>
                            <xsl:value-of select="."/>
                            </del><br/>
                    </xsl:when>
                    <xsl:otherwise>
                        <span >
                            <xsl:attribute name="class">
                                <xsl:value-of select="attribute::hand" />
                            </xsl:attribute>
                        <xsl:apply-templates/><br/>
                        </span>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each> 
            </span>
        </div>
        <div class="col-9">
            <div class="transcription">
                <xsl:apply-templates select="//tei:div"/>
            </div>
        </div>
        </div> 
    </xsl:template>
    
    <xsl:template match="tei:div">
        <div class="#MWS"><xsl:apply-templates/></div>
    </xsl:template>
    
    <xsl:template match="tei:p">
        <p><xsl:apply-templates/></p>
    </xsl:template>

  
    <xsl:template match="tei:add[@place = 'marginleft']">
        <span class="marginAdd">
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="tei:del">
        <del>
            <xsl:attribute name="class">
                <xsl:value-of select="@hand"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </del>
    </xsl:template>

    <!-- all the supralinear additions are given in a span with the class supraAdd, make sure to put this class in superscript in the CSS file, -->
    <xsl:template match="tei:add[@place = 'supralinear']">
        <span class="supraAdd">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="tei:add[@place = 'infralinear']">
        <span class="infraAdd">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    
    <xsl:template match="tei:add">
        <span class="defaultAdd">
            <xsl:apply-templates/>
        </span>
    </xsl:template>


    <!-- add additional templates below, for example to transform the tei:lb in <br/> empty elements, tei:hi[@rend = 'sup'] in <sup> elements, the underlined text, additions with the attribute "overwritten" etc. -->

    <xsl:template match="tei:lb">
        <br/>
    </xsl:template>

     <xsl:template match="tei:hi">
        <hi>
            <xsl:attribute name="class">
                <xsl:value-of select="@rend"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </hi>
    </xsl:template>
    

    <xsl:template match="tei:pageNumber">
        <div class="page-number">
        <xsl:attribute name="class">
            <xsl:value-of select="attribute::place" />
            </xsl:attribute>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xsl:template match="tei:pageNum">
        <span>
            <xsl:apply-templates/>
        </span>
    </xsl:template>

<!--     
    <xsl:template match="hi[@rend='underline']">
        <span class="underline">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

      <xsl:template match="hi[@rend='double']">
        <span class="doubleLine">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xsl:template match="hi[@rend='indented']">
        <span class="indented">
            <xsl:apply-templates/>
        </span>
    </xsl:template>

 <xsl:template match="hi[@rend='circled']">
        <span class="circled">
            <xsl:apply-templates/>
        </span>
    </xsl:template> 
    -->


<!-- &#8212; - unicode for wide hyphen -->
<!-- dentistry symbol light vertical and bottom right (U+23BF) // left square bracket lower corner (U+23A3) -->



 </xsl:stylesheet>
