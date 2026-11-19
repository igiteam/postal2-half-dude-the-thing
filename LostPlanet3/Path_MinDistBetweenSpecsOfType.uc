class Path_MinDistBetweenSpecsOfType extends PathConstraint;

var(*) /*0x35EA0000-0x00000000*/ private float MinDistBetweenSpecTypes;
var(*) /*0x35EA0000-0x00000000*/ private @NULL InitLocation;
var(*) /*0x35EA0000-0x00000000*/ private class ReachSpecClass;

static function EnforceMinDist()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private float InMinDist[8388609];
    local /*0x35EA0000-0x00000000*/ private class InSpecClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL LastLocation[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Con;

    // End:0x135
    if(((P != none) && P.bCanMantle) && InMinDist > 0.0000000)
    {
        Con = Path_MinDistBetweenSpecsOfType(P.CreatePathConstraint(default.Class));
        // End:0x135
        if(Con != none)
        {
            Con.MinDistBetweenSpecTypes = InMinDist;
            Con.InitLocation = LastLocation;
            Con.ReachSpecClass = InSpecClass;
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
    MinDistBetweenSpecTypes = default.MinDistBetweenSpecTypes;
    ReachSpecClass = none;
    InitLocation = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

defaultproperties
{
    CacheIdx=10
}