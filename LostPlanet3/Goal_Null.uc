class Goal_Null extends PathGoalEvaluator;

static function GoUntilBust()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private int InMaxPathVisits[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Eval;

    -1
    // End:0xC3
    if(P != none)
    {
        Eval = Goal_Null(P.CreatePathGoalEvaluator(default.Class));
        // End:0xC3
        if(Eval != none)
        {
            // End:0x99
            if(InMaxPathVisits > 0)
            {
                Eval.MaxPathVisits = InMaxPathVisits;
            }
            P.AddGoalEvaluator(Eval);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function Recycle()
{
    super.Recycle();
    MaxPathVisits = default.MaxPathVisits;
    //return;    
}

defaultproperties
{
    CacheIdx=5
}