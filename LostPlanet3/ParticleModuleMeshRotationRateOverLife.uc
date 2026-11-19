class ParticleModuleMeshRotationRateOverLife extends ParticleModuleRotationRateBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x42510000-0x00000000*/ private editfixedsize export @NULL RotRate[65537];
var(*) /*0x42510000-0x00000000*/ private bool bScaleRotRate[65537];

defaultproperties
{
    RotRate=(Distribution=// Reference: DistributionVectorConstantCurve'Default__ParticleModuleMeshRotationRateOverLife.DistributionRotRate'
    begin object name=DistributionRotRate class=Class'DistributionVectorConstantCurve'
    end object
    Distribution=DistributionRotRate,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
}