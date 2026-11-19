class LPAICmd_LeechMelee extends LPAICmd_Melee within LPAIControllerLeech;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationMeleeAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedFlee;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurDamageAssessmentCmd[536870913];

function Pushed()
{
    super.Pushed();
    TimeStartedFlee = -1.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ReleaseAttackAccess();
    Outer.ClearTimer('ReactToStartMelee', self);
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    Outer.ReleaseAttackAccess();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetDefaultAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.LeechPawn.TuneDataLeech.StruggleStrikeStartDistance * 1.5000000;
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

function ShouldAbortFlee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeFleeing;

    timeFleeing = Outer.WorldInfo.TimeSeconds - TimeStartedFlee;
    // End:0xB6
    if(timeFleeing > Outer.LeechPawn.TuneDataLeech.MinFleeTime.GetValue())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function NotifyPlayerStartMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bHandled;

    bHandled = super(LPAICommand).NotifyPlayerStartMelee(PlayerPawn);
    // End:0x9C
    if(!bHandled)
    {
        Outer.SetTimer(FRand() * Outer.LeechPawn.TuneDataLeech.JumpBackMaxRandomLag, false, 'ReactToStartMelee', self);
    }
    return true;
    //return ReturnValue;    
}

function ReactToStartMelee()
{
    GotoState('ReactToMelee');
    //return;    
}

function FleeFromEnemy()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom;
    local /*0x97E50000-0x00000000*/ private @NULL Cmd;
    local /*0x97E50000-0x00000000*/ private float FleeDistance;

    FleeDistance = Outer.LeechPawn.TuneDataLeech.FleeDistance.GetValue();
    TimeStartedFlee = Outer.WorldInfo.TimeSeconds;
    FleeFrom.AddItem(EnemyForAttack);    
    Cmd = Outer.CmdFlee(Outer.LeechPawn.TuneDataLeech.MaxFleeTime.GetValue(), FleeDistance * float(10), FleeDistance, FleeFrom, 1);
    Cmd.__FleeAbortDelegate__Delegate = ShouldAbortFlee;
    //return;    
}

state StrikeWithClearence
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super.BeginState(PrevStateName);
        Outer.PawnZeroVelocity();
        //return;        
    }
    stop;    
}

state WaitForClearence
{Begin:

    Outer.PawnZeroVelocity();
    J0x1F:

    // End:0x69 [Loop If]
    if(!HasAccessToStartAttack() || !HasAttackWaitTimerExpired())
    {
        FleeFromEnemy();
        Outer.Sleep(0.0010000);
        // [Loop Continue]
        goto J0x1F;
    }
    GotoStateWithEnemyCheck('BeginStrike');
    stop;                
}

state ReactToMelee
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x43
        if(CurDamageAssessmentCmd != none)
        {
            Outer.AbortCommand(CurDamageAssessmentCmd);
            CurDamageAssessmentCmd = none;
        }
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function NotifyPlayerStartMelee()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    CurDamageAssessmentCmd = Outer.CmdDamageAssessment(EnemyForAttack, 5.0000000, 5.0000000,, 1);
    CurDamageAssessmentCmd = none;
    GotoStateWithEnemyCheck('WaitForClearence');
    stop;            
}

defaultproperties
{
    bCanStrikeBeforeReachingMeleeSlot=true
    MinAttackRange=100.0000000
    MaxAttackRange=150.0000000
}