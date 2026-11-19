class LPAICmd_VsLarocheBackOffToHipDestroyedAndStartBackUpSawGen extends LPAICmd_VsLarocheBackoffForDramaticDialogOpportunity within LPAIControllerVsLaroche;

function Pushed()
{
    Outer.MyLPEnemy.TriggerEventClass(Class'LPSeqEvent_VitalSuitLaRocheCriticalDialog', Outer.VsLarochePawn, 6);
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.VsLarochePawn.TuneDataVsLaroche.StationaryToMovingTransitionData[0] = Outer.VsLarochePawn.TuneDataVsLaroche.StationaryToMovingTransitionData[2];
    Outer.VsLarochePawn.TuneDataVsLaroche.MovingToMovingTransitionData[0] = Outer.VsLarochePawn.TuneDataVsLaroche.MovingToMovingTransitionData[2];
    Outer.VsLarochePawn.TuneDataVsLaroche.MovingToStationaryTransitionData[0] = Outer.VsLarochePawn.TuneDataVsLaroche.MovingToStationaryTransitionData[2];
    Outer.VsLarochePawn.TuneDataVsLaroche.TurnInPlaceTransitionData = Outer.VsLarochePawn.TuneDataVsLaroche.LimpingTurnInPlaceTransitionData;
    Outer.ChangeCurrentLarocheMacroCombatState(6);
    super.Popped();
    //return;    
}
