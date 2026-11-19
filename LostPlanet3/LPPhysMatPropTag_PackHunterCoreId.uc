class LPPhysMatPropTag_PackHunterCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum ePackHunterCore
{
    ePackHunterCore_Mouth,          // 0
    ePackHunterCore_UpperTail,      // 1
    ePackHunterCore_LowerTail,      // 2
    ePackHunterCore_LeftShoulder,   // 3
    ePackHunterCore_RightShoulder,  // 4
    ePackHunterCore_MAX             // 5
};

var(0.25_Pct) /*0x81AA0000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_PackHunterCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}
