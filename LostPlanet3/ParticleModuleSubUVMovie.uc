class ParticleModuleSubUVMovie extends ParticleModuleSubUV
    editinlinenew
    hidecategories(Object,Object,Object,Object,SubUV);

var(*) /*0x23690000-0x00000000*/ private bool bUseEmitterTime[65537];
var(*) /*0x23690000-0x00000000*/ private editfixedsize export @NULL FrameRate[65537];
var(*) /*0x23690000-0x00000000*/ private int StartingFrame[65537];

defaultproperties
{
    FrameRate=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleSubUVMovie.DistributionFrameRate'
    begin object name=DistributionFrameRate class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionFrameRate,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    StartingFrame=1
    SubImageIndex=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleSubUVMovie.DistributionSubImage'
    begin object name=DistributionSubImage
    end object
    Distribution=DistributionSubImage)
}