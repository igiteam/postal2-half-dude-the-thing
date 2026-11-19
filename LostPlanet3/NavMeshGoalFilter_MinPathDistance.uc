class NavMeshGoalFilter_MinPathDistance extends NavMeshGoal_Filter;

var(*) /*0x35EA0000-0x00000000*/ private int MinDistancePathShouldBe[536870913];

static function MustBeLongerPathThan()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FilterContainer[8388609];
    local /*0x35EA0000-0x00000000*/ private int InMinDistancePathShouldBe[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Eval;

    // End:0xAE
    if(FilterContainer != none)
    {
        Eval = NavMeshGoalFilter_MinPathDistance(FilterContainer.GetFilterOfType(default.Class));
        // End:0xAE
        if(Eval != none)
        {
            Eval.MinDistancePathShouldBe = InMinDistancePathShouldBe;
            FilterContainer.GoalFilters.AddItem(Eval);            
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}
