class SeqAct_CameraLookAt extends SequenceAction
    hidecategories(Object);

var(*) /*0x43EE0000-0x00000000*/ private bool bAffectCamera[65537];
var(*) /*0x43EE0000-0x00000000*/ private bool bAlwaysFocus[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient bool bAdjustCamera;
var(*) /*0x43EE0000-0x00000000*/ private bool bTurnInPlace[65537];
var(*) /*0x43EE0000-0x00000000*/ private bool bIgnoreTrace[65537];
var(*) /*0x43EE0000-0x00000000*/ private bool bAffectHead[65537];
var(*) /*0x43EE0000-0x00000000*/ private bool bRotatePlayerWithCamera[65537];
var(*) /*0x43EE0000-0x00000000*/ private bool bToggleGodMode[65537];
var(*) /*0x43EE0000-0x00000000*/ private bool bLeaveCameraRotation[65537];
var(*) /*0x43EE0000-0x00000000*/ private bool bDisableInput[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bUsedTimer;
var(*) /*0x43EE0000-0x00000000*/ private bool bCheckLineOfSight[65537];
var(*) /*0x43EE0000-0x00000000*/ private @NULL InterpSpeedRange[65537];
var(*) /*0x43EE0000-0x00000000*/ private @NULL InFocusFOV[65537];
var(*) /*0x43EE0000-0x00000000*/ private name FocusBoneName[65537];
var(*) /*0x43EE0000-0x00000000*/ private editfixedsize string TextDisplay[65537];
var(*) /*0x43EE0000-0x00000000*/ private float TotalTime[65537];
var(*) /*0x43EE0000-0x00000000*/ private float CameraFOV[65537];
var(*) /*0x35EA0000-0x00000000*/ private float RemainingTime[536870913];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 3;
    //return ReturnValue;    
}

defaultproperties
{
    bAffectCamera=true
    bTurnInPlace=true
    bDisableInput=true
    InterpSpeedRange=(X=3.0000000,Y=3.0000000)
    InFocusFOV=(X=1.0000000,Y=1.0000000)
    CameraFOV=-1.0000000
    bLatentExecution=true
    OutputLinks[0]=(Links=none,LinkDesc="Out",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Finished",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="Succeeded",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[3]=(Links=none,LinkDesc="Failed",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Focus",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Look At"
}