class KynapsePathdataFamily extends KynapseObject
    hidecategories(Object,Object);

enum DistanceMapMetric
{
    MANHATTAN_METRIC,               // 0
    CHESSBOARD_METRIC,              // 1
    DistanceMapMetric_MAX           // 2
};

struct native MaterialFlag
{
    var(accidentRatio) /*0x01DA0000-0x00000000*/ private byte TerrainTypeFlag[65537];
    var(accidentRatio) /*0x01DA0000-0x00000000*/ private editfixedsize array Materials[65537];
    var(accidentRatio) /*0x01DA0000-0x00000000*/ private editfixedsize array PhysicalMaterials[65537];

    structdefaultproperties
    {
        TerrainTypeFlag=EKynapseTerrainTypeFlagName.KynapseReservedTerrainType_Default
        Materials=none
        PhysicalMaterials=none
    }
};

var(accidentRatio) /*0x01890000-0x00000000*/ private float Radius[65537];
var(accidentRatio) /*0x01890000-0x00000000*/ private float Height[65537];
var(accidentRatio) /*0x01890000-0x00000000*/ private float StepMax[65537];
var(accidentRatio) /*0x01890000-0x00000000*/ private float SlopeMax[65537];
var(accidentRatio) /*0x01890000-0x00000000*/ private bool BackFacesWalkable[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private bool GenerateFly[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private bool bGenerateFlyLog[65537];
var(accidentRatio) /*0x02000000-0x00000000*/ private bool bShowInEditor[536870913];
var(accidentRatio) /*0x01890000-0x00000000*/ private float Precision[65537];
var(accidentRatio) /*0x01890000-0x00000000*/ private float CellSize[65537];
var(accidentRatio) /*0x01890000-0x00000000*/ private float GraphDensity[65537];
var(accidentRatio) /*0x01890000-0x00000000*/ private float AltitudeTolerance[65537];
var(accidentRatio) /*0x01890000-0x00000000*/ private int DoUseAltitudeTolerance[65537];
var(accidentRatio) /*0x01890000-0x00000000*/ private float InputTileSize[65537];
var(accidentRatio) /*0x00080000-0x00000000*/ private float JumpDownHeight[65537];
var(accidentRatio) /*0x00080000-0x00000000*/ private float AltitudeToleranceSamplingStep[65537];
var(accidentRatio) /*0x00080000-0x00000000*/ private float MinConnectedSurface[65537];
var(accidentRatio) /*0x00080000-0x00000000*/ private float TerrainTypeRasterMergeTolerance[65537];
var(accidentRatio) /*0x00080000-0x00000000*/ private float NavmeshSimplificationTolerance[65537];
var(accidentRatio) /*0x00080000-0x00000000*/ private byte NavRasterDistanceMapMetric[65537];
var(accidentRatio) /*0x01110000-0x00000000*/ private int UseGraphDensityParameter[65537];
var(accidentRatio) /*0x01110000-0x00000000*/ private float DistEdgeMax[65537];
var(accidentRatio) /*0x01110000-0x00000000*/ private float CoverageDistance[65537];
var(accidentRatio) /*0x01110000-0x00000000*/ private float MaxDistanceBetweenCellBoundaryVertices[65537];
var(accidentRatio) /*0x01110000-0x00000000*/ private float OverConnectionRatio[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private float AltitudeRangeLow[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private float AltitudeRangeHigh[65537];
var(accidentRatio) /*0x01890000-0x00000000*/ private editfixedsize array LpfContexts[65537];
var(accidentRatio) /*0x025A0000-0x00000000*/ private @NULL DisplayColor[65537];
var(accidentRatio) /*0x02000000-0x00000000*/ private @NULL DisplayMaterial;
var(accidentRatio) /*0x01890000-0x00000000*/ private editfixedsize @NULL TerrainType[65568];

defaultproperties
{
    Radius=0.3000000
    Height=1.9000000
    StepMax=0.3000000
    SlopeMax=45.0000000
    Precision=0.1000000
    CellSize=10.0000000
    GraphDensity=10.0000000
    AltitudeTolerance=0.5000000
    DoUseAltitudeTolerance=1
    AltitudeToleranceSamplingStep=0.3000000
    MinConnectedSurface=10.0000000
    TerrainTypeRasterMergeTolerance=0.1000000
    UseGraphDensityParameter=1
    DistEdgeMax=20.0000000
    CoverageDistance=10.0000000
    MaxDistanceBetweenCellBoundaryVertices=20.0000000
    OverConnectionRatio=1.4000000
    AltitudeRangeHigh=10.0000000
    DisplayMaterial=Material'EngineKynapse.DebugRenderMaterial'
}