class Path_TowardGoal extends PathConstraint;

var(*) /*0x35EA0000-0x00000000*/ private @NULL GoalActor;

static function TowardGoal()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609], Goal;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Con;

    // End:0xBC
    if((P != none) && Goal != none)
    {
        Con = Path_TowardGoal(P.CreatePathConstraint(default.Class));
        // End:0xBC
        if(Con != none)
        {
            Con.GoalActor = Goal;
            P.AddPathConstraint(Con);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function Recycle()
{
    super.Recycle();
    GoalActor = none;
    //return;    
}

defaultproperties
{
    CacheIdx=1
}