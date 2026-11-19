class ParticleEmitter extends Object
    abstract
    editinlinenew
    hidecategories(Object);

enum EParticleBurstMethod
{
    EPBM_Instant,                   // 0
    EPBM_Interpolated,              // 1
    EPBM_MAX                        // 2
};

enum EParticleSubUVInterpMethod
{
    PSUVIM_None,                    // 0
    PSUVIM_Linear,                  // 1
    PSUVIM_Linear_Blend,            // 2
    PSUVIM_Random,                  // 3
    PSUVIM_Random_Blend,            // 4
    PSUVIM_MAX                      // 5
};

enum EEmitterRenderMode
{
    ERM_Normal,                     // 0
    ERM_Point,                      // 1
    ERM_Cross,                      // 2
    ERM_NormalPoint,                // 3
    ERM_NormalQuad,                 // 4
    ERM_NormalTracer,               // 5
    ERM_None,                       // 6
    ERM_MAX                         // 7
};

struct native ParticleBurst
{
    var(*) /*0x3A470000-0x00000000*/ private int Count[65537];
    var(*) /*0x3A470000-0x00000000*/ private int CountLow[65537];
    var(*) /*0x3A470000-0x00000000*/ private float Time[65537];

    structdefaultproperties
    {
        Count=0
        CountLow=-1
        Time=0.0000000
    }
};

var(*) /*0x3A420000-0x00000000*/ private name EmitterName[65537];
var(*) /*0x35EA0000-0x00000000*/ private int SubUVDataOffset[536870913];
var(*) /*0x11230000-0x00000000*/ private byte EmitterRenderMode[65537];
var(*) /*0x11230000-0x00000000*/ private @NULL EmitterEditorColor[65537];
var(*) /*0x35EA0000-0x00000400*/ private editfixedsize array LODLevels[524289];
var(*) /*0x35EA0000-0x00000000*/ private bool ConvertedModules;
var(*) /*0x11230000-0x00000000*/ private bool bCollapsed[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsSoloing[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bCookedOut;
var(*) /*0x35EA0000-0x00000000*/ private int PeakActiveParticles;
var(*) /*0x3A420000-0x00000000*/ private int InitialAllocationCount[65537];
var(*) /*0x3A420000-0x00000000*/ private float MediumDetailSpawnRateScale[65537];

// Export UParticleEmitter::execGetMaxLifespan(FFrame&, void* const)
native function GetMaxLifespan()
{
    local /*0x35EA0000-0x00000000*/ private float InComponentDelay[8388609], ReturnValue;


}

defaultproperties
{
    EmitterName="Particle Emitter"
    ConvertedModules=true
    MediumDetailSpawnRateScale=1.0000000
}