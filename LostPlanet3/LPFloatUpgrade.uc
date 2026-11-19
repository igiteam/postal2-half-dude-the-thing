class LPFloatUpgrade extends Object
    editinlinenew
    forcescriptorder(true)
    dontsortcategories(All)
    hidecategories(Object)
    autoexpandcategories(Base);

enum eUpgradeBehaviorType
{
    UBT_Replace,                    // 0
    UBT_Add,                        // 1
    UBT_Multiply,                   // 2
    UBT_MAX                         // 3
};

struct native UpgradeStruct
{
    var(0.25_Pct) /*0xD2510000-0x00000000*/ private float UpgradeValue[65537];
    var(0.25_Pct) /*0xD2510000-0x00000000*/ private byte UpgradeBehavior[65537];
    var(0.25_Pct) /*0xD2510000-0x00000000*/ private @NULL ShopData[65537];
    var(0.25_Pct) /*0xD2510000-0x00000000*/ private name UnlockName[65537];
    var(0.25_Pct) /*0xD2510000-0x00000000*/ private editfixedsize string FriendlyName;

    structdefaultproperties
    {
        UpgradeValue=0.0000000
        UpgradeBehavior=eUpgradeBehaviorType.UBT_Replace
        ShopData=none
        UnlockName="None"
        FriendlyName=""
    }
};

var(0.25_Pct) /*0x0B780000-0x00000000*/ private float baseValue[65537];
var(0.25_Pct) /*0x94DA0000-0x00000000*/ private bool bEnableMP_Override[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitialized[536870913];
var(0.25_Pct) /*0x94DA0000-0x00000000*/ private float MP_OverrideValue[65537];
var(0.25_Pct) /*0xD2500000-0x00000400*/ private editfixedsize array Upgrades[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CachedValue[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name MyPCName[536870913];

// Export ULPFloatUpgrade::execGetValue(FFrame&, void* const)
native simulated function GetValue()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForceRecalculate[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    true                
}

// Export ULPFloatUpgrade::execUpgradeIsUnlocked(FFrame&, void* const)
native function UpgradeIsUnlocked()
{
    local /*0x97E50000-0x00000000*/ private int UpgradeIdx[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private bool bCheckMP[8388609], ReturnValue;


}
