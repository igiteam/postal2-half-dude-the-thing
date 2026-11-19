class LPPhysMatPropTag_Act1BossCoreId extends LPPhysMatPropTag_CoreId
    editinlinenew
    hidecategories(Object);

enum eAct1BossCore
{
    eAct1BossCore_1,                // 0
    eAct1BossCore_MAX               // 1
};

var(0.25_Pct) /*0x819E0000-0x00000000*/ private byte CoreID[65537];

// Export ULPPhysMatPropTag_Act1BossCoreId::execGetCoreId(FFrame&, void* const)
native function GetCoreId()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];


}

event GetCoreEnumName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'eAct1BossCore';
    //return ReturnValue;    
}
