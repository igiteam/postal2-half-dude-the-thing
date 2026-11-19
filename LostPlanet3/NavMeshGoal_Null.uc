class NavMeshGoal_Null extends NavMeshPathGoalEvaluator;

var(*) /*0x35EA0000-0x00000000*/ private @NULL PartialGoal[268435457];

static function GoUntilBust()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609];
    local /*0x35EA0000-0x00000000*/ private int InMaxPathVisits[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Eval;

    -1
    // End:0xC3
    if(NavHandle != none)
    {
        Eval = NavMeshGoal_Null(NavHandle.CreatePathGoalEvaluator(default.Class));
        // End:0xC3
        if(Eval != none)
        {
            // End:0x99
            if(InMaxPathVisits > 0)
            {
                Eval.MaxPathVisits = InMaxPathVisits;
            }
            NavHandle.AddGoalEvaluator(Eval);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

// Export UNavMeshGoal_Null::execRecycleNative(FFrame&, void* const)
native function RecycleNative();

function Recycle()
{
    super.Recycle();
    MaxPathVisits = default.MaxPathVisits;
    RecycleNative();
    //return;    
}

defaultproperties
{
    MaxPathVisits=2048
}