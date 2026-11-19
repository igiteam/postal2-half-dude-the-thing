class ParticleModuleTrailSource extends ParticleModuleTrailBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum ETrail2SourceMethod
{
    PET2SRCM_Default,               // 0
    PET2SRCM_Particle,              // 1
    PET2SRCM_Actor,                 // 2
    PET2SRCM_MAX                    // 3
};

var(*) /*0x487F0000-0x00000000*/ private byte SourceMethod[65537];
var(*) /*0x487F0000-0x00000000*/ private byte SelectionMethod[65537];
var(*) /*0x487F0000-0x00000000*/ private name SourceName[65537];
var(*) /*0x487F0000-0x00000000*/ private editfixedsize export @NULL SourceStrength[65537];
var(*) /*0x487F0000-0x00000000*/ private bool bLockSourceStength[65537];
var(*) /*0x487F0000-0x00000000*/ private bool bInheritRotation[65537];
var(*) /*0x487F0000-0x00000000*/ private int SourceOffsetCount[65537];
var(*) /*0x487F0000-0x00000000*/ private editfixedsize array SourceOffsetDefaults[4259841];

defaultproperties
{
    SelectionMethod=EParticleSourceSelectionMethod.EPSSM_Sequential
    SourceStrength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleTrailSource.DistributionSourceStrength'
    begin object name=DistributionSourceStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionSourceStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
}