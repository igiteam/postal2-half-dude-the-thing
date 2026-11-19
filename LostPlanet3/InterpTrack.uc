class InterpTrack extends Object
    abstract
    collapsecategories
    noexport
    hidecategories(Object);

enum ETrackActiveCondition
{
    ETAC_Always,                    // 0
    ETAC_GoreEnabled,               // 1
    ETAC_GoreDisabled,              // 2
    ETAC_MAX                        // 3
};

struct native SupportedSubTrackInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private class SupportedClass;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string SubTrackName;
    var(*) /*0x35EA0000-0x00000000*/ private int GroupIndex;

    structdefaultproperties
    {
        SupportedClass=none
        SubTrackName=""
        GroupIndex=0
    }
};

struct native SubTrackGroup
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string GroupName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array TrackIndices;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsCollapsed;
    var(*) /*0x35EA0000-0x00000000*/ private bool bIsSelected[536870913];

    structdefaultproperties
    {
        GroupName=""
        TrackIndices=none
        bIsCollapsed=false
        bIsSelected=false
    }
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_FInterpEdInputInterface[268566529];
var(*) /*0x35EA0000-0x00000080*/ private @NULL CurveEdVTable[268435457];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SubTracks;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SubTrackGroups;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SupportedSubTracks[536870913];
var(*) /*0x35EA0000-0x00000000*/ private class TrackInstClass;
var(*) /*0x2BE60000-0x00000000*/ private byte ActiveCondition[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string TrackTitle;
var(*) /*0x35EA0000-0x00000000*/ private bool bOnePerGroup;
var(*) /*0x35EA0000-0x00000000*/ private bool bDirGroupOnly;
var(*) /*0x35EA0000-0x00000000*/ private bool bDisableTrack;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsAnimControlTrack;
var(*) /*0x35EA0000-0x00000000*/ private bool bSubTrackOnly;
var(*) /*0x35EA0000-0x00000000*/ private bool bVisible[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsSelected[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsRecording[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsCollapsed;

defaultproperties
{
    TrackInstClass=Class'InterpTrackInst'
    TrackTitle="Track"
    bVisible=true
}