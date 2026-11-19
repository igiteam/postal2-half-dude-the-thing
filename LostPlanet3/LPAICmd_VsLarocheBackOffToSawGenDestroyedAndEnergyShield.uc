class LPAICmd_VsLarocheBackOffToSawGenDestroyedAndEnergyShield extends LPAICmd_VsLarocheBackoffForDramaticDialogOpportunity within LPAIControllerVsLaroche;

function Pushed()
{
    Outer.MyLPEnemy.TriggerEventClass(Class'LPSeqEvent_VitalSuitLaRocheCriticalDialog', Outer.VsLarochePawn, 3);
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.ChangeCurrentLarocheMacroCombatState(4);
    super.Popped();
    //return;    
}
