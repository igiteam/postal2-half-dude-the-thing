class LPPhysMatPropTag_DefenderHiveCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum eDefenderHiveCore
{
    eDefenderHiveCore_HiveCell0,    // 0
    eDefenderHiveCore_HiveCell1,    // 1
    eDefenderHiveCore_HiveCell2,    // 2
    eDefenderHiveCore_HiveCell3,    // 3
    eDefenderHiveCore_HiveCell4,    // 4
    eDefenderHiveCore_HiveCell5,    // 5
    eDefenderHiveCore_HiveCell6,    // 6
    eDefenderHiveCore_MAX           // 7
};

var(0.25_Pct) /*0x81A60000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_DefenderHiveCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}
