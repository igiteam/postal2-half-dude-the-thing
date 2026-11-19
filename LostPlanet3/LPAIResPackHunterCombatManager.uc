class LPAIResPackHunterCombatManager extends LPAIResBasePubSubCombatManager within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

// Export ULPAIResPackHunterCombatManager::execGetAccess(FFrame&, void* const)
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

defaultproperties
{
    AttackTypeValue=/* Array type was not detected. */
    AbsoluteMaxTimeToAllowAndAttackToHoldBestOption=5.0000000
    UniqueName="PackHunterCombatManager"
    bFlushAiResLogEachLine=true
}