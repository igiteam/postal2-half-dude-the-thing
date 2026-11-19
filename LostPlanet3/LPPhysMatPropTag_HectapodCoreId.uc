class LPPhysMatPropTag_HectapodCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum eHectapodCore
{
    eHectapodCore_Mouth,            // 0
    eHectapodCore_UpperLegJoint,    // 1
    eHectapodCore_MAX               // 2
};

var(0.25_Pct) /*0x81A90000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_HectapodCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}
