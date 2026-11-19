class LPSeqAct_GiveAmmoSmart extends SequenceAction
    forcescriptorder(true)
    hidecategories(Object);

var(0.25_Pct) /*0x82C10000-0x00000000*/ private int MinPercentageOfDifferenceToGive[65537];
var(0.25_Pct) /*0x82C10000-0x00000000*/ private int MaxPercentageOfDifferenceToGive[65537];
var(0.25_Pct) /*0x82C10000-0x00000000*/ private bool bGivesGrenades[65537];

defaultproperties
{
    MinPercentageOfDifferenceToGive=30
    MaxPercentageOfDifferenceToGive=70
    bGivesGrenades=true
    ObjName="Give Ammo - Smart (LP)"
}