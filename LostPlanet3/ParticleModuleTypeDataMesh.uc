class ParticleModuleTypeDataMesh extends ParticleModuleTypeDataBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum EMeshScreenAlignment
{
    PSMA_MeshFaceCameraWithRoll,    // 0
    PSMA_MeshFaceCameraWithSpin,    // 1
    PSMA_MeshFaceCameraWithLockedAxis,// 2
    PSMA_MAX                        // 3
};

enum EMeshCameraFacingUpAxis
{
    CameraFacing_NoneUP,            // 0
    CameraFacing_ZUp,               // 1
    CameraFacing_NegativeZUp,       // 2
    CameraFacing_YUp,               // 3
    CameraFacing_NegativeYUp,       // 4
    CameraFacing_MAX                // 5
};

enum EMeshCameraFacingOptions
{
    XAxisFacing_NoUp,               // 0
    XAxisFacing_ZUp,                // 1
    XAxisFacing_NegativeZUp,        // 2
    XAxisFacing_YUp,                // 3
    XAxisFacing_NegativeYUp,        // 4
    LockedAxis_ZAxisFacing,         // 5
    LockedAxis_NegativeZAxisFacing, // 6
    LockedAxis_YAxisFacing,         // 7
    LockedAxis_NegativeYAxisFacing, // 8
    VelocityAligned_ZAxisFacing,    // 9
    VelocityAligned_NegativeZAxisFacing,// 10
    VelocityAligned_YAxisFacing,    // 11
    VelocityAligned_NegativeYAxisFacing,// 12
    EMeshCameraFacingOptions_MAX    // 13
};

var(*) /*0x32440000-0x00000000*/ private @NULL Mesh[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool CastShadows;
var(*) /*0x35EA0000-0x00000000*/ private bool DoCollisions;
var(*) /*0x32440000-0x00000000*/ private bool bAllowMotionBlur[65537];
var(*) /*0x32440000-0x00000000*/ private bool bOverrideMaterial[65537];
var(*) /*0x10B20000-0x00000000*/ private bool bCameraFacing[65537];
var(*) /*0x10B20000-0x00000000*/ private bool bApplyParticleRotationAsSpin[65537];
var(*) /*0x32440000-0x00000000*/ private byte MeshAlignment[65537];
var(*) /*0x38DC0000-0x00000000*/ private byte AxisLockOption[65537];
var(*) /*0x35EA0000-0x00000000*/ private transient byte CameraFacingUpAxisOption;
var(*) /*0x10B20000-0x00000000*/ private byte CameraFacingOption[65537];
var(*) /*0x38DC0000-0x00000000*/ private float Pitch[65537];
var(*) /*0x38DC0000-0x00000000*/ private float Roll[65537];
var(*) /*0x38DC0000-0x00000000*/ private float Yaw[65537];
