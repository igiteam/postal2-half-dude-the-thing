class SPCameraTransitionParam extends Object
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(__Filter1__Delegate) /*0x058B0000-0x00000000*/ private const name CameraTransitionName[196609];
var(__Filter1__Delegate) /*0x058B0000-0x00000000*/ private bool bCutDestMode[65537];
var(__Filter1__Delegate) /*0x058B0000-0x00000000*/ private bool bEnableInput[65537];
var(__Filter1__Delegate) /*0x058B0000-0x00000000*/ private bool bSaveAngle[65537];
var(__Filter1__Delegate) /*0x058B0000-0x00000000*/ private bool bRestoreAngle[65537];
var(__Filter1__Delegate) /*0x058B0000-0x00000000*/ private bool bTickBothModes[65537];
var(__Filter1__Delegate) /*0x058B0000-0x00000000*/ private bool bMaintainSmoothVelocity[65537];

function MakeBlend()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609], ReturnValue;

    return none;
    //return ReturnValue;    
}

static simulated function BlendTViewTargets()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[25296897], B, C, Result, UseTransition;

    Result.POV.Location = UseTransition.BlendVector(A.POV.Location, B.POV.Location, C.POV.Location);
    Result.POV.Rotation = UseTransition.BlendRotator(A.POV.Rotation, B.POV.Rotation, C.POV.Rotation);
    Result.POV.FOV = UseTransition.BlendFloat(A.POV.FOV, B.POV.FOV, C.POV.FOV);
    //return;    
}

static simulated function BlendPOVs()
{
    local /*0x043A0000-0x00000000*/ private @NULL Start[25296897], Target, TransitionBlend;

    Target.Location = TransitionBlend.BlendVector(Start.Location, Start.Location, Target.Location);
    Target.Rotation = TransitionBlend.BlendRotator(Start.Rotation, Start.Rotation, Target.Rotation);
    Target.FOV = TransitionBlend.BlendFloat(Start.FOV, Start.FOV, Target.FOV);
    //return;    
}

defaultproperties
{
    bCutDestMode=true
    bEnableInput=true
    bMaintainSmoothVelocity=true
}