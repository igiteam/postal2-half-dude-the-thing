class ParticleModuleTypeDataBeam extends ParticleModuleTypeDataBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

enum EBeamMethod
{
    PEBM_Distance,                  // 0
    PEBM_EndPoints,                 // 1
    PEBM_EndPoints_Interpolated,    // 2
    PEBM_UserSet_EndPoints,         // 3
    PEBM_UserSet_EndPoints_Interpolated,// 4
    PEBM_MAX                        // 5
};

enum EBeamEndPointMethod
{
    PEBEPM_Calculated,              // 0
    PEBEPM_Distribution,            // 1
    PEBEPM_Distribution_Constant,   // 2
    PEBEPM_MAX                      // 3
};

var(*) /*0x06D00000-0x00000000*/ private byte BeamMethod[65537];
var(*) /*0x06D00000-0x00000000*/ private byte EndPointMethod[65537];
var(*) /*0x06D00000-0x00000000*/ private editfixedsize export @NULL Distance[65537];
var(*) /*0x06D00000-0x00000000*/ private editfixedsize export @NULL EndPoint[65537];
var(*) /*0x06D00000-0x00000000*/ private int TessellationFactor[65537];
var(*) /*0x06D00000-0x00000000*/ private editfixedsize export @NULL EmitterStrength[65537];
var(*) /*0x06D00000-0x00000000*/ private editfixedsize export @NULL TargetStrength[65537];
var(*) /*0x06D00000-0x00000000*/ private editfixedsize export @NULL EndPointDirection[65537];
var(*) /*0x06D00000-0x00000000*/ private int TextureTile[65537];
var(*) /*0x06D00000-0x00000000*/ private bool RenderGeometry[65537];
var(*) /*0x06D00000-0x00000000*/ private bool RenderDirectLine[65537];
var(*) /*0x06D00000-0x00000000*/ private bool RenderLines[65537];
var(*) /*0x06D00000-0x00000000*/ private bool RenderTessellation[65537];

defaultproperties
{
    Distance=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleTypeDataBeam.DistributionDistance'
    begin object name=DistributionDistance class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionDistance,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    EndPoint=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleTypeDataBeam.DistributionEndPoint'
    begin object name=DistributionEndPoint class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionEndPoint,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    TessellationFactor=1
    EmitterStrength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleTypeDataBeam.DistributionEmitterStrength'
    begin object name=DistributionEmitterStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionEmitterStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    TargetStrength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleTypeDataBeam.DistributionTargetStrength'
    begin object name=DistributionTargetStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionTargetStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    EndPointDirection=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleTypeDataBeam.DistributionEndPointDirection'
    begin object name=DistributionEndPointDirection class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionEndPointDirection,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    RenderGeometry=true
    bSpawnModule=true
    bUpdateModule=true
}