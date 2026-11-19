class ParticleModuleBeamModifier extends ParticleModuleBeamBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum BeamModifierType
{
    PEB2MT_Source,                  // 0
    PEB2MT_Target,                  // 1
    PEB2MT_MAX                      // 2
};

struct native BeamModifierOptions
{
    var(*) /*0x06D40000-0x00000000*/ private bool bModify[65537];
    var(*) /*0x06D40000-0x00000000*/ private bool bScale[65537];
    var(*) /*0x06D40000-0x00000000*/ private bool bLock[65537];

    structdefaultproperties
    {
        bModify=false
        bScale=false
        bLock=false
    }
};

var(*) /*0x33500000-0x00000000*/ private byte ModifierType[65537];
var(*) /*0x3D870000-0x00000000*/ private @NULL PositionOptions[65537];
var(*) /*0x3D870000-0x00000000*/ private editfixedsize export @NULL Position[65537];
var(*) /*0x4B4A0000-0x00000000*/ private @NULL TangentOptions[65537];
var(*) /*0x4B4A0000-0x00000000*/ private editfixedsize export @NULL Tangent[65537];
var(*) /*0x4B4A0000-0x00000000*/ private bool bAbsoluteTangent[65537];
var(*) /*0x4AA90000-0x00000000*/ private @NULL StrengthOptions[65537];
var(*) /*0x4AA90000-0x00000000*/ private editfixedsize export @NULL Strength[65537];

defaultproperties
{
    Position=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleBeamModifier.DistributionPosition'
    begin object name=DistributionPosition class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionPosition,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Tangent=(Distribution=// Reference: DistributionVectorConstant'Default__ParticleModuleBeamModifier.DistributionTangent'
    begin object name=DistributionTangent class=Class'DistributionVectorConstant'
    end object
    Distribution=DistributionTangent,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=3,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
    Strength=(Distribution=// Reference: DistributionFloatConstant'Default__ParticleModuleBeamModifier.DistributionStrength'
    begin object name=DistributionStrength class=Class'DistributionFloatConstant'
    end object
    Distribution=DistributionStrength,Type=0,Op=1,LookupTableNumElements=1,LookupTableChunkSize=1,LookupTable=/* Array type was not detected. */,LookupTableTimeScale=0.0000000,LookupTableStartTime=0.0000000,InterpChannel=0,bUseExtremes=0,Pad1=0,Pad2=0)
}