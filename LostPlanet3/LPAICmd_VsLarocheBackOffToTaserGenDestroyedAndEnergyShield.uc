class LPAICmd_VsLarocheBackOffToTaserGenDestroyedAndEnergyShield extends LPAICmd_VsLarocheBackoffForDramaticDialogOpportunity within LPAIControllerVsLaroche;

function Pushed()
{
    Outer.MyLPEnemy.TriggerEventClass(Class'LPSeqEvent_VitalSuitLaRocheCriticalDialog', Outer.VsLarochePawn, 4);
    super.Pushed();
    //return;    
}

function Popped()
{
    // End:0x58
    if(Outer.VsLarochePawn != none)
    {
        Outer.VsLarochePawn.StopTaser();
    }
    Outer.ChangeCurrentLarocheMacroCombatState(4);
    super.Popped();
    //return;    
}
