class InterpTrackMove extends InterpTrack
    collapsecategories
    hidecategories(Object);

enum EInterpTrackMoveFrame
{
    IMF_World,                      // 0
    IMF_RelativeToInitial,          // 1
    IMF_MAX                         // 2
};

enum EInterpTrackMoveRotMode
{
    IMR_Keyframed,                  // 0
    IMR_LookAtGroup,                // 1
    IMR_Ignore,                     // 2
    IMR_MAX                         // 3
};

struct native InterpLookupPoint
{
    var(*) /*0x35EA0000-0x00000000*/ private name GroupName;
    var(*) /*0x35EA0000-0x00000000*/ private float Time;

    structdefaultproperties
    {
        GroupName="None"
        Time=0.0000000
    }
};

struct native InterpLookupTrack
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Points;

    structdefaultproperties
    {
        Points=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL PosTrack;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL EulerTrack;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL LookupTrack;
var(*) /*0x2C130000-0x00000000*/ private name LookAtGroupName[65537];
var(*) /*0x2C130000-0x00000000*/ private float LinCurveTension[65537];
var(*) /*0x2C130000-0x00000000*/ private float AngCurveTension[65537];
var(*) /*0x2C130000-0x00000000*/ private bool bUseQuatInterpolation[65537];
var(*) /*0x2C130000-0x00000000*/ private bool bShowArrowAtKeys[65537];
var(*) /*0x2C130000-0x00000000*/ private bool bDisableMovement[65537];
var(*) /*0x2C130000-0x00000000*/ private bool bShowTranslationOnCurveEd[65537];
var(*) /*0x2C130000-0x00000000*/ private bool bShowRotationOnCurveEd[65537];
var(*) /*0x2C130000-0x00000000*/ private bool bHide3DTrack[65537];
var(*) /*0x2C130000-0x00000000*/ private const byte MoveFrame[65537];
var(*) /*0x2C130000-0x00000000*/ private byte RotMode[65537];

defaultproperties
{
    bShowTranslationOnCurveEd=true
    TrackInstClass=Class'InterpTrackInstMove'
    TrackTitle="Movement"
    bOnePerGroup=true
}