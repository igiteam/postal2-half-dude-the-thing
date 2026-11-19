class ParticleModuleEventGenerator extends ParticleModuleEventBase
    editinlinenew
    hidecategories(Object,Object,Object);

struct native ParticleEvent_GenerateInfo
{
    var(*) /*0x3A4E0000-0x00000000*/ private byte Type[65537];
    var(*) /*0x3A4E0000-0x00000000*/ private int Frequency[65537];
    var(*) /*0x3A4E0000-0x00000000*/ private int LowFreq[65537];
    var(*) /*0x3A4E0000-0x00000000*/ private int ParticleFrequency[65537];
    var(*) /*0x3A4E0000-0x00000000*/ private bool FirstTimeOnly[65537];
    var(*) /*0x3A4E0000-0x00000000*/ private bool LastTimeOnly[65537];
    var(*) /*0x3A4E0000-0x00000000*/ private bool UseReflectedImpactVector[65537];
    var(*) /*0x3A4E0000-0x00000000*/ private name CustomName[65537];
    var(*) /*0x3A4E0000-0x00000400*/ private editfixedsize array ParticleModuleEventsToSendToGame[65537];

    structdefaultproperties
    {
        Type=EParticleEventType.EPET_Any
        Frequency=0
        LowFreq=-1
        ParticleFrequency=0
        FirstTimeOnly=false
        LastTimeOnly=false
        UseReflectedImpactVector=false
        CustomName="None"
        ParticleModuleEventsToSendToGame=none
    }
};

var(*) /*0x21950000-0x00000200*/ private editfixedsize array Events[589825];

defaultproperties
{
    bSpawnModule=true
    bUpdateModule=true
}