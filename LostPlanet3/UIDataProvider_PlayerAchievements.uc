class UIDataProvider_PlayerAchievements extends UIDataProvider_OnlinePlayerDataBase
    transient
    config(Engine)
    hidecategories(Object,UIRoot);

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Achievements[536870913];

// Export UUIDataProvider_PlayerAchievements::execGetTotalGamerScore(FFrame&, void* const)
native final function GetTotalGamerScore()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UUIDataProvider_PlayerAchievements::execGetMaxTotalGamerScore(FFrame&, void* const)
native final function GetMaxTotalGamerScore()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

function PopulateAchievementIcons()
{
    //return;    
}

function GetAchievementIconPathName()
{
    local /*0x35EA0000-0x00000000*/ private int AchievementId[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bReturnLockedIcon[9437185];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    //return ReturnValue;    
}

function GetAchievementDetails()
{
    local /*0x35EA0000-0x00000000*/ private int AchievementId[8519681];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL OutAchievementDetails[25165825];
    local /*0x35EA0000-0x00000000*/ private int Index;

    Index = Achievements.Find('Id', AchievementId);    
    // End:0x59
    if(Index != -1)
    {
        OutAchievementDetails = Achievements[Index];
    }
    //return;    
}

function OnPlayerAchievementsChanged()
{
    local /*0x35EA0000-0x00000000*/ private int TitleId[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;
    local /*0x35EA0000-0x00000000*/ private byte Result;

    // End:0x10D
    if(PlayerControllerId != -1)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x10D
        if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none))) && TitleId == 0)
        {
            Result = OnlineSub.PlayerInterface.GetAchievements(byte(PlayerControllerId), Achievements, TitleId);
            // End:0x10D
            if(int(Result) == int(2))
            {
                PopulateAchievementIcons();
            }
        }
    }
    //return;    
}

function OnPlayerAchievementUnlocked()
{
    local /*0x35EA0000-0x00000000*/ private bool bWasSuccessful[8388609];

    // End:0x17
    if(bWasSuccessful)
    {
        UpdateAchievements();
    }
    //return;    
}

event OnRegister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InPlayer[8388609], OnlineSub;

    super.OnRegister(InPlayer);
    // End:0x185
    if(PlayerControllerId != -1)
    {
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x185
        if(OnlineSub != none)
        {
            // End:0x185
            if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
            {
                OnlineSub.PlayerInterface.AddLoginChangeDelegate(OnLoginChange);
                OnlineSub.PlayerInterface.AddReadAchievementsCompleteDelegate(byte(PlayerControllerId), OnPlayerAchievementsChanged);
                OnlineSub.PlayerInterface.AddUnlockAchievementCompleteDelegate(byte(PlayerControllerId), OnPlayerAchievementUnlocked);
                UpdateAchievements();
            }
        }
    }
    //return;    
}

event OnUnregister()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;

    OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
    // End:0x18A
    if(OnlineSub != none)
    {
        // End:0xB3
        if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
        {
            OnlineSub.PlayerInterface.ClearLoginChangeDelegate(OnLoginChange);
        }
        // End:0x18A
        if(NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
        {
            OnlineSub.PlayerInterface.ClearUnlockAchievementCompleteDelegate(byte(PlayerControllerId), OnPlayerAchievementUnlocked);
            OnlineSub.PlayerInterface.ClearReadAchievementsCompleteDelegate(byte(PlayerControllerId), OnPlayerAchievementsChanged);
        }
    }
    Achievements.Length = 0;
    super.OnUnregister();
    //return;    
}

function OnLoginChange()
{
    local /*0x35EA0000-0x00000000*/ private byte LocalUserNum[8388609];

    // End:0x23
    if(int(LocalUserNum) == PlayerControllerId)
    {
        UpdateAchievements();
    }
    //return;    
}

function UpdateAchievements()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OnlineSub;

    // End:0x165
    if(PlayerControllerId != -1)
    {
        Achievements.Length = 0;
        OnlineSub = Class'GameEngine'.static.GetOnlineSubsystem();
        // End:0x165
        if((((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none))) && int(OnlineSub.PlayerInterface.GetLoginStatus(byte(PlayerControllerId))) > int(0)) && !OnlineSub.PlayerInterface.IsGuestLogin(byte(PlayerControllerId)))
        {
            OnlineSub.PlayerInterface.ReadAchievements(byte(PlayerControllerId));
        }
    }
    //return;    
}
