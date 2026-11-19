class LPLoadoutKit extends SPSerializableDynamicDataContainer
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LoadoutKitManager[536870913];

simulated function GetLoadoutName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LoadoutData;

    LoadoutData = GetLoadoutData();
    // End:0x42
    if(LoadoutData != none)
    {
        return LoadoutData.LoadoutName;
    }
    //return ReturnValue;    
}

simulated function GetLocalPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPPRI(Class'Engine.Engine'.static.GetEngine().GamePlayers[0].Actor.PlayerReplicationInfo);
    //return ReturnValue;    
}

simulated function GetPerk()
{
    local /*0x97E50000-0x00000000*/ private int PerkNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetLocalPRI().PerksManager.QueryPerkName(name(GetPerkString(PerkNum)));
    //return ReturnValue;    
}

simulated function GetPerkString()
{
    local /*0x97E50000-0x00000000*/ private int PerkNum[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LoadoutData;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PerkName;

    LoadoutData = GetLoadoutData();
    switch(PerkNum)
    {
        // End:0x56
        case 0:
            PerkName = LoadoutData.Perk_Slot0;
            // End:0xF7
            break;
        // End:0x85
        case 1:
            PerkName = LoadoutData.Perk_Slot1;
            // End:0xF7
            break;
        // End:0xB5
        case 2:
            PerkName = LoadoutData.Perk_Slot2;
            // End:0xF7
            break;
        // End:0xE5
        case 3:
            PerkName = LoadoutData.Perk_Slot3;
            // End:0xF7
            break;
        // End:0xFFFF
        default:
            PerkName = "";
            // End:0xF7
            break;
            break;
    }
    return PerkName;
    //return ReturnValue;    
}

simulated function GetWeaponClass()
{
    local /*0x97E50000-0x00000000*/ private int WeaponNum[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689], WeaponClass;
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponName;

    WeaponName = GetWeaponPath(WeaponNum);
    // End:0x86
    if((WeaponName != "") && LoadoutKitManager != none)
    {
        WeaponClass = class<LPWeapon>(FindObject(WeaponName, Class'Core.Class'));
        // End:0x86
        if(WeaponClass != none)
        {
            return WeaponClass;
        }
    }
    return none;
    //return ReturnValue;    
}

simulated function GetWeaponPath()
{
    local /*0x97E50000-0x00000000*/ private int WeaponNum[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return GetWeaponString(WeaponNum);
    //return ReturnValue;    
}

simulated function GetWeaponString()
{
    local /*0x97E50000-0x00000000*/ private int WeaponNum[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LoadoutData;
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponName;

    LoadoutData = GetLoadoutData();
    switch(WeaponNum)
    {
        // End:0x56
        case 0:
            WeaponName = LoadoutData.WeaponPrimary;
            // End:0xC7
            break;
        // End:0x85
        case 1:
            WeaponName = LoadoutData.WeaponSecondary;
            // End:0xC7
            break;
        // End:0xB5
        case 2:
            WeaponName = LoadoutData.WeaponTertiary;
            // End:0xC7
            break;
        // End:0xFFFF
        default:
            WeaponName = "";
            // End:0xC7
            break;
            break;
    }
    return WeaponName;
    //return ReturnValue;    
}

simulated function GetWeaponTuneData()
{
    local /*0x97E50000-0x00000000*/ private int WeaponNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class WeaponClass;

    WeaponClass = GetWeaponClass(WeaponNum);
    // End:0xBE
    if(WeaponClass != none)
    {
        // End:0x96
        if(int(GetLocalPRI().WorldInfo.NetMode) == int(NM_Standalone))
        {
            return LPTuneDataBaseWeapon(WeaponClass.default.TuneDataBaseWeapon);            
        }
        else
        {
            return LPTuneDataBaseWeapon(WeaponClass.default.TuneDataBaseWeapon_MP);
        }
    }
    return none;
    //return ReturnValue;    
}

simulated function GetUpgradeTuneData()
{
    local /*0x97E50000-0x00000000*/ private int WeaponNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], WeaponTD;

    // End:0x18
    if(IsPreOrderWeapon(WeaponNum))
    {
        return none;
    }
    WeaponTD = GetWeaponTuneData(WeaponNum);
    // End:0x95
    if((WeaponTD != none) && WeaponTD.SupportedUpgrades.Length >= 1)
    {
        return LPTuneDataWeaponUpgrade(WeaponTD.SupportedUpgrades[0]);
    }
    return none;
    //return ReturnValue;    
}

simulated function GetAmmoTuneData()
{
    local /*0x97E50000-0x00000000*/ private int WeaponNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], WeaponTD;

    // End:0x18
    if(IsPreOrderWeapon(WeaponNum))
    {
        return none;
    }
    WeaponTD = GetWeaponTuneData(WeaponNum);
    // End:0x95
    if((WeaponTD != none) && WeaponTD.SupportedAmmoTypes.Length > 1)
    {
        return LPTuneDataAmmoDefault(WeaponTD.SupportedAmmoTypes[1]);
    }
    return none;
    //return ReturnValue;    
}

simulated function LogLoadoutData()
{
    local /*0x97E50000-0x00000000*/ private bool bName[9437185], bWeapons, bPerks;

    true
    true
    true
    //return;    
}

simulated function SetLoadoutName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string LoadoutName[8388609];

    GetLoadoutData().LoadoutName = LoadoutName;
    //return;    
}

