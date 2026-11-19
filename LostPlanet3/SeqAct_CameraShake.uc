class SeqAct_CameraShake extends SequenceAction
    hidecategories(Object);

var(*) /*0x43EF0000-0x00000400*/ private editfixedsize noexport @NULL Shake[589825];
var(*) /*0x43EF0000-0x00000000*/ private noexport float ShakeScale[65537];
var(*) /*0x43EF0000-0x00000000*/ private noexport bool bDoControllerVibration[65537];
var(*) /*0x43EF0000-0x00000000*/ private noexport bool bRadialShake[65537];
var(*) /*0x43EF0000-0x00000000*/ private noexport bool bOrientTowardRadialEpicenter[65537];
var(*) /*0x43EF0000-0x00000000*/ private noexport float RadialShake_InnerRadius[65537];
var(*) /*0x43EF0000-0x00000000*/ private noexport float RadialShake_OuterRadius[65537];
var(*) /*0x43EF0000-0x00000000*/ private noexport float RadialShake_Falloff[65537];
var(*) /*0x43EF0000-0x00000000*/ private noexport byte PlaySpace[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LocationActor;

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: CameraShake'Default__SeqAct_CameraShake.Shake0'
    begin object name=Shake0 class=Class'CameraShake'
        OscillationDuration=1.0000000
        RotOscillation=(Pitch=(Amplitude=150.0000000,Frequency=40.0000000),Yaw=(Amplitude=75.0000000,Frequency=30.0000000),Roll=(Amplitude=150.0000000,Frequency=60.0000000))
    end object
    Shake=Shake0
    ShakeScale=1.0000000
    bDoControllerVibration=true
    RadialShake_InnerRadius=128.0000000
    RadialShake_OuterRadius=512.0000000
    RadialShake_Falloff=2.0000000
    InputLinks[0]=(LinkDesc="Start",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Location",LinkVar="None",PropertyName="LocationActor",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Camera Shake"
}