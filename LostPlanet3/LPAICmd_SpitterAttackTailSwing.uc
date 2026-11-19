class LPAICmd_SpitterAttackTailSwing extends LPAICmd_SpitterStrike within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTailSwingStrikeFinished;

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
    Outer.SpitterPawn.EndSpecialMove(Class'LPSM_SpitterAttackTailSweep');
    //return;    
}

function On_LPSM_SpitterTailSwingStrike_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bTailSwingStrikeFinished = true;
    //return;    
}

function StartSpitterTailSwingStrike()
{
    bTailSwingStrikeFinished = false;
    Outer.SpitterPawn.DoSpecialMove(Class'LPSM_SpitterAttackTailSweep', true, false, On_LPSM_SpitterTailSwingStrike_Finished, EnemyForStrike);
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

    Outer.SpitterPawn.StopPawnChoreography();
    Outer.Focus = none;
    Outer.SetFocalPoint(Outer.SpitterPawn.Location + (Vector(Outer.SpitterPawn.Rotation) * float(1000)), true);
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        bTailSwingStrikeFinished = false;
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
    // End:0xC3
    if(Outer.CanBeMyEnemy(EnemyForStrike))
    {
        Outer.Focus = none;
        Outer.EnableRotation(false);
        StartSpitterTailSwingStrike();
        J0x94:

        // End:0xC3 [Loop If]
        if(!bTailSwingStrikeFinished)
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x94;
        }
    }
    Outer.PopCommand(self);
    stop;                    
}

defaultproperties
{
    bInterruptible=false
}