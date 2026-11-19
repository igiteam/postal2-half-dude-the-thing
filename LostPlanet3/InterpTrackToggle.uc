class InterpTrackToggle extends InterpTrack
    collapsecategories
    hidecategories(Object);

enum ETrackToggleAction
{
    ETTA_Off,                       // 0
    ETTA_On,                        // 1
    ETTA_Toggle,                    // 2
    ETTA_Trigger,                   // 3
    ETTA_MAX                        // 4
};

struct native ToggleTrackKey
{
    var(*) /*0x35EA0000-0x00000000*/ private float Time;
    var(*) /*0x4D090000-0x00000000*/ private byte ToggleAction[65537];

    structdefaultproperties
    {
        Time=0.0000000
        ToggleAction=ETrackToggleAction.ETTA_Off
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ToggleTrack;
var(*) /*0x2C1B0000-0x00000000*/ private bool bActivateSystemEachUpdate[65537];
var(*) /*0x2C1B0000-0x00000000*/ private bool bActivateWithJustAttachedFlag[65537];
var(*) /*0x2C1B0000-0x00000000*/ private bool bFireEventsWhenForwards[65537];
var(*) /*0x2C1B0000-0x00000000*/ private bool bFireEventsWhenBackwards[65537];
var(*) /*0x2C1B0000-0x00000000*/ private bool bFireEventsWhenJumpingForwards[65537];

defaultproperties
{
    bActivateWithJustAttachedFlag=true
    bFireEventsWhenForwards=true
    bFireEventsWhenBackwards=true
    bFireEventsWhenJumpingForwards=true
    TrackInstClass=Class'InterpTrackInstToggle'
    TrackTitle="Toggle"
}