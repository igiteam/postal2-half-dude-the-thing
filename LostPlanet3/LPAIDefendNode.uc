class LPAIDefendNode extends LPPathTargetPoint
    hidecategories(AnimDependency,Navigation);

enum EDefendNodePriority
{
    EDefendNodePriority_Low,        // 0
    EDefendNodePriority_Medium,     // 1
    EDefendNodePriority_High,       // 2
    EDefendNodePriority_MAX         // 3
};

var(0.25_Pct) /*0x79B20000-0x00000000*/ private byte DefendNodePriority[65537];
var(0.25_Pct) /*0x79B20000-0x00000000*/ private @NULL ThingToFocusOnWhenNoEnemy[65537];
var(0.25_Pct) /*0x79B20000-0x00000000*/ private bool bUseNodeRotation[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRandomizeMovesToPlay;
var(0.25_Pct) /*0x9F190000-0x00000000*/ private float HowCloseToLocationToTryAndStay[65537];
var(0.25_Pct) /*0x9F190000-0x00000000*/ private float HowCloseToLetEnemiesGetBeforeAttacking[65537];
var(0.25_Pct) /*0x9F190000-0x00000000*/ private float DamageThresholdBeforeEndingCommand[65537];
var(0.25_Pct) /*0x9F190000-0x00000000*/ private float HowCloseToLetGrenadesGetBeforeAttacking[65537];
var(0.25_Pct) /*0x9F190000-0x00000000*/ private float MinTimeToWaitAtNode[65537];
var(0.25_Pct) /*0x9F190000-0x00000000*/ private float MaxTimeToWaitAtNode[65537];
var(0.25_Pct) /*0x9F190000-0x00000000*/ private editfixedsize array MovesToPlay[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefendNodeResource;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefendNodeAccess;

function GetResource()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return DefendNodeResource;
    //return ReturnValue;    
}

function SetResource()
{
    local /*0x97E50000-0x00000000*/ private @NULL Resource[8388609];

    DefendNodeResource = Resource;
    //return;    
}

function SetAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL Access[8388609];

    DefendNodeAccess = Access;
    DefendNodeAccess.Lock(true);
    //return;    
}

function IsBeingUsed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(DefendNodeAccess != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ClearAccess()
{
    // End:0x59
    if(DefendNodeAccess != none)
    {
        DefendNodeAccess.Lock(false);
        DefendNodeAccess.Destroy();
        DefendNodeAccess = none;
    }
    //return;    
}

defaultproperties
{
    DefendNodePriority=EDefendNodePriority.EDefendNodePriority_Medium
    bRandomizeMovesToPlay=true
    MinTimeToWaitAtNode=-1.0000000
    MaxTimeToWaitAtNode=-1.0000000
    bAutoLinkDuplicates=false
    Components[0]=none
    Components[1]=none
    // Reference: CylinderComponent'Default__LPAIDefendNode.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[2]=CollisionCylinder
    Components[3]=none
    CollisionComponent=CollisionCylinder
}