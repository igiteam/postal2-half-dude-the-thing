class ParticleModuleBeamSource extends ParticleModuleBeamBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x487F0000-0x00000000*/ private byte SourceMethod[65537];
var(*) /*0x487F0000-0x00000000*/ private byte SourceTangentMethod[65537];
var(*) /*0x487F0000-0x00000000*/ private name SourceName[65537];
var(*) /*0x487F0000-0x00000000*/ private bool bSourceAbsolute[65537];
var(*) /*0x487F0000-0x00000000*/ private bool bLockSource[65537];
var(*) /*0x487F0000-0x00000000*/ private bool bLockSourceTangent[65537];
var(*) /*0x487F0000-0x00000000*/ private bool bLockSourceStength[65537];
var(*) /*0x487F0000-0x00000000*/ private editfixedsize export @NULL Source[65537];
var(*) /*0x487F0000-0x00000000*/ private editfixedsize export @NULL SourceTangent[65537];
var(*) /*0x487F0000-0x00000000*/ private editfixedsize export @NULL SourceStrength[65537];

defaultproperties
{
    Source=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleBeamSource.DistributionSource'
    begin object name=DistributionSource class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionSource,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    SourceTangent=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleBeamSource.DistributionSourceTangent'
    begin object name=DistributionSourceTangent class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionSourceTangent,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    SourceStrength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleBeamSource.DistributionSourceStrength'
    begin object name=DistributionSourceStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionSourceStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
}