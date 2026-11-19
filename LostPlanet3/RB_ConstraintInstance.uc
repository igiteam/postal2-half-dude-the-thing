class RB_ConstraintInstance extends Object
    hidecategories(Object);

var(*) /*0x35EA0000-0x00000000*/ private @NULL Owner[537001985];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL OwnerComponent[537526273];
var(*) /*0x35EA0000-0x00000000*/ private int ConstraintIndex[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SceneIndex[268566529];
var(*) /*0x35EA0000-0x00000000*/ private bool bInHardware[268566529];
var(*) /*0x2EF00000-0x00000000*/ private bool bLinearXPositionDrive[196609];
var(*) /*0x2EF00000-0x00000000*/ private bool bLinearXVelocityDrive[196609];
var(*) /*0x2EF00000-0x00000000*/ private bool bLinearYPositionDrive[196609];
var(*) /*0x2EF00000-0x00000000*/ private bool bLinearYVelocityDrive[196609];
var(*) /*0x2EF00000-0x00000000*/ private bool bLinearZPositionDrive[196609];
var(*) /*0x2EF00000-0x00000000*/ private bool bLinearZVelocityDrive[196609];
var(*) /*0x027F0000-0x00000000*/ private bool bSwingPositionDrive[196609];
var(*) /*0x027F0000-0x00000000*/ private bool bSwingVelocityDrive[196609];
var(*) /*0x027F0000-0x00000000*/ private bool bTwistPositionDrive[196609];
var(*) /*0x027F0000-0x00000000*/ private bool bTwistVelocityDrive[196609];
var(*) /*0x027F0000-0x00000000*/ private bool bAngularSlerpDrive[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bTerminated;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ConstraintData[268566529];
var(*) /*0x2EF00000-0x00000000*/ private @NULL LinearPositionTarget[196609];
var(*) /*0x2EF00000-0x00000000*/ private @NULL LinearVelocityTarget[196609];
var(*) /*0x2EF00000-0x00000000*/ private float LinearDriveSpring[196609];
var(*) /*0x2EF00000-0x00000000*/ private float LinearDriveDamping[196609];
var(*) /*0x2EF00000-0x00000000*/ private float LinearDriveForceLimit[196609];
var(*) /*0x027F0000-0x00000000*/ private @NULL AngularPositionTarget[196609];
var(*) /*0x027F0000-0x00000000*/ private @NULL AngularVelocityTarget[196609];
var(*) /*0x027F0000-0x00000000*/ private float AngularDriveSpring[196609];
var(*) /*0x027F0000-0x00000000*/ private float AngularDriveDamping[196609];
var(*) /*0x027F0000-0x00000000*/ private float AngularDriveForceLimit[196609];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DummyKinActor[268566529];

// Export URB_ConstraintInstance::execInitConstraint(FFrame&, void* const)
native final function @NULL InitConstraint()
{
    local /*0x35EA0000-0x00000400*/ private @NULL PrimComp1[8388609], PrimComp2, Setup;
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL InOwner[8388609], InPrimComp;
    local /*0x35EA0000-0x00000000*/ private bool bMakeKinForBody1[8388609];


}

// Export URB_ConstraintInstance::execTermConstraint(FFrame&, void* const)
native final function TermConstraint();

// Export URB_ConstraintInstance::execGetPhysicsAssetInstance(FFrame&, void* const)
native final function GetPhysicsAssetInstance()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export URB_ConstraintInstance::execGetConstraintLocation(FFrame&, void* const)
native final function GetConstraintLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export URB_ConstraintInstance::execSetLinearPositionDrive(FFrame&, void* const)
native final function SetLinearPositionDrive()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnableXDrive[8388609], bEnableYDrive, bEnableZDrive;


}

// Export URB_ConstraintInstance::execSetLinearVelocityDrive(FFrame&, void* const)
native final function SetLinearVelocityDrive()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnableXDrive[8388609], bEnableYDrive, bEnableZDrive;


}

// Export URB_ConstraintInstance::execSetAngularPositionDrive(FFrame&, void* const)
native final function SetAngularPositionDrive()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnableSwingDrive[8388609], bEnableTwistDrive;


}

// Export URB_ConstraintInstance::execSetAngularVelocityDrive(FFrame&, void* const)
native final function SetAngularVelocityDrive()
{
    local /*0x35EA0000-0x00000000*/ private bool bEnableSwingDrive[8388609], bEnableTwistDrive;


}

// Export URB_ConstraintInstance::execSetLinearPositionTarget(FFrame&, void* const)
native final function SetLinearPositionTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPosTarget[8388609];


}

// Export URB_ConstraintInstance::execSetLinearVelocityTarget(FFrame&, void* const)
native final function SetLinearVelocityTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InVelTarget[8388609];


}

// Export URB_ConstraintInstance::execSetLinearDriveParams(FFrame&, void* const)
native final function SetLinearDriveParams()
{
    local /*0x35EA0000-0x00000000*/ private float InSpring[8388609], InDamping, InForceLimit;


}

// Export URB_ConstraintInstance::execSetAngularPositionTarget(FFrame&, void* const)
native final function SetAngularPositionTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPosTarget[25296897];


}

// Export URB_ConstraintInstance::execSetAngularVelocityTarget(FFrame&, void* const)
native final function SetAngularVelocityTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InVelTarget[8388609];


}

// Export URB_ConstraintInstance::execSetAngularDriveParams(FFrame&, void* const)
native final function SetAngularDriveParams()
{
    local /*0x35EA0000-0x00000000*/ private float InSpring[8388609], InDamping, InForceLimit;


}

// Export URB_ConstraintInstance::execSetAngularDOFLimitScale(FFrame&, void* const)
native final function SetAngularDOFLimitScale()
{
    local /*0x35EA0000-0x00000000*/ private float InSwing1LimitScale[8388609], InSwing2LimitScale, InTwistLimitScale;
    local /*0x35EA0000-0x00000000*/ private @NULL InSetup[8388609];


}

// Export URB_ConstraintInstance::execSetLinearLimitSize(FFrame&, void* const)
native final function SetLinearLimitSize()
{
    local /*0x35EA0000-0x00000000*/ private float NewLimitSize[8388609];


}

// Export URB_ConstraintInstance::execMoveKinActorTransform(FFrame&, void* const)
native final function MoveKinActorTransform()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTM[25165825];


}

defaultproperties
{
    LinearDriveSpring=50.0000000
    LinearDriveDamping=1.0000000
    AngularPositionTarget=(X=0.0000000,Y=0.0000000,Z=0.0000000,W=1.0000000)
    AngularDriveSpring=50.0000000
    AngularDriveDamping=1.0000000
}