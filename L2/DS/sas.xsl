<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template match="/">

  <html>
  <body>
  <h2>Catalog</h2>  

  <xsl:apply-templates/> 
  </body>
  </html>
</xsl:template>

<xsl:template match="//catalog/categorie">

  <p>
   <xsl:apply-templates select="denumireC"/> 
  <br /> 
    <xsl:apply-templates select="produs"/>  
  <br /> 
  </p>

</xsl:template>
<xsl:template match="categorie/produs">

   Denumire: <span style="color:red">
  <xsl:apply-templates select="denumireP"/></span>
<br/>
  Pret: <span style="color:red">
  <xsl:apply-templates select="pret"/></span>
    <br /> 
  Descriere: <span style="color:red">
  <xsl:apply-templates select="descriere"/></span>
    <br /> 
  Stoc: <span style="color:red">
  <xsl:apply-templates select="stoc"/></span>
    <br /> 
  <xsl:apply-templates select="caracteristici"/>
   <br /> 
   <br />

</xsl:template>

</xsl:stylesheet>
