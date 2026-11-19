class InterpTrackFaceFX extends InterpTrack
    collapsecategories
    hidecategories(Object);

struct native FaceFXTrackKey
{
    var(*) /*0x35EA0000-0x00000000*/ private float StartTime;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string FaceFXGroupName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string FaceFXSeqName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string AkEventSoundCueOverride;

    structdefaultproperties
    {
        StartTime=0.0000000
        FaceFXGroupName=""
        FaceFXSeqName=""
        AkEventSoundCueOverride=""
    }
};

struct native FaceFXSoundCueKey
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL FaceFXSoundCue[131073];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL FaceFXAkEvent[131073];

    structdefaultproperties
    {
        FaceFXSoundCue=none
        FaceFXAkEvent=none
    }
};

var(*) /*0x2BEE0000-0x00000000*/ private editfixedsize array FaceFXAnimSets[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FaceFXSeqs;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedActorFXAsset[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FaceFXSoundCueKeys[131073];

defaultproperties
{
    TrackInstClass=Class'InterpTrackInstFaceFX'
    TrackTitle="FaceFX"
    bOnePerGroup=true
}