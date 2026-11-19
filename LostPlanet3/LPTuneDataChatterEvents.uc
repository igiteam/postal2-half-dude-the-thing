class LPTuneDataChatterEvents extends SPEngineTuneDataBase
    hidecategories(Object,Object,Object);

struct native ChatterInfoStruct
{
    var(0.25_Pct) /*0x20410000-0x00000000*/ private byte ChatterReplication[65537];
    var(0.25_Pct) /*0x20410000-0x00000000*/ private int ChatterPriority[65537];
    var(0.25_Pct) /*0x20410000-0x00000000*/ private bool bShouldOverride[65537];
    var(0.25_Pct) /*0x20410000-0x00000000*/ private bool bShouldQueue[65537];
    var(0.25_Pct) /*0x20410000-0x00000000*/ private float ChatterProbability[65537];
    var(0.25_Pct) /*0x20410000-0x00000000*/ private float SpamBlockTime[65537];

    structdefaultproperties
    {
        ChatterReplication=eChatterReplicationType.CRT_LocalClient
        ChatterPriority=0
        bShouldOverride=false
        bShouldQueue=false
        ChatterProbability=1.0000000
        SpamBlockTime=0.0000000
    }
};

var(0.25_Pct) /*0x89AD0000-0x00000000*/ private int LowHealthThreshold[65537];
var(0.25_Pct) /*0x89AD0000-0x00000000*/ private float KillStreakBaseProbability[65537];
var(0.25_Pct_6946815) /*0x89AD0000-0x00000400*/ private @NULL ChatterEvents[589847];

defaultproperties
{
    ChatterEvents[0]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[1]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[2]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[3]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[4]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[5]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[6]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[7]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[8]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[9]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[10]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[11]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[12]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[13]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[14]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[15]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[16]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[17]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[18]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[19]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[20]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[21]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
    ChatterEvents[22]=(ChatterReplication=eChatterReplicationType.CRT_LocalClient,ChatterPriority=0,bShouldOverride=false,bShouldQueue=false,ChatterProbability=1.0000000,SpamBlockTime=0.0000000)
}