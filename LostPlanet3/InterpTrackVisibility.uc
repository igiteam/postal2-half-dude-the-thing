class InterpTrackVisibility extends InterpTrack
    collapsecategories
    hidecategories(Object);

enum EVisibilityTrackAction
{
    EVTA_Hide,                      // 0
    EVTA_Show,                      // 1
    EVTA_Toggle,                    // 2
    EVTA_MAX                        // 3
};

enum EVisibilityTrackCondition
{
    EVTC_Always,                    // 0
    EVTC_GoreEnabled,               // 1
    EVTC_GoreDisabled,              // 2
    EVTC_MAX                        // 3
};

struct native VisibilityTrackKey
{
    var(*) /*0x35EA0000-0x00000000*/ private float Time;
    var(*) /*0x50010000-0x00000000*/ private byte Action[65537];
    var(*) /*0x35EA0000-0x00000000*/ private byte ActiveCondition;

    structdefaultproperties
    {
        Time=0.0000000
        Action=EVisibilityTrackAction.EVTA_Hide
        ActiveCondition=EVisibilityTrackCondition.EVTC_Always
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array VisibilityTrack;
var(*) /*0x2C1F0000-0x00000000*/ private bool bFireEventsWhenForwards[65537];
var(*) /*0x2C1F0000-0x00000000*/ private bool bFireEventsWhenBackwards[65537];
var(*) /*0x2C1F0000-0x00000000*/ private bool bFireEventsWhenJumpingForwards[65537];

defaultproperties
{
    bFireEventsWhenForwards=true
    bFireEventsWhenBackwards=true
    bFireEventsWhenJumpingForwards=true
    TrackInstClass=Class'InterpTrackInstVisibility'
    TrackTitle="Visibility"
}