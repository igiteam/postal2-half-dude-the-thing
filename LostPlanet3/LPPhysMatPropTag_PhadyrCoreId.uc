class LPPhysMatPropTag_PhadyrCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum ePhadyrCore
{
    ePhadyrCore_Mouth,              // 0
    ePhadyrCore_MAX                 // 1
};

var(0.25_Pct) /*0x81AB0000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_PhadyrCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}
