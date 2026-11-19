class FluidSurfaceComponent extends PrimitiveComponent
    editinlinenew
    hidecategories(Object)
    autoexpandcategories(FluidSurfaceComponent,Fluid,FluidDetail);

var(*) /*0x23A10000-0x00000000*/ private @NULL FluidMaterial[65537];
var(*) /*0x2EB00000-0x00000000*/ private int LightMapResolution[65537];
var(*) /*0x2ECC0000-0x00000000*/ private @NULL LightmassSettings[65537];
var(*) /*0x23870000-0x00000000*/ private bool EnableSimulation[65537];
var(*) /*0x23870000-0x00000000*/ private bool EnableDetail[65537];
var(*) /*0x23910000-0x00000000*/ private bool bTiling[65537];
var(*) /*0x23900000-0x00000000*/ private bool bPause[536936449];
var(*) /*0x23900000-0x00000000*/ private bool bShowSimulationNormals[536936449];
var(*) /*0x23900000-0x00000000*/ private bool bShowSimulationPosition[65537];
var(*) /*0x23900000-0x00000000*/ private bool bShowDetailNormals[65537];
var(*) /*0x23900000-0x00000000*/ private bool bShowDetailPosition[65537];
var(*) /*0x23900000-0x00000000*/ private bool bShowFluidSimulation[536936449];
var(*) /*0x23900000-0x00000000*/ private bool bShowFluidDetail[536936449];
var(*) /*0x23900000-0x00000000*/ private bool bTestRipple[65537];
var(*) /*0x23900000-0x00000000*/ private bool bTestRippleCenterOnDetail[65537];
var(*) /*0x23870000-0x00000000*/ private int SimulationQuadsX[65537];
var(*) /*0x23870000-0x00000000*/ private int SimulationQuadsY[65537];
var(*) /*0x23870000-0x00000000*/ private float GridSpacing[65537];
var(*) /*0x23870000-0x00000000*/ private float GridSpacingLowRes[65537];
var(*) /*0x23870000-0x00000000*/ private @NULL TargetSimulation[65537];
var(*) /*0x23870000-0x00000000*/ private float GPUTessellationFactor[65537];
var(*) /*0x23870000-0x00000000*/ private float FluidDamping[65537];
var(*) /*0x23870000-0x00000000*/ private float FluidTravelSpeed[65537];
var(*) /*0x23870000-0x00000000*/ private float FluidHeightScale[65537];
var(*) /*0x23870000-0x00000000*/ private float FluidUpdateRate[65537];
var(*) /*0x23870000-0x00000000*/ private float ForceImpact[65537];
var(*) /*0x23870000-0x00000000*/ private float ForceContinuous[65537];
var(*) /*0x23870000-0x00000000*/ private float LightingContrast[65537];
var(*) /*0x23870000-0x00000000*/ private @NULL TargetDetail[65537];
var(*) /*0x23870000-0x00000000*/ private float DeactivationDistance[65537];
var(*) /*0x23910000-0x00000000*/ private int DetailResolution[65537];
var(*) /*0x23910000-0x00000000*/ private float DetailSize[65537];
var(*) /*0x23910000-0x00000000*/ private float DetailDamping[65537];
var(*) /*0x23910000-0x00000000*/ private float DetailTravelSpeed[65537];
var(*) /*0x23910000-0x00000000*/ private float DetailTransfer[65537];
var(*) /*0x23910000-0x00000000*/ private float DetailHeightScale[65537];
var(*) /*0x23910000-0x00000000*/ private float DetailUpdateRate[65537];
var(*) /*0x23900000-0x00000000*/ private float NormalLength[65537];
var(*) /*0x23900000-0x00000000*/ private float TestRippleSpeed[65537];
var(*) /*0x23900000-0x00000000*/ private float TestRippleFrequency[65537];
var(*) /*0x23900000-0x00000000*/ private float TestRippleRadius[65537];
var(*) /*0x35EA0000-0x00000000*/ private float FluidWidth;
var(*) /*0x35EA0000-0x00000000*/ private float FluidHeight;
var(*) /*0x35EA0000-0x00000000*/ private float TestRippleTime[805306369];
var(*) /*0x35EA0000-0x00000000*/ private float TestRippleAngle[805306369];
var(*) /*0x35EA0000-0x00000000*/ private float DeactivationTimer[805306369];
var(*) /*0x35EA0000-0x00000000*/ private float ViewDistance[805306369];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SimulationPosition[805306369];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DetailPosition[805306369];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ClampMap[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ShadowMaps[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LightMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FluidSimulation[805437441];

// Export UFluidSurfaceComponent::execApplyForce(FFrame&, void* const)
native final function ApplyForce()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WorldPos[8388609];
    local /*0x35EA0000-0x00000000*/ private float Strength[8388609], Radius;
    local /*0x35EA0000-0x00000000*/ private bool bImpulse[9437185];


}

// Export UFluidSurfaceComponent::execSetDetailPosition(FFrame&, void* const)
native final function SetDetailPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WorldPos[8388609];


}

// Export UFluidSurfaceComponent::execSetSimulationPosition(FFrame&, void* const)
native final function SetSimulationPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL WorldPos[8388609];


}
