class LPPhysMatPropTag_DongoCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum eDongoCore
{
    eDongoCore_Tail,                // 0
    eDongoCore_MAX                  // 1
};

var(0.25_Pct) /*0x81A70000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_DongoCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}
