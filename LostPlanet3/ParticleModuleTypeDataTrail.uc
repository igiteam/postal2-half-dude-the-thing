class ParticleModuleTypeDataTrail extends ParticleModuleTypeDataBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

var(*) /*0x4D6C0000-0x00000000*/ private bool RenderGeometry[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool RenderLines[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool RenderTessellation[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool Tapered[65537];
var(*) /*0x4D6C0000-0x00000000*/ private bool SpawnByDistance[65537];
var(*) /*0x4D6C0000-0x00000000*/ private int TessellationFactor[65537];
var(*) /*0x4D6C0000-0x00000000*/ private editfixedsize export @NULL Tension[65537];
var(*) /*0x4D6C0000-0x00000000*/ private @NULL SpawnDistance[65537];

defaultproperties
{
    RenderGeometry=true
    TessellationFactor=1
    Tension=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleTypeDataTrail.DistributionTension'
    begin object name=DistributionTension class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionTension,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    SpawnDistance=(X=5.0000000,Y=5.0000000,Z=5.0000000)
}