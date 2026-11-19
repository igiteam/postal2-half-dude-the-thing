class NavMeshGoal_GenericFilterContainer extends NavMeshPathGoalEvaluator;

var(*) /*0x35EA0000-0x00000400*/ private editfixedsize array GoalFilters[537395201];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SuccessfulGoal[805306369];
var(*) /*0x35EA0000-0x00000000*/ private @NULL MyNavigationHandle[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SeedLocations[536870913];

static function CreateAndAddFilterToNavHandle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609];
    local /*0x35EA0000-0x00000000*/ private int InMaxPathVisits[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Eval;

    -1
    // End:0x163
    if(NavHandle != none)
    {
        Eval = NavMeshGoal_GenericFilterContainer(NavHandle.CreatePathGoalEvaluator(default.Class));
        // End:0x163
        if(Eval != none)
        {
            // End:0x99
            if(InMaxPathVisits > 0)
            {
                Eval.MaxPathVisits = InMaxPathVisits;
            }
            Eval.MyNavigationHandle = NavHandle;
            Eval.SeedLocations[Eval.SeedLocations.Length] = NavHandle.CachedPathParams.SearchStart;
            NavHandle.AddGoalEvaluator(Eval);
            return Eval;
        }
    }
    return none;
    //return ReturnValue;    
}

static function CreateAndAddFilterToNavHandleFromSeedList()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array InSearchSeeds[25165825];
    local /*0x35EA0000-0x00000000*/ private int InMaxPathVisits[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Eval;

    -1
    // End:0x11B
    if(NavHandle != none)
    {
        Eval = NavMeshGoal_GenericFilterContainer(NavHandle.CreatePathGoalEvaluator(default.Class));
        // End:0x11B
        if(Eval != none)
        {
            // End:0x99
            if(InMaxPathVisits > 0)
            {
                Eval.MaxPathVisits = InMaxPathVisits;
            }
            Eval.MyNavigationHandle = NavHandle;
            Eval.SeedLocations = InSearchSeeds;
            NavHandle.AddGoalEvaluator(Eval);
            return Eval;
        }
    }
    return none;
    //return ReturnValue;    
}

function GetFilterOfType()
{
    local /*0x35EA0000-0x00000000*/ private class Filter_Class[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return new (self) Filter_Class;
    //return ReturnValue;    
}

// Export UNavMeshGoal_GenericFilterContainer::execGetGoalPoint(FFrame&, void* const)
native function GetGoalPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function Recycle()
{
    super.Recycle();
    GoalFilters.Length = 0;
    MaxPathVisits = default.MaxPathVisits;
    MyNavigationHandle = none;
    //return;    
}

defaultproperties
{
    MaxPathVisits=2048
}