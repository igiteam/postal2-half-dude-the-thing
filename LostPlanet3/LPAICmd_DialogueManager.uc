class LPAICmd_DialogueManager extends LPAICommand within LPAIController;

state StateCmdActive
{    J0x00:
    // End:0x24 [Loop If]
    if(true)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x00;
    }
    Outer.PopCommand(self);
    stop;                
}
