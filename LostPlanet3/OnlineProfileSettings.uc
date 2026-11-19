class OnlineProfileSettings extends OnlinePlayerStorage;

enum EProfileSettingID
{
    PSI_Unknown,                    // 0
    PSI_ControllerVibration,        // 1
    PSI_YInversion,                 // 2
    PSI_GamerCred,                  // 3
    PSI_GamerRep,                   // 4
    PSI_VoiceMuted,                 // 5
    PSI_VoiceThruSpeakers,          // 6
    PSI_VoiceVolume,                // 7
    PSI_GamerPictureKey,            // 8
    PSI_GamerMotto,                 // 9
    PSI_GamerTitlesPlayed,          // 10
    PSI_GamerAchievementsEarned,    // 11
    PSI_GameDifficulty,             // 12
    PSI_ControllerSensitivity,      // 13
    PSI_PreferredColor1,            // 14
    PSI_PreferredColor2,            // 15
    PSI_AutoAim,                    // 16
    PSI_AutoCenter,                 // 17
    PSI_MovementControl,            // 18
    PSI_RaceTransmission,           // 19
    PSI_RaceCameraLocation,         // 20
    PSI_RaceBrakeControl,           // 21
    PSI_RaceAcceleratorControl,     // 22
    PSI_GameCredEarned,             // 23
    PSI_GameAchievementsEarned,     // 24
    PSI_EndLiveIds,                 // 25
    PSI_ProfileVersionNum,          // 26
    PSI_ProfileSaveCount,           // 27
    PSI_MAX                         // 28
};

enum EProfileDifficultyOptions
{
    PDO_Normal,                     // 0
    PDO_Easy,                       // 1
    PDO_Hard,                       // 2
    PDO_MAX                         // 3
};

enum EProfileControllerSensitivityOptions
{
    PCSO_Medium,                    // 0
    PCSO_Low,                       // 1
    PCSO_High,                      // 2
    PCSO_MAX                        // 3
};

enum EProfilePreferredColorOptions
{
    PPCO_None,                      // 0
    PPCO_Black,                     // 1
    PPCO_White,                     // 2
    PPCO_Yellow,                    // 3
    PPCO_Orange,                    // 4
    PPCO_Pink,                      // 5
    PPCO_Red,                       // 6
    PPCO_Purple,                    // 7
    PPCO_Blue,                      // 8
    PPCO_Green,                     // 9
    PPCO_Brown,                     // 10
    PPCO_Silver,                    // 11
    PPCO_MAX                        // 12
};

enum EProfileAutoAimOptions
{
    PAAO_Off,                       // 0
    PAAO_On,                        // 1
    PAAO_MAX                        // 2
};

enum EProfileAutoCenterOptions
{
    PACO_Off,                       // 0
    PACO_On,                        // 1
    PACO_MAX                        // 2
};

enum EProfileMovementControlOptions
{
    PMCO_L_Thumbstick,              // 0
    PMCO_R_Thumbstick,              // 1
    PMCO_MAX                        // 2
};

enum EProfileRaceTransmissionOptions
{
    PRTO_Auto,                      // 0
    PRTO_Manual,                    // 1
    PRTO_MAX                        // 2
};

enum EProfileRaceCameraLocationOptions
{
    PRCLO_Behind,                   // 0
    PRCLO_Front,                    // 1
    PRCLO_Inside,                   // 2
    PRCLO_MAX                       // 3
};

enum EProfileRaceBrakeControlOptions
{
    PRBCO_Trigger,                  // 0
    PRBCO_Button,                   // 1
    PRBCO_MAX                       // 2
};

enum EProfileRaceAcceleratorControlOptions
{
    PRACO_Trigger,                  // 0
    PRACO_Button,                   // 1
    PRACO_MAX                       // 2
};

enum EProfileYInversionOptions
{
    PYIO_Off,                       // 0
    PYIO_On,                        // 1
    PYIO_MAX                        // 2
};

enum EProfileXInversionOptions
{
    PXIO_Off,                       // 0
    PXIO_On,                        // 1
    PXIO_MAX                        // 2
};

enum EProfileOmniDirEvadeOptions
{
    PODI_Off,                       // 0
    PODI_On,                        // 1
    PODI_MAX                        // 2
};

enum EProfileControllerVibrationToggleOptions
{
    PCVTO_Off,                      // 0
    PCVTO_IgnoreThis,               // 1
    PCVTO_IgnoreThis2,              // 2
    PCVTO_On,                       // 3
    PCVTO_MAX                       // 4
};

enum EProfileVoiceThruSpeakersOptions
{
    PVTSO_Off,                      // 0
    PVTSO_On,                       // 1
    PVTSO_Both,                     // 2
    PVTSO_MAX                       // 3
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ProfileSettingIds;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array DefaultSettings;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array OwnerMappings[131073];

// Export UOnlineProfileSettings::execGetProfileSettingDefaultId(FFrame&, void* const)
native function GetProfileSettingDefaultId()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609], DefaultId, ListIndex;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlineProfileSettings::execGetProfileSettingDefaultInt(FFrame&, void* const)
native function GetProfileSettingDefaultInt()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609], DefaultInt;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlineProfileSettings::execGetProfileSettingDefaultFloat(FFrame&, void* const)
native function GetProfileSettingDefaultFloat()
{
    local /*0x35EA0000-0x00000000*/ private int ProfileSettingId[8388609];
    local /*0x35EA0000-0x00000000*/ private float DefaultFloat[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UOnlineProfileSettings::execSetToDefaults(FFrame&, void* const)
native event SetToDefaults();

// Export UOnlineProfileSettings::execAppendVersionToReadIds(FFrame&, void* const)
native function AppendVersionToReadIds();

event ModifyAvailableProfileSettings()
{
    //return;    
}

defaultproperties
{
    OwnerMappings=/* Array type was not detected. */
    VersionSettingsId=26
    ProfileMappings=/* Array type was not detected. */
}