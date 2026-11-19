class PathGoalEvaluator extends Object;

var(*) /*0x35EA0000-0x00000000*/ private @NULL NextEvaluator;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GeneratedGoal;
var(*) /*0x35EA0000-0x00000000*/ private int MaxPathVisits;
var(*) /*0x35EA0000-0x00000000*/ private int CacheIdx[131073];

event Recycle()
{
    GeneratedGoal = none;
    NextEvaluator = none;
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
    MaxPathVisits=2048
    CacheIdx=-1
}