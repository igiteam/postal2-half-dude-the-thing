class InterpTrackDirector extends InterpTrack
    collapsecategories
    hidecategories(Object);

struct native DirectorTrackCut
{
    var(*) /*0x35EA0000-0x00000000*/ private float Time;
    var(*) /*0x35EA0000-0x00000000*/ private float TransitionTime;
    var(*) /*0x1CD20000-0x00000000*/ private name TargetCamGroup[65537];
    var(*) /*0x35EA0000-0x00000000*/ private int ShotNumber;

    structdefaultproperties
    {
        Time=0.0000000
        TransitionTime=0.0000000
        TargetCamGroup="None"
        ShotNumber=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CutTrack;
var(*) /*0x2BEC0000-0x00000000*/ private bool bSimulateCameraCutsOnClients[65537];

defaultproperties
{
    bSimulateCameraCutsOnClients=true
    TrackInstClass=Class'InterpTrackInstDirector'
    TrackTitle="Director"
    bOnePerGroup=true
    bDirGroupOnly=true
}