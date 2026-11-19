class LPAnimNotify_Dismember extends AnimNotify
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string EditorOnlyComment[131073];
var(0.25_Pct) /*0x7BED0000-0x00000000*/ private float MomentumStrength[65537];
var(0.25_Pct) /*0x7BED0000-0x00000000*/ private name MomentumSourceBone[65537];
var(0.25_Pct) /*0x7BED0000-0x00000000*/ private name MomentumTargetBone[65537];
var(0.25_Pct) /*0x7BED0000-0x00000000*/ private bool bDestroyCore[65537];
var(0.25_Pct) /*0x7BED0000-0x00000400*/ private editfixedsize @NULL CoreToDismember[589825];
var(0.25_Pct) /*0x7BED0000-0x00000000*/ private name EventName[65537];
var(0.25_Pct) /*0x7BED0000-0x00000000*/ private name SoundName[65537];

defaultproperties
{
    MomentumSourceBone="JO_positionTracker"
    MomentumTargetBone="JO_Align"
}