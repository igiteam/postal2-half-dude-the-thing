class NavMeshGoalFilter_OutSideOfDotProductWedge extends NavMeshGoal_Filter;

var(*) /*0x35EA0000-0x00000000*/ private @NULL Location[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Rotation[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float Epsilon[536870913];

static function OutsideOfDotProductWedge()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FilterContainer[8388609], InLocation, InRotation;
    local /*0x35EA0000-0x00000000*/ private float InEpsilon[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Eval;

    // End:0x100
    if(FilterContainer != none)
    {
        Eval = NavMeshGoalFilter_OutSideOfDotProductWedge(FilterContainer.GetFilterOfType(default.Class));
        // End:0x100
        if(Eval != none)
        {
            Eval.Location = InLocation;
            Eval.Rotation = Vector(InRotation);
            Eval.Epsilon = InEpsilon;
            FilterContainer.GoalFilters.AddItem(Eval);            
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}
