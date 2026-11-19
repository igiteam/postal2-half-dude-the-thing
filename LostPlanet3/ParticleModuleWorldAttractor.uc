class ParticleModuleWorldAttractor extends ParticleModuleWorldForcesBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x3ADF0000-0x00000000*/ private bool bParticleLifeRelative[65537];
var(*) /*0x3ADF0000-0x00000000*/ private editfixedsize export @NULL AttractorInfluence[65537];

defaultproperties
{
    AttractorInfluence=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleWorldAttractor.DistributionInfluence'
    begin object name=DistributionInfluence class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionInfluence,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bUpdateModule=true
}