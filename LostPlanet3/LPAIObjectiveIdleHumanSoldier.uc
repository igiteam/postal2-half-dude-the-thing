class LPAIObjectiveIdleHumanSoldier extends LPAIObjectiveIdle within LPAIController
    hidecategories(Object,Object);

protected function PerformObjective()
{
    CmdHSIdle();
    Status = 1;
    //return;    
}

function CmdHSIdle()
{
    local /*0x97E50000-0x00000000*/ private float Duration[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    10.0000000
    0
    // End:0x61
    if(int(CmdOption) == int(0))
    {
        Outer.AbortCommand(Outer.CommandList);
    }
    myCommand = LPAICmd_HSIdle(Class'LPAICmd_HSIdle'.static.InitObjectiveCommand(Outer, self));
    return myCommand;
    //return ReturnValue;    
}
