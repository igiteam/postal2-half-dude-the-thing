class SeqAct_CameraFade extends SequenceAction
    hidecategories(Object);

var(*) /*0x43ED0000-0x00000000*/ private @NULL FadeColor[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient @NULL FadeAlpha;
var(*) /*0x43ED0000-0x00000000*/ private float FadeOpacity[65537];
var(*) /*0x43ED0000-0x00000000*/ private float FadeTime[65537];
var(*) /*0x43ED0000-0x00000000*/ private bool bPersistFade[65537];
var(*) /*0x43ED0000-0x00000000*/ private bool bFadeAudio[65537];
var(*) /*0x35EA0000-0x00000000*/ private float FadeTimeRemaining;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CachedPCs[536870913];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 1;
    //return ReturnValue;    
}

defaultproperties
{
    FadeOpacity=1.0000000
    FadeTime=1.0000000
    bPersistFade=true
    bLatentExecution=true
    bAutoActivateOutputLinks=false
    OutputLinks[0]=(Links=none,LinkDesc="Out",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Finished",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Target",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=true,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Fade"
}