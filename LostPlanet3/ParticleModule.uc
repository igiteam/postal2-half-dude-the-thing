class ParticleModule extends Object
    abstract
    editinlinenew
    hidecategories(Object);

enum EModuleType
{
    EPMT_General,                   // 0
    EPMT_TypeData,                  // 1
    EPMT_Beam,                      // 2
    EPMT_Trail,                     // 3
    EPMT_Spawn,                     // 4
    EPMT_Required,                  // 5
    EPMT_Event,                     // 6
    EPMT_Decal,                     // 7
    EPMT_MAX                        // 8
};

enum EParticleSourceSelectionMethod
{
    EPSSM_Random,                   // 0
    EPSSM_Sequential,               // 1
    EPSSM_MAX                       // 2
};

struct native transient ParticleCurvePair
{
    var(*) /*0x35EA0000-0x00000010*/ private editfixedsize string CurveName;
    var(*) /*0x35EA0000-0x00000010*/ private @NULL CurveObject;

    structdefaultproperties
    {
        CurveName=""
        CurveObject=none
    }
};

struct native ParticleRandomSeedInfo
{
    var(*) /*0x3AE20000-0x00000000*/ private name ParameterName[65537];
    var(*) /*0x3AE20000-0x00000000*/ private bool bGetSeedFromInstance[65537];
    var(*) /*0x3AE20000-0x00000000*/ private bool bInstanceSeedIsIndex[65537];
    var(*) /*0x3AE20000-0x00000000*/ private bool bResetSeedOnEmitterLooping[65537];
    var(*) /*0x3AE20000-0x00000000*/ private editfixedsize array RandomSeeds[65537];

    structdefaultproperties
    {
        ParameterName="None"
        bGetSeedFromInstance=false
        bInstanceSeedIsIndex=false
        bResetSeedOnEmitterLooping=true
        RandomSeeds=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private bool bSpawnModule;
var(*) /*0x35EA0000-0x00000000*/ private bool bUpdateModule;
var(*) /*0x35EA0000-0x00000000*/ private bool bFinalUpdateModule;
var(*) /*0x35EA0000-0x00000000*/ private bool bCurvesAsColor;
var(*) /*0x11230000-0x00000000*/ private bool b3DDrawMode[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bSupported3DDrawMode;
var(*) /*0x35EA0000-0x00000000*/ private bool bEnabled;
var(*) /*0x35EA0000-0x00000000*/ private bool bEditable;
var(*) /*0x35EA0000-0x00000000*/ private bool LODDuplicate;
var(*) /*0x35EA0000-0x00000000*/ private bool bSupportsRandomSeed;
var(*) /*0x35EA0000-0x00000000*/ private bool bRequiresLoopingNotification;
var(*) /*0x35EA0000-0x00000000*/ private byte LODValidity[131073];
var(*) /*0x11230000-0x00000000*/ private @NULL ModuleEditorColor[65537];

defaultproperties
{
    bEnabled=true
    bEditable=true
    LODDuplicate=true
}