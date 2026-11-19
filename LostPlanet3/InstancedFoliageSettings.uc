class InstancedFoliageSettings extends Object
    editinlinenew
    hidecategories(Object);

enum FoliageCullOption
{
    FOLIAGECULL_Cull,               // 0
    FOLIAGECULL_ScaleZ,             // 1
    FOLIAGECULL_ScaleXYZ,           // 2
    FOLIAGECULL_TranslateZ,         // 3
    FOLIAGECULL_MAX                 // 4
};

var(*) /*0x3A050000-0x00000000*/ private float Density[65537];
var(*) /*0x3A050000-0x00000000*/ private float Radius[65537];
var(*) /*0x3A050000-0x00000000*/ private float ScaleMinX[65537];
var(*) /*0x3A050000-0x00000000*/ private float ScaleMinY[65537];
var(*) /*0x3A050000-0x00000000*/ private float ScaleMinZ[65537];
var(*) /*0x3A050000-0x00000000*/ private float ScaleMaxX[65537];
var(*) /*0x3A050000-0x00000000*/ private float ScaleMaxY[65537];
var(*) /*0x3A050000-0x00000000*/ private float ScaleMaxZ[65537];
var(*) /*0x3A050000-0x00000000*/ private bool LockScaleX[65537];
var(*) /*0x3A050000-0x00000000*/ private bool LockScaleY[65537];
var(*) /*0x3A050000-0x00000000*/ private bool LockScaleZ[65537];
var(*) /*0x3A050000-0x00000000*/ private bool AlignToNormal[65537];
var(*) /*0x3A050000-0x00000000*/ private bool RandomYaw[65537];
var(*) /*0x3A050000-0x00000000*/ private bool UniformScale[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyDensity;
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyRadius;
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyAlignToNormal;
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyRandomYaw;
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyScaleX;
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyScaleY;
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyScaleZ;
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyRandomPitchAngle;
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyGroundSlope;
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyHeight;
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyLandscapeLayer;
var(*) /*0x35EA0000-0x00000000*/ private bool ReapplyZOffset;
var(*) /*0x35EA0000-0x00000000*/ private bool IsSelected;
var(*) /*0x35EA0000-0x00000000*/ private bool ShowNothing;
var(*) /*0x35EA0000-0x00000000*/ private bool ShowPaintSettings;
var(*) /*0x35EA0000-0x00000000*/ private bool ShowInstanceSettings;
var(*) /*0x3A050000-0x00000000*/ private float AlignMaxAngle[65537];
var(*) /*0x3A050000-0x00000000*/ private float RandomPitchAngle[65537];
var(*) /*0x3A050000-0x00000000*/ private float GroundSlope[65537];
var(*) /*0x3A050000-0x00000000*/ private float HeightMin[65537];
var(*) /*0x3A050000-0x00000000*/ private float HeightMax[65537];
var(*) /*0x3A050000-0x00000000*/ private name LandscapeLayer[65537];
var(*) /*0x3A050000-0x00000000*/ private float ZOffsetMin[65537];
var(*) /*0x3A050000-0x00000000*/ private float ZOffsetMax[65537];
var(*) /*0x13530000-0x00000000*/ private int MaxInstancesPerCluster[65537];
var(*) /*0x13530000-0x00000000*/ private float MaxClusterRadius[65537];
var(*) /*0x35EA0000-0x00000000*/ private float ReapplyDensityAmount;
var(*) /*0x15190000-0x00000000*/ private int StartCullDistance[65537];
var(*) /*0x15190000-0x00000000*/ private int EndCullDistance[65537];
var(*) /*0x15190000-0x00000000*/ private byte CullOption[65537];
var(*) /*0x35EA0000-0x00000000*/ private int DisplayOrder;

defaultproperties
{
    Density=100.0000000
    ScaleMinX=1.0000000
    ScaleMinY=1.0000000
    ScaleMinZ=1.0000000
    ScaleMaxX=1.0000000
    ScaleMaxY=1.0000000
    ScaleMaxZ=1.0000000
    AlignToNormal=true
    RandomYaw=true
    UniformScale=true
    ShowPaintSettings=true
    GroundSlope=45.0000000
    HeightMin=-262144.0000000
    HeightMax=262144.0000000
    MaxInstancesPerCluster=100
    MaxClusterRadius=10000.0000000
    ReapplyDensityAmount=1.0000000
}