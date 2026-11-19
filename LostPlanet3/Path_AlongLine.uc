class Path_AlongLine extends PathConstraint;

var(*) /*0x35EA0000-0x00000000*/ private @NULL Direction;

static function AlongLine()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609], Dir;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Con;

    // End:0xBE
    if((P != none) && !IsZero(Dir))
    {
        Con = Path_AlongLine(P.CreatePathConstraint(default.Class));
        // End:0xBE
        if(Con != none)
        {
            Con.Direction = Dir;
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
    Direction = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

defaultproperties
{
    CacheIdx=0
}