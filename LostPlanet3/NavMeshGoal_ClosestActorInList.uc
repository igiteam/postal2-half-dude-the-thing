class NavMeshGoal_ClosestActorInList extends NavMeshPathGoalEvaluator;

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array GoalList;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PolyToGoalActorMap[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedAnchorPoly[268435457];

static function ClosestActorInList()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array InGoalList[25296897];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Eval;

    Eval = NavMeshGoal_ClosestActorInList(NavHandle.CreatePathGoalEvaluator(default.Class));
    Eval.GoalList = InGoalList;
    NavHandle.AddGoalEvaluator(Eval);
    return Eval;
    //return ReturnValue;    
}

event Recycle()
{
    super.Recycle();
    GoalList.Length = 0;
    RecycleInternal();
    //return;    
}

// Export UNavMeshGoal_ClosestActorInList::execRecycleInternal(FFrame&, void* const)
native function RecycleInternal();

defaultproperties
{
    MaxPathVisits=3000
}