class ParticleSystemReplay extends Object
    hidecategories(Object)
    autoexpandcategories(ParticleSystemReplay);

struct native ParticleEmitterReplayFrame
{
    var(*) /*0x35EA0000-0x00000000*/ private int EmitterType[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private int OriginalEmitterIndex[268566529];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL FrameState[268566529];
};

struct native ParticleSystemReplayFrame
{
    var(*) /*0x35EA0000-0x00000000*/ private array Emitters[268566529];
};

var(*) /*0x3AF40000-0x00000000*/ private int ClipIDNumber[268500993];
var(*) /*0x35EA0000-0x00000000*/ private array Frames[268566529];
