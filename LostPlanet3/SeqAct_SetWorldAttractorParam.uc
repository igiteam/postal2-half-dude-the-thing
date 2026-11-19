class SeqAct_SetWorldAttractorParam extends SequenceAction
    hidecategories(Object);

var(*) /*0x443D0000-0x00000000*/ private editfixedsize array Attractor[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bEnabledField;
var(*) /*0x35EA0000-0x00000000*/ private bool bFalloffTypeField;
var(*) /*0x35EA0000-0x00000000*/ private bool bFalloffExponentField;
var(*) /*0x35EA0000-0x00000000*/ private bool bRangeField;
var(*) /*0x35EA0000-0x00000000*/ private bool bStrengthField;
var(*) /*0x443D0000-0x00000000*/ private bool bEnabled[65537];
var(*) /*0x443D0000-0x00000000*/ private byte FalloffType[65537];
var(*) /*0x443D0000-0x00000000*/ private editfixedsize export @NULL FalloffExponent[65537];
var(*) /*0x443D0000-0x00000000*/ private editfixedsize export @NULL Range[65537];
var(*) /*0x443D0000-0x00000000*/ private editfixedsize export @NULL Strength[65537];

defaultproperties
{
    bEnabled=true
    FalloffExponent=(Distribution=// Reference: DistributionFloatConstant'Default__SeqAct_SetWorldAttractorParam.DistributionFalloffExponent'
    begin object name=DistributionFalloffExponent class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionFalloffExponent,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Range=(Distribution=// Reference: DistributionFloatConstant'Default__SeqAct_SetWorldAttractorParam.DistributionRange'
    begin object name=DistributionRange class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionRange,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Strength=(Distribution=// Reference: DistributionFloatConstant'Default__SeqAct_SetWorldAttractorParam.DistributionStrength'
    begin object name=DistributionStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    ObjName="Set World Attractor Param"
}