class NavMeshPath_MinDistBetweenSpecsOfType extends NavMeshPathConstraint;

var(*) /*0x35EA0000-0x00000000*/ private float MinDistBetweenEdgeTypes;
var(*) /*0x35EA0000-0x00000000*/ private @NULL InitLocation;
var(*) /*0x35EA0000-0x00000000*/ private byte EdgeType;
var(*) /*0x35EA0000-0x00000000*/ private float Penalty;

static function EnforceMinDist()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NavHandle[8388609];
    local /*0x35EA0000-0x00000000*/ private float InMinDist[8388609];
    local /*0x35EA0000-0x00000000*/ private byte InEdgeType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL LastLocation[9437185];
    local /*0x35EA0000-0x00000000*/ private float InPenalty[9437185];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Con;

    // End:0x13A
    if((NavHandle != none) && InMinDist > 0.0000000)
    {
        Con = NavMeshPath_MinDistBetweenSpecsOfType(NavHandle.CreatePathConstraint(default.Class));
        // End:0x13A
        if(Con != none)
        {
            Con.MinDistBetweenEdgeTypes = InMinDist;
            Con.InitLocation = LastLocation;
            Con.EdgeType = InEdgeType;
            Con.Penalty = InPenalty;
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
    MinDistBetweenEdgeTypes = default.MinDistBetweenEdgeTypes;
    EdgeType = 0;
    InitLocation = vect(0.0000000, 0.0000000, 0.0000000);
    Penalty = default.Penalty;
    //return;    
}

defaultproperties
{
    Penalty=10000.0000000
}