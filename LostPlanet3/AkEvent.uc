class AkEvent extends AkBaseSoundObject
    perobjectconfig;

struct native SimpleTrackInfo
{
    var(*) /*0x47550000-0x00000000*/ private editfixedsize string Title;
    var(*) /*0x47550000-0x00000000*/ private editfixedsize string Artist;

    structdefaultproperties
    {
        Title=""
        Artist=""
    }
};

var(*) /*0x35EA0000-0x00000000*/ private float Duration;
var(*) /*0x01EC0000-0x00000000*/ private const name SoundClass[65537];
var(*) /*0x35EA0000-0x00000000*/ private byte SoundClassName;
var(*) /*0x01EC0000-0x00000000*/ private @NULL FaceFXAnimSetRef[65537];
var(*) /*0x01EC0000-0x00000000*/ private editfixedsize string FaceFXGroupName[65537];
var(*) /*0x01EC0000-0x00000000*/ private editfixedsize string FaceFXAnimName[65537];
var(*) /*0x35EA0000-0x00000000*/ private int PauseRefCnt[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bPausedWithGamePause[536870913];
var(*) /*0x4AE30000-0x00000000*/ private bool bMature;
var(*) /*0x4AE30000-0x00000000*/ private bool bManualWordWrap;
var(*) /*0x4AE30000-0x00000000*/ private bool bSingleLine;
var(*) /*0x4AE30000-0x00000000*/ private bool bShowSubtitleOnceOnly[65537];
var(*) /*0x4AE30000-0x00000000*/ private editfixedsize array Subtitles;
var(*) /*0x4AE30000-0x00000000*/ private editfixedsize string Comment;
var(*) /*0x4AE30000-0x00000000*/ private float Priority[65537];
var(*) /*0x4AE30000-0x00000000*/ private float InitialDelay[65537];
var(*) /*0x4AE30000-0x00000000*/ private float ExtraSubtitleDuration;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array LocalizedSubtitles;
var(*) /*0x34010000-0x00000000*/ private editfixedsize string PlaylistName;
var(*) /*0x34010000-0x00000000*/ private editfixedsize array TrackList[65537];
var(*) /*0x01EC0000-0x00000000*/ private @NULL RequiredBank[65537];

defaultproperties
{
    Priority=1.0000000
}