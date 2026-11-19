class ParticleModuleUberRainDrops extends ParticleModuleUberBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

var(*) /*0x2E920000-0x00000000*/ private float LifetimeMin[65537];
var(*) /*0x2E920000-0x00000000*/ private float LifetimeMax[65537];
var(*) /*0x47600000-0x00000000*/ private @NULL StartSizeMin[65537];
var(*) /*0x47600000-0x00000000*/ private @NULL StartSizeMax[65537];
var(*) /*0x4F6F0000-0x00000000*/ private @NULL StartVelocityMin[65537];
var(*) /*0x4F6F0000-0x00000000*/ private @NULL StartVelocityMax[65537];
var(*) /*0x4F6F0000-0x00000000*/ private float StartVelocityRadialMin[65537];
var(*) /*0x4F6F0000-0x00000000*/ private float StartVelocityRadialMax[65537];
var(*) /*0x13860000-0x00000000*/ private @NULL ColorOverLife[65537];
var(*) /*0x13860000-0x00000000*/ private float AlphaOverLife[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bIsUsingCylinder[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bPositive_X[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bPositive_Y[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bPositive_Z[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bNegative_X[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bNegative_Y[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bNegative_Z[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bSurfaceOnly[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bVelocity[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bRadialVelocity[65537];
var(*) /*0x2F690000-0x00000000*/ private float PC_VelocityScale[65537];
var(*) /*0x2F690000-0x00000000*/ private @NULL PC_StartLocation[65537];
var(*) /*0x2F690000-0x00000000*/ private float PC_StartRadius[65537];
var(*) /*0x2F690000-0x00000000*/ private float PC_StartHeight[65537];
var(*) /*0x2F690000-0x00000000*/ private byte PC_HeightAxis[65537];
var(*) /*0x2F690000-0x00000000*/ private @NULL StartLocationMin[65537];
var(*) /*0x2F690000-0x00000000*/ private @NULL StartLocationMax[65537];

defaultproperties
{
    LifetimeMin=1.0000000
    LifetimeMax=1.0000000
    StartSizeMin=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    StartSizeMax=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    StartVelocityMin=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    StartVelocityMax=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    ColorOverLife=(X=255.9000000,Y=255.9000000,Z=255.9000000)
    AlphaOverLife=255.9000000
    bPositive_X=true
    bPositive_Y=true
    bPositive_Z=true
    bNegative_X=true
    bNegative_Y=true
    bNegative_Z=true
    bRadialVelocity=true
    PC_VelocityScale=1.0000000
    PC_StartRadius=50.0000000
    PC_StartHeight=50.0000000
    PC_HeightAxis=CylinderHeightAxis.PMLPC_HEIGHTAXIS_Z
    bSpawnModule=true
    bUpdateModule=true
    bSupported3DDrawMode=true
}