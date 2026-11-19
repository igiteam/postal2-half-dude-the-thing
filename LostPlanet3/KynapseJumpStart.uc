class KynapseJumpStart extends Actor
    placeable
    hidecategories(AnimDependency,Navigation,Movement,Collision,Advanced,Attachment,Display,Object);

var(accidentRatio) /*0x014A0000-0x00000000*/ private editfixedsize array PathdataFamilies[65537];
var(accidentRatio) /*0x014A0000-0x00000400*/ private export @NULL jumpPOComponent[589825];
var(accidentRatio) /*0x014A0000-0x00000000*/ private @NULL jumpEnd[65537];
var(accidentRatio) /*0x014A0000-0x00000000*/ private bool isBidirectional[65537];

defaultproperties
{
    // Reference: KynapseJumpPathObjectComponent'Default__KynapseJumpStart.kynapseJump'
    begin object name=kynapseJump class=Class'KynapseJumpPathObjectComponent'
    end object
    jumpPOComponent=kynapseJump
    Components[0]=kynapseJump
    Components[1]=none
}