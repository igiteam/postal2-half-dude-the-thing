class LPTuneDataInput extends SPTuneDataInput
    hidecategories(Object,Object);

struct native ADSInputCurveOverrideStruct
{
    var(0.25_Pct) /*0x03520000-0x00000000*/ private @NULL RotationStickX[65537];
    var(0.25_Pct) /*0x03520000-0x00000000*/ private @NULL RotationStickY[65537];

    structdefaultproperties
    {
        RotationStickX=none
        RotationStickY=none
    }
};

struct native ADSInputCurvePlatformOverrideStruct
{
    var(0.25_Pct) /*0x03530000-0x00000000*/ private @NULL PS3_Override[65537];
    var(0.25_Pct) /*0x03530000-0x00000000*/ private @NULL Xbox360_Override[65537];

    structdefaultproperties
    {
        PS3_Override=(RotationStickX=none,RotationStickY=none)
        Xbox360_Override=(RotationStickX=none,RotationStickY=none)
    }
};

var(0.25_Pct) /*0x6BCC0000-0x00000000*/ private @NULL ADSInputCurveRotationStickX[65537];
var(0.25_Pct) /*0x6BCC0000-0x00000000*/ private @NULL ADSInputCurveRotationStickY[65537];
var(0.25_Pct) /*0x6BCC0000-0x00000000*/ private @NULL PlatformADSInputCurveOverride[65537];

// Export ULPTuneDataInput::execGetADSInputCurveRotationStickX(FFrame&, void* const)
native function GetADSInputCurveRotationStickX()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPTuneDataInput::execGetADSInputCurveRotationStickY(FFrame&, void* const)
native function GetADSInputCurveRotationStickY()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}
