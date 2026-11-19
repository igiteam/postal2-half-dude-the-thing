class InterpTrackParticleReplay extends InterpTrack
    collapsecategories
    hidecategories(Object);

struct native ParticleReplayTrackKey
{
    var(*) /*0x35EA0000-0x00000000*/ private float Time;
    var(*) /*0x3AE40000-0x00000000*/ private float Duration[65537];
    var(*) /*0x3AE40000-0x00000000*/ private int ClipIDNumber[65537];

    structdefaultproperties
    {
        Time=0.0000000
        Duration=0.0000000
        ClipIDNumber=0
    }
};

var(*) /*0x35EA0000-0x00000400*/ private editfixedsize array TrackKeys;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsCapturingReplay[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float FixedTimeStep[537001985];

defaultproperties
{
    TrackInstClass=Class'InterpTrackInstParticleReplay'
    TrackTitle="Particle Replay"
}