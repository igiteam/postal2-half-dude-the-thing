class SeqAct_Interp extends SeqAct_Latent
    config(Engine)
    hidecategories(Object);

struct native export SavedTransform
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Rotation;

    structdefaultproperties
    {
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
    }
};

struct native CameraCutInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Location;
    var(*) /*0x35EA0000-0x00000000*/ private float TimeStamp;

    structdefaultproperties
    {
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        TimeStamp=0.0000000
    }
};

var(*) /*0x35EA0000-0x00000100*/ private map{VOID,VOID} SavedActorTransforms[805437441];
var(*) /*0x35EA0000-0x00000100*/ private map{VOID,VOID} SavedActorVisibilities[805437441];
var(*) /*0x440A0000-0x00000000*/ private float PlayRate[65537];
var(*) /*0x35EA0000-0x00000000*/ private float Position;
var(*) /*0x440A0000-0x00000000*/ private float ForceStartPosition[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsPlaying;
var(*) /*0x35EA0000-0x00000000*/ private bool bPaused;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsBeingEdited[536870913];
var(*) /*0x440A0000-0x00000000*/ private bool bLooping[65537];
var(*) /*0x440A0000-0x00000000*/ private bool bRewindOnPlay[65537];
var(*) /*0x440A0000-0x00000000*/ private bool bNoResetOnRewind[65537];
var(*) /*0x440A0000-0x00000000*/ private bool bRewindIfAlreadyPlaying[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bReversePlayback;
var(*) /*0x35EA0000-0x00000000*/ private bool bStopAtLoopEnd[536870913];
var(*) /*0x440A0000-0x00000000*/ private bool bInterpForPathBuilding[65537];
var(*) /*0x440A0000-0x00000000*/ private bool bForceStartPos[65537];
var(*) /*0x440A0000-0x00000000*/ private bool bDisableRadioFilter[65537];
var(*) /*0x440A0000-0x00000000*/ private bool bClientSideOnly[65537];
var(*) /*0x440A0000-0x00000000*/ private bool bSkipUpdateIfNotVisible[65537];
var(*) /*0x440A0000-0x00000000*/ private bool bIsSkippable[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bShouldShowGore[536870913];
var(*) /*0x440A0000-0x00000000*/ private editfixedsize array LinkedCover[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL InterpData[524289];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array GroupInst;
var(*) /*0x35EA0000-0x00000000*/ private class ReplicatedActorClass[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ReplicatedActor[537001985];
var(*) /*0x440A0000-0x00000000*/ private int PreferredSplitScreenNum[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CameraCuts[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float TerminationTime;
var(*) /*0x440A0000-0x00000000*/ private input @NULL RenderingOverrides[1073807361];
var(*) /*0x14350000-0x00000000*/ private byte ConstantCameraAnim[65537];
var(*) /*0x14350000-0x00000000*/ private float ConstantCameraAnimRate[65537];

// Export USeqAct_Interp::execSetPosition(FFrame&, void* const)
native final function SetPosition()
{
    local /*0x35EA0000-0x00000000*/ private float NewPosition[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bJump[9437185];

    false                
}

// Export USeqAct_Interp::execStop(FFrame&, void* const)
native final function Stop();

// Export USeqAct_Interp::execStopAtLoopEnd(FFrame&, void* const)
native final function StopAtLoopEnd();

// Export USeqAct_Interp::execAbortFor(FFrame&, void* const)
native function AbortFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL latentActor[8388609];


}

// Export USeqAct_Interp::execAddPlayerToDirectorTracks(FFrame&, void* const)
native final function AddPlayerToDirectorTracks()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PC[8388609];


}

function Reset()
{
    SetPosition(0.0000000, false);
    // End:0x3F
    if(bActive)
    {
        InputLinks[2].bHasImpulse = true;
    }
    //return;    
}

static event GetObjClassVersion()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return (super(SequenceObject).GetObjClassVersion() + 1) + 1;
    //return ReturnValue;    
}

defaultproperties
{
    PlayRate=1.0000000
    ReplicatedActorClass=Class'MatineeActor'
    RenderingOverrides=(bAllowAmbientOcclusion=false,bAllowDominantWholeSceneDynamicShadows=false,bAllowMotionBlurSkinning=false,bAllowTemporalAA=true,bAllowLightShafts=true)
    ConstantCameraAnimRate=4.0000000
    InputLinks[0]=(LinkDesc="Play",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[1]=(LinkDesc="Reverse",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[2]=(LinkDesc="Stop",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[3]=(LinkDesc="Pause",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[4]=(LinkDesc="Change Dir",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    InputLinks[5]=(LinkDesc="Stop After End",bHasImpulse=false,QueuedActivations=0,bDisabled=false,bDisabledPIE=false,LinkedOp=none,DrawY=0,bHidden=false,ActivateDelay=0.0000000,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    OutputLinks[0]=(Links=none,LinkDesc="Completed",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    OutputLinks[1]=(Links=none,LinkDesc="Reversed",bHasImpulse=false,bDisabled=false,bDisabledPIE=false,LinkedOp=none,ActivateDelay=0.0000000,DrawY=0,bHidden=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0,PIEActivationTime=0.0000000,bIsActivated=false)
    VariableLinks[0]=(ExpectedType=Class'InterpData',LinkedVariables=none,LinkDesc="Data",LinkVar="None",PropertyName="None",bWriteable=false,bSequenceNeverReadsOnlyWritesToThisVar=false,bModifiesLinkedObject=false,bHidden=false,MinVars=1,MaxVars=1,DrawX=0,CachedProperty=none,bAllowAnyType=false,bMoving=false,bClampedMax=false,bClampedMin=false,OverrideDelta=0)
    ObjName="Matinee"
}