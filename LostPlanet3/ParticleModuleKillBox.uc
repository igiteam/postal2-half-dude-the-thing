class ParticleModuleKillBox extends ParticleModuleKillBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x2D510000-0x00000000*/ private editfixedsize export @NULL LowerLeftCorner[65537];
var(*) /*0x2D510000-0x00000000*/ private editfixedsize export @NULL UpperRightCorner[65537];
var(*) /*0x2D510000-0x00000000*/ private bool bAbsolute[65537];
var(*) /*0x2D510000-0x00000000*/ private bool bKillInside[65537];
var(*) /*0x2D510000-0x00000000*/ private bool bAxisAlignedAndFixedSize[65537];

defaultproperties
{
    LowerLeftCorner=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleKillBox.DistributionLowerLeftCorner'
    begin object name=DistributionLowerLeftCorner class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionLowerLeftCorner,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    UpperRightCorner=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleKillBox.DistributionUpperRightCorner'
    begin object name=DistributionUpperRightCorner class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionUpperRightCorner,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    bAxisAlignedAndFixedSize=true
    bUpdateModule=true
    bSupported3DDrawMode=true
}