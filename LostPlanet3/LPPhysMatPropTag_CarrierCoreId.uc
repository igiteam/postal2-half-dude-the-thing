class LPPhysMatPropTag_CarrierCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum eCarrierCore
{
    eCarrierCore_MainCore,          // 0
    eCarrierCore_MouthCore,         // 1
    eCarrierCore_HiveCell0,         // 2
    eCarrierCore_HiveCell1,         // 3
    eCarrierCore_HiveCell2,         // 4
    eCarrierCore_HiveCell3,         // 5
    eCarrierCore_HiveCell4,         // 6
    eCarrierCore_HiveCell5,         // 7
    eCarrierCore_HiveCell6,         // 8
    eCarrierCore_HiveCell7,         // 9
    eCarrierCore_HiveCell8,         // 10
    eCarrierCore_HiveCell9,         // 11
    eCarrierCore_HiveCell10,        // 12
    eCarrierCore_HiveCell11,        // 13
    eCarrierCore_HiveCell12,        // 14
    eCarrierCore_HiveCell13,        // 15
    eCarrierCore_HiveCell14,        // 16
    eCarrierCore_HiveCell15,        // 17
    eCarrierCore_HiveCell16,        // 18
    eCarrierCore_HiveCell17,        // 19
    eCarrierCore_PissOffCore1,      // 20
    eCarrierCore_PissOffCore2,      // 21
    eCarrierCore_MAX                // 22
};

var(0.25_Pct) /*0x81A20000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_CarrierCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

event GetCoreEnumName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return GetEnum(Enum'LPPhysMatPropTag_CarrierCoreId.eCarrierCore', int(CoreID));
    //return ReturnValue;    
}
