class DOFEffect extends PostProcessEffect
    abstract
    hidecategories(Object);

enum EFocusType
{
    FOCUS_Distance,                 // 0
    FOCUS_Position,                 // 1
    FOCUS_MAX                       // 2
};

var(*) /*0x1C600000-0x00000000*/ private float FalloffExponent[65537];
var(*) /*0x1C600000-0x00000000*/ private float BlurKernelSize[65537];
var(*) /*0x1C610000-0x00000000*/ private float MaxNearBlurAmount[65537];
var(*) /*0x1C610000-0x00000000*/ private float MinBlurAmount[65537];
var(*) /*0x1C610000-0x00000000*/ private float MaxFarBlurAmount[65537];
var(*) /*0x1C600000-0x00000000*/ private byte FocusType[65537];
var(*) /*0x1C600000-0x00000000*/ private float FocusInnerRadius[65537];
var(*) /*0x1C600000-0x00000000*/ private float FocusDistance[65537];
var(*) /*0x1C600000-0x00000000*/ private @NULL FocusPosition[65537];

defaultproperties
{
    FalloffExponent=2.0000000
    BlurKernelSize=2.0000000
    MaxNearBlurAmount=1.0000000
    MaxFarBlurAmount=1.0000000
    FocusInnerRadius=400.0000000
    FocusDistance=800.0000000
}