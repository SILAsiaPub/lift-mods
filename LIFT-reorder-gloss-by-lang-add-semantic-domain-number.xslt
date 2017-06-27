<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:   		LIFT-reorder-gloss-by-lang-add-semantic-domain.xslt
    # Purpose:		Reorder gloss entries based on order of langs param.
    # Part of:		Vimod Pub - https://github.com/SILAsiaPub/vimod-pub
    # Author:		Ian McQuay <ian_mcquay@sil.org>
    # Created:		2017-04-08
    # Copyright:   	(c) 2017 SIL International
    # Licence:		<MIT>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
<xsl:strip-space elements="*"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:include href="project.xslt"/>
      <xsl:include href="inc-file2uri.xslt"/>
      <!-- <xsl:param name="semantic" select="'on'"/> -->
      <!-- <xsl:param name="classification" select="'classification'"/> -->
      <!-- <xsl:param name="langorder" select="'id en'"/> -->
      <!-- <xsl:param name="beforesemnumb" select="'s'"/> -->
      <!-- <xsl:variable name="langorder" select="tokenize($langorder,' ')"/> -->
      <xsl:template match="sense">
            <xsl:variable name="cursense" select="."/>
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
                  <xsl:for-each select="$langOrder">
                        <xsl:variable name="langcode" select="."/>
                        <xsl:apply-templates select="$cursense/gloss[@lang=$langcode]"/>
                  </xsl:for-each>
                  <xsl:apply-templates select="*[name() ne 'gloss']"/>
            </xsl:copy>
      </xsl:template>
      <xsl:template match="trait[@name = 'semantic-domain-ddp4']">
            <xsl:if test="$showSemanticEntry = 'on'">
                  <xsl:variable name="value" select="replace(@value,'^[\d\.]+ ','')"/>
                  <xsl:variable name="sdnumb" select="substring-before(@value,' ')"/>
                  <note type="{$classification}">
                        <form lang="sdm">
                              <xsl:element name="text">
                                    <xsl:if test="$showSemanticNumberInEntry">
                                          <xsl:value-of select="normalize-space(@sdnumb)"/>
                                          <xsl:text> </xsl:text>
                                    </xsl:if>
                                    <xsl:value-of select="@value"/>
                              </xsl:element>
                        </form>
                  </note>
                  <reversal type="sdm">
                        <form lang="sdm">
                              <xsl:element name="text">
                                    <xsl:value-of select="lower-case($value)"/>
                                    <!-- <xsl:value-of select="@value"/> -->
                              </xsl:element>
                        </form>
                  </reversal>
                  <xsl:if test="$showSemanticNumberTab = $true">
                        <reversal type="sdn">
                              <form lang="sdn">
                                    <xsl:element name="text">
                                          <xsl:value-of select="concat($beforeSemanticNumb,' ',$sdnumb)"/>
                                          <!-- <xsl:value-of select="@value"/> -->
                                    </xsl:element>
                              </form>
                        </reversal>
                  </xsl:if>
            </xsl:if>
            <xsl:copy>
                  <xsl:apply-templates select="@*"/>
            </xsl:copy>
      </xsl:template>
</xsl:stylesheet>
