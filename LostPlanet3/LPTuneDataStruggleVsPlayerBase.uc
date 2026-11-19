class LPTuneDataStruggleVsPlayerBase extends LPTuneDataStruggle
    hidecategories(Object,Object);

struct SuccessfulStrugglePhaseActionData
{
    var(0.25_Pct) /*0xC7400000-0x00000000*/ private name NameOfPhaseToActivateOn[65537];
    var(0.25_Pct) /*0xC7400000-0x00000400*/ private editfixedsize @NULL AmountOfDamage[589825];
    var(0.25_Pct) /*0xC7400000-0x00000400*/ private editfixedsize @NULL HealthPercentageNotAllowedToTakeUnder[589825];
    var(0.25_Pct) /*0xC7400000-0x00000000*/ private bool bEndStruggleWhenHealthHitAmountNotAllowedToGoUnder[65537];
    var(0.25_Pct) /*0xC7400000-0x00000000*/ private class TypeOfDamage[65537];
    var(0.25_Pct) /*0xC7400000-0x00000000*/ private float DelayBeforeGivingDamage[65537];
    var(0.25_Pct) /*0xC7400000-0x00000000*/ private bool bStartWeapon[65537];
    var(0.25_Pct) /*0xC7400000-0x00000000*/ private float DelayBeforeTurningOffWeapon[65537];
    var(0.25_Pct) /*0xC7400000-0x00000000*/ private bool bOnlyLeader[65537];
    var(0.25_Pct) /*0xC7400000-0x00000000*/ private bool bOnlyFollower[65537];

    structdefaultproperties
    {
        NameOfPhaseToActivateOn="None"
        AmountOfDamage=none
        HealthPercentageNotAllowedToTakeUnder=none
        bEndStruggleWhenHealthHitAmountNotAllowedToGoUnder=false
        TypeOfDamage=none
        DelayBeforeGivingDamage=0.0000000
        bStartWeapon=false
        DelayBeforeTurningOffWeapon=-1.0000000
        bOnlyLeader=false
        bOnlyFollower=false
    }
};

var(0.25_Pct) /*0x8A380000-0x00000000*/ private editfixedsize array SuccessfulStrugglePhaseActionInfoList[65537];
var(0.25_Pct) /*0x8A380000-0x00000000*/ private float MaxTimeToLeaveWeaponOn[65537];
var(0.25_Pct) /*0x8A380000-0x00000000*/ private int GrabPointIndexThatThisStruggleModeEndsOnWhenSuccessful[65537];
var(0.25_Pct) /*0x8A380000-0x00000000*/ private class SM_GrabAfterSuccessfulStruggleModeEnd[65537];
var(0.25_Pct) /*0x8A380000-0x00000400*/ private editfixedsize @NULL CoreTagForFlagForDestroyOnAnimNotify[589825];
var(0.25_Pct) /*0x8A380000-0x00000000*/ private bool bFlagCoreGibForDestroyOnAnimNotify[65537];
var(0.25_Pct) /*0x8A380000-0x00000000*/ private bool bFlagCoreDamageActionForDestroyOnAnimNotify[65537];

defaultproperties
{
    MaxTimeToLeaveWeaponOn=10.0000000
    GrabPointIndexThatThisStruggleModeEndsOnWhenSuccessful=-1
}