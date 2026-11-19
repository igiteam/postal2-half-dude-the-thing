class LPAIResCarrierDefenderCombatManager extends LPAIResBasePubSubCombatManager within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeBetweenDefenderElementLaunches;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RandomRangeForDefenderElementLaunchTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastDefenderElementLaunch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastDefenderElementDestroyed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentDelayBetweenDefenderElementLaunches;

// Export ULPAIResCarrierDefenderCombatManager::execGetAccess(FFrame&, void* const)
native function GetAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Requester[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    false                    
}

function Init()
{
    TimeBetweenDefenderElementLaunches = 1.0000000;
    RandomRangeForDefenderElementLaunchTime = 0.1000000;
    TimeOfLastDefenderElementLaunch = -1.0000000;
    TimeOfLastDefenderElementDestroyed = 0.5000000;
    CurrentDelayBetweenDefenderElementLaunches = 0.5000000;
    super.Init();
    //return;    
}

function SetFromTuneData()
{
    super.SetFromTuneData();
    //return;    
}

function Destroy()
{
    super.Destroy();
    //return;    
}

function ShutDown()
{
    super.ShutDown();
    //return;    
}

function NotifyOfEndOfDefenderElementLaunch()
{
    local /*0x97E50000-0x00000000*/ private @NULL CarrierCtrlToTest[8388609];

    TimeOfLastDefenderElementLaunch = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds;
    CurrentDelayBetweenDefenderElementLaunches = RandRange(TimeBetweenDefenderElementLaunches - RandomRangeForDefenderElementLaunchTime, TimeBetweenDefenderElementLaunches + RandomRangeForDefenderElementLaunchTime);
    //return;    
}

function NotifyOfEndOfDefenderElementDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CarrierThatLostElement[8388609];

    TimeOfLastDefenderElementDestroyed = Outer.ResourceManagerOuter.WorldInfo.TimeSeconds;
    CurrentDelayBetweenDefenderElementLaunches = RandRange(TimeBetweenDefenderElementLaunches - RandomRangeForDefenderElementLaunchTime, TimeBetweenDefenderElementLaunches + RandomRangeForDefenderElementLaunchTime);
    //return;    
}

function HasEnoughTimePassedBetweenDefenderLaunchs()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeAfterWhichNextLaunchIsAllowed;

    timeAfterWhichNextLaunchIsAllowed = TimeOfLastDefenderElementDestroyed + CurrentDelayBetweenDefenderElementLaunches;
    // End:0x79
    if(Outer.ResourceManagerOuter.WorldInfo.TimeSeconds > timeAfterWhichNextLaunchIsAllowed)
    {
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function ForceNotAllowedToLaunchDefenders()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldCarrierProactivelyLaunchDefenders()
{
    local /*0x97E50000-0x00000000*/ private @NULL CarrierCtrlToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(ForceNotAllowedToLaunchDefenders())
    {
        return false;
    }
    // End:0xE3
    if(((CarrierCtrlToTest != none) && CarrierCtrlToTest.CarrierPawn != none) && CarrierCtrlToTest.CarrierPawn.IntendedDefendersLaunched.Length <= 0)
    {
        // End:0xE0
        if((HasEnoughTimePassedBetweenDefenderLaunchs()) || CarrierCtrlToTest.CarrierPawn.TuneDataCarrier.bOnlyProactivelyLaunchDefendersAndNothingElse)
        {
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

function IsFullPhysicalAttackAllowed()
{
    local /*0x97E50000-0x00000000*/ private @NULL AttackPublisher[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAssumeCurrentAttackIsDone[9437185], ReturnValue;

    false
    return true;
    //return ReturnValue;    
}

function IsLandOnAttackAsReplacementForFullPhysicalAttackAllowed()
{
    local /*0x97E50000-0x00000000*/ private bool bAssumeCurrentAttackIsDone[9437185], ReturnValue;

    false
    // End:0x23
    if((ForceOnlyFullPhysicalAttacks()) && IsOwnerVitalSuit())
    {
        return true;
    }
    // End:0x32
    if(ForceOnlyRangedLobAttacks())
    {
        return false;
    }
    // End:0x41
    if(IsOwnerVitalSuit())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    AttackTypeValue=/* Array type was not detected. */
    AbsoluteMaxTimeToAllowAndAttackToHoldBestOption=5.0000000
    UniqueName="CarrierDefenderCombatManager"
    MaxUsers=30
}