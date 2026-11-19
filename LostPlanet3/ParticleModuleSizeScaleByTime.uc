class ParticleModuleSizeScaleByTime extends ParticleModuleSizeBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x3AB50000-0x00000000*/ private editfixedsize export @NULL SizeScaleByTime[65537];
var(*) /*0x3AB50000-0x00000000*/ private bool bEnableX[65537];
var(*) /*0x3AB50000-0x00000000*/ private bool bEnableY[65537];
var(*) /*0x3AB50000-0x00000000*/ private bool bEnableZ[65537];

defaultproperties
{
    SizeScaleByTime=(Distribution=// Reference: DistributionVectorConstantCurve'Default__ParticleModuleSizeScaleByTime.DistributionSizeScaleByTime'
    begin object name=DistributionSizeScaleByTime class=Class'DistributionVectorConstantCurve'
    end object
    Distribution=DistributionSizeScaleByTime,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bEnableX=true
    bEnableY=true
    bEnableZ=true
    bSpawnModule=true
    bUpdateModule=true
}