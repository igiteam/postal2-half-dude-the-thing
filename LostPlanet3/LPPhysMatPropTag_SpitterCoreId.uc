class LPPhysMatPropTag_SpitterCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum eSpitterCore
{
    eSpitterCore_Primary,           // 0
    eSpitterCore_LeftLeg,           // 1
    eSpitterCore_RightLeg,          // 2
    eSpitterCore_SpitHole,          // 3
    eSpitterCore_MAX                // 4
};

var(0.25_Pct) /*0x81AD0000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_SpitterCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

event GetCoreEnumName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return GetEnum(Enum'LPPhysMatPropTag_SpitterCoreId.eSpitterCore', int(CoreID));
    //return ReturnValue;    
}
