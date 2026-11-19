class UIDataStore_Registry extends UIDataStore
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

struct native RegistryKeyValuePair
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Key;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string Value;

    structdefaultproperties
    {
        Key=""
        Value=""
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array RegistryData;

event GetData()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8388609], out_Data;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x97 [Loop If]
    if(I < RegistryData.Length)
    {
        // End:0x89
        if(RegistryData[I].Key == Key)
        {
            out_Data = RegistryData[I].Value;
            return true;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

event SetData()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string Key[8388609], Value;
    local /*0x35EA0000-0x00000000*/ private int I;
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL KVP;

    I = 0;
    J0x0B:

    // End:0x97 [Loop If]
    if(I < RegistryData.Length)
    {
        // End:0x89
        if(RegistryData[I].Key == Key)
        {
            RegistryData[I].Value = Value;
            return;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    KVP.Key = Key;
    KVP.Value = Value;
    RegistryData.AddItem(KVP);    
    //return;    
}

defaultproperties
{
    Tag="Registry"
}