class PhysicsAssetInstance extends Object
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private @NULL Owner[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int RootBodyIndex[537001985];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize array Bodies[655361];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize array Constraints[655361];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CollisionDisableTable[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float LinearSpringScale[131073];
var(*) /*0x35EA0000-0x00000000*/ private float LinearDampingScale[131073];
var(*) /*0x35EA0000-0x00000000*/ private float LinearForceLimitScale[131073];
var(*) /*0x35EA0000-0x00000000*/ private float AngularSpringScale[131073];
var(*) /*0x35EA0000-0x00000000*/ private float AngularDampingScale[131073];
var(*) /*0x35EA0000-0x00000000*/ private float AngularForceLimitScale[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bInitBodies[131073];

// Export UPhysicsAssetInstance::execSetLinearDriveScale(FFrame&, void* const)
native final function SetLinearDriveScale()
{
    local /*0x35EA0000-0x00000000*/ private float InLinearSpringScale[8388609], InLinearDampingScale, InLinearForceLimitScale;


}

// Export UPhysicsAssetInstance::execSetAngularDriveScale(FFrame&, void* const)
native final function SetAngularDriveScale()
{
    local /*0x35EA0000-0x00000000*/ private float InAngularSpringScale[8388609], InAngularDampingScale, InAngularForceLimitScale;


}

// Export UPhysicsAssetInstance::execGetTotalMassBelowBone(FFrame&, void* const)
native final function GetTotalMassBelowBone()
{
    local /*0x35EA0000-0x00000000*/ private name InBoneName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InAsset[8388609], InSkelMesh;
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UPhysicsAssetInstance::execSetAllBodiesFixed(FFrame&, void* const)
native final function SetAllBodiesFixed()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewFixed[8388609];


}

// Export UPhysicsAssetInstance::execSetNamedBodiesFixed(FFrame&, void* const)
native final function @NULL SetNamedBodiesFixed()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewFixed[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array BoneNames[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMesh[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSetOtherBodiesToComplement[9437185], bSkipFullAnimWeightBodies;


}

// Export UPhysicsAssetInstance::execForceAllBodiesBelowUnfixed(FFrame&, void* const)
native final function @NULL ForceAllBodiesBelowUnfixed()
{
    local /*0x35EA0000-0x00000000*/ private name InBoneName[25296897];
    local /*0x35EA0000-0x00000000*/ private @NULL InAsset[8388609], InSkelMesh;
    local /*0x35EA0000-0x00000000*/ private bool InbInstanceAlwaysFullAnimWeight[8388609];


}

// Export UPhysicsAssetInstance::execForceBodyUnfixed(FFrame&, void* const)
native final function @NULL ForceBodyUnfixed()
{
    local /*0x35EA0000-0x00000000*/ private name InBoneName[8519681];
    local /*0x35EA0000-0x00000000*/ private @NULL InAsset[8388609], InSkelMesh;
    local /*0x35EA0000-0x00000000*/ private bool InbInstanceAlwaysFullAnimWeight[8388609];


}

// Export UPhysicsAssetInstance::execSetAllMotorsAngularPositionDrive(FFrame&, void* const)
native final function @NULL SetAllMotorsAngularPositionDrive()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnableSwingDrive[8388609], bEnableTwistDrive;
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMesh[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bSkipFullAnimWeightBodies[9437185];


}

// Export UPhysicsAssetInstance::execSetAllMotorsAngularVelocityDrive(FFrame&, void* const)
native final function @NULL SetAllMotorsAngularVelocityDrive()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnableSwingDrive[8388609], bEnableTwistDrive;
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMeshComp[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSkipFullAnimWeightBodies[9437185];


}

// Export UPhysicsAssetInstance::execSetAllMotorsAngularDriveParams(FFrame&, void* const)
native final function @NULL SetAllMotorsAngularDriveParams()
{
    local /*0x35EA0000-0x00000000*/ private float InSpring[8388609], InDamping, InForceLimit;
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMesh[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bSkipFullAnimWeightBodies[9437185];


}

// Export UPhysicsAssetInstance::execSetNamedMotorsAngularPositionDrive(FFrame&, void* const)
native final function @NULL SetNamedMotorsAngularPositionDrive()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnableSwingDrive[8388609], bEnableTwistDrive;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array BoneNames[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMeshComp[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSetOtherBodiesToComplement[9437185];


}

// Export UPhysicsAssetInstance::execSetNamedMotorsAngularVelocityDrive(FFrame&, void* const)
native final function @NULL SetNamedMotorsAngularVelocityDrive()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnableSwingDrive[8388609], bEnableTwistDrive;
    local /*0x35EA0000-0x00000000*/ private editfixedsize array BoneNames[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMeshComp[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bSetOtherBodiesToComplement[9437185];


}

// Export UPhysicsAssetInstance::execSetNamedRBBoneSprings(FFrame&, void* const)
native final function @NULL SetNamedRBBoneSprings()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnable[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array BoneNames[8388609];
    local /*0x35EA0000-0x00000000*/ private float InBoneLinearSpring[8388609], InBoneAngularSpring;
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMeshComp[8388609];


}

// Export UPhysicsAssetInstance::execSetNamedBodiesBlockRigidBody(FFrame&, void* const)
native final function @NULL SetNamedBodiesBlockRigidBody()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewBlockRigidBody[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize array BoneNames[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMesh[8388609];


}

// Export UPhysicsAssetInstance::execSetFullAnimWeightBlockRigidBody(FFrame&, void* const)
native final function @NULL SetFullAnimWeightBlockRigidBody()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewBlockRigidBody[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMesh[8388609];


}

// Export UPhysicsAssetInstance::execSetFullAnimWeightBonesFixed(FFrame&, void* const)
native final function @NULL SetFullAnimWeightBonesFixed()
{
    local /*0x35EA0000-0x00000000*/ private bool bNewFixed[8388609];
    local /*0x35EA0000-0x00000400*/ private @NULL SkelMesh[8388609];


}

// Export UPhysicsAssetInstance::execFindBodyInstance(FFrame&, void* const)
native final function FindBodyInstance()
{
    local /*0x35EA0000-0x00000000*/ private name BodyName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InAsset[8388609], ReturnValue;


}

// Export UPhysicsAssetInstance::execFindConstraintInstance(FFrame&, void* const)
native final function FindConstraintInstance()
{
    local /*0x35EA0000-0x00000000*/ private name ConName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InAsset[8388609], ReturnValue;


}

defaultproperties
{
    LinearSpringScale=1.0000000
    LinearDampingScale=1.0000000
    LinearForceLimitScale=1.0000000
    AngularSpringScale=1.0000000
    AngularDampingScale=1.0000000
    AngularForceLimitScale=1.0000000
    bInitBodies=true
}