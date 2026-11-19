class SPCameraModeAimControlWeaponShoulderParam extends SPCameraModeAimControlShoulderParam
    abstract
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object,PlayerSprint,Aiming,Filters,LookLimit,Targeting,Mantle,Filter);

struct native AimAssistOverrideStruct
{
    var(__Filter1__Delegate) /*0x00270000-0x00000000*/ private float MaxFrictionDistance[65537];
    var(__Filter1__Delegate) /*0x00270000-0x00000000*/ private @NULL PeakFrictionDistanceRange[65537];
    var(__Filter1__Delegate) /*0x00270000-0x00000000*/ private float MinFrictionDistance[65537];
    var(__Filter1__Delegate) /*0x00250000-0x00000000*/ private float FrictionMultiplierMax[65537];

    structdefaultproperties
    {
        MaxFrictionDistance=0.0000000
        PeakFrictionDistanceRange=(X=0.0000000,Y=0.0000000)
        MinFrictionDistance=0.0000000
        FrictionMultiplierMax=0.0000000
    }
};

var(__Filter1__Delegate) /*0x063E0000-0x00000000*/ private bool bShouldOverrideTransitionDuration[65537];
var(__Filter1__Delegate) /*0x05670000-0x00000000*/ private bool bShouldOverrideAimAssist[65537];
var(__Filter1__Delegate) /*0x063E0000-0x00000000*/ private float TransitionDurationSeconds[65537];
var(__Filter1__Delegate) /*0x00270000-0x00000000*/ private @NULL AimAssistOverride[65537];
