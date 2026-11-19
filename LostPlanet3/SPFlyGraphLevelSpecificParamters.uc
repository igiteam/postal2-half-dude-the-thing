class SPFlyGraphLevelSpecificParamters extends KynapseObject
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

var(accidentRatio) /*0x01040000-0x00000000*/ private float Radius[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private float Height[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private float Precision[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private float CellSize[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private float DistEdgeMax[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private float MaxDistanceBetweenCellBoundaryVertices[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private int UseGraphDensityParameter[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private float GraphDensity[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private float CoverageDistance[65537];
var(accidentRatio) /*0x01110000-0x00000000*/ private float OverConnectionRatio[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private float AltitudeRangeLow[65537];
var(accidentRatio) /*0x01040000-0x00000000*/ private float AltitudeRangeHigh[65537];

defaultproperties
{
    Radius=1.5000000
    Height=1.9000000
    Precision=1.0000000
    CellSize=5.0000000
    DistEdgeMax=10.0000000
    MaxDistanceBetweenCellBoundaryVertices=20.0000000
    UseGraphDensityParameter=1
    GraphDensity=10.0000000
    CoverageDistance=10.0000000
    OverConnectionRatio=1.4000000
    AltitudeRangeHigh=10.0000000
}