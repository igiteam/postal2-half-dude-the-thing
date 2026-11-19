class FontImportOptions extends Object
    transient
    hidecategories(Object);

enum EFontImportCharacterSet
{
    FontICS_Default,                // 0
    FontICS_Ansi,                   // 1
    FontICS_Symbol,                 // 2
    FontICS_MAX                     // 3
};

struct native FontImportOptionsData
{
    var(*) /*0x23F70000-0x00000000*/ private editfixedsize string FontName[65537];
    var(*) /*0x23F70000-0x00000000*/ private float Height[65537];
    var(*) /*0x23F70000-0x00000000*/ private bool bEnableAntialiasing[65537];
    var(*) /*0x23F70000-0x00000000*/ private bool bEnableBold[65537];
    var(*) /*0x23F70000-0x00000000*/ private bool bEnableItalic[65537];
    var(*) /*0x23F70000-0x00000000*/ private bool bEnableUnderline[65537];
    var(*) /*0x23F70000-0x00000000*/ private bool bAlphaOnly[65537];
    var(*) /*0x23F70000-0x00000000*/ private byte CharacterSet[65537];
    var(*) /*0x23F70000-0x00000000*/ private editfixedsize string Chars[65537];
    var(*) /*0x23F70000-0x00000000*/ private editfixedsize string UnicodeRange[65537];
    var(*) /*0x23F70000-0x00000000*/ private editfixedsize string CharsFilePath[65537];
    var(*) /*0x23F70000-0x00000000*/ private editfixedsize string CharsFileWildcard[65537];
    var(*) /*0x23F70000-0x00000000*/ private bool bCreatePrintableOnly[65537];
    var(*) /*0x23F70000-0x00000000*/ private bool bIncludeASCIIRange[65537];
    var(*) /*0x23F70000-0x00000000*/ private @NULL ForegroundColor[65537];
    var(*) /*0x23F70000-0x00000000*/ private bool bEnableDropShadow[65537];
    var(*) /*0x23F70000-0x00000000*/ private int TexturePageWidth[65537];
    var(*) /*0x23F70000-0x00000000*/ private int TexturePageMaxHeight[65537];
    var(*) /*0x23F70000-0x00000000*/ private int XPadding[65537];
    var(*) /*0x23F70000-0x00000000*/ private int YPadding[65537];
    var(*) /*0x23F70000-0x00000000*/ private int ExtendBoxTop[65537];
    var(*) /*0x23F70000-0x00000000*/ private int ExtendBoxBottom[65537];
    var(*) /*0x23F70000-0x00000000*/ private int ExtendBoxRight[65537];
    var(*) /*0x23F70000-0x00000000*/ private int ExtendBoxLeft[65537];
    var(*) /*0x23F70000-0x00000000*/ private bool bEnableLegacyMode[65537];
    var(*) /*0x23F70000-0x00000000*/ private bool bKeepGlyphSpacing[65537];
    var(*) /*0x23F70000-0x00000000*/ private int Kerning[65537];
    var(*) /*0x23F70000-0x00000000*/ private bool bUseDistanceFieldAlpha[65537];
    var(*) /*0x23F70000-0x00000000*/ private int DistanceFieldScaleFactor[65537];
    var(*) /*0x23F70000-0x00000000*/ private float DistanceFieldScanRadiusScale[65537];
    var(*) /*0x23F70000-0x00000000*/ private int MinimumTextures[65537];

    structdefaultproperties
    {
        FontName="Arial"
        Height=16.0000000
        bEnableAntialiasing=true
        bEnableBold=false
        bEnableItalic=false
        bEnableUnderline=false
        bAlphaOnly=false
        CharacterSet=EFontImportCharacterSet.FontICS_Default
        Chars=""
        UnicodeRange=""
        CharsFilePath=""
        CharsFileWildcard=""
        bCreatePrintableOnly=false
        bIncludeASCIIRange=true
        ForegroundColor=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000)
        bEnableDropShadow=false
        TexturePageWidth=256
        TexturePageMaxHeight=256
        XPadding=1
        YPadding=1
        ExtendBoxTop=0
        ExtendBoxBottom=0
        ExtendBoxRight=0
        ExtendBoxLeft=0
        bEnableLegacyMode=false
        bKeepGlyphSpacing=false
        Kerning=0
        bUseDistanceFieldAlpha=false
        DistanceFieldScaleFactor=16
        DistanceFieldScanRadiusScale=1.0000000
        MinimumTextures=0
    }
};

var(*) /*0x23F60000-0x00000000*/ private editfixedsize @NULL Data[65537];

defaultproperties
{
    Data=(FontName="Arial",Height=16.0000000,bEnableAntialiasing=true,bEnableBold=false,bEnableItalic=false,bEnableUnderline=false,bAlphaOnly=false,CharacterSet=EFontImportCharacterSet.FontICS_Default,Chars="",UnicodeRange="",CharsFilePath="",CharsFileWildcard="",bCreatePrintableOnly=false,bIncludeASCIIRange=true,ForegroundColor=(R=1.0000000,G=1.0000000,B=1.0000000,A=1.0000000),bEnableDropShadow=false,TexturePageWidth=256,TexturePageMaxHeight=256,XPadding=1,YPadding=1,ExtendBoxTop=0,ExtendBoxBottom=0,ExtendBoxRight=0,ExtendBoxLeft=0,bEnableLegacyMode=false,bKeepGlyphSpacing=false,Kerning=0,bUseDistanceFieldAlpha=false,DistanceFieldScaleFactor=16,DistanceFieldScanRadiusScale=1.0000000,MinimumTextures=0)
}