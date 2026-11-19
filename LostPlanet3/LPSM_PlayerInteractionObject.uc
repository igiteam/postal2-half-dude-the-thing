class LPSM_PlayerInteractionObject extends SPSpecialMove
    config(Game);

enum EInteractionObjectPlaybackStage
{
    EInteractionObjectPlaybackStage_Prepare,// 0
    EInteractionObjectPlaybackStage_Operate,// 1
    EInteractionObjectPlaybackStage_Complete,// 2
    EInteractionObjectPlaybackStage_Aborted,// 3
    EInteractionObjectPlaybackStage_MAX// 4
};

struct native InteractionObjectPlaybackAnimation
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLooped;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayBackRate;
    var(0.25_Pct) /*0x6C6F0000-0x00000000*/ private bool bUseChoreography[65537];

    structdefaultproperties
    {
        AnimName="None"
        bLooped=false
        PlayBackRate=0.0000000
        bUseChoreography=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PlaybackStage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InteractionObject;
var(0.25_Pct_1265041407) /*0x97E50000-0x00000000*/ private @NULL AnimationList[4];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbortedByController;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCompletedByController;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocationBeforeInteraction;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool bOk;

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0xD1
    if(int(MySPPawn.WorldInfo.Role) == int(ROLE_Authority))
    {
        bOk = InteractionObject.BeginPrepareOperation(LPBasePlayerPawn(MySPPawn), self);
        // End:0xD1
        if(!bOk)
        {
            MySPPawn.EndSpecialMove(Class);
            return;
        }
    }
    // End:0x130
    if(MySPPawn.IsLocallyControlled())
    {
        SPPlayerController(MySPPawn.Controller).PauseFire();
    }
    bAbortedByController = false;
    bCompletedByController = false;
    PlaybackStage = 0;
    PlaySequence();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;
    local /*0x97E50000-0x00000000*/ private bool bInterrupted;

    MySPPawn.StopFullBodyAnim(0.2500000);
    MySPPawn.StopPawnChoreography();
    bInterrupted = NextMove != none;
    // End:0x105
    if(MySPPawn.IsLocallyControlled())
    {
        SPPlayerController(MySPPawn.Controller).UnPauseFire();
        // End:0x105
        if(SPPlayerController(MySPPawn.Controller).bIsExternalUIOpen)
        {
            bInterrupted = true;
        }
    }
    // End:0x182
    if((bInterrupted && InteractionObject != none) && int(MySPPawn.WorldInfo.Role) == int(ROLE_Authority))
    {
        InteractionObject.OnSpecialMoveEvent_Interrupted();
    }
    // End:0x1C2
    if(InteractionObject != none)
    {
        InteractionObject.SpecialMoveEnded(NextMove, LocationBeforeInteraction);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor;

    // End:0x39
    if(InteractionActor == none)
    {
        MySPPawn.EndSpecialMove(Class);
        return;
    }
    InteractionObject = LPGeneralPlayerInteractionObject(InteractionActor);
    // End:0x8E
    if(InteractionObject == none)
    {
        MySPPawn.EndSpecialMove(Class);
        return;
    }
    AnimationList[0].AnimName = InteractionObject.Prepare.AnimName;
    AnimationList[0].bLooped = InteractionObject.Prepare.bLooped;
    AnimationList[0].PlayBackRate = InteractionObject.Prepare.PlayBackRate;
    AnimationList[0].bUseChoreography = InteractionObject.Prepare.bUseChoreography;
    AnimationList[1].AnimName = InteractionObject.Operate.AnimName;
    AnimationList[1].bLooped = InteractionObject.Operate.bLooped;
    AnimationList[1].PlayBackRate = InteractionObject.Operate.PlayBackRate;
    AnimationList[1].bUseChoreography = InteractionObject.Operate.bUseChoreography;
    AnimationList[2].AnimName = InteractionObject.Completed.AnimName;
    AnimationList[2].bLooped = InteractionObject.Completed.bLooped;
    AnimationList[2].PlayBackRate = InteractionObject.Completed.PlayBackRate;
    AnimationList[2].bUseChoreography = InteractionObject.Completed.bUseChoreography;
    AnimationList[3].AnimName = InteractionObject.Aborted.AnimName;
    AnimationList[3].bLooped = InteractionObject.Aborted.bLooped;
    AnimationList[3].PlayBackRate = InteractionObject.Aborted.PlayBackRate;
    AnimationList[3].bUseChoreography = InteractionObject.Aborted.bUseChoreography;
    LocationBeforeInteraction = MySPPawn.Location;
    //return;    
}

simulated function PlayNextSequence()
{
    local /*0x97E50000-0x00000000*/ private bool bDone;

    J0x00:
    // End:0x1E0 [Loop If]
    if(!bDone)
    {
        switch(PlaybackStage)
        {
            // End:0x7C
            case 0:
                bDone = (PlaySequence()) != none;
                // End:0x79
                if(!bDone)
                {
                    InteractionObject.OnSpecialMoveEvent_PrepareComplete();
                    PlaybackStage = 1;
                }
                // End:0x1DD
                break;
            // End:0xD6
            case 1:
                bDone = (PlaySequence()) != none;
                // End:0xD3
                if(!bDone)
                {
                    InteractionObject.OnSpecialMoveEvent_OperateComplete();
                    PlaybackStage = 2;
                }
                // End:0x1DD
                break;
            // End:0x158
            case 2:
                bDone = (PlaySequence()) != none;
                // End:0x155
                if(!bDone)
                {
                    InteractionObject.OnSpecialMoveEvent_CompleteComplete();
                    bDone = true;
                    MySPPawn.EndSpecialMove(Class);
                }
                // End:0x1DD
                break;
            // End:0x1DA
            case 3:
                bDone = (PlaySequence()) != none;
                // End:0x1D7
                if(!bDone)
                {
                    InteractionObject.OnSpecialMoveEvent_AbortedComplete();
                    bDone = true;
                    MySPPawn.EndSpecialMove(Class);
                }
                // End:0x1DD
                break;
            // End:0xFFFF
            default:
                break;
        }
        // [Loop Continue]
        goto J0x00;
    }
    //return;    
}

simulated function AbortInteraction()
{
    // End:0x6B
    if((int(PlaybackStage) != int(3)) && int(PlaybackStage) != int(2))
    {
        bAbortedByController = true;
        InteractionObject.OnSpecialMoveEvent_AbortedByController();
        PlaybackStage = 3;
        PlayNextSequence();
    }
    //return;    
}

simulated function CompleteInteraction()
{
    // End:0x7F
    if((int(PlaybackStage) != int(3)) && int(PlaybackStage) != int(2))
    {
        bCompletedByController = true;
        // End:0x69
        if(int(PlaybackStage) == int(1))
        {
            InteractionObject.OnSpecialMoveEvent_OperateComplete();
        }
        PlaybackStage = 2;
        PlayNextSequence();
    }
    //return;    
}

simulated function OnAnimDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.StopPawnChoreography();
    switch(PlaybackStage)
    {
        // End:0x6F
        case 0:
            InteractionObject.OnSpecialMoveEvent_PrepareComplete();
            PlaybackStage = 1;
            PlayNextSequence();
            // End:0x14D
            break;
        // End:0xAC
        case 1:
            InteractionObject.OnSpecialMoveEvent_OperateComplete();
            PlaybackStage = 2;
            PlayNextSequence();
            // End:0x14D
            break;
        // End:0xFB
        case 2:
            InteractionObject.OnSpecialMoveEvent_CompleteComplete();
            MySPPawn.EndSpecialMove(Class);
            // End:0x14D
            break;
        // End:0x14A
        case 3:
            InteractionObject.OnSpecialMoveEvent_AbortedComplete();
            MySPPawn.EndSpecialMove(Class);
            // End:0x14D
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function PlaySequence()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private byte TranslationExtraction, RotationExtraction, RMMode;
    local /*0x97E50000-0x00000000*/ private @NULL CurrAnimSequence, ChoreographyParams;

    // End:0x38
    if(AnimationList[int(PlaybackStage)].AnimName == 'None')
    {
        return none;
    }
    RotationExtraction = 2;
    TranslationExtraction = 2;
    RMMode = 0;
    CurrAnimSequence = MySPPawn.PlayFullBodyAnimation(AnimationList[int(PlaybackStage)].AnimName, OnAnimDone,, AnimationList[int(PlaybackStage)].PlayBackRate, 0.2500000, 0.2500000, AnimationList[int(PlaybackStage)].bLooped, true, TranslationExtraction, RotationExtraction, true, RMMode);
    // End:0x2C5
    if(CurrAnimSequence != none)
    {
        // End:0x2C5
        if(AnimationList[int(PlaybackStage)].bUseChoreography)
        {
            ChoreographyParams.AlignmentType = 0;
            ChoreographyParams.MySequence = CurrAnimSequence;
            ChoreographyParams.RotationMode = 1;
            ChoreographyParams.OtherTargetMovePercent = 0.0000000;
            ChoreographyParams.BlendTime = 0.5000000;
            ChoreographyParams.OtherTarget = InteractionObject;
            ChoreographyParams.bIgnoreCollisionWithOther = true;
            ChoreographyParams.bMyIgnoreAllBlockActorsDuringMove = true;
            ChoreographyParams.bOtherIgnoreAllBlockActorsDuringMove = true;
            MySPPawn.StartPawnChoreography(ChoreographyParams);
        }
    }
    return CurrAnimSequence;
    //return ReturnValue;    
}

defaultproperties
{
    bZeroVelocityOnSpecialMoveEnd=true
    bAllowFloorConforming=false
    bAllowFootPlacementControllers=false
    bDisableCollision=true
}