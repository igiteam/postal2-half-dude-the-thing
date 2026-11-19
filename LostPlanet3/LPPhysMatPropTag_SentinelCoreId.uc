class LPPhysMatPropTag_SentinelCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum eSentinelCore
{
    eSentinelCore_Mouth,            // 0
    eSentinelCore_MAX               // 1
};

var(0.25_Pct) /*0x81AC0000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_SentinelCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}
