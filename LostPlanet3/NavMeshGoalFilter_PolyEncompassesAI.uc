class NavMeshGoalFilter_PolyEncompassesAI extends NavMeshGoal_Filter;

var(*) /*0x35EA0000-0x00000000*/ private @NULL OverrideExtentToCheck[536870913];

static function MakeSureAIFits()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FilterContainer[8388609], InOverrideExtentToCheck;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Eval;

    // End:0xAF
    if(FilterContainer != none)
    {
        Eval = NavMeshGoalFilter_PolyEncompassesAI(FilterContainer.GetFilterOfType(default.Class));
        // End:0xAF
        if(Eval != none)
        {
            Eval.OverrideExtentToCheck = InOverrideExtentToCheck;
            FilterContainer.GoalFilters.AddItem(Eval);            
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}
