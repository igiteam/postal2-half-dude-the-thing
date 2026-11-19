class LPLoadoutKitManager extends SPSerializableDynamicDataManager
    config(Game);

const NumLoadoutKits = 4;

struct LoadoutInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Weapon_1[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Weapon_2[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Grenade[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Perk_1[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Perk_2[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Perk_3[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string Perk_4[1073741825];

    structdefaultproperties
    {
        Weapon_1=""
        Weapon_2=""
        Grenade=""
        Perk_1=""
        Perk_2=""
        Perk_3=""
        Perk_4=""
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DefaultLoadout;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentLoadout;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoadedFromProfile;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDirty;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseDefaultLoadouts[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DefaultLoadouts[1073741825];

simulated function InitLoadoutKits()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];

    MyPC = LPPC;
    MyPRI = LPPRI(MyPC.PlayerReplicationInfo);
    LoadLoadoutKitsFromProfile();
    //return;    
}

simulated function InitLoadoutData()
{
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL Kit;

    Idx = 0;
    J0x0B:

    // End:0x106 [Loop If]
    if(Idx < 4)
    {
        Kit = ((Idx < SerializableContainers.Length) ? LPLoadoutKit(SerializableContainers[Idx]) : none);
        // End:0xB9
        if(Kit == none)
        {
            Kit = new (self) Class'LPLoadoutKit';
            SerializableContainers.AddItem(Kit);            
            // End:0xB9
            if(bUseDefaultLoadouts)
            {
                SetupDefaultLoadout(Idx);
            }
        }
        Kit.LoadoutKitManager = self;
        Kit.VerifyLoadout();
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function SetupDefaultLoadout()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[8388609];

    // End:0x4F
    if((LoadoutIndex >= 0) && LoadoutIndex < DefaultLoadouts.Length)
    {
        SetLoadoutInfo(DefaultLoadouts[LoadoutIndex], LoadoutIndex);
    }
    //return;    
}

simulated function SetLoadoutInfo()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL LoadoutInfo[8388609];
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL Kit;
    local /*0x97E50000-0x00000000*/ private int KitIndex;

    -1
    KitIndex = LoadoutIndex;
    // End:0x51
    if((KitIndex < 0) || KitIndex >= 4)
    {
        KitIndex = GetCurrentLoadoutIndex();
    }
    Kit = GetLoadout(KitIndex);
    // End:0x1E6
    if(Kit != none)
    {
        Kit.SetLoadoutName(("<Strings:LostPlanetGame.LoadoutKit.DefaultKitName" $ string(KitIndex + 1)) $ ">");
        Kit.SetLoadoutWeapons(LoadoutInfo.Weapon_1, LoadoutInfo.Weapon_2, LoadoutInfo.Grenade);
        Kit.SetLoadoutPerks(LoadoutInfo.Perk_1, LoadoutInfo.Perk_2, LoadoutInfo.Perk_3, LoadoutInfo.Perk_4);
    }
    //return;    
}

simulated function SetLoadout()
{
    local /*0x97E50000-0x00000000*/ private @NULL LoadoutKit[8388609];
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL Kit;

    -1
    Kit = GetLoadout(LoadoutIndex);
    // End:0x69
    if(Kit != none)
    {
        Kit.CopyProperties(LoadoutKit);
        bIsDirty = true;
    }
    //return;    
}

simulated function SaveLoadoutsToProfile()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;
    local /*0x97E50000-0x00000000*/ private int ProfileSettingsID;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LoadoutSaveData;

    // End:0x48
    if((GetMyPlayerController()) != none)
    {
        // End:0x48
        if((GetCurrentLoadoutIndex()) != (GetDefaultLoadoutIndex()))
        {
            CurrentLoadout = DefaultLoadout;
            bIsDirty = true;
        }
    }
    // End:0x154
    if(bIsDirty)
    {
        // End:0x66
        if(MyPC == none)
        {
            return false;
        }
        LPPS = LPProfileSettings(MyPC.ProfileSettings);
        // End:0xA8
        if(LPPS == none)
        {
            return false;
        }
        SaveDynamicData(LoadoutSaveData);
        ProfileSettingsID = 168;
        // End:0xFF
        if(!LPPS.SetProfileSettingValueBlob(ProfileSettingsID, LoadoutSaveData))
        {
            return false;
        }
        LPPS.SetDefaultLoadout(GetDefaultLoadoutIndex());
        LPPS.SetModified(true);
        bIsDirty = false;
    }
    return true;
    //return ReturnValue;    
}

simulated function LoadLoadoutKitsFromProfile()
{
    local /*0x97E50000-0x00000000*/ private bool bForceLoad[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;
    local /*0x97E50000-0x00000000*/ private int ProfileSettingsID;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LoadoutLoadData;

    false
    // End:0x12F
    if(!bLoadedFromProfile)
    {
        // End:0x26
        if((GetMyPlayerController()) == none)
        {
            return false;
        }
        LPPS = LPProfileSettings(MyPC.ProfileSettings);
        // End:0x68
        if(LPPS == none)
        {
            return false;
        }
        ProfileSettingsID = 168;
        // End:0xAC
        if(!LPPS.GetProfileSettingValueBlob(ProfileSettingsID, LoadoutLoadData))
        {
            return false;
        }
        LoadDynamicData(LoadoutLoadData);
        DefaultLoadout = LPPS.GetDefaultLoadout();
        DefaultLoadout = GetDefaultLoadoutIndex();
        CurrentLoadout = DefaultLoadout;
        bLoadedFromProfile = true;
        InitLoadoutData();
        SaveLoadoutsToProfile();
    }
    return true;
    //return ReturnValue;    
}

simulated function SetDefaultLoadout()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[9437185];

    -1
    DefaultLoadout = LoadoutIndex;
    // End:0x51
    if((DefaultLoadout < 0) || DefaultLoadout >= 4)
    {
        DefaultLoadout = GetCurrentLoadoutIndex();
    }
    bIsDirty = true;
    //return;    
}

simulated function ApplyLoadout()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[9437185];
    local /*0x97E50000-0x00000000*/ private bool bConditional[9437185];

    -1
    false
    // End:0x42
    if((LoadoutIndex >= 0) && LoadoutIndex < 4)
    {
        CurrentLoadout = LoadoutIndex;
    }
    GetLoadout().ApplyLoadout(bConditional);
    //return;    
}

simulated function GetLoadout()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int KitIndex;

    -1
    KitIndex = LoadoutIndex;
    // End:0x51
    if((KitIndex < 0) || KitIndex >= 4)
    {
        KitIndex = GetCurrentLoadoutIndex();
    }
    return LPLoadoutKit(SerializableContainers[KitIndex]);
    //return ReturnValue;    
}

simulated function GetCurrentLoadoutIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x35
    if((CurrentLoadout < 0) || CurrentLoadout >= 4)
    {
        CurrentLoadout = GetDefaultLoadoutIndex();
    }
    return CurrentLoadout;
    //return ReturnValue;    
}

simulated function GetDefaultLoadoutIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x58
    if((DefaultLoadout < 0) || DefaultLoadout >= 4)
    {
        DefaultLoadout = (((CurrentLoadout >= 0) && CurrentLoadout < 4) ? CurrentLoadout : 0);
    }
    return DefaultLoadout;
    //return ReturnValue;    
}

function GetMyPlayerController()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x5E
    if(MyPC == none)
    {
        // End:0x4F
        if(MyPRI != none)
        {
            MyPC = LPPlayerController(MyPRI.Owner);
        }
        // End:0x5E
        if(MyPC == none)
        {
        }
    }
    return MyPC;
    //return ReturnValue;    
}

defaultproperties
{
    DefaultLoadouts=/* Array type was not detected. */
}