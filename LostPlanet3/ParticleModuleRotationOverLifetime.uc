class ParticleModuleRotationOverLifetime extends ParticleModuleRotationBase
    editinlinenew
    hidecategories(Object,Object,Object);

var(*) /*0x42510000-0x00000000*/ private editfixedsize export @NULL RotationOverLife[65537];
var(*) /*0x42510000-0x00000000*/ private bool Scale[65537];

defaultproperties
{
    RotationOverLife=(Distribution=// Reference: DistributionFloatConstantCurve'Default__ParticleModuleRotationOverLifetime.DistributionRotOverLife'
    begin object name=DistributionRotOverLife class=Class'DistributionFloatConstantCurve'
    end object
    Distribution=DistributionRotOverLife,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Scale=true
    bUpdateModule=true
}