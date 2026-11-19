class LPAICmd_VsLarocheBackOffToJustTaserGenDestroyed extends LPAICmd_VsLarocheBackoffForDramaticDialogOpportunity within LPAIControllerVsLaroche;

function Pushed()
{
    Outer.MyLPEnemy.TriggerEventClass(Class'LPSeqEvent_VitalSuitLaRocheCriticalDialog', Outer.VsLarochePawn, 5);
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.ChangeCurrentLarocheMacroCombatState(2);
    super.Popped();
    //return;    
}
