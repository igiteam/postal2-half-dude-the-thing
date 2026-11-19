class LPAICmd_CrabPincerStrikeVs extends LPAICmd_CrabPincerStrike within LPAIControllerBaseSnowCrab;

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

function On_LPSM_SnowCrabAttackPincerVs_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bMeleePincerFinished = true;
    //return;    
}

function StartMeleeVs()
{
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabAttackPincerVS', true, false, On_LPSM_SnowCrabAttackPincerVs_Finished);
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
    J0x00:
    // End:0xCA [Loop If]
    if(!Outer.IsTimeForNextPincerBash())
    {
        Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
        // End:0xC7
        if(!Outer.IsInBashZone(EnemyForStrike.Location, false))
        {
            Outer.MeleeFinished();
            Outer.PopCommand(self);
        }
        // [Loop Continue]
        goto J0x00;
    }
    StartMeleeVs();
    J0xD4:

    // End:0x107 [Loop If]
    if(!bMeleePincerFinished)
    {
        Outer.Sleep(SleepTimeInSecsDuringAttackUpdate);
        // [Loop Continue]
        goto J0xD4;
    }
    Outer.MeleeFinished();
    Outer.PopCommand(self);
    stop;        
}
