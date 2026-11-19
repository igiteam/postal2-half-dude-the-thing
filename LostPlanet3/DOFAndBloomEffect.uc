class DOFAndBloomEffect extends DOFEffect
    hidecategories(Object);

enum EDOFType
{
    DOFType_SimpleDOF,              // 0
    DOFType_ReferenceDOF,           // 1
    DOFType_BokehDOF,               // 2
    DOFType_MAX                     // 3
};

enum EDOFQuality
{
    DOFQuality_Low,                 // 0
    DOFQuality_Medium,              // 1
    DOFQuality_High,                // 2
    DOFQuality_MAX                  // 3
};

var(*) /*0x0A390000-0x00000000*/ private float BloomScale[65537];
var(*) /*0x0A390000-0x00000000*/ private float BloomThreshold[65537];
var(*) /*0x0A390000-0x00000000*/ private @NULL BloomTint[65537];
var(*) /*0x0A390000-0x00000000*/ private float BloomScreenBlendThreshold[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient float SceneMultiplier;
var(*) /*0x0A390000-0x00000000*/ private float BlurBloomKernelSize[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bEnableReferenceDOF;
var(*) /*0x1C600000-0x00000000*/ private byte DepthOfFieldType[65537];
var(*) /*0x1C600000-0x00000000*/ private byte DepthOfFieldQuality[65537];
var(*) /*0x1C600000-0x00000000*/ private @NULL BokehTexture[65537];

defaultproperties
{
    BloomScale=1.0000000
    BloomThreshold=1.0000000
    BloomTint=(R=255,G=255,B=255,A=0)
    BloomScreenBlendThreshold=10.0000000
    BlurBloomKernelSize=16.0000000
    BlurKernelSize=16.0000000
}