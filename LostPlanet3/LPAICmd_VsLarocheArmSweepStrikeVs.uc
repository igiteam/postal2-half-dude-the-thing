class LPAICmd_VsLarocheArmSweepStrikeVs extends LPAICmd_VsLarocheArmSweepStrike within LPAIControllerVsLaroche;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.VsLarochePawn.bPerformingMultiMoveMeleeStrike = false;
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x123
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0x123
        if((Info.Impact.HitActor == EnemyForStrike) && Outer.VsLarochePawn != none)
        {
            Outer.VsLarochePawn.StopPawnChoreography();
            bMeleeHitEnemy = true;
            ++Outer.NumOfMeleeHitsLandedOnEnemySinceLastStruggleMode;
        }
    }
    //return;    
}

function On_VsLarocheTalonSweepStrikePOF_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMeleePincerFinished = true;
    //return;    
}

function StartMeleeVs()
{
    Outer.VsLarochePawn.bPerformingMultiMoveMeleeStrike = true;
    Outer.ProcessRightArmAltAction();
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super.PushedState();
        //return;        
    }

    event PausedState()
    {
        super.PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super.ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
Begin:

    StartMeleeVs();
    J0x0A:

    // End:0x65 [Loop If]
    if(Outer.VsLarochePawn.bPerformingMultiMoveMeleeStrike)
    {
        Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
        // [Loop Continue]
        goto J0x0A;
    }
    Outer.MeleeFinished();
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    bInterruptible=false
}