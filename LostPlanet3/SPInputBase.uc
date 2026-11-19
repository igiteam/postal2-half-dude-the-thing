class SPInputBase extends SPPlayerInput within SPInputPlayerController
    transient
    config(Input)
    hidecategories(Object,UIRoot);

struct native InputButtonData
{
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private name ButtonNameMapping;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize delegate<@NULL> ButtonHandler;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private byte Active;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private byte RawActive;
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bIsFiltered;

    structdefaultproperties
    {
        ButtonNameMapping="None"
        ButtonHandler=None
        Active=0
        RawActive=0
        bIsFiltered=false
    }
};

struct native InputAccelerationParams
{
    var(__HandleButtonInput__Delegate) /*0x017C0000-0x00000000*/ private bool bEnabled[65537];
    var(__HandleButtonInput__Delegate) /*0x017C0000-0x00000000*/ private float InputThreshold[65537];
    var(__HandleButtonInput__Delegate) /*0x017C0000-0x00000000*/ private float RampUpTime[65537];
    var(__HandleButtonInput__Delegate) /*0x017C0000-0x00000000*/ private float AccelMultiplier[65537];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float AccelPercent;

    structdefaultproperties
    {
        bEnabled=false
        InputThreshold=0.9900000
        RampUpTime=1.0000000
        AccelMultiplier=1.5000000
        AccelPercent=0.0000000
    }
};

struct native InputDecelerationParams
{
    var(__HandleButtonInput__Delegate) /*0x018D0000-0x00000000*/ private bool bEnabled[65537];
    var(__HandleButtonInput__Delegate) /*0x018D0000-0x00000000*/ private float InputThreshold[65537];
    var(__HandleButtonInput__Delegate) /*0x018D0000-0x00000000*/ private float RampUpTime[65537];
    var(__HandleButtonInput__Delegate) /*0x018D0000-0x00000000*/ private float DecelMultiplier[65537];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float DecelPercent[536870913];

    structdefaultproperties
    {
        bEnabled=false
        InputThreshold=0.0100000
        RampUpTime=0.1000000
        DecelMultiplier=0.8000000
        DecelPercent=0.0000000
    }
};

struct native InputRadialToLinearRemapInfo
{
    var(__HandleButtonInput__Delegate) /*0x01950000-0x00000000*/ private bool bUseRadialToLinearRemap[65537];
    var(__HandleButtonInput__Delegate) /*0x01950000-0x00000000*/ private float MinRadius[65537];
    var(__HandleButtonInput__Delegate) /*0x01950000-0x00000000*/ private float HorizontalRemapAngle[65537];
    var(__HandleButtonInput__Delegate) /*0x01950000-0x00000000*/ private float VerticalRemapAngle[65537];

    structdefaultproperties
    {
        bUseRadialToLinearRemap=false
        MinRadius=0.0000000
        HorizontalRemapAngle=0.0000000
        VerticalRemapAngle=0.0000000
    }
};

