class LPSM_PlayerHackDeployable extends SPSpecialMove
    config(Game);

enum EHackDeployablePlaybackStage
{
    EHackDeployablePlaybackStage_Prepare,// 0
    EHackDeployablePlaybackStage_Operate,// 1
    EHackDeployablePlaybackStage_Complete,// 2
    EHackDeployablePlaybackStage_Aborted,// 3
    EHackDeployablePlaybackStage_MAX// 4
};

struct HackDeployablePlaybackAnimation
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLooped;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayBackRate;

    structdefaultproperties
    {
        AnimName="None"
        bLooped=false
        PlayBackRate=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PlaybackStage;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL HackableComponent[524289];
var(0.25_Pct_1260847103) /*0x97E50000-0x00000000*/ private @NULL AnimationList[4];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAbortedByController;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCompletedByController;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x83
    if(int(MySPPawn.Role) == int(ROLE_Authority))
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

    MySPPawn.StopFullBodyAnim(0.2500000);
    MySPPawn.StopPawnChoreography();
    // End:0xA9
    if(int(MySPPawn.Role) == int(ROLE_Authority))
    {
        SPPlayerController(MySPPawn.Controller).UnPauseFire();
    }
    // End:0x127
    if(NextMove != none)
    {
        // End:0x127
        if(int(MySPPawn.Role) == int(ROLE_Authority))
        {
            LPPlayerController(MySPPawn.Controller).HackDeployableEvent_Interrupted(HackableComponent);
        }
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor, TD;

    // End:0x39
    if(InteractionActor == none)
    {
        MySPPawn.EndSpecialMove(Class);
        return;
    }
    HackableComponent = Class'LPPerks'.static.FindHackableComponent(InteractionActor);
    // End:0xA4
    if(HackableComponent == none)
    {
        MySPPawn.EndSpecialMove(Class);
        return;
    }
    TD = HackableComponent.TuneDataBeacon;
    AnimationList[0].AnimName = TD.PrepareHack.AnimName;
    AnimationList[0].bLooped = TD.PrepareHack.bLooped;
    AnimationList[0].PlayBackRate = TD.PrepareHack.PlayBackRate;
    AnimationList[1].AnimName = TD.OperateHack.AnimName;
    AnimationList[1].bLooped = TD.OperateHack.bLooped;
    AnimationList[1].PlayBackRate = TD.OperateHack.PlayBackRate;
    AnimationList[2].AnimName = TD.CompleteHack.AnimName;
    AnimationList[2].bLooped = TD.CompleteHack.bLooped;
    AnimationList[2].PlayBackRate = TD.CompleteHack.PlayBackRate;
    AnimationList[3].AnimName = TD.AbortHack.AnimName;
    AnimationList[3].bLooped = TD.AbortHack.bLooped;
    AnimationList[3].PlayBackRate = TD.AbortHack.PlayBackRate;
    // End:0x57C
    if((((AnimationList[0].AnimName == 'None') || AnimationList[1].AnimName == 'None') || AnimationList[2].AnimName == 'None') || AnimationList[3].AnimName == 'None')
    {
        MySPPawn.EndSpecialMove(Class);
        return;
    }
    //return;    
}

simulated function PlayNextSequence()
{
    local /*0x97E50000-0x00000000*/ private bool bDone;

    J0x00:
    // End:0x320 [Loop If]
    if(!bDone)
    {
        switch(PlaybackStage)
        {
            // End:0xCC
            case 0:
                bDone = (PlaySequence()) != none;
                // End:0xC9
                if(!bDone)
                {
                    // End:0xBD
                    if(int(MySPPawn.Role) == int(ROLE_Authority))
                    {
                        LPPlayerController(MySPPawn.Controller).HackDeployableEvent_PrepareComplete(HackableComponent);
                    }
                    PlaybackStage = 1;
                }
                // End:0x31D
                break;
            // End:0x176
            case 1:
                bDone = (PlaySequence()) != none;
                // End:0x173
                if(!bDone)
                {
                    // End:0x167
                    if(int(MySPPawn.Role) == int(ROLE_Authority))
                    {
                        LPPlayerController(MySPPawn.Controller).HackDeployableEvent_OperateComplete(HackableComponent);
                    }
                    PlaybackStage = 2;
                }
                // End:0x31D
                break;
            // End:0x248
            case 2:
                bDone = (PlaySequence()) != none;
                // End:0x245
                if(!bDone)
                {
                    // End:0x211
                    if(int(MySPPawn.Role) == int(ROLE_Authority))
                    {
                        LPPlayerController(MySPPawn.Controller).HackDeployableEvent_CompleteComplete(HackableComponent);
                    }
                    bDone = true;
                    MySPPawn.EndSpecialMove(Class);
                }
                // End:0x31D
                break;
            // End:0x31A
            case 3:
                bDone = (PlaySequence()) != none;
                // End:0x317
                if(!bDone)
                {
                    // End:0x2E3
                    if(int(MySPPawn.Role) == int(ROLE_Authority))
                    {
                        LPPlayerController(MySPPawn.Controller).HackDeployableEvent_AbortComplete(HackableComponent);
                    }
                    bDone = true;
                    MySPPawn.EndSpecialMove(Class);
                }
                // End:0x31D
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

simulated function AbortHack()
{
    // End:0x4C
    if((int(PlaybackStage) != int(3)) && int(PlaybackStage) != int(2))
    {
        bAbortedByController = true;
        PlaybackStage = 3;
        PlayNextSequence();
    }
    //return;    
}

simulated function CompleteHack()
{
    // End:0x155
    if((int(PlaybackStage) != int(3)) && int(PlaybackStage) != int(2))
    {
        bCompletedByController = true;
        // End:0xBC
        if(int(PlaybackStage) == int(0))
        {
            // End:0xB9
            if(int(MySPPawn.Role) == int(ROLE_Authority))
            {
                LPPlayerController(MySPPawn.Controller).HackDeployableEvent_PrepareComplete(HackableComponent);
            }            
        }
        else
        {
            // End:0x13F
            if(int(PlaybackStage) == int(1))
            {
                // End:0x13F
                if(int(MySPPawn.Role) == int(ROLE_Authority))
                {
                    LPPlayerController(MySPPawn.Controller).HackDeployableEvent_OperateComplete(HackableComponent);
                }
            }
        }
        PlaybackStage = 2;
        PlayNextSequence();
    }
    //return;    
}

simulated function IsOperating()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return int(PlaybackStage) == int(1);
    //return ReturnValue;    
}

simulated function OnAnimDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    switch(PlaybackStage)
    {
        // End:0x9B
        case 0:
            // End:0x82
            if(MySPPawn.Controller != none)
            {
                LPPlayerController(MySPPawn.Controller).HackDeployableEvent_PrepareComplete(HackableComponent);
            }
            PlaybackStage = 1;
            PlayNextSequence();
            // End:0x269
            break;
        // End:0x128
        case 1:
            // End:0x10F
            if(int(MySPPawn.Role) == int(ROLE_Authority))
            {
                LPPlayerController(MySPPawn.Controller).HackDeployableEvent_OperateComplete(HackableComponent);
            }
            PlaybackStage = 2;
            PlayNextSequence();
            // End:0x269
            break;
        // End:0x1C7
        case 2:
            // End:0x19C
            if(int(MySPPawn.Role) == int(ROLE_Authority))
            {
                LPPlayerController(MySPPawn.Controller).HackDeployableEvent_CompleteComplete(HackableComponent);
            }
            MySPPawn.EndSpecialMove(Class);
            // End:0x269
            break;
        // End:0x266
        case 3:
            // End:0x23B
            if(int(MySPPawn.Role) == int(ROLE_Authority))
            {
                LPPlayerController(MySPPawn.Controller).HackDeployableEvent_AbortComplete(HackableComponent);
            }
            MySPPawn.EndSpecialMove(Class);
            // End:0x269
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
    RMMode = 3;
    CurrAnimSequence = MySPPawn.PlayFullBodyAnimation(AnimationList[int(PlaybackStage)].AnimName, OnAnimDone,, AnimationList[int(PlaybackStage)].PlayBackRate, 0.2500000, 0.2500000, AnimationList[int(PlaybackStage)].bLooped, true, TranslationExtraction, RotationExtraction, true, RMMode);
    // End:0x251
    if(CurrAnimSequence != none)
    {
        ChoreographyParams.AlignmentType = 0;
        ChoreographyParams.MySequence = CurrAnimSequence;
        ChoreographyParams.RotationMode = 1;
        ChoreographyParams.OtherTargetMovePercent = 0.0000000;
        ChoreographyParams.BlendTime = 0.5000000;
        ChoreographyParams.OtherTarget = HackableComponent.Owner;
        MySPPawn.StartPawnChoreography(ChoreographyParams);
    }
    return CurrAnimSequence;
    //return ReturnValue;    
}

defaultproperties
{
    bZeroVelocityOnSpecialMoveEnd=true
}