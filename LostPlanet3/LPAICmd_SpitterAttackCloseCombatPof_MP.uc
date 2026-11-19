class LPAICmd_SpitterAttackCloseCombatPof_MP extends LPAICmd_SpitterAttack within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextTailSwipeAttackTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxNumConsecutiveTailStrikes;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ContinueCloseCombatCheckDelay;

function Pushed()
{
    Outer.SpitterPawn.SetAiming(false);
    MaxNumConsecutiveTailStrikes = 2;
    Outer.SetCSA(1);
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.SpitterPawn.SetMaxSpeedScale(1.0000000);
    Outer.ReleaseStrikeAccess();
    Outer.SetCSA(0);
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function IsTimeForNextTailSwingAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if((CurTime()) > NextTailSwipeAttackTime)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldContinueCloseCombat()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x72
    if(Outer.SpitterPawn.IsTeenSpitter() && Outer.SpitterPawn.IsSinglePlayerGame())
    {
        return true;
    }
    return Outer.ShouldCloseCombat(EnemyForAttack);
    //return ReturnValue;    
}

function DecideWhatToDo()
{
    local /*0x97E50000-0x00000000*/ private float Seperation;

    Seperation = EnemySeperation2D();
    // End:0x2C
    if(AttackEvaluaterReactive(Seperation))
    {
        return;
    }
    // End:0xA9
    if(!Outer.HaveStrikeAccess())
    {
        RequestStrikeAccess(EnemyForAttack);
        // End:0xA9
        if(!Outer.HaveStrikeAccess())
        {
            Outer.PopCommand(self);
            return;
        }
    }
    GotoAttackState('TailStingQuick');
    //return;    
}

function GotoDefaultAttackState()
{
    Outer.SetWantsNewEnemy(true);
    SetInterruptible(true);
    GotoState('DefaultState');
    //return;    
}

function GetEnemyTooFarDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 300.0000000;
    //return ReturnValue;    
}

protected function AttackEvaluater()
{
    DecideWhatToDo();
    //return;    
}

function SetTunables()
{
    super.SetTunables();
    StalkSpeedScale = Outer.SpitterPawn.StalkSpeedScalePof;
    AttackSpeedScale = Outer.SpitterPawn.AttackSpeedScalePof;
    AttackSelection = Outer.SpitterPawn.AttackSelectionPofNotResinedSpitDisabled;
    //return;    
}

event LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    ContinueCloseCombatCheckDelay -= DeltaTime;
    // End:0x65
    if(ContinueCloseCombatCheckDelay <= float(0))
    {
        // End:0x56
        if(!ShouldContinueCloseCombat())
        {
            Outer.PopCommand(self);
            return;
        }
        ContinueCloseCombatCheckDelay = 0.2500000;
    }
    super(LPAICommand).LPCommandTick(DeltaTime);
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        //return;        
    }
Begin:

    Outer.Sleep(0.0010000);
    GotoState('InitialState');
    stop;                    
}

state ChargeTaunt
{Begin:

    Outer.Sleep(0.0100000);
    SetInterruptible(false);
    Outer.SetWantsNewEnemy(false);
    Outer.CmdSpitterTaunt(EnemyForAttack, 2, 1.0000000);
    Outer.Sleep(0.0100000);
    GotoAttackState('TailStingQuick');
    stop;            
}

state InitialState
{
    function ChargeEnemy()
    {
        // End:0x2C
        if((EnemySeperation2D()) > float(1500))
        {
            GotoAttackState('ChargeTaunt');            
        }
        else
        {
            DecideWhatToDo();
        }
        //return;        
    }
Begin:

    Outer.Sleep(0.0100000);
    RequestStrikeAccess(EnemyForAttack);
    ChargeEnemy();
    stop;        
}

state DefaultState
{Begin:

    Outer.Sleep(0.0010000);
    DecideWhatToDo();
    stop;                    
}

state TailStingQuick
{
    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(TailSting).BeginState(PreviousState);
        Outer.EnableRotation(true);
        SetAttackSpeedScale();
        Outer.SpitterPawn.SetMaxSpeedScale(1.6000000);
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        super(TailSting).EndState(NextState);
        SetDefaultSpeedScale();
        //return;        
    }

    function DoTailSting()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Cmd;

        Cmd = Outer.CmdTailStingQuick(EnemyForAttack, 0.0000000, 1);
        Cmd.bDoTransitionInToAttack = false;
        //return;        
    }

    function ShouldMoveAwayAfterAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function GotoDefaultAttackState()
    {
        MaxNumConsecutiveTailStrikes--;
        // End:0xAF
        if(MaxNumConsecutiveTailStrikes <= 0)
        {
            // End:0x8D
            if(Outer.SpitterPawn.IsTeenSpitter() && Outer.SpitterPawn.IsSinglePlayerGame())
            {                
            }
            else
            {
                Outer.PopCommand(self);
                return;
            }
        }
        Outer.SetWantsNewEnemy(true);
        SetInterruptible(true);
        GotoState('DefaultState');
        //return;        
    }
    stop;    
}

state MoveCloser
{
    function MoveClose()
    {
        local /*0x97E50000-0x00000000*/ private float MinDist, MaxDist;

        MinDist = 100.0000000;
        MaxDist = 300.0000000;
        ManeuverForAttack(MinDist, MaxDist, EnemyForAttack, false);
        //return;        
    }
    stop;    
}

state TailSwing
{Begin:

    Outer.Sleep(0.0100000);
    GetAttackAccess();
    // End:0x102
    if(((IsEnabledTailSwingAttack()) && IsTimeForNextTailSwingAttack()) && HaveAttackAccess())
    {
        NextTailSwipeAttackTime = (CurTime()) + RandRange(TimeBetween_TailSwing_Min, TimeBetween_TailSwing_Max);
        Outer.CmdTailSwingStrike(EnemyForAttack);
        Outer.ReleaseStrikeAccess();
        Outer.SpitterPawn.ZeroMovementVariables();
    }
    GotoDefaultAttackState();
    stop;                
}

defaultproperties
{
    bInterruptible=false
}