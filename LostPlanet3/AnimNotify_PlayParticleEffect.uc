class AnimNotify_PlayParticleEffect extends AnimNotify
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x02F00000-0x00000000*/ private @NULL PSTemplate[65537];
var(*) /*0x02F00000-0x00000000*/ private bool bIsExtremeContent[65537];
var(*) /*0x02F00000-0x00000000*/ private bool bAttach[65537];
var(*) /*0x02F00000-0x00000000*/ private bool bPreview[65537];
var(*) /*0x02F00000-0x00000000*/ private bool bSkipIfOwnerIsHidden[65537];
var(*) /*0x02F00000-0x00000000*/ private @NULL PSNonExtremeContentTemplate[65537];
var(*) /*0x02F00000-0x00000000*/ private name SocketName[65537];
var(*) /*0x02F00000-0x00000000*/ private name BoneName[65537];
var(*) /*0x02F00000-0x00000000*/ private name BoneSocketModuleActorName[65537];

defaultproperties
{
    bSkipIfOwnerIsHidden=true
    BoneSocketModuleActorName="BoneSocketActor"
}