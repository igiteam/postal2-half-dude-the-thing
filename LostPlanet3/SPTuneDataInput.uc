class SPTuneDataInput extends SPTuneDataBaseInput
    abstract
    hidecategories(Object,Object);

struct native InputTurnRateStruct
{
    var(__HandleButtonInput__Delegate) /*0x01990000-0x00000000*/ private float SlowTurnRate[65537];
    var(__HandleButtonInput__Delegate) /*0x01990000-0x00000000*/ private float FastTurnRate[65537];
    var(__HandleButtonInput__Delegate) /*0x01990000-0x00000000*/ private float FastTurnRateStickThreshold[65537];

    structdefaultproperties
    {
        SlowTurnRate=120000.0000000
        FastTurnRate=150000.0000000
        FastTurnRateStickThreshold=0.9000000
    }
};

struct native InputCurveOverrideStruct
{
    var(__HandleButtonInput__Delegate) /*0x01870000-0x00000000*/ private @NULL RotationStickX[65537];
    var(__HandleButtonInput__Delegate) /*0x01870000-0x00000000*/ private @NULL RotationStickY[65537];
    var(__HandleButtonInput__Delegate) /*0x01870000-0x00000000*/ private @NULL MovementStickX[65537];
    var(__HandleButtonInput__Delegate) /*0x01870000-0x00000000*/ private @NULL MovementStickY[65537];

    structdefaultproperties
    {
        RotationStickX=none
        RotationStickY=none
        MovementStickX=none
        MovementStickY=none
    }
};

struct native InputCurvePlatformOverrideStruct
{
    var(__HandleButtonInput__Delegate) /*0x01880000-0x00000000*/ private @NULL PS3_Override[65537];
    var(__HandleButtonInput__Delegate) /*0x01880000-0x00000000*/ private @NULL Xbox360_Override[65537];

    structdefaultproperties
    {
        PS3_Override=(RotationStickX=none,RotationStickY=none,MovementStickX=none,MovementStickY=none)
        Xbox360_Override=(RotationStickX=none,RotationStickY=none,MovementStickX=none,MovementStickY=none)
    }
};

struct native DeadZoneOverrideStruct
{
    var(__HandleButtonInput__Delegate) /*0x00A90000-0x00000000*/ private bool bOverride[65537];
    var(__HandleButtonInput__Delegate) /*0x00A90000-0x00000000*/ private @NULL DeadZoneParams[65537];

    structdefaultproperties
    {
        bOverride=false
        DeadZoneParams=(bCircularDeadZoneEnabled=true,CircularDeadZoneInnerPct=0.2000000,CircularDeadZoneOuterPct=1.0000000,bSquareDeadZoneEnabled=true,SquareDeadZoneInnerPct=0.0700000,SquareDeadZoneOuterPct=0.9600000)
    }
};

struct native DeadZonePerPlatformOverrideStruct
{
    var(__HandleButtonInput__Delegate) /*0x00AB0000-0x00000000*/ private @NULL PS3_Override[65537];
    var(__HandleButtonInput__Delegate) /*0x00AB0000-0x00000000*/ private @NULL Xbox360_Override[65537];

    structdefaultproperties
    {
        PS3_Override=(bOverride=false,DeadZoneParams=(bCircularDeadZoneEnabled=true,CircularDeadZoneInnerPct=0.2000000,CircularDeadZoneOuterPct=1.0000000,bSquareDeadZoneEnabled=true,SquareDeadZoneInnerPct=0.0700000,SquareDeadZoneOuterPct=0.9600000))
        Xbox360_Override=(bOverride=false,DeadZoneParams=(bCircularDeadZoneEnabled=true,CircularDeadZoneInnerPct=0.2000000,CircularDeadZoneOuterPct=1.0000000,bSquareDeadZoneEnabled=true,SquareDeadZoneInnerPct=0.0700000,SquareDeadZoneOuterPct=0.9600000))
    }
};

