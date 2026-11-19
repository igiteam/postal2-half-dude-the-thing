class ParticleModuleLocationEmitter extends ParticleModuleLocationBase
    editinlinenew
    hidecategories(Object,Object,Object);

enum ELocationEmitterSelectionMethod
{
    ELESM_Random,                   // 0
    ELESM_Sequential,               // 1
    ELESM_MAX                       // 2
};

var(*) /*0x2F690000-0x00000200*/ private name EmitterName[589825];
var(*) /*0x2F690000-0x00000000*/ private byte SelectionMethod[65537];
var(*) /*0x2F690000-0x00000000*/ private bool InheritSourceVelocity[65537];
var(*) /*0x2F690000-0x00000000*/ private bool bInheritSourceRotation[65537];
var(*) /*0x2F690000-0x00000000*/ private float InheritSourceVelocityScale[65537];
var(*) /*0x2F690000-0x00000000*/ private float InheritSourceRotationScale[65537];

defaultproperties
{
    InheritSourceVelocityScale=1.0000000
    InheritSourceRotationScale=1.0000000
    bSpawnModule=true
}