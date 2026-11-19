class LPSM_PlayerVSWinchedCarrier extends LPSM_PlayerVSWinchedLargePawn
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttachedCarrier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Accumulator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeAccum;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDidShock;

function GetDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000 - Accumulator;
    //return ReturnValue;    
}

function GetDragEndDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000 - MyTuneData.AnimPctgSuccess;
    //return ReturnValue;    
}

function CheckTimeout()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (Accumulator <= MyTuneData.AnimPctgFailed) && TimeAccum > (MyTuneData.InitTimeCanNotLose * PlayerPawn.StruggleSettings.TimeFactorPhaseButtonCanNotLose);
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], FacingCarrier;

    super.SpecialMoveStarted(bForced, PrevMove);
    PlayerPawn = LPBasePlayerPawn(MySPPawn);
    LPC = LPPlayerController(MySPPawn.Controller);
    AttachedCarrier = LPAIPawnCarrier(AttachedPawn);
    AttachedCarrier.ZeroMovementVariables();
    MyTuneData = LPVSPlayerPawn(MySPPawn).TuneDataStruggleVsPlayerCarrier;
    bDidShock = false;
    FacingCarrier = Rotator(AttachedCarrier.Location - PlayerPawn.Location);
    LPC.TurnToFace(0.5000000, FacingCarrier);
    //return;    
}

function DragSetup()
{
    super.DragSetup();
    DisplayUI(true);
    TimeAccum = 0.0000000;
    // End:0x77
    if(MyTuneData.AnimStartPctg >= 0.0000000)
    {
        Accumulator = MyTuneData.AnimStartPctg;        
    }
    else
    {
        Accumulator = MyTuneData.AnimPctgFailed + ((MyTuneData.AnimPctgSuccess - MyTuneData.AnimPctgFailed) / float(2));
    }
    UpdateProgress();
    //return;    
}

function DisplayUI()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    LPC.DisplayStruggleMessage(bOn);
    //return;    
}

function UpdateProgress()
{
    LPC.SetStruggleButtonStrength(Accumulator);
    //return;    
}

function DragUpdate()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], amountToFightAgainst;

    // End:0x0F
    if(bDidShock)
    {
        return;
    }
    // End:0x55
    if(AttachedCarrier.WorldInfo.bPlayersOnly)
    {
        DeltaTime = 0.0000000;
    }
    TimeAccum += DeltaTime;
    amountToFightAgainst = MyTuneData.EnemyPushAtStart + (Accumulator * (MyTuneData.EnemyPushAtEnd - MyTuneData.EnemyPushAtStart));
    // End:0x163
    if(TimeAccum >= MyTuneData.TimeIncreasesDifficulty)
    {
        amountToFightAgainst *= (1.0000000 + ((TimeAccum - MyTuneData.TimeIncreasesDifficulty) * MyTuneData.RatioIncreasesDifficulty));
    }
    Accumulator -= (DeltaTime * amountToFightAgainst);
    Accumulator = FClamp(Accumulator, 0.0000000, 1.0000000);
    UpdateProgress();
    //return;    
}

function AddForward()
{
    Accumulator += MyTuneData.PlayerPushEachButton;
    Accumulator = FClamp(Accumulator, 0.0000000, 1.0000000);
    super.AddForward();
    //return;    
}

function DoVSShock()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MyPlayingAnimSeq;

    // End:0x193
    if(!bDidShock)
    {
        bDidShock = true;
        bEndSpecialMoveOnInvalidFollower = false;
        DragEnded();
        CleanupAttachedPawn();
        LPVSPlayerPawn(MySPPawn).TaserLineCreateParticleSystem();
        AttachedCarrier.MyCarrierController.CmdHitReactionToStun(AttachedCarrier.TuneDataAIPawn.DurationOfShockStun.GetValue(), Class'LPSM_CarrierTazed', Class'LPSM_CarrierTazedStunStart', Class'LPSM_CarrierTazedStunFinish', LPVSPlayerPawn(MySPPawn));
        MyPlayingAnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(4), EndTazerIn,,, 0.2500000);
        // End:0x191
        if(MyPlayingAnimSeq == none)
        {
            MySPPawn.EndCurrentSpecialMove(self);
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function EndTazerIn()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyPlayingAnimSeq;

    MyPlayingAnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(5), EndTazerCycle);
    // End:0x7F
    if(MyPlayingAnimSeq == none)
    {
        MySPPawn.EndCurrentSpecialMove(self);
    }
    //return;    
}

