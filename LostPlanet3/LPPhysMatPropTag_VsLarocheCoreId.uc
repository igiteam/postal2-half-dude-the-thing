class LPPhysMatPropTag_VsLarocheCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum eVsLarocheCore
{
    eVsLarocheCore_None,            // 0
    eVsLarocheCore_MAIN_CockPit,    // 1
    eVsLarocheCore_MAIN_CockPit_Close,// 2
    eVsLarocheCore_PRIME_LeftShoulderComm,// 3
    eVsLarocheCore_PRIME_LeftShoulderComm_Close,// 4
    eVsLarocheCore_PRIME_SawGenerator,// 5
    eVsLarocheCore_PRIME_SawGenerator_Close,// 6
    eVsLarocheCore_PRIME_LeftHipJoint,// 7
    eVsLarocheCore_PRIME_LeftHipJoint_Close,// 8
    eVsLarocheCore_2nd_LeftShoulderShield,// 9
    eVsLarocheCore_2nd_LeftShoulderShield_Close,// 10
    eVsLarocheCore_2nd_RightShoulderShield,// 11
    eVsLarocheCore_2nd_RightShoulderShield_Close,// 12
    eVsLarocheCore_2nd_LeftHipShield,// 13
    eVsLarocheCore_2nd_LeftHipShield_Close,// 14
    eVsLarocheCore_2nd_BackUpSawGen,// 15
    eVsLarocheCore_2nd_BackUpSawGen_Close,// 16
    eVsLarocheCore_2nd_CockPitShieldEmpPro,// 17
    eVsLarocheCore_2nd_CockPitShieldEmpPro_Close,// 18
    eVsLarocheCore_COS_LeftForeArm, // 19
    eVsLarocheCore_COS_LeftForeArm_Close,// 20
    eVsLarocheCore_COS_LeftBicep,   // 21
    eVsLarocheCore_COS_LeftBicep_Close,// 22
    eVsLarocheCore_COS_RightBicep,  // 23
    eVsLarocheCore_COS_RightBicep_Close,// 24
    eVsLarocheCore_COS_LeftShoulderLight,// 25
    eVsLarocheCore_COS_LeftShoulderLight_Close,// 26
    eVsLarocheCore_COS_RightShoulderLight,// 27
    eVsLarocheCore_COS_RightShoulderLight_Close,// 28
    eVsLarocheCore_COS_SawBladeShield,// 29
    eVsLarocheCore_COS_SawBladeShield_Close,// 30
    eVsLarocheCore_COS_CabTop,      // 31
    eVsLarocheCore_COS_CabTop_Close,// 32
    eVsLarocheCore_COS_CabTopLights,// 33
    eVsLarocheCore_COS_CabTopLights_Close,// 34
    eVsLarocheCore_COS_LTorsoLightShield,// 35
    eVsLarocheCore_COS_LTorsoLightShield_Close,// 36
    eVsLarocheCore_COS_RTorsoLightShield,// 37
    eVsLarocheCore_COS_RTorsoLightShield_Close,// 38
    eVsLarocheCore_COS_RClavCablesGroup,// 39
    eVsLarocheCore_COS_RClavCablesGroup_Close,// 40
    eVsLarocheCore_COS_RThighShield,// 41
    eVsLarocheCore_COS_RThighShield_Close,// 42
    eVsLarocheCore_MAX              // 43
};

var(0.25_Pct) /*0x81B10000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_VsLarocheCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}
