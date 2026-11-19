class InterpTrackEvent extends InterpTrack
    collapsecategories
    hidecategories(Object);

struct native EventTrackKey
{
    var(*) /*0x35EA0000-0x00000000*/ private float Time;
    var(*) /*0x219B0000-0x00000000*/ private name EventName[65537];

    structdefaultproperties
    {
        Time=0.0000000
        EventName="None"
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array EventTrack;
var(*) /*0x2BED0000-0x00000000*/ private bool bFireEventsWhenForwards[65537];
var(*) /*0x2BED0000-0x00000000*/ private bool bFireEventsWhenBackwards[65537];
var(*) /*0x2BED0000-0x00000000*/ private bool bFireEventsWhenJumpingForwards[65537];

defaultproperties
{
    bFireEventsWhenForwards=true
    bFireEventsWhenBackwards=true
    TrackInstClass=Class'InterpTrackInstEvent'
    TrackTitle="Event"
}