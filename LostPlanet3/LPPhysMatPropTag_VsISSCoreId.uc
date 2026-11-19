class LPPhysMatPropTag_VsISSCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum eVsISSCore
{
    eVsISSCore_GrenadeLauncher,     // 0
    eVsISSCore_Railgun,             // 1
    eVsISSCore_SalvoLauncher,       // 2
    eVsISSCore_Back,                // 3
    eVsISSCore_Front,               // 4
    eVsISSCore_MAX                  // 5
};

var(0.25_Pct) /*0x81B00000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_VsISSCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}
