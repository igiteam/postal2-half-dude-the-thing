class Path_TowardPoint extends PathConstraint;

var(*) /*0x35EA0000-0x00000000*/ private @NULL GoalPoint;

static function TowardPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609], Point;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Con;

    // End:0xC8
    if((P != none) && Point != vect(0.0000000, 0.0000000, 0.0000000))
    {
        Con = Path_TowardPoint(P.CreatePathConstraint(default.Class));
        // End:0xC8
        if(Con != none)
        {
            Con.GoalPoint = Point;
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
    GoalPoint = default.GoalPoint;
    //return;    
}

defaultproperties
{
    CacheIdx=2
}