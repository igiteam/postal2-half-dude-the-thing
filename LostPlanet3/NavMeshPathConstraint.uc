class NavMeshPathConstraint extends Object;

var(*) /*0x35EA0000-0x00000000*/ private @NULL NextConstraint;
var(*) /*0x35EA0000-0x00000000*/ private int NumNodesProcessed;
var(*) /*0x35EA0000-0x00000000*/ private int NumThrownOutNodes;
var(*) /*0x35EA0000-0x00000000*/ private float AddedDirectCost;
var(*) /*0x35EA0000-0x00000000*/ private float AddedHeuristicCost;

event Recycle()
{
    NextConstraint = none;
    NumThrownOutNodes = 0;
    AddedDirectCost = 0.0000000;
    AddedHeuristicCost = 0.0000000;
    NumNodesProcessed = 0;
    //return;    
}

event GetDumpString()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(self);
    //return ReturnValue;    
}