function EndTazerCycle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyPlayingAnimSeq;

    // End:0x2F
    if(Winch != none)
    {
        Winch.FinishInteractingWithLargePawn(false);
    }
    MyPlayingAnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(6), EndTazerOut,,,, 0.2500000);
    // End:0xB2
    if(MyPlayingAnimSeq == none)
    {
        MySPPawn.EndCurrentSpecialMove(self);
    }
    //return;    
}

function EndTazerOut()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

function DragEnded()
{
    DisplayUI(false);
    super.DragEnded();
    //return;    
}

function TransitionToGrab()
{
    DragEnded();
    MySPPawn.DoSpecialMove(Class'LPSM_PlayerVSTripCarrier', true,,, AttachedCarrier);
    LPAIController(AttachedCarrier.Controller).CmdHitReactionToStun(AttachedCarrier.TuneDataCarrier.DurationOfTripStun.GetValue(), Class'LPSM_CarrierTripped', Class'LPSM_CarrierTrippedStunStart', Class'LPSM_CarrierTrippedStunFinish', LPPawn(MySPPawn));
    //return;    
}

function ImpactFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    animationState = 1;
    ImpactToDragFinishedCB(Node, InUserData, bInterrupted);
    //return;    
}

function StartAnimationChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL Leader[8388609], Follower;
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private bool bHoldLastFrame[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> MyEndDelegate[8388609], TheirEndDelegate;
    local /*0x97E50000-0x00000000*/ private bool bRestartIfPlaying[9437185];
    local /*0x97E50000-0x00000000*/ private float BlendTime[9437185];
    local /*0x97E50000-0x00000000*/ private bool bLeaderUpperBody[9437185];
    local /*0x97E50000-0x00000000*/ private float PreferredMovementPercent[9437185], PlayRate;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeq;

    true
    0.2500000
    false
    0.5000000
    1.0000000
    AnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(Index), MyEndDelegate,, PlayRate, 0.2000000, 0.2500000, false,, 2, 2, true);
    // End:0xB9
    if(AnimSeq != none)
    {
        AnimSeq.SetIssueAnimFinishedCallbackOnInterruption(true);        
    }
    else
    {
        ScriptTrace();
        MyAbortedCallback = MyEndDelegate;
        MySPPawn.SetTimer(0.2000000, false, 'ChoreographyFailed', self);
    }
    return LPSM_CarrierWinched(FollowerSMInstance).StartAnimation(Index, false);
    //return ReturnValue;    
}

function StartChoreographedAnimationLooped()
{
    local /*0x97E50000-0x00000000*/ private @NULL Leader[8388609], Follower;
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private float BlendTime[9437185], PlayRate, PreferredMovementPercent;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeq;

    0.2500000
    1.0000000
    0.5000000
    AnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(Index),,, PlayRate, 0.2000000, 0.2500000, true,, 2, 2, true);
    // End:0xA6
    if(AnimSeq != none)
    {
        AnimSeq.SetIssueAnimFinishedCallbackOnInterruption(true);        
    }
    else
    {
        ScriptTrace();
    }
    return LPSM_CarrierWinched(FollowerSMInstance).StartAnimation(Index, true);
    //return ReturnValue;    
}

defaultproperties
{
    bShowTaserHelp=true
    FollowerSpecialMoveClass=Class'LPSM_CarrierWinched'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}