class ParticleModuleBeamBase extends ParticleModule
    abstract
    editinlinenew
    hidecategories(Object,Object);

enum Beam2SourceTargetMethod
{
    PEB2STM_Default,                // 0
    PEB2STM_UserSet,                // 1
    PEB2STM_Emitter,                // 2
    PEB2STM_Particle,               // 3
    PEB2STM_Actor,                  // 4
    PEB2STM_MAX                     // 5
};

enum Beam2SourceTargetTangentMethod
{
    PEB2STTM_Direct,                // 0
    PEB2STTM_UserSet,               // 1
    PEB2STTM_Distribution,          // 2
    PEB2STTM_Emitter,               // 3
    PEB2STTM_MAX                    // 4
};
