class NavMeshGoal_At extends NavMeshPathGoalEvaluator;

var(*) /*0x35EA0000-0x00000000*/ private @NULL Goal;
var(*) /*0x35EA0000-0x00000000*/ private float GoalDist;
var(*) /*0x35EA0000-0x00000000*/ private bool bKeepPartial;
var(*) /*0x35EA0000-0x00000000*/ private bool bWeightPartialByDist;
var(*) /*0x35EA0000-0x00000000*/ private bool bGoalInSamePolyAsAnchor;
var(*) /*0x35EA0000-0x00000000*/ private float PartialDistSq;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GoalPoly[268435457];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PartialGoal[268435457];

// Export UNavMeshGoal_At::execRecycleNative(FFrame&, void* const)
native function RecycleNative();

static function AtActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609], GoalActor;
    local /*0x35EA0000-0x00000000*/ private float Dist[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bReturnPartial[9437185], bInWeightPartialByDist, ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL GoalController, MyController, TargetLoc;

    // End:0x127
    if(NavHandle != none)
    {
        GoalController = Controller(GoalActor);
        // End:0x65
        if(GoalController != none)
        {
            GoalActor = GoalController.Pawn;
        }
        // End:0x127
        if(GoalActor != none)
        {
            MyController = Controller(NavHandle.Outer);
            NavHandle.PopulatePathfindingParamCache();
            TargetLoc = GoalActor.GetDestination(MyController);
            return AtLocation(NavHandle, TargetLoc, Dist, bReturnPartial);
        }
    }
    return false;
    //return ReturnValue;    
}

static function AtLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609], GoalLocation;
    local /*0x35EA0000-0x00000000*/ private float Dist[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bReturnPartial[9437185], bInWeightPartialByDist, ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL Eval;

    // End:0x12A
    if(NavHandle != none)
    {
        Eval = NavMeshGoal_At(NavHandle.CreatePathGoalEvaluator(default.Class));
        // End:0x12A
        if(Eval != none)
        {
            Eval.Goal = GoalLocation;
            Eval.GoalDist = Dist;
            Eval.bKeepPartial = bReturnPartial;
            Eval.bWeightPartialByDist = bInWeightPartialByDist;
            NavHandle.AddGoalEvaluator(Eval);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function Recycle()
{
    Goal = vect(0.0000000, 0.0000000, 0.0000000);
    GoalDist = default.GoalDist;
    bKeepPartial = default.bKeepPartial;
    bWeightPartialByDist = default.bWeightPartialByDist;
    PartialDistSq = default.PartialDistSq;
    RecycleNative();
    super.Recycle();
    //return;    
}

defaultproperties
{
    PartialDistSq=1000000000000.0000000
    bDoPartialAStar=true
    MaxOpenListSize=2048
}