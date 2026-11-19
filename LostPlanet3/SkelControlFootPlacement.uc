class SkelControlFootPlacement extends SkelControlLimb
    hidecategories(Object,Object,Effector);

var(*) /*0x24070000-0x00000000*/ private float FootOffset[65537];
var(*) /*0x24070000-0x00000000*/ private byte FootUpAxis[65537];
var(*) /*0x24070000-0x00000000*/ private @NULL FootRotOffset[65537];
var(*) /*0x24070000-0x00000000*/ private bool bInvertFootUpAxis[65537];
var(*) /*0x24070000-0x00000000*/ private bool bOrientFootToGround[65537];
var(*) /*0x24070000-0x00000000*/ private bool bOnlyEnableForUpAdjustment[65537];
var(*) /*0x24070000-0x00000000*/ private float MaxUpAdjustment[65537];
var(*) /*0x24070000-0x00000000*/ private float MaxDownAdjustment[65537];
var(*) /*0x24070000-0x00000000*/ private float MaxFootOrientAdjust[65537];

defaultproperties
{
    FootUpAxis=EAxis.AXIS_X
    bOrientFootToGround=true
    MaxUpAdjustment=50.0000000
    MaxFootOrientAdjust=45.0000000
}