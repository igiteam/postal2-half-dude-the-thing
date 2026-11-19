class FluidInfluenceComponent extends PrimitiveComponent
    editinlinenew
    hidecategories(Object,Collision,Lighting,Physics,PrimitiveComponent,Rendering)
    autoexpandcategories(FluidInfluenceComponent);

enum EInfluenceType
{
    Fluid_Flow,                     // 0
    Fluid_Raindrops,                // 1
    Fluid_Wave,                     // 2
    Fluid_Sphere,                   // 3
    Fluid_MAX                       // 4
};

var(*) /*0x23980000-0x00000000*/ private bool bActive[65537];
var(*) /*0x239A0000-0x00000000*/ private editconst bool RaindropFillEntireFluid[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsToggleTriggered[536870913];
var(*) /*0x23980000-0x00000000*/ private @NULL FluidActor[65537];
var(*) /*0x23980000-0x00000000*/ private byte InfluenceType[65537];
var(*) /*0x23980000-0x00000000*/ private float MaxDistance[65537];
var(*) /*0x23A40000-0x00000000*/ private editconst float WaveStrength[65537];
var(*) /*0x23A40000-0x00000000*/ private editconst float WaveFrequency[65537];
var(*) /*0x23A40000-0x00000000*/ private editconst float WavePhase[65537];
var(*) /*0x23A40000-0x00000000*/ private editconst float WaveRadius[65537];
var(*) /*0x239A0000-0x00000000*/ private editconst float RaindropAreaRadius[65537];
var(*) /*0x239A0000-0x00000000*/ private editconst float RaindropRadius[65537];
var(*) /*0x239A0000-0x00000000*/ private editconst float RaindropStrength[65537];
var(*) /*0x239A0000-0x00000000*/ private editconst float RaindropRate[65537];
var(*) /*0x23930000-0x00000000*/ private editconst float FlowSpeed[65537];
var(*) /*0x23930000-0x00000000*/ private editconst int FlowNumRipples[65537];
var(*) /*0x23930000-0x00000000*/ private editconst float FlowSideMotionRadius[65537];
var(*) /*0x23930000-0x00000000*/ private editconst float FlowWaveRadius[65537];
var(*) /*0x23930000-0x00000000*/ private editconst float FlowStrength[65537];
var(*) /*0x23930000-0x00000000*/ private editconst float FlowFrequency[65537];
var(*) /*0x239E0000-0x00000000*/ private editconst float SphereOuterRadius[65537];
var(*) /*0x239E0000-0x00000000*/ private editconst float SphereInnerRadius[65537];
var(*) /*0x239E0000-0x00000000*/ private editconst float SphereStrength[65537];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentAngle[805306369];
var(*) /*0x35EA0000-0x00000000*/ private float CurrentTimer[805306369];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurrentFluidActor[805306369];
