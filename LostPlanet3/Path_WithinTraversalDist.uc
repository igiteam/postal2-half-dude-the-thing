class Path_WithinTraversalDist extends PathConstraint;

var(*) /*0x3B190000-0x00000000*/ private float MaxTraversalDist[65537];
var(*) /*0x3B190000-0x00000000*/ private bool bSoft[65537];
var(*) /*0x3B190000-0x00000000*/ private float SoftStartPenalty[65537];

static function DontExceedMaxDist()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private float InMaxTraversalDist[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bInSoft[9437185], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL Con;

    true
    // End:0xEF
    if((P != none) && InMaxTraversalDist > 0.0000000)
    {
        Con = Path_WithinTraversalDist(P.CreatePathConstraint(default.Class));
        // End:0xEF
        if(Con != none)
        {
            Con.MaxTraversalDist = InMaxTraversalDist;
            Con.bSoft = bInSoft;
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
    MaxTraversalDist = default.MaxTraversalDist;
    bSoft = default.bSoft;
    SoftStartPenalty = default.SoftStartPenalty;
    //return;    
}

defaultproperties
{
    bSoft=true
    SoftStartPenalty=320.0000000
    CacheIdx=4
}