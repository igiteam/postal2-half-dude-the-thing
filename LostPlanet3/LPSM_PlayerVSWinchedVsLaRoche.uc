class LPSM_PlayerVSWinchedVsLaRoche extends LPSM_PlayerVSWinchedLargePawn
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttachedVsLaRoche;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Accumulator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeAccum;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDidShock;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGotShocked;

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

    // End:0x0F
    if(bGotShocked)
    {
        return false;
    }
    return (Accumulator <= MyTuneData.AnimPctgFailed) && TimeAccum > (MyTuneData.InitTimeCanNotLose * PlayerPawn.StruggleSettings.TimeFactorPhaseButtonCanNotLose);
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], FacingVsLaRoche;

    super.SpecialMoveStarted(bForced, PrevMove);
    PlayerPawn = LPVSPlayerPawn(MySPPawn);
    LPC = LPPlayerController(MySPPawn.Controller);
    AttachedVsLaRoche = LPAIPawnVsLaroche(AttachedPawn);
    AttachedVsLaRoche.ZeroMovementVariables();
    // End:0x154
    if(((AttachedVsLaRoche != none) && AttachedVsLaRoche.MyVsLarocheController != none) && !AttachedVsLaRoche.MyVsLarocheController.bHasJimTaseredLarocheYet)
    {
        AttachedVsLaRoche.MyVsLarocheController.HandleBossFightPhaseEventMessage(PlayerPawn, 31);
    }
    MyTuneData = PlayerPawn.TuneDataWinchStruggleVsPlayerVsLaroche;
    bDidShock = false;
    bGotShocked = false;
    MySPPawn.ZeroMovementVariables();
    FacingVsLaRoche = Rotator(AttachedVsLaRoche.Location - PlayerPawn.Location);
    LPC.TurnToFace(0.5000000, FacingVsLaRoche);
    //return;    
}

function SetEndedControllerState()
{
    local /*0x97E50000-0x00000000*/ private @NULL myLPC[8388609];

    // End:0x39
    if(bGotShocked)
    {
        AttachedVsLaRoche.NotifyWonStruggleMode(PlayerPawn, self);        
    }
    else
    {
        super.SetEndedControllerState(myLPC);
    }
    //return;    
}

function DragSetup()
{
    super.DragSetup();
    TimeAccum = 0.0000000;
    // End:0x6C
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

function GotShocked()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyPlayingAnimSeq;

    bGotShocked = true;
    LPC.GotoState('VSEMPShutdown');
    PlayerPawn.TaserLineCreateParticleSystem();
    MyPlayingAnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(7), EndTazerOut);
    // End:0xCD
    if(MyPlayingAnimSeq == none)
    {
        MySPPawn.EndCurrentSpecialMove(self);
    }
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
    if(AttachedVsLaRoche.WorldInfo.bPlayersOnly)
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
    super.AddForward();
    //return;    
}

function DoVSShock()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MyPlayingAnimSeq;

    // End:0x260
    if(!bDidShock && !bGotShocked)
    {
        bDidShock = true;
        bEndSpecialMoveOnInvalidFollower = false;
        MySPPawn.ZeroMovementVariables();
        DragEnded();
        CleanupAttachedPawn();
        // End:0x111
        if(((AttachedVsLaRoche != none) && AttachedVsLaRoche.MyVsLarocheController != none) && !AttachedVsLaRoche.MyVsLarocheController.bHasJimTaseredLarocheYet)
        {
            AttachedVsLaRoche.MyVsLarocheController.bHasJimTaseredLarocheYet = true;
        }
        PlayerPawn.TaserLineCreateParticleSystem();
        AttachedVsLaRoche.MyVsLarocheController.CmdHitReactionToStun(AttachedVsLaRoche.TuneDataAIPawn.DurationOfShockStun.GetValue(), Class'LPSM_VsLarocheTazed', Class'LPSM_VsLarocheTazedStunStart', Class'LPSM_VsLarocheTazedStunFinish', LPPawn(MySPPawn));
        MyPlayingAnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(4), EndTazerIn,,, 0.2500000);
        // End:0x25E
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
    super.DragEnded();
    //return;    
}

function TransitionToGrab()
{
    DragEnded();
    MySPPawn.EndCurrentSpecialMove(self);
    LPAIController(AttachedVsLaRoche.Controller).CmdHitReactionToStun(AttachedVsLaRoche.TuneDataVsLaroche.DurationOfWinchedStun.GetValue(), Class'LPSM_VsLaRocheWinchedStun', Class'LPSM_VsLaRocheWinchedStunStart', Class'LPSM_VsLaRocheWinchedStunFinish', LPPawn(MySPPawn));
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
    return LPSM_VsLarocheWinched(FollowerSMInstance).StartAnimation(Index);
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
    return LPSM_VsLarocheWinched(FollowerSMInstance).StartAnimation(Index);
    //return ReturnValue;    
}

defaultproperties
{
    bShowTaserHelp=true
    FollowerSpecialMoveClass=Class'LPSM_VsLarocheWinched'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}