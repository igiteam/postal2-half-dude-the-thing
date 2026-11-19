class LPAIResDefenderSwarmFormation extends LPAIResMedFlyerSurroundFormation within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

const DefenderRadius = 30;

defaultproperties
{
    MaxNumberPerOrbitSlot=3
    NumberOfExplorerSectors=12
    ContentClasses=/* Array type was not detected. */
    Attributes=(MinRangeFromVsForFlyLocToBeValid=600.0000000,bTestForGround=false)
    UniqueName="DefenderOrbitFormation"
}