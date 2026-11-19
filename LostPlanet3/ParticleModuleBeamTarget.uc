class ParticleModuleBeamTarget extends ParticleModuleBeamBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x4B590000-0x00000000*/ private byte TargetMethod[65537];
var(*) /*0x4B590000-0x00000000*/ private byte TargetTangentMethod[65537];
var(*) /*0x4B590000-0x00000000*/ private name TargetName[65537];
var(*) /*0x4B590000-0x00000000*/ private editfixedsize export @NULL Target[65537];
var(*) /*0x4B590000-0x00000000*/ private bool bTargetAbsolute[65537];
var(*) /*0x4B590000-0x00000000*/ private bool bLockTarget[65537];
var(*) /*0x4B590000-0x00000000*/ private bool bLockTargetTangent[65537];
var(*) /*0x4B590000-0x00000000*/ private bool bLockTargetStength[65537];
var(*) /*0x4B590000-0x00000000*/ private editfixedsize export @NULL TargetTangent[65537];
var(*) /*0x4B590000-0x00000000*/ private editfixedsize export @NULL TargetStrength[65537];
var(*) /*0x4B590000-0x00000000*/ private float LockRadius[65537];

defaultproperties
{
    Target=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleBeamTarget.DistributionTarget'
    begin object name=DistributionTarget class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionTarget,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    TargetTangent=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleBeamTarget.DistributionTargetTangent'
    begin object name=DistributionTargetTangent class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionTargetTangent,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    TargetStrength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleBeamTarget.DistributionTargetStrength'
    begin object name=DistributionTargetStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionTargetStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    LockRadius=10.0000000
}