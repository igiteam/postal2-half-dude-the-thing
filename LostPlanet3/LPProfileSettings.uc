class LPProfileSettings extends SPProfileSettings
    config(Game);

const Credits = 160;
const PerkLockStatus_Slot0 = 161;
const PerkLockStatus_Slot1 = 162;
const PerkLockStatus_Slot2 = 163;
const PerkLockStatus_Slot3 = 164;
const DefaultLoadout = 165;
const StatsBlob = 166;
const UnlockBlob = 167;
const LoadoutBlob = 168;
const AchievementBlob = 169;
const PreferredNevecPawnClass = 170;
const PreferredPiratePawnClass = 171;
const MPInviteMode = 172;
const CreditsForDamageOnOff = 173;
const OnlineAccountUsername = 174;
const OnlineAccountPassword = 175;
const SPGameMinDifficulty = 176;
const MovieProgressionUnlockBlob = 177;
const ViewedMetagameTutorial = 178;
const CompletedCampaign = 180;
const DLCFutureCampaignLastCheckpointSlot = 210;
const DLCFutureCampaignPreviousCheckpointSlot = 211;
const DLCFutureCampaignLastCheckpointFilename = 212;
const DLCFutureCampaignGameDifficulty = 213;
const MapPackFilterID = 214;
const DummyInt_2 = 215;
const DummyInt_3 = 216;
const DummyFloat_1 = 217;
const DummyFloat_2 = 218;
const DummyFloat_3 = 219;
const DummyBlob_1 = 220;
const DummyBlob_2 = 221;
const DummyBlob_3 = 222;

// Export ULPProfileSettings::execAddCredits(FFrame&, void* const)
native final function AddCredits()
{
    local /*0x97E50000-0x00000000*/ private int CreditAmount[8388609];


}

// Export ULPProfileSettings::execGetCreditsForDamageOnOffConfigOption(FFrame&, void* const)
native final function GetCreditsForDamageOnOffConfigOption()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

event SetToDefaults()
{
    local /*0x97E50000-0x00000000*/ private bool bIsPlayerStorage, bResetPerkSlots;
    local /*0x97E50000-0x00000000*/ private int DPadSlotIndex, NumDPadslots;
    local /*0x97E50000-0x00000000*/ private @NULL PerkMan, LPC;
    local /*0x97E50000-0x00000000*/ private editfixedsize array EmptySaveData, AchievementData;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MovieUnlockList;
    local /*0x97E50000-0x00000000*/ private @NULL OnlineSub;

    super.SetToDefaults();
    // End:0xD3
    if(PCOwner != none)
    {
        // End:0x76
        if(PCOwner.OnlinePlayerData.ProfileProvider.Profile == self)
        {
            bIsPlayerStorage = false;            
        }
        else
        {
            // End:0xD0
            if(PCOwner.OnlinePlayerData.StorageProvider.Profile == self)
            {
                bIsPlayerStorage = true;
            }
        }        
    }
    else
    {
        // End:0x1FF
        foreach Class'Engine.WorldInfo'.static.GetWorldInfo().AllControllers(Class'LPPlayerController', LPC)
        {
            // End:0x18E
            if(LPC.OnlinePlayerData.ProfileProvider.Profile == self)
            {
                bIsPlayerStorage = false;
                PCOwner = LPC;
                // End:0x1FF
                break;
            }
            // End:0x1FE
            if(LPC.OnlinePlayerData.StorageProvider.Profile == self)
            {
                bIsPlayerStorage = true;
                PCOwner = LPC;
                // End:0x1FF
                break;
            }            
        }        
    }
    // End:0x440
    if(PCOwner != none)
    {
        // End:0x2C5
        if(Class'Engine.WorldInfo'.static.GetWorldInfo().IsConsoleBuild(1))
        {
            // End:0x28E
            if(bIsPlayerStorage)
            {
                LPPlayerController(PCOwner).ResetPlayerStorageRelatedDataToDefault();
                bResetPerkSlots = false;                
            }
            else
            {
                LPPlayerController(PCOwner).ResetProfileRelatedDataToDefault();
                bResetPerkSlots = true;
            }            
        }
        else
        {
            LPPlayerController(PCOwner).ResetPlayerStorageRelatedDataToDefault();
            LPPlayerController(PCOwner).ResetProfileRelatedDataToDefault();
            bResetPerkSlots = true;
        }
        // End:0x43D
        if(bResetPerkSlots && LPPRI(PCOwner.PlayerReplicationInfo) != none)
        {
            PerkMan = LPPRI(PCOwner.PlayerReplicationInfo).PerksManager;
            // End:0x43D
            if(PerkMan != none)
            {
                NumDPadslots = 4;
                DPadSlotIndex = 0;
                J0x3C9:

                // End:0x43D [Loop If]
                if(DPadSlotIndex < NumDPadslots)
                {
                    SetDPadSlotStatus(DPadSlotIndex, PerkMan.AssignedPerk[DPadSlotIndex].bLocked);
                    ++DPadSlotIndex;
                    // [Loop Continue]
                    goto J0x3C9;
                }
            }
        }        
    }
    EmptySaveData.Length = 0;
    SetProfileSettingValueBlob(166, EmptySaveData);
    SetProfileSettingValueBlob(167, EmptySaveData);
    SetProfileSettingValueBlob(168, EmptySaveData);
    AchievementData.Length = 0;
    SetProfileSettingValueBlobInts(169, AchievementData);
    MovieUnlockList = "";
    SetProfileSettingValue(177, MovieUnlockList);
    SetProfileSettingValueInt(178, 1);
    ResetToInitialGameState();
    ResetToInitialSystemState(PCOwner);
    // End:0x572
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
    {
        OnlineSub = Class'Engine.GameEngine'.static.GetOnlineSubsystem();
        // End:0x572
        if(OnlineSub != none)
        {
            OnlineSub.ClearCachedProfiles();
        }
    }
    //return;    
}

