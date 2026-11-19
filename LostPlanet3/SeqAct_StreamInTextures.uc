class SeqAct_StreamInTextures extends SeqAct_Latent
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private transient bool bLocationBased;
var(*) /*0x35EA0000-0x00000000*/ private bool bStreamingActive[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasTriggeredAllLoaded[131073];
var(*) /*0x443E0000-0x00000000*/ private float Seconds[65537];
var(*) /*0x443E0000-0x00000000*/ private float StreamingDistanceMultiplier[65537];
var(*) /*0x35EA0000-0x00000000*/ private int NumWantingResourcesID[131073];
var(*) /*0x35EA0000-0x00000000*/ private float StopTimestamp[131073];
var(*) /*0x443E0000-0x00000000*/ private editfixedsize array LocationActors[65537];
var(*) /*0x443E0000-0x00000000*/ private editfixedsize array ForceMaterials[65537];
var(*) /*0x11C20000-0x00000000*/ private @NULL CinematicTextureGroups[196609];
var(*) /*0x35EA0000-0x00000000*/ private int SelectedCinematicTextureGroups[805437441];

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return super(SequenceObject).GetObjClassVersion() + 2;
    //return ReturnValue;    
}

defaultproperties
{
    Seconds=15.0000000
    StreamingDistanceMultiplier=1.0000000
    InputLinks[0]=(LinkDesc="Start",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Out",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Aborted",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[2]=(Links=none,LinkDesc="All Loaded",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Actor",LinkVar="None",PropertyName="Targets",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    VariableLinks[1]=(ExpectedType=Class'SeqVar_Object',LinkedVariables=none,LinkDesc="Location",LinkVar="None",PropertyName="LocationActors",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=255,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Stream In Textures"
}