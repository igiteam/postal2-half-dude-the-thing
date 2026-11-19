class LPAICmd_CarrierTalonThrustStrikeVs extends LPAICmd_CarrierTalonThrustStrike within LPAIControllerCarrier;

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

function On_CarrierTalonFlurryStrike_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMeleePincerFinished = true;
    //return;    
}

function StartMeleePoF()
{
    bMeleePincerFinished = false;
    Outer.CarrierPawn.DoSpecialMove(Class'LPSM_CarrierTalonThrustStrikeVs', true, false, On_CarrierTalonFlurryStrike_Finished, EnemyForStrike);
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

    StartMeleePoF();
    J0x0A:

    // End:0x3D [Loop If]
    if(!bMeleePincerFinished)
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