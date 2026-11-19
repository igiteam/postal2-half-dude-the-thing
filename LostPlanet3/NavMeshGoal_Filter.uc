class NavMeshGoal_Filter extends Object
    abstract;

var(*) /*0x35EA0000-0x00000000*/ private bool bShowDebug;
var(*) /*0x35EA0000-0x00000000*/ private int NumNodesThrownOut[536870913];
var(*) /*0x35EA0000-0x00000000*/ private int NumNodesProcessed[536870913];

event GetDumpString()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(self);
    //return ReturnValue;    
}
