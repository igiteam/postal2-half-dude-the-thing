class LPSM_LargePawnWinchStun extends SPSM_FollowerPawnBase
    config(Game);

enum EStunAnims
{
    ESA_Impact,                     // 0
    ESA_Stun,                       // 1
    ESA_Release,                    // 2
    ESA_MAX                         // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StunnedPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte animationState;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Winch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StunEndTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowTaserHelp;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    StunnedPawn = LPAIPawn(MySPPawn);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    LPPlayerController(LeaderPawn.Controller).SetVSReticleHelpButton(10, false);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function StartAnimation()
{
    local /*0x97E50000-0x00000000*/ private bool InLooping[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> MyEndDelegate[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bSuccess;
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeq;

    // End:0xB2
    if(MySPPawn != none)
    {
        AnimSeq = MySPPawn.PlayFullBodyAnimationSequence(GetBestSequenceTemplateByIndex(int(animationState)), MyEndDelegate,, 1.0000000, 0.2500000, 0.2500000, InLooping,, 2, 2, true);
        // End:0xB2
        if(AnimSeq != none)
        {
            AnimSeq.SetIssueAnimFinishedCallbackOnInterruption(true);
            bSuccess = true;
        }
    }
    // End:0x108
    if(!bSuccess)
    {
        ScriptTrace();
        MyAbortedCallback = MyEndDelegate;
        MySPPawn.SetTimer(0.2000000, false, 'ChoreographyFailed', self);
        return false;
    }
    return bSuccess;
    //return ReturnValue;    
}

function StartInteraction()
{
    super(SPSM_LeaderFollowerBase).StartInteraction();
    Winch = LPWeaponVSWinch(LeaderPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0xC6
    if((Winch == none) || !Winch.StartInteractingWithLargePawn(StunnedPawn))
    {
        LeaderPawn.EndCurrentSpecialMove();
        MySPPawn.EndCurrentSpecialMove();
        return;
    }
    StunnedPawn.TemplateLogicData.GrabPointIndex = StunnedPawn.WinchPoints[Winch.GrabbedPawnWinchPointIndex].GrabPointIndex;
    animationState = 0;
    StartAnimation(false, ImpactFinishedCB);
    //return;    
}

function ImpactFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private float StunDuration;

    // End:0x153
    if(int(animationState) == int(0))
    {
        StunDuration = 4.0000000;
        StunEndTime = MySPPawn.WorldInfo.TimeSeconds + StunDuration;
        Winch.StartDraggingLargePawn();
        LeaderPawn.SetTimer(0.2000000, false, 'CleanupSound', Winch);
        MySPPawn.StopCustomAnim(0.2000000);
        animationState = 1;
        StartAnimation(true, None);
        // End:0x153
        if(bShowTaserHelp)
        {
            LPPlayerController(LeaderPawn.Controller).SetVSReticleHelpButton(10, true);
        }
    }
    //return;    
}

function Release()
{
    // End:0x3A
    if(Winch != none)
    {
        Winch.FinishInteractingWithLargePawn(false);
        Winch = none;
    }
    // End:0xCF
    if(((LeaderSMInstance != none) && ClassIsChildOf(LeaderSMInstance.Class, Class'LPSM_PlayerVSWinchStun')) && LeaderSMInstance == LeaderPawn.GetCurrentSpecialMoveInstance())
    {
        LPSM_PlayerVSWinchStun(LeaderSMInstance).StunFinished();
    }
    LPPlayerController(LeaderPawn.Controller).SetVSReticleHelpButton(10, false);
    animationState = 2;
    StartAnimation(false, ReleaseFinishedCB);
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(GameSpecialMove).Tick(DeltaTime);
    // End:0x74
    if((int(animationState) == int(1)) && StunEndTime <= MySPPawn.WorldInfo.TimeSeconds)
    {
        Release();
    }
    //return;    
}

function ReleaseFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x4D
    if(LeaderPawn.GetCurrentSpecialMoveInstance() == LeaderSMInstance)
    {
        LeaderPawn.EndCurrentSpecialMove();
    }
    MySPPawn.EndCurrentSpecialMove();
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MySPPawn.HitReactLogicAnimTree;
    //return ReturnValue;    
}

defaultproperties
{
    bShowTaserHelp=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
    DefaultAICommand=Class'LPAICmd_SpecialMoveBase'
}