class LPAIResourceMassRetreatMgr extends SPAIResource within SPAIResourceManager
    abstract
    config(AI)
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTrackingDeathsForMassRetreat;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CountOfDeathsForMassRetreat;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfDeathsToTriggerMassRetreat;

// Export ULPAIResourceMassRetreatMgr::execGetAccess(FFrame&, void* const)
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
    bTrackingDeathsForMassRetreat = false;
    CountOfDeathsForMassRetreat = -1;
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

function StartTrackingDeathsForMassRetreat()
{
    bTrackingDeathsForMassRetreat = true;
    // End:0x26
    if(CountOfDeathsForMassRetreat < 0)
    {
        CountOfDeathsForMassRetreat = 0;
    }
    //return;    
}

function StopTrackingDeathsForMassRetreat()
{
    bTrackingDeathsForMassRetreat = false;
    //return;    
}

function GetIfTrackingDeathsForMassRetreat()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bTrackingDeathsForMassRetreat;
    //return ReturnValue;    
}

function IsOwnerVitalSuit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PawnOwner;

    PawnOwner = LPBaseVSPlayerPawn(Outer.ResourceManagerOuter);
    // End:0x42
    if(PawnOwner != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function NotifyCombatManagerKilledByOwner()
{
    // End:0x39
    if(bTrackingDeathsForMassRetreat)
    {
        ++CountOfDeathsForMassRetreat;
        // End:0x39
        if(CountOfDeathsForMassRetreat >= NumOfDeathsToTriggerMassRetreat)
        {
            NotifySubscribersToMassRetreat();
        }
    }
    //return;    
}

function NotifySubscribersToMassRetreat()
{
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL UserPawn, userCtrl;

    // End:0x109
    if(ResourceAccess.Length > 0)
    {
        iter = 0;
        J0x1B:

        // End:0x109 [Loop If]
        if(iter < ResourceAccess.Length)
        {
            UserPawn = LPAIPawn(ResourceAccess[iter].GetResourceUser());
            // End:0xFB
            if(UserPawn != none)
            {
                userCtrl = LPAIController(UserPawn.Controller);
                // End:0xFB
                if(userCtrl != none)
                {
                    userCtrl.NotifyToMassRetreat(Outer.ResourceManagerOuter);
                }
            }
            iter++;
            // [Loop Continue]
            goto J0x1B;
        }
    }
    //return;    
}

defaultproperties
{
    UniqueName="BaseMassRetreatMgr"
    MaxUsers=50
}