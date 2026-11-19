class SplineComponent extends PrimitiveComponent;

var(*) /*0x492E0000-0x00000000*/ private editfixedsize @NULL SplineInfo[65537];
var(*) /*0x492E0000-0x00000000*/ private const float SplineCurviness[65537];
var(*) /*0x492E0000-0x00000000*/ private @NULL SplineColor[65537];
var(*) /*0x492E0000-0x00000000*/ private float SplineDrawRes[65537];
var(*) /*0x492E0000-0x00000000*/ private float SplineArrowSize[65537];
var(*) /*0x492E0000-0x00000000*/ private bool bSplineDisabled[65537];
var(*) /*0x492E0000-0x00000000*/ private editfixedsize @NULL SplineReparamTable[65537];

// Export USplineComponent::execUpdateSplineCurviness(FFrame&, void* const)
native function UpdateSplineCurviness();

// Export USplineComponent::execUpdateSplineReparamTable(FFrame&, void* const)
native function UpdateSplineReparamTable();

// Export USplineComponent::execGetSplineLength(FFrame&, void* const)
native function GetSplineLength()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export USplineComponent::execGetLocationAtDistanceAlongSpline(FFrame&, void* const)
native function GetLocationAtDistanceAlongSpline()
{
    local /*0x35EA0000-0x00000000*/ private float Distance[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export USplineComponent::execGetTangentAtDistanceAlongSpline(FFrame&, void* const)
native function GetTangentAtDistanceAlongSpline()
{
    local /*0x35EA0000-0x00000000*/ private float Distance[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}