struct native ConfigurationBindingsInfo
{
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private name ButtonName[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string Command[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string Description_One[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string Description_One_MPOverride[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string Description_Two[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string Description_Two_MPOverride[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string Description_Three[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string Description_Three_MPOverride[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string SubDescription_One[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string SubDescription_One_MPOverride[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string SubDescription_Two[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string SubDescription_Two_MPOverride[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private int GameFlag[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool Control[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool Shift[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool Alt[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bIgnoreCtrl[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bIgnoreShift[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bIgnoreAlt[1073741825];

    structdefaultproperties
    {
        ButtonName="None"
        Command=""
        Description_One=""
        Description_One_MPOverride=""
        Description_Two=""
        Description_Two_MPOverride=""
        Description_Three=""
        Description_Three_MPOverride=""
        SubDescription_One=""
        SubDescription_One_MPOverride=""
        SubDescription_Two=""
        SubDescription_Two_MPOverride=""
        GameFlag=0
        Control=false
        Shift=false
        Alt=false
        bIgnoreCtrl=false
        bIgnoreShift=false
        bIgnoreAlt=false
    }
};

struct native InputConfiguration
{
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string ProfileSettingsName[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private int GameFlag[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize string ConfigurationName[1073741825];
    var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize array ConfigurationBindings[1073741825];

    structdefaultproperties
    {
        ProfileSettingsName=""
        GameFlag=0
        ConfigurationName=""
        ConfigurationBindings=none
    }
};

struct native InputDeadZoneParams
{
    var(__HandleButtonInput__Delegate) /*0x018B0000-0x00000000*/ private bool bCircularDeadZoneEnabled[65537];
    var(__HandleButtonInput__Delegate) /*0x018B0000-0x00000000*/ private float CircularDeadZoneInnerPct[65537];
    var(__HandleButtonInput__Delegate) /*0x018B0000-0x00000000*/ private float CircularDeadZoneOuterPct[65537];
    var(__HandleButtonInput__Delegate) /*0x018B0000-0x00000000*/ private bool bSquareDeadZoneEnabled[65537];
    var(__HandleButtonInput__Delegate) /*0x018B0000-0x00000000*/ private float SquareDeadZoneInnerPct[65537];
    var(__HandleButtonInput__Delegate) /*0x018B0000-0x00000000*/ private float SquareDeadZoneOuterPct[65537];

    structdefaultproperties
    {
        bCircularDeadZoneEnabled=true
        CircularDeadZoneInnerPct=0.2000000
        CircularDeadZoneOuterPct=1.0000000
        bSquareDeadZoneEnabled=true
        SquareDeadZoneInnerPct=0.0700000
        SquareDeadZoneOuterPct=0.9600000
    }
};

var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize array InputConfigurations[1073741825];
var(__HandleButtonInput__Delegate) /*0x02940000-0x00000000*/ private @NULL TuneDataInput[65537];
var(__HandleButtonInput__Delegate) /*0x02940000-0x00000000*/ private @NULL TuneDataBaseGestures[65537];
var(__HandleButtonInput__Delegate) /*0x01BC0000-0x00000000*/ private @NULL LookInputYawAcceleration[65537];
var(__HandleButtonInput__Delegate) /*0x01BC0000-0x00000000*/ private @NULL LookInputPitchAcceleration[65537];
var(__HandleButtonInput__Delegate) /*0x01BC0000-0x00000000*/ private @NULL LookInputYawDeceleration[65537];
var(__HandleButtonInput__Delegate) /*0x01BC0000-0x00000000*/ private @NULL LookInputPitchDeceleration[65537];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL ControllerGestures;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize array InputButtonDataList;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bActivateKismetInputEvents[131073];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bCurveAccelEnabled;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bStickNonLinearRemappingEnabled;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bStickSmoothingEnabled;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bStickSmoothing2Enabled;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bInputBasisFilterEnabled;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private bool bInputBasisFilterCut;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL DefaultInputCurveRotationStickX;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL DefaultInputCurveRotationStickY;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL DefaultInputCurveMovementStickX;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL DefaultInputCurveMovementStickY;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL CurrentInputCurveRotationStickX;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL CurrentInputCurveRotationStickY;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL CurrentInputCurveMovementStickX;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL CurrentInputCurveMovementStickY;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float StickNonLinearRemapPower;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float StickSmoothingRate;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float StickSmoothing2Rate;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float StickSmoothing2AccelMin;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL oldFilteredMovementStick[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL oldFilteredRotationStick[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float InputBasisFilterRate;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL InputBasis[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL oldMovementStick[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private name CurrentButtonKey;
var(__HandleButtonInput__Delegate) /*0x021A0000-0x00000000*/ private @NULL RadialToLinearRemapMovement[65537];
var(__HandleButtonInput__Delegate) /*0x021A0000-0x00000000*/ private @NULL RadialToLinearRemapRotation[65537];
var(__HandleButtonInput__Delegate) /*0x00A80000-0x00000000*/ private @NULL DeadZoneParams[65537];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL UnfilteredMovementStick[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL UnfilteredRotationStick[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL FilteredMovementStick[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private @NULL FilteredRotationStick[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float UnfilteredMovementStickRadius[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float UnfilteredRotationStickRadius[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float UnfilteredMovementStickAngle[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float UnfilteredRotationStickAngle[536870913];
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float MovementStickHandsOffTime;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private float RotationStickHandsOffTime;
var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private int TickDelayForInput[1073741825];
//var(__HandleButtonInput__Delegate) /*0x01E60000-0x00000000*/ private editfixedsize delegate<@NULL> __HandleButtonInput__Delegate;

// Export USPInputBase::execPreProcessInput(FFrame&, void* const)
native function PreProcessInput()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];


}

// Export USPInputBase::execFindInputButtonDataIndex(FFrame&, void* const)
native final function FindInputButtonDataIndex()
{
    local /*0x01E60000-0x00000000*/ private name ButtonName[8388609];
    local /*0x01E60000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPInputBase::execApplyRadialToLinearRemap(FFrame&, void* const)
native function ApplyRadialToLinearRemap()
{
    local /*0x01E60000-0x00000000*/ private float StickX[8388609], StickY;
    local /*0x01E60000-0x00000000*/ private @NULL RemapInfo[25296897];
    local /*0x01E60000-0x00000000*/ private float RemappedX[25165825], RemappedY;


}

// Export USPInputBase::execHandleStickFilter_RadialToLinearRemap(FFrame&, void* const)
native function HandleStickFilter_RadialToLinearRemap()
{
    local /*0x01E60000-0x00000000*/ private @NULL MoveStick[25165825], RotStick;


}

// Export USPInputBase::execApplyCircularDeadZone(FFrame&, void* const)
native function ApplyCircularDeadZone()
{
    local /*0x01E60000-0x00000000*/ private float X[25165825], Y;


}

// Export USPInputBase::execApplyDeadZone(FFrame&, void* const)
private native static final simulated function ApplyDeadZone()
{
    local /*0x01E60000-0x00000000*/ private float X[8388609], MinDeadZone, MaxDeadZone, OneOverZoneDelta, ReturnValue;


}

// Export USPInputBase::execHandleStickFilter_DeadZones(FFrame&, void* const)
protected native simulated function HandleStickFilter_DeadZones();

// Export USPInputBase::execComputeStick(FFrame&, void* const)
native function ComputeStick()
{
    local /*0x01E60000-0x00000000*/ private float X[8388609], Y;
    local /*0x01E60000-0x00000000*/ private @NULL stick[25165825];
    local /*0x01E60000-0x00000000*/ private float Radius[25165825], Angle;


}

// Export USPInputBase::execInputOkToSmooth(FFrame&, void* const)
private native static final simulated function InputOkToSmooth()
{
    local /*0x01E60000-0x00000000*/ private float newinput[8388609], oldinput;
    local /*0x01E60000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPInputBase::execInputOkToSmooth2(FFrame&, void* const)
private native static final simulated function InputOkToSmooth2()
{
    local /*0x01E60000-0x00000000*/ private float newinput[25165825], oldinput, accelmin;
    local /*0x01E60000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPInputBase::execSmoothInput(FFrame&, void* const)
private native static final simulated function SmoothInput()
{
    local /*0x01E60000-0x00000000*/ private float newinput[25165825], oldinput, smoothingrate;


}

// Export USPInputBase::execSmoothInput2(FFrame&, void* const)
private native static final simulated function SmoothInput2()
{
    local /*0x01E60000-0x00000000*/ private float newinput[25165825], oldinput, smoothingrate, accelmin;


}

// Export USPInputBase::execHandleMovementFilter_StickSmoothing(FFrame&, void* const)
protected native simulated function HandleMovementFilter_StickSmoothing()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];


}

// Export USPInputBase::execHandleMovementFilter_StickSmoothing2(FFrame&, void* const)
protected native simulated function HandleMovementFilter_StickSmoothing2()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x01E60000-0x00000000*/ private bool affectRotation[8388609], affectMovement;


}

// Export USPInputBase::execHandleStickFilter_NonLinear(FFrame&, void* const)
native function HandleStickFilter_NonLinear()
{
    local /*0x01E60000-0x00000000*/ private @NULL MoveStick[25165825], RotStick;


}

// Export USPInputBase::execHandleMovementFilter_InputBasis(FFrame&, void* const)
protected native simulated function HandleMovementFilter_InputBasis()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];


}

// Export USPInputBase::execHandleStickFilter_InputCurves(FFrame&, void* const)
native function HandleStickFilter_InputCurves()
{
    local /*0x01E60000-0x00000000*/ private @NULL MoveStick[25165825], RotStick;


}

// Export USPInputBase::execHandleMovementFilter_InputAcceleration(FFrame&, void* const)
native function HandleMovementFilter_InputAcceleration()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];


}

// Export USPInputBase::execHandleMovementFilter_InputDeceleration(FFrame&, void* const)
native function HandleMovementFilter_InputDeceleration()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];


}

// Export USPInputBase::execInputAcceleration(FFrame&, void* const)
native function InputAcceleration()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x01E60000-0x00000000*/ private @NULL OutParams[25165825];
    local /*0x01E60000-0x00000000*/ private float newinput[25165825];


}

// Export USPInputBase::execInputDeceleration(FFrame&, void* const)
native function InputDeceleration()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x01E60000-0x00000000*/ private @NULL OutParams[25165825];
    local /*0x01E60000-0x00000000*/ private float newinput[25165825];


}

// Export USPInputBase::execGetRotationStickValues(FFrame&, void* const)
native function GetRotationStickValues()
{
    local /*0x01E60000-0x00000000*/ private bool bUnfiltered[9437185], bCheckForMouseMove;
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];

    false
    false                
}

// Export USPInputBase::execGetMovementStickValues(FFrame&, void* const)
native function GetMovementStickValues()
{
    local /*0x01E60000-0x00000000*/ private bool bUnfiltered[9437185];
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];

    false            
}

// Export USPInputBase::execIsUsingCameraRelativeControls(FFrame&, void* const)
native final function IsUsingCameraRelativeControls()
{
    local /*0x01E60000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPInputBase::execIsUsingCameraAdjustedInputValues(FFrame&, void* const)
native final function IsUsingCameraAdjustedInputValues()
{
    local /*0x01E60000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPInputBase::execGetInputBasis(FFrame&, void* const)
native final simulated function GetInputBasis()
{
    local /*0x01E60000-0x00000000*/ private bool bIgnorePitch[9437185];
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];

    true            
}

// Export USPInputBase::execGetInputCoordinateSystem(FFrame&, void* const)
native final function GetInputCoordinateSystem()
{
    local /*0x01E60000-0x00000000*/ private bool bIgnorePitch[9437185];
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];

    true            
}

// Export USPInputBase::execGetInputCoordinateSystemAxes(FFrame&, void* const)
native final function GetInputCoordinateSystemAxes()
{
    local /*0x01E60000-0x00000000*/ private @NULL X[25165825], Y, Z;
    local /*0x01E60000-0x00000000*/ private bool bIgnorePitch[9437185];

    true                        
}

// Export USPInputBase::execGetInputVectorWalking(FFrame&, void* const)
native final function GetInputVectorWalking()
{
    local /*0x01E60000-0x00000000*/ private bool bUseUnfilteredValues[9437185];
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPInputBase::execGetInputVectorWalkingFlat(FFrame&, void* const)
native final function GetInputVectorWalkingFlat()
{
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USPInputBase::execGetTurnRateFromStickThreshold(FFrame&, void* const)
native final function GetTurnRateFromStickThreshold()
{
    local /*0x01E60000-0x00000000*/ private float CurrentStickValue[8388609], ReturnValue;


}

delegate HandleButtonInput()
{
    local /*0x01E60000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    //return;    
}

event InitializeButtonHandlingHandlers()
{
    //return;    
}

event InitializeButtonHandlingFilters()
{
    //return;    
}

function OnInputObjectCreate()
{
    InitTuneData();
    InitializeButtonHandling();
    //return;    
}

function InitTuneData()
{
    local /*0x01E60000-0x00000000*/ private @NULL SPTDI;

    // End:0x295
    if(TuneDataInput != none)
    {
        SPTDI = SPTuneDataInput(TuneDataInput);
        // End:0x295
        if(SPTDI != none)
        {
            LookInputYawAcceleration = SPTDI.LookInputYawAcceleration;
            LookInputPitchAcceleration = SPTDI.LookInputPitchAcceleration;
            LookInputYawDeceleration = SPTDI.LookInputYawDeceleration;
            LookInputPitchDeceleration = SPTDI.LookInputPitchDeceleration;
            DefaultInputCurveRotationStickX = SPTDI.GetInputCurveRotationStickX();
            DefaultInputCurveRotationStickY = SPTDI.GetInputCurveRotationStickY();
            DefaultInputCurveMovementStickX = SPTDI.GetInputCurveMovementStickX();
            DefaultInputCurveMovementStickY = SPTDI.GetInputCurveMovementStickY();
            CurrentInputCurveRotationStickX = DefaultInputCurveRotationStickX;
            CurrentInputCurveRotationStickY = DefaultInputCurveRotationStickY;
            CurrentInputCurveMovementStickX = DefaultInputCurveMovementStickX;
            CurrentInputCurveMovementStickY = DefaultInputCurveMovementStickY;
            RadialToLinearRemapMovement = SPTDI.RadialToLinearRemapMovement;
            RadialToLinearRemapRotation = SPTDI.RadialToLinearRemapRotation;
            DeadZoneParams = SPTDI.GetDeadZoneParams();
            bStickNonLinearRemappingEnabled = SPTDI.bStickNonLinearRemappingEnabled;
            StickNonLinearRemapPower = SPTDI.StickNonLinearRemapPower;
        }
    }
    // End:0x338
    if(TuneDataBaseGestures != none)
    {
        // End:0x2FB
        if(ControllerGestures == none)
        {
            ControllerGestures = new (self) Class'SPControllerGestures';
            ControllerGestures.OnInputObjectCreate(((1 << 0) | (1 << 1)) | (1 << 2));
        }
        ControllerGestures.ControllerSequenceList = TuneDataBaseGestures.ControllerSequenceList;
    }
    //return;    
}

event ApplyFriction()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x01E60000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function IsViewAccelEnabled()
{
    local /*0x01E60000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function PostProcessInput()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];

    super(PlayerInput).PostProcessInput(DeltaTime);
    //return;    
}

exec function ToggleCircularDeadZone()
{
    DeadZoneParams.bCircularDeadZoneEnabled = !DeadZoneParams.bCircularDeadZoneEnabled;
    //return;    
}

exec function ToggleSquareDeadZone()
{
    DeadZoneParams.bSquareDeadZoneEnabled = !DeadZoneParams.bSquareDeadZoneEnabled;
    //return;    
}

event PlayerInput()
{
    local /*0x01E60000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x01E60000-0x00000000*/ private @NULL SPPCamera, AimControl;

    // End:0x94
    if(TickDelayForInput > 0)
    {
        TickDelayForInput--;
        aBaseX = 0.0000000;
        aBaseY = 0.0000000;
        aBaseZ = 0.0000000;
        aForward = 0.0000000;
        aTurn = 0.0000000;
        aStrafe = 0.0000000;
        aUp = 0.0000000;
        aLookUp = 0.0000000;
        return;
    }
    super(PlayerInput).PlayerInput(DeltaTime);
    SPPCamera = SPPlayerCamera(Outer.PlayerCamera);
    // End:0x110
    if(SPPCamera != none)
    {
        SPPCamera.PostProcessInput(DeltaTime, self);
    }
    // End:0x1B3
    if(Outer.Pawn != none)
    {
        AimControl = SPPawn(Outer.Pawn).GetAimController();
        // End:0x1B3
        if(AimControl != none)
        {
            AimControl.PostProcessInput(DeltaTime, self);
        }
    }
    //return;    
}

private static final simulated function SquareSign()
{
    local /*0x01E60000-0x00000000*/ private float X[8388609], ReturnValue;

    return X * Abs(X);
    //return ReturnValue;    
}

function UseMovementInputCurve()
{
    local /*0x01E60000-0x00000000*/ private @NULL newMovementCurveStickX[8388609], newMovementCurveStickY;

    CurrentInputCurveMovementStickX = newMovementCurveStickX;
    CurrentInputCurveMovementStickY = newMovementCurveStickY;
    //return;    
}

function UseDefaultMovementInputCurve()
{
    CurrentInputCurveMovementStickX = DefaultInputCurveMovementStickX;
    CurrentInputCurveMovementStickY = DefaultInputCurveMovementStickY;
    //return;    
}

function UseRotationInputCurve()
{
    local /*0x01E60000-0x00000000*/ private @NULL newRotationCurveStickX[8388609], newRotationCurveStickY;

    CurrentInputCurveRotationStickX = newRotationCurveStickX;
    CurrentInputCurveRotationStickY = newRotationCurveStickY;
    //return;    
}

function UseDefaultRotationInputCurve()
{
    CurrentInputCurveRotationStickX = DefaultInputCurveRotationStickX;
    CurrentInputCurveRotationStickY = DefaultInputCurveRotationStickY;
    //return;    
}

function GetInputVectorFlying()
{
    local /*0x01E60000-0x00000000*/ private @NULL ReturnValue[92274689], X, Y, Z;

    GetInputCoordinateSystemAxes(X, Y, Z, false);
    return ((aForward * X) + (aStrafe * Y)) + (aUp * vect(0.0000000, 0.0000000, 1.0000000));
    //return ReturnValue;    
}

function GetRelativeInput()
{
    local /*0x01E60000-0x00000000*/ private @NULL relativeInput[25165825];
    local /*0x01E60000-0x00000000*/ private bool bUseUnfilteredValues[9437185];
    local /*0x01E60000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x01E60000-0x00000000*/ private @NULL NewDirection;

    NewDirection = GetInputVectorWalking(bUseUnfilteredValues);
    relativeInput = NewDirection << Outer.Pawn.Rotation;
    return UnfilteredMovementStickRadius;
    //return ReturnValue;    
}

function InitializeButtonHandling()
{
    InitializeButtonHandlingHandlers();
    InitializeButtonHandlingFilters();
    //return;    
}

final function SetInputButtonHandle()
{
    local /*0x01E60000-0x00000000*/ private int GBType[8388609];
    local /*0x01E60000-0x00000000*/ private editfixedsize delegate<@NULL> Handler[8388609];

    // End:0x48
    if(GBType < InputButtonDataList.Length)
    {
        InputButtonDataList[GBType].ButtonHandler = Handler;
    }
    //return;    
}

function InitializeActiveButtonsFromInputObject()
{
    local /*0x01E60000-0x00000000*/ private @NULL InputObject[8388609];
    local /*0x01E60000-0x00000000*/ private bool bWipeInputState[8388609];
    local /*0x01E60000-0x00000000*/ private int Idx;

    ResetInput();
    // End:0x1D4
    if(InputObject != none)
    {
        Idx = 0;
        J0x24:

        // End:0x147 [Loop If]
        if(Idx < InputButtonDataList.Length)
        {
            InputButtonDataList[Idx].RawActive = InputObject.InputButtonDataList[Idx].RawActive;
            // End:0xD7
            if(bWipeInputState)
            {
                InputButtonDataList[Idx].Active = 0;                
            }
            else
            {
                InputButtonDataList[Idx].Active = InputObject.InputButtonDataList[Idx].Active;
            }
            ++Idx;
            // [Loop Continue]
            goto J0x24;
        }
        // End:0x1D1
        if(!bWipeInputState)
        {
            Idx = 0;
            J0x161:

            // End:0x1D1 [Loop If]
            if(Idx < InputObject.PressedKeys.Length)
            {
                PressedKeys.AddItem(InputObject.PressedKeys[Idx]);                
                ++Idx;
                // [Loop Continue]
                goto J0x161;
            }
        }        
    }
    else
    {
        Idx = 0;
        J0x1DF:

        // End:0x257 [Loop If]
        if(Idx < InputButtonDataList.Length)
        {
            InputButtonDataList[Idx].RawActive = 0;
            InputButtonDataList[Idx].Active = 0;
            ++Idx;
            // [Loop Continue]
            goto J0x1DF;
        }
    }
    //return;    
}

function PushedOnTopOfInputStack()
{
    local /*0x01E60000-0x00000000*/ private @NULL PrevInputObject[8388609];
    local /*0x01E60000-0x00000000*/ private bool bWipePrevInputState[8388609];

    InitializeActiveButtonsFromInputObject(PrevInputObject, bWipePrevInputState);
    //return;    
}

function PushedBackOnInputStack()
{
    //return;    
}

function PoppedToTopOfInputStack()
{
    local /*0x01E60000-0x00000000*/ private @NULL PrevInputObject[8388609];
    local /*0x01E60000-0x00000000*/ private bool bWipePrevInputState[8388609];

    InitializeActiveButtonsFromInputObject(PrevInputObject, bWipePrevInputState);
    //return;    
}

function PoppedOffOfInputStack()
{
    //return;    
}

final function DisableButtonInput()
{
    local /*0x01E60000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x9F [Loop If]
    if(Idx < InputButtonDataList.Length)
    {
        // End:0x51
        if(IsButtonActive(Idx))
        {
            ForceButtonRelease(Idx);            
        }
        else
        {
            // End:0x91
            if(IsButtonActive(Idx, true))
            {
                InputButtonDataList[Idx].RawActive = 0;
            }
        }
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

final simulated function IsButtonActive()
{
    local /*0x01E60000-0x00000000*/ private int Button[8388609];
    local /*0x01E60000-0x00000000*/ private bool bRaw[9437185], ReturnValue;

    // End:0x85
    if(Button < InputButtonDataList.Length)
    {
        return ((bRaw) ? int(InputButtonDataList[Button].RawActive) == int(1) : int(InputButtonDataList[Button].Active) == int(1));
    }
    return false;
    //return ReturnValue;    
}

final function ForceButtonRelease()
{
    local /*0x01E60000-0x00000000*/ private int Button[8388609];
    local /*0x01E60000-0x00000000*/ private bool bSilent[9437185];

    // End:0xAD
    if(Button < InputButtonDataList.Length)
    {
        // End:0x5B
        if(!bSilent)
        {
            ButtonRelease(InputButtonDataList[Button].ButtonNameMapping);            
        }
        else
        {
            InputButtonDataList[Button].RawActive = 0;
            InputButtonDataList[Button].Active = 0;
        }
    }
    //return;    
}

final function EnableButtonInput()
{
    local /*0x01E60000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x7E [Loop If]
    if(Idx < InputButtonDataList.Length)
    {
        InputButtonDataList[Idx].Active = InputButtonDataList[Idx].RawActive;
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function GetButtonIndexFromName()
{
    local /*0x01E60000-0x00000000*/ private name ButtonMappingName[8388609];
    local /*0x01E60000-0x00000000*/ private int ReturnValue[92274689], Idx;

    Idx = 0;
    J0x0B:

    // End:0x6F [Loop If]
    if(Idx < InputButtonDataList.Length)
    {
        // End:0x61
        if(InputButtonDataList[Idx].ButtonNameMapping == ButtonMappingName)
        {
            return Idx;
        }
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    return -1;
    //return ReturnValue;    
}

function SetButtonIndexFilteredState()
{
    local /*0x01E60000-0x00000000*/ private int ButtonIdx[8388609];
    local /*0x01E60000-0x00000000*/ private bool bState[8388609];

    InputButtonDataList[ButtonIdx].bIsFiltered = bState;
    //return;    
}

function SetButtonNameFilteredState()
{
    local /*0x01E60000-0x00000000*/ private name ButtonMappingName[8388609];
    local /*0x01E60000-0x00000000*/ private bool bState[8388609];
    local /*0x01E60000-0x00000000*/ private int Idx;

    // End:0x67
    if(ButtonMappingName != 'None')
    {
        Idx = GetButtonIndexFromName(ButtonMappingName);
        // End:0x67
        if(Idx != -1)
        {
            SetButtonIndexFilteredState(Idx, bState);            
        }
    }
    //return;    
}

function FilterButtonInput()
{
    local /*0x01E60000-0x00000000*/ private name ButtonName[8388609];
    local /*0x01E60000-0x00000000*/ private bool bPressed[8388609];
    local /*0x01E60000-0x00000000*/ private int ButtonIdx[8388609];
    local /*0x01E60000-0x00000000*/ private bool ReturnValue[92274689];

    return InputButtonDataList[ButtonIdx].bIsFiltered;
    //return ReturnValue;    
}

event PreInputKey()
{
    local /*0x01E60000-0x00000000*/ private name KeyName[8388609];
    local /*0x01E60000-0x00000000*/ private bool bPressed[8388609], ReturnValue;

    return false;
    //return ReturnValue;    
}

exec function ButtonPress()
{
    local /*0x01E60000-0x00000000*/ private name ButtonName[142606337];
    local /*0x01E60000-0x00000000*/ private int ButtonIdx;
    local /*0x01E60000-0x00000000*/ private editfixedsize delegate<@NULL> ButtonHandler;

    // End:0x11
    if(TickDelayForInput > 0)
    {
        return;
    }
    ButtonIdx = FindInputButtonDataIndex(ButtonName);
    // End:0x19B
    if(int(InputButtonDataList[ButtonIdx].RawActive) == int(0))
    {
        InputButtonDataList[ButtonIdx].RawActive = 1;
        // End:0xCA
        if(ControllerGestures != none)
        {
            ControllerGestures.RecordButtons(ButtonName, CurrentButtonKey, 1);
        }
        // End:0x198
        if(!Outer.TriggerGameButtonActionInteraction(ButtonName, 0))
        {
            // End:0x198
            if(!FilterButtonInput(ButtonName, true, ButtonIdx))
            {
                InputButtonDataList[ButtonIdx].Active = 1;
                ButtonHandler = InputButtonDataList[ButtonIdx].ButtonHandler;
                // End:0x198
                if(ButtonHandler != none)
                {
                    HandleButtonInput(true);
                }
            }
        }        
    }
    //return;    
}

exec function ButtonRelease()
{
    local /*0x01E60000-0x00000000*/ private name ButtonName[142606337];
    local /*0x01E60000-0x00000000*/ private int ButtonIdx;
    local /*0x01E60000-0x00000000*/ private editfixedsize delegate<@NULL> ButtonHandler;

    // End:0x11
    if(TickDelayForInput > 0)
    {
        return;
    }
    ButtonIdx = FindInputButtonDataIndex(ButtonName);
    // End:0x19B
    if(int(InputButtonDataList[ButtonIdx].RawActive) == int(1))
    {
        InputButtonDataList[ButtonIdx].RawActive = 0;
        // End:0xCA
        if(ControllerGestures != none)
        {
            ControllerGestures.RecordButtons(ButtonName, CurrentButtonKey, 2);
        }
        // End:0x198
        if(!Outer.TriggerGameButtonActionInteraction(ButtonName, 1))
        {
            // End:0x198
            if(!FilterButtonInput(ButtonName, false, ButtonIdx))
            {
                InputButtonDataList[ButtonIdx].Active = 0;
                ButtonHandler = InputButtonDataList[ButtonIdx].ButtonHandler;
                // End:0x198
                if(ButtonHandler != none)
                {
                    HandleButtonInput(false);
                }
            }
        }        
    }
    //return;    
}

function IsButtonPressed()
{
    local /*0x01E60000-0x00000000*/ private name ButtonName[142606337];
    local /*0x01E60000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x01E60000-0x00000000*/ private int ButtonIdx;

    ButtonIdx = FindInputButtonDataIndex(ButtonName);
    return int(InputButtonDataList[ButtonIdx].RawActive) == int(1);
    //return ReturnValue;    
}

function HandleFlashlight()
{
    local /*0x01E60000-0x00000000*/ private bool bPressed[8388609], bDblClickMove;

    // End:0x54
    if(!Outer.IsMoveInputIgnored() && bPressed)
    {
        Outer.FlashLightToggle();
    }
    //return;    
}

function GetValidConfigName()
{
    local /*0x01E60000-0x00000000*/ private editfixedsize string ConfigName[8388609], ReturnValue;
    local /*0x01E60000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x8C [Loop If]
    if(I < InputConfigurations.Length)
    {
        // End:0x7E
        if(InputConfigurations[I].ProfileSettingsName ~= ConfigName)
        {
            return InputConfigurations[I].ProfileSettingsName;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    return "";
    //return ReturnValue;    
}

function LogConfigNames()
{
    local /*0x01E60000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x31 [Loop If]
    if(I < InputConfigurations.Length)
    {
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function ApplyConfigToKeyBindings()
{
    local /*0x01E60000-0x00000000*/ private editfixedsize string CurrentConfigName[8388609];
    local /*0x01E60000-0x00000000*/ private int ReturnValue[92274689], I, X;
    local /*0x01E60000-0x00000000*/ private name TranslatedName;
    local /*0x01E60000-0x00000000*/ private int CurrentConfig;

    CurrentConfig = -1;
    LogConfigNames();
    X = 0;
    J0x24:

    // End:0x94 [Loop If]
    if(X < InputConfigurations.Length)
    {
        // End:0x86
        if(InputConfigurations[X].ProfileSettingsName == CurrentConfigName)
        {
            CurrentConfig = X;
            // [Explicit Break]
            goto J0x94;
        }
        ++X;
        // [Loop Continue]
        goto J0x24;
    }
    J0x94:

    // End:0xE0
    if(CurrentConfig == -1)
    {
        // End:0xDA
        if(InputConfigurations[0].ConfigurationBindings.Length > 0)
        {
            CurrentConfig = 0;            
        }
        else
        {
            return -1;
        }
    }
    I = 0;
    J0xEB:

    // End:0x4D5 [Loop If]
    if(I < Bindings.Length)
    {
        X = 0;
        J0x10E:

        // End:0x4C7 [Loop If]
        if(X < InputConfigurations[CurrentConfig].ConfigurationBindings.Length)
        {
            TranslatedName = InputConfigurations[CurrentConfig].ConfigurationBindings[X].ButtonName;
            // End:0x4B9
            if(TranslatedName == Bindings[I].Name)
            {
                Bindings[I].Command = InputConfigurations[CurrentConfig].ConfigurationBindings[X].Command;
                Bindings[I].Control = InputConfigurations[CurrentConfig].ConfigurationBindings[X].Control;
                Bindings[I].Shift = InputConfigurations[CurrentConfig].ConfigurationBindings[X].Shift;
                Bindings[I].Alt = InputConfigurations[CurrentConfig].ConfigurationBindings[X].Alt;
                Bindings[I].bIgnoreCtrl = InputConfigurations[CurrentConfig].ConfigurationBindings[X].bIgnoreCtrl;
                Bindings[I].bIgnoreShift = InputConfigurations[CurrentConfig].ConfigurationBindings[X].bIgnoreShift;
                Bindings[I].bIgnoreAlt = InputConfigurations[CurrentConfig].ConfigurationBindings[X].bIgnoreAlt;
                // [Explicit Break]
                goto J0x4C7;
            }
            ++X;
            // [Loop Continue]
            goto J0x10E;
        }
        J0x4C7:

        ++I;
        // [Loop Continue]
        goto J0xEB;
    }
    return CurrentConfig;
    //return ReturnValue;    
}

static function boolstr()
{
    local /*0x01E60000-0x00000000*/ private bool B[8388609];
    local /*0x01E60000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return ((B) ? "1" : "0");
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x01E60000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x01E60000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x01E60000-0x00000000*/ private @NULL Start, End, UnFEnd, IBEnd;
    local /*0x01E60000-0x00000000*/ private int bx, By, Z;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    // End:0x5C6
    if(true)
    {
        HUD.Canvas.DrawText((((("Lcook  X=" $ string(FilteredMovementStick.X)) @ "Y=") $ string(FilteredMovementStick.Y)) @ "R=") $ string(FMin(1.0000000, V2DSize(FilteredMovementStick))), true);
        HUD.Canvas.DrawText((((((("Linput X=" $ string(UnfilteredMovementStick.X)) @ "Y=") $ string(UnfilteredMovementStick.Y)) @ "R=") $ string(UnfilteredMovementStickRadius)) @ "A=") $ string(UnfilteredMovementStickAngle), true);
        HUD.Canvas.DrawText((((("Lraw   X=" $ string(RawJoyRight)) @ "Y=") $ string(RawJoyUp)) @ "R=") $ string(V2DSize(vect2d(RawJoyRight, RawJoyUp))), true);
        HUD.Canvas.DrawText((((("Rcook  X=" $ string(FilteredRotationStick.X)) @ "Y=") $ string(FilteredRotationStick.Y)) @ "R=") $ string(FMin(1.0000000, V2DSize(FilteredRotationStick))), true);
        HUD.Canvas.DrawText((((((("Rinput X=" $ string(UnfilteredRotationStick.X)) @ "Y=") $ string(UnfilteredRotationStick.Y)) @ "R=") $ string(UnfilteredRotationStickRadius)) @ "A=") $ string(UnfilteredRotationStickAngle), true);
        HUD.Canvas.DrawText((((("Rraw   X=" $ string(RawJoyLookRight)) @ "Y=") $ string(RawJoyLookUp)) @ "R=") $ string(V2DSize(vect2d(RawJoyLookRight, RawJoyLookUp))), true);
        HUD.Canvas.DrawText((("TurnRate  X=" $ string(LookRightScale)) @ "Y=") $ string(LookUpScale), true);
        HUD.Canvas.DrawText((("InputDecel  X=" $ string(LookInputYawDeceleration.DecelPercent)) @ "Y=") $ string(LookInputPitchDeceleration.DecelPercent), true);
        HUD.Canvas.DrawText((((((("InputBasisFilter=" $ (boolstr(bInputBasisFilterEnabled))) @ "StickSmoothing=") $ (boolstr(bStickSmoothingEnabled))) @ "SmoothRate=") $ string(StickSmoothingRate)) @ "CurveAccel=") $ (boolstr(bCurveAccelEnabled)), true);
    }
    // End:0xF76
    if(true)
    {
        Z = 40;
        bx = int(HUD.Canvas.CurX);
        By = int(HUD.Canvas.CurY);
        HUD.Canvas.SetDrawColor(16, 32, 16, 96);
        HUD.Canvas.DrawRect(float(Z * 2), float(Z * 2));
        HUD.Canvas.SetPos(float(bx), float(By), 0.0000000);
        HUD.Canvas.SetDrawColor(128, 255, 128);
        HUD.Canvas.DrawBox(float(Z * 2), float(Z * 2));
        HUD.Canvas.Draw2DLine(float(bx + Z), float(By + Z), float(bx + Z) + (float(Z) * RawJoyRight), float(By + Z) - (float(Z) * RawJoyUp), MakeColor(128, 0, 0));
        HUD.Canvas.Draw2DLine(float(bx + Z), float(By + Z), float(bx + Z) + (float(Z) * UnfilteredMovementStick.X), float(By + Z) - (float(Z) * UnfilteredMovementStick.Y), MakeColor(0, 0, 196));
        HUD.Canvas.Draw2DLine(float(bx + Z), float(By + Z), float(bx + Z) + (float(Z) * FilteredMovementStick.X), float(By + Z) - (float(Z) * FilteredMovementStick.Y), MakeColor(0, 255, 0));
        bx += (Z * 3);
        HUD.Canvas.SetPos(float(bx), float(By), 0.0000000);
        HUD.Canvas.SetDrawColor(16, 32, 16, 96);
        HUD.Canvas.DrawRect(float(Z * 2), float(Z * 2));
        HUD.Canvas.SetPos(float(bx), float(By), 0.0000000);
        HUD.Canvas.SetDrawColor(128, 255, 128);
        HUD.Canvas.DrawBox(float(Z * 2), float(Z * 2));
        HUD.Canvas.Draw2DLine(float(bx + Z), float(By + Z), float(bx + Z) + (float(Z) * RawJoyLookRight), float(By + Z) + (float(Z) * RawJoyLookUp), MakeColor(128, 0, 0));
        HUD.Canvas.Draw2DLine(float(bx + Z), float(By + Z), float(bx + Z) + (float(Z) * UnfilteredRotationStick.X), float(By + Z) - (float(Z) * UnfilteredRotationStick.Y), MakeColor(0, 0, 196));
        HUD.Canvas.Draw2DLine(float(bx + Z), float(By + Z), float(bx + Z) + (float(Z) * FilteredRotationStick.X), float(By + Z) - (float(Z) * FilteredRotationStick.Y), MakeColor(0, 255, 0));
        bx -= (Z * 3);
        By += (Z * 2);
        HUD.Canvas.SetPos(float(bx), float(By), 0.0000000);
    }
    out_YPos = HUD.Canvas.CurY;
    // End:0x120F
    if((Outer.Pawn != none) && false)
    {
        Start = Outer.Pawn.Location + vect(0.0000000, 0.0000000, 75.0000000);
        IBEnd = Start + (Vector(InputBasis) * float(100));
        End = Start + ((SPMakeVector(FilteredMovementStick.Y, FilteredMovementStick.X, 0.0000000) >> InputBasis) * float(100));
        UnFEnd = Start + ((SPMakeVector(UnfilteredMovementStick.Y, UnfilteredMovementStick.X, 0.0000000) >> InputBasis) * float(100));
        Class'Engine.Actor'.static.DrawDebugLine(Start, UnFEnd, 0, 64, 0);
        Class'Engine.Actor'.static.DrawDebugLine(Start, IBEnd, 255, 255, 255);
        Class'Engine.Actor'.static.DrawDebugLine(Start, End, 0, 255, 0);
        Class'Engine.Actor'.static.DrawDebugBox(Start, vect(1.0000000, 1.0000000, 1.0000000), 0, 255, 0);
    }
    //return;    
}

defaultproperties
{
    InputConfigurations=/* Array type was not detected. */
    LookInputYawAcceleration=(bEnabled=false,InputThreshold=0.9900000,RampUpTime=1.0000000,AccelMultiplier=2.2500000,AccelPercent=0.0000000)
    LookInputPitchAcceleration=(bEnabled=false,InputThreshold=0.9900000,RampUpTime=2.0000000,AccelMultiplier=2.2500000,AccelPercent=0.0000000)
    LookInputYawDeceleration=(bEnabled=false,InputThreshold=0.0100000,RampUpTime=0.1000000,DecelMultiplier=0.8000000,DecelPercent=0.0000000)
    LookInputPitchDeceleration=(bEnabled=false,InputThreshold=0.0100000,RampUpTime=0.1000000,DecelMultiplier=0.8000000,DecelPercent=0.0000000)
    bInputBasisFilterEnabled=true
    bInputBasisFilterCut=true
    StickNonLinearRemapPower=2.0000000
    StickSmoothingRate=3.5000000
    StickSmoothing2Rate=2.0000000
    StickSmoothing2AccelMin=0.5000000
    InputBasisFilterRate=25.0000000
    DeadZoneParams=(bCircularDeadZoneEnabled=true,CircularDeadZoneInnerPct=0.2000000,CircularDeadZoneOuterPct=1.0000000,bSquareDeadZoneEnabled=true,SquareDeadZoneInnerPct=0.0700000,SquareDeadZoneOuterPct=0.9600000)
    TickDelayForInput=2
}