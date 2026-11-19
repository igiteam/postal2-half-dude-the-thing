class NavMeshGoalFilter_OutOfViewFrom extends NavMeshGoal_Filter;

var(*) /*0x35EA0000-0x00000000*/ private @NULL GoalPoly[805306369];
var(*) /*0x35EA0000-0x00000000*/ private @NULL OutOfViewLocation[536870913];

static function MustBeHiddenFromThisPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FilterContainer[8388609], InOutOfViewLocation;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Eval;

    // End:0xAE
    if(FilterContainer != none)
    {
        Eval = NavMeshGoalFilter_OutOfViewFrom(FilterContainer.GetFilterOfType(default.Class));
        // End:0xAE
        if(Eval != none)
        {
            Eval.OutOfViewLocation = InOutOfViewLocation;
            FilterContainer.GoalFilters.AddItem(Eval);            
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}
