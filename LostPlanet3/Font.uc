class Font extends Object
    hidecategories(Object);

const NULLCHARACTER = 127;

struct native atomic immutable FontCharacter
{
    var(*) /*0x23EE0000-0x00000000*/ private int StartU[65537];
    var(*) /*0x23EE0000-0x00000000*/ private int StartV[65537];
    var(*) /*0x23EE0000-0x00000000*/ private int USize[65537];
    var(*) /*0x23EE0000-0x00000000*/ private int VSize[65537];
    var(*) /*0x23EE0000-0x00000000*/ private byte TextureIndex[65537];
    var(*) /*0x23EE0000-0x00000000*/ private int VerticalOffset[65537];

    structdefaultproperties
    {
        StartU=0
        StartV=0
        USize=0
        VSize=0
        TextureIndex=0
        VerticalOffset=0
    }
};

struct native atomic immutable FontGlyphExtension
{
    var(*) /*0x35EA0000-0x00000000*/ private int bFontExtended;
    var(*) /*0x35EA0000-0x00000000*/ private int StartGlyphIndex;
    var(*) /*0x35EA0000-0x00000000*/ private int GlyphCount;
    var(*) /*0x35EA0000-0x00000000*/ private int StartRemapIndex;
    var(*) /*0x35EA0000-0x00000000*/ private int TexturePageIndex;

    structdefaultproperties
    {
        bFontExtended=0
        StartGlyphIndex=0
        GlyphCount=0
        StartRemapIndex=0
        TexturePageIndex=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL ExtensionInfo;
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} ExtensionNameMap[268566529];
var(*) /*0x23ED0000-0x00000400*/ private editfixedsize array Characters[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Textures;
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} CharRemap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int IsRemapped;
var(*) /*0x23ED0000-0x00000000*/ private float EmScale[65537];
var(*) /*0x23ED0000-0x00000000*/ private float Ascent[65537];
var(*) /*0x23ED0000-0x00000000*/ private float Descent[65537];
var(*) /*0x23ED0000-0x00000000*/ private float Leading[65537];
var(*) /*0x23ED0000-0x00000000*/ private int Kerning[65537];
var(*) /*0x23ED0000-0x00000000*/ private const bool bMonospaced[65537];
var(*) /*0x23ED0000-0x00000000*/ private editfixedsize @NULL ImportOptions[65537];
var(*) /*0x35EA0000-0x00000000*/ private int NumCharacters[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MaxCharHeight[536870913];
var(*) /*0x23ED0000-0x00000000*/ private float ScalingFactor[196609];

// Export UFont::execGetResolutionPageIndex(FFrame&, void* const)
native function GetResolutionPageIndex()
{
    local /*0x35EA0000-0x00000000*/ private float HeightTest[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UFont::execGetScalingFactor(FFrame&, void* const)
native function GetScalingFactor()
{
    local /*0x35EA0000-0x00000000*/ private float HeightTest[8388609], ReturnValue;


}

// Export UFont::execGetAuthoredViewportHeight(FFrame&, void* const)
native final function GetAuthoredViewportHeight()
{
    local /*0x35EA0000-0x00000000*/ private float ViewportHeight[8388609], ReturnValue;


}

// Export UFont::execGetMaxCharHeight(FFrame&, void* const)
native function GetMaxCharHeight()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UFont::execGetStringHeightAndWidth(FFrame&, void* const)
native function GetStringHeightAndWidth()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string InString[25296897];
    local /*0x35EA0000-0x00000000*/ private int Height[25165825], Width;


}

// Export UFont::execInvalidateUICalloutCache(FFrame&, void* const)
native static function InvalidateUICalloutCache();

defaultproperties
{
    ExtensionInfo=none
    ImportOptions=(FontName="Arial",Height=16.0000000,bEnableAntialiasing=true,bEnableBold=false,bEnableItalic=false,bEnableUnderline=false,bAlphaOnly=false,CharacterSet=EFontImportCharacterSet.FontICS_Default,Chars="",UnicodeRange="",CharsFilePath="",CharsFileWildcard="",bCreatePrintableOnly=false,bIncludeASCIIRange=true,ForegroundColor=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000),bEnableDropShadow=false,TexturePageWidth=256,TexturePageMaxHeight=256,XPadding=1,YPadding=1,ExtendBoxTop=0,ExtendBoxBottom=0,ExtendBoxRight=0,ExtendBoxLeft=0,bEnableLegacyMode=false,bKeepGlyphSpacing=false,Kerning=0,bUseDistanceFieldAlpha=false,DistanceFieldScaleFactor=16,DistanceFieldScanRadiusScale=1.0000000,MinimumTextures=0)
    ScalingFactor=1.0000000
}