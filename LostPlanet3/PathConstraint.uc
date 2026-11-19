class PathConstraint extends Object;

var(*) /*0x35EA0000-0x00000000*/ private int CacheIdx[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NextConstraint;

event Recycle()
{
    NextConstraint = none;
    //return;    
}

event GetDumpString()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(self);
    //return ReturnValue;    
}

defaultproperties
{
    CacheIdx=-1
}