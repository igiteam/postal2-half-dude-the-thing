class LPAICmd_Act1BossStruggleModeBridge extends LPAICmd_StrugglePofStrike within LPAIControllerAct1Boss;

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PlayerAct1BossStruggle';
    //return ReturnValue;    
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

    SetInterruptible(false);
    Outer.Focus = none;
    Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
    Outer.PawnZeroVelocity();
    EnemyForStrike.ServerDoSpecialMove(GetStruggleSpecialMoveClass(), true, false, self.OnLeaderSpecialMoveFinished, Outer.myAIPawn);
    J0xDF:

    // End:0x103 [Loop If]
    if(true)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xDF;
    }
    Outer.PopCommand(self);
    stop;                    
}
