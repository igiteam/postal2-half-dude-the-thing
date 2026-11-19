class LPAICmd_PackHunterSwipeAttack extends LPAICmd_Attack within LPAIControllerPackHunter;

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

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.CmdSpecialMove(Class'LPSM_PackHunterAttackAnnounce', false, 0.0000000, Outer.PHPawn.TuneDataPackHunter.MaxTimeForAttackAnnounce);
    Outer.Sleep(0.0100000);
    Outer.CmdMoveToActor(EnemyForAttack, none, Outer.PHPawn.TuneDataPackHunter.DistanceStopAndStrike,, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToStrike);
    Outer.Sleep(0.0100000);
    // End:0x1DC
    if(int(Outer.CmdStatus_MoveToActor.Cmd_Move_Error) == int(2))
    {
        Outer.CmdPackHunterSwipeStrikePof(EnemyForAttack,, 1);
    }
    Outer.Sleep(0.0100000);
    Outer.PopCommand(self);
    stop;            
}
