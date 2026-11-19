class LPKyTraversalAttackFlyFormationSurround extends LPKyTraversalAttackFormationSurround;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FlyLocationExploreData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VsInRangeAtStartOfTraversal;

// Export ULPKyTraversalAttackFlyFormationSurround::execSetBinPositions(FFrame&, void* const)
protected native function SetBinPositions();

// Export ULPKyTraversalAttackFlyFormationSurround::execRatePosition(FFrame&, void* const)
protected native function RatePosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[8388609];
    local /*0x97E50000-0x00000000*/ private int Bin[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPKyTraversalAttackFlyFormationSurround::execPostTraversal(FFrame&, void* const)
protected native function PostTraversal();

// Export ULPKyTraversalAttackFlyFormationSurround::execIsInRange(FFrame&, void* const)
protected native function IsInRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL Posiion[25296897];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPKyTraversalAttackFlyFormationSurround::execGetBestOnFlyGraphStartingLocForThisSectorLoc(FFrame&, void* const)
protected native function GetBestOnFlyGraphStartingLocForThisSectorLoc()
{
    local /*0x97E50000-0x00000000*/ private @NULL CenterOfFlySector[25296897], outOnGraphCenterOfFlySector;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

protected event TraversalStrated()
{
    local /*0x97E50000-0x00000000*/ private @NULL curVsPawn;

    super.TraversalStrated();
    // End:0xE9
    if(FormationCenterActor != none)
    {
        // End:0xE8
        foreach FormationCenterActor.WorldInfo.AllPawns(Class'LPBaseVSPlayerPawn', curVsPawn, FormationCenterActor.Location, FlyLocationExploreData.MaxFormationRadius + FlyLocationExploreData.MinRangeFromVsForFlyLocToBeValid)
        {
            // End:0xE7
            if(curVsPawn != FormationCenterActor)
            {
                VsInRangeAtStartOfTraversal.AddItem(curVsPawn);                
            }            
        }        
    }
    //return;    
}

protected event TraversalFinished()
{
    super.TraversalFinished();
    //return;    
}

protected event TraversalAborted()
{
    super.TraversalAborted();
    //return;    
}

final function SetFlySearchParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL inFlyLocationExploreData[25296897];
    local /*0x97E50000-0x00000000*/ private int InSegments[8388609];

    SetSearchParams(inFlyLocationExploreData.MinFormationRadius, inFlyLocationExploreData.MaxFormationRadius, inFlyLocationExploreData.IdealRadius, InSegments);
    FlyLocationExploreData = inFlyLocationExploreData;
    //return;    
}

defaultproperties
{
    FlyLocationExploreData=(IdealRadius=1000.0000000,MinFormationRadius=500.0000000,MaxFormationRadius=2000.0000000,DistanceErrorBuffer=50.0000000,CostOfDistanceDeltaInsideIdealPerMeter=100.0000000,CostOfDistanceDeltaOutsideIdealPerMeter=50.0000000,MinFormationHeightDelta=200.0000000,FormationIdealHeightDelta=300.0000000,MaxFormationHeightDelta=1000.0000000,HeightErrorBuffer=50.0000000,CostOfHeightDeltaBelowIdealPerMeter=100.0000000,CostOfHeightDeltaAboveIdealPerMeter=50.0000000,bUseHeightInsteadOfPitchForEvaluations=true,MaxPitchAllowedInUU=32000,IdealPitchInUU=0,MinPitchAllowedInUU=-32000,PitchErrorBufferInUU=5,CostOfPitchDeltaBelowIdealPerUU=0.0000000,CostOfPitchDeltaAboveIdealPerUU=0.0000000,MinRangeFromVsForFlyLocToBeValid=800.0000000)
}