class CoverMeshComponent extends StaticMeshComponent
    editinlinenew
    hidecategories(Object);

struct native CoverMeshes
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Base;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LeanLeft;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LeanRight;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LeanLeftPref;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LeanRightPref;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Climb;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Mantle;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SlipLeft;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SlipRight;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SwatLeft;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SwatRight;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PopUp;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL PlayerOnly;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CornerTurnLeft;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CornerTurnRight;

    structdefaultproperties
    {
        Base=none
        LeanLeft=none
        LeanRight=none
        LeanLeftPref=none
        LeanRightPref=none
        Climb=none
        Mantle=none
        SlipLeft=none
        SlipRight=none
        SwatLeft=none
        SwatRight=none
        PopUp=none
        PlayerOnly=none
        CornerTurnLeft=none
        CornerTurnRight=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Meshes;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LocationOffset;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CornerTurnMeshOffset;
var(*) /*0x35EA0000-0x00000000*/ private @NULL AutoAdjustOn;
var(*) /*0x35EA0000-0x00000000*/ private @NULL AutoAdjustOff;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Disabled;
var(*) /*0x35EA0000-0x00000000*/ private bool bShowWhenNotSelected[536870913];
