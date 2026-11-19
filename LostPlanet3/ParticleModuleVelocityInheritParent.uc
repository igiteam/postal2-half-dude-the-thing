class ParticleModuleVelocityInheritParent extends ParticleModuleVelocityBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x4F6F0000-0x00000000*/ private editfixedsize export @NULL Scale[65537];
var(*) /*0x4F6F0000-0x00000000*/ private float ParentAmount[65537];
var(*) /*0x4F6F0000-0x00000000*/ private float OwnerAmount[65537];

defaultproperties
{
    Scale=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleVelocityInheritParent.DistributionScale'
    begin object name=DistributionScale class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionScale,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    ParentAmount=1.0000000
    bSpawnModule=true
}