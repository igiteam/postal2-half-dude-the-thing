class ParticleModuleMeshRotation extends ParticleModuleRotationBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x42510000-0x00000000*/ private editfixedsize export @NULL StartRotation[65537];
var(*) /*0x42510000-0x00000000*/ private bool bInheritParent[65537];

defaultproperties
{
    StartRotation=(Distribution=// Reference: DistributionVectorUniform'Default__ParticleModuleMeshRotation.DistributionStartRotation'
    begin object name=DistributionStartRotation class=Class'DistributionVectorUniform'
    end object
    Distribution=DistributionStartRotation,Type=0,Op=2,LookupTableNumElements=2,LookupTableChunkSize=6,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
}