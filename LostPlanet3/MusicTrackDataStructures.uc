class MusicTrackDataStructures extends Object;

struct native MusicTrackStruct
{
    var(*) /*0x34040000-0x00000000*/ private @NULL TheSoundCue[65537];
    var(*) /*0x34040000-0x00000000*/ private bool bAutoPlay[65537];
    var(*) /*0x34040000-0x00000000*/ private bool bPersistentAcrossLevels[65537];
    var(*) /*0x34040000-0x00000000*/ private float FadeInTime[65537];
    var(*) /*0x34040000-0x00000000*/ private float FadeInVolumeLevel[65537];
    var(*) /*0x34040000-0x00000000*/ private float FadeOutTime[65537];
    var(*) /*0x34040000-0x00000000*/ private float FadeOutVolumeLevel[65537];
    var(*) /*0x32E40000-0x00000000*/ private editfixedsize string MP3Filename[65537];

    structdefaultproperties
    {
        TheSoundCue=none
        bAutoPlay=false
        bPersistentAcrossLevels=false
        FadeInTime=5.0000000
        FadeInVolumeLevel=1.0000000
        FadeOutTime=5.0000000
        FadeOutVolumeLevel=0.0000000
        MP3Filename=""
    }
};
