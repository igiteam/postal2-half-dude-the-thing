class LPPhysMatPropTag_CrabCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum eCrabCore
{
    eCrabCore_RightClaw,            // 0
    eCrabCore_LeftClaw,             // 1
    eCrabCore_RightLeg,             // 2
    eCrabCore_LeftLeg,              // 3
    eCrabCore_Back,                 // 4
    eCrabCore_RightElbow,           // 5
    eCrabCore_LeftElbow,            // 6
    eCrabCore_Mouth,                // 7
    eCrabCore_UnderBelly,           // 8
    eCrabCore_MAX                   // 9
};

var(0.25_Pct) /*0x81A40000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_CrabCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

event GetCoreEnumName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return GetEnum(Enum'LPPhysMatPropTag_CrabCoreId.eCrabCore', int(CoreID));
    //return ReturnValue;    
}