function ResetToInitialGameState()
{
    local /*0x97E50000-0x00000000*/ private int out_int;

    super.ResetToInitialGameState();
    GetProfileSettingDefaultInt(161, out_int);
    SetProfileSettingValueInt(161, out_int);
    GetProfileSettingDefaultInt(162, out_int);
    SetProfileSettingValueInt(162, out_int);
    GetProfileSettingDefaultInt(163, out_int);
    SetProfileSettingValueInt(163, out_int);
    GetProfileSettingDefaultInt(164, out_int);
    SetProfileSettingValueInt(164, out_int);
    GetProfileSettingDefaultInt(160, out_int);
    SetProfileSettingValueInt(160, out_int);
    GetProfileSettingDefaultInt(180, out_int);
    SetProfileSettingValueInt(180, out_int);
    GetProfileSettingDefaultInt(210, out_int);
    SetProfileSettingValueInt(210, out_int);
    GetProfileSettingDefaultInt(211, out_int);
    SetProfileSettingValueInt(211, out_int);
    GetProfileSettingDefaultInt(213, out_int);
    SetProfileSettingValueInt(213, out_int);
    //return;    
}

function IsDPadSlotLocked()
{
    local /*0x97E50000-0x00000000*/ private int DPadSlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int ResultValue;
    local /*0x97E50000-0x00000000*/ private bool bProfileResult;
    local /*0x97E50000-0x00000000*/ private int ProfileSettingId;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ProfileSettingString;

    ProfileSettingString = "PerkLockStatus_Slot" $ string(DPadSlotIndex);
    bProfileResult = GetProfileSettingId(name(ProfileSettingString), ProfileSettingId);
    // End:0x9B
    if(bProfileResult)
    {
        bProfileResult = GetProfileSettingValueInt(ProfileSettingId, ResultValue);
        // End:0x98
        if(!bProfileResult)
        {
        }        
    }
    return ResultValue > 0;
    //return ReturnValue;    
}

function SetDPadSlotStatus()
{
    local /*0x97E50000-0x00000000*/ private int DPadSlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLocked[8388609], bProfileResult;
    local /*0x97E50000-0x00000000*/ private int ProfileSettingId;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ProfileSettingString;

    ProfileSettingString = "PerkLockStatus_Slot" $ string(DPadSlotIndex);
    bProfileResult = GetProfileSettingId(name(ProfileSettingString), ProfileSettingId);
    // End:0x9E
    if(bProfileResult)
    {
        bProfileResult = SetProfileSettingValueInt(ProfileSettingId, int(bLocked));
        // End:0x9B
        if(!bProfileResult)
        {
        }        
    }
    //return;    
}

function SetCredits()
{
    local /*0x97E50000-0x00000000*/ private int CreditAmount[8388609];

    SetProfileSettingValueInt(160, CreditAmount);
    //return;    
}

function GetCredits()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    GetProfileSettingValueInt(160, Value);
    return Value;
    //return ReturnValue;    
}

