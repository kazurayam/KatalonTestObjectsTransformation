<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:import href="identity-transform.xsl" />

  <xsl:template match="WebElementEntity">
      <xsl:copy>
          <xsl:choose>
              <xsl:when test="selectorMethod/text() = 'BASIC'">
                  <xsl:apply-templates select="@*|node()"/>
              </xsl:when>
              <xsl:otherwise>
                  <xsl:copy-of select="."/>
              </xsl:otherwise>
          </xsl:choose>
      </xsl:copy>
  </xsl:template>

  <xsl:template match="webElementProperties">
      <xsl:choose>
          <xsl:when test="isSelected/text() = 'true'">
              <xsl:copy-of select="."/>
          </xsl:when>
          <xsl:otherwise>
              <!-- discard webElementProperites[isSelected='false'] -->
          </xsl:otherwise>
      </xsl:choose>
  </xsl:template>



</xsl:stylesheet>