var(__HandleButtonInput__Delegate) /*0x01BC0000-0x00000000*/ private @NULL LookInputYawAcceleration[65537];
var(__HandleButtonInput__Delegate) /*0x01BC0000-0x00000000*/ private @NULL LookInputPitchAcceleration[65537];
var(__HandleButtonInput__Delegate) /*0x01BC0000-0x00000000*/ private @NULL LookInputYawDeceleration[65537];
var(__HandleButtonInput__Delegate) /*0x01BC0000-0x00000000*/ private @NULL LookInputPitchDeceleration[65537];
var(__HandleButtonInput__Delegate) /*0x01970000-0x00000000*/ private @NULL InputTurnRateData[65537];
var(__HandleButtonInput__Delegate) /*0x01840000-0x00000000*/ private @NULL InputCurveRotationStickX[65537];
var(__HandleButtonInput__Delegate) /*0x01840000-0x00000000*/ private @NULL InputCurveRotationStickY[65537];
var(__HandleButtonInput__Delegate) /*0x01840000-0x00000000*/ private @NULL InputCurveMovementStickX[65537];
var(__HandleButtonInput__Delegate) /*0x01840000-0x00000000*/ private @NULL InputCurveMovementStickY[65537];
var(__HandleButtonInput__Delegate) /*0x01840000-0x00000000*/ private @NULL PlatformInputCurveOverride[65537];
var(__HandleButtonInput__Delegate) /*0x021A0000-0x00000000*/ private @NULL RadialToLinearRemapMovement[65537];
var(__HandleButtonInput__Delegate) /*0x021A0000-0x00000000*/ private @NULL RadialToLinearRemapRotation[65537];
var(__HandleButtonInput__Delegate) /*0x01E70000-0x00000000*/ private bool bStickNonLinearRemappingEnabled[65537];
var(__HandleButtonInput__Delegate) /*0x01E70000-0x00000000*/ private float StickNonLinearRemapPower[65537];
var(__HandleButtonInput__Delegate) /*0x00A80000-0x00000000*/ private @NULL DeadZoneParams[65537];
var(__HandleButtonInput__Delegate) /*0x00A80000-0x00000000*/ private @NULL PlatformDeadZoneOverride[65537];

// Export USPTuneDataInput::execGetInputCurveRotationStickX(FFrame&, void* const)
native function GetInputCurveRotationStickX()
{
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPTuneDataInput::execGetInputCurveRotationStickY(FFrame&, void* const)
native function GetInputCurveRotationStickY()
{
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPTuneDataInput::execGetInputCurveMovementStickX(FFrame&, void* const)
native function GetInputCurveMovementStickX()
{
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPTuneDataInput::execGetInputCurveMovementStickY(FFrame&, void* const)
native function GetInputCurveMovementStickY()
{
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPTuneDataInput::execGetDeadZoneParams(FFrame&, void* const)
native function GetDeadZoneParams()
{
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];


}

defaultproperties
{
    LookInputYawAcceleration=(bEnabled=false,InputThreshold=0.9900000,RampUpTime=1.0000000,AccelMultiplier=2.2500000,AccelPercent=0.0000000)
    LookInputPitchAcceleration=(bEnabled=false,InputThreshold=0.9900000,RampUpTime=2.0000000,AccelMultiplier=2.2500000,AccelPercent=0.0000000)
    LookInputYawDeceleration=(bEnabled=true,InputThreshold=0.0100000,RampUpTime=0.2000000,DecelMultiplier=0.8000000,DecelPercent=0.0000000)
    LookInputPitchDeceleration=(bEnabled=true,InputThreshold=0.0100000,RampUpTime=0.2000000,DecelMultiplier=0.8000000,DecelPercent=0.0000000)
    InputTurnRateData=(SlowTurnRate=120000.0000000,FastTurnRate=150000.0000000,FastTurnRateStickThreshold=0.9000000)
    bStickNonLinearRemappingEnabled=true
    StickNonLinearRemapPower=2.0000000
    DeadZoneParams=(bCircularDeadZoneEnabled=true,CircularDeadZoneInnerPct=0.2000000,CircularDeadZoneOuterPct=1.0000000,bSquareDeadZoneEnabled=true,SquareDeadZoneInnerPct=0.0700000,SquareDeadZoneOuterPct=0.9600000)
    PlatformDeadZoneOverride=(PS3_Override=(bOverride=false,DeadZoneParams=(bCircularDeadZoneEnabled=true,CircularDeadZoneInnerPct=0.2000000,CircularDeadZoneOuterPct=1.0000000,bSquareDeadZoneEnabled=true,SquareDeadZoneInnerPct=0.0700000,SquareDeadZoneOuterPct=0.9600000)),Xbox360_Override=(bOverride=false,DeadZoneParams=(bCircularDeadZoneEnabled=true,CircularDeadZoneInnerPct=0.2000000,CircularDeadZoneOuterPct=1.0000000,bSquareDeadZoneEnabled=true,SquareDeadZoneInnerPct=0.0700000,SquareDeadZoneOuterPct=0.9600000)))
}