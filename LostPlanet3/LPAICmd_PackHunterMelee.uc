class LPAICmd_PackHunterMelee extends LPAICmd_Melee within LPAIControllerPackHunter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PackHunterPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSavedDoOnlyForcedDirectAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitForClearenceSpecialMovePlaying[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class WaitForClearenceSpecialMove[536870913];

function Pushed()
{
    super.Pushed();
    Outer.bUseAIResourceForEngagement = true;
    PackHunterPawn = LPAIPawnPackHunter(Outer.myAIPawn);
    bSavedDoOnlyForcedDirectAttack = Outer.bDoOnlyForcedDirectAttack;
    bWaitForClearenceSpecialMovePlaying = false;
    GetWaitForClearenceSpecialMove();
    //return;    
}

function Popped()
{
    Outer.bDoOnlyForcedDirectAttack = bSavedDoOnlyForcedDirectAttack;
    EndWaitForClearenceSpecialMove();
    // End:0x77
    if(Outer.CurrentCombatMgrResourceRef != none)
    {
        Outer.ReleaseEngagementAccess();
    }
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0x3B
    if(EnemyForAttack != InEnemy)
    {
        Outer.LastDashAttackTime = 0.0000000;
    }
    super(LPAICmd_Attack).SetDesiredEnemy(InEnemy);
    Outer.GetEngagementAccess(InEnemy);
    //return;    
}

function SetForcedDirectAttack()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];

    // End:0x35
    if(!bForced && Outer.bIndoorBehavior)
    {
        return;
    }
    Outer.bDoOnlyForcedDirectAttack = bForced;
    //return;    
}

function HasAttackWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        return EnemyForAttack.AIResourceManager.HasTimerExpired('PackHunterAttackTimer');        
    }
    else
    {
        return super.HasAttackWaitTimerExpired();
    }
    //return ReturnValue;    
}

function ResetAttackWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x99
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        EnemyForAttack.AIResourceManager.ResetTimerRange('PackHunterAttackTimer', MinTime, MaxTime);        
    }
    else
    {
        super.ResetAttackWaitTimer(MinTime, MaxTime);
    }
    //return;    
}

function GetWaitForClearenceSpecialMove()
{
    WaitForClearenceSpecialMove = Outer.PHPawn.TuneDataPackHunter.WaitForMeleeFormationClearenceSpecialMove;
    //return;    
}

function On_LPSM_WaitForClearenceSpecialMove_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bWaitForClearenceSpecialMovePlaying = false;
    //return;    
}

function StarWaitForClearenceSpecialMove()
{
    bWaitForClearenceSpecialMovePlaying = true;
    Outer.PHPawn.DoSpecialMove(WaitForClearenceSpecialMove, true, true, On_LPSM_WaitForClearenceSpecialMove_Finished);
    //return;    
}

function EndWaitForClearenceSpecialMove()
{
    // End:0x56
    if(bWaitForClearenceSpecialMovePlaying)
    {
        bWaitForClearenceSpecialMovePlaying = false;
        Outer.PHPawn.EndSpecialMove(WaitForClearenceSpecialMove);
    }
    //return;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess;

    ResourceAccess = SPAIResourceAccess(ResAccess);
    Outer.bMeleePointMoved = (ResourceAccess != none) && ResourceAccess == Outer.MeleeAccess;
    return false;
    //return ReturnValue;    
}

function GetStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    -1.0000000
    false
    super(LPAICommand).GetStrikeAccess(TheEnemy, RevokeTolerance, bForced);
    Outer.LockStrikeAccess(false);
    //return;    
}

function SetMeleeExtents()
{
    // End:0x89
    if(Outer.ShouldUseMeleeResource())
    {
        EnemyForAttack.AIResourceManager.GetResourceLocationExtents(Outer.MeleeResourceName, MeleePatternCenter, MeleePatternRadius);        
    }
    else
    {
        super.SetMeleeExtents();
    }
    //return;    
}

function IsUsingStaticMelee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveMeleeAccess() && Outer.MeleeAccess.GetResourceName() == 'PackHunterFormation';
    //return ReturnValue;    
}

function IsInsideStaticMeleePattern()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float InPatternRadius;

    // End:0x8C
    if(IsUsingStaticMelee())
    {
        SetMeleeExtents();
        InPatternRadius = MeleePatternRadius * 1.1000000;
        // End:0x8C
        if(VSizeSq(MeleePatternCenter - Outer.myAIPawn.Location) < (InPatternRadius * InPatternRadius))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

state MoveCloserToEnemy
{Begin:

    // End:0x17
    if(bCanStrikeBeforeReachingMeleeSlot)
    {
        StartLookForAttackOpportunityWhileMovingTimer();
    }
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

state WaitForClearence
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        EndWaitForClearenceSpecialMove();
        Outer.Focus = none;
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event PoppedState()
    {
        EndWaitForClearenceSpecialMove();
        super(SPStateObject).PoppedState();
        //return;        
    }
Begin:

    Outer.Focus = EnemyForAttack;
    StarWaitForClearenceSpecialMove();
    J0x32:

    // End:0x5F [Loop If]
    if(bWaitForClearenceSpecialMovePlaying)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x32;
    }
    Outer.Focus = none;
    GotoStateWithEnemyCheck('GetMeleeFormationClearence');
    stop;        
}

defaultproperties
{
    bShouldStalk=true
    MinAttackRange=200.0000000
    MaxAttackRange=250.0000000
}