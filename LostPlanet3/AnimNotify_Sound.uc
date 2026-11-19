class AnimNotify_Sound extends AnimNotify
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x02F40000-0x00000000*/ private @NULL SoundCue[65537];
var(*) /*0x02F40000-0x00000000*/ private bool bFollowActor[65537];
var(*) /*0x02F40000-0x00000000*/ private bool bIgnoreIfActorHidden[65537];
var(*) /*0x02F40000-0x00000000*/ private name BoneName[65537];
var(*) /*0x02F40000-0x00000000*/ private float PercentToPlay[65537];
var(*) /*0x02F40000-0x00000000*/ private float VolumeMultiplier[65537];
var(*) /*0x02F40000-0x00000000*/ private float PitchMultiplier[65537];

defaultproperties
{
    bFollowActor=true
    PercentToPlay=1.0000000
    VolumeMultiplier=1.0000000
    PitchMultiplier=1.0000000
}