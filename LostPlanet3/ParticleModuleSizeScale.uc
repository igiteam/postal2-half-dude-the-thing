class ParticleModuleSizeScale extends ParticleModuleSizeBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x3AB40000-0x00000000*/ private editfixedsize export @NULL SizeScale[65537];
var(*) /*0x3AB40000-0x00000000*/ private bool EnableX[65537];
var(*) /*0x3AB40000-0x00000000*/ private bool EnableY[65537];
var(*) /*0x3AB40000-0x00000000*/ private bool EnableZ[65537];

defaultproperties
{
    SizeScale=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleSizeScale.DistributionSizeScale'
    begin object name=DistributionSizeScale class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionSizeScale,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    EnableX=true
    EnableY=true
    EnableZ=true
    bUpdateModule=true
}