simulated function SetLoadoutWeapons()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponPrimary[8388609], WeaponSecondary, WeaponTertiary;
    local /*0x97E50000-0x00000000*/ private @NULL LoadoutData;

    LoadoutData = GetLoadoutData();
    LoadoutData.WeaponPrimary = WeaponPrimary;
    LoadoutData.WeaponSecondary = WeaponSecondary;
    LoadoutData.WeaponTertiary = WeaponTertiary;
    //return;    
}

simulated function SetLoadoutPerks()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Perk_Slot0[8388609], Perk_Slot1, Perk_Slot2, Perk_Slot3;
    local /*0x97E50000-0x00000000*/ private @NULL LoadoutData;

    LoadoutData = GetLoadoutData();
    LoadoutData.Perk_Slot0 = Perk_Slot0;
    LoadoutData.Perk_Slot1 = Perk_Slot1;
    LoadoutData.Perk_Slot2 = Perk_Slot2;
    LoadoutData.Perk_Slot3 = Perk_Slot3;
    //return;    
}

simulated function VerifyLoadout()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string W1, W2, W3, DefaultW1, DefaultW2, DefaultW3;

    W1 = GetWeaponPath(0);
    W2 = GetWeaponPath(1);
    W3 = GetWeaponPath(2);
    DefaultW1 = Class'LPLoadoutKitSerializableData'.default.WeaponPrimary;
    DefaultW2 = Class'LPLoadoutKitSerializableData'.default.WeaponSecondary;
    DefaultW3 = Class'LPLoadoutKitSerializableData'.default.WeaponTertiary;
    // End:0x105
    if(!VerifyWeapon(W1))
    {
        W1 = ((W2 == DefaultW1) ? DefaultW2 : DefaultW1);
    }
    // End:0x152
    if(!VerifyWeapon(W2))
    {
        W2 = ((W1 == DefaultW2) ? DefaultW1 : DefaultW2);
    }
    // End:0x17D
    if(!VerifyWeapon(W3))
    {
        W3 = DefaultW3;
    }
    SetLoadoutWeapons(W1, W2, W3);
    //return;    
}

simulated function VerifyWeapon()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponPath[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class WeaponClass;
    local /*0x97E50000-0x00000000*/ private @NULL TuneDataWeapon;

    // End:0x163
    if((LoadoutKitManager != none) && LoadoutKitManager.GetMyPlayerController() != none)
    {
        // End:0x160
        if(LoadoutKitManager.MyPC.WeaponContentClassNames.Find(WeaponPath) >= )
        {            
            WeaponClass = class<LPWeapon>(FindObject(WeaponPath, Class'Core.Class'));
            // End:0x15B
            if(WeaponClass != none)
            {
                TuneDataWeapon = LPTuneDataBaseWeapon(WeaponClass.default.TuneDataBaseWeapon_MP);
                // End:0xFC
                if(TuneDataWeapon == none)
                {
                    return false;
                }
                // End:0x156
                if(LoadoutKitManager.MyPC.IsUnlockedMP(TuneDataWeapon.UnlockName))
                {
                    return true;                    
                }
                else
                {
                    return false;
                }                
            }
            return true;            
        }        
    }
    return false;
    //return ReturnValue;    
}

simulated function ApplyLoadout()
{
    local /*0x97E50000-0x00000000*/ private bool bConditional[9437185];

    false
    LogLoadoutData();
    ApplyLoadoutPerks();
    // End:0x36
    if(bConditional)
    {
        ConditionalApplyLoadoutWeapons();        
    }
    else
    {
        ApplyLoadoutWeapons();
    }
    //return;    
}

