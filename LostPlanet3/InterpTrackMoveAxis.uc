class InterpTrackMoveAxis extends InterpTrackFloatBase
    collapsecategories
    hidecategories(Object);

enum EInterpMoveAxis
{
    AXIS_TranslationX,              // 0
    AXIS_TranslationY,              // 1
    AXIS_TranslationZ,              // 2
    AXIS_RotationX,                 // 3
    AXIS_RotationY,                 // 4
    AXIS_RotationZ,                 // 5
    AXIS_MAX                        // 6
};

var(*) /*0x35EA0000-0x00000000*/ private byte MoveAxis;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL LookupTrack;

defaultproperties
{
    TrackTitle="Move Axis Track"
    bSubTrackOnly=true
}