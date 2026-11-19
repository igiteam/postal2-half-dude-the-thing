class NavMeshPathGoalEvaluator extends Object;

struct native BiasedGoalActor
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Goal;
    var(*) /*0x35EA0000-0x00000000*/ private int ExtraCost;

    structdefaultproperties
    {
        Goal=none
        ExtraCost=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL NextEvaluator[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int MaxPathVisits;
var(*) /*0x35EA0000-0x00000000*/ private bool bAlwaysCallEvaluateGoal;
var(*) /*0x35EA0000-0x00000000*/ private bool bDoPartialAStar;
var(*) /*0x35EA0000-0x00000000*/ private int NumNodesThrownOut[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int NumNodesProcessed[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int MaxOpenListSize;

event Recycle()
{
    NumNodesThrownOut = 0;
    NumNodesProcessed = 0;
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
    MaxPathVisits=1024
}