function GetDPadSlotPerkName()
{
    local /*0x97E50000-0x00000000*/ private int DPadSlotIndex[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689], Result;
    local /*0x97E50000-0x00000000*/ private bool bProfileResult;
    local /*0x97E50000-0x00000000*/ private int ProfileSettingId;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ProfileSettingString, ProfileSettingValue;

    Result = 'NAME_None';
    ProfileSettingString = "AssignedPerk_Slot" $ string(DPadSlotIndex);
    bProfileResult = GetProfileSettingId(name(ProfileSettingString), ProfileSettingId);
    // End:0xD3
    if(bProfileResult)
    {
        bProfileResult = GetProfileSettingValue(ProfileSettingId, ProfileSettingValue);
        // End:0xD0
        if(bProfileResult)
        {
            // End:0xCD
            if(ProfileSettingValue != "")
            {
                Result = name(ProfileSettingValue);
            }            
        }        
    }
    return Result;
    //return ReturnValue;    
}

function GetDefaultLoadout()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], LoadoutIndex;

    GetProfileSettingValueInt(165, LoadoutIndex);
    return LoadoutIndex;
    //return ReturnValue;    
}

function SetDefaultLoadout()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[8388609];

    SetProfileSettingValueInt(165, LoadoutIndex);
    //return;    
}

function GetPreferredPawnClass()
{
    local /*0x97E50000-0x00000000*/ private int Team[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], Value;

    // End:0x28
    if(Team == 1)
    {
        GetProfileSettingValue(171, Value);        
    }
    else
    {
        GetProfileSettingValue(170, Value);
    }
    return Value;
    //return ReturnValue;    
}

function SetPreferredPawnClass()
{
    local /*0x97E50000-0x00000000*/ private int Team[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string Value[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(Team == 1)
    {
        // End:0x2B
        if(!SetProfileSettingValue(171, Value))
        {
            return false;
        }        
    }
    else
    {
        // End:0x4A
        if(!SetProfileSettingValue(170, Value))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function GetDelimitedUnlockedMovieList()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], delimitedList;

    GetProfileSettingValue(177, delimitedList);
    return delimitedList;
    //return ReturnValue;    
}

function SetDelimitedUnlockedMovieList()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InList[8388609];

    SetProfileSettingValue(177, InList);
    //return;    
}

function GetMPInviteMode()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int IntValue;

    // End:0x1D
    if(!GetProfileSettingValueInt(172, IntValue))
    {
        return 1;
    }
    // End:0x41
    if((IntValue < 0) || IntValue >= 4)
    {
        return 1;
    }
    return byte(IntValue);
    //return ReturnValue;    
}

function SetMPInviteMode()
{
    local /*0x97E50000-0x00000000*/ private byte Mode[8388609];

    SetProfileSettingValueInt(172, int(Mode));
    //return;    
}

function SetOnlineAccountUsername()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    SetProfileSettingValue(174, S);
    //return;    
}

function GetOnlineAccountUsername()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], S;

    GetProfileSettingValue(174, S);
    return S;
    //return ReturnValue;    
}

function SetOnlineAccountPassword()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string S[8388609];

    SetProfileSettingValue(175, S);
    //return;    
}

function GetOnlineAccountPassword()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], S;

    GetProfileSettingValue(175, S);
    return S;
    //return ReturnValue;    
}

function SetSPGameMinDifficulty()
{
    local /*0x97E50000-0x00000000*/ private byte Difficulty[8388609];

    SetProfileSettingValueId(176, int(Difficulty));
    //return;    
}

function GetSPGameMinDifficulty()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Difficulty;

    GetProfileSettingValueId(176, Difficulty);
    return byte(Difficulty);
    //return ReturnValue;    
}

function UpdateSPGameMinDifficulty()
{
    local /*0x97E50000-0x00000000*/ private bool bNewGame[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private byte CurDifficulty, CurMinDifficulty;

    false
    CurDifficulty = byte(GetSPGameDifficulty());
    CurMinDifficulty = GetSPGameMinDifficulty();
    // End:0x8B
    if((int(CurDifficulty) < int(CurMinDifficulty)) || bNewGame && int(CurDifficulty) != int(CurMinDifficulty))
    {
        SetSPGameMinDifficulty(CurDifficulty);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function SetViewedMetagameTutorial()
{
    local /*0x97E50000-0x00000000*/ private bool bViewed[8388609];

    SetProfileSettingValueId(178, ((bViewed) ? 0 : 1));
    //return;    
}

function HasSeenMetagameTutorial()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int bHasSeenTutorial;

    GetProfileSettingValueId(178, bHasSeenTutorial);
    return bHasSeenTutorial == 0;
    //return ReturnValue;    
}

function SetCompletedCampaign()
{
    local /*0x97E50000-0x00000000*/ private bool bCompleted[8388609];

    SetProfileSettingValueId(180, ((bCompleted) ? 0 : 1));
    //return;    
}

function HasCompletedCampaign()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int bCompleted;

    GetProfileSettingValueId(180, bCompleted);
    return bCompleted == 0;
    //return ReturnValue;    
}

function SetLastCheckpointSlot()
{
    local /*0x97E50000-0x00000000*/ private int Slot[8388609];

    // End:0x4F
    if(SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).SetDLCLastCheckpointSlot(Slot) > 0)
    {
        return;
    }
    super.SetLastCheckpointSlot(Slot);
    //return;    
}

