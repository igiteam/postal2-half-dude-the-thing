class LPAICmd_VsLarocheBackOffToShowOffSaw extends LPAICmd_VsLarocheBackoffForDramaticDialogOpportunity within LPAIControllerVsLaroche;

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

function HandleDoneWithDialogSpecialMoveProcessing()
{
    // End:0x7D
    if(Outer.VsLarochePawn.GetCoreHealth(5) > float(0))
    {
        Outer.HandleBossFightPhaseEventMessage(Outer.MyLPEnemy, 17);
    }
    //return;    
}
