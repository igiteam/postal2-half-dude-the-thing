class LPPhysMatPropTag_DamageHandler extends SPPhysicalMaterialPropertyTag
    editinlinenew
    hidecategories(Object);

enum eDamageAppliesTo
{
    eDamageAppliesTo_BodyPart,      // 0
    eDamageAppliesTo_Pawn,          // 1
    eDamageAppliesTo_MAX            // 2
};

var(0.25_Pct) /*0x81A50000-0x00000000*/ private byte ApplyDamageTo[65537];

defaultproperties
{
    ApplyDamageTo=eDamageAppliesTo.eDamageAppliesTo_Pawn
}