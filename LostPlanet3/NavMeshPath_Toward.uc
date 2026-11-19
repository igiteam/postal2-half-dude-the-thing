class NavMeshPath_Toward extends NavMeshPathConstraint;

var(*) /*0x35EA0000-0x00000000*/ private bool bBiasAgainstHighLevelPath;
var(*) /*0x35EA0000-0x00000000*/ private float OutOfHighLevelPathBias;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GoalActor;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GoalPoint;

static function TowardGoal()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609], Goal;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Con;

    // End:0xBC
    if((NavHandle != none) && Goal != none)
    {
        Con = NavMeshPath_Toward(NavHandle.CreatePathConstraint(default.Class));
        // End:0xBC
        if(Con != none)
        {
            Con.GoalActor = Goal;
            NavHandle.AddPathConstraint(Con);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

static function TowardPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609], Point;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Con;

    // End:0xC8
    if((NavHandle != none) && Point != vect(0.0000000, 0.0000000, 0.0000000))
    {
        Con = NavMeshPath_Toward(NavHandle.CreatePathConstraint(default.Class));
        // End:0xC8
        if(Con != none)
        {
            Con.GoalPoint = Point;
            NavHandle.AddPathConstraint(Con);
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
    GoalPoint = default.GoalPoint;
    //return;    
}

defaultproperties
{
    bBiasAgainstHighLevelPath=true
    OutOfHighLevelPathBias=5000.0000000
}