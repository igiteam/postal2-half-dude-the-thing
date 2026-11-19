class NavMeshGoal_PolyEncompassesAI extends NavMeshPathGoalEvaluator;

var(*) /*0x35EA0000-0x00000000*/ private @NULL OverrideExtentToCheck[536870913];

static function MakeSureAIFits()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609], InOverrideExtentToCheck;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Eval;

    // End:0xAC
    if(NavHandle != none)
    {
        Eval = NavMeshGoal_PolyEncompassesAI(NavHandle.CreatePathGoalEvaluator(default.Class));
        // End:0xAC
        if(Eval != none)
        {
            Eval.OverrideExtentToCheck = InOverrideExtentToCheck;
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
    //return;    
}

defaultproperties
{
    MaxPathVisits=64
}