<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:dc="http://purl.org/dc/elements/1.1/">
    
    <xsl:output media-type="text/xhtml" encoding="UTF-8" indent="yes" omit-xml-declaration="no" method="html"/>
    
    <xsl:param name="prefix">http://rdf-vocabulary.ddialliance.org/discovery#</xsl:param>
    
    <xsl:template match="/rdf:RDF">
        <html>
            <head>
                <style type="text/css">
                    table { border: black 1px solid; border-collapse:collapse; border-spacing: 0; }
                    table td { border: black 1px solid; padding: 3px; padding-left: 10px; padding-right: 10px; text-align: center; vertical-align: top;}
                    .classDefinitions dd{margin-left: 25px;}
                    .classProperties{margin-left:25px;margin-bottom: 15px;margin-top:15px;}
                    .classProperties dt{margin-top: 15px;}
                </style>
                <title>Classes</title>
                <script src='http://darobin.github.com/respec/builds/respec-w3c-common.js' class='remove'></script>
                <script class='remove'>
                    var respecConfig = {
                    // specification status (e.g. WD, LCWD, NOTE, etc.). If in doubt use ED.
                    specStatus:           "unofficial",
                    
                    // the specification's short name, as in http://www.w3.org/TR/short-name/
                    shortName:            "discovery",
                    
                    // if your specification has a subtitle that goes below the main
                    // formal title, define it here
                    subtitle   :  "listing of classes and properties",
                    
                    // if you wish the publication date to be other than today, set this
                    // publishDate:  "2009-08-06",
                    
                    // if the specification's copyright date is a range of years, specify
                    // the start date here:
                    copyrightStart: "2013",
                    
                    // if there is a previously published draft, uncomment this and set its YYYY-MM-DD date
                    // and its maturity status
                    // previousPublishDate:  "1977-03-15",
                    // previousMaturity:  "WD",
                    
                    // if there a publicly available Editor's Draft, this is the link
                    
                    
                    // if this is a LCWD, uncomment and set the end of its review period
                    // lcEnd: "2009-08-05",
                    
                    // editors, add as many as you like
                    // only "name" is required
                    editors:  [

                    ],
                    
                    // authors, add as many as you like. 
                    // This is optional, uncomment if you have authors as well as editors.
                    // only "name" is required. Same format as editors.
                    
                    authors:  [
                    ],
                    
                    // name of the WG
                    wg:           "DDI Alliance RDF Vocabularies Working Group",
                    
                    // URI of the public WG page
                    wgURI:        "http://www.ddialliance.org/alliance/working-groups#RDF",
                    
                    // name (without the @w3c.org) of the public mailing to which comments are due
                    wgPublicList: "ddi-rdf-vocabulary@googlegroups.com",
                    
                    // URI of the patent status for this WG, for Rec-track documents
                    // !!!! IMPORTANT !!!!
                    // This is important for Rec-track documents, do not copy a patent URI from a random
                    // document unless you know what you're doing. If in doubt ask your friendly neighbourhood
                    // Team Contact.
                    //          wgPatentURI:  "",
                    };
                </script>                
            </head>
            <body>
                <!-- 
                1. Studies and StudyGroups
                Study, StudyGroup, AnalysisUnit, Universe
                
                2. Data Sets, Data Files, and Descriptive Statistics
                LogicalDataSet, DataFile, DescriptiveStatistics, SummaryStatistics, CategoryStatistics
                
                3. Variables, Variable Definitions, Representations, and Concepts
                Variable, VariableDefinition, Representation
                
                4. Data Collection
                Question, Instrument, Questionnaire
                -->
                <h2>1. Studies and StudyGroups</h2>
                <dl class="classDefinitions">
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'Study')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'StudyGroup')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'AnalysisUnit')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'Universe')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'DataDiscoveryDocument')]"/>
                </dl>
                
                <h2>2. Data Sets, Data Files, and Descriptive Statistics</h2>
                <dl class="classDefinitions">
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'LogicalDataSet')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'DataFile')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'DescriptiveStatistics')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'SummaryStatistics')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'CategoryStatistics')]"/>
                </dl>
                
                <h2>3. Variables, Variable Definitions, Representations, and Concepts</h2>
                <dl class="classDefinitions">
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'Variable')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'VariableDefinition')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'Representation')]"/>
                </dl>

                <h2>4. Data Collection</h2>
                <dl class="classDefinitions">
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'Question')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'Instrument')]"/>
                    <xsl:apply-templates select="owl:Class[@rdf:about=concat($prefix,'Questionnaire')]"/>
                </dl>
                <!--
                <h2>All Properties</h2>
                <dl class="classDefinitions">
                    <xsl:apply-templates select="owl:ObjectProperty"/>
                </dl>      
                -->
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="owl:Class">
        <xsl:variable name="class">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="@rdf:about" />
                <xsl:with-param name="replace"><xsl:value-of select="$prefix"/></xsl:with-param>
                <xsl:with-param name="by"></xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <dt>
            <a><xsl:attribute name="name">dfn-disco-<xsl:value-of select="$class"/></xsl:attribute></a>
            <em>Class: </em>
            <code><dfn>disco:<xsl:value-of select="$class"/></dfn></code>
            
            <xsl:if test="rdfs:subClassOf">
                Sub Class of: <xsl:apply-templates select="rdfs:subClassOf"/>
            </xsl:if>
        </dt>
        <dd><xsl:value-of select="rdfs:comment"/></dd>
        <div class="classProperties">
            <xsl:apply-templates select="../..//owl:ObjectProperty[rdfs:domain/@rdf:resource=concat($prefix,$class) or rdfs:domain/owl:unionOf/owl:Class/@rdf:about=concat($prefix,$class)]"/>
            <xsl:apply-templates select="../..//owl:DatatypeProperty[rdfs:domain/@rdf:resource=concat($prefix,$class) or rdfs:domain/owl:unionOf/owl:Class/@rdf:about=concat($prefix,$class)]"/>
        </div>
    </xsl:template>
    
    <xsl:template match="rdfs:subClassOf">
        <xsl:variable name="subclassName">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text">
                    <xsl:choose>
                        <xsl:when test="@rdf:resource"><xsl:value-of select="@rdf:resource"/></xsl:when>
                        <xsl:when test="owl:Class/@rdf:about"><xsl:value-of select="owl:Class/@rdf:about"/></xsl:when>
                    </xsl:choose>
                </xsl:with-param>
                <xsl:with-param name="replace"><xsl:value-of select="$prefix"/></xsl:with-param>
                <xsl:with-param name="by">disco:</xsl:with-param>
            </xsl:call-template>
        </xsl:variable> 
        <code><xsl:value-of select="$subclassName"/></code>
    </xsl:template>
    
    <xsl:template match="owl:ObjectProperty|owl:DatatypeProperty">
        <xsl:variable name="propertyName">
            <xsl:call-template name="string-replace-all">
                <xsl:with-param name="text" select="@rdf:about" />
                <xsl:with-param name="replace"><xsl:value-of select="$prefix"/></xsl:with-param>
                <xsl:with-param name="by">disco:</xsl:with-param>
            </xsl:call-template>
        </xsl:variable>
        <dt>
            <xsl:choose>
                <xsl:when test="name(.) = 'owl:DatatypeProperty'"><em>Datatype Property: </em></xsl:when>
                <xsl:when test="name(.) = 'owl:ObjectProperty'"><em>Object Property: </em></xsl:when>
            </xsl:choose>
            
            
            <code><dfn><xsl:value-of select="$propertyName"/></dfn></code>
            <xsl:variable name="domainName">
                <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text" select="rdfs:domain/@rdf:resource" />
                    <xsl:with-param name="replace"><xsl:value-of select="$prefix"/></xsl:with-param>
                    <xsl:with-param name="by">disco:</xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
            (<em>Domain:</em> <code>
                <xsl:value-of select="$domainName"/></code>
                <xsl:for-each select="rdfs:domain//owl:Class">
                    <xsl:variable name="domainNameTemp">
                        <xsl:call-template name="string-replace-all">
                            <xsl:with-param name="text" select="@rdf:about" />
                            <xsl:with-param name="replace"><xsl:value-of select="$prefix"/></xsl:with-param>
                            <xsl:with-param name="by">disco:</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <code><xsl:value-of select="$domainNameTemp"/></code>
                    <xsl:if test="position() != last()">
                        <xsl:text>, </xsl:text>
                    </xsl:if>
                </xsl:for-each>
            <em> Range: </em> 
            <xsl:variable name="rangeName">
                <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text" select="rdfs:range/@rdf:resource" />
                    <xsl:with-param name="replace"><xsl:value-of select="$prefix"/></xsl:with-param>
                    <xsl:with-param name="by">disco:</xsl:with-param>
                </xsl:call-template>
            </xsl:variable>
            <code><xsl:value-of select="$rangeName"/></code>
            )
        </dt>
        <dd><xsl:value-of select="rdfs:comment"/></dd>
    </xsl:template>
    
    <xsl:template name="string-replace-all">
        <xsl:param name="text" />
        <xsl:param name="replace" />
        <xsl:param name="by" />
        <xsl:choose>
            <xsl:when test="contains($text, $replace)">
                <xsl:value-of select="substring-before($text,$replace)" />
                <xsl:value-of select="$by" />
                <xsl:call-template name="string-replace-all">
                    <xsl:with-param name="text"
                        select="substring-after($text,$replace)" />
                    <xsl:with-param name="replace" select="$replace" />
                    <xsl:with-param name="by" select="$by" />
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$text" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>