class ReachSpec extends Object;

const BLOCKEDPATHCOST = 10000000;

var(*) /*0x35EA0000-0x00000000*/ private const @NULL NavOctreeObject[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int Distance;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Direction;
var(*) /*0x402C0000-0x00000000*/ private const @NULL Start[196609];
var(*) /*0x402C0000-0x00000000*/ private const @NULL End[196609];
var(*) /*0x402C0000-0x00000000*/ private const int CollisionRadius[196609];
var(*) /*0x402C0000-0x00000000*/ private const int CollisionHeight[196609];
var(*) /*0x35EA0000-0x00000000*/ private int reachFlags;
var(*) /*0x35EA0000-0x00000000*/ private int MaxLandingVelocity;
var(*) /*0x35EA0000-0x00000000*/ private byte bPruned;
var(*) /*0x35EA0000-0x00000000*/ private byte PathColorIndex;
var(*) /*0x35EA0000-0x00000000*/ private const bool bAddToNavigationOctree[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bCanCutCorners;
var(*) /*0x35EA0000-0x00000000*/ private bool bCheckForObstructions;
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipPrune[131073];
var(*) /*0x402C0000-0x00000000*/ private const bool bDisabled[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PruneSpecList[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BlockedBy;

// Export UReachSpec::execCostFor(FFrame&, void* const)
native final function CostFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UReachSpec::execGetEnd(FFrame&, void* const)
native final function GetEnd()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UReachSpec::execGetDirection(FFrame&, void* const)
native final function GetDirection()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function IsBlockedFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return CostFor(P) >= 10000000;
    //return ReturnValue;    
}

defaultproperties
{
    bAddToNavigationOctree=true
    bCanCutCorners=true
    bCheckForObstructions=true
}