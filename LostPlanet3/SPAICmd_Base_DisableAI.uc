class SPAICmd_Base_DisableAI extends SPAICommand within SPAIController;

function Pushed()
{
    super.Pushed();
    GotoState('DisableAI');
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

state DisableAI
{    J0x00:
    // End:0x24 [Loop If]
    if(true)
    {
        Outer.Sleep(0.3000000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;                
}
