class LPAICmd_SpitterAttackTalon extends LPAICmd_SpitterStrike within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTalonStrikeFinished;

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    Outer.Focus = none;
    //return;    
}

function Popped()
{
    super.Popped();
    OnExit();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    OnExit();
    //return;    
}

function OnExit()
{
    Outer.MeleeFinished();
    Outer.ResetRotationRate();
    Outer.LockStrikeAccess(false);
    Outer.Focus = none;
    Outer.SpitterPawn.EndSpecialMove(Class'LPSM_SpitterAttackTalonLeft');
    Outer.SpitterPawn.EndSpecialMove(Class'LPSM_SpitterAttackTalonRight');
    Outer.SpitterPawn.EndSpecialMove(Class'LPSM_SpitterAttackTalonRightLowered');
    Outer.SpitterPawn.EndSpecialMove(Class'LPSM_SpitterAttackTalonLeftLowered');
    //return;    
}

function On_LPSM_SpitterTalonStrike_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bTalonStrikeFinished = true;
    Outer.DoPendingDelayedMeleeDamage();
    //return;    
}

function StartSpitterTalonStrike()
{
    bTalonStrikeFinished = false;
    Outer.EnableDelayedMeleeDamage();
    // End:0x93
    if(FRand() <= 0.5000000)
    {
        Outer.SpitterPawn.DoSpecialMove(Class'LPSM_SpitterAttackTalonLeft', true, false, On_LPSM_SpitterTalonStrike_Finished, EnemyForStrike);        
    }
    else
    {
        Outer.SpitterPawn.DoSpecialMove(Class'LPSM_SpitterAttackTalonRight', true, false, On_LPSM_SpitterTalonStrike_Finished, EnemyForStrike);
    }
    //return;    
}

simulated event NotifyStopPawnChoreography()
{
    Outer.Focus = none;
    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curTargetDodge;

    // End:0x21A
    if(Outer.SpitterPawn.bInDodgeWindow)
    {
        curTargetDodge = LPSM_PlayerDodgeBase(EnemyForStrike.SpecialMoveState.CurSMInstance);
        // End:0x21A
        if(((curTargetDodge != none) && curTargetDodge.IsA('LPSM_PlayerDodgeSpitterTalonRight')) || curTargetDodge.IsA('LPSM_PlayerDodgeSpitterTalonLeft'))
        {
            Outer.SpitterPawn.StopPawnChoreography();
            Outer.Focus = none;
            Outer.SetFocalPoint(Outer.SpitterPawn.Location + (Vector(Outer.SpitterPawn.Rotation) * float(1000)), true);
            Outer.SpitterPawn.EnableLineSweepHitTester(false);
            Outer.IgnoreDelayedMeleeDamageOn(EnemyForStrike);
        }
    }
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        bTalonStrikeFinished = false;
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.PawnZeroVelocity();
    // End:0x10F
    if(Outer.CanBeMyEnemy(EnemyForStrike))
    {
        Outer.Focus = EnemyForStrike;
        Outer.EnableRotation(true);
        Outer.CmdTurnToFaceFocus(0);
        Outer.EnableRotation(false);
        StartSpitterTalonStrike();
        J0xE0:

        // End:0x10F [Loop If]
        if(!bTalonStrikeFinished)
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0xE0;
        }
    }
    Outer.PopCommand(self);
    stop;                    
}
