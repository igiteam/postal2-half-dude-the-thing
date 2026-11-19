class LPDataStoreTpost extends SPGameflowDataStoreBool
    transient
    config(Input)
    hidecategories(Object,UIRoot);

// Export ULPDataStoreTpost::execInitializeDataStore(FFrame&, void* const)
native function InitializeDataStore();

// Export ULPDataStoreTpost::execSetGFValue(FFrame&, void* const)
native function SetGFValue()
{
    local /*0x97E50000-0x00000000*/ private name GFName[8388609];
    local /*0x97E50000-0x00000000*/ private bool NewValue[8388609], ReturnValue;


}

// Export ULPDataStoreTpost::execSetGFValueFromString(FFrame&, void* const)
native function SetGFValueFromString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string GFName[8388609];
    local /*0x97E50000-0x00000000*/ private bool NewValue[8388609], ReturnValue;


}

function GetGFVars()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array ReturnValue[92274689];

    return GFVars;
    //return ReturnValue;    
}

function Reset()
{
    super.Reset();
    //return;    
}

function ClearGameflow()
{
    Reset();
    //return;    
}

defaultproperties
{
    bEnableDebugLogging=false
    Tag="GameflowDataStoreTpost"
}