class NavMeshGoal_Random extends NavMeshPathGoalEvaluator;

var(*) /*0x35EA0000-0x00000000*/ private int MinDist;
var(*) /*0x35EA0000-0x00000000*/ private float BestRating;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PartialGoal[268435457];

static function FindRandom()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609];
    local /*0x35EA0000-0x00000000*/ private int InMinDist[9437185], InMaxPathVisits;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Eval;

    -1
    -1
    // End:0xE8
    if(NavHandle != none)
    {
        Eval = NavMeshGoal_Random(NavHandle.CreatePathGoalEvaluator(default.Class));
        // End:0x93
        if(InMaxPathVisits > 0)
        {
            Eval.MaxPathVisits = InMaxPathVisits;
        }
        Eval.MinDist = InMinDist;
        NavHandle.AddGoalEvaluator(Eval);
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

// Export UNavMeshGoal_Random::execRecycleNative(FFrame&, void* const)
native function RecycleNative();

function Recycle()
{
    super.Recycle();
    MaxPathVisits = default.MaxPathVisits;
    BestRating = default.BestRating;
    MinDist = default.MinDist;
    RecycleNative();
    //return;    
}

defaultproperties
{
    MinDist=-1
    BestRating=-1.0000000
}