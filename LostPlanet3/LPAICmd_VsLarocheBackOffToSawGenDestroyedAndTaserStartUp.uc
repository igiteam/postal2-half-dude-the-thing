class LPAICmd_VsLarocheBackOffToSawGenDestroyedAndTaserStartUp extends LPAICmd_VsLarocheBackoffForDramaticDialogOpportunity within LPAIControllerVsLaroche;

function Pushed()
{
    Outer.MyLPEnemy.TriggerEventClass(Class'LPSeqEvent_VitalSuitLaRocheCriticalDialog', Outer.VsLarochePawn, 2);
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.ChangeCurrentLarocheMacroCombatState(3);
    super.Popped();
    //return;    
}
