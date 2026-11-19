class LPAICmd_HectapodOrbit extends LPAICmd_Melee within LPAIControllerHectapod;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationMeleeAccess;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
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

    return Outer.HectapodPawn.TuneDataHectapod.DefaultStrikeRange;
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

function ShouldAbortFlee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    GetStrikeAccess(EnemyForAttack);
    return Outer.HaveStrikeAccess() && HasAttackWaitTimerExpired();
    //return ReturnValue;    
}

function FleeFromEnemy()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom;
    local /*0x97E50000-0x00000000*/ private @NULL Cmd;
    local /*0x97E50000-0x00000000*/ private float FleeDistance;

    FleeDistance = Outer.HectapodPawn.TuneDataHectapod.FleeDistance.GetValue();
    FleeFrom.AddItem(EnemyForAttack);    
    Cmd = Outer.CmdFlee(60.0000000, FleeDistance * float(10), FleeDistance, FleeFrom, 1);
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

state WaitForOrbitClearence
{Begin:

    Outer.PawnZeroVelocity();
    J0x1F:

    // End:0x93 [Loop If]
    if(!Outer.HaveStrikeAccess() || !HasAttackWaitTimerExpired())
    {
        FleeFromEnemy();
        Outer.Sleep(0.0010000);
        GetStrikeAccess(EnemyForAttack);
        // [Loop Continue]
        goto J0x1F;
    }
    GotoStateWithEnemyCheck('BeginStrike');
    stop;        
}

defaultproperties
{
    bCanStrikeBeforeReachingMeleeSlot=true
    MinAttackRange=100.0000000
    MaxAttackRange=150.0000000
}