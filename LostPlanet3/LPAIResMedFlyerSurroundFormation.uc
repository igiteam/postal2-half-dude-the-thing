class LPAIResMedFlyerSurroundFormation extends LPAIResSurroundFlyFormation within SPAIResourceManager
    config(AI)
    editinlinenew
    hidecategories(Object);

const MedFlyerRadius = 120;

function GetResourceExtents()
{
    local /*0x97E50000-0x00000000*/ private @NULL OutLocation[25165825];
    local /*0x97E50000-0x00000000*/ private float OutRadius[25165825];

    super(SPAIResourceGroup).GetResourceExtents(OutLocation, OutRadius);
    //return;    
}

defaultproperties
{
    MaxInFormation=8
    NumberOfExplorerSectors=15
    ContentClasses=/* Array type was not detected. */
    FormationBlockCheckEnabled=true
    Attributes=(HeightOfLoc=240.0000000,RadiusOfLoc=30.0000000,IdealRadius=1000.0000000,DistanceErrorBuffer=100.0000000,CostOfDistanceDeltaInsideIdealPerMeter=1.0000000,CostOfDistanceDeltaOutsideIdealPerMeter=1.0000000,MinFormationHeightDelta=1.1000000,FormationIdealHeightDelta=9.8000000,MaxFormationHeightDelta=20.5000000,CostOfHeightDeltaBelowIdealPerMeter=99.5000000,CostOfHeightDeltaAboveIdealPerMeter=45.7000000,MaxPitchAllowedInDegrees=90.0000000,IdealPitchInDegrees=0.0000000,MinPitchAllowedInDegrees=-90.0000000)
    UniqueName="MedFlyerOrbitFormation"
}