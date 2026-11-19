class InterpTrackBoolProp extends InterpTrack
    collapsecategories
    hidecategories(Object);

struct native BoolTrackKey
{
    var(*) /*0x35EA0000-0x00000000*/ private float Time;
    var(*) /*0x0B870000-0x00000000*/ private bool Value[65537];

    structdefaultproperties
    {
        Time=0.0000000
        Value=false
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array BoolTrack;
var(*) /*0x2BE90000-0x00000000*/ private const name PropertyName[65537];

defaultproperties
{
    TrackInstClass=Class'InterpTrackInstBoolProp'
    TrackTitle="Bool Property"
}