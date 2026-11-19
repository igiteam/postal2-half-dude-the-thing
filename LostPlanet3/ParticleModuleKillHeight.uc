class ParticleModuleKillHeight extends ParticleModuleKillBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x2D510000-0x00000000*/ private editfixedsize export @NULL Height[65537];
var(*) /*0x2D510000-0x00000000*/ private bool bAbsolute[65537];
var(*) /*0x2D510000-0x00000000*/ private bool bFloor[65537];
var(*) /*0x2D510000-0x00000000*/ private bool bApplyPSysScale[65537];

defaultproperties
{
    Height=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleKillHeight.DistributionHeight'
    begin object name=DistributionHeight class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionHeight,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bUpdateModule=true
    bSupported3DDrawMode=true
}