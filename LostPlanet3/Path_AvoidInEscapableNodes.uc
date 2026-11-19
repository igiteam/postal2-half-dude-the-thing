class Path_AvoidInEscapableNodes extends PathConstraint;

var(*) /*0x35EA0000-0x00000000*/ private int Radius;
var(*) /*0x35EA0000-0x00000000*/ private int Height;
var(*) /*0x35EA0000-0x00000000*/ private int MaxFallSpeed;
var(*) /*0x35EA0000-0x00000000*/ private int MoveFlags;

// Export UPath_AvoidInEscapableNodes::execCachePawnReacFlags(FFrame&, void* const)
private native final function CachePawnReacFlags()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];


}

static function DontGetStuck()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Con;

    // End:0xAB
    if(P != none)
    {
        Con = Path_AvoidInEscapableNodes(P.CreatePathConstraint(default.Class));
        // End:0xAB
        if(Con != none)
        {
            Con.CachePawnReacFlags(P);
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
    Radius = 0;
    Height = 0;
    MaxFallSpeed = 0;
    MoveFlags = 0;
    //return;    
}

defaultproperties
{
    CacheIdx=11
}