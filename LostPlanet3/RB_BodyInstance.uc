class RB_BodyInstance extends Object
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000400*/ private export @NULL OwnerComponent[537526273];
var(*) /*0x35EA0000-0x00000000*/ private int BodyIndex[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Velocity;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PreviousVelocity;
var(*) /*0x35EA0000-0x00000000*/ private int SceneIndex[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BodyData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BoneSpring[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BoneSpringKinActor[268566529];
var(*) /*0x0B5C0000-0x00000000*/ private bool bEnableBoneSpringLinear[65537];
var(*) /*0x0B5C0000-0x00000000*/ private bool bEnableBoneSpringAngular[65537];
var(*) /*0x0B5C0000-0x00000000*/ private bool bDisableOnOverextension[65537];
var(*) /*0x0B5C0000-0x00000000*/ private bool bNotifyOwnerOnOverextension[65537];
var(*) /*0x0B5C0000-0x00000000*/ private bool bTeleportOnOverextension[65537];
var(*) /*0x0B5C0000-0x00000000*/ private bool bUseKinActorForBoneSpring[65537];
var(*) /*0x0B5C0000-0x00000000*/ private bool bMakeSpringToBaseCollisionComponent[65537];
var(*) /*0x3C500000-0x00000000*/ private bool bOnlyCollideWithPawns[196609];
var(*) /*0x3C500000-0x00000000*/ private bool bEnableCollisionResponse[196609];
var(*) /*0x3C500000-0x00000000*/ private bool bPushBody[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bBlockZeroExtent;
var(*) /*0x35EA0000-0x00000000*/ private bool bBlockNonZeroExtent;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceUnfixed[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bInstanceAlwaysFullAnimWeight[536870913];
var(*) /*0x0B5C0000-0x00000000*/ private float BoneLinearSpring[196609];
var(*) /*0x0B5C0000-0x00000000*/ private float BoneLinearDamping[196609];
var(*) /*0x0B5C0000-0x00000000*/ private float BoneAngularSpring[196609];
var(*) /*0x0B5C0000-0x00000000*/ private float BoneAngularDamping[196609];
var(*) /*0x0B5C0000-0x00000000*/ private float OverextensionThreshold[65537];
var(*) /*0x3FDA0000-0x00000000*/ private float CustomGravityFactor[65537];
var(*) /*0x35EA0000-0x00000000*/ private float LastEffectPlayedTime[536870913];
var(*) /*0x3C500000-0x00000000*/ private @NULL PhysMaterialOverride[196609];
var(*) /*0x3C500000-0x00000000*/ private float ContactReportForceThreshold[65537];
var(*) /*0x3C500000-0x00000000*/ private float InstanceMassScale[65537];
var(*) /*0x3C500000-0x00000000*/ private float InstanceDampingScale[65537];

// Export URB_BodyInstance::execGetBodyMass(FFrame&, void* const)
native final function GetBodyMass()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export URB_BodyInstance::execSetFixed(FFrame&, void* const)
native final function SetFixed()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewFixed[8388609];


}

// Export URB_BodyInstance::execIsFixed(FFrame&, void* const)
native final function IsFixed()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export URB_BodyInstance::execIsValidBodyInstance(FFrame&, void* const)
native final function IsValidBodyInstance()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export URB_BodyInstance::execGetPhysicsAssetInstance(FFrame&, void* const)
native final function GetPhysicsAssetInstance()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export URB_BodyInstance::execGetUnrealWorldTM(FFrame&, void* const)
native final function GetUnrealWorldTM()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export URB_BodyInstance::execGetUnrealWorldVelocity(FFrame&, void* const)
native final function GetUnrealWorldVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export URB_BodyInstance::execGetUnrealWorldAngularVelocity(FFrame&, void* const)
native final function GetUnrealWorldAngularVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export URB_BodyInstance::execGetUnrealWorldVelocityAtPoint(FFrame&, void* const)
native final function GetUnrealWorldVelocityAtPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Point[8388609], ReturnValue;


}

// Export URB_BodyInstance::execEnableBoneSpring(FFrame&, void* const)
native final function EnableBoneSpring()
{
    local /*0x35EA0000-0x00000000*/ private bool bInEnableLinear[8388609], bInEnableAngular;
    local /*0x35EA0000-0x00000000*/ private @NULL InBoneTarget[25296897];


}

// Export URB_BodyInstance::execSetBoneSpringParams(FFrame&, void* const)
native final function SetBoneSpringParams()
{
    local /*0x35EA0000-0x00000000*/ private float InLinearSpring[8388609], InLinearDamping, InAngularSpring, InAngularDamping;


}

// Export URB_BodyInstance::execSetBoneSpringTarget(FFrame&, void* const)
native final function SetBoneSpringTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InBoneTarget[25296897];
    local /*0x35EA0000-0x00000000*/ private bool bTeleport[8388609];


}

// Export URB_BodyInstance::execSetBlockRigidBody(FFrame&, void* const)
native final function SetBlockRigidBody()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewBlockRigidBody[8388609];


}

// Export URB_BodyInstance::execSetPhysMaterialOverride(FFrame&, void* const)
native final function SetPhysMaterialOverride()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewPhysMaterial[8388609];


}

// Export URB_BodyInstance::execEnableCollisionResponse(FFrame&, void* const)
native final function EnableCollisionResponse()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnableResponse[8388609];


}

// Export URB_BodyInstance::execSetContactReportForceThreshold(FFrame&, void* const)
native final function SetContactReportForceThreshold()
{
    local /*0x35EA0000-0x00000000*/ private float Threshold[8388609];


}

// Export URB_BodyInstance::execUpdateMassProperties(FFrame&, void* const)
native final function UpdateMassProperties()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Setup[8388609];


}

// Export URB_BodyInstance::execUpdateDampingProperties(FFrame&, void* const)
native final function UpdateDampingProperties();

// Export URB_BodyInstance::execGetPhysicalMaterial(FFrame&, void* const)
native final function GetPhysicalMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

defaultproperties
{
    bEnableCollisionResponse=true
    bBlockZeroExtent=true
    bBlockNonZeroExtent=true
    BoneLinearSpring=10.0000000
    BoneLinearDamping=0.1000000
    BoneAngularSpring=1.0000000
    BoneAngularDamping=0.1000000
    CustomGravityFactor=1.0000000
    ContactReportForceThreshold=-1.0000000
    InstanceMassScale=1.0000000
    InstanceDampingScale=1.0000000
}