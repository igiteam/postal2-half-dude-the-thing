class ParticleModuleVelocityOverLifetime extends ParticleModuleVelocityBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x4F6F0000-0x00000000*/ private editfixedsize export @NULL VelOverLife[65537];
var(*) /*0x4F6F0000-0x00000000*/ private bool Absolute[589825];

defaultproperties
{
    VelOverLife=(Distribution=// Reference: DistributionVectorConstantCurve'Default__ParticleModuleVelocityOverLifetime.DistributionVelOverLife'
    begin object name=DistributionVelOverLife class=Class'DistributionVectorConstantCurve'
    end object
    Distribution=DistributionVelOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bSpawnModule=true
    bUpdateModule=true
}