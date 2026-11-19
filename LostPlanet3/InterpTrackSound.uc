class InterpTrackSound extends InterpTrackVectorBase
    collapsecategories
    hidecategories(Object);

struct native SoundTrackKey
{
    var(*) /*0x35EA0000-0x00000000*/ private float Time;
    var(*) /*0x35EA0000-0x00000000*/ private float Volume;
    var(*) /*0x35EA0000-0x00000000*/ private float Pitch;
    var(*) /*0x487D0000-0x00000000*/ private @NULL Sound[65537];

    structdefaultproperties
    {
        Time=0.0000000
        Volume=1.0000000
        Pitch=1.0000000
        Sound=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Sounds;
var(*) /*0x2C1A0000-0x00000000*/ private bool bPlayOnReverse[65537];
var(*) /*0x2C1A0000-0x00000000*/ private bool bContinueSoundOnMatineeEnd[65537];
var(*) /*0x2C1A0000-0x00000000*/ private bool bSuppressSubtitles[65537];
var(*) /*0x2C1A0000-0x00000000*/ private bool bTreatAsDialogue[65537];

defaultproperties
{
    TrackInstClass=Class'InterpTrackInstSound'
    TrackTitle="Sound"
}