simulated function ConditionalApplyLoadoutWeapons()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Primary, Secondary, Tertiary;

    // End:0x384
    if(LoadoutKitManager != none)
    {
        Primary = GetWeaponPath(0);
        Secondary = GetWeaponPath(1);
        Tertiary = GetWeaponPath(2);
        // End:0x87
        if(Primary == "")
        {
            Primary = Class'LPLoadoutKitSerializableData'.default.WeaponPrimary;
        }
        // End:0xBF
        if(Secondary == "")
        {
            Secondary = Class'LPLoadoutKitSerializableData'.default.WeaponSecondary;
        }
        // End:0xF7
        if(Tertiary == "")
        {
            Tertiary = Class'LPLoadoutKitSerializableData'.default.WeaponTertiary;
        }
        // End:0x334
        if(LoadoutKitManager.MyPC.bServerWeaponsInitialized)
        {
            // End:0x19C
            if(!LoadoutKitManager.MyPC.IsValidWeaponForServer(Primary))
            {
                Primary = Class'LPLoadoutKitSerializableData'.default.WeaponPrimary;                
            }
            else
            {
                // End:0x1B4
                if(!VerifyWeapon(Primary))
                {
                }
            }
            // End:0x222
            if(!LoadoutKitManager.MyPC.IsValidWeaponForServer(Secondary))
            {
                Secondary = Class'LPLoadoutKitSerializableData'.default.WeaponSecondary;                
            }
            else
            {
                // End:0x274
                if((Secondary != "") && !VerifyWeapon(Secondary))
                {
                    Secondary = Class'LPLoadoutKitSerializableData'.default.WeaponSecondary;
                }
            }
            // End:0x2E2
            if(!LoadoutKitManager.MyPC.IsValidWeaponForServer(Tertiary))
            {
                Tertiary = Class'LPLoadoutKitSerializableData'.default.WeaponTertiary;                
            }
            else
            {
                // End:0x334
                if((Tertiary != "") && !VerifyWeapon(Tertiary))
                {
                    Tertiary = Class'LPLoadoutKitSerializableData'.default.WeaponTertiary;
                }
            }
        }
        LoadoutKitManager.MyPC.ServerSetWeaponLoadout(Primary, Secondary, Tertiary);
    }
    //return;    
}

simulated function ApplyLoadoutWeapons()
{
    // End:0x66
    if(LoadoutKitManager != none)
    {
        LoadoutKitManager.MyPC.ServerSetWeaponLoadout(GetWeaponPath(0), GetWeaponPath(1), GetWeaponPath(2));
    }
    //return;    
}

simulated function ApplyLoadoutPerks()
{
    local /*0x97E50000-0x00000000*/ private @NULL LoadoutPRI, LoadoutData;
    local /*0x97E50000-0x00000000*/ private name PerkName;

    LoadoutData = GetLoadoutData();
    // End:0x2E2
    if(LoadoutKitManager != none)
    {
        LoadoutPRI = LPPRI(LoadoutKitManager.MyPC.PlayerReplicationInfo);
        // End:0x2E2
        if(LoadoutPRI != none)
        {
            PerkName = ((LoadoutData.Perk_Slot0 == "") ? 'None' : name(LoadoutData.Perk_Slot0));
            LoadoutPRI.PerksManager.AssignPerk(0, PerkName, true, false);
            PerkName = ((LoadoutData.Perk_Slot1 == "") ? 'None' : name(LoadoutData.Perk_Slot1));
            LoadoutPRI.PerksManager.AssignPerk(1, PerkName, true, false);
            PerkName = ((LoadoutData.Perk_Slot2 == "") ? 'None' : name(LoadoutData.Perk_Slot2));
            LoadoutPRI.PerksManager.AssignPerk(2, PerkName, true, false);
            PerkName = ((LoadoutData.Perk_Slot3 == "") ? 'None' : name(LoadoutData.Perk_Slot3));
            LoadoutPRI.PerksManager.AssignPerk(3, PerkName, false, true);
        }
    }
    //return;    
}

simulated function GetLoadoutData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPLoadoutKitSerializableData(SerializableDynamicData);
    //return ReturnValue;    
}

simulated function CopyProperties()
{
    local /*0x97E50000-0x00000000*/ private @NULL Kit[8388609], MyData, KitData;

    KitData = Kit.GetLoadoutData();
    MyData = GetLoadoutData();
    // End:0x245
    if((KitData != none) && MyData != none)
    {
        MyData.LoadoutName = KitData.LoadoutName;
        MyData.WeaponPrimary = KitData.WeaponPrimary;
        MyData.WeaponSecondary = KitData.WeaponSecondary;
        MyData.WeaponTertiary = KitData.WeaponTertiary;
        MyData.Perk_Slot0 = KitData.Perk_Slot0;
        MyData.Perk_Slot1 = KitData.Perk_Slot1;
        MyData.Perk_Slot2 = KitData.Perk_Slot2;
        MyData.Perk_Slot3 = KitData.Perk_Slot3;
    }
    //return;    
}

simulated function IsPreOrderWeapon()
{
    local /*0x97E50000-0x00000000*/ private int WeaponNum[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Class'LPWeapon'.static.IsPreOrderWeaponClass(GetWeaponClass(WeaponNum));
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPLoadoutKitSerializableData'Default__LPLoadoutKit.LPLoadoutKitSerializableData_DefObj'
    begin object name=LPLoadoutKitSerializableData_DefObj class=Class'LPLoadoutKitSerializableData'
    end object
    SerializableDynamicData=LPLoadoutKitSerializableData_DefObj
}