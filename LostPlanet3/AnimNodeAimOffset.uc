class AnimNodeAimOffset extends AnimNodeBlendBase
    hidecategories(Object,Object,Object,Object);

enum EAnimAimDir
{
    ANIMAIM_LEFTUP,                 // 0
    ANIMAIM_CENTERUP,               // 1
    ANIMAIM_RIGHTUP,                // 2
    ANIMAIM_LEFTCENTER,             // 3
    ANIMAIM_CENTERCENTER,           // 4
    ANIMAIM_RIGHTCENTER,            // 5
    ANIMAIM_LEFTDOWN,               // 6
    ANIMAIM_CENTERDOWN,             // 7
    ANIMAIM_RIGHTDOWN,              // 8
    ANIMAIM_MAX                     // 9
};

enum EAimID
{
    EAID_LeftUp,                    // 0
    EAID_LeftDown,                  // 1
    EAID_RightUp,                   // 2
    EAID_RightDown,                 // 3
    EAID_ZeroUp,                    // 4
    EAID_ZeroDown,                  // 5
    EAID_ZeroLeft,                  // 6
    EAID_ZeroRight,                 // 7
    EAID_CellLU,                    // 8
    EAID_CellCU,                    // 9
    EAID_CellRU,                    // 10
    EAID_CellLC,                    // 11
    EAID_CellCC,                    // 12
    EAID_CellRC,                    // 13
    EAID_CellLD,                    // 14
    EAID_CellCD,                    // 15
    EAID_CellRD,                    // 16
    EAID_MAX                        // 17
};

struct native atomicwhencooked immutablewhencooked AimTransform
{
    var(*) /*0x01DE0000-0x00000000*/ private @NULL Quaternion[65537];
    var(*) /*0x01DE0000-0x00000000*/ private @NULL Translation[65537];

    structdefaultproperties
    {
        Quaternion=(X=0.0000000,Y=0.0000000,Z=0.0000000,W=0.0000000)
        Translation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native atomicwhencooked immutablewhencooked AimComponent
{
    var(*) /*0x01D30000-0x00000000*/ private name BoneName[65537];
    var(*) /*0x01D30000-0x00000000*/ private @NULL LU[65537];
    var(*) /*0x01D30000-0x00000000*/ private @NULL LC[65537];
    var(*) /*0x01D30000-0x00000000*/ private @NULL LD[65537];
    var(*) /*0x01D30000-0x00000000*/ private @NULL CU[65537];
    var(*) /*0x01D30000-0x00000000*/ private @NULL CC[65537];
    var(*) /*0x01D30000-0x00000000*/ private @NULL CD[65537];
    var(*) /*0x01D30000-0x00000000*/ private @NULL RU[65537];
    var(*) /*0x01D30000-0x00000000*/ private @NULL RC[65537];
    var(*) /*0x01D30000-0x00000000*/ private @NULL RD[65537];

    structdefaultproperties
    {
        BoneName="None"
        LU=none
        LC=none
        LD=none
        CU=none
        CC=none
        CD=none
        RU=none
        RC=none
        RD=none
    }
};

struct native atomicwhencooked immutablewhencooked AimOffsetProfile
{
    var(*) /*0x01DA0000-0x00000000*/ private const name ProfileName[196609];
    var(*) /*0x01DA0000-0x00000000*/ private @NULL HorizontalRange[65537];
    var(*) /*0x01DA0000-0x00000000*/ private @NULL VerticalRange[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AimComponents;
    var(*) /*0x01DA0000-0x00000000*/ private name AnimName_LU[65537];
    var(*) /*0x01DA0000-0x00000000*/ private name AnimName_LC[65537];
    var(*) /*0x01DA0000-0x00000000*/ private name AnimName_LD[65537];
    var(*) /*0x01DA0000-0x00000000*/ private name AnimName_CU[65537];
    var(*) /*0x01DA0000-0x00000000*/ private name AnimName_CC[65537];
    var(*) /*0x01DA0000-0x00000000*/ private name AnimName_CD[65537];
    var(*) /*0x01DA0000-0x00000000*/ private name AnimName_RU[65537];
    var(*) /*0x01DA0000-0x00000000*/ private name AnimName_RC[65537];
    var(*) /*0x01DA0000-0x00000000*/ private name AnimName_RD[65537];

    structdefaultproperties
    {
        ProfileName="Default"
        HorizontalRange=(X=-1.0000000,Y=1.0000000)
        VerticalRange=(X=-1.0000000,Y=1.0000000)
        AimComponents=none
        AnimName_LU="None"
        AnimName_LC="None"
        AnimName_LD="None"
        AnimName_CU="None"
        AnimName_CC="None"
        AnimName_CD="None"
        AnimName_RU="None"
        AnimName_RC="None"
        AnimName_RD="None"
    }
};

var(*) /*0x02CB0000-0x00000000*/ private @NULL Aim[65537];
var(*) /*0x02CB0000-0x00000000*/ private @NULL AngleOffset[65537];
var(*) /*0x02CB0000-0x00000000*/ private bool bForceAimDir[65537];
var(*) /*0x02CB0000-0x00000000*/ private bool bBakeFromAnimations[65537];
var(*) /*0x3BF40000-0x00000000*/ private bool bPassThroughWhenNotRendered[65537];
var(*) /*0x1F1E0000-0x00000000*/ private bool bSynchronizeNodesInEditor[65537];
var(*) /*0x3BF40000-0x00000000*/ private int PassThroughAtOrAboveLOD[65537];
var(*) /*0x02CB0000-0x00000000*/ private byte ForcedAimDir[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array RequiredBones[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array AimCpntIndexLUT[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TemplateNode[536870913];
var(*) /*0x02CB0000-0x00000000*/ private editfixedsize array Profiles[4259841];
var(*) /*0x02CB0000-0x00000000*/ private const int CurrentProfileIndex[196609];

// Export UAnimNodeAimOffset::execSetActiveProfileByName(FFrame&, void* const)
native function SetActiveProfileByName()
{
    local /*0x35EA0000-0x00000000*/ private name ProfileName[8388609];


}

// Export UAnimNodeAimOffset::execSetActiveProfileByIndex(FFrame&, void* const)
native function SetActiveProfileByIndex()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileIndex[8388609];


}

defaultproperties
{
    bSynchronizeNodesInEditor=true
    PassThroughAtOrAboveLOD=1000
    ForcedAimDir=EAnimAimDir.ANIMAIM_CENTERCENTER
    Children=/* Array type was not detected. */
    bFixNumChildren=true
}