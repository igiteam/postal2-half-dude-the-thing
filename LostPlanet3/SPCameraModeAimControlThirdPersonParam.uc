class SPCameraModeAimControlThirdPersonParam extends SPCameraModeAimControlParam
    abstract
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

struct native PlayerSprintCameraParamData
{
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private bool bEnableVelocityBasedSprintCamera[65537];
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private @NULL AdditiveLocalOffsetDuringPlayerSprints[65537];
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private float SprintLocalOffsetFilterRate[65537];
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private float AdditiveFOVDuringPlayerSprints[65537];
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private float SprintFOVFilterRate[65537];
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private float SprintBlendOutTime[65537];
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private float ChaseCameraTurnRate[65537];
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private float PitchMin[65537];
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private float PitchMax[65537];
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private float CenterPitchSpeed[65537];
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private float PitchLimitSmoothRate[65537];
    var(__Filter1__Delegate) /*0x049E0000-0x00000400*/ private float NarrowPitchAfterNoAimTime[65537];

    structdefaultproperties
    {
        bEnableVelocityBasedSprintCamera=true
        AdditiveLocalOffsetDuringPlayerSprints=(X=25.0000000,Y=-50.0000000,Z=15.0000000)
        SprintLocalOffsetFilterRate=0.8500000
        AdditiveFOVDuringPlayerSprints=30.0000000
        SprintFOVFilterRate=0.1500000
        SprintBlendOutTime=2.0000000
        ChaseCameraTurnRate=0.0300000
        PitchMin=70.0000000
        PitchMax=100.0000000
        CenterPitchSpeed=20.0000000
        PitchLimitSmoothRate=1.0000000
        NarrowPitchAfterNoAimTime=0.2500000
    }
};

struct native PlayerRollCameraParamData
{
    var(__Filter1__Delegate) /*0x04990000-0x00000400*/ private @NULL AdditiveLocalOffsetDuringRoll[65537];
    var(__Filter1__Delegate) /*0x04990000-0x00000400*/ private float RollLocalOffsetFilterRate[65537];
    var(__Filter1__Delegate) /*0x04990000-0x00000400*/ private float AdditiveFOVDuringRoll[65537];
    var(__Filter1__Delegate) /*0x04990000-0x00000400*/ private float RollFOVFilterRate[65537];
    var(__Filter1__Delegate) /*0x04990000-0x00000400*/ private float RollBlendOutTime[65537];

    structdefaultproperties
    {
        AdditiveLocalOffsetDuringRoll=(X=-55.0000000,Y=15.0000000,Z=-52.0000000)
        RollLocalOffsetFilterRate=1.2000000
        AdditiveFOVDuringRoll=0.0000000
        RollFOVFilterRate=0.1500000
        RollBlendOutTime=0.5000000
    }
};

var(__Filter1__Delegate) /*0x02890000-0x00000000*/ private bool bFilterZLocation[1073807361];
var(__Filter1__Delegate) /*0x049D0000-0x00000000*/ private bool bOverridePlayerSprintCameraTuneDataParams[1073807361];
var(__Filter1__Delegate) /*0x04980000-0x00000000*/ private bool bOverridePlayerRollCameraTuneDataParams[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000000*/ private float LocationZFilterRate[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000000*/ private float OrbitRadiusFilterRate[1073807361];
var(__Filter1__Delegate) /*0x02890000-0x00000000*/ private float FOVFilterRate[1073807361];
var(__Filter1__Delegate) /*0x049D0000-0x00000000*/ private @NULL PlayerSprintCameraParams[1073807361];
var(__Filter1__Delegate) /*0x04980000-0x00000000*/ private @NULL PlayerRollCameraParams[1073807361];
var(__Filter1__Delegate) /*0x05650000-0x00000400*/ private float HeadBobbing[1073807361];
var(__Filter1__Delegate) /*0x00540000-0x00000000*/ private float AttractorMinDistance[1073807361];
var(__Filter1__Delegate) /*0x00540000-0x00000000*/ private float AttractorMaxDistance[1073807361];
var(__Filter1__Delegate) /*0x00540000-0x00000000*/ private float AttractorMinFOVDegrees[1073807361];

defaultproperties
{
    LocationZFilterRate=1.0000000
    OrbitRadiusFilterRate=0.3000000
    FOVFilterRate=5.0000000
    PlayerSprintCameraParams=(bEnableVelocityBasedSprintCamera=true,AdditiveLocalOffsetDuringPlayerSprints=(X=-150.0000000,Y=50.0000000,Z=0.0000000),SprintLocalOffsetFilterRate=0.3000000,AdditiveFOVDuringPlayerSprints=0.0000000,SprintFOVFilterRate=0.1000000,SprintBlendOutTime=2.0000000,ChaseCameraTurnRate=0.0300000,PitchMin=70.0000000,PitchMax=100.0000000,CenterPitchSpeed=20.0000000,PitchLimitSmoothRate=1.0000000,NarrowPitchAfterNoAimTime=0.2500000)
    PlayerRollCameraParams=(AdditiveLocalOffsetDuringRoll=(X=-45.0000000,Y=80.0000000,Z=-55.0000000),RollLocalOffsetFilterRate=1.2000000,AdditiveFOVDuringRoll=0.0000000,RollFOVFilterRate=0.1500000,RollBlendOutTime=0.5000000)
    CameraModeClass=Class'SPCameraModeAimControlThirdPerson'
}