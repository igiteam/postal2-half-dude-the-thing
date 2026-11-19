class NavMeshGoalFilter_NotNearOtherAI extends NavMeshGoal_Filter;

var(*) /*0x35EA0000-0x00000000*/ private float DistanceToCheck[536870913];

static function NotNearOtherAI()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FilterContainer[8388609];
    local /*0x35EA0000-0x00000000*/ private float InDistanceToCheck[8519681];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Eval;

    // End:0xAE
    if(FilterContainer != none)
    {
        Eval = NavMeshGoalFilter_NotNearOtherAI(FilterContainer.GetFilterOfType(default.Class));
        // End:0xAE
        if(Eval != none)
        {
            Eval.DistanceToCheck = InDistanceToCheck;
            FilterContainer.GoalFilters.AddItem(Eval);            
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}