function GetLastCheckpointSlot()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], DLCLastCheckpointSlot;

    // End:0x57
    if(SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetDLCLastCheckpointSlot(DLCLastCheckpointSlot) > 0)
    {
        return DLCLastCheckpointSlot;
    }
    return super.GetLastCheckpointSlot();
    //return ReturnValue;    
}

function SetPreviousCheckpointSlot()
{
    local /*0x97E50000-0x00000000*/ private int Slot[8388609];

    // End:0x4F
    if(SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).SetDLCPreviousCheckpointSlot(Slot) > 0)
    {
        return;
    }
    super.SetPreviousCheckpointSlot(Slot);
    //return;    
}

function GetPreviousCheckpointSlot()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], DLCPreviousCheckpointSlot;

    // End:0x57
    if(SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetDLCPreviousCheckpointSlot(DLCPreviousCheckpointSlot) > 0)
    {
        return DLCPreviousCheckpointSlot;
    }
    return super.GetPreviousCheckpointSlot();
    //return ReturnValue;    
}

function SetLastCheckpointFilename()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CPName[8388609];

    // End:0x4F
    if(SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).SetDLCLastCheckpointFilename(CPName) > 0)
    {
        return;
    }
    super.SetLastCheckpointFilename(CPName);
    //return;    
}

function GetLastCheckpointFilename()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], DLCLastCheckpointFilename;

    // End:0x57
    if(SPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).GetDLCLastCheckpointFilename(DLCLastCheckpointFilename) > 0)
    {
        return DLCLastCheckpointFilename;
    }
    return super.GetLastCheckpointFilename();
    //return ReturnValue;    
}

function SetDLCFutureCampaignLastCheckpointSlot()
{
    local /*0x97E50000-0x00000000*/ private int Slot[8388609];

    SetProfileSettingValueInt(210, Slot);
    //return;    
}

function GetDLCFutureCampaignLastCheckpointSlot()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], SaveSlot;

    SaveSlot = 0;
    GetProfileSettingValueInt(210, SaveSlot);
    return SaveSlot;
    //return ReturnValue;    
}

function SetDLCFutureCampaignPreviousCheckpointSlot()
{
    local /*0x97E50000-0x00000000*/ private int Slot[8388609];

    SetProfileSettingValueInt(211, Slot);
    //return;    
}

function GetDLCFutureCampaignPreviousCheckpointSlot()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], SaveSlot;

    SaveSlot = 0;
    GetProfileSettingValueInt(211, SaveSlot);
    return SaveSlot;
    //return ReturnValue;    
}

function SetDLCFutureCampaignLastCheckpointFilename()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CPName[8388609];

    SetProfileSettingValue(212, CPName);
    //return;    
}

function GetDLCFutureCampaignLastCheckpointFilename()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], CPName;

    GetProfileSettingValue(212, CPName);
    return CPName;
    //return ReturnValue;    
}

function GetDLCFutureCampaignGameDifficulty()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    GetProfileSettingValueId(213, Value);
    return Value;
    //return ReturnValue;    
}

function SetDLCFutureCampaignGameDifficulty()
{
    local /*0x97E50000-0x00000000*/ private int InDifficulty[8388609];

    SetProfileSettingValueId(213, InDifficulty);
    //return;    
}

function GetMapPackFilterID()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Value;

    GetProfileSettingValueInt(214, Value);
    return Value;
    //return ReturnValue;    
}

function SetMapPackFilterID()
{
    local /*0x97E50000-0x00000000*/ private int InMapPackFilterID[8388609];

    SetProfileSettingValueInt(214, InMapPackFilterID);
    //return;    
}

defaultproperties
{
    ProfileSettingIds=/* Array type was not detected. */
    DefaultSettings=/* Array type was not detected. */
    VersionNumber=216
    ProfileMappings=/* Array type was not detected. */
}