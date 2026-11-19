class NavMeshGoal_WithinDistanceEnvelope extends NavMeshPathGoalEvaluator;

var(*) /*0x34980000-0x00000000*/ private float MaxDistance[65537];
var(*) /*0x34980000-0x00000000*/ private float MinDistance[65537];
var(*) /*0x34980000-0x00000000*/ private float MinTraversalDist[65537];
var(*) /*0x34980000-0x00000000*/ private @NULL EnvelopeTestPoint[65537];

static function GoalWithinEnvelopeToLoc()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609], InEnvelopeTestPoint;
    local /*0x35EA0000-0x00000000*/ private float InMaxDistance[8388609], InMinDistance, InMinTraversalDist;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Eval;

    // End:0x124
    if(NavHandle != none)
    {
        Eval = NavMeshGoal_WithinDistanceEnvelope(NavHandle.CreatePathGoalEvaluator(default.Class));
        // End:0x124
        if(Eval != none)
        {
            Eval.EnvelopeTestPoint = InEnvelopeTestPoint;
            Eval.MaxDistance = InMaxDistance;
            Eval.MinDistance = InMinDistance;
            Eval.MinTraversalDist = InMinTraversalDist;
            NavHandle.AddGoalEvaluator(Eval);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function Recycle()
{
    super.Recycle();
    MaxDistance = default.MaxDistance;
    MinDistance = default.MinDistance;
    MinTraversalDist = default.MinTraversalDist;
    EnvelopeTestPoint = default.EnvelopeTestPoint;
    //return;    
}
