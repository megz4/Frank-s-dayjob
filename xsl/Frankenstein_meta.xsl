<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:tei="http://www.tei-c.org/ns/1.0"
    exclude-result-prefixes="xs tei"
    version="2.0">
    
    <!-- <xsl:output method="xml" omit-xml-declaration="yes" indent="yes" /> -->

    
    <xsl:template match="tei:TEI">
                     <div class="row">
                         <div class="col">
                             <h4>About the manuscript page:</h4>
                             <xsl:value-of select="//tei:sourceDesc"/>
                             <xsl:value-of select="//tei:licence"/> <!-- You can change the way the metadata is visualised as well-->
                         
                         </div>
                         <div class="col">
                            <ul> 
                                
                                <li>Total number of modifications: 
                                    <xsl:value-of select="count(//tei:del|//tei:add)" /> <!-- Counts all the add and del elements, and puts it in a list item -->
                                </li>
                
                                <ul>

                                <li>Number of additions: 
                                    <!-- count the additions only -->
                                    <xsl:value-of select="count(//tei:add)" />
                                </li>
                                <li>Number of deletions: 
                                    <!-- count the deletions only -->
                                    <xsl:value-of select="count(//tei:del)" />
                                </li>

                                </ul>

                                <li>Number of changes made by Mary W. Shelley:
                                <!-- add other list items in which you count things, such as the modifications made by Mary -->
                                    <xsl:value-of select="count(//tei:del[@hand='#MWS']|//tei:add[@hand='#MWS'])" />
                                </li>

                                <li>Number of changes made by Percy B. Shelley:
                                <!-- add other list items in which you count things, such as the modifications made by Percy -->
                                    <xsl:value-of select="count(//tei:del[@hand='#PBS']|//tei:add[@hand='#PBS'])" />
                                </li>

                                 <li>Total number of words: 
                                    <xsl:call-template name="countWords">
                                    <xsl:with-param name="nodes" select="//tei:div" />
                                    </xsl:call-template>
                                </li>

                            </ul>
                        </div>
                     </div>
        <hr/>
    </xsl:template>
    

        <!-- Template to count words -->
    <xsl:template name="countWords"> <!-- Created a new template (like function)' -->
        <xsl:param name="nodes" />   <!-- The nodes to count, specified when recalling the template -->
        <xsl:variable name="text">   <!-- defines variable 'text' -->
        <xsl:for-each select="$nodes">  <!-- iterates over each node -->
            <xsl:value-of select="normalize-space(.)" />  <!-- Extracts text content and removes extra spaces -->
            <xsl:text> </xsl:text> <!-- Storing all in 'text' -->
        </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="string-length(normalize-space($text)) - string-length(translate(normalize-space($text), ' ', '')) + 1" />
    </xsl:template>

                <!-- Insanely smart and creative (!!!) -->
                <!--
                 Subtract the length without spaces from the total length:
                    This gives the number of spaces that separate words =  the number of words minus one.
                    Add 1 to account for the last word:
                    Total words = number of spaces + 1. 
                    -->

</xsl:stylesheet>
