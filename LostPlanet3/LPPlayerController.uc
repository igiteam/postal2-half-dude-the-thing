class LPPlayerController extends SPGFCoverPlayerController
    nativereplication
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

const PROPERTY_FRIENDLYFIRE = 0x1000000A;
const PROPERTY_MAPNAME = 0x1000000B;
const PROPERTY_MATCHDIFFICULTY = 0x1000000C;
const PROPERTY_ROUNDSTOWIN = 0x1000000D;
const PROPERTY_SCORELIMIT = 0x1000000E;
const PROPERTY_TIMELIMIT = 0x1000000F;
const PROPERTY_MATCHSTATE = 0x10000010;
const PROPERTY_SCORELEFT = 0x10000011;
const PROPERTY_TIMELEFT = 0x10000012;
const PROPERTY_GAMETYPE = 0x10000013;
const PROPERTY_INVITEMODE = 0x10000014;
const PROPERTY_SESSIONTYPE = 0x10000015;
const PROPERTY_AVAIL_TEAM_SIZE = 0x10000016;
const PROPERTY_AVGPLAYERSKILL = 0x10000017;
const PROPERTY_REQUIRED_DLC = 0x1000003E;
const PROPERTY_INSTALLED_DLC = 0x1000003F;
const PROPERTY_TENGRUSHWINS = 0x20000002;
const PROPERTY_TENGCOLLECTED = 0x20000003;
const PROPERTY_TDMWINS = 0x20000004;
const PROPERTY_SCENARIO_WINS = 0x20000005;
const PROPERTY_CREDITS = 0x20000006;
const PROPERTY_PLAYTIME = 0x20000007;
const PROPERTY_REVIVALS = 0x20000008;
const PROPERTY_KILLS = 0x20000009;
const PROPERTY_SURVIVALWINS = 0x2000003D;
const SESSION_MATCH_QUERY_ALL = 0;
const SESSION_MATCH_QUERY_EXTRACTION = 2;
const SESSION_MATCH_QUERY_SCENARIO = 3;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH = 4;
const SESSION_MATCH_QUERY_PARTY = 5;
const SESSION_MATCH_QUERY_SURVIVAL = 6;
const SESSION_MATCH_QUERY_ALL_DLCEXACT = 7;
const SESSION_MATCH_QUERY_ALL_DLCANY = 8;
const SESSION_MATCH_QUERY_EXTRACTION_DLCEXACT = 10;
const SESSION_MATCH_QUERY_EXTRACTION_DLCANY = 11;
const SESSION_MATCH_QUERY_SCENARIO_DLCEXACT = 12;
const SESSION_MATCH_QUERY_SCENARIO_DLCANY = 13;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCEXACT = 14;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCANY = 15;
const SESSION_MATCH_QUERY_PARTY_DLCEXACT = 16;
const SESSION_MATCH_QUERY_PARTY_DLCANY = 17;
const SESSION_MATCH_QUERY_SURVIVAL_DLCEXACT = 20;
const SESSION_MATCH_QUERY_SURVIVAL_DLCANY = 21;
const SESSION_MATCH_QUERY_ALL_DLCMINREQUIRED = 22;
const SESSION_MATCH_QUERY_EXTRACTION_DLCMINREQUIRED = 23;
const SESSION_MATCH_QUERY_SCENARIO_DLCMINREQUIRED = 24;
const SESSION_MATCH_QUERY_TEAMDEATHMATCH_DLCMINREQUIRED = 25;
const SESSION_MATCH_QUERY_PARTY_DLCMINREQUIRED = 26;
const SESSION_MATCH_QUERY_SURVIVAL_DLCMINREQUIRED = 27;
const CONTEXT_GAME_MODE = 0x0000800B;
const CONTEXT_PRESENCE_IDLE = 0;
const CONTEXT_PRESENCE_DEFAULT = 1;
const CONTEXT_PRESENCE_INMENU = 2;
const CONTEXT_PRESENCE_INLOBBY = 3;
const CONTEXT_PRESENCE_INGAME = 4;
const CONTEXT_PRESENCE_INCAMPAIGN = 5;
const STATS_GROUP_MP_ALL = 19;
const STATS_GROUP_MP_TDM = 20;
const STATS_GROUP_MP_SCENARIO = 25;
const STATS_GROUP_MP_SURVIVAL = 26;
const STATS_GROUP_MP_EXTRACTION = 27;
const STAT_RANK = 0x10000018;
const STAT_CREDITS_CURRENT = 0x10000019;
const STAT_ALL_CREDITS = 0x1000001A;
const STAT_ALL_KILLS = 0x1000001B;
const STAT_ALL_DEATHS = 0x1000001C;
const STAT_ALL_MATCHES_PLAYED = 0x1000001D;
const STAT_ALL_MATCHES_WON = 0x1000001E;
const STAT_ALL_MATCHES_LOST = 0x1000001F;
const STAT_ALL_PLAYTIME = 0x10000020;
const STAT_TDM_CREDITS = 0x10000021;
const STAT_TDM_KILLS = 0x10000022;
const STAT_TDM_DEATHS = 0x10000023;
const STAT_TDM_MATCHES_PLAYED = 0x10000024;
const STAT_TDM_MATCHES_WON = 0x10000025;
const STAT_TDM_MATCHES_LOST = 0x10000026;
const STAT_TDM_PLAYTIME = 0x10000027;
const STAT_SCENARIO_CREDITS = 0x10000028;
const STAT_SCENARIO_KILLS = 0x10000029;
const STAT_SCENARIO_DEATHS = 0x1000002A;
const STAT_SCENARIO_MATCHES_PLAYED = 0x1000002B;
const STAT_SCENARIO_MATCHES_WON = 0x1000002C;
const STAT_SCENARIO_MATCHES_LOST = 0x1000002D;
const STAT_SCENARIO_PLAYTIME = 0x1000002E;
const STAT_SURVIVAL_CREDITS = 0x1000002F;
const STAT_SURVIVAL_KILLS = 0x10000030;
const STAT_SURVIVAL_DEATHS = 0x10000031;
const STAT_SURVIVAL_MATCHES_PLAYED = 0x10000032;
const STAT_SURVIVAL_MATCHES_WON = 0x10000033;
const STAT_SURVIVAL_MATCHES_LOST = 0x10000034;
const STAT_SURVIVAL_PLAYTIME = 0x10000035;
const STAT_EXTRACTION_CREDITS = 0x10000036;
const STAT_EXTRACTION_KILLS = 0x10000037;
const STAT_EXTRACTION_DEATHS = 0x10000038;
const STAT_EXTRACTION_MATCHES_PLAYED = 0x10000039;
const STAT_EXTRACTION_MATCHES_WON = 0x1000003A;
const STAT_EXTRACTION_MATCHES_LOST = 0x1000003B;
const STAT_EXTRACTION_PLAYTIME = 0x1000003C;
const VSWEAPONSNUM = 2;
const VSGameMusicPlaylistIdentifier = -1;

enum EZiplineType
{
    ZiplineVSExit,                  // 0
    ZiplineVSReturn,                // 1
    ZiplineStandalone,              // 2
    EZiplineType_MAX                // 3
};

enum EVSMusicPlayerAction
{
    VSMP_Start,                     // 0
    VSMP_Stop,                      // 1
    VSMP_Pause,                     // 2
    VSMP_Resume,                    // 3
    VSMP_Next,                      // 4
    VSMP_Previous,                  // 5
    VSMP_MAX                        // 6
};

enum EGiveAmmoStorageLocation
{
    EGASL_ToPlayerOnly,             // 0
    EGASL_ToVSStorageOnly,          // 1
    EGASL_ToPlayerOrVSStorage,      // 2
    EGASL_MAX                       // 3
};

struct native PlayerMoveInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShoulderAimButtonPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpecialActionButtonPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTakeCoverButtonPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrenadeButtonPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSprintButtonPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEvadeButtonPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHookButtonPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJetpackButtonPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWinchArmButtonPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRightArmPrimaryActionPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRightArmAltActionPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSShieldBlockPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSShieldBlockPressedThisTick;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirePressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAltFirePressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeButtonPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOperateThermalPostPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPrepareThermalPostTransferPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoThermalPostTransferPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoReviveIncapacitated;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoGeneralInteractionOperation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoHackDeployableOperation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerWeaponSwitchPressed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class NextSpecialMoveClass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayerSwitchWeaponPressedTimeStamp;

    structdefaultproperties
    {
        bShoulderAimButtonPressed=false
        bSpecialActionButtonPressed=false
        bTakeCoverButtonPressed=false
        bGrenadeButtonPressed=false
        bSprintButtonPressed=false
        bEvadeButtonPressed=false
        bHookButtonPressed=false
        bJetpackButtonPressed=false
        bWinchArmButtonPressed=false
        bRightArmPrimaryActionPressed=false
        bRightArmAltActionPressed=false
        bVSShieldBlockPressed=false
        bVSShieldBlockPressedThisTick=false
        bFirePressed=false
        bAltFirePressed=false
        bMeleeButtonPressed=false
        bOperateThermalPostPressed=false
        bPrepareThermalPostTransferPressed=false
        bDoThermalPostTransferPressed=false
        bDoReviveIncapacitated=false
        bDoGeneralInteractionOperation=false
        bDoHackDeployableOperation=false
        bPlayerWeaponSwitchPressed=false
        NextSpecialMoveClass=none
        PlayerSwitchWeaponPressedTimeStamp=0.0000000
    }
};

struct CheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL LPPCRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL LevelTransitionData;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GameflowTPocketBools;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int OverriddenVSSpeed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsVitalSuitExitLockedByKismet;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsVitalSuitEntryLockedByKismet;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoesVitalSuitZiplineOverrideEnterLocking;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoesVitalSuitZiplineOverrideExitLocking;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HumanPlayerSnowMinimum;

    structdefaultproperties
    {
        LPPCRecord=(bIsInVitalSuit=false,bWinchRangeExtension=false,SPPCRecord=(SavedGuid=(A=0,B=0,C=0,D=0),TeamIndex=0),HumanPawn=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName=""),HumanPawnMeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000),SelectedJobLogObjective="",LastActivatedObjective="",bCanUseFullMunitionsLocker=false,TEnergyAmount=0.0000000,ScrapAmountPlayer=0.0000000,WhiteLeechDNAAmount=0.0000000,DisableVSGameMusicPlaybackCount=0,DisableVSUserMusicPlaybackCount=0,bVSGameMusicPlayingOnDisable=false,bVSUserMusicPlayingOnDisable=false,AutoResumeMusicPlayerOnDisableCount=0,bVSMusicPlayerPausedbyPlayer=false,StoredPlayerAmmoInfo=none,StoredPlayerWeaponInfo=none,PerkInventoryInfo=none,JobLogRecord=(TabIndex=0,MissionsRecord=(ListIndex=-1,ListSelectedIndex=-1),MapRecord=(bWorldMap=false,bListOpen=false,bListState=false,LocalMapDisplayIndex=0,MapZoneNameID="None"),InventoryRecord=(ListIndex=-1,ListSelectedIndex=-1),CollectiblesRecord=(ListIndex=-1,ListSelectedIndex=-1),MessagesRecord=(ListSelectedIndex=-1),MusicPlayerRecord=(ListSelectedIndex=-1)),VisitedMapZoneNames=none,AchievementValues=none)
        LevelTransitionData=(PCRecord=(bIsInVitalSuit=false,bWinchRangeExtension=false,SPPCRecord=(SavedGuid=(A=0,B=0,C=0,D=0),TeamIndex=0),HumanPawn=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName=""),HumanPawnMeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000),SelectedJobLogObjective="",LastActivatedObjective="",bCanUseFullMunitionsLocker=false,TEnergyAmount=0.0000000,ScrapAmountPlayer=0.0000000,WhiteLeechDNAAmount=0.0000000,DisableVSGameMusicPlaybackCount=0,DisableVSUserMusicPlaybackCount=0,bVSGameMusicPlayingOnDisable=false,bVSUserMusicPlayingOnDisable=false,AutoResumeMusicPlayerOnDisableCount=0,bVSMusicPlayerPausedbyPlayer=false,StoredPlayerAmmoInfo=none,StoredPlayerWeaponInfo=none,PerkInventoryInfo=none,JobLogRecord=(TabIndex=0,MissionsRecord=(ListIndex=-1,ListSelectedIndex=-1),MapRecord=(bWorldMap=false,bListOpen=false,bListState=false,LocalMapDisplayIndex=0,MapZoneNameID="None"),InventoryRecord=(ListIndex=-1,ListSelectedIndex=-1),CollectiblesRecord=(ListIndex=-1,ListSelectedIndex=-1),MessagesRecord=(ListSelectedIndex=-1),MusicPlayerRecord=(ListSelectedIndex=-1)),VisitedMapZoneNames=none,AchievementValues=none),PersistentVS=(bSaved=false,MapName="None",SubLevel="None",MeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000),VSPawnRecord=(MyGuid=(A=0,B=0,C=0,D=0),LPPawnRecord=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName=""),bReplicated=false,bHidden=false,bIsPossessedByPlayer=false,bMusicTrackPlaying=false,bMusicTrackPaused=false,bPlayerInVitalSuit=false,MusicTrackPlayed=0,WinchLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000),bIsPlatformMode=false,bDesignerForcedVacantVSAttachmentsOff=false,bDesignerForcedLightAttachments=false)))
        GameflowTPocketBools=none
        OverriddenVSSpeed=0
        bIsVitalSuitExitLockedByKismet=false
        bIsVitalSuitEntryLockedByKismet=false
        bDoesVitalSuitZiplineOverrideEnterLocking=false
        bDoesVitalSuitZiplineOverrideExitLocking=false
        HumanPlayerSnowMinimum=0.0000000
    }
};

struct native IncapacitatedCandidate
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Candidate;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Angle;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Distance;

    structdefaultproperties
    {
        Candidate=none
        Angle=0.0000000
        Distance=0.0000000
    }
};

struct native ZiplineStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ZiplineStart;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ZiplineEnd;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte ZiplineType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsZipSprinting;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanDropOff;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DropoffDist;

    structdefaultproperties
    {
        ZiplineStart=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ZiplineEnd=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ZiplineType=EZiplineType.ZiplineVSExit
        bIsZipSprinting=false
        bCanDropOff=false
        DropoffDist=0.0000000
    }
};

struct native DisplayedGrabPoint
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Target;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GrabPointIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrabLocation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFirmGrab;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerIsBusy;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name UIElementClassName;

    structdefaultproperties
    {
        Target=none
        GrabPointIndex=0
        GrabLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        bFirmGrab=false
        bPlayerIsBusy=false
        UIElementClassName="None"
    }
};

struct native PendingAnimSetInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimSetToAdd;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForPlayer;

    structdefaultproperties
    {
        AnimSetToAdd=none
        bForPlayer=false
    }
};

struct native ForcedCameraRotation
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurationTotal;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeIntoRotation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CameraDeltaTotal;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CameraDeltaRotated;

    structdefaultproperties
    {
        DurationTotal=0.0000000
        TimeIntoRotation=0.0000000
        CameraDeltaTotal=(Pitch=0,Yaw=0,Roll=0)
        CameraDeltaRotated=(Pitch=0,Yaw=0,Roll=0)
    }
};

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL FXActionManagerInstance[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array RadarEntries;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerMoveInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PreEMPRot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL myLPHUD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyBasePlayerPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPlayerPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL FirstPersonAimCamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL FirstPersonAimTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL ThirdPersonAimCamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL ThirdPersonAimTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL ShoulderAimTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL JobLogCamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL JobLogTransitionInParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL JobLogTransitionOutParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL RagdollCamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL RagdollTransitionInParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL RagdollTransitionOutParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL GrenadeAimCamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL GrenadeAimTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CrouchAimCamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CrouchAimTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL VSRepairCamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL VSRepairTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL ThermalPostTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL ReviveIncapacitatedTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL GeneralInteractionObjectTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL HardCutTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL DeathCameraZoomCamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL DeathCameraZoomTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL IncapacitatedCameraParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL IncapacitatedTransitionParam[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL InPlaceRepairCamParams[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInVitalSuit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsVitalSuitEntryLockedByKismet;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsVitalSuitExitLockedByKismet;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsVitalSuitExitLockedByCode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoesVitalSuitZiplineOverrideExitLocking;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoesVitalSuitZiplineOverrideEnterLocking;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrappleEnabled[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrappleAnything[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeEnabled[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerReadyToMoveToGrapplePoint[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoBoneTranslation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMobilityMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableExtendedGrappleSearch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowGrenadeAssistZone[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowWinchAssistZone[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowAiAttackArcs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShowLobFireAttackDebug[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLeftLedgeTimerExpired[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayGrabPoints;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayVSExit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHostGameEnabled[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsNextWeapon;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDecelerateDash;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bThermalPostPlantedOK;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAnnouncementWasPlaying;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMunitionsLockerEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMunitionsLockerReloadEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSHasFullMunitionsLocker;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bExitingScoreboardRequiresInput;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisplayCombatWindows;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAlwaysDisplayDPAD;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOpenJobLogToMusicPlayer[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOpenJobLogToAutopilot[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForJobLogToOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSGameMusicPlayingOnDisable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSUserMusicPlayingOnDisable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSMusicPlayerPausedbyPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerStorageRead[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPersistentDataInit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSkinsLoaded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasDeathCameraBeenActivatedThroughIncapacitation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAutoUnlockPreOrderDLC[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bServerWeaponsInitialized;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReplicateServerWeapons;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNotifiedOfInvalidWeapons;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPendingApplyLoadOutOnServerWeapons;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAreTutorialsActive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisableVSCockpitCameraShake[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDeadDuringIncap;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAimDownSightAllowed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAlternateCoverButton;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPawnReady[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoingFadeToBlackDeath[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDesignerRequestedMunitionsLocker[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bThermalTransferInterruptedByDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSemiDukeMode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMissionFailed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsReturningToMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseSystemWideMuting;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMinimalPauseMenu;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCreditsSkippable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGameStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSavingDisabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HumanPlayerPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExitCableSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ExitCableAttachSocket;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExitCableEndComponentSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExitCableHookComponentSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FutureVSRotate180DotMaxDotProduct[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrappleHookCurrentTarget[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpecialDodgeActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SpecialDodgeType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SpecialDodgeActorDodged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeWasNotifiedOfDodgeWindowOpening;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeWasNotifiedOfDodgeWindowClosing;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentAmbientTemperature;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmbientTemperatureChangeRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSCamTransitionInParam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExitVSPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StruggleButtonTexture[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class ThermalEnergyClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastVSDashTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DashAcceleration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastTouchedThermalPost;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastTouchedGeneralInteractionObject;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastTouchedHackableDeployableComponentOwner;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ZiplineInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StruggleButtonStrength;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int VSFirePausedRefCount[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte WantsToFireVS[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentTutorialMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentBombActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEngPickupAccumulator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastSolidFootingLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL MPAnnouncementComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array QueuedAnnouncementAkEvents;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MunitionsLockerActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CommitMapChangeSavedClassesRefsToPreventFromGC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CommitMapChangeSavedObjectRefsToPreventFromGC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class SavedPersistentVSPawnRefToPreventFromGC;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SavedThirdPersonTransitionDuration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SavedShoulderTransitionDuration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array DisplayedGrabPoints;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class PerkDeploySpecialMoveClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IncapacitatedTapInHealthAccumulator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IncapacitatedHealthAccumulator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IncapacitatedHealthDeccumulator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IncapacitationBeginTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SafetyDelayToUnPauseAiAfterEnteringOrExitingVs[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToDelayNextRightArmPress[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL SeekFreeLoader[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL SeekFreeMultiClassLoader[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL SeekFreeMultiWeaponClassLoader[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize array Upgrades[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StoredWeaponsList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StoredAmmoList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogAutoOpenMessage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float JobLogAutoOpenMessageTimeoutTime[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DisableVSGameMusicPlaybackCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DisableVSUserMusicPlaybackCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AutoResumeMusicPlayerOnDisableCount;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastMeleeTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FastTravelInfoList[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MatchDataStore;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array OnPersistentDataInitDelegates[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int BestiaryItemSlot;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int BestiaryItemIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastKnownPawnLocation[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LedgeWalkCovInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PlayStartTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ForcedCameraRotationInfo[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Rotate180Duration;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PickedTeamNum;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DesiredNevecPawnClassName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DesiredPiratePawnClassName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovie_JobLog;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovie_MunitionsLocker;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GFxFlashMovieInstanceClass_MunitionsLocker;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WeaponContentReferences;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WeaponContentClassNames[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize travel DLCClassInfo ServerWeapons[2097177];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataTutorial;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TutorialTrackingInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TutorialTimeDilationStartSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TutorialTimeDilationLoopingSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TutorialTimeDilationEndSound;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PersistentTutorialUpdateDelay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PendingAnimSets[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int QuestProgressMessagesDuration[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayBleedOutUntilTime;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL TVCameraManager[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ZiplineSlowdownDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ZiplineDepartDistance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> SubscribedPostProcessCB[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FadeToBlockOnKillZDuration[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array MapZones[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VisitedMapZoneNames;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentMailMessage[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VSReticleHelpButtonStates[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int OverriddenVSSpeed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string UnlockedMovieList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MissionFailedDelayForPostProcessEffect[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MissionFailedPostProcessEffectDuration[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MissionFailedPercentPostProcessEffectToFinish[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastEnterExitVSTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextRepairTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextRepairStopTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinimumTimeBetweenRepairs;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinimumDurationOfRepair;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LocalSecondsUntilGameStarts;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnPersistentDataInit__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __PostProcessCB__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __GrappleRecoverySort__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __IncapacitatedCandidateSortFunc__Delegate;

// Export ULPPlayerController::execLpShowSelf(FFrame&, void* const)
native function LpShowSelf();

// Export ULPPlayerController::execDisplayGrabPoints(FFrame&, void* const)
native function DisplayGrabPoints();

// Export ULPPlayerController::execNativeDebug(FFrame&, void* const)
native function NativeDebug();

// Export ULPPlayerController::execFindBestVSToEnter(FFrame&, void* const)
native function FindBestVSToEnter()
{
    local /*0x97E50000-0x00000000*/ private bool bBypassOptionalChecks[8388609];
    local /*0x97E50000-0x00000000*/ private class InRequiredClass[9437185];
    local /*0x97E50000-0x00000000*/ private bool bRequireFacingVS[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    true                    
}

// Export ULPPlayerController::execDisplayCombatWindows(FFrame&, void* const)
native function DisplayCombatWindows();

// Export ULPPlayerController::execShutdownWeatherSystem(FFrame&, void* const)
native function ShutdownWeatherSystem();

// Export ULPPlayerController::execHasUpgrade(FFrame&, void* const)
native function HasUpgrade()
{
    local /*0x97E50000-0x00000000*/ private class InUpgradeClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL OutUpgrade[26214401];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPlayerController::execGetGrappleParams(FFrame&, void* const)
native function GetGrappleParams()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689];


}

// Export ULPPlayerController::execIsOkToPlayMusic(FFrame&, void* const)
native function IsOkToPlayMusic()
{
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185], ReturnValue;

    false            
}

// Export ULPPlayerController::execIsCrosshairShown(FFrame&, void* const)
native final function IsCrosshairShown()
{
    local /*0x97E50000-0x00000000*/ private bool considerCrosshairAboutToBeShownAsShown[9437185], ReturnValue;

    true            
}

// Export ULPPlayerController::execTurnToFace(FFrame&, void* const)
native function TurnToFace()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DesiredFacing[25296897];


}

// Export ULPPlayerController::execUpdateRotationFromViewNative_PlayerWalking(FFrame&, void* const)
native function UpdateRotationFromViewNative_PlayerWalking()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ViewRotation[25296897], deltaRotation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPlayerController::execUpdateForcedCameraRotation(FFrame&, void* const)
native function UpdateForcedCameraRotation()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];


}

// Export ULPPlayerController::execIsForcedCameraRotationInProgress(FFrame&, void* const)
native function IsForcedCameraRotationInProgress()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPlayerController::execGetGrapplingHook(FFrame&, void* const)
native final function GetGrapplingHook()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPlayerController::execSetGrappleHookCurrentTarget(FFrame&, void* const)
native final function SetGrappleHookCurrentTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL newGrapplePoint[8388609];


}

// Export ULPPlayerController::execSetGrappleHookCurrentTargetValid(FFrame&, void* const)
native final function SetGrappleHookCurrentTargetValid()
{
    local /*0x97E50000-0x00000000*/ private bool bValid[8388609];


}

// Export ULPPlayerController::execUpdateGrappleHookTargets(FFrame&, void* const)
native function UpdateGrappleHookTargets();

// Export ULPPlayerController::execUpdateCurrentGrappleHookTarget(FFrame&, void* const)
native function UpdateCurrentGrappleHookTarget();

// Export ULPPlayerController::execSetSoundClassVolumes(FFrame&, void* const)
native function SetSoundClassVolumes()
{
    local /*0x97E50000-0x00000000*/ private float DialogVolume[8388609], FxVolume, MusicVolume, MovieVolume;


}

// Export ULPPlayerController::execGetStatManager(FFrame&, void* const)
native final function GetStatManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPPlayerController::execModifyStat(FFrame&, void* const)
native final simulated function ModifyStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private int Amount[9437185];
    local /*0x97E50000-0x00000000*/ private byte ModType[9437185];

    1
    0                    
}

// Export ULPPlayerController::execClientNotifyScoreHit(FFrame&, void* const)
reliable client native final simulated function ClientNotifyScoreHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL DamagedActor[8388609];
    local /*0x97E50000-0x00000000*/ private float DamageInflicted[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsKillShot[8388609], bPlayHitDetectionSound;


}

// Export ULPPlayerController::execAwardCreditsForDamage(FFrame&, void* const)
native final function AwardCreditsForDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL DamagedPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float DamageInflicted[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsKillShot[8388609];


}

// Export ULPPlayerController::execIsInPrivateSession(FFrame&, void* const)
native final function IsInPrivateSession()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPlayerController::execAllowSubtitlesDuringPause(FFrame&, void* const)
native simulated function AllowSubtitlesDuringPause()
{
    local /*0x97E50000-0x00000000*/ private bool bAllow[8388609];


}

// Export ULPPlayerController::execIsAllowSubtitlesWhilePaused(FFrame&, void* const)
native simulated function IsAllowSubtitlesWhilePaused()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPlayerController::execPauseActiveSubtitles(FFrame&, void* const)
native simulated function PauseActiveSubtitles()
{
    local /*0x97E50000-0x00000000*/ private bool bPaused[8388609];
    local /*0x97E50000-0x00000000*/ private float fTimeCorrection[9437185];

    0.0000000                
}

// Export ULPPlayerController::execIsPlayerLocallyMuted(FFrame&, void* const)
native function IsPlayerLocallyMuted()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId[25296897];
    local /*0x97E50000-0x00000000*/ private bool checkSystemWide[9437185], ReturnValue;

    true                
}

delegate OnPersistentDataInit()
{
    //return;    
}

delegate PostProcessCB()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PPSettings[25165825];

    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private bool bFinishedReplication;

    switch(VarName)
    {
        // End:0xE0
        case 'ServerWeapons':
            bFinishedReplication = true;
            Idx = 0;
            J0x36:

            // End:0x9E [Loop If]
            if(Idx < 25)
            {
                // End:0x90
                if(ServerWeapons[Idx].ClassName ~= "NotYetReplicated!")
                {
                    bFinishedReplication = false;
                }
                ++Idx;
                // [Loop Continue]
                goto J0x36;
            }
            // End:0xDD
            if(bFinishedReplication)
            {
                bServerWeaponsInitialized = true;
                // End:0xDA
                if(bPendingApplyLoadOutOnServerWeapons)
                {
                    SetLoadOutFromProfile();
                    bPendingApplyLoadOutOnServerWeapons = false;
                }                
            }
            // End:0xE3
            break;
        // End:0xFFFF
        default:
            break;
    }
    super.ReplicatedEvent(VarName);
    //return;    
}

reliable client simulated event ClientPlayForceFeedbackWaveform()
{
    local /*0x97E50000-0x00000000*/ private @NULL FFWaveform[8388609], FFWaveformInstigator, FXAction;

    super(SPPlayerController).ClientPlayForceFeedbackWaveform(FFWaveform, FFWaveformInstigator);
    // End:0xDA
    if((FFWaveform != none) && FFWaveform.bIsLooping)
    {
        // End:0xDA
        if(FXActionManagerInstance != none)
        {
            FXAction = LPFXAction_LoopingRumble(FXActionManagerInstance.StartFXAction(Class'LPFXAction_LoopingRumble'));
            // End:0xDA
            if(FXAction != none)
            {
                FXAction.SetData(FFWaveform, FFWaveformInstigator);
            }
        }
    }
    //return;    
}

reliable client simulated event ClientStopForceFeedbackWaveform()
{
    local /*0x97E50000-0x00000000*/ private @NULL FFWaveform[9437185], FXAction;

    super(PlayerController).ClientStopForceFeedbackWaveform(FFWaveform);
    // End:0xFE
    if((FFWaveform == none) || FFWaveform.bIsLooping)
    {
        // End:0xFE
        if(FXActionManagerInstance != none)
        {
            FXAction = LPFXAction_LoopingRumble(FXActionManagerInstance.GetFXAction(Class'LPFXAction_LoopingRumble'));
            // End:0xFE
            if((FXAction != none) && (FFWaveform == none) || FXAction.ActiveFFWaveform == FFWaveform)
            {
                FXAction.End();
            }
        }
    }
    //return;    
}

function CheckForFalling()
{
    // End:0x3C
    if((MyPlayerPawn == none) || int(MyPlayerPawn.Physics) != int(2))
    {
        return;
    }
    // End:0xCC
    if(((MyPlayerPawn.bGrappleHooked || MyPlayerPawn.InStruggleMode) || MyPlayerPawn.bBearTrapped) || MyPlayerPawn.bIncapacitated)
    {
        return;
    }
    GotoState('PlayerFalling');
    //return;    
}

function GetMyPlayerPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x23
    if(bIsInVitalSuit)
    {
        return LPPlayerPawn(HumanPlayerPawn);        
    }
    else
    {
        // End:0x3F
        if(MyPlayerPawn != none)
        {
            return MyPlayerPawn;            
        }
        else
        {
            return LPPlayerPawn(Pawn);
        }
    }
    //return ReturnValue;    
}

reliable client simulated event ClientPlayMovie()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MovieName[8388609];
    local /*0x97E50000-0x00000000*/ private int InStartOfRenderingMovieFrame[9437185], InEndOfRenderingMovieFrame;
    local /*0x97E50000-0x00000000*/ private bool bRestrictPausing[9437185], bPlayOnceFromStream, bOnlyBackButtonSkipsMovie, bLoop, bLoopFromMemory;

    local /*0x97E50000-0x00000000*/ private editfixedsize string CurrentMovie;

    -1
    -1
    false
    true
    true
    false
    false
    GetCurrentMovie(CurrentMovie);
    // End:0xAE
    if(Class'LPGFxFrontEnd_CinematicGallery'.static.IsMovieUnlockable(MovieName))
    {
        // End:0x83
        if(CurrentMovie ~= MovieName)
        {            
        }
        else
        {
            // End:0xAE
            if(!IsMovieUnlocked(MovieName))
            {
                UnlockMovie(MovieName);
            }
        }
    }
    super(GamePlayerController).ClientPlayMovie(MovieName, InStartOfRenderingMovieFrame, InEndOfRenderingMovieFrame, bRestrictPausing, bPlayOnceFromStream, bOnlyBackButtonSkipsMovie, bLoop, bLoopFromMemory);
    //return;    
}

reliable client simulated function ClientShowMapGameSpecificLoadingMovie()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MovieName[8388609], CurrentMovie;

    // End:0x24
    if(Len(MovieName) == 0)
    {
        ClientShowLoadingMovie(true);        
    }
    else
    {
        GetCurrentMovie(CurrentMovie);
        // End:0x68
        if(MovieName != CurrentMovie)
        {
            ClientPlayMovie(MovieName,,, true,,, true, true);
        }
    }
    //return;    
}

function IsValidSkinForServer()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InSkinClassPath[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIgnoreInvalidDLCs[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL GRI, SkinDLCClassInfo;

    false
    // End:0x17
    if(InSkinClassPath == "")
    {
        return true;
    }
    GRI = LPGRI(WorldInfo.GRI);
    // End:0x106
    if(GRI != none)
    {
        // End:0x101
        if(GRI.GetSkinDLClassInfo(InSkinClassPath, SkinDLCClassInfo))
        {
            // End:0xFE
            if(LPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).AllPlayersHaveRequiredDLC(SkinDLCClassInfo.RequiredDLCs, bIgnoreInvalidDLCs, bIgnoreInvalidDLCs))
            {
                return true;
            }            
        }
        else
        {
            return false;
        }        
    }
    return false;
    //return ReturnValue;    
}

function IsValidWeaponForServer()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InWeaponClassPath[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIgnoreInvalidDLCs[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL GRI;

    false
    // End:0x17
    if(InWeaponClassPath == "")
    {
        return true;
    }
    GRI = LPGRI(WorldInfo.GRI);
    // End:0x139
    if(GRI != none)
    {
        Idx = 0;
        J0x62:

        // End:0x136 [Loop If]
        if(Idx < 25)
        {
            // End:0x128
            if(ServerWeapons[Idx].ClassName ~= InWeaponClassPath)
            {
                // End:0x126
                if(LPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager()).AllPlayersHaveRequiredDLC(ServerWeapons[Idx].RequiredDLCs, bIgnoreInvalidDLCs, bIgnoreInvalidDLCs))
                {
                    return true;                    
                }
                else
                {
                    return false;
                }
            }
            ++Idx;
            // [Loop Continue]
            goto J0x62;
        }        
    }
    return false;
    //return ReturnValue;    
}

function RadarAddObjects()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Targets[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InRadarParams[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL Target;

    // End:0x125
    foreach Targets(Target)
    {
        // End:0x4A
        if(!ClassIsChildOf(Target.Class, Class'Engine.Actor'))
        {
            continue;            
        }
        else
        {
            Idx = RadarEntries.Find('Item', Actor(Target));            
            // End:0xF4
            if(Idx == -1)
            {
                Idx = RadarEntries.Length;
                RadarEntries.Length = RadarEntries.Length + 1;
                RadarEntries[Idx].Item = Actor(Target);
            }
            RadarEntries[Idx].RadarParams = InRadarParams;            
        }
    }    
    //return;    
}

function RadarRemoveObjects()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Targets[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL Target;

    // End:0xA5
    foreach Targets(Target)
    {
        // End:0x4A
        if(!ClassIsChildOf(Target.Class, Class'Engine.Actor'))
        {
            continue;            
        }
        else
        {
            Idx = RadarEntries.Find('Item', Actor(Target));            
            // End:0xA4
            if(Idx != -1)
            {
                RadarEntries.Remove(Idx, 1);                
            }            
        }
    }    
    //return;    
}

simulated event PlayerSpawned()
{
    local /*0x97E50000-0x00000000*/ private int Idx, Num;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL DLCClassInfoDefault, DLCMan;

    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        return;
    }
    DLCClassInfoDefault.ClassName = "";
    Idx = 0;
    J0x55:

    // End:0x90 [Loop If]
    if(Idx < 25)
    {
        ServerWeapons[Idx] = DLCClassInfoDefault;
        ++Idx;
        // [Loop Continue]
        goto J0x55;
    }
    // End:0xB8
    if(WeaponContentClassNames.Length < 25)
    {
        Num = WeaponContentClassNames.Length;        
    }
    else
    {
        Num = 25;
    }
    DLCMan = LPDownloadableContentManager(Class'Engine.GameEngine'.static.GetDLCManager());
    Idx = 0;
    J0x101:

    // End:0x1CC [Loop If]
    if(Idx < Num)
    {
        ServerWeapons[Idx].ClassName = WeaponContentClassNames[Idx];
        ServerWeapons[Idx].RequiredDLCs = DLCMan.GetRequiredDLCIdForWeaponName(ServerWeapons[Idx].ClassName);
        ++Idx;
        // [Loop Continue]
        goto J0x101;
    }
    bReplicateServerWeapons = true;
    bServerWeaponsInitialized = true;
    NextRepairTime = 0.0000000;
    NextRepairStopTime = 0.0000000;
    //return;    
}

simulated function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL Upgrade, UserMusicPlayer;
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x8A
    if((int(WorldInfo.NetMode) != int(NM_Client)) && int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        Class'LPMultiplayerManager'.static.GetInstance().ConnectionErrorCount = 0;
    }
    VSReticleHelpButtonStates.Length = 12;
    // End:0xC5
    if(FXActionManagerInstance != none)
    {
        FXActionManagerInstance.Init();
    }
    SavedThirdPersonTransitionDuration = LPCameraTransitionCubicParam(ThirdPersonAimTransitionParam).Duration;
    SavedShoulderTransitionDuration = LPCameraTransitionCubicParam(ShoulderAimTransitionParam).Duration;
    // End:0x1CF
    if(TuneDataTutorial != none)
    {
        Idx = 0;
        J0x141:

        // End:0x1CF [Loop If]
        if(Idx < 15)
        {
            TutorialTrackingInfo[int(TuneDataTutorial.TutorialTrackingInfo[Idx].TutorialType)] = TuneDataTutorial.TutorialTrackingInfo[Idx];
            ++Idx;
            // [Loop Continue]
            goto J0x141;
        }
    }
    super(SPPlayerController).PostBeginPlay();
    InitCameraModes();
    TimeWasNotifiedOfDodgeWindowOpening = -1.0000000;
    TimeWasNotifiedOfDodgeWindowClosing = -1.0000000;
    // End:0x239
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        MinRespawnDelay = 5.0000000;
    }
    // End:0x28F
    if(LPMapInfo_MP(WorldInfo.GetMapInfo()) != none)
    {
        ClearTimer('UpdateMapInfoEventTimers');
        SetTimer(0.2500000, true, 'UpdateMapInfoEventTimers');
    }
    ClearTimer('LeftLedgeTimerExpired');
    bLeftLedgeTimerExpired = true;
    // End:0x348
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        bAlwaysDisplayDPAD = true;
        // End:0x314
        if(myLPHUD != none)
        {
            myLPHUD.ShowDPadCluster(true, false);
        }
        InitMatchData();
        PlayStartTime = WorldInfo.TimeSeconds;
    }
    ConstructPersistentDataManagers();
    UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
    // End:0x3E3
    if((UserMusicPlayer != none) && UserMusicPlayer.__OnNewTrackStart__Delegate == none)
    {
        UserMusicPlayer.__OnNewTrackStart__Delegate = NotifyNewTrack;
    }
    DelayBleedOutUntilTime = 0.0000000;
    // End:0x46B
    if(TVCameraManager != none)
    {
        // End:0x438
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            TVCameraManager = none;            
        }
        else
        {
            TVCameraManager.PostBeginPlay(self);
            SetTimer(0.2000000, false, 'InitTVCameraManager');
        }
    }
    // End:0x4A3
    foreach Upgrades(Upgrade)
    {
        Upgrade.PostBeginPlay(self);        
    }    
    MarkCurrentMapVisited();
    LocalSecondsUntilGameStarts = LPGRI_Base_MP(WorldInfo.GRI).TimeToDelayGameStart;
    //return;    
}

function MarkCurrentMapVisited()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyMapInfo;

    MyMapInfo = LPMapInfo(WorldInfo.GetMapInfo());
    // End:0xA5
    if(MyMapInfo != none)
    {
        // End:0xA5
        if(MyMapInfo.ContractsMapDisplayEntries.Length > 0)
        {
            MarkMapZoneVisited(MyMapInfo.ContractsMapDisplayEntries[0].MapZoneName);
        }
    }
    //return;    
}

function MarkMapZoneVisited()
{
    local /*0x97E50000-0x00000000*/ private name MapZoneName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bRemove[9437185];
    local /*0x97E50000-0x00000000*/ private int iIndex;

    false
    iIndex = VisitedMapZoneNames.Find(MapZoneName);    
    // End:0x74
    if(iIndex == -1)
    {
        // End:0x5E
        if(bRemove)
        {
            VisitedMapZoneNames.RemoveItem(MapZoneName);                        
        }
        else
        {
            VisitedMapZoneNames.AddItem(MapZoneName);            
        }
    }
    //return;    
}

exec function UnlockWorldMapPhase()
{
    local /*0x97E50000-0x00000000*/ private int Phase[8388609], I;

    VisitedMapZoneNames.Length = 0;
    I = 0;
    J0x17:

    // End:0xB4 [Loop If]
    if(I < MapZones.Length)
    {
        // End:0xA6
        if((Phase == MapZones[I].Phase) || Phase == 3)
        {
            MarkMapZoneVisited(MapZones[I].ZoneNameID);
        }
        I++;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

function SetCurrentMapDisplayIndex()
{
    local /*0x97E50000-0x00000000*/ private int Index[8388609];
    local /*0x97E50000-0x00000000*/ private name MapZoneNameID[9437185];

    'None'
    JobLogInfo.MapRecord.LocalMapDisplayIndex = Index;
    JobLogInfo.MapRecord.MapZoneNameID = MapZoneNameID;
    // End:0xB6
    if(myLPHUD != none)
    {
        myLPHUD.SetCurrentMapDisplayIndex(Index);
    }
    //return;    
}

function OnSetLocalMapZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609], MyMapInfo;
    local /*0x97E50000-0x00000000*/ private int I;

    MyMapInfo = LPMapInfo(WorldInfo.GetMapInfo());
    // End:0x17D
    if(MyMapInfo != none)
    {
        I = 0;
        J0x4D:

        // End:0x17D [Loop If]
        if(I < MyMapInfo.ContractsMapDisplayEntries.Length)
        {
            // End:0x16F
            if(MyMapInfo.ContractsMapDisplayEntries[I].MapZoneName == Action.MapZoneName)
            {
                MarkMapZoneVisited(MyMapInfo.ContractsMapDisplayEntries[I].MapZoneName);
                SetCurrentMapDisplayIndex(I, MyMapInfo.ContractsMapDisplayEntries[I].MapZoneName);
                // [Explicit Break]
                goto J0x17D;
            }
            I++;
            // [Loop Continue]
            goto J0x4D;
        }
    }
    J0x17D:

    //return;    
}

function GetCurrentMapDisplayIndexFromMapZoneName()
{
    local /*0x97E50000-0x00000000*/ private name ZoneName[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MyMapInfo;
    local /*0x97E50000-0x00000000*/ private int I;

    MyMapInfo = LPMapInfo(WorldInfo.GetMapInfo());
    // End:0xDB
    if(MyMapInfo != none)
    {
        I = 0;
        J0x4D:

        // End:0xDB [Loop If]
        if(I < MyMapInfo.ContractsMapDisplayEntries.Length)
        {
            // End:0xCD
            if(MyMapInfo.ContractsMapDisplayEntries[I].MapZoneName == ZoneName)
            {
                return I;
            }
            I++;
            // [Loop Continue]
            goto J0x4D;
        }
    }
    return -1;
    //return ReturnValue;    
}

function GetMapZoneInfoFromName()
{
    local /*0x97E50000-0x00000000*/ private name ZoneName[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL OutZoneInfo[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x84 [Loop If]
    if(I < MapZones.Length)
    {
        // End:0x76
        if(MapZones[I].ZoneNameID == ZoneName)
        {
            OutZoneInfo = MapZones[I];
            return true;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function IsMapZoneVisited()
{
    local /*0x97E50000-0x00000000*/ private name ZoneName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x54 [Loop If]
    if(I < VisitedMapZoneNames.Length)
    {
        // End:0x46
        if(VisitedMapZoneNames[I] == ZoneName)
        {
            return true;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function HideTaserHUD()
{
    // End:0x43
    if(VSReticleHelpButtonStates[10] || VSReticleHelpButtonStates[11])
    {
        myLPHUD.SetVSReticleShockHelp(true);        
    }
    else
    {
        myLPHUD.ShowVSReticleShockMeter(false);
    }
    //return;    
}

function InitTVCameraManager()
{
    // End:0x1D
    if(!IsLocalPlayerController())
    {
        TVCameraManager = none;        
    }
    else
    {
        TVCameraManager.BuildVolumeList(self);
    }
    //return;    
}

exec function EnableTVCameraSystem()
{
    local /*0x97E50000-0x00000000*/ private bool bTrackMyself[9437185];

    true
    // End:0x81
    if((TVCameraManager != none) && IsLocalPlayerController())
    {
        // End:0x5E
        if(bTrackMyself)
        {
            TVCameraManager.EnableTVCamera(1, Pawn);            
        }
        else
        {
            TVCameraManager.EnableTVCamera(2);
        }
    }
    //return;    
}

exec function DisableTVCameraSystem()
{
    // End:0x3D
    if((TVCameraManager != none) && IsLocalPlayerController())
    {
        TVCameraManager.DisableTVCamera();
    }
    //return;    
}

function InitPlayerReplicationInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    super(Controller).InitPlayerReplicationInfo();
    PRI = LPPRI(PlayerReplicationInfo);
    // End:0x55
    if(PRI != none)
    {
        PRI.InitPerksManager();
    }
    //return;    
}

function Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL aPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(aPawn, bVehicleTransition);
    ApplyPendingAnimSets(aPawn);
    //return;    
}

function HaveNoWeapons()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Weap;
    local /*0x97E50000-0x00000000*/ private bool bHaveNoWeapons;

    bHaveNoWeapons = true;
    // End:0x7D
    foreach MyPlayerPawn.InvManager.InventoryActors(Class'LPWeapon', Weap)
    {
        // End:0x7C
        if(LPWeaponGrenade(Weap) == none)
        {
            bHaveNoWeapons = false;
            // End:0x7D
            break;
        }        
    }    
    return bHaveNoWeapons;
    //return ReturnValue;    
}

exec function LogMPWeaponBug()
{
    //return;    
}

function CheckForMPWeaponBug()
{
    // End:0x55
    if((((Pawn == none) || !Pawn.IsAliveAndWell()) || IsDoingASpecialMove()) || bIsInVitalSuit)
    {
        return;
    }
    // End:0x83
    if(HaveNoWeapons())
    {
        MyPlayerPawn.ServerRequestWeapon();
        return;
    }
    // End:0x273
    if((((Pawn.Weapon == none) || !LPWeapon(Pawn.Weapon).HasBeenActivated()) || Pawn.Weapon.Mesh == none) || !Pawn.Weapon.Mesh.bAttached)
    {
        // End:0x19D
        if(Pawn.Weapon == none)
        {            
        }
        else
        {
            // End:0x1D9
            if(Pawn.Weapon.Mesh == none)
            {                
            }
            else
            {
                // End:0x266
                if(!Pawn.Weapon.Mesh.bAttached && Pawn.Weapon.IsInState('Active'))
                {                    
                }
            }
        }
        NextWeapon();        
    }
    else
    {
        // End:0x308
        if(Pawn.Weapon.IsInState('Active') && Pawn.Weapon.Mesh.HiddenGame)
        {
            NextWeapon();            
        }
    }
    //return;    
}

function SetMyPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsLocalPlayer;

    super.SetMyPawn(inPawn);
    PlayerMoveInfo.bVSShieldBlockPressed = false;
    PlayerMoveInfo.bShoulderAimButtonPressed = false;
    PlayerMoveInfo.bSpecialActionButtonPressed = false;
    PlayerMoveInfo.bTakeCoverButtonPressed = false;
    PlayerMoveInfo.bSprintButtonPressed = false;
    PlayerMoveInfo.bEvadeButtonPressed = false;
    PlayerMoveInfo.bHookButtonPressed = false;
    PlayerMoveInfo.bJetpackButtonPressed = false;
    PlayerMoveInfo.bWinchArmButtonPressed = false;
    PlayerMoveInfo.bRightArmAltActionPressed = false;
    PlayerMoveInfo.bRightArmPrimaryActionPressed = false;
    PlayerMoveInfo.bMeleeButtonPressed = false;
    PlayerMoveInfo.bVSShieldBlockPressedThisTick = false;
    PlayerMoveInfo.bPlayerWeaponSwitchPressed = false;
    PlayerMoveInfo.bGrenadeButtonPressed = false;
    TEngPickupAccumulator = 0.0000000;
    bIsLocalPlayer = IsLocalPlayerController();
    MyBasePlayerPawn = LPBasePlayerPawn(inPawn);
    MyPlayerPawn = LPPlayerPawn(inPawn);
    // End:0x36B
    if(MyBasePlayerPawn != none)
    {
        NotifyIsAimingDownSight(false);
        // End:0x2EA
        if(bIsLocalPlayer)
        {
            ClearTimer('CallUpdateGrappleHookTargets');
            SetTimer(0.2000000, true, 'CallUpdateGrappleHookTargets');
            // End:0x2C1
            if(int(WorldInfo.NetMode) != int(NM_Standalone))
            {
                InitEnhancedRepair();
            }
            MyBasePlayerPawn.InitWeatherComponents();
            SearchForHUDPoints();
        }
        LastKnownPawnLocation = MyBasePlayerPawn.Location;
        // End:0x36B
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            InitSixthSense();
            SetTimer(1.0000000, true, 'UpdateTimeSpent');
            SetTimer(0.1000000, true, 'UpdateDistanceTraveled');
        }
    }
    // End:0x462
    if(MyPlayerPawn != none)
    {
        MyPlayerPawn.SavedController = self;
        MyPlayerPawn.CheckUmbilicalRange();
        // End:0x401
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            MyPlayerPawn.CheckThermalEnergyPocketProximity();
        }
        // End:0x44E
        if(int(WorldInfo.NetMode) != int(NM_Client))
        {
            MyPlayerPawn.AmmoReplenishTimeCounter = 0.0000000;
        }
        InitSprint();
        SetLoadOutFromProfile();
    }
    CurrentBombActor = none;
    // End:0x4B8
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && bIsLocalPlayer)
    {
        SetTimer(0.2500000, true, 'CheckForMeleeTakedownTarget');
    }
    DelayBleedOutUntilTime = 0.0000000;
    // End:0x54C
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x54C
        if(((IsLocalPlayerController()) && int(WorldInfo.NetMode) == int(NM_Client)) && Pawn != none)
        {
            SetTimer(0.5000000, true, 'CheckForMPWeaponBug');
        }
    }
    NextRepairTime = 0.0000000;
    NextRepairStopTime = 0.0000000;
    //return;    
}

function UpdateLastSolidFootingLocation()
{
    // End:0x9F
    if((Pawn != none) && int(Pawn.Physics) == int(1))
    {
        LastSolidFootingLocation = Pawn.Location;
        LastSolidFootingLocation.Z -= Pawn.GetCollisionHeight();
    }
    //return;    
}

function NotifyChangedWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevWeapon[8388609], NewWeapon;

    super(PlayerController).NotifyChangedWeapon(PrevWeapon, NewWeapon);
    UpdateWeaponTypeTutorial(NewWeapon);
    UpdateAmmoTypeTutorial(NewWeapon);
    //return;    
}

simulated function SearchForHUDPoints()
{
    local /*0x97E50000-0x00000000*/ private @NULL TEP, Grenade, SCO, DRO, ci, ba,
	    KO, SNO, LPMI;

    local /*0x97E50000-0x00000000*/ private int iIndex;
    local /*0x97E50000-0x00000000*/ private float fMaxRange;
    local /*0x97E50000-0x00000000*/ private @NULL CameraLoc, CameraRot;

    // End:0x2C
    if(!IsTimerActive('SearchForHUDPoints'))
    {
        SetTimer(0.2500000, true, 'SearchForHUDPoints');
    }
    // End:0x4E
    if((myLPHUD == none) || MyBasePlayerPawn == none)
    {
        return;
    }
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    // End:0x92
    if(LPMI == none)
    {
        return;
    }
    GetPlayerViewPoint(CameraLoc, CameraRot);
    // End:0x35E
    if(myLPHUD.ShouldShowGrenadeWarnings() && LPMI.GrenadeActorList.Length > 0)
    {
        fMaxRange = MyBasePlayerPawn.TuneDataBasePlayerPawn.GrenadeWarningVisibleRange * MyBasePlayerPawn.TuneDataBasePlayerPawn.GrenadeWarningVisibleRange;
        // End:0x35D
        foreach LPMI.GrenadeActorList(Grenade, iIndex)
        {
            // End:0x334
            if(((Grenade.bIsGrenade && !Grenade.bIsSimulating) && (((Grenade.Instigator == Pawn) && MyBasePlayerPawn.TuneDataBasePlayerPawn.bShowGrenadeWarningForSelf) || int(Grenade.GetTeamNum()) != int(GetTeamNum())) || MyBasePlayerPawn.TuneDataBasePlayerPawn.bShowGrenadeWarningForTeammates) && VSizeSq(MyBasePlayerPawn.Location - Grenade.Location) < fMaxRange)
            {
                myLPHUD.CreateGrenadeWarning(Grenade);                
            }
            else
            {
                myLPHUD.StopGrenadeWarning(Grenade);
            }            
        }        
    }
    // End:0x540
    if(myLPHUD.ShouldShowTENGPoints() && LPMI.ThermalEnergyPocketActors.Length > 0)
    {
        fMaxRange = MyBasePlayerPawn.TuneDataBasePlayerPawn.TENGPointSearchRange * MyBasePlayerPawn.TuneDataBasePlayerPawn.TENGPointSearchRange;
        // End:0x53F
        foreach LPMI.ThermalEnergyPocketActors(TEP, iIndex)
        {
            // End:0x49D
            if(!TEP.bEnabled)
            {
                myLPHUD.StopTENGPoint(TEP);
                continue;                
            }
            else
            {
                // End:0x516
                if(VSizeSq(MyBasePlayerPawn.Location - TEP.Location) < fMaxRange)
                {
                    myLPHUD.CreateTENGPoint(TEP);                    
                }
                else
                {
                    myLPHUD.StopTENGPoint(TEP);
                }                
            }
        }        
    }
    // End:0x697
    if(myLPHUD.ShouldShowCourierItems() && LPMI.CourierItemList.Length > 0)
    {
        // End:0x696
        foreach LPMI.CourierItemList(ci, iIndex)
        {
            // End:0x66D
            if((!ci.bEnabled || ci.CourierTuneData == none) || !ci.CourierTuneData.bShowUI)
            {
                myLPHUD.StopCourierIcon(ci);                
            }
            else
            {
                myLPHUD.CreateCourierIcon(ci);
            }            
        }        
    }
    // End:0x78D
    if(myLPHUD.ShouldShowSeizeControlObjectives() && LPMI.SeizeControlItemList.Length > 0)
    {
        // End:0x78C
        foreach LPMI.SeizeControlItemList(SCO, iIndex)
        {
            // End:0x763
            if(!SCO.bEnabled)
            {
                myLPHUD.StopSeizeControlPoint(SCO);                
            }
            else
            {
                myLPHUD.CreateSeizeControlPoint(SCO);
            }            
        }        
    }
    // End:0x883
    if(myLPHUD.ShouldShowDisableRepairObjectives() && LPMI.DisableRepairItemList.Length > 0)
    {
        // End:0x882
        foreach LPMI.DisableRepairItemList(DRO, iIndex)
        {
            // End:0x859
            if(!DRO.bEnabled)
            {
                myLPHUD.StopDisableRepairPoint(DRO);                
            }
            else
            {
                myLPHUD.CreateDisableRepairPoint(DRO);
            }            
        }        
    }
    // End:0x9A2
    if(myLPHUD.ShouldShowBombObjectives() && LPMI.BombActorList.Length > 0)
    {
        // End:0x9A1
        foreach LPMI.BombActorList(ba, iIndex)
        {
            // End:0x978
            if(ba.bEnabled && int(ba.DeploymentState) != int(6))
            {
                myLPHUD.CreateBombPoint(ba);                
            }
            else
            {
                myLPHUD.StopBombPoint(ba);
            }            
        }        
    }
    // End:0xA6D
    if(myLPHUD.ShouldShowKillObjectives() && LPMI.KillObjectiveList.Length > 0)
    {
        // End:0xA6C
        foreach LPMI.KillObjectiveList(KO, iIndex)
        {
            // End:0xA6B
            if(KO.PawnToKill != none)
            {
                myLPHUD.CreateKillObjective(KO);
            }            
        }        
    }
    // End:0xB14
    if(myLPHUD.ShouldShowSnowcatObjectives() && LPMI.SnowcatActorList.Length > 0)
    {
        // End:0xB13
        foreach LPMI.SnowcatActorList(SNO, iIndex)
        {
            myLPHUD.CreateSnowcatPoint(SNO);            
        }        
    }
    //return;    
}

event PlayerTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPPlayerController).PlayerTick(DeltaTime);
    UpdateSprint(DeltaTime);
    UpdateForcedCameraRotation(DeltaTime);
    CallUpdateCurrentGrappleHookTarget();
    UpdateAmmoTypeSwitch(DeltaTime);
    // End:0xD4
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        UpdateTutorialMode(DeltaTime);
        Class'LPBreadcrumbManager'.static.GetBreadcrumbManager().Update(self, DeltaTime);        
    }
    else
    {
        UpdateQueuedAnnouncementAkEvents();
    }
    //return;    
}

function UpdateDistanceTraveled()
{
    local /*0x97E50000-0x00000000*/ private int Dist;

    // End:0x8F
    if(Pawn != none)
    {
        Dist = int(VSize(Pawn.Location - LastKnownPawnLocation));
        ModifyStat('Stat_DistanceTraveled', 10 * Dist);
        LastKnownPawnLocation = Pawn.Location;
    }
    //return;    
}

function UpdateTimeSpent()
{
    // End:0x3A
    if(bIsInVitalSuit && LPPlayerTurretPawn(Pawn) == none)
    {
        IncrementStat('Stat_TimeInVS');
    }
    // End:0x8B
    if((Pawn == none) || !LPPawn(Pawn).IsAlive())
    {
        IncrementStat('Stat_TimeSpectating');
    }
    //return;    
}

function CanRestartPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MapInfo, LPGI;

    MapInfo = LPMapInfo_MP(WorldInfo.GetMapInfo());
    // End:0xCE
    if((MapInfo != none) && MapInfo.bDelayPawnSpawningUntilMPGameReady)
    {
        LPGI = LPGameMP_Base(WorldInfo.Game);
        // End:0xCE
        if((LPGI != none) && !LPGI.CanSpawnPlayers())
        {
            return false;
        }
    }
    return super(PlayerController).CanRestartPlayer();
    //return ReturnValue;    
}

function Reset()
{
    ExitVS(true, true, true);
    super(PlayerController).Reset();
    // End:0x86
    if(LPMapInfo_MP(WorldInfo.GetMapInfo()) != none)
    {
        LPMapInfo_MP(WorldInfo.GetMapInfo()).RestartMatch();
    }
    DelayBleedOutUntilTime = 0.0000000;
    //return;    
}

reliable client simulated function ClientReset()
{
    ClientExitedVS(((LPBaseVSPlayerPawn(Pawn) != none) ? LPBaseVSPlayerPawn(Pawn) : none), ((MyPlayerPawn != none) ? MyPlayerPawn : none), ((Pawn != none) ? Pawn.Location : Location), true);
    super(SPPlayerController).ClientReset();
    //return;    
}

function UpdateMapInfoEventTimers()
{
    // End:0xC7
    if(LPMapInfo_MP(WorldInfo.GetMapInfo()) != none)
    {
        // End:0xC7
        if(WorldInfo.GRI != none)
        {
            LPMapInfo_MP(WorldInfo.GetMapInfo()).Update(float(WorldInfo.GRI.ElapsedTime));
        }
    }
    //return;    
}

function GameHasEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL EndGameFocus[9437185];
    local /*0x97E50000-0x00000000*/ private bool bIsWinner[9437185];

    // End:0x46
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x46
        if(bIsInVitalSuit)
        {
            ExitVS(true, true, true);
        }
    }
    SetThermalPost(none);
    // End:0xBF
    if(LPMapInfo_MP(WorldInfo.GetMapInfo()) != none)
    {
        LPMapInfo_MP(WorldInfo.GetMapInfo()).EndMatch();
    }
    // End:0x10B
    if(EndGameFocus == none)
    {
        EndGameFocus = WorldInfo.GRI.Winner;
    }
    // End:0x139
    if(myLPHUD != none)
    {
        myLPHUD.RemoveProceduralMovies();
    }
    super(PlayerController).GameHasEnded(EndGameFocus, bIsWinner);
    //return;    
}

function CleanupPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL DrivenVehicle, Driver;

    SetThermalPost(none);
    // End:0x41
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        super(PlayerController).CleanupPawn();        
    }
    else
    {
        DrivenVehicle = Vehicle(Pawn);
        // End:0x125
        if(DrivenVehicle != none)
        {
            Driver = DrivenVehicle.Driver;
            DrivenVehicle.DriverLeave(true);
            // End:0x122
            if(Driver != none)
            {
                Driver.Health = 0;
                Driver.Died(self, none, Driver.Location);
            }            
        }
        else
        {
            // End:0x1BD
            if(Pawn != none)
            {
                // End:0x14F
                if(bIsInVitalSuit)
                {
                    ExitVS(true, true, true);
                }
                // End:0x1BD
                if(Pawn != none)
                {
                    Pawn.Health = 0;
                    Pawn.Died(self, none, Pawn.Location);
                }
            }
        }
    }
    // End:0x1DE
    if(IsLocalController())
    {
        ClearTimer('CallUpdateGrappleHookTargets');
    }
    //return;    
}

function CleanUpSelf()
{
    super(SPPlayerController).CleanUpSelf();
    FastTravelInfoList.Length = 0;
    CloseTutorialMode();
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL UserMusicPlayer;

    super(PlayerController).Destroyed();
    // End:0x21
    if(IsLocalPlayerController())
    {
        ShutdownWeatherSystem();
    }
    UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
    // End:0xB0
    if((UserMusicPlayer != none) && UserMusicPlayer.__OnNewTrackStart__Delegate != none)
    {
        UserMusicPlayer.__OnNewTrackStart__Delegate = None;
    }
    ClearTimer('CheckForMeleeTakedownTarget');
    // End:0xF2
    if(TVCameraManager != none)
    {
        TVCameraManager.DisableTVCamera();
    }
    // End:0x120
    if(FXActionManagerInstance != none)
    {
        FXActionManagerInstance.ShutDown();
    }
    //return;    
}

static function GetPRI()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPPC;

    LPPC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);
    return LPPRI(LPPC.PlayerReplicationInfo);
    //return ReturnValue;    
}

exec function SetHealth()
{
    local /*0x97E50000-0x00000000*/ private int Health[8388609];

    // End:0x37
    if(MyPlayerPawn != none)
    {
        MyPlayerPawn.Health = Health;
    }
    //return;    
}

exec function AddEnergy()
{
    local /*0x97E50000-0x00000000*/ private float Amount[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoFX[9437185];

    true
    ServerAddEnergy(Amount, bDoFX);
    //return;    
}

reliable server function ServerAddEnergy()
{
    local /*0x97E50000-0x00000000*/ private float Amount[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoFX[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL TE;

    true
    // End:0xA7
    if(MyBasePlayerPawn.InvManager != none)
    {
        // End:0xA6
        foreach MyBasePlayerPawn.InvManager.InventoryActors(Class'LPThermalEnergy', TE)
        {
            TE.AddEnergy(Amount, bDoFX);            
        }        
    }
    //return;    
}

exec function SetVSOutsideLOD()
{
    // End:0x40
    if(LPVSPlayerPawn(Pawn) != none)
    {
        LPVSPlayerPawn(Pawn).SetMeshLodForOutsideCockpit();
    }
    //return;    
}

exec function SetVSInsideLOD()
{
    // End:0x40
    if(LPVSPlayerPawn(Pawn) != none)
    {
        LPVSPlayerPawn(Pawn).SetMeshLodForInsideCockpit();
    }
    //return;    
}

function OnSetDrawPriority()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x71
    if(inAction.InputLinks[0].bHasImpulse)
    {
        Pawn.Mesh.SetViewOwnerDepthPriorityGroup(false, 1);        
    }
    else
    {
        // End:0xE2
        if(inAction.InputLinks[1].bHasImpulse)
        {
            Pawn.Mesh.SetViewOwnerDepthPriorityGroup(true, 1);            
        }
        else
        {
            // End:0x151
            if(inAction.InputLinks[2].bHasImpulse)
            {
                Pawn.Mesh.SetViewOwnerDepthPriorityGroup(true, 2);
            }
        }
    }
    //return;    
}

reliable server function ServerSuicide()
{
    // End:0x1B
    if(bIsInVitalSuit)
    {
        ExitVS(true, true, true);
    }
    super(PlayerController).ServerSuicide();
    //return;    
}

simulated function HasPendingWeapon()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((Pawn != none) && Pawn.InvManager != none) && Pawn.InvManager.PendingWeapon != none;
    //return ReturnValue;    
}

simulated function GetMaxNumberOfDamageGibsForThisController()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x81
    if((MyBasePlayerPawn != none) && MyBasePlayerPawn.TuneDataBasePlayerPawn != none)
    {
        return int(MyBasePlayerPawn.TuneDataBasePlayerPawn.MaxNumberOfDamageGibsForThisPlayer.GetValue());
    }
    return 10;
    //return ReturnValue;    
}

simulated function GetMaxNumberOfDecalsForDamageGibsForThisController()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x81
    if((MyBasePlayerPawn != none) && MyBasePlayerPawn.TuneDataBasePlayerPawn != none)
    {
        return int(MyBasePlayerPawn.TuneDataBasePlayerPawn.MaxNumberOfDecalsForDamageGibsForThisPlayer.GetValue());
    }
    return 10;
    //return ReturnValue;    
}

function OnPlayEmitCameraEffect()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x4C
    if(inAction.CameraLensEffect != none)
    {
        ClientSpawnCameraLensEffect(inAction.CameraLensEffect);
    }
    //return;    
}

function SetCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private int PreferredSaveSlot[9437185], PreviousCheckpointSlot, LastCheckpointSlot, Slot;
    local /*0x97E50000-0x00000000*/ private @NULL Engine, PersistentGameDataStore;

    -1
    Engine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    PersistentGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    LastCheckpointSlot = ProfileSettings.GetLastCheckpointSlot();
    PreviousCheckpointSlot = ProfileSettings.GetPreviousCheckpointSlot();
    Slot = 0;
    // End:0x201
    if(PreferredSaveSlot == -1)
    {
        // End:0x169
        if((LastCheckpointSlot == -1) || LastCheckpointSlot == 1)
        {
            // End:0x15B
            if(PersistentGameDataStore.bNextCheckpointSaveOverLast)
            {
                Slot = 1;
                LastCheckpointSlot = 0;                
            }
            else
            {
                Slot = 0;
            }            
        }
        else
        {
            // End:0x1C1
            if(LastCheckpointSlot == 0)
            {
                // End:0x1B3
                if(PersistentGameDataStore.bNextCheckpointSaveOverLast)
                {
                    Slot = 0;
                    LastCheckpointSlot = 1;                    
                }
                else
                {
                    Slot = 1;
                }                
            }
            else
            {
                // End:0x1F3
                if((PreviousCheckpointSlot == -1) || PreviousCheckpointSlot == 1)
                {
                    Slot = 0;                    
                }
                else
                {
                    Slot = 1;
                }
            }
        }        
    }
    else
    {
        Slot = PreferredSaveSlot;
    }
    PersistentGameDataStore.bNextCheckpointSaveOverLast = false;
    // End:0x24F
    if(Slot < 0)
    {
        Slot = 0;
    }
    ProfileSettings.SetPreviousCheckpointSlot(LastCheckpointSlot);
    ProfileSettings.SetLastCheckpointSlot(Slot);
    ProfileSettings.SetLastCheckpointFilename(Engine.PendingCheckpointFilename);
    Engine.PendingCheckpointSlot = Slot;
    Engine.PendingCheckpointDirectoryName = "SaveSlot" $ string(Slot);
    GetCheckpointDisplayName(Engine.PendingCheckpointDisplayName, Engine.PendingCheckpointDisplayName, Engine.PendingCheckpointDisplayNameMarkup);
    //return;    
}

function GetCheckpointDisplayName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string PendingDisplayName[8388609], DisplayName, DisplayMarkup;
    local /*0x97E50000-0x00000000*/ private int MapIndex;
    local /*0x97E50000-0x00000000*/ private @NULL MyMapInfo, ZoneInfo, LPBM, CurrentObjective;
    local /*0x97E50000-0x00000000*/ private editfixedsize string MapDisplayName, ObjectiveDisplayName, CheckpointDisplayName;
    local /*0x97E50000-0x00000000*/ private @NULL LP;

    // End:0x25D
    if(PendingDisplayName == "")
    {
        MapIndex = JobLogInfo.MapRecord.LocalMapDisplayIndex;
        MyMapInfo = LPMapInfo(WorldInfo.GetMapInfo());
        // End:0x102
        if(MyMapInfo != none)
        {
            // End:0x102
            if(GetMapZoneInfoFromName(MyMapInfo.ContractsMapDisplayEntries[MapIndex].MapZoneName, ZoneInfo))
            {
                MapDisplayName = ZoneInfo.LocalMapDisplayName;
            }
        }
        LPBM = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager();
        // End:0x19B
        if(LPBM != none)
        {
            CurrentObjective = LPBM.GetObjectiveToTrack();
            // End:0x19B
            if(CurrentObjective != none)
            {
                ObjectiveDisplayName = CurrentObjective.GetDescriptionMarkup();
            }
        }
        // End:0x1EB
        if((Len(MapDisplayName) == 0) && Len(ObjectiveDisplayName) == 0)
        {
            CheckpointDisplayName = Class'SPEngine.SPCheckpoint'.static.GetDefaultCheckpointDisplayName();            
        }
        else
        {
            CheckpointDisplayName = MapDisplayName;
            // End:0x23C
            if((Len(MapDisplayName) > 0) && Len(ObjectiveDisplayName) > 0)
            {
                CheckpointDisplayName = CheckpointDisplayName $ " - ";
            }
            CheckpointDisplayName = CheckpointDisplayName $ ObjectiveDisplayName;
        }        
    }
    else
    {
        CheckpointDisplayName = PendingDisplayName;
    }
    DisplayMarkup = CheckpointDisplayName;
    CheckpointDisplayName = (CheckpointDisplayName $ " - ") @ Class'SPEngine.SPUtil'.static.RegionalTimeStamp();
    LP = LocalPlayer(Player);
    // End:0x33A
    if(LP != none)
    {
        CheckpointDisplayName = Class'GFxUI.GFxObject'.static.TranslateString(CheckpointDisplayName, LP.GetTranslationContext());
    }
    DisplayName = CheckpointDisplayName;
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825], GameDataStore, TpostGameDataStore, LPPawnToSave;

    LPPCCreateCheckpointRecord(Record.LPPCRecord);
    GameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPDataStorePersistentGameData'.default.Tag));
    // End:0xC4
    if(GameDataStore != none)
    {
        Record.LevelTransitionData = GameDataStore.LevelTransitionData;
    }
    TpostGameDataStore = LPDataStoreTpost(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPDataStoreTpost'.default.Tag));
    // End:0x1A6
    if((TpostGameDataStore != none) && TpostGameDataStore.GetGFNamesCount() > 0)
    {
        Record.GameflowTPocketBools.Length = 0;
        Record.GameflowTPocketBools = TpostGameDataStore.GetGFVars();
    }
    Record.OverriddenVSSpeed = OverriddenVSSpeed;
    Record.bIsVitalSuitExitLockedByKismet = bIsVitalSuitExitLockedByKismet;
    Record.bIsVitalSuitEntryLockedByKismet = bIsVitalSuitEntryLockedByKismet;
    Record.bDoesVitalSuitZiplineOverrideEnterLocking = bDoesVitalSuitZiplineOverrideEnterLocking;
    Record.bDoesVitalSuitZiplineOverrideExitLocking = bDoesVitalSuitZiplineOverrideExitLocking;
    // End:0x298
    if(bIsInVitalSuit)
    {
        LPPawnToSave = LPPlayerPawn(HumanPlayerPawn);        
    }
    else
    {
        LPPawnToSave = LPPlayerPawn(Pawn);
    }
    // End:0x2FE
    if(LPPawnToSave != none)
    {
        Record.HumanPlayerSnowMinimum = LPPawnToSave.SnowMinimum;
    }
    //return;    
}

function LPPCCreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825];
    local /*0x97E50000-0x00000000*/ private bool bPreventSavedClassesAndAssetsFromGC[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array SavedClassesRefsToPreventFromGC[26214401], SavedObjectRefsToPreventFromGC;
    local /*0x97E50000-0x00000000*/ private @NULL PawnToSave, LPPawnToSave, PRI, SelectedJobLogObjective, LastActivatedObjective;

    false        
    PRI = LPPRI(PlayerReplicationInfo);
    SPPlayerControllerCreateCheckpointRecord(Record.SPPCRecord);
    Record.bIsInVitalSuit = bIsInVitalSuit;
    // End:0x94
    if(bIsInVitalSuit)
    {
        PawnToSave = HumanPlayerPawn;        
    }
    else
    {
        PawnToSave = Pawn;
    }
    Class'LPPawn'.static.LPCreatePawnCheckpointRecord(false, Record.HumanPawn, PawnToSave, self, bPreventSavedClassesAndAssetsFromGC, SavedClassesRefsToPreventFromGC, SavedObjectRefsToPreventFromGC);
    // End:0x193
    if(PawnToSave != none)
    {
        LPPawnToSave = LPPlayerPawn(PawnToSave);
        // End:0x193
        if(LPPawnToSave != none)
        {
            Record.HumanPawnMeshTranslation = LPPawnToSave.default.Mesh.Translation;
        }
    }
    Record.StoredPlayerWeaponInfo = StoredWeaponsList;
    Record.StoredPlayerAmmoInfo = StoredAmmoList;
    Record.JobLogRecord = JobLogInfo;
    Record.VisitedMapZoneNames = VisitedMapZoneNames;
    Record.bCanUseFullMunitionsLocker = bVSHasFullMunitionsLocker;
    Record.TEnergyAmount = PRI.TEnergyAmount;
    Record.ScrapAmountPlayer = float(PRI.ScrapAmountPlayer);
    Record.WhiteLeechDNAAmount = PRI.WhiteLeechDNAAmount;
    Record.DisableVSGameMusicPlaybackCount = DisableVSGameMusicPlaybackCount;
    Record.DisableVSUserMusicPlaybackCount = DisableVSUserMusicPlaybackCount;
    Record.AutoResumeMusicPlayerOnDisableCount = AutoResumeMusicPlayerOnDisableCount;
    Record.bVSGameMusicPlayingOnDisable = bVSGameMusicPlayingOnDisable;
    Record.bVSUserMusicPlayingOnDisable = bVSUserMusicPlayingOnDisable;
    Record.bVSMusicPlayerPausedbyPlayer = bVSMusicPlayerPausedbyPlayer;
    SelectedJobLogObjective = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager().SelectedJobLogObjective;
    // End:0x46D
    if(SelectedJobLogObjective != none)
    {
        Record.SelectedJobLogObjective = PathName(SelectedJobLogObjective);
    }
    LastActivatedObjective = Class'LPBreadcrumbManager'.static.GetBreadcrumbManager().LastActivatedObjective;
    // End:0x4EA
    if(LastActivatedObjective != none)
    {
        Record.LastActivatedObjective = PathName(LastActivatedObjective);
    }
    // End:0x55C
    if((PRI != none) && PRI.PerksManager != none)
    {
        PRI.PerksManager.CreateCheckpointRecord(Record);
    }
    // End:0x5CE
    if((PRI != none) && PRI.AchievementManager != none)
    {
        PRI.AchievementManager.CreateCheckpointRecord(Record);
    }
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25296897];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore, TpostGameDataStore, PP;

    GameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPDataStorePersistentGameData'.default.Tag));
    // End:0x9B
    if(GameDataStore != none)
    {
        GameDataStore.LevelTransitionData = Record.LevelTransitionData;
    }
    LPPCApplyCheckpointRecord(Record.LPPCRecord);
    // End:0x23A
    if(Record.GameflowTPocketBools.Length > 0)
    {
        TpostGameDataStore = LPDataStoreTpost(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPDataStoreTpost'.default.Tag));
        // End:0x23A
        if(TpostGameDataStore != none)
        {
            TpostGameDataStore.ClearGameflow();
            I = 0;
            J0x16F:

            // End:0x23A [Loop If]
            if(I < Record.GameflowTPocketBools.Length)
            {
                TpostGameDataStore.SetGFValueFromString(Record.GameflowTPocketBools[I].VarName, Record.GameflowTPocketBools[I].VarValue);
                ++I;
                // [Loop Continue]
                goto J0x16F;
            }
        }
    }
    OverriddenVSSpeed = Record.OverriddenVSSpeed;
    bIsVitalSuitExitLockedByKismet = Record.bIsVitalSuitExitLockedByKismet;
    bIsVitalSuitEntryLockedByKismet = Record.bIsVitalSuitEntryLockedByKismet;
    bDoesVitalSuitZiplineOverrideEnterLocking = Record.bDoesVitalSuitZiplineOverrideEnterLocking;
    bDoesVitalSuitZiplineOverrideExitLocking = Record.bDoesVitalSuitZiplineOverrideExitLocking;
    PP = LPPlayerPawn(Pawn);
    // End:0x402
    if(PP != none)
    {
        PP.SetHealth(PP.HealthMax);
        PP.ServerReplenishAmmoFromMunitionsLocker(self, true, true);
        PP.SnowMinimum = Record.HumanPlayerSnowMinimum;
        PP.SnowPercent = PP.SnowMinimum;
    }
    //return;    
}

function LPPCApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25296897];
    local /*0x97E50000-0x00000000*/ private bool bApplyToExistingPawnOnly[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL PRI, SelectedJobLogObjective, LastActivatedObjective;
    local /*0x97E50000-0x00000000*/ private int MapZoneIndex;

    false
    SPPlayerControllerApplyCheckpointRecord(Record.SPPCRecord, Record.HumanPawn.SPPawnRecord, bApplyToExistingPawnOnly);
    Class'LPPawn'.static.LPApplyPawnCheckpointRecord(true, Record.HumanPawn, Pawn);
    PRI = LPPRI(PlayerReplicationInfo);
    // End:0x16B
    if(Record.SelectedJobLogObjective != "")
    {
        SelectedJobLogObjective = SPQuestObject_Base(FindObject(Record.SelectedJobLogObjective, Class'SPEngine.SPQuestObject_Base'));
        Class'LPBreadcrumbManager'.static.GetBreadcrumbManager().SetSelectedJobLogObjective(SelectedJobLogObjective);
    }
    // End:0x210
    if(Record.LastActivatedObjective != "")
    {
        LastActivatedObjective = SPQuestObject_Base(FindObject(Record.LastActivatedObjective, Class'SPEngine.SPQuestObject_Base'));
        Class'LPBreadcrumbManager'.static.GetBreadcrumbManager().NewQuestObjectiveActivated(LastActivatedObjective, self, false);
    }
    DisableVSGameMusicPlaybackCount = Record.DisableVSGameMusicPlaybackCount;
    DisableVSUserMusicPlaybackCount = Record.DisableVSUserMusicPlaybackCount;
    AutoResumeMusicPlayerOnDisableCount = Record.AutoResumeMusicPlayerOnDisableCount;
    bVSGameMusicPlayingOnDisable = Record.bVSGameMusicPlayingOnDisable;
    bVSUserMusicPlayingOnDisable = Record.bVSUserMusicPlayingOnDisable;
    bVSMusicPlayerPausedbyPlayer = Record.bVSMusicPlayerPausedbyPlayer;
    PRI.ScrapAmountPlayer = int(Record.ScrapAmountPlayer);
    PRI.WhiteLeechDNAAmount = Record.WhiteLeechDNAAmount;
    PRI.TEnergyAmount = Record.TEnergyAmount;
    MyPlayerPawn.TEnergyLevel = MyPlayerPawn.GetEnergyCount() / MyPlayerPawn.GetMaxTEnergyCapacity();
    StoredWeaponsList = Record.StoredPlayerWeaponInfo;
    StoredAmmoList = Record.StoredPlayerAmmoInfo;
    JobLogInfo = Record.JobLogRecord;
    VisitedMapZoneNames = Record.VisitedMapZoneNames;
    MapZoneIndex = GetCurrentMapDisplayIndexFromMapZoneName(JobLogInfo.MapRecord.MapZoneNameID);
    // End:0x564
    if(MapZoneIndex == -1)
    {
        JobLogInfo.MapRecord.LocalMapDisplayIndex = 0;
        JobLogInfo.MapRecord.MapZoneNameID = 'None';
    }
    SetCurrentMapDisplayIndex(JobLogInfo.MapRecord.LocalMapDisplayIndex, JobLogInfo.MapRecord.MapZoneNameID);
    bVSHasFullMunitionsLocker = Record.bCanUseFullMunitionsLocker;
    bIsInVitalSuit = Record.bIsInVitalSuit;
    // End:0x68E
    if((PRI != none) && PRI.PerksManager != none)
    {
        PRI.PerksManager.ApplyCheckpointRecord(Record);
    }
    // End:0x700
    if((PRI != none) && PRI.AchievementManager != none)
    {
        PRI.AchievementManager.ApplyCheckpointRecord(Record);
    }
    //return;    
}

reliable client simulated function ClientCheckpointReset()
{
    super(SPPlayerController).ClientCheckpointReset();
    // End:0x2F
    if(bIsInVitalSuit)
    {
        bIsInVitalSuit = false;
        EnterVS(true);
    }
    SetTimer(3.0000000, false, 'CheckLPFTV');
    //return;    
}

function CheckLPFTV()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPFTV;

    // End:0x4B
    if(Pawn != none)
    {
        // End:0x4A
        foreach Pawn.TouchingActors(Class'LPFastTravelVolume', LPFTV)
        {
            ShowFastTravelOptionMessage();
            // End:0x4A
            break;            
        }        
    }
    //return;    
}

function StreamMasterLevelTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Volume[8388609];

    // End:0x0F
    if(PlayerIsDoingVSTransition())
    {
        return;
    }
    super(SPPlayerController).StreamMasterLevelTouch(Volume);
    //return;    
}

function StreamMasterLevelUnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Volume[8388609];

    // End:0x0F
    if(PlayerIsDoingVSTransition())
    {
        return;
    }
    super(SPPlayerController).StreamMasterLevelUnTouch(Volume);
    //return;    
}

event PreCommitMapChange()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExtraParams[9437185], vsPawn;

    // End:0x48
    if(ExtraParams.bReCreatePlayerPawn)
    {
        SaveLevelTransitionData(ExtraParams.bReCreatePlayerPawn);
    }
    // End:0xB0
    if(bIsInVitalSuit && ExtraParams.bReCreatePlayerPawn)
    {
        vsPawn = Pawn;
        ExitVS(true, true, true, true);
        vsPawn.Destroy();
    }
    super(SPPlayerController).PreCommitMapChange(ExtraParams);
    //return;    
}

event CommitMapChangeCleanup()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExtraParams[9437185];

    super(SPPlayerController).CommitMapChangeCleanup(ExtraParams);
    MainPlayerInput.ResetInput();
    // End:0x69
    if(ExtraParams.bReCreatePlayerPawn)
    {
        HumanPlayerPawn = none;
        ExitVSPawn = none;
    }
    //return;    
}

event PostCommitMapChange()
{
    local /*0x97E50000-0x00000000*/ private @NULL ExtraParams[9437185], FadeColor, SavedPlayerLoc, vsPawn;
    local /*0x97E50000-0x00000000*/ private float Dist, ClosestDist, TaggedClosestDist;
    local /*0x97E50000-0x00000000*/ private @NULL PersistentGameDataStore, PS, PlayerStartToStart, TaggedPlayerStart, ClosestPlayerStart;

    PersistentGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x8EA
    if(ExtraParams.bReCreatePlayerPawn && PersistentGameDataStore != none)
    {
        // End:0x1E5
        if(ExtraParams.bReCreatePlayerHUD)
        {
            // End:0x1E5
            if(WorldInfo.Game != none)
            {
                ClientSetHUD(WorldInfo.Game.HUDType);
                // End:0x1E2
                if(ExtraParams.bFadeInAfterCommit)
                {
                    FadeColor.R = 0;
                    FadeColor.G = 0;
                    FadeColor.B = 0;
                    FadeColor.A = 255;
                    // End:0x1AF
                    if(mySPHUD == none)
                    {
                    }
                    ClientColorFade(FadeColor, 255, 0, ExtraParams.FadeInTime);
                }                
            }
        }
        // End:0x2B7
        if(PersistentGameDataStore.LevelTransitionData.PCRecord.bIsInVitalSuit)
        {
            SavedPlayerLoc = PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Location;            
        }
        else
        {
            SavedPlayerLoc = PersistentGameDataStore.LevelTransitionData.PCRecord.HumanPawn.SPPawnRecord.Location;
        }
        ClosestDist = 1000000000000000000.0000000;
        TaggedClosestDist = 1000000000000000000.0000000;
        // End:0x4EB
        foreach WorldInfo.AllNavigationPoints(Class'SPEngine.SPPlayerStart', PS)
        {
            // End:0x4AD
            if((ExtraParams.CommitPendingMapChangePlayerStartTagName != 'None') && (PS.Tag == ExtraParams.CommitPendingMapChangePlayerStartTagName) || PS.PlayerStartName == ExtraParams.CommitPendingMapChangePlayerStartTagName)
            {
                Dist = VSize(PS.Location - SavedPlayerLoc);
                // End:0x4AD
                if(Dist < TaggedClosestDist)
                {
                    // End:0x487
                    if(TaggedPlayerStart != none)
                    {                        
                    }
                    TaggedPlayerStart = PS;
                    TaggedClosestDist = Dist;
                }
            }
            // End:0x4EA
            if(Dist < ClosestDist)
            {
                ClosestPlayerStart = PS;
                ClosestDist = Dist;
            }            
        }        
        // End:0x511
        if(TaggedPlayerStart != none)
        {
            PlayerStartToStart = TaggedPlayerStart;            
        }
        else
        {
            // End:0x53B
            if(ExtraParams.CommitPendingMapChangePlayerStartTagName != 'None')
            {
            }
            PlayerStartToStart = ClosestPlayerStart;
        }
        // End:0x84C
        if(PlayerStartToStart != none)
        {
            PersistentGameDataStore.LevelTransitionData.PCRecord.HumanPawn.SPPawnRecord.Location = PlayerStartToStart.Location;
            PersistentGameDataStore.LevelTransitionData.PCRecord.HumanPawn.SPPawnRecord.Rotation = PlayerStartToStart.Rotation;
            // End:0x839
            if(PersistentGameDataStore.LevelTransitionData.PCRecord.bIsInVitalSuit && PersistentGameDataStore.LevelTransitionData.PersistentVS.bSaved)
            {
                PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Location = PlayerStartToStart.Location;
                PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Rotation = PlayerStartToStart.Rotation;
            }
            CheckpointPlayerStart = PlayerStartToStart;
        }
        RestoreLevelTransitionData();
        ExtraParams.bReCreatePlayerPawn = false;
        ExtraParams.bReCreatePlayerHUD = false;
        ExtraParams.CommitPendingMapChangePlayerStartTagName = 'None';
        super(SPPlayerController).PostCommitMapChange(ExtraParams);
        CheckpointPlayerStart = none;
        GotoState('PlayerWalking');        
    }
    else
    {
        super(SPPlayerController).PostCommitMapChange(ExtraParams);
        // End:0xB4F
        if(bIsInVitalSuit && PersistentGameDataStore != none)
        {
            vsPawn = LPVSPlayerPawn(Pawn);
            // End:0xB4F
            if((vsPawn != none) && vsPawn.bIsPersistent)
            {
                // End:0xB4F
                if(PersistentGameDataStore.LevelTransitionData.PersistentVS.bSaved)
                {
                    PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Location = Pawn.Location;
                    PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Rotation = Pawn.Rotation;
                    PersistentGameDataStore.LevelTransitionData.PersistentVS.MapName = Class'SPEngine.SPUtil'.static.GetCurrentMapName();
                }
            }
        }
    }
    MarkCurrentMapVisited();
    //return;    
}

simulated function OnUpdateAchievement()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], PRI, LPPS;

    // End:0x0F
    if(IsInPrivateSession())
    {
        return;
    }
    // End:0xA6
    if(inAction.bCheckMinDifficulty)
    {
        LPPS = LPProfileSettings(ProfileSettings);
        // End:0xA6
        if((LPPS == none) || int(LPPS.GetSPGameMinDifficulty()) < int(inAction.LowestMinDifficultyToAllow))
        {
            return;
        }
    }
    // End:0x10E
    if(inAction.AchievementName == 'Campaign_Complete')
    {
        LPPS = LPProfileSettings(ProfileSettings);
        LPPS.SetCompletedCampaign(true);
    }
    PRI = LPPRI(PlayerReplicationInfo);
    // End:0x1A9
    if(PRI != none)
    {
        PRI.AchievementManager.IncrementAchievementValue(inAction.AchievementName, inAction.IncrementAmount);
    }
    //return;    
}

simulated function UpdateSPGameMinDifficulty()
{
    local /*0x97E50000-0x00000000*/ private bool bNewGame[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;

    false
    // End:0x83
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        LPPS = LPProfileSettings(ProfileSettings);
        // End:0x83
        if(LPPS != none)
        {
            return LPPS.UpdateSPGameMinDifficulty(bNewGame);
        }
    }
    return false;
    //return ReturnValue;    
}

function CheckForMasterHunstmanAchievement()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    PRI = LPPRI(PlayerReplicationInfo);
    // End:0xDC
    if(PRI != none)
    {
        // End:0xDC
        if((GetMyPlayerPawn().PerkEnabled(17) && GetMyPlayerPawn().PerkEnabled(0)) && GetMyPlayerPawn().PerkEnabled(2))
        {
            PRI.AchievementManager.SetAchievementValue('Master_Huntsman', 1);
        }
    }
    //return;    
}

function SaveLevelTransitionData()
{
    local /*0x97E50000-0x00000000*/ private bool bSaveAssetsFromGC[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, VSPawnToSave, VSPawnFound, PersistentGameDataStore;

    false
    PersistentGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x501
    if(PersistentGameDataStore != none)
    {
        LPPCCreateCheckpointRecord(PersistentGameDataStore.LevelTransitionData.PCRecord, bSaveAssetsFromGC, CommitMapChangeSavedClassesRefsToPreventFromGC, CommitMapChangeSavedObjectRefsToPreventFromGC);
        PersistentGameDataStore.LevelTransitionData.PCRecord.HumanPawn.SPPawnRecord.CSARecord.KismetCSAName = "";
        PersistentGameDataStore.LevelTransitionData.PCRecord.DisableVSGameMusicPlaybackCount = 0;
        PersistentGameDataStore.LevelTransitionData.PCRecord.DisableVSUserMusicPlaybackCount = 0;
        PersistentGameDataStore.LevelTransitionData.PCRecord.AutoResumeMusicPlayerOnDisableCount = 0;
        PersistentGameDataStore.LevelTransitionData.PCRecord.bVSGameMusicPlayingOnDisable = false;
        PersistentGameDataStore.LevelTransitionData.PCRecord.bVSUserMusicPlayingOnDisable = false;
        vsPawn = LPVSPlayerPawn(Pawn);
        // End:0x357
        if((bIsInVitalSuit && vsPawn != none) && vsPawn.bIsPersistent)
        {
            VSPawnToSave = vsPawn;
            PersistentGameDataStore.LevelTransitionData.PCRecord.bIsInVitalSuit = true;            
        }
        else
        {
            PersistentGameDataStore.LevelTransitionData.PCRecord.bIsInVitalSuit = false;
            // End:0x3BC
            if(bIsInVitalSuit && vsPawn != none)
            {
            }
        }
        // End:0x479
        if(VSPawnToSave == none)
        {
            // End:0x478
            foreach DynamicActors(Class'LPVSPlayerPawn', VSPawnFound)
            {
                // End:0x477
                if((!VSPawnFound.bDeleteMe && !VSPawnFound.IsPendingKill()) && VSPawnFound.bIsPersistent)
                {
                    // End:0x477
                    if(VSPawnToSave == none)
                    {
                        VSPawnToSave = VSPawnFound;
                        // End:0x477
                        continue;
                    }
                }                
            }            
        }
        // End:0x501
        if(VSPawnToSave != none)
        {
            PersistentGameDataStore.SavePersistentVS(VSPawnToSave, bSaveAssetsFromGC, CommitMapChangeSavedClassesRefsToPreventFromGC, CommitMapChangeSavedObjectRefsToPreventFromGC);
            // End:0x501
            if(bSaveAssetsFromGC)
            {
                SavedPersistentVSPawnRefToPreventFromGC = VSPawnToSave.Class;
            }
        }
    }
    //return;    
}

function RestoreLevelTransitionData()
{
    local /*0x97E50000-0x00000000*/ private bool bApplyToExistingPawnOnly[9437185], bFindSpotForVS, bDidSeekFreeLoading, bFindSpotForHumanPlayer;
    local /*0x97E50000-0x00000000*/ private @NULL AdjustedLoc;
    local /*0x97E50000-0x00000000*/ private class LoadedClass;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PawnClassName;
    local /*0x97E50000-0x00000000*/ private @NULL HumanPawn, vsPawn, PersistentGameDataStore;

    false
    PersistentGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    HumanPawn = LPPlayerPawn(Pawn);
    // End:0x67A
    if(PersistentGameDataStore != none)
    {
        LPPCApplyCheckpointRecord(PersistentGameDataStore.LevelTransitionData.PCRecord, bApplyToExistingPawnOnly);
        // End:0x50C
        if(PersistentGameDataStore.LevelTransitionData.PersistentVS.bSaved)
        {
            // End:0x32A
            if(bIsInVitalSuit)
            {
                PawnClassName = PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.PawnClassName;
                // End:0x219
                if(PawnClassName != "")
                {
                    LoadedClass = class<Class>(FindObject(PawnClassName, Class'Core.Class'));
                    // End:0x219
                    if(LoadedClass == none)
                    {
                        LoadedClass = StreamInClass(PawnClassName);
                        bDidSeekFreeLoading = true;
                    }
                }
                // End:0x25D
                if(Pawn != none)
                {
                    Pawn.SetPhysics(0);
                    Pawn.SetCollision(false, false);
                }
                vsPawn = PersistentGameDataStore.RestorePersistentVS(none);
                // End:0x2E6
                if(vsPawn != none)
                {
                    bFindSpotForVS = true;
                    bIsInVitalSuit = false;
                    EnterVS(true, vsPawn);
                    vsPawn.bKillDuringLevelTransition = true;                    
                }
                else
                {
                    bFindSpotForHumanPlayer = true;
                    Pawn.SetPhysics(1);
                    Pawn.SetCollision(true, true);
                }                
            }
            else
            {
                bFindSpotForHumanPlayer = true;
                // End:0x509
                if(PersistentGameDataStore.LevelTransitionData.PersistentVS.MapName == Class'SPEngine.SPUtil'.static.GetCurrentMapName())
                {
                    PawnClassName = PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.PawnClassName;
                    // End:0x49D
                    if(PawnClassName != "")
                    {
                        LoadedClass = class<Class>(FindObject(PawnClassName, Class'Core.Class'));
                        // End:0x49D
                        if(LoadedClass == none)
                        {
                            LoadedClass = StreamInClass(PawnClassName);
                            bDidSeekFreeLoading = true;
                        }
                    }
                    vsPawn = PersistentGameDataStore.RestorePersistentVS(none);
                    // End:0x506
                    if(vsPawn != none)
                    {
                        bFindSpotForVS = true;
                        vsPawn.bKillDuringLevelTransition = true;                        
                    }                    
                }
            }            
        }
        else
        {
            bFindSpotForHumanPlayer = true;
        }
        // End:0x5C9
        if(bFindSpotForHumanPlayer && HumanPawn != none)
        {
            AdjustedLoc = HumanPawn.Location;
            // End:0x5C9
            if(HumanPawn.FindSpot(HumanPawn.GetCollisionExtent(), AdjustedLoc))
            {
                HumanPawn.SetLocation(AdjustedLoc);
            }
        }
        // End:0x67A
        if(bFindSpotForVS && vsPawn != none)
        {
            AdjustedLoc = vsPawn.Location;
            // End:0x67A
            if(vsPawn.FindSpot(vsPawn.GetCollisionExtent(), AdjustedLoc))
            {
                vsPawn.SetLocation(AdjustedLoc);
            }
        }
    }
    ResetPreventFromGCVars();
    // End:0x6B2
    if(bDidSeekFreeLoading)
    {
        SeekFreeLoader.SetPackageName("");
    }
    //return;    
}

event AttemptToLoadAsset()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InClassName[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string RealClassNameToStream;
    local /*0x97E50000-0x00000000*/ private editfixedsize array DelimitedPathNames;
    local /*0x97E50000-0x00000000*/ private class Result;

    Result = none;
    ParseStringIntoArray(InClassName, DelimitedPathNames, ".", true);
    // End:0xB8
    if(DelimitedPathNames.Length > 0)
    {
        RealClassNameToStream = DelimitedPathNames[DelimitedPathNames.Length - 1];
        // End:0xB8
        if(RealClassNameToStream != "")
        {
            // End:0xB8
            if(RealClassNameToStream ~= "LPPersistentVSPlayerPawnContent")
            {
                Result = StreamInClass(InClassName);
            }
        }
    }
    return Result;
    //return ReturnValue;    
}

function StreamInClass()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InClassName[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize string RealClassNameToStream;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ClassNamesToLoad, DelimitedPathNames;
    local /*0x97E50000-0x00000000*/ private class Result;

    Result = none;
    ParseStringIntoArray(InClassName, DelimitedPathNames, ".", true);
    // End:0x170
    if(DelimitedPathNames.Length > 0)
    {
        RealClassNameToStream = DelimitedPathNames[DelimitedPathNames.Length - 1];
        // End:0x170
        if(RealClassNameToStream != "")
        {
            // End:0xB5
            if(RealClassNameToStream ~= "LPPersistentVSPlayerPawnContent")
            {
                RealClassNameToStream = "LPPersistentVS";
            }
            SeekFreeLoader.SetPackageName(RealClassNameToStream);
            ClassNamesToLoad.AddItem(InClassName);            
            SeekFreeLoader.LoadClassesFromPackage(ClassNamesToLoad, true, true, false, false, false);
            // End:0x170
            if(SeekFreeLoader.LoadedClasses.Length > 0)
            {
                Result = SeekFreeLoader.LoadedClasses[0];
            }
        }
    }
    return Result;
    //return ReturnValue;    
}

function ResetPreventFromGCVars()
{
    SavedPersistentVSPawnRefToPreventFromGC = none;
    CommitMapChangeSavedClassesRefsToPreventFromGC.Length = 0;
    CommitMapChangeSavedObjectRefsToPreventFromGC.Length = 0;
    //return;    
}

event SavePlayerDataOnMapChange()
{
    SaveLevelTransitionData();
    //return;    
}

function LoadPlayerDataOnMapChange()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string URLString;
    local /*0x97E50000-0x00000000*/ private @NULL SPPS, FoundSPPS;
    local /*0x97E50000-0x00000000*/ private name VSPlayerStartName;
    local /*0x97E50000-0x00000000*/ private @NULL PersistentGameDataStore;

    PersistentGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0xA6E
    if(PersistentGameDataStore != none)
    {
        // End:0xA59
        if(Pawn != none)
        {
            PersistentGameDataStore.LevelTransitionData.PCRecord.HumanPawn.SPPawnRecord.Location = Pawn.Location;
            PersistentGameDataStore.LevelTransitionData.PCRecord.HumanPawn.SPPawnRecord.Rotation = Pawn.Rotation;
            // End:0xA59
            if(PersistentGameDataStore.LevelTransitionData.PersistentVS.bSaved)
            {
                URLString = Class'Engine.WorldInfo'.static.GetWorldInfo().GetLocalURL();
                URLString = Mid(URLString, InStr(URLString, "?"));
                // End:0x2AF
                if(Class'Engine.GameInfo'.static.HasOption(URLString, "ForcePOF"))
                {
                    PersistentGameDataStore.LevelTransitionData.PCRecord.bIsInVitalSuit = false;                    
                }
                else
                {
                    // End:0x3DF
                    if(Class'Engine.GameInfo'.static.HasOption(URLString, "ForceInVS"))
                    {
                        PersistentGameDataStore.LevelTransitionData.PCRecord.bIsInVitalSuit = true;
                        PersistentGameDataStore.LevelTransitionData.PersistentVS.MapName = Class'SPEngine.SPUtil'.static.GetCurrentMapName();
                        PersistentGameDataStore.LevelTransitionData.PersistentVS.SubLevel = 'None';
                    }
                }
                VSPlayerStartName = name(Class'Engine.GameInfo'.static.ParseOption(URLString, "ForceVSInPlayerStart"));
                // End:0x8D9
                if(VSPlayerStartName != 'None')
                {
                    // End:0x4B7
                    foreach WorldInfo.AllNavigationPoints(Class'SPEngine.SPPlayerStart', SPPS)
                    {
                        // End:0x4B6
                        if(SPPS.PlayerStartName == VSPlayerStartName)
                        {
                            FoundSPPS = SPPS;
                            // End:0x4B7
                            break;
                        }                        
                    }                    
                    PersistentGameDataStore.LevelTransitionData.PersistentVS.MapName = Class'SPEngine.SPUtil'.static.GetCurrentMapName();
                    PersistentGameDataStore.LevelTransitionData.PersistentVS.SubLevel = 'None';
                    // End:0x79E
                    if(FoundSPPS != none)
                    {
                        PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Location = FoundSPPS.Location;
                        PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Location.Z -= PersistentGameDataStore.LevelTransitionData.PersistentVS.MeshTranslation.Z;
                        PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Rotation = FoundSPPS.Rotation;                        
                    }
                    else
                    {
                        PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Location = Pawn.Location;
                        PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Rotation = Pawn.Rotation;
                    }                    
                }
                else
                {
                    // End:0xA59
                    if(PersistentGameDataStore.LevelTransitionData.PCRecord.bIsInVitalSuit)
                    {
                        PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Location = Pawn.Location;
                        PersistentGameDataStore.LevelTransitionData.PersistentVS.VSPawnRecord.LPPawnRecord.SPPawnRecord.Rotation = Pawn.Rotation;
                    }
                }
            }
        }
        RestoreLevelTransitionData(true);
        MarkCurrentMapVisited();
    }
    //return;    
}

event PreClientTravel()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string PendingURL[8388609];
    local /*0x97E50000-0x00000000*/ private byte TravelType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsSeamlessTravel[8388609], bShouldCleanUp;
    local /*0x97E50000-0x00000000*/ private @NULL MPGame, MPGRI;
    local /*0x97E50000-0x00000000*/ private editfixedsize string currentMap, GameType, Remainder;
    local /*0x97E50000-0x00000000*/ private int iIndex;
    local /*0x97E50000-0x00000000*/ private byte egameType;
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    PRI = LPPRI(PlayerReplicationInfo);
    // End:0x4A
    if(OnlineSub != none)
    {
        OnlineSub.RegisterRecentlyMetPlayers();
    }
    super(PlayerController).PreClientTravel(PendingURL, TravelType, bIsSeamlessTravel);
    // End:0x12D
    if(int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        MPGame = LPGameMP_Base(WorldInfo.Game);
        // End:0x12A
        if(MPGame != none)
        {
            // End:0x12A
            if(!MPGame.bRestartCleanupStarted)
            {
                bShouldCleanUp = true;
                MPGame.bRestartCleanupStarted = true;
            }
        }        
    }
    else
    {
        // End:0x146
        if(IsPrimaryPlayer())
        {
            bShouldCleanUp = true;
        }
    }
    // End:0x1A7
    if(bShouldCleanUp)
    {
        ShutdownWeatherSystem();
        ResetObjectPools();
        PRI.ClearPawnClass();
        WorldInfo.ForceGarbageCollection();
    }
    // End:0x46A
    if((bIsSeamlessTravel && int(WorldInfo.NetMode) != int(NM_Standalone)) && IsLocalPlayerController())
    {
        currentMap = WorldInfo.GetMapName(false);
        // End:0x2AF
        if(InStr(PendingURL, "restart",, true) >= 0)
        {
            MPGRI = LPGRI_Base_MP(WorldInfo.GRI);
            Class'LPMPMapList'.static.ShowMapGameSpecificLoadingMovie(currentMap, MPGRI.GameType);            
        }
        else
        {
            iIndex = InStr(PendingURL, "?",, true);
            Remainder = PendingURL;
            // End:0x335
            if(iIndex > 0)
            {
                currentMap = Left(PendingURL, iIndex);
                Remainder = Right(PendingURL, Len(PendingURL) - iIndex);
            }
            GameType = Class'Engine.GameInfo'.static.ParseOption(Remainder, "Game");
            // End:0x45A
            if((currentMap != "") && GameType != "")
            {
                // End:0x3B2
                if(GameType ~= "EXTR")
                {
                    egameType = 1;                    
                }
                else
                {
                    // End:0x3D5
                    if(GameType ~= "SCEN")
                    {
                        egameType = 2;                        
                    }
                    else
                    {
                        // End:0x3F7
                        if(GameType ~= "TDM")
                        {
                            egameType = 3;                            
                        }
                        else
                        {
                            // End:0x41A
                            if(GameType ~= "SURV")
                            {
                                egameType = 4;                                
                            }
                            else
                            {
                                egameType = 0;
                            }
                        }
                    }
                }
                Class'LPMPMapList'.static.ShowMapGameSpecificLoadingMovie(currentMap, egameType);                
            }
            else
            {
                ClientShowLoadingMovie(true);
            }
        }
    }
    //return;    
}

event GetSeamlessTravelActorList()
{
    local /*0x97E50000-0x00000000*/ private bool bToEntry[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array ActorList[25165825];

    super(PlayerController).GetSeamlessTravelActorList(bToEntry, ActorList);
    // End:0x64
    if(bToEntry)
    {
        // End:0x59
        if(SeekFreeMultiClassLoader != none)
        {
            SeekFreeMultiClassLoader.UnloadAll(false);
        }
        ResetObjectPools();
    }
    //return;    
}

event NotifyLoadedWorld()
{
    local /*0x97E50000-0x00000000*/ private name WorldPackageName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFinalDest[8388609];

    super(PlayerController).NotifyLoadedWorld(WorldPackageName, bFinalDest);
    // End:0x34
    if(bFinalDest)
    {
        LoadWeaponClasses();
    }
    //return;    
}

simulated event GetLevelStreamingVolumeStreamViewPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_Location[25165825], out_Rotation;

    super(PlayerController).GetLevelStreamingVolumeStreamViewPoint(out_Location, out_Rotation);
    // End:0x53
    if(Pawn != none)
    {
        out_Location = Pawn.Location;
    }
    //return;    
}

event AwardCurrency()
{
    local /*0x97E50000-0x00000000*/ private byte currencyType[8388609];
    local /*0x97E50000-0x00000000*/ private float Amount[8388609];

    GiveCurrency(currencyType, Amount);
    //return;    
}

function GetCurrencyAmount()
{
    local /*0x97E50000-0x00000000*/ private byte currencyType[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    PRI = LPPRI(PlayerReplicationInfo);
    switch(currencyType)
    {
        // End:0x53
        case 0:
            return PRI.TEnergyAmount;
        // End:0x79
        case 1:
            return float(PRI.ScrapAmountPlayer);
        // End:0x9D
        case 2:
            return PRI.WhiteLeechDNAAmount;
        // End:0xFFFF
        default:
            return 0.0000000;
            break;
    }
    //return ReturnValue;    
}

function HasEnoughCurrency()
{
    local /*0x97E50000-0x00000000*/ private byte currencyType[8388609];
    local /*0x97E50000-0x00000000*/ private float Amount[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (Amount <= float(0)) || (GetCurrencyAmount(currencyType)) >= Amount;
    //return ReturnValue;    
}

function GiveCurrency()
{
    local /*0x97E50000-0x00000000*/ private byte currencyType[8388609];
    local /*0x97E50000-0x00000000*/ private float Amount[8388609];

    UsedCurrency(currencyType, -Amount);
    //return;    
}

function UsedCurrency()
{
    local /*0x97E50000-0x00000000*/ private byte currencyType[8388609];
    local /*0x97E50000-0x00000000*/ private float Amount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPP, PRI;

    PRI = LPPRI(PlayerReplicationInfo);
    switch(currencyType)
    {
        // End:0x12C
        case 0:
            PRI.TEnergyAmount -= Amount;
            // End:0xA7
            if(PRI.TEnergyAmount < float(0))
            {
                PRI.TEnergyAmount = 0.0000000;
            }
            LPP = GetMyPlayerPawn();
            // End:0x129
            if(LPP != none)
            {
                LPP.TEnergyLevel = LPP.GetEnergyCount() / LPP.GetMaxTEnergyCapacity();
            }
            // End:0x221
            break;
        // End:0x1A3
        case 1:
            PRI.ScrapAmountPlayer -= int(Amount);
            // End:0x1A0
            if(PRI.ScrapAmountPlayer < 0)
            {
                PRI.ScrapAmountPlayer = 0;
            }
            // End:0x221
            break;
        // End:0x21E
        case 2:
            PRI.WhiteLeechDNAAmount -= Amount;
            // End:0x21B
            if(PRI.WhiteLeechDNAAmount < float(0))
            {
                PRI.WhiteLeechDNAAmount = 0.0000000;
            }
            // End:0x221
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function AddScrap()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDisplayHudMessage[9437185];
    local /*0x97E50000-0x00000000*/ private float DisplayTime[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL PRI, TransContext, TransTag, LP;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ScrapMessage;

    true
    3.0000000
    PRI = LPPRI(PlayerReplicationInfo);
    PRI.ScrapAmountPlayer += Amount;
    // End:0x1C4
    if(bDisplayHudMessage)
    {
        LP = Class'Engine.UIInteraction'.static.GetLocalPlayer(0);
        TransContext = LP.GetTranslationContext();
        TransTag = TransContext.GetTranslatorTagFromName('Strings');
        ScrapMessage = TransTag.Translate("LostPlanetGame.Scrap.PickedUpXScrap");
        ScrapMessage = Repl(ScrapMessage, "<X>", string(Amount));
        ScrapMessage = Repl(ScrapMessage, "<Total>", string(int(GetCurrencyAmount(1))));
        myLPHUD.DisplayHUDMessageLayer(4, ScrapMessage, DisplayTime);
    }
    //return;    
}

function GetUpgrade()
{
    local /*0x97E50000-0x00000000*/ private class InUpgradeClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Upgrade;

    // End:0x50
    foreach Upgrades(Upgrade)
    {
        // End:0x4F
        if(ClassIsChildOf(Upgrade.Class, InUpgradeClass))
        {            
            return Upgrade;
        }        
    }    
    return none;
    //return ReturnValue;    
}

reliable client simulated function @NULL ClientReceiveAnnouncement()
{
    local /*0x97E50000-0x00000000*/ private byte AnnouncementName[8388609];
    local /*0x97E50000-0x00000000*/ private int InstigatorTeamNum[9437185];
    local /*0x97E50000-0x00000400*/ private @NULL ObjectiveComp[9437185], AnnouncementAkEvent;
    local /*0x97E50000-0x00000000*/ private byte bShouldOverride, bShouldQueue;
    local /*0x97E50000-0x00000000*/ private float MinTimeBeforeRepeat;
    local /*0x97E50000-0x00000000*/ private @NULL MIMP;

    -1    
    MIMP = LPMapInfo_MP(WorldInfo.GetMapInfo());
    // End:0x101
    if(MIMP != none)
    {
        AnnouncementAkEvent = MIMP.TuneDataMapInfo.GetAkEvent(AnnouncementName, int(GetTeamNum()), bShouldOverride, bShouldQueue, MinTimeBeforeRepeat, InstigatorTeamNum, ObjectiveComp);
        PlayAnnouncement(AnnouncementAkEvent, int(bShouldOverride) > int(0), int(bShouldQueue) > int(0));
    }
    //return;    
}

reliable client simulated function ClientReceiveSeqActAnnouncement()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqAct[8388609], AnnouncementAkEvent;
    local /*0x97E50000-0x00000000*/ private byte bShouldOverride, bShouldQueue;

    AnnouncementAkEvent = SeqAct.GetAkEvent(int(GetTeamNum()), bShouldOverride, bShouldQueue);
    PlayAnnouncement(AnnouncementAkEvent, int(bShouldOverride) > int(0), int(bShouldQueue) > int(0));
    //return;    
}

function PlayAnnouncement()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnnouncementAkEvent[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShouldOverride[8388609], bShouldQueue;
    local /*0x97E50000-0x00000000*/ private @NULL MIMP;

    // End:0x11
    if(AnnouncementAkEvent == none)
    {
        return;
    }
    // End:0x1F6
    if((bShouldOverride || MPAnnouncementComponent.PlayEvent == none) || !MPAnnouncementComponent.IsPlaying())
    {
        MIMP = LPMapInfo_MP(WorldInfo.GetMapInfo());
        // End:0x181
        if((MIMP != none) && MIMP.TuneDataMapInfo.SoundMode != none)
        {
            SoundModeManager.PushSoundMode(MIMP.TuneDataMapInfo.SoundMode.Name, MIMP.TuneDataMapInfo.SoundModePriority);
        }
        MPAnnouncementComponent.Stop();
        MPAnnouncementComponent.PlayEvent = AnnouncementAkEvent;
        MPAnnouncementComponent.Play();
        bAnnouncementWasPlaying = true;        
    }
    else
    {
        // End:0x221
        if(bShouldQueue)
        {
            QueuedAnnouncementAkEvents[QueuedAnnouncementAkEvents.Length] = AnnouncementAkEvent;
        }
    }
    //return;    
}

function UpdateQueuedAnnouncementAkEvents()
{
    local /*0x97E50000-0x00000000*/ private @NULL MIMP;

    MIMP = LPMapInfo_MP(WorldInfo.GetMapInfo());
    // End:0x55
    if(!IsLocalPlayerController() || MIMP == none)
    {
        return;
    }
    // End:0x1E2
    if(!MPAnnouncementComponent.IsPlaying())
    {
        // End:0x125
        if(QueuedAnnouncementAkEvents.Length > 0)
        {
            MPAnnouncementComponent.Stop();
            MPAnnouncementComponent.PlayEvent = QueuedAnnouncementAkEvents[QueuedAnnouncementAkEvents.Length - 1];
            MPAnnouncementComponent.Play();
            bAnnouncementWasPlaying = true;
            QueuedAnnouncementAkEvents.Remove(QueuedAnnouncementAkEvents.Length - 1, 1);                        
        }
        else
        {
            // End:0x1DF
            if(bAnnouncementWasPlaying)
            {
                bAnnouncementWasPlaying = false;
                // End:0x1DF
                if(MIMP.TuneDataMapInfo.SoundMode != none)
                {
                    SoundModeManager.PopSoundModeByName(MIMP.TuneDataMapInfo.SoundMode.Name);
                }
            }
        }        
    }
    else
    {
        bAnnouncementWasPlaying = true;
    }
    //return;    
}

exec function TestChatter()
{
    local /*0x97E50000-0x00000000*/ private int ChatterType[8388609];

    ServerBroadcastChatter(byte(ChatterType));
    //return;    
}

exec function TestLocalChatter()
{
    local /*0x97E50000-0x00000000*/ private int ChatterType[8388609];

    BroadcastChatter(byte(ChatterType));
    //return;    
}

unreliable server function ServerBroadcastChatter()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];

    BroadcastChatter(ChatterEvent);
    //return;    
}

simulated event BroadcastChatter()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ChatterTarget[9437185], ChatterTD, LPP;

    // End:0x2C
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return;
    }
    LPP = GetChatterPawn();
    // End:0x4F
    if(LPP == none)
    {
    }
    // End:0x7C
    if(LPP.IsChatterPlayingOrQueued(ChatterEvent))
    {
        return;
    }
    ChatterTD = LPP.TuneDataChatter;
    // End:0x17D
    if(ChatterTD != none)
    {
        // End:0x14B
        if((int(ChatterTD.ChatterEventData.ChatterEvents[int(ChatterEvent)].ChatterReplication) == int(0)) && IsLocalPlayerController())
        {
            ChatterTD.LocalChatter(ChatterEvent, self);            
        }
        else
        {
            ChatterTD.BroadcastChatter(ChatterEvent, self, ChatterTarget);
        }
    }
    //return;    
}

simulated function InternalReceiveChatter()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ChatterPawn[8388609];

    ChatterPawn.ReceiveChatter(ChatterEvent);
    //return;    
}

function ReceiveChatter()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ChatterPawn[8388609];

    // End:0x2C
    if(IsLocalPlayerController())
    {
        InternalReceiveChatter(ChatterEvent, ChatterPawn);        
    }
    else
    {
        ClientReceiveChatter(ChatterEvent, ChatterPawn);
    }
    //return;    
}

unreliable client simulated function ClientReceiveChatter()
{
    local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ChatterPawn[8388609];

    InternalReceiveChatter(ChatterEvent, ChatterPawn);
    //return;    
}

function GetChatterPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetMyPlayerPawn();
    //return ReturnValue;    
}

simulated function StopChatter()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChatterPawn[9437185];

    // End:0x24
    if(ChatterPawn == none)
    {
        ChatterPawn = GetChatterPawn();
    }
    // End:0x52
    if(ChatterPawn != none)
    {
        ChatterPawn.StopChatter();
    }
    //return;    
}

function ProcessConditionalPauseGame()
{
    ConditionalPauseGame();
    //return;    
}

exec function ConditionalPauseGame()
{
    ProcessConditionalPauseGame();
    //return;    
}

exec function EndRound()
{
    // End:0x8F
    if((WorldInfo.Game != none) && int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        WorldInfo.Game.EndGame(none, "TimeLimit");
    }
    //return;    
}

reliable client simulated function ClientSetHUD()
{
    local /*0x97E50000-0x00000000*/ private class newHUDType[8388609];

    super(SPPlayerController).ClientSetHUD(newHUDType);
    myLPHUD = LPHUD(myHUD);
    //return;    
}

reliable client simulated function ClientAddAmmoMessage()
{
    local /*0x97E50000-0x00000000*/ private class InventoryClass[8388609];
    local /*0x97E50000-0x00000000*/ private int AmountAdded[8388609], AmmoTypeIndex;

    0
    // End:0x4E
    if(myLPHUD != none)
    {
        myLPHUD.HandlePickup(InventoryClass, AmountAdded, AmmoTypeIndex);
    }
    //return;    
}

reliable client simulated function ClientAddStatusMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageString[8388609];

    // End:0x37
    if(myLPHUD != none)
    {
        myLPHUD.AddStatusMessage(MessageString);
    }
    //return;    
}

reliable client final simulated function ClientDrawVSEnvironmentalMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    myLPHUD.OpenVSEnvironmentalMessage(Action);
    //return;    
}

reliable client final simulated function ClientClearVSEnvironmentalMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    myLPHUD.ClearVSEnvironmentalMessageForAction(Action);
    //return;    
}

reliable client simulated event ClientShowRadioMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];

    // End:0x38
    if(myLPHUD != none)
    {
        myLPHUD.ShowRadioMessage(bShow);
    }
    //return;    
}

function EnableGrabPointsDisplay()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x3B
    if(!bEnable)
    {
        myLPHUD.StopAllGrabPoints();
        SetVSReticleHelpButton(1, false);
    }
    bDisplayGrabPoints = bEnable;
    //return;    
}

function EnableHydraulicPressureDisplay()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    myLPHUD.ShowVSGrabIndicator(bEnable);
    //return;    
}

function SetHydraulicPressureLevel()
{
    local /*0x97E50000-0x00000000*/ private float pressure[8388609];

    myLPHUD.SetVSGrabIndicatorPresure(pressure);
    //return;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

    // End:0x17
    if(bDisplayGrabPoints)
    {
        DisplayGrabPoints();
    }
    // End:0x2E
    if(bShowGrenadeAssistZone)
    {
        DrawGrenadeAssistZones();
    }
    // End:0x45
    if(bShowWinchAssistZone)
    {
        DrawWinchAssistZones();
    }
    // End:0x5C
    if(bShowLobFireAttackDebug)
    {
        DrawShowLobFireAttackDebug();
    }
    // End:0x87
    if(bShowAiAttackArcs)
    {
        DrawAiAttackArcs();
        DrawCarrierHiveCellStatus();
        DrawDefenderHiveCellStatus();
    }
    // End:0x9E
    if(bDisplayCombatWindows)
    {
        DisplayCombatWindows();
    }
    super(PlayerController).DrawHUD(H);
    //return;    
}

function ShouldDisplayVSCombatTutorials()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function OnStorageDeviceChange()
{
    local /*0x97E50000-0x00000000*/ private int ControllerId;

    // End:0x0F
    if(IsAtTitleScreen())
    {
        return;
    }
    // End:0x160
    if(((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none))) && int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        ControllerId = Class'Engine.UIInteraction'.static.GetPlayerControllerId(GetUIPlayerIndex());
        // End:0x160
        if(ControllerId != -1)
        {
            OnlineSub.PlayerInterface.AddWriteProfileSettingsCompleteDelegate(byte(ControllerId), OnDeviceChangeProfileWriteComplete);
            OnlineSub.PlayerInterface.WriteProfileSettings(byte(ControllerId), ProfileSettings);
        }
    }
    super(SPPlayerController).OnStorageDeviceChange();
    //return;    
}

function OnDeviceChangeProfileWriteComplete()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    // End:0x95
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        OnlineSub.PlayerInterface.ClearWriteProfileSettingsCompleteDelegate(LocalUserNum, OnDeviceChangeProfileWriteComplete);
    }
    // End:0x172
    if(!bWasSuccessful)
    {
        DisplayReturnToTitleError("<Strings:SPGameUI.MessageBoxErrorStrings.IllegalDeviceChangeMP_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.StorageDeviceUnavailable_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>",, true);
    }
    //return;    
}

function SaveProfile()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;

    ScriptTrace();
    // End:0x19
    if(bSavingDisabled)
    {
        return;
    }
    // End:0xFA
    if(IsLocalPlayerController())
    {
        LPPS = LPProfileSettings(ProfileSettings);
        // End:0x72
        if(GetStatManager() != none)
        {
            GetStatManager().SaveStatsToProfile();
        }
        // End:0xA2
        if((GetMetagameManager()) != none)
        {
            GetMetagameManager().SaveUnlockablesToProfile();
        }
        // End:0xD2
        if((GetAchievementManager()) != none)
        {
            GetAchievementManager().SaveAchievementsToProfile();
        }
        LPPS.SetDelimitedUnlockedMovieList(UnlockedMovieList);
    }
    super(SPPlayerController).SaveProfile();
    //return;    
}

function ShouldSavePlayerStorageProfile()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x97
    if((((!Class'Engine.WorldInfo'.static.IsConsoleBuild(1) || GetStatManager() == none) || !GetStatManager().bLoadedFromProfile) || !GetStatManager().bStatDataInit) || bSavingDisabled)
    {
        return false;
    }
    return super(SPPlayerController).ShouldSavePlayerStorageProfile();
    //return ReturnValue;    
}

function NotifyStorageReadComplete()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    super(SPPlayerController).NotifyStorageReadComplete(LocalUserNum, bWasSuccessful);
    bPlayerStorageRead = true;
    InitPersistentDataManagers();
    //return;    
}

function NotifyProfileReadComplete()
{
    local /*0x97E50000-0x00000000*/ private byte LocalUserNum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bWasSuccessful[8388609];

    super(SPPlayerController).NotifyProfileReadComplete(LocalUserNum, bWasSuccessful);
    InitPersistentDataManagers();
    //return;    
}

exec function UpdateLocalCacheOfProfileSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI, LPPS;
    local /*0x97E50000-0x00000000*/ private int PlayerIndex;

    PlayerIndex = GetUIPlayerIndex();
    super(SPPlayerController).UpdateLocalCacheOfProfileSettings();
    SetGamma(ProfileSettings.GetGammaSetting());
    LPPS = LPProfileSettings(ProfileSettings);
    // End:0x19A
    if(bProfileSettingsUpdated && LPPS != none)
    {
        InitPersistentDataManagers();
        PRI = LPPRI(PlayerReplicationInfo);
        // End:0xF7
        if(PRI != none)
        {
            PRI.bUpdatedFromProfile = false;
            PRI.UpdateFromProfile();
        }
        // End:0x137
        if(bIsInVitalSuit)
        {
            // End:0x134
            if(MyPlayerPawn != none)
            {
                MyPlayerPawn.bProfileLoadOutInitialized = false;
            }            
        }
        else
        {
            // End:0x171
            if(MyPlayerPawn != none)
            {
                MyPlayerPawn.bProfileLoadOutInitialized = false;
                SetLoadOutFromProfile();
            }
        }
        UnlockedMovieList = LPPS.GetDelimitedUnlockedMovieList();
    }
    // End:0x215
    if(PlayerIndex == 0)
    {
        SetSoundClassVolumes(ProfileSettings.GetDialogVolume(), ProfileSettings.GetFxVolume(), -1.0000000, ProfileSettings.GetMovieVolume());
    }
    SetAimAssist(ProfileSettings.GetAutoAimOption());
    UpdateDynamicFloatingAimInputScale();
    //return;    
}

function ResetPlayerStorageRelatedDataToDefault()
{
    ResetPlayerStoragePersistentDataManagers();
    //return;    
}

function ResetProfileRelatedDataToDefault()
{
    UnlockedMovieList = "";
    LPPRI(PlayerReplicationInfo).SetMPCreditsEarned(0);
    ResetProfilePersistentDataManagers();
    //return;    
}

function ResetNonOwnedGameSettings()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    PRI = LPPRI(PlayerReplicationInfo);
    // End:0x12B
    if(PRI != none)
    {
        PRI.SetMPCreditsEarned(0);
        GetMatchData();
        // End:0xB6
        if(PRI.MetagameManager != none)
        {
            Class'Engine.SPObject'.static.MarkObjectAsPendingKill(PRI.MetagameManager);
        }
        PRI.MetagameManager = new (MatchDataStore) Class'LPMetagameManager';
        PRI.MetagameManager.InitUnlockables(self, true);
        ReplicateMetagameData();
    }
    super(SPPlayerController).ResetNonOwnedGameSettings();
    //return;    
}

function SetLoadOutFromProfile()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentProfileSettings;

    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return;
    }
    // End:0x3C
    if(!IsLocalController())
    {
        return;
    }
    // End:0xF7
    if((MyPlayerPawn != none) && !MyPlayerPawn.bProfileLoadOutInitialized)
    {
        CurrentProfileSettings = LPProfileSettings(ProfileSettings);
        // End:0xF7
        if((CurrentProfileSettings != none) && bProfileHasBeenLoaded)
        {
            // End:0xC8
            if(!bServerWeaponsInitialized)
            {
                bPendingApplyLoadOutOnServerWeapons = true;
                return;
            }
            SetLoadoutKit();
            MyPlayerPawn.bProfileLoadOutInitialized = true;            
        }
    }
    //return;    
}

simulated event ReceivedPlayer()
{
    super(PlayerController).ReceivedPlayer();
    // End:0x24
    if(!IsLocalPlayerController())
    {
        InitPersistentDataManagers();
    }
    //return;    
}

function GetPerksManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPPRI(PlayerReplicationInfo).PerksManager;
    //return ReturnValue;    
}

function GetAwardManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPPRI(PlayerReplicationInfo).AwardManager;
    //return ReturnValue;    
}

function GetAchievementManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPPRI(PlayerReplicationInfo).AchievementManager;
    //return ReturnValue;    
}

// Export ULPPlayerController::execGetMetagameManager(FFrame&, void* const)
native function GetMetagameManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

function GetLoadoutKitManager()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPPRI(PlayerReplicationInfo).LoadoutKitManager;
    //return ReturnValue;    
}

function ResetPlayerStoragePersistentDataManagers()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    PRI = LPPRI(PlayerReplicationInfo);
    // End:0x77
    if(PRI != none)
    {
        ConstructStatManager(true);
        GetStatManager().MyPC = self;
        GetStatManager().InitStatData();
    }
    //return;    
}

function ResetProfilePersistentDataManagers()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    PRI = LPPRI(PlayerReplicationInfo);
    // End:0x19A
    if(PRI != none)
    {
        ConstructPersistentDataManagers(true, true);
        // End:0x98
        if(PRI.LoadoutKitManager != none)
        {
            Class'Engine.SPObject'.static.MarkObjectAsPendingKill(PRI.LoadoutKitManager);
        }
        PRI.LoadoutKitManager = new (PRI) Class'LPLoadoutKitManager';
        // End:0x12E
        if(PRI.PerksManager != none)
        {
            Class'Engine.SPObject'.static.MarkObjectAsPendingKill(PRI.PerksManager);
        }
        PRI.PerksManager = none;
        PRI.InitPerksManager();
        GetMetagameManager().InitUnlockables(self, true);
        ReplicateMetagameData();
    }
    //return;    
}

function ConstructStatManager()
{
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];

    // End:0xF7
    if(PlayerReplicationInfo != none)
    {
        GetMatchData();
        // End:0xF7
        if((GetStatManager() == none) || bForce)
        {
            // End:0xB9
            if(bForce)
            {
                // End:0xB9
                if(LPPRI(PlayerReplicationInfo).StatManager != none)
                {
                    Class'Engine.SPObject'.static.MarkObjectAsPendingKill(LPPRI(PlayerReplicationInfo).StatManager);
                }
            }
            LPPRI(PlayerReplicationInfo).StatManager = new (MatchDataStore) Class'LPStatManager';
        }
    }
    //return;    
}

function ConstructPersistentDataManagers()
{
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185], bNoStatManager;

    // End:0x31A
    if(PlayerReplicationInfo != none)
    {
        GetMatchData();
        // End:0x3E
        if(!bNoStatManager)
        {
            ConstructStatManager(bForce);
        }
        // End:0x11B
        if(((GetAwardManager()) == none) || bForce)
        {
            // End:0xDD
            if(bForce)
            {
                // End:0xDD
                if(LPPRI(PlayerReplicationInfo).AwardManager != none)
                {
                    Class'Engine.SPObject'.static.MarkObjectAsPendingKill(LPPRI(PlayerReplicationInfo).AwardManager);
                }
            }
            LPPRI(PlayerReplicationInfo).AwardManager = new (MatchDataStore) Class'LPAwardManager';
        }
        // End:0x1F8
        if(((GetAchievementManager()) == none) || bForce)
        {
            // End:0x1BA
            if(bForce)
            {
                // End:0x1BA
                if(LPPRI(PlayerReplicationInfo).AchievementManager != none)
                {
                    Class'Engine.SPObject'.static.MarkObjectAsPendingKill(LPPRI(PlayerReplicationInfo).AchievementManager);
                }
            }
            LPPRI(PlayerReplicationInfo).AchievementManager = new (MatchDataStore) Class'LPAchievementManager';
        }
        // End:0x2D5
        if(((GetMetagameManager()) == none) || bForce)
        {
            // End:0x297
            if(bForce)
            {
                // End:0x297
                if(LPPRI(PlayerReplicationInfo).MetagameManager != none)
                {
                    Class'Engine.SPObject'.static.MarkObjectAsPendingKill(LPPRI(PlayerReplicationInfo).MetagameManager);
                }
            }
            LPPRI(PlayerReplicationInfo).MetagameManager = new (MatchDataStore) Class'LPMetagameManager';
        }
        GetAwardManager().InitAwardManager(self);
        GetAchievementManager().InitAchievements(self);        
    }
    else
    {
        SetTimer(0.1000000, false, 'ConstructPersistentDataManagers');
    }
    //return;    
}

function InitPersistentDataManagers()
{
    local /*0x97E50000-0x00000000*/ private bool bForceReload[9437185], bStorageRead;

    false
    // End:0x287
    if(PlayerReplicationInfo != none)
    {
        ConstructPersistentDataManagers();
        bStorageRead = (bPlayerStorageRead || Class'LPGameViewportClient'.static.IsTGSDemo()) || !WorldInfo.IsConsoleBuild(1);
        // End:0xE1
        if(bStorageRead)
        {
            // End:0xBD
            if(bForceReload)
            {
                GetStatManager().bLoadedFromProfile = false;
            }
            GetStatManager().InitStatManager(self);            
        }
        else
        {
            GetStatManager().MyPC = self;
            GetStatManager().InitStatData();
        }
        // End:0x284
        if(IsLocalPlayerController())
        {
            // End:0x17D
            if((GetLoadoutKitManager()) == none)
            {
                LPPRI(PlayerReplicationInfo).LoadoutKitManager = new (PlayerReplicationInfo) Class'LPLoadoutKitManager';
            }
            // End:0x284
            if(bProfileHasBeenLoaded)
            {
                // End:0x1DB
                if(bForceReload)
                {
                    GetMetagameManager().bLoadedFromProfile = false;
                    GetLoadoutKitManager().bLoadedFromProfile = false;
                }
                // End:0x22C
                if(!GetMetagameManager().bLoadedFromProfile)
                {
                    GetMetagameManager().InitUnlockables(self);
                    ReplicateMetagameData();
                }
                GetLoadoutKitManager().InitLoadoutKits(self);
                GetAchievementManager().LoadAchievementsFromProfile();
                // End:0x284
                if(bStorageRead)
                {
                    OnPersistentDataManagersInit();
                }
            }
        }        
    }
    else
    {
        SetTimer(0.1000000, false, 'InitPersistentDataManagers');
    }
    //return;    
}

function OnPersistentDataManagersInit()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OnDataInitFunc;

    bPersistentDataInit = true;
    // End:0x37
    foreach OnPersistentDataInitDelegates(OnDataInitFunc)
    {
        OnPersistentDataInit();        
    }    
    // End:0x56
    if(int(Role) != int(ROLE_Authority))
    {
        ServerNotifyPersistentDataInit();
    }
    OnPersistentDataInitDelegates.Length = 0;
    //return;    
}

reliable server function ServerNotifyPersistentDataInit()
{
    // End:0x1E
    if(int(Role) == int(ROLE_Authority))
    {
        OnPersistentDataManagersInit();
    }
    //return;    
}

function AddOnPersistentDataInitDelegate()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> OnDataInitFunc[8388609];

    // End:0x36
    if(OnPersistentDataInitDelegates.Find(OnDataInitFunc) == )
    {        
        OnPersistentDataInitDelegates.AddItem(OnDataInitFunc);        
    }
    //return;    
}

function UnlockMovie()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InMovie[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    LPPS = LPProfileSettings(ProfileSettings);
    // End:0x2D
    if(LPPS == none)
    {
        return;
    }
    iIndex = InStr(UnlockedMovieList, InMovie, false, true);
    // End:0x5F
    if(iIndex >= 0)
    {
        return;
    }
    UnlockedMovieList = (UnlockedMovieList $ InMovie) $ ",";
    LPPS.SetDelimitedUnlockedMovieList(UnlockedMovieList);
    LPPS.SetModified(true);
    //return;    
}

function IsMovieUnlocked()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string InMovie[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iIndex;

    iIndex = InStr(UnlockedMovieList, InMovie, false, true);
    // End:0x32
    if(iIndex >= 0)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function SetLoadoutKit()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[9437185];

    -1
    // End:0x4D
    if((GetLoadoutKitManager()) != none)
    {
        GetLoadoutKitManager().ApplyLoadout(LoadoutIndex, true);
        ForceDPadClusterUpdate();
    }
    //return;    
}

simulated function GetLoadoutKit()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1
    // End:0x43
    if((GetLoadoutKitManager()) != none)
    {
        return GetLoadoutKitManager().GetLoadout(LoadoutIndex);
    }
    //return ReturnValue;    
}

simulated function SaveCurrentLoadout()
{
    local /*0x97E50000-0x00000000*/ private int LoadoutIndex[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LoadoutKit, PerksManager;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PerkString0, PerkString1, PerkString2, PerkString3, WeaponPrimary, WeaponSecondary,
	    WeaponTertiary;

    local /*0x97E50000-0x00000000*/ private @NULL invWeapon;
    local /*0x97E50000-0x00000000*/ private bool bIsPistol;

    -1
    // End:0x547
    if((GetLoadoutKitManager()) != none)
    {
        PerksManager = LPPRI(PlayerReplicationInfo).PerksManager;
        // End:0x547
        if((MyPlayerPawn != none) && PerksManager != none)
        {
            LoadoutKit = GetLoadoutKitManager().GetLoadout(LoadoutIndex);
            // End:0x547
            if(LoadoutKit != none)
            {
                PerkString0 = string(((PerksManager.AssignedPerk[0].Perk != none) ? PerksManager.AssignedPerk[0].Perk.PerkName : 'None'));
                PerkString1 = string(((PerksManager.AssignedPerk[1].Perk != none) ? PerksManager.AssignedPerk[1].Perk.PerkName : 'None'));
                PerkString2 = string(((PerksManager.AssignedPerk[2].Perk != none) ? PerksManager.AssignedPerk[2].Perk.PerkName : 'None'));
                PerkString3 = string(((PerksManager.AssignedPerk[3].Perk != none) ? PerksManager.AssignedPerk[3].Perk.PerkName : 'None'));
                LoadoutKit.SetLoadoutPerks(PerkString0, PerkString1, PerkString2, PerkString3);
                // End:0x4EA
                foreach MyPlayerPawn.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', invWeapon)
                {
                    // End:0x4E9
                    if(LPInventoryWeaponNone(invWeapon) == none)
                    {
                        bIsPistol = LPWeaponPistol(invWeapon) != none;
                        // End:0x4AF
                        if(invWeapon.bCanEquip)
                        {
                            // End:0x460
                            if((MyPlayerPawn.Weapon == invWeapon) && !bIsPistol)
                            {
                                WeaponPrimary = string(invWeapon.Class);                                
                            }
                            else
                            {
                                // End:0x4AC
                                if((WeaponPrimary != "") && WeaponSecondary == "")
                                {
                                    WeaponSecondary = string(invWeapon.Class);
                                }
                            }
                            // End:0x4E9
                            continue;
                        }
                        // End:0x4E9
                        if(WeaponTertiary == "")
                        {
                            WeaponTertiary = string(invWeapon.Class);
                        }
                    }                    
                }                
                LoadoutKit.SetLoadoutWeapons(WeaponPrimary, WeaponSecondary, WeaponTertiary);
                LoadoutKit.LogLoadoutData();
            }
        }
    }
    //return;    
}

simulated function IncrementStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];

    ModifyStat(StatName);
    //return;    
}

function ServerIncrementStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];

    IncrementStat(StatName);
    // End:0x4F
    if(!IsLocalPlayerController() && !IsStatServerOnly(StatName))
    {
        ClientIncrementStat(StatName);
    }
    //return;    
}

reliable client simulated function ClientIncrementStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];

    IncrementStat(StatName);
    //return;    
}

function ServerModifyStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private int Amount[9437185];
    local /*0x97E50000-0x00000000*/ private byte ModType[9437185];

    1
    0
    ModifyStat(StatName, Amount, ModType);
    // End:0x7E
    if(!IsLocalPlayerController() && !IsStatServerOnly(StatName))
    {
        ClientModifyStat(StatName, Amount, ModType);
    }
    //return;    
}

reliable client simulated function ClientModifyStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private int Amount[9437185];
    local /*0x97E50000-0x00000000*/ private byte ModType[9437185];

    1
    0
    ModifyStat(StatName, Amount, ModType);
    //return;    
}

simulated function EvalStat()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private byte PeriodToEval[9437185];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    2
    return GetStatManager().super(LPPlayerController).EvalStat(StatName, PeriodToEval);
    //return ReturnValue;    
}

simulated function ResetStatsForPeriod()
{
    local /*0x97E50000-0x00000000*/ private byte PeriodToReset[9437185];

    0
    GetStatManager().ResetStatsForPeriod(PeriodToReset);
    //return;    
}

reliable client simulated function ClientHandleKillStats()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private int VictimState[8388609];
    local /*0x97E50000-0x00000000*/ private bool bKilledWithHeadshot[8388609], bKilledFlagCarrier, bKilledTeammate, bAvengedTeammate;

    LPPRI(PlayerReplicationInfo).HandleKillStats(DamageType, VictimState, bKilledWithHeadshot, bKilledFlagCarrier, bKilledTeammate, bAvengedTeammate);
    //return;    
}

reliable client simulated function ClientHandleDeathStats()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bKilledSelf[8388609], bKilledByHuman, bKilledByTeammate;

    LPPRI(PlayerReplicationInfo).HandleDeathStats(DamageType, bKilledSelf, bKilledByHuman, bKilledByTeammate);
    //return;    
}

function IsStatServerOnly()
{
    local /*0x97E50000-0x00000000*/ private name StatName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = GetStatManager().GetStatDefinitionIndex(StatName);
    return (Idx >= 0) && GetStatManager().StatDefinitions[Idx].bServerOnly;
    //return ReturnValue;    
}

function ServerGiveAward()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];

    GetAwardManager().ServerGiveAward(AwardName);
    //return;    
}

reliable client simulated function ClientGiveAward()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];

    GiveAward(AwardName);
    //return;    
}

function GiveAward()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];

    GetAwardManager().GiveAward(AwardName);
    //return;    
}

function GetAward()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x3A
    if((GetAwardManager()) != none)
    {
        return GetAwardManager().GetAward(AwardName);
    }
    return none;
    //return ReturnValue;    
}

function ShowAward()
{
    local /*0x97E50000-0x00000000*/ private @NULL Award[8388609];
    local /*0x97E50000-0x00000000*/ private int CreditsAdded[8388609];

    // End:0x49
    if(myLPHUD != none)
    {
        LPHUD(myHUD).ShowAward(Award, CreditsAdded);
    }
    //return;    
}

event GetCredits()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;

    // End:0x58
    if(IsLocalPlayerController())
    {
        LPPS = LPProfileSettings(ProfileSettings);
        // End:0x58
        if(LPPS != none)
        {
            return LPPS.GetCredits();
        }
    }
    return 0;
    //return ReturnValue;    
}

simulated function SaveMetagameData()
{
    // End:0x2D
    if(IsLocalPlayerController())
    {
        GetMetagameManager().SaveUnlockablesToProfile();
    }
    //return;    
}

simulated function SetUnlockStatus()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave, bNoStatUpdate;

    true    
    InternalSetUnlockStatus(UnlockName, bUnlocked, bSave, bNoStatUpdate);
    // End:0xCE
    if((int(WorldInfo.NetMode) == int(NM_ListenServer)) || int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        // End:0xCB
        if(!IsLocalPlayerController())
        {
            ClientSetUnlockStatus(UnlockName, bUnlocked, bSave, bNoStatUpdate);
        }        
    }
    else
    {
        // End:0x128
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            ServerSetUnlockStatus(UnlockName, bUnlocked, bSave, bNoStatUpdate);
        }
    }
    //return;    
}

reliable client simulated function ClientSetUnlockStatus()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave, bNoStatUpdate;

    InternalSetUnlockStatus(UnlockName, bUnlocked, bSave, bNoStatUpdate);
    //return;    
}

reliable server function ServerSetUnlockStatus()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave, bNoStatUpdate;

    InternalSetUnlockStatus(UnlockName, bUnlocked, bSave, bNoStatUpdate);
    //return;    
}

private final simulated function InternalSetUnlockStatus()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave, bNoStatUpdate;

    GetMetagameManager().SetUnlockStatus(UnlockName, bUnlocked, bNoStatUpdate);
    // End:0x55
    if(bSave)
    {
        SaveMetagameData();
    }
    //return;    
}

simulated function SetUnlockStatusAll()
{
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave;

    true
    InternalSetUnlockStatusAll(bUnlocked, bSave);
    // End:0xA7
    if((int(WorldInfo.NetMode) == int(NM_ListenServer)) || int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        // End:0xA4
        if(!IsLocalPlayerController())
        {
            ClientSetUnlockStatusAll(bUnlocked, bSave);
        }        
    }
    else
    {
        // End:0xEE
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            ServerSetUnlockStatusAll(bUnlocked, bSave);
        }
    }
    //return;    
}

reliable client simulated function ClientSetUnlockStatusAll()
{
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave;

    InternalSetUnlockStatusAll(bUnlocked, bSave);
    //return;    
}

reliable server function ServerSetUnlockStatusAll()
{
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave;

    InternalSetUnlockStatusAll(bUnlocked, bSave);
    //return;    
}

private final simulated function InternalSetUnlockStatusAll()
{
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave;

    // End:0x30
    if(bUnlocked)
    {
        GetMetagameManager().UnlockAll();        
    }
    else
    {
        GetMetagameManager().LockAll();
    }
    // End:0x67
    if(bSave)
    {
        SaveMetagameData();
    }
    //return;    
}

simulated function SetUnlockStatusByType()
{
    local /*0x97E50000-0x00000000*/ private name RewardType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave, bNoStatUpdate;

    true    
    InternalSetUnlockStatusByType(RewardType, bUnlocked, bSave, bNoStatUpdate);
    // End:0xCE
    if((int(WorldInfo.NetMode) == int(NM_ListenServer)) || int(WorldInfo.NetMode) == int(NM_DedicatedServer))
    {
        // End:0xCB
        if(!IsLocalPlayerController())
        {
            ClientSetUnlockStatusByType(RewardType, bUnlocked, bSave, bNoStatUpdate);
        }        
    }
    else
    {
        // End:0x128
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            ServerSetUnlockStatusByType(RewardType, bUnlocked, bSave, bNoStatUpdate);
        }
    }
    //return;    
}

reliable client simulated function ClientSetUnlockStatusByType()
{
    local /*0x97E50000-0x00000000*/ private name RewardType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave, bNoStatUpdate;

    InternalSetUnlockStatusByType(RewardType, bUnlocked, bSave, bNoStatUpdate);
    //return;    
}

reliable server function ServerSetUnlockStatusByType()
{
    local /*0x97E50000-0x00000000*/ private name RewardType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave, bNoStatUpdate;

    InternalSetUnlockStatusByType(RewardType, bUnlocked, bSave, bNoStatUpdate);
    //return;    
}

private final simulated function InternalSetUnlockStatusByType()
{
    local /*0x97E50000-0x00000000*/ private name RewardType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnlocked[8388609], bSave, bNoStatUpdate;

    GetMetagameManager().SetUnlockStatusByType(RewardType, bUnlocked, bNoStatUpdate);
    // End:0x55
    if(bSave)
    {
        SaveMetagameData();
    }
    //return;    
}

simulated function GetUnlockProgress()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x32
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return 0.0000000;        
    }
    else
    {
        return GetMetagameManager().GetUnlockProgress(UnlockName);
    }
    //return ReturnValue;    
}

simulated function IsUnlocked()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return false;        
    }
    else
    {
        return IsUnlockedMP(UnlockName);
    }
    //return ReturnValue;    
}

// Export ULPPlayerController::execIsUnlockedMP(FFrame&, void* const)
native simulated function IsUnlockedMP()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated function ReplicateMetagameData()
{
    local /*0x97E50000-0x00000000*/ private @NULL SDDC, MetagameData;

    // End:0x128
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        // End:0xFD
        foreach GetMetagameManager().SerializableContainers(SDDC)
        {
            MetagameData = LPMetagameData(SDDC);
            // End:0xFC
            if(GetMetagameManager().ShouldReplicate(MetagameData.GetMetagameCell()))
            {
                ServerReplicateMetagameData(MetagameData.GetUnlockName(), MetagameData.IsUnlocked());
            }            
        }        
        ServerFinalizeMetagameData(GetMetagameManager().GetMetagameRank());
    }
    //return;    
}

reliable server function ServerReplicateMetagameData()
{
    local /*0x97E50000-0x00000000*/ private name UnlockName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsUnlocked[8388609];

    GetMetagameManager().SetMetagameData(UnlockName, bIsUnlocked, false);
    //return;    
}

reliable server function ServerFinalizeMetagameData()
{
    local /*0x97E50000-0x00000000*/ private int MetagameRank[8388609];

    GetMetagameManager().CachedRank = MetagameRank;
    GetMetagameManager().bUpdatedFromProfile = true;
    //return;    
}

event ShowMetagameTracker()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cell[8388609];
    local /*0x97E50000-0x00000000*/ private float Progress[8388609];

    // End:0x7B
    if((myLPHUD != none) && myLPHUD.MyLPGFxMovie != none)
    {
        myLPHUD.MyLPGFxMovie.ShowMetagameTracker(Cell, Progress);
    }
    //return;    
}

exec function EnableQuickMenu()
{
    //return;    
}

exec function DisableQuickMenu()
{
    //return;    
}

function OnForceTrackObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    Class'LPBreadcrumbManager'.static.GetBreadcrumbManager().SetSelectedJobLogObjective(Action.ObjectiveToTrack.GetQuestObject());
    //return;    
}

event NotifyQuestProgressAdjusted()
{
    local /*0x97E50000-0x00000000*/ private @NULL InObjective[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string DisplayString;
    local /*0x97E50000-0x00000000*/ private int CurrentVal, MaxVal;

    // End:0x26
    if(InObjective.ProgressText == none)
    {
        return;
    }
    CurrentVal = int(InObjective.DynamicData_Float.CurrentValue);
    MaxVal = int(InObjective.RequiredValue.GetValue());
    DisplayString = (((InObjective.ProgressText.LocalizedTextMarkUp @ " ") @ string(CurrentVal)) @ "/") @ string(MaxVal);
    myLPHUD.DisplayHUDMessageLayer(3, DisplayString, float(QuestProgressMessagesDuration));
    //return;    
}

function DoesPlayerCSAAllowWeapons()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCSA;

    // End:0x93
    if(MyPlayerPawn != none)
    {
        PlayerCSA = LPCSAO_Player(MyPlayerPawn.ContextSensitiveAnimInfo.CurrentCSA);
        // End:0x93
        if((PlayerCSA != none) && !PlayerCSA.DoesAllowWeapon(MyPlayerPawn))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function DoesPlayerCSAAllowGrapplingHook()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCSA;

    // End:0x93
    if(MyPlayerPawn != none)
    {
        PlayerCSA = LPCSAO_Player(MyPlayerPawn.ContextSensitiveAnimInfo.CurrentCSA);
        // End:0x93
        if((PlayerCSA != none) && !PlayerCSA.DoesAllowGrapplingHook(MyPlayerPawn))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function DoesPlayerCSAAllowDodging()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCSA;

    // End:0x93
    if(MyPlayerPawn != none)
    {
        PlayerCSA = LPCSAO_Player(MyPlayerPawn.ContextSensitiveAnimInfo.CurrentCSA);
        // End:0x93
        if((PlayerCSA != none) && !PlayerCSA.DoesAllowDodge(MyPlayerPawn))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

reliable client simulated function NotifyOfAttentionDrawingAttackStarted()
{
    local /*0x97E50000-0x00000000*/ private @NULL Attacker[8388609];

    ActivateSoundMode(Class'LPSoundModeManager'.default.MODE_AttentionDrawingAttack, Class'LPSoundModeManager'.default.PRI_AttentionDrawingAttack);
    //return;    
}

reliable client simulated function NotifyOfAttentionDrawingAttackEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL Attacker[8388609];

    DeactivateSoundModeByName(Class'LPSoundModeManager'.default.MODE_AttentionDrawingAttack);
    //return;    
}

simulated function OnAddRemovePistolAnimSetsContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x3A
    if(MyBasePlayerPawn == none)
    {
        AddToPendingAnimSets(inAction.AnimSets, true);
        return;
    }
    // End:0x74
    if(MyPlayerPawn != none)
    {
        MyPlayerPawn.OnAddRemoveAnimSets(inAction);        
    }
    else
    {
        LPPlayerPawn(HumanPlayerPawn).OnAddRemoveAnimSets(inAction);
    }
    //return;    
}

simulated function AddToPendingAnimSets()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InAnimSets[25296897];
    local /*0x97E50000-0x00000000*/ private bool bForPlayer[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL NewEntry;

    Idx = 0;
    J0x0B:

    // End:0x9F [Loop If]
    if(Idx < InAnimSets.Length)
    {
        NewEntry.AnimSetToAdd = InAnimSets[Idx];
        NewEntry.bForPlayer = bForPlayer;
        PendingAnimSets.AddItem(NewEntry);        
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

simulated function RemoveFromPendingAnimSets()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array InAnimSets[25296897];
    local /*0x97E50000-0x00000000*/ private bool bForPlayer[8388609];
    local /*0x97E50000-0x00000000*/ private int OuterIdx, InnerIdx;

    OuterIdx = InAnimSets.Length - 1;
    J0x17:

    // End:0xF3 [Loop If]
    if(OuterIdx >= 0)
    {
        InnerIdx = PendingAnimSets.Length - 1;
        J0x3D:

        // End:0xE5 [Loop If]
        if(InnerIdx >= 0)
        {
            // End:0xD7
            if((InAnimSets[OuterIdx] == PendingAnimSets[InnerIdx].AnimSetToAdd) && bForPlayer == PendingAnimSets[InnerIdx].bForPlayer)
            {
                PendingAnimSets.Remove(InnerIdx, 1);                
            }
            InnerIdx--;
            // [Loop Continue]
            goto J0x3D;
        }
        OuterIdx--;
        // [Loop Continue]
        goto J0x17;
    }
    //return;    
}

simulated function ApplyPendingAnimSets()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsPlayerPawn;
    local /*0x97E50000-0x00000000*/ private editfixedsize array AnimSetsToAdd;
    local /*0x97E50000-0x00000000*/ private int Idx;

    bIsPlayerPawn = LPPlayerPawn(inPawn) != none;
    Idx = PendingAnimSets.Length - 1;
    J0x37:

    // End:0xD2 [Loop If]
    if(Idx >= 0)
    {
        // End:0xC4
        if(PendingAnimSets[Idx].bForPlayer == bIsPlayerPawn)
        {
            AnimSetsToAdd.AddItem(PendingAnimSets[Idx].AnimSetToAdd);            
            PendingAnimSets.Remove(Idx, 1);            
        }
        Idx--;
        // [Loop Continue]
        goto J0x37;
    }
    // End:0x10A
    if(AnimSetsToAdd.Length > 0)
    {
        inPawn.AddAnimSets(AnimSetsToAdd);
    }
    //return;    
}

simulated function OnAddRemoveAnimSets()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x20B
    if(Action.InputLinks[0].bHasImpulse)
    {
        // End:0x92
        if(Pawn == none)
        {
            AddToPendingAnimSets(Action.AnimSets, !Action.bForceToVitalSuit);            
        }
        else
        {
            // End:0x12E
            if(LPPlayerPawn(Pawn) != none)
            {
                // End:0x102
                if(!Action.bForceToVitalSuit)
                {
                    LPPlayerPawn(Pawn).OnAddRemoveAnimSets(Action);                    
                }
                else
                {
                    AddToPendingAnimSets(Action.AnimSets, false);
                }                
            }
            else
            {
                // End:0x208
                if(LPBaseVSPlayerPawn(Pawn) != none)
                {
                    // End:0x19C
                    if(Action.bForceToVitalSuit)
                    {
                        LPBaseVSPlayerPawn(Pawn).OnAddRemoveAnimSets(Action);                        
                    }
                    else
                    {
                        // End:0x1DF
                        if(HumanPlayerPawn != none)
                        {
                            SPPawn(HumanPlayerPawn).OnAddRemoveAnimSets(Action);                            
                        }
                        else
                        {
                            AddToPendingAnimSets(Action.AnimSets, false);
                        }
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x413
        if(Action.InputLinks[1].bHasImpulse)
        {
            // End:0x29D
            if(Pawn == none)
            {
                RemoveFromPendingAnimSets(Action.AnimSets, !Action.bForceToVitalSuit);                
            }
            else
            {
                // End:0x339
                if(LPPlayerPawn(Pawn) != none)
                {
                    // End:0x30D
                    if(!Action.bForceToVitalSuit)
                    {
                        LPPlayerPawn(Pawn).OnAddRemoveAnimSets(Action);                        
                    }
                    else
                    {
                        RemoveFromPendingAnimSets(Action.AnimSets, false);
                    }                    
                }
                else
                {
                    // End:0x413
                    if(LPBaseVSPlayerPawn(Pawn) != none)
                    {
                        // End:0x3A7
                        if(Action.bForceToVitalSuit)
                        {
                            LPBaseVSPlayerPawn(Pawn).OnAddRemoveAnimSets(Action);                            
                        }
                        else
                        {
                            // End:0x3EA
                            if(HumanPlayerPawn != none)
                            {
                                LPPlayerPawn(HumanPlayerPawn).OnAddRemoveAnimSets(Action);                                
                            }
                            else
                            {
                                RemoveFromPendingAnimSets(Action.AnimSets, false);
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function AllowAimDownSight()
{
    local /*0x97E50000-0x00000000*/ private bool bAllow[9437185];

    true
    bAimDownSightAllowed = bAllow;
    SetTimer(0.0100000, false, 'UpdateAimDownSight');
    //return;    
}

function UpdateAimDownSight()
{
    SetAimDownSightMode(WantsToAimDownSight());
    //return;    
}

function NotifyIsAimingDownSight()
{
    local /*0x97E50000-0x00000000*/ private bool bIsADS[8388609];

    // End:0x3D
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        ServerNotifyIsAimingDownSight(bIsADS);
    }
    // End:0x76
    if(MyPlayerPawn != none)
    {
        MyPlayerPawn.bAimingDownSightModeActive = bIsADS;
    }
    //return;    
}

reliable server function ServerNotifyIsAimingDownSight()
{
    local /*0x97E50000-0x00000000*/ private bool bIsADS[8388609];

    NotifyIsAimingDownSight(bIsADS);
    //return;    
}

function SetAimDownSightMode()
{
    local /*0x97E50000-0x00000000*/ private bool bAimDownSight[8388609];

    // End:0x38
    if(bAimDownSight && CanAimDownSight())
    {
        // End:0x35
        if(!IsAimingDownSight())
        {
            SetShoulderAimCam();
        }        
    }
    else
    {
        SetDefaultCamWithCurrentCamCheck(Class'LPCameraModeAimControlShoulder');
    }
    //return;    
}

function IsAimingDownSight()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2F
    if(MyPlayerPawn != none)
    {
        return MyPlayerPawn.bAimingDownSightModeActive;
    }
    return false;
    //return ReturnValue;    
}

function IsUsingScope()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SPIWeapon;

    // End:0x6F
    if(Pawn != none)
    {
        SPIWeapon = SPInventoryWeapon(Pawn.Weapon);
        // End:0x6F
        if(SPIWeapon != none)
        {
            return SPIWeapon.IsScopeActive();
        }
    }
    return false;
    //return ReturnValue;    
}

function CanAimDownSight()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((((((((((((bAimDownSightAllowed && !bCinematicMode) && !bIsInVitalSuit) && !SPPlayerCameraManager(PlayerCamera).GetCameraMode().IsA('LPCameraModeAimControlGrenade')) && !SPPlayerCameraManager(PlayerCamera).GetCameraMode().IsA('LPCameraModeAimControlAnimated')) && !IsDoingSpecialMove(Class'LPSM_PlayerMeleeTakedown')) && DoesPlayerCSAAllowWeapons()) && MyPlayerPawn != none) && ViewTarget == MyPlayerPawn) && MyPlayerPawn.IsAliveAndWell()) && !MyPlayerPawn.IsReloadingWeapon() || !MyPlayerPawn.WeaponHasReloadAnim()) && !MyPlayerPawn.bUseZiplineVSTransition) && MyPlayerPawn.CanFireWeapon(true)) && MyPlayerPawn.CanAim();
    //return ReturnValue;    
}

function CanReload()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((!bIsInVitalSuit && MyPlayerPawn != none) && !HasPendingWeapon()) && !MyPlayerPawn.Weapon.IsInState('WeaponEquipping');
    //return ReturnValue;    
}

function CanSwitchAmmoTypes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((CanReload()) && !IsDoingASpecialMove()) && LPWeapon(MyPlayerPawn.Weapon).CanSwitchAmmoTypes();
    //return ReturnValue;    
}

function ConditionalCancelPendingReload()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPIP;

    SPIP = SPInventoryPawn(Pawn);
    // End:0x164
    if(SPIP != none)
    {
        // End:0x164
        if(((SPIP.Weapon != none) && SPIP.Weapon.IsFiring()) && SPIP.Weapon.HasAmmo(SPIP.Weapon.CurrentFireMode))
        {
            // End:0x164
            if(SPIP.Weapon.PendingFire(2))
            {
                SPIP.Weapon.StopFire(2);
            }
        }
    }
    //return;    
}

function ClearAmmoTypeSwitch()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPIP;
    local /*0x97E50000-0x00000000*/ private int CurrentAmmoMode;

    SPIP = SPInventoryPawn(Pawn);
    // End:0x126
    if(SPIP != none)
    {
        SPIP.bWantsToPlaySwitchAmmoSequence = false;
        SPIP.bWantsToSwitchAmmoType = false;
        SPIP.DelayToSwitchAmmoType = 0.0000000;
        // End:0x126
        if(SPIP.Weapon != none)
        {
            CurrentAmmoMode = SPInventoryWeapon(SPIP.Weapon).AmmoTypeInfo.CurrentAmmoMode;
            ClientShowAmmoSwitchProgress(0.0000000, CurrentAmmoMode);
        }
    }
    //return;    
}

function AddWeaponToStorage_ByClass()
{
    local /*0x97E50000-0x00000000*/ private class NewWeaponClass[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewWeaponInfo;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponClassString;
    local /*0x97E50000-0x00000000*/ private class NewLPWeaponClass;
    local /*0x97E50000-0x00000000*/ private editfixedsize string Markup;

    // End:0x3C
    if((NewWeaponClass == none) || int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    WeaponClassString = PathName(NewWeaponClass);
    Idx = 0;
    J0x64:

    // End:0xC1 [Loop If]
    if(Idx < StoredWeaponsList.Length)
    {
        // End:0xB3
        if(StoredWeaponsList[Idx].WeaponName == WeaponClassString)
        {
            // [Explicit Break]
            goto J0xC1;
        }
        Idx++;
        // [Loop Continue]
        goto J0x64;
    }
    J0xC1:

    // End:0x2A3
    if(Idx == StoredWeaponsList.Length)
    {
        Markup = GetLocalizedStringMarkupPrefixFromWeaponClassPath(NewWeaponClass);
        NewWeaponInfo.WeaponName = WeaponClassString;
        NewWeaponInfo.WeaponIconName = NewWeaponClass.default.HUDIconName;
        NewWeaponInfo.WeaponFriendlyName = ("<Strings:" $ Markup) $ ".FriendlyName>";
        NewWeaponInfo.WeaponDescription = ("<Strings:" $ Markup) $ ".Description>";
        NewWeaponInfo.bCanEquip = NewWeaponClass.default.bCanEquip;
        NewLPWeaponClass = class<LPWeapon>(NewWeaponClass);
        // End:0x28D
        if(NewLPWeaponClass != none)
        {
            NewWeaponInfo.TuneDataUnloadedWeaponInfoString = PathName(NewLPWeaponClass.default.TuneDataUnloadedWeaponInfo);
        }
        StoredWeaponsList.AddItem(NewWeaponInfo);        
    }
    //return;    
}

function GetLocalizedStringMarkupPrefixFromWeaponClassPath()
{
    local /*0x97E50000-0x00000000*/ private class WeaponClass[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689], Markup;

    Markup = PathName(WeaponClass);
    // End:0x69
    if(InStr(Markup, "LostPlanetGameContent", false, true) >= 0)
    {
        Markup = Repl(Markup, "Content", "");
    }
    return Markup;
    //return ReturnValue;    
}

function AddWeaponToStorage_ByGiveWeaponTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL GiveWeaponTD[8388609], NewWeaponInfo;
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x3C
    if((GiveWeaponTD == none) || int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    Idx = 0;
    J0x47:

    // End:0xB9 [Loop If]
    if(Idx < StoredWeaponsList.Length)
    {
        // End:0xAB
        if(StoredWeaponsList[Idx].WeaponName == GiveWeaponTD.contentClassName)
        {
            // [Explicit Break]
            goto J0xB9;
        }
        Idx++;
        // [Loop Continue]
        goto J0x47;
    }
    J0xB9:

    // End:0x242
    if(Idx == StoredWeaponsList.Length)
    {
        NewWeaponInfo.WeaponName = GiveWeaponTD.contentClassName;
        NewWeaponInfo.WeaponIconName = GiveWeaponTD.HUDIconName;
        NewWeaponInfo.WeaponFriendlyName = GiveWeaponTD.GetWeaponFriendlyNameMarkup();
        NewWeaponInfo.WeaponDescription = GiveWeaponTD.GetWeaponDescriptionMarkup();
        NewWeaponInfo.bCanEquip = GiveWeaponTD.bCanEquip;
        NewWeaponInfo.TuneDataUnloadedWeaponInfoString = PathName(GiveWeaponTD);
        StoredWeaponsList.AddItem(NewWeaponInfo);        
    }
    //return;    
}

function IsWeaponUnlocked_ByContentClassName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string WeaponClassString[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return false;
    }
    Idx = 0;
    J0x36:

    // End:0x92 [Loop If]
    if(Idx < StoredWeaponsList.Length)
    {
        // End:0x84
        if(StoredWeaponsList[Idx].WeaponName == WeaponClassString)
        {
            return true;
        }
        Idx++;
        // [Loop Continue]
        goto J0x36;
    }
    return false;
    //return ReturnValue;    
}

function AddAmmoToMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string AmmoTDString[8388609];
    local /*0x97E50000-0x00000000*/ private int inAmount[8388609];
    local /*0x97E50000-0x00000000*/ private byte InOptions[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewAmmoInfo;
    local /*0x97E50000-0x00000000*/ private int Idx;

    0
    // End:0x31
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    // End:0x43
    if(AmmoTDString == "")
    {
        return;
    }
    Idx = 0;
    J0x4E:

    // End:0xAB [Loop If]
    if(Idx < StoredAmmoList.Length)
    {
        // End:0x9D
        if(StoredAmmoList[Idx].AmmoTuneDataString == AmmoTDString)
        {
            // [Explicit Break]
            goto J0xAB;
        }
        Idx++;
        // [Loop Continue]
        goto J0x4E;
    }
    J0xAB:

    // End:0x11D
    if(Idx == StoredAmmoList.Length)
    {
        NewAmmoInfo.AmmoTuneDataString = AmmoTDString;
        NewAmmoInfo.AmmoCount = 0;
        StoredAmmoList.AddItem(NewAmmoInfo);        
    }
    StoredAmmoList[Idx].AmmoCount += inAmount;
    // End:0x1A2
    if(StoredAmmoList[Idx].AmmoCount < 0)
    {
        StoredAmmoList[Idx].AmmoCount = 0;
    }
    // End:0x1DF
    if(int(InOptions) == int(1))
    {
        StoredAmmoList[Idx].bInfiniteAmmo = true;
    }
    //return;    
}

function IsAmmoTypeStringInMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string AmmoTDString[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x67 [Loop If]
    if(Idx < StoredAmmoList.Length)
    {
        // End:0x59
        if(StoredAmmoList[Idx].AmmoTuneDataString == AmmoTDString)
        {
            return true;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

function GetAmmoCountInMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private @NULL AmmoTD[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Idx;
    local /*0x97E50000-0x00000000*/ private editfixedsize string AmmoTDString;

    // End:0x3C
    if((AmmoTD == none) || int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return 0;
    }
    AmmoTDString = string(AmmoTD.Name);
    Idx = 0;
    J0x71:

    // End:0x123 [Loop If]
    if(Idx < StoredAmmoList.Length)
    {
        // End:0x115
        if(StoredAmmoList[Idx].AmmoTuneDataString == AmmoTDString)
        {
            return ((StoredAmmoList[Idx].bInfiniteAmmo) ? -1 : StoredAmmoList[Idx].AmmoCount);
        }
        Idx++;
        // [Loop Continue]
        goto J0x71;
    }
    return 0;
    //return ReturnValue;    
}

function GetAmmoCountInMunitionsLockerFromString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string AmmoTDString[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], Idx;

    Idx = 0;
    J0x0B:

    // End:0xBD [Loop If]
    if(Idx < StoredAmmoList.Length)
    {
        // End:0xAF
        if(StoredAmmoList[Idx].AmmoTuneDataString == AmmoTDString)
        {
            return ((StoredAmmoList[Idx].bInfiniteAmmo) ? -1 : StoredAmmoList[Idx].AmmoCount);
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return 0;
    //return ReturnValue;    
}

function ChangeAmmo()
{
    // End:0x36
    if(CanSwitchAmmoTypes())
    {
        SPInventoryPawn(Pawn).ChangeAmmo();
    }
    //return;    
}

function Reload()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPVSFPP, GrenadePrime;
    local /*0x97E50000-0x00000000*/ private bool bGrenadePrimed;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x2E0
    if(Pawn != none)
    {
        // End:0xDB
        if(bIsInVitalSuit)
        {
            // End:0xD8
            if(bPressed)
            {
                LPVSFPP = LPVSFuturePlayerPawn(Pawn);
                // End:0xD8
                if(LPVSFPP != none)
                {
                    I = 0;
                    J0x5F:

                    // End:0xD8 [Loop If]
                    if(I < LPVSFPP.VSWeapons.Length)
                    {
                        LPVSFPP.VSWeapons[I].ForceReload();
                        I++;
                        // [Loop Continue]
                        goto J0x5F;
                    }
                }
            }            
        }
        else
        {
            bGrenadePrimed = false;
            // End:0x1BE
            if(bPressed && MyPlayerPawn != none)
            {
                GrenadePrime = LPSM_GrenadePrime(MyPlayerPawn.GetCurrentSpecialMoveInstance());
                bGrenadePrimed = GrenadePrime != none;
                // End:0x1BE
                if(bGrenadePrimed)
                {
                    // End:0x1BE
                    if(GrenadePrime.CanBeAborted())
                    {
                        MyPlayerPawn.BroadcastSMMessageToAll(1, Class'LPSMMTypes'.default.SMM_GrenadeAborted, self);
                    }
                }
            }
            // End:0x210
            if((bPressed && MyPlayerPawn != none) && bMunitionsLockerReloadEnabled)
            {
                MyPlayerPawn.ServerReplenishAmmoFromMunitionsLocker(self, false);                
            }
            else
            {
                // End:0x26F
                if(!bPressed)
                {
                    // End:0x26C
                    if(SPInventoryPawn(Pawn).DelayToSwitchAmmoType > float(0))
                    {
                        ClearAmmoTypeSwitch();
                        super(SPPlayerController).Reload(bPressed);
                    }                    
                }
                else
                {
                    // End:0x2E0
                    if(CanSwitchAmmoTypes())
                    {
                        SPInventoryPawn(Pawn).ChangeAmmo(SPInventoryPawn(Pawn).TuneDataBasePawn.DelayToSwitchAmmoTypes);
                    }
                }
            }
        }
    }
    //return;    
}

function OnReloadWeaponBegin()
{
    super.OnReloadWeaponBegin();
    SetAimDownSightMode(false);
    //return;    
}

function OnReloadWeaponFinished()
{
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    super(SPPlayerController).OnReloadWeaponFinished(bInterrupted);
    UpdateAimDownSight();
    //return;    
}

function SwitchPlayerWeaponButtonPress()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

    // End:0x161
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0x15F
        if(MyPlayerPawn != none)
        {
            // End:0xA2
            if(bPressed)
            {
                PlayerMoveInfo.bPlayerWeaponSwitchPressed = true;
                PlayerMoveInfo.PlayerSwitchWeaponPressedTimeStamp = WorldInfo.TimeSeconds;                
            }
            else
            {
                // End:0x140
                if(PlayerMoveInfo.bPlayerWeaponSwitchPressed)
                {
                    // End:0x140
                    if((WorldInfo.TimeSeconds - PlayerMoveInfo.PlayerSwitchWeaponPressedTimeStamp) < MyPlayerPawn.TuneDataPlayerPawn.SwitchToPistolButtonHoldTime)
                    {
                        NextWeapon();
                    }
                }
                PlayerMoveInfo.bPlayerWeaponSwitchPressed = false;
            }
        }
        return;
    }
    // End:0x178
    if(bPressed)
    {
        NextWeapon();
    }
    //return;    
}

function CanDoSwitchToPistol()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(MyPlayerPawn == none)
    {
        return false;
    }
    // End:0x87
    if((WorldInfo.TimeSeconds - PlayerMoveInfo.PlayerSwitchWeaponPressedTimeStamp) < MyPlayerPawn.TuneDataPlayerPawn.SwitchToPistolButtonHoldTime)
    {
        return false;
    }
    // End:0xB6
    if(((IsMoveInputIgnored()) || !DoesPlayerCSAAllowWeapons()) || PlayerIsDoingVSTransition())
    {
        return false;
    }
    // End:0x101
    if(IsDoingASpecialMove() && !MyPlayerPawn.GetCurrentSpecialMoveInstance().CanBeInterruptedBySwitchWeapon())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function DoSwitchToPistol()
{
    local /*0x97E50000-0x00000000*/ private @NULL W;

    // End:0x2F
    if(LPWeaponPistol(Pawn.Weapon) != none)
    {
        return;
    }
    W = LPWeaponPistol(Pawn.FindInventoryType(Class'LPWeaponPistol', true));
    // End:0xB7
    if(W != none)
    {
        Pawn.InvManager.SetCurrentWeapon(W);
    }
    //return;    
}

function IsValidNextWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL W[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4B
    if(LPWeaponPistol(W) != none)
    {
        // End:0x49
        if(PlayerMoveInfo.bPlayerWeaponSwitchPressed && CanDoSwitchToPistol())
        {
            return true;
        }
        return false;
    }
    return true;
    //return ReturnValue;    
}

exec function NextWeaponAutoSwitch()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPIM;

    LPIM = LPInventoryManager(Pawn.InvManager);
    // End:0x77
    if(LPIM.GetNextWeapon(true).HasAnyAmmo())
    {
        NextWeapon();        
    }
    else
    {
        DoSwitchToPistol();
    }
    //return;    
}

exec function NextWeapon()
{
    // End:0x11
    if(MyPlayerPawn == none)
    {
        return;
    }
    // End:0x5C
    if(IsDoingASpecialMove() && !MyPlayerPawn.GetCurrentSpecialMoveInstance().CanBeInterruptedBySwitchWeapon())
    {
        return;
    }
    ClearAmmoTypeSwitch();
    super(PlayerController).NextWeapon();
    //return;    
}

exec function NextVSWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    // End:0x26
    if(WorldInfo.Pauser != none)
    {
        return;
    }
    // End:0xDA
    if(Pawn.InvManager != none)
    {
        vsPawn = LPVSPlayerPawn(Pawn);
        // End:0xDA
        if((vsPawn != none) && !vsPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_NewVSRightArmPartSwitchRequest, self))
        {
            vsPawn.NextVSWeapon();
        }
    }
    //return;    
}

function StartVSFire()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609], FireModeNum;

    WantsToFireVS[int(WeaponID)] = FireModeNum;
    // End:0x74
    if(VSFirePausedRefCount[int(WeaponID)] < 1)
    {
        LPVSFuturePlayerPawn(Pawn).StartVSFire(WeaponID, FireModeNum);
    }
    //return;    
}

function StopVSFire()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609], FireModeNum;

    WantsToFireVS[int(WeaponID)] = 255;
    LPVSFuturePlayerPawn(Pawn).StopVSFire(WeaponID, FireModeNum);
    //return;    
}

function PauseVSFire()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609];

    VSFirePausedRefCount[int(WeaponID)]++;
    // End:0x7D
    if(int(WantsToFireVS[int(WeaponID)]) < int(255))
    {
        LPVSFuturePlayerPawn(Pawn).StopVSFire(WeaponID, WantsToFireVS[int(WeaponID)]);
    }
    //return;    
}

function UnPauseVSFire()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609];

    VSFirePausedRefCount[int(WeaponID)]--;
    // End:0x91
    if(VSFirePausedRefCount[int(WeaponID)] < 1)
    {
        // End:0x7A
        if(int(WantsToFireVS[int(WeaponID)]) < int(255))
        {
            StartVSFire(WeaponID, WantsToFireVS[int(WeaponID)]);
        }
        VSFirePausedRefCount[int(WeaponID)] = 0;
    }
    //return;    
}

function UnPauseAllVSFire()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x3F [Loop If]
    if(I < 2)
    {
        WantsToFireVS[I] = 255;
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    I = 0;
    J0x4A:

    // End:0x7D [Loop If]
    if(I < 2)
    {
        VSFirePausedRefCount[I] = 0;
        I++;
        // [Loop Continue]
        goto J0x4A;
    }
    //return;    
}

simulated function IsVSFiring()
{
    local /*0x97E50000-0x00000000*/ private byte WeaponID[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if((int(WeaponID) == int(1)) && PlayerMoveInfo.bRightArmPrimaryActionPressed)
    {
        return true;
    }
    // End:0x5A
    if(int(WantsToFireVS[int(WeaponID)]) < int(255))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function UpdateAmmoTypeSwitch()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SPIP;
    local /*0x97E50000-0x00000000*/ private bool bAlreadyReloading;
    local /*0x97E50000-0x00000000*/ private float progressPercent, MaxDelay;
    local /*0x97E50000-0x00000000*/ private int CurrentAmmoMode;

    // End:0x20
    if((Pawn == none) || bIsInVitalSuit)
    {
        return;
    }
    SPIP = SPInventoryPawn(Pawn);
    // End:0x35E
    if((SPIP != none) && SPIP.bWantsToSwitchAmmoType)
    {
        SPIP.DelayToSwitchAmmoType -= DeltaTime;
        // End:0x1CB
        if((CanSwitchAmmoTypes()) && SPIP.NextAmmoType(true))
        {
            MaxDelay = SPIP.TuneDataBasePawn.DelayToSwitchAmmoTypes;
            // End:0x1CB
            if(MaxDelay > float(0))
            {
                progressPercent = (MaxDelay - SPIP.DelayToSwitchAmmoType) / MaxDelay;
                CurrentAmmoMode = SPInventoryWeapon(SPIP.Weapon).AmmoTypeInfo.CurrentAmmoMode;
                ClientShowAmmoSwitchProgress(progressPercent, CurrentAmmoMode);
            }
        }
        // End:0x35E
        if(SPIP.DelayToSwitchAmmoType <= float(0))
        {
            bAlreadyReloading = SPIP.IsDoingSpecialMove_OF_Class(Class'SPEngine.SPSM_ReloadWeaponBase');
            // End:0x271
            if(!bAlreadyReloading && !CanSwitchAmmoTypes())
            {
                SPIP.bWantsToSwitchAmmoType = false;
                ForceReload();
                return;
            }
            // End:0x2AB
            if(SPIP.NextAmmoType())
            {
                ClientShowAmmoSelection();
                ForceReload();                
            }
            else
            {
                SPIP.bWantsToPlaySwitchAmmoSequence = false;
                CurrentAmmoMode = SPInventoryWeapon(SPIP.Weapon).AmmoTypeInfo.CurrentAmmoMode;
                ClientShowAmmoSwitchProgress(0.0000000, CurrentAmmoMode);
            }
            SPIP.bWantsToSwitchAmmoType = false;
        }
    }
    //return;    
}

function ClientShowAmmoSwitchProgress()
{
    local /*0x97E50000-0x00000000*/ private float progressPercent[8388609];
    local /*0x97E50000-0x00000000*/ private int CurrentAmmoMode[8388609];

    LPHUD(myHUD).ShowAmmoSwitchProgress(progressPercent, CurrentAmmoMode);
    //return;    
}

function ClientShowAmmoSelection()
{
    UpdateAmmoTypeTutorial(Pawn.Weapon);
    LPHUD(myHUD).ShowAmmoModeSwitch(SPInventoryWeapon(Pawn.Weapon).AmmoTypeInfo.CurrentAmmoMode);
    //return;    
}

final event HideCrosshair()
{
    local /*0x97E50000-0x00000000*/ private bool bHide[8388609];

    // End:0x32
    if(!bHide && bMissionFailed || IsInState('Dead'))
    {
        return;
    }
    // End:0x6A
    if(myLPHUD != none)
    {
        myLPHUD.HideCrosshair(bHide);
    }
    //return;    
}

function AllowedToAbortRepair()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bMP, bAllowedToAbort;

    bMP = int(WorldInfo.NetMode) != int(NM_Standalone);
    bAllowedToAbort = ((bMP) ? true : ((NextRepairStopTime > float(0)) ? WorldInfo.TimeSeconds > NextRepairStopTime : true));
    return bAllowedToAbort;
    //return ReturnValue;    
}

function @NULL RepairVS()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];
    local /*0x97E50000-0x00000400*/ private @NULL RepairComp;
    local /*0x97E50000-0x00000000*/ private bool bPCBuild, bAllowedToRepair, bMP;

    bMP = int(WorldInfo.NetMode) != int(NM_Standalone);
    bAllowedToRepair = ((bMP) ? true : ((NextRepairTime > float(0)) ? WorldInfo.TimeSeconds > NextRepairTime : true));
    // End:0x33C
    if((Pawn != none) && !bIsInVitalSuit)
    {
        // End:0xFF
        if(!bPressed && MyPlayerPawn.bWantsToRepair)
        {
            // End:0xFC
            if(IsDoingSpecialMove(Class'LPSM_PlayerRepairSimple'))
            {
                EndSpecialMove();
            }            
        }
        else
        {
            // End:0x33C
            if((((bPressed && !IsDoingASpecialMove()) && MyPlayerPawn.bCanRepair) && MyPlayerPawn.ClosestValidRepairableActor != none) && bAllowedToRepair)
            {
                RepairComp = Class'LPSM_PlayerRepairBase'.static.GetRepairComponent(MyPlayerPawn.ClosestValidRepairableActor);
                bPCBuild = !WorldInfo.IsConsoleBuild(0);
                // End:0x33C
                if(RepairComp != none)
                {
                    // End:0x297
                    if((RepairComp.bUseSimpleRepair || bPCBuild && !PlayerInput.bUsingGamepad) || bMP)
                    {
                        DoSpecialMove(Class'LPSM_PlayerRepairSimple',,,, MyPlayerPawn.ClosestValidRepairableActor);                        
                    }
                    else
                    {
                        DoSpecialMove(Class'LPSM_PlayerRepairMinigame',,,, MyPlayerPawn.ClosestValidRepairableActor);
                    }
                    NextRepairTime = (WorldInfo.TimeSeconds + MinimumDurationOfRepair) + MinimumTimeBetweenRepairs;
                    NextRepairStopTime = WorldInfo.TimeSeconds + MinimumDurationOfRepair;
                }
            }
        }
    }
    //return;    
}

reliable server function ServerEndRepair()
{
    // End:0x2F
    if(MyPlayerPawn != none)
    {
        MyPlayerPawn.EndCurrentSpecialMove();
    }
    //return;    
}

function OnSetAmbientTemperature()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    SetAmbientTemperature(inAction.TargetTemperature);
    SetAmbientTemperatureChangeRate(inAction.TemperatureChangeRate);
    //return;    
}

reliable client simulated function SetAmbientTemperature()
{
    local /*0x97E50000-0x00000000*/ private float temperature[8388609];

    CurrentAmbientTemperature = temperature;
    //return;    
}

reliable client simulated function SetAmbientTemperatureChangeRate()
{
    local /*0x97E50000-0x00000000*/ private float changeRate[8388609];

    AmbientTemperatureChangeRate = changeRate;
    //return;    
}

function OnVSEnvironmentalMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x59
    if(Action.InputLinks[0].bHasImpulse && bIsInVitalSuit)
    {
        ClientDrawVSEnvironmentalMessage(Action);
    }
    //return;    
}

function OnJobLog()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    //return;    
}

function OnOpenShopContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x91
    if(myLPHUD != none)
    {
        myLPHUD.ShowShop(true, Action.GFxFlashMovie, Action.ShopType, Action);
        DoSpecialMove(none, true);
        GotoState('PlayerInShop');
    }
    //return;    
}

function ShopFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    //return;    
}

function OnOpenElevatorLevelSelectorContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x56
    if(myLPHUD != none)
    {
        myLPHUD.ShowElevatorLevelSelector(true, Action.GFxFlashMovie, Action);
    }
    //return;    
}

function OnOpenFrontEndContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    //return;    
}

function InitCameraModes()
{
    //return;    
}

function ResetCameraBehindTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL CameraMode;

    CameraMode = SPCameraModeAimControl(GetCurrentCameraMode());
    // End:0x4B
    if(CameraMode != none)
    {
        CameraMode.ResetCameraBehindTarget();
    }
    //return;    
}

reliable client simulated function ClientSetRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewRotation[8388609];
    local /*0x97E50000-0x00000000*/ private bool bResetCamera[9437185];

    super(Controller).ClientSetRotation(NewRotation, bResetCamera);
    // End:0x3E
    if(bResetCamera)
    {
        SetTimer(0.0010000, false, 'ResetCameraBehindTarget');
    }
    //return;    
}

event ResetCameraMode()
{
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPBaseVSPlayerPawn(Pawn);
    super(SPGFPlayerController).ResetCameraMode(bVehicleTransition || vsPawn != none);
    SetDefaultCam(VSCamTransitionInParam);
    //return;    
}

function OnSetCameraModeParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqAct[8388609], ParamCopy, CameraManager, CurrentCameraMode, CurrentCameraModeParam;

    // End:0x26
    if(SeqAct.CameraModeParam == none)
    {
        return;
    }
    ParamCopy = Class'SPCamera.SPCameraTypeBase'.static.CopyCameraModeParams(SeqAct.CameraModeParam);
    // End:0x7E
    if(ParamCopy == none)
    {
        return;
    }
    // End:0xC9
    if(ParamCopy.Class == Class'LPCameraModeAimControlFirstPersonParam')
    {
        FirstPersonAimCamParams = LPCameraModeAimControlFirstPersonParam(ParamCopy);        
    }
    else
    {
        // End:0x114
        if(ParamCopy.Class == Class'LPCameraModeAimControlThirdPersonParam')
        {
            ThirdPersonAimCamParams = LPCameraModeAimControlThirdPersonParam(ParamCopy);            
        }
        else
        {
            // End:0x15F
            if(ParamCopy.Class == Class'LPCameraModeAimControlJobLogParam')
            {
                JobLogCamParams = LPCameraModeAimControlJobLogParam(ParamCopy);                
            }
            else
            {
                // End:0x1AA
                if(ParamCopy.Class == Class'LPCameraModeAimControlRagdollParam')
                {
                    RagdollCamParams = LPCameraModeAimControlRagdollParam(ParamCopy);                    
                }
                else
                {
                    // End:0x1D9
                    if(ParamCopy.Class == Class'LPCameraModeAimControlShoulderParam')
                    {                        
                    }
                    else
                    {
                        // End:0x224
                        if(ParamCopy.Class == Class'LPCameraModeAimControlGrenadeParam')
                        {
                            GrenadeAimCamParams = LPCameraModeAimControlGrenadeParam(ParamCopy);                            
                        }
                        else
                        {
                            // End:0x26F
                            if(ParamCopy.Class == Class'SPCamera.SPCameraModeZoomToTargetParam')
                            {
                                DeathCameraZoomCamParams = SPCameraModeZoomToTargetParam(ParamCopy);                                
                            }
                            else
                            {
                                // End:0x2BA
                                if(ParamCopy.Class == Class'LPCameraModeIncapacitatedThirdPersonParam')
                                {
                                    IncapacitatedCameraParams = LPCameraModeIncapacitatedThirdPersonParam(ParamCopy);                                    
                                }
                                else
                                {
                                    // End:0x305
                                    if(ParamCopy.Class == Class'LPCameraModeAimControlInPlaceRepairParam')
                                    {
                                        InPlaceRepairCamParams = LPCameraModeAimControlInPlaceRepairParam(ParamCopy);                                        
                                    }
                                    else
                                    {
                                        return;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    CameraManager = SPPlayerCameraManager(PlayerCamera);
    // End:0x392
    if(CameraManager != none)
    {
        CurrentCameraMode = CameraManager.GetCameraMode();
        // End:0x392
        if(CurrentCameraMode != none)
        {
            CurrentCameraModeParam = CurrentCameraMode.Params;
        }
    }
    // End:0x3FA
    if((CurrentCameraModeParam != none) && CurrentCameraModeParam.Class == ParamCopy.Class)
    {
        ChangeCameraMode(ParamCopy, none);
    }
    //return;    
}

exec function DEBUG_SetCrouchZFilter()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    CrouchAimCamParams.bFilterZLocation = bEnable;
    //return;    
}

exec function DEBUG_SetCrouchZFilterRate()
{
    local /*0x97E50000-0x00000000*/ private float InRate[8388609];

    CrouchAimCamParams.LocationZFilterRate = InRate;
    //return;    
}

function ChangeCameraMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL modeParams[8388609], TransitionParams;
    local /*0x97E50000-0x00000000*/ private name optLayerName[9437185];
    local /*0x97E50000-0x00000000*/ private bool bDisregardIfSame[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CameraManager, CurrentWeapon;

    'Default'
    false
    // End:0x7B
    if((HumanPlayerPawn != none) && HumanPlayerPawn.Weapon != none)
    {
        CurrentWeapon = LPWeapon(HumanPlayerPawn.Weapon);        
    }
    else
    {
        // End:0xE1
        if((Pawn != none) && Pawn.Weapon != none)
        {
            CurrentWeapon = LPWeapon(Pawn.Weapon);
        }
    }
    // End:0x124
    if(CurrentWeapon != none)
    {
        CurrentWeapon.NotifyEnteringADS(SPCameraModeAimControlWeaponShoulderParam(modeParams) != none);
    }
    CameraManager = SPPlayerCameraManager(PlayerCamera);
    // End:0x194
    if(CameraManager != none)
    {
        CameraManager.SetCameraMode(modeParams, TransitionParams, optLayerName, bDisregardIfSame, true);
    }
    //return;    
}

function OnWeaponZoomLevelChange()
{
    local /*0x97E50000-0x00000000*/ private bool bWasAimDownSightActive[8388609], bWasScopeActive;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentWeapon, MySPGFAimController;
    local /*0x97E50000-0x00000000*/ private bool bIsScopeActive, bIsAimDownSightActive;
    local /*0x97E50000-0x00000000*/ private editfixedsize string ScopeTypeString;

    // End:0x69
    if((HumanPlayerPawn != none) && HumanPlayerPawn.Weapon != none)
    {
        CurrentWeapon = LPWeapon(HumanPlayerPawn.Weapon);        
    }
    else
    {
        // End:0xCF
        if((Pawn != none) && Pawn.Weapon != none)
        {
            CurrentWeapon = LPWeapon(Pawn.Weapon);
        }
    }
    // End:0x264
    if(CurrentWeapon != none)
    {
        bIsScopeActive = CurrentWeapon.IsScopeActive();
        bIsAimDownSightActive = CurrentWeapon.IsAimDownSightActive();
        // End:0x15B
        if(bIsAimDownSightActive && bWasAimDownSightActive)
        {
            SetShoulderAimCam();            
        }
        else
        {
            SetAimDownSightMode(bIsAimDownSightActive);
        }
        // End:0x1FB
        if(myHUD != none)
        {
            ScopeTypeString = CurrentWeapon.GetScopeTypeString();
            SetScopeActive(ScopeTypeString, bIsScopeActive, ((ScopeTypeString == "None") ? 0 : int(CurrentWeapon.ZoomLevel)));
        }
        // End:0x264
        if(bWasScopeActive && !bIsScopeActive)
        {
            MySPGFAimController = SPGFAimControlPlayerControlled(GetAimController());
            // End:0x264
            if(MySPGFAimController != none)
            {
                MySPGFAimController.ResetFloatingAimToCenter();
            }
        }
    }
    //return;    
}

simulated function IsGrappling()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bIsGrappling;

    bIsGrappling = (((MyPlayerPawn.bGrappleHooked || IsInState('PlayerGrappling')) || IsInState('PlayerGrapplingDown')) || IsInState('PlayerFallGrappelRecovery')) || IsInState('PlayerFallRappelRecovery');
    return bIsGrappling;
    //return ReturnValue;    
}

exec function RotateCamera180Degrees()
{
    local /*0x97E50000-0x00000000*/ private @NULL CameraMgr, CameraRot, CameraDelta;
    local /*0x97E50000-0x00000000*/ private bool IsGrappling;

    // End:0x0F
    if(IsLookInputIgnored())
    {
        return;
    }
    // End:0x1E
    if(IsForcedCameraRotationInProgress())
    {
        return;
    }
    // End:0x75
    if((bIsInVitalSuit || MyPlayerPawn.bUseZiplineVSTransition) || MyPlayerPawn.bIsUnderMatineeControl)
    {
        return;
    }
    IsGrappling = (((MyPlayerPawn.bGrappleHooked || IsInState('PlayerGrappling')) || IsInState('PlayerGrapplingDown')) || IsInState('PlayerFallGrappelRecovery')) || IsInState('PlayerFallRappelRecovery');
    // End:0x11D
    if(MyPlayerPawn.IsDoingASpecialMove() && IsGrappling == false)
    {
        return;
    }
    CameraDelta.Yaw = int((float(65536) / 360.0000000) * 180.0000000);
    // End:0x1E6
    if(IsGrappling)
    {
        CameraMgr = SPPlayerCameraManager(PlayerCamera);
        CameraRot = CameraMgr.GetCameraRotation();
        CameraDelta.Pitch = CameraRot.Pitch * -2;        
    }
    else
    {
        CameraDelta.Pitch = 0;
    }
    CameraDelta.Roll = 0;
    InitiateForcedCameraRotation(CameraDelta, Rotate180Duration);
    //return;    
}

function InitiateForcedCameraRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL RotationDelta[8388609];
    local /*0x97E50000-0x00000000*/ private float RotationDuration[8388609];

    ForcedCameraRotationInfo.DurationTotal = RotationDuration;
    ForcedCameraRotationInfo.TimeIntoRotation = 0.0000000;
    ForcedCameraRotationInfo.CameraDeltaTotal = RotationDelta;
    ForcedCameraRotationInfo.CameraDeltaRotated.Yaw = 0;
    ForcedCameraRotationInfo.CameraDeltaRotated.Pitch = 0;
    ForcedCameraRotationInfo.CameraDeltaRotated.Roll = 0;
    //return;    
}

function SetScopeActive()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ScopeTypeString[8388609];
    local /*0x97E50000-0x00000000*/ private bool bActive[8388609];
    local /*0x97E50000-0x00000000*/ private int ZoomLevel[9437185];

    0
    SetHumanOwnerNoSee(bActive);
    // End:0x9A
    if(myLPHUD != none)
    {
        myLPHUD.SetScopeActive(ScopeTypeString, bActive, ZoomLevel);
        // End:0x86
        if(bActive)
        {
            SetTimer(0.0500000, true, 'UpdateScope');            
        }
        else
        {
            ClearTimer('UpdateScope');
        }
    }
    //return;    
}

function UpdateScope()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyAimController;

    // End:0x10C
    if(myLPHUD != none)
    {
        // End:0x10C
        if(MyPlayerPawn != none)
        {
            MyAimController = MyPlayerPawn.GetAimController();
            // End:0xE8
            if((MyAimController != none) && MyAimController.GetAimCollisionActor() != none)
            {
                myLPHUD.SetScopeRange(VSize(MyPlayerPawn.Location - MyAimController.GetAimCollisionPoint()) * 0.0100000);                
            }
            else
            {
                myLPHUD.SetScopeRange(-1.0000000);
            }
        }
    }
    //return;    
}

function CutCameraModeInternalParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL CameraMgr, CurMode;

    CameraMgr = SPPlayerCameraManager(PlayerCamera);
    // End:0x82
    if(CameraMgr != none)
    {
        CurMode = CameraMgr.GetCameraMode();
        // End:0x82
        if(CurMode != none)
        {
            CurMode.IgnoreBlend();
        }
    }
    //return;    
}

function SetHumanOwnerNoSee()
{
    local /*0x97E50000-0x00000000*/ private bool bHide[8388609];

    // End:0x78
    if(IsLocalPlayerController())
    {
        // End:0x78
        if(MyPlayerPawn != none)
        {
            MyPlayerPawn.bDesiresLocalInvisibility = bHide;
            Class'SPCamera.SPCameraRigOffset'.static.SetLocalPlayerInvisibility(MyPlayerPawn, bHide);
        }
    }
    //return;    
}

function SetDefaultCam()
{
    local /*0x97E50000-0x00000000*/ private @NULL TransitionParams[9437185], CameraManager, VSCameraParams, TuneDataVSPlayerPawn, SPIW;

    local /*0x97E50000-0x00000000*/ private int LayerIdx;

    // End:0x12
    if(Pawn == none)
    {
        return;
    }
    // End:0x62
    if(TransitionParams == none)
    {
        // End:0x4F
        if(LPPlayerPawn(Pawn) != none)
        {
            TransitionParams = ThirdPersonAimTransitionParam;            
        }
        else
        {
            TransitionParams = FirstPersonAimTransitionParam;
        }
    }
    CameraManager = SPPlayerCameraManager(PlayerCamera);
    // End:0x190
    if((CameraManager != none) && CameraManager.CurrentCamType != none)
    {
        LayerIdx = CameraManager.CurrentCamType.FindLayerByName('DesignerOverride');
        // End:0x190
        if(LayerIdx > 0)
        {
            // End:0x190
            if(CameraManager.CurrentCamType.Layers[LayerIdx].CurrentCamMode != none)
            {
                CameraManager.ClearCameraMode('DesignerOverride', TransitionParams);
            }
        }
    }
    // End:0x286
    if(bIsInVitalSuit)
    {
        // End:0x243
        if(LPBaseVSPlayerPawn(Pawn) != none)
        {
            TuneDataVSPlayerPawn = LPBaseVSPlayerPawn(Pawn).TuneDataVSPlayerPawn;
            // End:0x243
            if((TuneDataVSPlayerPawn != none) && TuneDataVSPlayerPawn.VSCameraParams != none)
            {
                VSCameraParams = TuneDataVSPlayerPawn.VSCameraParams;
            }
        }
        // End:0x265
        if(VSCameraParams == none)
        {
            VSCameraParams = FirstPersonAimCamParams;
        }
        ChangeCameraMode(VSCameraParams, TransitionParams);        
    }
    else
    {
        // End:0x2C9
        if(Pawn.bIsCrouched)
        {
            ChangeCameraMode(CrouchAimCamParams, TransitionParams);            
        }
        else
        {
            ChangeCameraMode(ThirdPersonAimCamParams, TransitionParams);
        }
        SPIW = SPInventoryWeapon(Pawn.Weapon);
        // End:0x346
        if(SPIW != none)
        {
            SPIW.RecoilEnd();
        }
    }
    //return;    
}

function SetDefaultCamWithCurrentCamCheck()
{
    local /*0x97E50000-0x00000000*/ private class NeededCamMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TransitionParams[9437185], CurrentCameraMode;

    CurrentCameraMode = SPPlayerCameraManager(PlayerCamera).GetCameraMode();
    // End:0x84
    if((CurrentCameraMode == none) || ClassIsChildOf(CurrentCameraMode.Class, NeededCamMode))
    {
        SetDefaultCam(TransitionParams);
    }
    //return;    
}

function ClearAnimatedCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL CamMan;

    CamMan = SPPlayerCameraManager(PlayerCamera);
    // End:0x54
    if(CamMan != none)
    {
        CamMan.ClearCameraMode('Cinematic');
    }
    //return;    
}

function SetShoulderAimCam()
{
    local /*0x97E50000-0x00000000*/ private name LayerName;
    local /*0x97E50000-0x00000000*/ private @NULL CurrentWeapon, CameraManager, AimCamParams, CurrentLink;

    CurrentWeapon = LPWeapon(Pawn.Weapon);
    // End:0x114
    if(CurrentWeapon != none)
    {
        AimCamParams = CurrentWeapon.GetADSCameraParamOverride();
        // End:0x114
        if(AimCamParams != none)
        {
            // End:0xE3
            if(AimCamParams.bShouldOverrideTransitionDuration)
            {
                LPCameraTransitionCubicParam(ShoulderAimTransitionParam).Duration = AimCamParams.TransitionDurationSeconds;                
            }
            else
            {
                LPCameraTransitionCubicParam(ShoulderAimTransitionParam).Duration = SavedShoulderTransitionDuration;
            }
        }
    }
    // End:0x3D5
    if(AimCamParams != none)
    {
        EndSprint(true);
        CurrentLink = SPGFCoverLink(SPGFCoverPawn(Pawn).CurrentLink);
        // End:0x1BF
        if((CurrentLink != none) && CurrentLink.bNo360AimingAllowed)
        {
            AimCamParams.LookAroundClampYaw = 85.0000000;
        }
        LayerName = 'Default';
        CameraManager = SPPlayerCameraManager(PlayerCamera);
        // End:0x3AF
        if(CameraManager != none)
        {
            // End:0x3AF
            if(CameraManager.CurrentCamType.CurrentCamMode != none)
            {
                // End:0x3AF
                if(CameraManager.CurrentCamType.IsHighestActiveLayer('Designer'))
                {
                    // End:0x3AF
                    if(CameraManager.CurrentCamType.CurrentCamMode.Params.bAllowShoulderAimOverrideOnKismetLayer)
                    {
                        LayerName = 'DesignerOverride';
                        // End:0x3AF
                        if(SPGFCoverLink(SPGFCoverPawn(Pawn).CurrentLink).bNo360AimingAllowed)
                        {
                            AimCamParams.LookAroundClampYaw = CameraManager.CurrentCamType.CurrentCamMode.Params.ShoulderAimOverrideLookAroundClampYaw;
                        }
                    }
                }
            }
        }
        ChangeCameraMode(AimCamParams, ShoulderAimTransitionParam, LayerName);
    }
    //return;    
}

function SetCrouchCam()
{
    ChangeCameraMode(CrouchAimCamParams, CrouchAimTransitionParam);
    //return;    
}

function SetRollCam()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CameraMgr, ThirdPersonCamMode;

    CameraMgr = SPPlayerCameraManager(PlayerCamera);
    // End:0x95
    if(CameraMgr != none)
    {
        ThirdPersonCamMode = SPCameraModeAimControlThirdPerson(CameraMgr.GetCameraMode());
        // End:0x95
        if(ThirdPersonCamMode != none)
        {
            ThirdPersonCamMode.SetIsRollingOrDodging(bEnable);
        }
    }
    AllowAimDownSight(!bEnable);
    //return;    
}

function SetJobLogCam()
{
    ChangeCameraMode(JobLogCamParams, JobLogTransitionInParam);
    CutCameraModeInternalParams();
    //return;    
}

function SetInPlaceRepairCam()
{
    ChangeCameraMode(InPlaceRepairCamParams, ThirdPersonAimTransitionParam);
    //return;    
}

function SetRagdollCam()
{
    ChangeCameraMode(RagdollCamParams, RagdollTransitionInParam);
    //return;    
}

function SetGrenadeCam()
{
    ChangeCameraMode(GrenadeAimCamParams, GrenadeAimTransitionParam);
    //return;    
}

function EndGrenadeCam()
{
    SetDefaultCamWithCurrentCamCheck(Class'LPCameraModeAimControlGrenade', GrenadeAimTransitionParam);
    //return;    
}

function SetVSRepairCam()
{
    ChangeCameraMode(VSRepairCamParams, VSRepairTransitionParam);
    //return;    
}

event CanUseAnimatedCamera()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetCurrentCameraMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], CameraManager, CurrentCameraMode;

    CurrentCameraMode = none;
    CameraManager = SPPlayerCameraManager(PlayerCamera);
    // End:0x5F
    if(CameraManager != none)
    {
        CurrentCameraMode = CameraManager.GetCameraMode();
    }
    return CurrentCameraMode;
    //return ReturnValue;    
}

simulated function OnSetCameraTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    SetAimDownSightMode(false);
    super(PlayerController).OnSetCameraTarget(inAction);
    //return;    
}

exec function FloorConformNone()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurSPPawn, CurPawn, NoRot;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0x123 [Loop If]
    if(CurPawn != none)
    {
        CurSPPawn = SPPawn(CurPawn);
        CurSPPawn.FloorConformInfo.bEnableMeshTranslation = false;
        CurSPPawn.FloorConformInfo.bEnableMeshRotation = false;
        CurSPPawn.Mesh.SetRotation(NoRot);
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

exec function FloorConformTransOnly()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurSPPawn, CurPawn, NoRot;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0x123 [Loop If]
    if(CurPawn != none)
    {
        CurSPPawn = SPPawn(CurPawn);
        CurSPPawn.FloorConformInfo.bEnableMeshTranslation = true;
        CurSPPawn.FloorConformInfo.bEnableMeshRotation = false;
        CurSPPawn.Mesh.SetRotation(NoRot);
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

exec function FloorConformFloor()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, CurSPPawn;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0x11A [Loop If]
    if(CurPawn != none)
    {
        CurSPPawn = SPPawn(CurPawn);
        CurSPPawn.FloorConformInfo.bEnableMeshTranslation = true;
        CurSPPawn.FloorConformInfo.bEnableMeshRotation = true;
        CurSPPawn.FloorConformInfo.ConformType = 0;
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

exec function FloorConformCenter()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, CurSPPawn;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0x11A [Loop If]
    if(CurPawn != none)
    {
        CurSPPawn = SPPawn(CurPawn);
        CurSPPawn.FloorConformInfo.bEnableMeshTranslation = true;
        CurSPPawn.FloorConformInfo.bEnableMeshRotation = true;
        CurSPPawn.FloorConformInfo.ConformType = 1;
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

exec function FloorConformCorner()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, CurSPPawn;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0x11A [Loop If]
    if(CurPawn != none)
    {
        CurSPPawn = SPPawn(CurPawn);
        CurSPPawn.FloorConformInfo.bEnableMeshTranslation = true;
        CurSPPawn.FloorConformInfo.bEnableMeshRotation = true;
        CurSPPawn.FloorConformInfo.ConformType = 2;
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

exec function FloorConformExtreme()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, CurSPPawn;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0x1B9 [Loop If]
    if(CurPawn != none)
    {
        CurSPPawn = SPPawn(CurPawn);
        CurSPPawn.FloorConformInfo.bEnableMeshTranslation = true;
        CurSPPawn.FloorConformInfo.bEnableMeshRotation = true;
        CurSPPawn.FloorConformInfo.MaxMeshRotation = 45.0000000;
        CurSPPawn.FloorConformInfo.MeshRotationSpeed = 45.0000000;
        CurSPPawn.FloorConformInfo.MaxMeshTranslation = CurPawn.CylinderComponent.CollisionRadius;
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

exec function FloorConformRestore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, CurSPPawn;

    CurPawn = WorldInfo.PawnList;
    J0x28:

    // End:0xD0 [Loop If]
    if(CurPawn != none)
    {
        CurSPPawn = SPPawn(CurPawn);
        CurSPPawn.FloorConformInfo = CurSPPawn.TuneDataBasePawn.FloorConformInfo;
        CurPawn = CurPawn.NextPawn;
        // [Loop Continue]
        goto J0x28;
    }
    //return;    
}

final simulated function DrawGrenadeAssistZones()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, curGrenade, curHive;

    // End:0x56
    foreach WorldInfo.AllPawns(Class'LPAIPawn', CurPawn)
    {
        CurPawn.DrawGrenadeAssistZone();        
    }    
    // End:0xA5
    foreach WorldInfo.DynamicActors(Class'LPHiveSpawnPoint', curHive)
    {
        curHive.DrawGrenadeAssistZone();        
    }    
    // End:0xDF
    foreach DynamicActors(Class'LPProj_Grenade', curGrenade)
    {
        curGrenade.DrawGrenadeAssistZone();        
    }    
    //return;    
}

final simulated function DrawWinchAssistZones()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn, curBarMaid;

    // End:0x56
    foreach WorldInfo.AllPawns(Class'LPAIPawn', CurPawn)
    {
        CurPawn.DrawWinchAssistZone();        
    }    
    // End:0x90
    foreach DynamicActors(Class'LPProj_VSWinch', curBarMaid)
    {
        curBarMaid.DrawWinchAssistZone();        
    }    
    //return;    
}

final simulated function DrawShowLobFireAttackDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurPawn;

    // End:0x75
    foreach WorldInfo.AllPawns(Class'LPAIPawn', CurPawn)
    {
        CurPawn.DrawShowLobFireAttackDebug();
        CurPawn.DrawShowDirectFireAttackDebug();        
    }    
    //return;    
}

final simulated function DrawAiAttackArcs()
{
    local /*0x97E50000-0x00000000*/ private @NULL curAiController;

    // End:0x54
    foreach WorldInfo.AllControllers(Class'LPAIController', curAiController)
    {
        curAiController.DrawAttackArcs();        
    }    
    //return;    
}

final simulated function DrawCarrierHiveCellStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL curCarrier;

    // End:0x56
    foreach WorldInfo.AllPawns(Class'LPAIPawnCarrier', curCarrier)
    {
        curCarrier.DrawCarrierHiveCellStatus();        
    }    
    //return;    
}

final simulated function DrawDefenderHiveCellStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL curHive;

    // End:0x56
    foreach WorldInfo.AllPawns(Class'LPAIPawnDefenderHive', curHive)
    {
        curHive.DrawDefenderHiveCellStatus();        
    }    
    //return;    
}

reliable server function ServerAttemptVSEntryExit()
{
    local /*0x97E50000-0x00000000*/ private bool bRequireFacingVS[9437185];

    true
    CheckPlayerEnterOrExitVS(bRequireFacingVS);
    //return;    
}

function PlayerIsDoingVSTransition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xDB
    if(MyBasePlayerPawn.IsDoingASpecialMove() && (ClassIsChildOf(MyBasePlayerPawn.GetCurrentSpecialMoveInstance().Class, Class'LPSM_PlayerEnterVS') || ClassIsChildOf(MyBasePlayerPawn.GetCurrentSpecialMoveInstance().Class, Class'LPSM_VSPlayerEnterExitBase')) || MyBasePlayerPawn.IsDoingSpecialMove(Class'LPSM_PlayerExitVS'))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function PlayerCanPerformVSMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(IsDoingASpecialMove())
    {
        return false;
    }
    // End:0x1E
    if(HasPendingWeapon())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CanEnterAnyVitalSuit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(Pawn.Physics) == int(2))
    {
        return false;
    }
    // End:0x3A
    if(bIsVitalSuitEntryLockedByKismet)
    {
        return false;
    }
    // End:0x7E
    if(MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_PlayerRequestsEnterVS, self))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

event CanEnterSpecificVitalSuit()
{
    local /*0x97E50000-0x00000000*/ private @NULL VS[8388609];
    local /*0x97E50000-0x00000000*/ private bool bBypassOptionalCheck[9437185], ReturnValue, bHasLOS;
    local /*0x97E50000-0x00000000*/ private @NULL Winch;

    // End:0x12
    if(VS == none)
    {
        return false;
    }
    // End:0xD7
    if(((VS.IsHumanControlled() || VS.Health < VS.TuneDataVSPlayerPawn.MinHealthForEntry) || VS.InEMPShutdown) || VS.bHardAttach)
    {
        return false;
    }
    Winch = LPWeaponVSWinch(VS.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x1D7
    if((((Winch != none) && Winch.SpawnedProjectile != none) && Winch.SpawnedProjectile.AttachedWinchPoint != none) && Winch.SpawnedProjectile.AttachedWinchPoint.IsZiplineAvailable() == false)
    {
        return false;
    }
    // End:0x308
    if(!bBypassOptionalCheck)
    {
        // End:0x22A
        if(VS.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_PlayerRequestsEnterVS, self))
        {
            return false;
        }
        // End:0x2D9
        if(VSizeSq(VS.Location - MyBasePlayerPawn.Location) > (VS.TuneDataVSPlayerPawn.PlayerEnterVSRange * VS.TuneDataVSPlayerPawn.PlayerEnterVSRange))
        {
            return false;
        }
        // End:0x308
        if(!VS.PlayerCanEnter(MyBasePlayerPawn))
        {
            return false;
        }
    }
    bSkipExtraLOSChecks = true;
    bHasLOS = LineOfSightTo(VS, MyBasePlayerPawn.Location);
    bSkipExtraLOSChecks = default.bSkipExtraLOSChecks;
    // End:0x370
    if(!bHasLOS)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

unreliable client simulated function SetFutureVSCritical()
{
    local /*0x97E50000-0x00000000*/ private @NULL FutureVS[8388609];

    FutureVS.SetCritical();
    //return;    
}

function GetFutureVSThatWeAreBehind()
{
    local /*0x97E50000-0x00000000*/ private @NULL outVS[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL VS;

    VS = LPVSFuturePlayerPawn(FindBestVSToEnter(true, Class'LPVSFuturePlayerPawn'));
    // End:0x60
    if((VS == none) || VS.GetTeam() != none)
    {
        return false;
    }
    // End:0x7A
    if(LPPlayerTurretPawn(VS) != none)
    {
        return false;
    }
    // End:0xBE
    if(VS.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_PlayerRequestsEnterVS, self))
    {
        return false;
    }
    // End:0x16D
    if(VSizeSq(VS.Location - Pawn.Location) > (VS.TuneDataVSPlayerPawn.PlayerEnterVSRange * VS.TuneDataVSPlayerPawn.PlayerEnterVSRange))
    {
        return false;
    }
    // End:0x19A
    if(VS.PlayerCanEnter(MyBasePlayerPawn))
    {
        return false;
    }
    outVS = VS;
    return true;
    //return ReturnValue;    
}

function CanExitVitalSuit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1E
    if(bIsVitalSuitExitLockedByKismet || bIsVitalSuitExitLockedByCode)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CanDeployForExtraction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (((bIsInVitalSuit && LPVSPlayerPawn(Pawn) != none) && LPVSPlayerPawn(Pawn).VSExtractInfo.bOnPocket) && PlayerCanPerformVSMove()) && CanExitVitalSuit();
    //return ReturnValue;    
}

function PutAllLpAiControllersOnHold()
{
    local /*0x97E50000-0x00000000*/ private bool bPutOnHold[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL currAI;

    false
    // End:0x65
    foreach WorldInfo.AllPawns(Class'LPAIPawn', currAI)
    {
        currAI.PauseForVsEntryExit(bPutOnHold);        
    }    
    // End:0x8A
    if(bPutOnHold)
    {
        SetTimer(SafetyDelayToUnPauseAiAfterEnteringOrExitingVs, false, 'PutAllLpAiControllersOnHold');
    }
    //return;    
}

function CheckPlayerEnterOrExitVS()
{
    local /*0x97E50000-0x00000000*/ private bool bRequireFacingVS[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL VS, FutureVS;
    local /*0x97E50000-0x00000000*/ private float dotprod;
    local /*0x97E50000-0x00000000*/ private @NULL vF, vR, VDir;

    true
    // End:0x63
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && (WorldInfo.TimeSeconds - LastEnterExitVSTime) < float(1))
    {
        return false;
    }
    // End:0x685
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x640
        if(PlayerCanPerformVSMove())
        {
            // End:0xF0
            if(CanDeployForExtraction())
            {
                // End:0xDA
                if(!Pawn.IsLocallyControlled())
                {
                    ClientGotoState('VSDeployPlatform');
                    GotoState('VSDeployPlatform');                    
                }
                else
                {
                    MPStartState('VSDeployPlatform');
                }
                return true;
            }
            // End:0x5BB
            if(!bIsInVitalSuit && CanEnterAnyVitalSuit())
            {
                VS = FindBestVSToEnter(false,, bRequireFacingVS);
                // End:0x409
                if((VS != none) && !VS.bIsPlatformMode || VS.bIsPlatformModeFinished)
                {
                    ExitVSPawn = VS;
                    MyPlayerPawn.SetupVSEntry(self, VS);
                    // End:0x27B
                    if(int(MyPlayerPawn.ExitStyle) == int(1))
                    {
                        // End:0x257
                        if(int(WorldInfo.NetMode) == int(NM_Standalone))
                        {
                            // End:0x257
                            if(VS.TuneDataVSPlayerPawn.bPauseIceCrabsInVsEntryExit)
                            {
                                PutAllLpAiControllersOnHold(true);
                            }
                        }
                        MyPlayerPawn.PlayVSEnter();
                        return true;                        
                    }
                    else
                    {
                        // End:0x406
                        if(int(MyPlayerPawn.ExitStyle) != int(5))
                        {
                            // End:0x30F
                            if(int(WorldInfo.NetMode) == int(NM_Standalone))
                            {
                                // End:0x30F
                                if(VS.TuneDataVSPlayerPawn.bPauseIceCrabsInVsEntryExit)
                                {
                                    PutAllLpAiControllersOnHold(true);
                                }
                            }
                            FireTouchEventsOnSwap(HumanPlayerPawn, true);
                            // End:0x371
                            if(VS.IsDoingSpecialMove(Class'LPSM_VSPlatformMode'))
                            {
                                VS.GotoState('None');
                            }
                            MPStartClientState('UsingVS');
                            LastEnterExitVSTime = WorldInfo.TimeSeconds;
                            // End:0x3E5
                            if(int(WorldInfo.NetMode) != int(NM_Standalone))
                            {
                                EnterVS();                                
                            }
                            else
                            {
                                MyPlayerPawn.PlayVSEnter();
                            }
                            return true;
                        }
                    }                    
                }
                else
                {
                    // End:0x5BB
                    if(GetFutureVSThatWeAreBehind(FutureVS))
                    {
                        vF = Vector(FutureVS.Rotation);
                        VDir = Normal(Pawn.Location - FutureVS.Location);
                        dotprod = vF Dot VDir;
                        // End:0x4FF
                        if(dotprod < FutureVSRotate180DotMaxDotProduct)
                        {
                            FutureVS.ServerDoSpecialMove(Class'LPSM_VSFutureRotate180', true,,, Pawn);                            
                        }
                        else
                        {
                            vR = vF Cross vect(0.0000000, 0.0000000, 1.0000000);
                            dotprod = VDir Dot vR;
                            // End:0x587
                            if(dotprod < float(0))
                            {
                                FutureVS.ServerDoSpecialMove(Class'LPSM_VSFutureRotateRight90', true,,, Pawn);                                
                            }
                            else
                            {
                                FutureVS.ServerDoSpecialMove(Class'LPSM_VSFutureRotateLeft90', true,,, Pawn);
                            }
                        }
                    }
                }
            }
            // End:0x63B
            if(bIsInVitalSuit)
            {
                // End:0x62C
                if(CanExitVitalSuit())
                {
                    VS = LPBaseVSPlayerPawn(Pawn);
                    LastEnterExitVSTime = WorldInfo.TimeSeconds;
                    ServerExitVS();
                    return true;                    
                }
                else
                {
                    ShowCockpitLockedMessage();
                    return true;
                }                
            }
            else
            {
                return true;
            }            
        }
        else
        {
            // End:0x685
            if(bIsInVitalSuit)
            {
                LastEnterExitVSTime = WorldInfo.TimeSeconds;
                ExitVS(false, true);
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

exec function ToggleVS()
{
    // End:0x41
    if(bIsInVitalSuit)
    {
        // End:0x30
        if(IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchWinchPoint'))
        {
            VSWinchPointReleased();            
        }
        else
        {
            ServerExitVS(true);
        }        
    }
    else
    {
        ServerEnterVS(none);
    }
    //return;    
}

function OnEnterVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0xB9
    if(inAction.InputLinks[0].bHasImpulse)
    {
        myLPHUD.ShowJobLog(false, false, true);
        myLPHUD.MessageLayerManager.RemoveAllMessageLayers();
        EnterVS(true, inAction.vsPawn);        
    }
    else
    {
        // End:0x101
        if(inAction.InputLinks[1].bHasImpulse)
        {
            ExitVS(true);            
        }
        else
        {
            // End:0x183
            if(inAction.InputLinks[2].bHasImpulse)
            {
                // End:0x157
                if(bIsInVitalSuit)
                {
                    ExitVS(true);                    
                }
                else
                {
                    EnterVS(true, inAction.vsPawn);
                }                
            }
            else
            {
                // End:0x21B
                if(Pawn != none)
                {
                    SPPawn(Pawn).EndCurrentSpecialMove();
                    // End:0x21B
                    if(CanDeployForExtraction())
                    {
                        LPPlayerPawn(HumanPlayerPawn).bDeployPlatformVSISS = inAction.PlatformModeIsenbergBossFight;
                        ServerAttemptVSEntryExit(false);
                    }
                }
            }
        }
    }
    //return;    
}

function OnModifyVSEntryType()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], LPP;

    LPP = GetMyPlayerPawn();
    // End:0x1FE
    if(LPP != none)
    {
        // End:0x7B
        if(inAction.InputLinks[0].bHasImpulse)
        {
            LPP.bUseShortVSEntry = true;
        }
        // End:0xD3
        if(inAction.InputLinks[1].bHasImpulse)
        {
            LPP.bUseShortVSEntry = false;
        }
        // End:0x14C
        if(inAction.InputLinks[2].bHasImpulse)
        {
            LPP.bUseShortVSEntry = !LPP.bUseShortVSEntry;
        }
        // End:0x1A5
        if(inAction.InputLinks[3].bHasImpulse)
        {
            LPP.bForceRearVSExit = false;
        }
        // End:0x1FE
        if(inAction.InputLinks[4].bHasImpulse)
        {
            LPP.bForceRearVSExit = true;
        }
    }
    //return;    
}

function OnLockVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x6D
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bIsVitalSuitEntryLockedByKismet = true;
        bDoesVitalSuitZiplineOverrideEnterLocking = inAction.bAllowZiplineToOverride;
    }
    // End:0xB0
    if(inAction.InputLinks[1].bHasImpulse)
    {
        bIsVitalSuitEntryLockedByKismet = false;
    }
    // End:0x129
    if(inAction.InputLinks[2].bHasImpulse)
    {
        bIsVitalSuitEntryLockedByKismet = !bIsVitalSuitEntryLockedByKismet;
        bDoesVitalSuitZiplineOverrideEnterLocking = inAction.bAllowZiplineToOverride;
    }
    // End:0x197
    if(inAction.InputLinks[3].bHasImpulse)
    {
        bIsVitalSuitExitLockedByKismet = true;
        bDoesVitalSuitZiplineOverrideExitLocking = inAction.bAllowZiplineToOverride;
    }
    // End:0x1DB
    if(inAction.InputLinks[4].bHasImpulse)
    {
        bIsVitalSuitExitLockedByKismet = false;
    }
    // End:0x254
    if(inAction.InputLinks[5].bHasImpulse)
    {
        bIsVitalSuitExitLockedByKismet = !bIsVitalSuitExitLockedByKismet;
        bDoesVitalSuitZiplineOverrideExitLocking = inAction.bAllowZiplineToOverride;
    }
    //return;    
}

function OnVSStopActions()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], VSBPawn, vsPawn;

    VSBPawn = LPBaseVSPlayerPawn(Pawn);
    vsPawn = LPVSPlayerPawn(Pawn);
    // End:0xD8
    if(VSBPawn != none)
    {
        // End:0x9F
        if((vsPawn != none) && vsPawn.IsInState('VSExtraction'))
        {
            vsPawn.AbortVSPlatformMode();            
        }
        else
        {
            StartRightArmTransitionOut();
            // End:0xCE
            if(IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSArmSwingBase'))
            {
                DoSpecialMove(none, true);
            }
            VSShieldBlockButtonRelease();
        }
    }
    //return;    
}

function OnToggleAllowVSWinchInput()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], VSWinch;

    // End:0x11
    if(!bIsInVitalSuit)
    {
        return;
    }
    VSWinch = LPWeaponVSWinch(LPVSPlayerPawn(Pawn).FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x67
    if(VSWinch == none)
    {
        return;
    }
    VSWinch.OnToggleAllowVSWinchInput(inAction);
    //return;    
}

function OnVSRetractWinch()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], vsPawn;

    vsPawn = LPBaseVSPlayerPawn(Pawn);
    // End:0x4A
    if(vsPawn != none)
    {
        vsPawn.ForceRetractWinch();
    }
    //return;    
}

reliable server function ServerEnterVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVS[8388609];

    // End:0x23
    if(!bIsInVitalSuit)
    {
        EnterVS(false, InVS);
    }
    //return;    
}

reliable server function ServerExitVS()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185], bPreventSpecialMove, bResetOnly, bHardReset;

    false
    false
    false
    false
    // End:0x53
    if(bIsInVitalSuit)
    {
        ExitVS(bForced, bPreventSpecialMove, bResetOnly, bHardReset);
    }
    //return;    
}

simulated function FireTouchEventsOnSwap()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUnTouch[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array TouchEvents;
    local /*0x97E50000-0x00000000*/ private @NULL TouchEvent, TouchingActor;

    // End:0xC1
    foreach TargetPawn.TouchingActors(Class'Engine.Actor', TouchingActor)
    {
        // End:0xC0
        if(TouchingActor.FindEventsOfClass(Class'Engine.SeqEvent_Touch', TouchEvents))
        {
            // End:0xBF
            foreach TouchEvents(TouchEvent)
            {
                SeqEvent_Touch(TouchEvent).FireTouchEventsOnSwap(TargetPawn, TouchingActor, bUnTouch);                
            }            
        }        
    }    
    //return;    
}

function @NULL EnterVS()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[9437185], MyFutureVSPawn, NewVSPawn;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Inv, lpAiResMgr;

    false
    none
    // End:0x19
    if(bIsInVitalSuit)
    {
        return;
    }
    // End:0x3B
    if(!bForced && !CanEnterAnyVitalSuit())
    {
        return;
    }
    // End:0x9D
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && (Pawn == none) || !Pawn.IsAliveAndWell())
    {
        return;
    }
    HumanPlayerPawn = Pawn;
    // End:0xD5
    if(InVsPawn != none)
    {
        NewVSPawn = InVsPawn;        
    }
    else
    {
        NewVSPawn = FindBestVSToEnter(bForced);
    }
    // End:0x106
    if(NewVSPawn == none)
    {
        return;
    }
    // End:0x12C
    if(NewVSPawn.Controller != none)
    {
        return;
    }
    // End:0x8D5
    if(NewVSPawn != none)
    {
        CancelMunitionsLocker();
        // End:0x187
        if(NewVSPawn.TuneDataVSPlayerPawn.bPauseIceCrabsInVsEntryExit)
        {
            PutAllLpAiControllersOnHold(false);
        }
        NotifyCloseAllDodgeWindows();
        UnPossess();
        Possess(NewVSPawn, true);
        NewVSPawn.EnableAIResourceManager(true);
        // End:0x258
        if(LPPawn(HumanPlayerPawn) != none)
        {
            lpAiResMgr = LPAIResManPlayer(LPPawn(HumanPlayerPawn).AIResourceManager);
            // End:0x258
            if(lpAiResMgr != none)
            {
                lpAiResMgr.NotfiySubscribedControllersOfPawnChange(NewVSPawn);
            }
        }
        // End:0x526
        if(HumanPlayerPawn != none)
        {
            // End:0x29F
            if(LPPlayerTurretPawn(NewVSPawn) == none)
            {
                HumanPlayerPawn.SetHidden(true);
            }
            HumanPlayerPawn.SetCollision(false, false);
            HumanPlayerPawn.bCollideWorld = false;
            HumanPlayerPawn.SetLocation(NewVSPawn.Location);
            HumanPlayerPawn.SetRotation(NewVSPawn.Rotation);
            HumanPlayerPawn.SetHardAttach(true);
            HumanPlayerPawn.SetPhysics(0);
            HumanPlayerPawn.SetBase(Pawn);
            HumanPlayerPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            HumanPlayerPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            LPPawn(HumanPlayerPawn).EnableAIResourceManager(false);
            LPPlayerPawn(HumanPlayerPawn).bUseZiplineVSTransition = false;
            // End:0x526
            if(int(WorldInfo.NetMode) != int(NM_Standalone))
            {
                // End:0x525
                foreach HumanPlayerPawn.InvManager.InventoryActors(Class'Engine.Inventory', Inv)
                {
                    Inv.SetOwner(none);
                    Inv.bNetDirty = true;
                    Inv.bForceNetUpdate = true;                    
                }                
            }
        }
        TrySetVSGroundSpeed(NewVSPawn, OverriddenVSSpeed);
        bIsInVitalSuit = true;
        NewVSPawn.SetPitchControllerLock(false);
        NewVSPawn.TEnergyLevel = NewVSPawn.GetEnergyCount() / NewVSPawn.GetMaxTEnergyCapacity();
        ClientEnteredVS(NewVSPawn, HumanPlayerPawn);
        NewVSPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_PlayerEnteredVS, self);
        MyFutureVSPawn = LPVSFuturePlayerPawn(NewVSPawn);
        // End:0x791
        if(MyFutureVSPawn != none)
        {
            I = 0;
            J0x65E:

            // End:0x791 [Loop If]
            if(I < MyFutureVSPawn.VSWeapons.Length)
            {
                MyFutureVSPawn.VSWeapons[I].SetOwner(none);
                MyFutureVSPawn.VSWeapons[I].SetOwner(MyFutureVSPawn);
                MyFutureVSPawn.VSWeapons[I].bNetDirty = true;
                MyFutureVSPawn.VSWeapons[I].bForceNetUpdate = true;
                I++;
                // [Loop Continue]
                goto J0x65E;
            }
        }
        TriggerEventClass(Class'LPSeqEvent_EnterVS', self);
        // End:0x812
        if(LPPlayerPawn(HumanPlayerPawn).EnterVSQuestEvent != none)
        {
            LPPlayerPawn(HumanPlayerPawn).EnterVSQuestEvent.SendEvent();
        }
        // End:0x842
        if(NewVSPawn.InEMPShutdown)
        {
            GotoState('VSEMPShutdown');
        }
        FireTouchEventsOnSwap(NewVSPawn);
        // End:0x8D5
        if(LPPlayerPawn(HumanPlayerPawn).bDeployPlatform)
        {
            LPPlayerPawn(HumanPlayerPawn).bDeployPlatform = false;
            PlayerEnteredPlatform(LPVSPlayerPawn(NewVSPawn));
            GotoState('VSExitPlatform');
        }
    }
    //return;    
}

function PlayerEnteredPlatform()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];

    // End:0x169
    if((vsPawn != none) && vsPawn.ExtractPocket != none)
    {
        // End:0xC2
        if(vsPawn.ExtractPocket != none)
        {
            vsPawn.ExtractPocket.HidePlatform();
            vsPawn.ExtractPocket.SetEnabled(false);
        }
        vsPawn.SetHidden(false);
        vsPawn.SetCollision(true, true);
        vsPawn.ExtractPocket = none;
        vsPawn.DoSpecialMove(Class'LPSM_VSPlatformOut', true, false);
        vsPawn.ExtractPocket = none;
    }
    //return;    
}

reliable client simulated function @NULL ClientEnteredVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609], OldHumanPawn, Weap, LPP, PastVSPawn, AkComp,
	    LPFTVolume, Upgrade, Taser;

    vsPawn.GotoState('None');
    HumanPlayerPawn = OldHumanPawn;
    // End:0x183
    if(HumanPlayerPawn != none)
    {
        Weap = LPWeapon(HumanPlayerPawn.Weapon);
        // End:0xEF
        if(Weap != none)
        {
            Weap.ToggleFlashLight(false);
            // End:0xEF
            if(int(WorldInfo.NetMode) == int(NM_Client))
            {
                Weap.bWeaponActive = false;
            }
        }
        LPP = LPPlayerPawn(HumanPlayerPawn);
        // End:0x183
        if(LPP != none)
        {
            ClearAmmoTypeSwitch();
            // End:0x164
            if(LPP.SprintControl.bSprinting)
            {
                EndSprint();
            }
            SetTutorialMode(0, LPP);
            ClearAllVSReticleHelpButtons();
        }
    }
    UnPauseAllVSFire();
    bIsInVitalSuit = true;
    SetAimDownSightMode(false);
    SetDefaultCam(VSCamTransitionInParam);
    ActivateSoundMode(Class'LPSoundModeManager'.default.MODE_InsideVS, Class'LPSoundModeManager'.default.PRI_InsideVS);
    CancelMunitionsLocker();
    // End:0x2CB
    if(myLPHUD != none)
    {
        myLPHUD.ToggleVSDisplayState(true);
        myLPHUD.ShowDPadCluster(false, false);
        // End:0x2CB
        if((int(WorldInfo.NetMode) == int(NM_Standalone)) && Pawn != none)
        {
            // End:0x2CA
            foreach Pawn.TouchingActors(Class'LPFastTravelVolume', LPFTVolume)
            {
                ShowFastTravelOptionMessage();                
            }            
        }
    }
    // End:0x5EE
    if(vsPawn != none)
    {
        // End:0x384
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            vsPawn.SetMeshLodForInsideCockpit();
            myLPHUD.ShowDamageImmunity(false);
            myLPHUD.RemoveMessageLayer(22);
            myLPHUD.RemoveMessageLayer(11);
        }
        StartVSCockpitCameraShake(vsPawn);
        PastVSPawn = LPVSPlayerPawn(vsPawn);
        // End:0x5EE
        if(PastVSPawn != none)
        {
            EnableGrabPointsDisplay(true);
            // End:0x447
            if((int(PastVSPawn.CurrentMusicSource) == int(0)) && PastVSPawn.GameMusicPlayerAudioComp != none)
            {
                AkComp = PastVSPawn.GameMusicPlayerAudioComp;                
            }
            else
            {
                // End:0x4BE
                if((int(PastVSPawn.CurrentMusicSource) == int(1)) && PastVSPawn.UserMusicPlayerAudioComp != none)
                {
                    AkComp = PastVSPawn.UserMusicPlayerAudioComp;
                }
            }
            // End:0x54D
            if(AkComp != none)
            {
                PastVSPawn.SetVSMusicPlayerState(AkComp, true);
                // End:0x54D
                if((IsMusicPlayerPlaying(PastVSPawn)) && !IsMusicPlayerPaused(PastVSPawn))
                {
                    ClearTimer('NotifyNewTrack');
                    SetTimer(1.0000000, false, 'NotifyNewTrack');
                }
            }
            // End:0x5EE
            if(HasUpgrade(Class'LPVSUpgrade_Taser', Upgrade))
            {
                Taser = LPVSUpgrade_Taser(Upgrade);
                // End:0x5CF
                if(Taser.EnergyPercent < 1.0000000)
                {
                    Taser.StartRecharging();
                }
                PastVSPawn.NotifyDefenderCountChanged();
            }
        }
    }
    Class'LPBreadcrumbManager'.static.GetBreadcrumbManager().SetObjectiveMarkerDisplayType(0);
    //return;    
}

exec function ToggleVSCockpitCameraShake()
{
    bDisableVSCockpitCameraShake = !bDisableVSCockpitCameraShake;
    // End:0x44
    if(bDisableVSCockpitCameraShake)
    {
        StopVSCockpitCameraShake(LPBaseVSPlayerPawn(Pawn), true);        
    }
    else
    {
        StartVSCockpitCameraShake(LPBaseVSPlayerPawn(Pawn));
    }
    //return;    
}

function StartVSCockpitCameraShake()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];

    // End:0x9C
    if(((vsPawn != none) && !bDisableVSCockpitCameraShake) && vsPawn.TuneDataVSPlayerPawn.CockpitCameraShake != none)
    {
        ClientPlayCameraShake(vsPawn.TuneDataVSPlayerPawn.CockpitCameraShake);
    }
    //return;    
}

function StopVSCockpitCameraShake()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];

    // End:0xA8
    if(((vsPawn != none) && !bDisableVSCockpitCameraShake || bForce) && vsPawn.TuneDataVSPlayerPawn.CockpitCameraShake != none)
    {
        ClientStopCameraShake(vsPawn.TuneDataVSPlayerPawn.CockpitCameraShake);
    }
    //return;    
}

reliable client simulated function ClientClearExitVSOptionMessage()
{
    // End:0x51
    if(myLPHUD != none)
    {
        myLPHUD.RemoveMessageLayer(24);
        myLPHUD.RemoveMessageLayer(25);
    }
    //return;    
}

function ShowExitVSOptionMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    // End:0xA0
    if(Pawn != none)
    {
        // End:0xA0
        if(IsLocalPlayerController())
        {
            vsPawn = LPVSPlayerPawn(Pawn);
            // End:0xA0
            if(vsPawn != none)
            {
                // End:0x9D
                if(CanExitVitalSuit())
                {
                    myLPHUD.DisplayHUDMessageLayer(24, vsPawn.ExitPromptString);
                }                
            }
        }
    }
    //return;    
}

function AkridOnFrontOfCockPit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL currentVS;

    // End:0x1A
    if(LPVSFuturePlayerPawn(Pawn) != none)
    {
        return false;
    }
    currentVS = LPBaseVSPlayerPawn(Pawn);
    // End:0xBA
    if(currentVS != none)
    {
        // End:0x81
        if(currentVS.AIResDefenderVS.AreAnyAttackSlotOccupied())
        {
            return true;            
        }
        else
        {
            // End:0xBA
            if(currentVS.AIResNushiSporeVS.AreAnyAttackSlotOccupied())
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function ShowCockpitLockedMessage()
{
    // End:0x8B
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        myLPHUD.DisplayVSEnvironmentalMessage(2, "<Strings:LostPlanetGame.EnvironmentMessages.VS_LOCKED1>", "", false, 1.0000000);
    }
    //return;    
}

function @NULL ExitVS()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185], bPreventSpecialMove, bResetOnly, bHardReset;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, MyFutureVSPawn, LPP, GroundPosition;
    local /*0x97E50000-0x00000000*/ private bool bValidGround;
    local /*0x97E50000-0x00000000*/ private @NULL HorizOffset, TestVec;
    local /*0x97E50000-0x00000000*/ private float MaxGroundHeight;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Inv, lpAiResMgr;

    false
    false
    false
    false
    // End:0x25
    if(!bIsInVitalSuit)
    {
        return;
    }
    // End:0xA4
    if(!bForced && MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_PlayerRequestsExitVS, self) || !CanExitVitalSuit())
    {
        // End:0xA4
        if(!bResetOnly)
        {
            ShowCockpitLockedMessage();
            return;
        }
    }
    LPP = LPPlayerPawn(HumanPlayerPawn);
    // End:0x121E
    if((LPP != none) && Pawn != none)
    {
        GroundPosition = Pawn.Location;
        vsPawn = LPBaseVSPlayerPawn(Pawn);
        ExitVSPawn = vsPawn;
        // End:0x1B9
        if(LPPlayerTurretPawn(vsPawn) != none)
        {
            LPP.EndCurrentSpecialMove();
            LPPlayerTurretPawn(vsPawn).SeatedPawn = none;
            vsPawn.bForceNetUpdate = true;
        }
        LPP.SetupVSExit(self, vsPawn);
        // End:0x966
        if(!bHardReset && int(LPP.ExitStyle) != int(3))
        {
            // End:0x966
            if(int(LPP.ExitStyle) != int(2))
            {
                TestVec = Pawn.Location;
                TestVec.Z -= Pawn.CylinderComponent.CollisionHeight;
                TestVec.Z += vsPawn.MaxExitGroundHeightDifferenceUp;
                HorizOffset.X = ((HumanPlayerPawn.CylinderComponent.CollisionRadius * 1.4150000) + Pawn.CylinderComponent.CollisionRadius) + 5.0000000;
                MaxGroundHeight = vsPawn.MaxExitGroundHeightDifferenceUp + vsPawn.MaxExitGroundHeightDifferenceDown;
                // End:0x7A1
                if(LPPlayerTurretPawn(Pawn) == none)
                {
                    // End:0x50F
                    if(int(LPP.ExitDirection) == int(0))
                    {
                        bValidGround = Class'SPEngine.SPUtil'.static.SweepArcForValidGround(HumanPlayerPawn, TestVec, HorizOffset, Pawn.Rotation.Yaw, int(float(20) * 182.0444000), true, MaxGroundHeight, GroundPosition, 3);
                        // End:0x50F
                        if(!bValidGround && !ClassIsChildOf(vsPawn.Class, Class'LPVSFuturePlayerPawn'))
                        {
                            LPP.ExitDirection = 1;
                        }
                    }
                    // End:0x5D7
                    if(int(LPP.ExitDirection) == int(1))
                    {
                        bValidGround = Class'SPEngine.SPUtil'.static.SweepArcForValidGround(HumanPlayerPawn, TestVec, HorizOffset, Pawn.Rotation.Yaw + 32768, int(float(20) * 182.0444000), true, MaxGroundHeight, GroundPosition, 3);
                    }
                    // End:0x6B0
                    if(!bValidGround)
                    {
                        LPP.ExitDirection = 2;
                        bValidGround = Class'SPEngine.SPUtil'.static.SweepArcForValidGround(HumanPlayerPawn, TestVec, HorizOffset, int(float(Pawn.Rotation.Yaw) + (float(20) * 182.0444000)), int(float(140) * 182.0444000), false, MaxGroundHeight, GroundPosition, 4);
                    }
                    // End:0x768
                    if(!bValidGround)
                    {
                        bValidGround = Class'SPEngine.SPUtil'.static.SweepArcForValidGround(HumanPlayerPawn, TestVec, HorizOffset, int(float(Pawn.Rotation.Yaw) - (float(140) * 182.0444000)), int(float(140) * 182.0444000), false, MaxGroundHeight, GroundPosition, 4);
                    }
                    // End:0x79E
                    if(!bValidGround)
                    {
                        // End:0x78B
                        if(!bResetOnly)
                        {
                            return;                            
                        }
                        else
                        {
                            GroundPosition = TestVec;
                        }
                    }                    
                }
                else
                {
                    bValidGround = Class'SPEngine.SPUtil'.static.SweepArcForValidGround(HumanPlayerPawn, TestVec, HorizOffset, Pawn.Rotation.Yaw + 20000, int(float(20) * 182.0444000), true, MaxGroundHeight, GroundPosition, 3);
                    LPP.ExitDirection = 4;
                    // End:0x930
                    if(!bValidGround)
                    {
                        bValidGround = Class'SPEngine.SPUtil'.static.SweepArcForValidGround(HumanPlayerPawn, TestVec, HorizOffset, Pawn.Rotation.Yaw - 20000, int(float(20) * 182.0444000), true, MaxGroundHeight, GroundPosition, 3);
                        LPP.ExitDirection = 3;
                    }
                    // End:0x966
                    if(!bValidGround)
                    {
                        // End:0x953
                        if(!bResetOnly)
                        {
                            return;                            
                        }
                        else
                        {
                            GroundPosition = TestVec;
                        }
                    }
                }
            }
        }
        FireTouchEventsOnSwap(vsPawn, true);
        UnPossess();
        Possess(HumanPlayerPawn, true);
        // End:0xAAF
        if(vsPawn != none)
        {
            vsPawn.EnableAIResourceManager(false);
            vsPawn.ZeroMovementVariables();
            lpAiResMgr = LPAIResManPlayer(vsPawn.AIResourceManager);
            // End:0xAAF
            if(lpAiResMgr != none)
            {
                LPP.SetHidden(false);
                LPP.bNotValidForAiWhileHidenRightNow = false;
                lpAiResMgr.NotfiySubscribedControllersOfPawnChange(LPP);
                LPP.SetHidden(true);
            }
        }
        // End:0xAED
        if(bResetOnly && !bHardReset)
        {
            Pawn.SetHidden(true);
        }
        // End:0xB39
        if(bHardReset)
        {
            Pawn.SetCollision(false, false);
            Pawn.bCollideWorld = false;            
        }
        else
        {
            Pawn.SetCollision(true, true);
            Pawn.bCollideWorld = true;
        }
        Pawn.SetHardAttach(false);
        Pawn.SetBase(none);
        // End:0xBDB
        if(bHardReset)
        {
            Pawn.SetPhysics(0);            
        }
        else
        {
            Pawn.SetPhysics(1);
        }
        Pawn.AccelRate = MyBasePlayerPawn.TuneDataBasePawn.AccelerationRate_Tunable.GetValue();
        Pawn.SetLocation(GroundPosition);
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0xD3B
        if((int(WorldInfo.NetMode) == int(NM_Standalone)) && LPPlayerTurretPawn(vsPawn) == none)
        {
            MyPlayerPawn.ServerReplenishAmmoFromMunitionsLocker(self, true);
        }
        LPP.EnableAIResourceManager(true);
        LpShowSelf();
        bIsInVitalSuit = false;
        // End:0xD8D
        if(bResetOnly)
        {
            bPlayVSExit = false;            
        }
        else
        {
            bPlayVSExit = true;
        }
        // End:0xDD1
        if(LPPlayerTurretPawn(vsPawn) != none)
        {
            HumanPlayerPawn.SetHidden(false);
        }
        ClientExitedVS(vsPawn, LPPlayerPawn(HumanPlayerPawn), GroundPosition, bResetOnly);
        // End:0x10E9
        if(vsPawn != none)
        {
            vsPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_PlayerExitedVS, self);
            MyFutureVSPawn = LPVSFuturePlayerPawn(vsPawn);
            // End:0x1043
            if(MyFutureVSPawn != none)
            {
                I = 0;
                J0xE8E:

                // End:0x1040 [Loop If]
                if(I < MyFutureVSPawn.VSWeapons.Length)
                {
                    MyFutureVSPawn.VSWeapons[I].SetOwner(none);
                    MyFutureVSPawn.VSWeapons[I].bNetDirty = true;
                    MyFutureVSPawn.VSWeapons[I].bForceNetUpdate = true;
                    MyFutureVSPawn.VSWeapons[I].GotoState('Active');
                    MyFutureVSPawn.VSWeapons[I].ClearAllSAPendingFire();
                    MyFutureVSPawn.VSWeapons[I].ForceStopFire++;
                    I++;
                    // [Loop Continue]
                    goto J0xE8E;
                }                
            }
            else
            {
                // End:0x10E9
                if(LPVSPlayerPawn(vsPawn).RightArmPart != none)
                {
                    LPVSPlayerPawn(vsPawn).RightArmPart.StopAction(LPVSPlayerPawn(vsPawn).RightArmPart.CurrentActionMode);
                }
            }
        }
        TriggerEventClass(Class'LPSeqEvent_ExitVS', self);
        // End:0x116A
        if(LPPlayerPawn(HumanPlayerPawn).ExitVSQuestEvent != none)
        {
            LPPlayerPawn(HumanPlayerPawn).ExitVSQuestEvent.SendEvent();
        }
        // End:0x11E8
        if(((int(LPP.ExitType) == int(0)) && vsPawn != none) && vsPawn.TuneDataVSPlayerPawn.bPauseIceCrabsInVsEntryExit)
        {
            PutAllLpAiControllersOnHold(true);
        }
        myLPHUD.ShowJobLog(false);
        ClearFastTravelOptionMessage();
        ClientClearExitVSOptionMessage();
    }
    // End:0x12F5
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x12F4
        foreach Pawn.InvManager.InventoryActors(Class'Engine.Inventory', Inv)
        {
            Inv.SetOwner(Pawn);
            Inv.bNetDirty = true;
            Inv.bForceNetUpdate = true;            
        }        
    }
    FireTouchEventsOnSwap(HumanPlayerPawn);
    //return;    
}

reliable client simulated function @NULL ClientExitedVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609], NewHumanPawn, GroundPosition;
    local /*0x97E50000-0x00000000*/ private bool bResetOnly[9437185], bHardReset;
    local /*0x97E50000-0x00000000*/ private @NULL PastVSPawn, VSWinch, AkComp;

    false
    false
    vsPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_PlayerRequestsExitVS, self);
    bIsInVitalSuit = false;
    SetDefaultCam();
    DeactivateSoundModeByName(Class'LPSoundModeManager'.default.MODE_InsideVS);
    // End:0x4DA
    if(vsPawn != none)
    {
        StopVSCockpitCameraShake(vsPawn);
        VSWinch = LPWeaponVSWinch(vsPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
        // End:0x1D1
        if(VSWinch != none)
        {
            VSWinch.GetCableEndpoints(ZiplineInfo.ZiplineStart, ZiplineInfo.ZiplineEnd);
            ZiplineInfo.ZiplineType = 0;
            ZiplineInfo.DropoffDist = VSWinch.SpawnedProjectile.AttachedWinchPoint.DropoffDistance;
        }
        PastVSPawn = LPVSPlayerPawn(vsPawn);
        // End:0x415
        if(PastVSPawn != none)
        {
            PastVSPawn.UpdateCombatWindowTutorials(true);
            SetTutorialMode(0, vsPawn);
            ClearAllVSReticleHelpButtons();
            // End:0x2BE
            if((int(PastVSPawn.CurrentMusicSource) == int(0)) && PastVSPawn.GameMusicPlayerAudioComp != none)
            {
                AkComp = LPVSPlayerPawn(vsPawn).GameMusicPlayerAudioComp;                
            }
            else
            {
                // End:0x33E
                if((int(PastVSPawn.CurrentMusicSource) == int(1)) && PastVSPawn.UserMusicPlayerAudioComp != none)
                {
                    AkComp = LPVSPlayerPawn(vsPawn).UserMusicPlayerAudioComp;
                }
            }
            // End:0x376
            if(AkComp != none)
            {
                PastVSPawn.SetVSMusicPlayerState(AkComp, false);
            }
            ClearTimer('NotifyNewTrack');
            // End:0x415
            if(PastVSPawn.RightArmPart != none)
            {
                PastVSPawn.RightArmPart.StopAction(PastVSPawn.RightArmPart.CurrentActionMode);
            }
        }
        vsPawn.SetPitchControllerTarget(0, 2.0000000);
        vsPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        vsPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x4DA
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            vsPawn.SetMeshLodForOutsideCockpit();
        }
    }
    // End:0x793
    if(NewHumanPawn != none)
    {
        // End:0x511
        if((Pawn != none) && Pawn != NewHumanPawn)
        {
        }
        // End:0x540
        if(!bHardReset)
        {
            NewHumanPawn.SetHidden(true);
        }
        // End:0x58C
        if(bHardReset)
        {
            NewHumanPawn.SetCollision(false, false);
            NewHumanPawn.bCollideWorld = false;            
        }
        else
        {
            NewHumanPawn.SetCollision(true, true);
            NewHumanPawn.bCollideWorld = true;
        }
        NewHumanPawn.SetHardAttach(false);
        NewHumanPawn.SetBase(none);
        // End:0x62E
        if(bHardReset)
        {
            NewHumanPawn.SetPhysics(0);            
        }
        else
        {
            NewHumanPawn.SetPhysics(1);
        }
        NewHumanPawn.AccelRate = NewHumanPawn.TuneDataBasePawn.AccelerationRate_Tunable.GetValue();
        NewHumanPawn.SetLocation(GroundPosition);
        NewHumanPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        NewHumanPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x75C
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            ReInitPawnWeapons();
        }
        Class'LPBreadcrumbManager'.static.GetBreadcrumbManager().SetObjectiveMarkerDisplayType(NM_DedicatedServer);
    }
    // End:0x7AF
    if(bResetOnly)
    {
        bPlayVSExit = false;        
    }
    else
    {
        bPlayVSExit = true;
    }
    ExitVSPawn = vsPawn;
    // End:0x834
    if(myLPHUD != none)
    {
        myLPHUD.ToggleVSDisplayState(false, vsPawn);
        // End:0x834
        if(bAlwaysDisplayDPAD)
        {
            myLPHUD.ShowDPadCluster(true, false);
        }
    }
    EnableGrabPointsDisplay(false);
    EnableHydraulicPressureDisplay(false);
    // End:0x878
    if(MyPlayerPawn != none)
    {
        MyPlayerPawn.NotifyAmmoCountUpdated();
    }
    //return;    
}

function ReInitPawnWeapons()
{
    local /*0x97E50000-0x00000000*/ private @NULL SPIW;

    // End:0x1D8
    if((Pawn.Weapon != none) && Pawn.InvManager != none)
    {
        // End:0x1D4
        foreach Pawn.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', SPIW)
        {
            // End:0x1D3
            if(SPIW.bCanEquip)
            {
                SPIW.Mesh.DetachFromAny();
                SPIW.StowedMeshComponent.DetachFromAny();
                // End:0x1A0
                if(SPIW == Pawn.Weapon)
                {
                    SPIW.bWeaponActive = true;
                    SPInventoryPawn(Pawn).SetAttachmentVisibility(SPIW, 0);
                    // End:0x1D3
                    continue;
                }
                SPInventoryPawn(Pawn).SetAttachmentVisibility(SPIW, 1);
            }            
        }                
    }
    else
    {
        SetTimer(0.0300000, false, 'ReInitPawnWeapons');
    }
    //return;    
}

function NotifyVSCritical()
{
    myLPHUD.DisplayHUDMessageLayer(24, LPBaseVSPlayerPawn(Pawn).ExitPromptString);
    //return;    
}

function VSExploded()
{
    local /*0x97E50000-0x00000000*/ private @NULL VSLocation[8388609], Killer;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool bKeepPawn[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL Inv;

    UnPossess();
    bIsInVitalSuit = false;
    // End:0x64
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) && !IsLocalPlayerController())
    {
        IncrementStat('Stat_DeathsInVS');
    }
    // End:0x373
    if(HumanPlayerPawn != none)
    {
        Possess(HumanPlayerPawn, true);
        Pawn.SetCollision(true, true);
        Pawn.bCollideWorld = true;
        Pawn.SetHardAttach(false);
        Pawn.SetBase(none);
        Pawn.SetPhysics(2);
        Pawn.SetLocation(VSLocation);
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x1C2
        if(bKeepPawn)
        {
            Pawn.SetHidden(false);            
        }
        else
        {
            Pawn.SetHidden(true);
            Pawn.Weapon.Destroy();
            Pawn.Weapon = none;
            // End:0x2B2
            foreach Pawn.InvManager.InventoryActors(Class'Engine.Inventory', Inv)
            {
                Inv.bDropOnDeath = false;
                Inv.Destroy();                
            }            
        }
        ClientVSExploded(VSLocation, LPPawn(HumanPlayerPawn), bKeepPawn);
        Pawn.TakeDamage(Pawn.HealthMax, Killer, HitLocation, vect(0.0000000, 0.0000000, 200.0000000), DamageType);
        // End:0x370
        if(!bKeepPawn)
        {
            Pawn.Destroy();
        }        
    }
    else
    {
        SetLocation(VSLocation);
        ClientVSExploded(VSLocation, none, false);
    }
    //return;    
}

reliable client simulated function ClientVSExploded()
{
    local /*0x97E50000-0x00000000*/ private @NULL VSLocation[8388609], NewHumanPawn;
    local /*0x97E50000-0x00000000*/ private bool bKeepPawn[8388609];

    bIsInVitalSuit = false;
    SetDefaultCam();
    DeactivateSoundModeByName(Class'LPSoundModeManager'.default.MODE_InsideVS);
    EnableGrabPointsDisplay(false);
    EnableHydraulicPressureDisplay(false);
    // End:0x85
    if(myLPHUD != none)
    {
        myLPHUD.ToggleVSDisplayState(false);
    }
    // End:0x1F9
    if((NewHumanPawn != none) && bKeepPawn)
    {
        // End:0xCB
        if((Pawn != none) && Pawn != NewHumanPawn)
        {
        }
        NewHumanPawn.SetHidden(false);
        NewHumanPawn.SetCollision(true, true);
        NewHumanPawn.bCollideWorld = true;
        NewHumanPawn.SetHardAttach(false);
        NewHumanPawn.SetBase(none);
        NewHumanPawn.SetPhysics(2);
        NewHumanPawn.SetLocation(VSLocation);
        NewHumanPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        NewHumanPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);        
    }
    else
    {
        // End:0x220
        if(VSLocation != vect(0.0000000, 0.0000000, 0.0000000))
        {
            SetLocation(VSLocation);
        }
    }
    IncrementStat('Stat_DeathsInVS');
    //return;    
}

function FindMusicPlayerVSPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], VSPawnIt;

    VSPawnIt = LPVSPlayerPawn(Pawn);
    // End:0x35
    if(VSPawnIt != none)
    {
        return VSPawnIt;
    }
    // End:0xC1
    foreach WorldInfo.AllPawns(Class'LPVSPlayerPawn', VSPawnIt)
    {
        // End:0xC0
        if((VSPawnIt.GameMusicPlayerAudioComp != none) || VSPawnIt.UserMusicPlayerAudioComp != none)
        {            
            return VSPawnIt;
        }        
    }    
    return none;
    //return ReturnValue;    
}

reliable client simulated event ClientAutoResumeVSMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool bAutoResume[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    // End:0x7A
    if(bAutoResume)
    {
        AutoResumeMusicPlayerOnDisableCount++;
        vsPawn = FindMusicPlayerVSPawn();
        // End:0x77
        if(vsPawn != none)
        {
            bVSGameMusicPlayingOnDisable = IsGameMusicPlayerPlaying(vsPawn);
            bVSUserMusicPlayingOnDisable = IsUserMusicPlayerPlaying(vsPawn);
        }        
    }
    else
    {
        AutoResumeMusicPlayerOnDisableCount--;
        // End:0x187
        if(AutoResumeMusicPlayerOnDisableCount <= 0)
        {
            vsPawn = FindMusicPlayerVSPawn();
            // End:0x16F
            if(vsPawn != none)
            {
                // End:0x16C
                if(IsAllowedToPlayMusicPlayer(vsPawn))
                {
                    // End:0x11B
                    if(bVSGameMusicPlayingOnDisable && int(vsPawn.CurrentMusicSource) == int(0))
                    {
                        ResumeVSMusicPlayer(vsPawn);                        
                    }
                    else
                    {
                        // End:0x169
                        if(bVSUserMusicPlayingOnDisable && int(vsPawn.CurrentMusicSource) == int(1))
                        {
                            ResumeVSMusicPlayer(vsPawn);                            
                        }
                    }                    
                }                
            }
            bVSGameMusicPlayingOnDisable = false;
            bVSUserMusicPlayingOnDisable = false;
        }
    }
    //return;    
}

reliable client simulated event ClientDisableVSGameMusic()
{
    local /*0x97E50000-0x00000000*/ private bool bDisable[8388609];

    // End:0x1B
    if(bDisable)
    {
        DisableVSGameMusicPlaybackCount++;        
    }
    else
    {
        DisableVSGameMusicPlaybackCount--;
    }
    //return;    
}

reliable client simulated event ClientDisableVSUserMusic()
{
    local /*0x97E50000-0x00000000*/ private bool bDisable[8388609];

    // End:0x1B
    if(bDisable)
    {
        DisableVSUserMusicPlaybackCount++;        
    }
    else
    {
        DisableVSUserMusicPlaybackCount--;
    }
    //return;    
}

function IsVSGameMusicDisabled()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if(LPMapInfo(WorldInfo.GetMapInfo()) != none)
    {
        // End:0x73
        if(LPMapInfo(WorldInfo.GetMapInfo()).bDisableVSGameMusicPlaybackForMap)
        {
            return true;
        }        
    }
    // End:0x87
    if(DisableVSGameMusicPlaybackCount > 0)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsVSUserMusicDisabled()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if(LPMapInfo(WorldInfo.GetMapInfo()) != none)
    {
        // End:0x73
        if(LPMapInfo(WorldInfo.GetMapInfo()).bDisableVSUserMusicPlaybackForMap)
        {
            return true;
        }        
    }
    // End:0x87
    if(DisableVSUserMusicPlaybackCount > 0)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function NotifyNewTrack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL inTrackInfo[9437185], vsPawn;

    // End:0xAE
    if(bIsInVitalSuit)
    {
        // End:0x44
        if(myLPHUD != none)
        {
            myLPHUD.ShowMusicPlayer(true, -1, false, true);
        }
        vsPawn = LPVSPlayerPawn(Pawn);
        // End:0xAE
        if((vsPawn != none) && int(vsPawn.CurrentMusicSource) == int(0))
        {
            ClearTimer('NotifyNewTrack');
        }
    }
    //return;    
}

function GetCurrentVSMusicPlayerTrack()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL ReturnValue[92274689], CurrentTrack, vsPawn, UserMusicPlayer, GameTrackInfo;

    vsPawn = LPVSPlayerPawn(Pawn);
    // End:0x48C
    if(vsPawn != none)
    {
        // End:0x142
        if(int(vsPawn.CurrentMusicSource) == int(1))
        {
            // End:0xC7
            if(!IsVSUserMusicDisabled())
            {
                UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
                // End:0xC4
                if(UserMusicPlayer != none)
                {
                    UserMusicPlayer.GetCurrentTrackInfo(CurrentTrack);
                }                
            }
            else
            {
                CurrentTrack.Title = Localize("JobLog", "VSUserMusicTrackDisabled", "LostPlanetGame");
                CurrentTrack.Artist = "";
            }            
        }
        else
        {
            // End:0x414
            if(!IsVSGameMusicDisabled())
            {
                // End:0x411
                if(((vsPawn.GameMusicPlayerAudioComp != none) && vsPawn.GameMusicPlayerAudioComp.PlayEvent != none) && vsPawn.CurrentGameMusicTrack > 0)
                {
                    // End:0x328
                    if(vsPawn.CurrentGameMusicTrack <= vsPawn.GameMusicPlayerAudioComp.PlayEvent.TrackList.Length)
                    {
                        GameTrackInfo = vsPawn.GameMusicPlayerAudioComp.PlayEvent.TrackList[vsPawn.CurrentGameMusicTrack - 1];
                        CurrentTrack.Title = GameTrackInfo.Title;
                        CurrentTrack.Artist = GameTrackInfo.Artist;
                    }
                    // End:0x39A
                    if(Len(CurrentTrack.Title) == 0)
                    {
                        CurrentTrack.Title = "VS Game Track" @ string(vsPawn.CurrentGameMusicTrack);
                    }
                    // End:0x411
                    if(Len(CurrentTrack.Artist) == 0)
                    {
                        CurrentTrack.Artist = Localize("SPAkMusicPlayer", "UnknownMetadata", "SPEngine");
                    }
                }                
            }
            else
            {
                CurrentTrack.Title = Localize("JobLog", "VSGameMusicTrackDisabled", "LostPlanetGame");
                CurrentTrack.Artist = "";
            }
        }
    }
    return CurrentTrack;
    //return ReturnValue;    
}

function GetVSPlaylistList()
{
    local /*0x97E50000-0x00000000*/ private byte Type[8519681];
    local /*0x97E50000-0x00000000*/ private editfixedsize array PlaylistList[25165825];
    local /*0x97E50000-0x00000000*/ private bool bIncludeVSSoundTracks[8388609], bIncludeUserSoundTracks, ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL UserMusicPlayer, vsPawn, GameMusicPlaylist;

    // End:0x77
    if(bIncludeUserSoundTracks)
    {
        UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
        // End:0x77
        if(UserMusicPlayer != none)
        {
            UserMusicPlayer.GetPlaylistList(Type, PlaylistList);
        }
    }
    // End:0x339
    if(bIncludeVSSoundTracks)
    {
        vsPawn = LPVSPlayerPawn(Pawn);
        // End:0x339
        if(((vsPawn != none) && vsPawn.GameMusicPlayerAudioComp != none) && vsPawn.GameMusicPlayerAudioComp.PlayEvent != none)
        {
            GameMusicPlaylist.Name = vsPawn.GameMusicPlayerAudioComp.PlayEvent.PlaylistName;
            // End:0x20F
            if(Len(GameMusicPlaylist.Name) == 0)
            {
                GameMusicPlaylist.Name = Class'SPEngine.SPUtil'.static.GetLocalizedString("<Strings:LostPlanetGame.JobLog.DefaultMusicPlaylistName>");
            }
            GameMusicPlaylist.Type = Type;
            GameMusicPlaylist.bShuffleTracks = false;
            GameMusicPlaylist.bRepeatList = vsPawn.bRepeatGameMusicPlaylist;
            GameMusicPlaylist.bNumTracksKnown = true;
            GameMusicPlaylist.NumTracks = vsPawn.TuneDataVSPlayerPawn.NumMusicTracks;
            GameMusicPlaylist.TrackIndex = -1;
            PlaylistList.InsertItem(0, GameMusicPlaylist);            
        }
    }
    return ((PlaylistList.Length > 0) ? true : false);
    //return ReturnValue;    
}

function SetCurrentVSPlaylist()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL inPlaylist[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, UserMusicPlayer;
    local /*0x97E50000-0x00000000*/ private bool bResult;

    vsPawn = LPVSPlayerPawn(Pawn);
    // End:0x2AA
    if(vsPawn != none)
    {
        // End:0x163
        if(inPlaylist.TrackIndex == -1)
        {
            // End:0xF6
            if(int(vsPawn.CurrentMusicSource) == int(1))
            {
                UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
                // End:0xF6
                if((UserMusicPlayer != none) && UserMusicPlayer.IsPlaying())
                {
                    UserMusicPlayer.StopMusic();
                }
            }
            bResult = true;
            vsPawn.CurrentMusicSource = 0;
            vsPawn.bRepeatGameMusicPlaylist = inPlaylist.bRepeatList;            
        }
        else
        {
            // End:0x21D
            if(int(vsPawn.CurrentMusicSource) == int(0))
            {
                // End:0x21D
                if((vsPawn.GameMusicPlayerAudioComp != none) && vsPawn.GameMusicPlayerAudioComp.IsPlaying())
                {
                    vsPawn.GameMusicPlayerAudioComp.Stop();
                }
            }
            UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
            // End:0x289
            if(UserMusicPlayer != none)
            {
                bResult = UserMusicPlayer.SetCurrentPlaylist(inPlaylist);
            }
            vsPawn.CurrentMusicSource = 1;
        }
    }
    return bResult;
    //return ReturnValue;    
}

function IsAllowedToPlayMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x55
    if(vsPawn != none)
    {
        // End:0x48
        if(int(vsPawn.CurrentMusicSource) == int(1))
        {
            return !IsVSUserMusicDisabled();            
        }
        else
        {
            return !IsVSGameMusicDisabled();
        }
    }
    return false;
    //return ReturnValue;    
}

function IsGameMusicPlayerPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x23
    if(vsPawn == none)
    {
        vsPawn = FindMusicPlayerVSPawn();
    }
    // End:0xB6
    if(vsPawn != none)
    {
        // End:0xB6
        if(int(vsPawn.CurrentMusicSource) == int(0))
        {
            return (vsPawn.GameMusicPlayerAudioComp != none) && vsPawn.GameMusicPlayerAudioComp.IsPlaying();
        }
    }
    return false;
    //return ReturnValue;    
}

function IsUserMusicPlayerPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL UserMusicPlayer;

    // End:0x23
    if(vsPawn == none)
    {
        vsPawn = FindMusicPlayerVSPawn();
    }
    // End:0xB6
    if(vsPawn != none)
    {
        // End:0xB6
        if(int(vsPawn.CurrentMusicSource) == int(1))
        {
            UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
            return (UserMusicPlayer != none) && UserMusicPlayer.IsPlaying();
        }
    }
    return false;
    //return ReturnValue;    
}

function IsMusicPlayerPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3F
    if(vsPawn != none)
    {
        // End:0x27
        if(IsGameMusicPlayerPlaying(vsPawn))
        {
            return true;
        }
        // End:0x3F
        if(IsUserMusicPlayerPlaying(vsPawn))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function IsMusicPlayerPaused()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL UserMusicPlayer;
    local /*0x97E50000-0x00000000*/ private bool bIsPausedNow;

    bIsPausedNow = false;
    // End:0x111
    if(vsPawn != none)
    {
        // End:0xAC
        if(int(vsPawn.CurrentMusicSource) == int(1))
        {
            UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
            bIsPausedNow = (UserMusicPlayer != none) && UserMusicPlayer.IsPaused();            
        }
        else
        {
            bIsPausedNow = (vsPawn.GameMusicPlayerAudioComp != none) && vsPawn.GameMusicPlayerAudioComp.IsPaused();
        }
    }
    return bIsPausedNow;
    //return ReturnValue;    
}

function @NULL PlayNotAllowedMusicControllerEvent()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn[8388609], ACB, AkComp;

    // End:0x110
    if(vsPawn != none)
    {
        ACB = vsPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('VSMusicPlayerNotAllowed', 'None', vsPawn, none);
        // End:0x110
        if(ACB != none)
        {
            AkComp = AkComponent(ACB);
            // End:0x110
            if(AkComp != none)
            {
                AkComp.BoneName = 'JO_PlayerCamera';
                AkComp.bUseLocation = false;
                AkComp.bAutoDestroy = true;
            }
        }
    }
    //return;    
}

function MusicPlayerStart()
{
    // End:0xB4
    if(IsOkToPlayMusic())
    {
        // End:0x75
        if(IsAllowedToPlayMusicPlayer(LPVSPlayerPawn(Pawn)))
        {
            bVSGameMusicPlayingOnDisable = false;
            bVSUserMusicPlayingOnDisable = false;
            bVSMusicPlayerPausedbyPlayer = false;
            TurnOnVSMusicPlayer();
            SetTimer(1.0000000, false, 'NotifyNewTrack');            
        }
        else
        {
            PlayNotAllowedMusicControllerEvent(LPVSPlayerPawn(Pawn));
            myLPHUD.ShowMusicPlayerPlay(true);
        }        
    }
    else
    {
        // End:0x108
        if(LPVSPlayerPawn(Pawn) != none)
        {
            PlayNotAllowedMusicControllerEvent(LPVSPlayerPawn(Pawn));
            myLPHUD.ShowMusicPlayerPlay(true);
        }
    }
    //return;    
}

function MusicPlayerPlay()
{
    local /*0x97E50000-0x00000000*/ private bool bDisabled;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPVSPlayerPawn(Pawn);
    // End:0x1B4
    if(IsOkToPlayMusic())
    {
        bDisabled = !IsAllowedToPlayMusicPlayer(vsPawn);
        // End:0x7D
        if(!bDisabled)
        {
            bVSGameMusicPlayingOnDisable = false;
            bVSUserMusicPlayingOnDisable = false;
            bVSMusicPlayerPausedbyPlayer = false;
        }
        // End:0xDE
        if(!IsMusicPlayerPlaying(vsPawn))
        {
            // End:0xB2
            if(!bDisabled)
            {
                TurnOnVSMusicPlayer();
            }
            myLPHUD.ShowMusicPlayerPlay(bDisabled);            
        }
        else
        {
            // End:0x14B
            if(!IsMusicPlayerPaused(vsPawn))
            {
                // End:0x111
                if(!bDisabled)
                {
                    bVSMusicPlayerPausedbyPlayer = true;
                }
                PostVSMusicPlayerControlEvent(2);
                myLPHUD.ShowMusicPlayerPause(bDisabled);                
            }
            else
            {
                // End:0x168
                if(!bDisabled)
                {
                    PostVSMusicPlayerControlEvent(3);
                }
                myLPHUD.ShowMusicPlayerPlay(bDisabled);
            }
        }
        // End:0x1B1
        if(bDisabled)
        {
            PlayNotAllowedMusicControllerEvent(vsPawn);
        }        
    }
    else
    {
        // End:0x1F6
        if(vsPawn != none)
        {
            myLPHUD.ShowMusicPlayerPlay(true);
            PlayNotAllowedMusicControllerEvent(vsPawn);
        }
    }
    //return;    
}

function MusicPlayerStop()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed;

    vsPawn = LPVSPlayerPawn(Pawn);
    // End:0xF1
    if(IsOkToPlayMusic())
    {
        bIsNotAllowed = !IsAllowedToPlayMusicPlayer(vsPawn);
        // End:0xA6
        if(!bIsNotAllowed && IsMusicPlayerPlaying(vsPawn))
        {
            bVSGameMusicPlayingOnDisable = false;
            bVSUserMusicPlayingOnDisable = false;
            bVSMusicPlayerPausedbyPlayer = false;
            PostVSMusicPlayerControlEvent(1);            
        }
        else
        {
            bIsNotAllowed = true;
            PlayNotAllowedMusicControllerEvent(vsPawn);
        }
        myLPHUD.ShowMusicPlayerStop(bIsNotAllowed);        
    }
    else
    {
        // End:0x133
        if(vsPawn != none)
        {
            PlayNotAllowedMusicControllerEvent(vsPawn);
            myLPHUD.ShowMusicPlayerStop(true);
        }
    }
    //return;    
}

function MusicPlayerPrev()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed;

    vsPawn = LPVSPlayerPawn(Pawn);
    // End:0x13E
    if(IsOkToPlayMusic())
    {
        bIsNotAllowed = !IsAllowedToPlayMusicPlayer(vsPawn);
        // End:0xF3
        if(IsMusicPlayerPlaying(vsPawn))
        {
            // End:0xCA
            if(!bIsNotAllowed)
            {
                bVSGameMusicPlayingOnDisable = false;
                bVSUserMusicPlayingOnDisable = false;
                bVSMusicPlayerPausedbyPlayer = false;
                PrevTrackVSMusicPlayer();
                // End:0xC7
                if(IsMusicPlayerPaused(vsPawn))
                {
                    ResumeVSMusicPlayer(vsPawn);
                }                
            }
            else
            {
                PauseVSMusicPlayer(vsPawn);
                PlayNotAllowedMusicControllerEvent(vsPawn);
            }            
        }
        else
        {
            bIsNotAllowed = true;
            PlayNotAllowedMusicControllerEvent(vsPawn);
        }
        myLPHUD.ShowMusicPlayerPrev(bIsNotAllowed);        
    }
    else
    {
        // End:0x180
        if(vsPawn != none)
        {
            PlayNotAllowedMusicControllerEvent(vsPawn);
            myLPHUD.ShowMusicPlayerPrev(true);
        }
    }
    //return;    
}

function MusicPlayerNext()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;
    local /*0x97E50000-0x00000000*/ private bool bIsNotAllowed;

    vsPawn = LPVSPlayerPawn(Pawn);
    // End:0x13E
    if(IsOkToPlayMusic())
    {
        bIsNotAllowed = !IsAllowedToPlayMusicPlayer(vsPawn);
        // End:0xF3
        if(IsMusicPlayerPlaying(vsPawn))
        {
            // End:0xCA
            if(!bIsNotAllowed)
            {
                bVSGameMusicPlayingOnDisable = false;
                bVSUserMusicPlayingOnDisable = false;
                bVSMusicPlayerPausedbyPlayer = false;
                NextTrackVSMusicPlayer();
                // End:0xC7
                if(IsMusicPlayerPaused(vsPawn))
                {
                    ResumeVSMusicPlayer(vsPawn);
                }                
            }
            else
            {
                PauseVSMusicPlayer(vsPawn);
                PlayNotAllowedMusicControllerEvent(vsPawn);
            }            
        }
        else
        {
            bIsNotAllowed = true;
            PlayNotAllowedMusicControllerEvent(vsPawn);
        }
        myLPHUD.ShowMusicPlayerNext(bIsNotAllowed);        
    }
    else
    {
        // End:0x180
        if(vsPawn != none)
        {
            PlayNotAllowedMusicControllerEvent(vsPawn);
            myLPHUD.ShowMusicPlayerNext(true);
        }
    }
    //return;    
}

exec function TurnOnVSMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ForceVSPawn[9437185];
    local /*0x97E50000-0x00000000*/ private bool bPlayStartEvent[9437185], bStartPaused, bIsKismetEvent;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, UserMusicPlayer;

    none
    true
    false
    false
    vsPawn = ((ForceVSPawn != none) ? ForceVSPawn : LPVSPlayerPawn(Pawn));
    // End:0x6C
    if(!IsAllowedToPlayMusicPlayer(vsPawn))
    {
        ScriptTrace();
    }
    // End:0x98
    if(bPlayStartEvent)
    {
        PostVSMusicPlayerControlEvent(0, ForceVSPawn, bIsKismetEvent);
    }
    // End:0x3C6
    if(vsPawn != none)
    {
        // End:0x1A7
        if(int(vsPawn.CurrentMusicSource) == int(1))
        {
            UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
            // End:0x1A4
            if(UserMusicPlayer != none)
            {
                // End:0x1A1
                if(UserMusicPlayer.StartMusic())
                {
                    vsPawn.SetVSMusicPlayerState(vsPawn.UserMusicPlayerAudioComp, bIsInVitalSuit);
                    // End:0x19E
                    if(bStartPaused)
                    {
                        UserMusicPlayer.PauseMusic();
                    }                    
                }                
            }            
        }
        else
        {
            // End:0x3C6
            if(vsPawn.GameMusicPlayerAudioComp != none)
            {
                // End:0x3C3
                if(!vsPawn.GameMusicPlayerAudioComp.IsPlaying())
                {
                    vsPawn.GameMusicPlayerAudioComp.Play();
                    // End:0x3C0
                    if(vsPawn.GameMusicPlayerAudioComp.IsPlaying())
                    {
                        // End:0x30B
                        if((vsPawn.CurrentGameMusicTrack < 1) || vsPawn.CurrentGameMusicTrack > vsPawn.TuneDataVSPlayerPawn.NumMusicTracks)
                        {
                            vsPawn.CurrentGameMusicTrack = 1;
                        }
                        vsPawn.SetVSMusicPlayerState(vsPawn.GameMusicPlayerAudioComp, bIsInVitalSuit);
                        // End:0x396
                        if(bStartPaused)
                        {
                            vsPawn.GameMusicPlayerAudioComp.Pause();                            
                        }
                        else
                        {
                            ClearTimer('NotifyNewTrack');
                            SetTimer(1.0000000, false, 'NotifyNewTrack');
                        }                        
                    }                    
                }                
            }
        }
    }
    //return;    
}

exec function TurnOffVSMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ForceVSPawn[9437185], vsPawn, UserMusicPlayer;

    none
    vsPawn = ((ForceVSPawn != none) ? ForceVSPawn : LPVSPlayerPawn(Pawn));
    // End:0x183
    if(vsPawn != none)
    {
        // End:0xF2
        if(int(vsPawn.CurrentMusicSource) == int(1))
        {
            UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
            // End:0xEF
            if((UserMusicPlayer != none) && UserMusicPlayer.IsPlaying())
            {
                UserMusicPlayer.StopMusic();
            }            
        }
        else
        {
            // End:0x183
            if((vsPawn.GameMusicPlayerAudioComp != none) && vsPawn.GameMusicPlayerAudioComp.IsPlaying())
            {
                vsPawn.GameMusicPlayerAudioComp.Stop();
            }
        }
    }
    //return;    
}

exec function PauseVSMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ForceVSPawn[9437185], vsPawn, UserMusicPlayer;

    none
    vsPawn = ((ForceVSPawn != none) ? ForceVSPawn : LPVSPlayerPawn(Pawn));
    // End:0x1F1
    if(vsPawn != none)
    {
        // End:0x11D
        if(int(vsPawn.CurrentMusicSource) == int(1))
        {
            UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
            // End:0x11A
            if(UserMusicPlayer != none)
            {
                // End:0x117
                if(UserMusicPlayer.IsPlaying())
                {
                    // End:0x114
                    if(!UserMusicPlayer.IsPaused())
                    {
                        UserMusicPlayer.PauseMusic();                        
                    }                    
                }                
            }            
        }
        else
        {
            // End:0x1EE
            if(vsPawn.GameMusicPlayerAudioComp != none)
            {
                // End:0x1EB
                if(vsPawn.GameMusicPlayerAudioComp.IsPlaying())
                {
                    // End:0x1E8
                    if(!vsPawn.GameMusicPlayerAudioComp.IsPaused())
                    {
                        vsPawn.GameMusicPlayerAudioComp.Pause();                        
                    }                    
                }                
            }
        }        
    }
    //return;    
}

exec function @NULL ResumeVSMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ForceVSPawn[9437185], vsPawn, UserMusicPlayer, ResumedAkComp;

    none
    vsPawn = ((ForceVSPawn != none) ? ForceVSPawn : LPVSPlayerPawn(Pawn));
    // End:0x21F
    if(vsPawn != none)
    {
        // End:0x11E
        if(int(vsPawn.CurrentMusicSource) == int(1))
        {
            UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
            // End:0x11B
            if(UserMusicPlayer != none)
            {
                // End:0x118
                if(UserMusicPlayer.IsPaused())
                {
                    UserMusicPlayer.ResumeMusic();
                    ResumedAkComp = vsPawn.UserMusicPlayerAudioComp;                    
                }                
            }            
        }
        else
        {
            // End:0x1DB
            if(vsPawn.GameMusicPlayerAudioComp != none)
            {
                // End:0x1D8
                if(vsPawn.GameMusicPlayerAudioComp.IsPaused())
                {
                    vsPawn.GameMusicPlayerAudioComp.Resume();
                    ResumedAkComp = vsPawn.GameMusicPlayerAudioComp;                    
                }                
            }
        }
        // End:0x21C
        if(ResumedAkComp != none)
        {
            vsPawn.SetVSMusicPlayerState(ResumedAkComp, bIsInVitalSuit);
        }        
    }
    //return;    
}

exec function NextTrackVSMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ForceVSPawn[9437185], vsPawn, UserMusicPlayer;

    none
    PostVSMusicPlayerControlEvent(4, ForceVSPawn);
    vsPawn = ((ForceVSPawn != none) ? ForceVSPawn : LPVSPlayerPawn(Pawn));
    // End:0x243
    if(vsPawn != none)
    {
        // End:0x108
        if(int(vsPawn.CurrentMusicSource) == int(1))
        {
            UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
            // End:0x105
            if((UserMusicPlayer != none) && UserMusicPlayer.IsPlaying())
            {
                UserMusicPlayer.PlayNextTrack();
            }            
        }
        else
        {
            // End:0x243
            if((vsPawn.GameMusicPlayerAudioComp != none) && vsPawn.GameMusicPlayerAudioComp.IsPlaying())
            {
                vsPawn.CurrentGameMusicTrack += 1;
                // End:0x1FC
                if(vsPawn.CurrentGameMusicTrack > vsPawn.TuneDataVSPlayerPawn.NumMusicTracks)
                {
                    vsPawn.CurrentGameMusicTrack = 1;
                }
                vsPawn.SetVSMusicPlayerState(vsPawn.GameMusicPlayerAudioComp, bIsInVitalSuit);
            }
        }
    }
    //return;    
}

exec function PrevTrackVSMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ForceVSPawn[9437185], vsPawn, UserMusicPlayer;

    none
    PostVSMusicPlayerControlEvent(5, ForceVSPawn);
    vsPawn = ((ForceVSPawn != none) ? ForceVSPawn : LPVSPlayerPawn(Pawn));
    // End:0x243
    if(vsPawn != none)
    {
        // End:0x108
        if(int(vsPawn.CurrentMusicSource) == int(1))
        {
            UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
            // End:0x105
            if((UserMusicPlayer != none) && UserMusicPlayer.IsPlaying())
            {
                UserMusicPlayer.PlayPreviousTrack();
            }            
        }
        else
        {
            // End:0x243
            if((vsPawn.GameMusicPlayerAudioComp != none) && vsPawn.GameMusicPlayerAudioComp.IsPlaying())
            {
                vsPawn.CurrentGameMusicTrack -= 1;
                // End:0x1FC
                if(vsPawn.CurrentGameMusicTrack < 1)
                {
                    vsPawn.CurrentGameMusicTrack = vsPawn.TuneDataVSPlayerPawn.NumMusicTracks;
                }
                vsPawn.SetVSMusicPlayerState(vsPawn.GameMusicPlayerAudioComp, bIsInVitalSuit);
            }
        }
    }
    //return;    
}

simulated function OnToggleVSMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    KismetToggleVSMusicPlayer(inAction);
    //return;    
}

reliable client simulated function KismetToggleVSMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ForceVSPawn[9437185], vsPawn;

    false
    none
    vsPawn = ((ForceVSPawn != none) ? ForceVSPawn : LPVSPlayerPawn(Pawn));
    // End:0x222
    if(vsPawn != none)
    {
        // End:0x222
        if((int(vsPawn.CurrentMusicSource) == int(0)) && IsOkToPlayMusic(bForce))
        {
            // End:0xF6
            if(inAction.TrackNumber != -1)
            {
                vsPawn.CurrentGameMusicTrack = inAction.TrackNumber;
            }
            // End:0x146
            if(inAction.InputLinks[0].bHasImpulse)
            {
                TurnOnVSMusicPlayer(ForceVSPawn, true, false, true);                
            }
            else
            {
                // End:0x196
                if(inAction.InputLinks[1].bHasImpulse)
                {
                    PostVSMusicPlayerControlEvent(1, ForceVSPawn, true);                    
                }
                else
                {
                    // End:0x222
                    if(vsPawn.GameMusicPlayerAudioComp != none)
                    {
                        // End:0x20C
                        if(!vsPawn.GameMusicPlayerAudioComp.IsPlaying())
                        {
                            TurnOnVSMusicPlayer(vsPawn, true, false, true);                            
                        }
                        else
                        {
                            PostVSMusicPlayerControlEvent(1, vsPawn, true);
                        }
                    }
                }
            }
        }
    }
    //return;    
}

simulated function OnVSMusicPlayerControlContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    ClientVSMusicPlayerControl(inAction);
    //return;    
}

reliable client simulated function ClientVSMusicPlayerControl()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ForceVSPawn[9437185], vsPawn;

    false
    none
    // End:0x334
    if(IsOkToPlayMusic(bForce))
    {
        vsPawn = ((ForceVSPawn != none) ? ForceVSPawn : LPVSPlayerPawn(Pawn));
        // End:0x7A
        if(vsPawn == none)
        {
            vsPawn = FindMusicPlayerVSPawn();
        }
        // End:0x331
        if(vsPawn != none)
        {
            // End:0x239
            if(IsMusicPlayerPlaying(vsPawn))
            {
                // End:0x127
                if(inAction.InputLinks[1].bHasImpulse)
                {
                    // End:0x111
                    if(inAction.bPlaySquawkEvent)
                    {
                        PostVSMusicPlayerControlEvent(1, vsPawn, true);                        
                    }
                    else
                    {
                        TurnOffVSMusicPlayer(vsPawn);
                    }                    
                }
                else
                {
                    // End:0x1B0
                    if(inAction.InputLinks[2].bHasImpulse)
                    {
                        // End:0x19A
                        if(inAction.bPlaySquawkEvent)
                        {
                            PostVSMusicPlayerControlEvent(2, vsPawn, true);                            
                        }
                        else
                        {
                            PauseVSMusicPlayer(vsPawn);
                        }                        
                    }
                    else
                    {
                        // End:0x236
                        if(inAction.InputLinks[3].bHasImpulse)
                        {
                            // End:0x223
                            if(inAction.bPlaySquawkEvent)
                            {
                                PostVSMusicPlayerControlEvent(3, vsPawn, true);                                
                            }
                            else
                            {
                                ResumeVSMusicPlayer(vsPawn);
                            }
                        }
                    }
                }                
            }
            else
            {
                // End:0x331
                if(inAction.InputLinks[0].bHasImpulse)
                {
                    // End:0x331
                    if(int(vsPawn.CurrentMusicSource) == int(0))
                    {
                        // End:0x2FA
                        if(inAction.TrackNumber != 0)
                        {
                            vsPawn.CurrentGameMusicTrack = inAction.TrackNumber;
                        }
                        TurnOnVSMusicPlayer(vsPawn, inAction.bPlaySquawkEvent, false, true);                        
                    }
                }
            }
        }        
    }
    //return;    
}

exec function @NULL PostVSMusicPlayerControlEvent()
{
    local /*0x97E50000-0x00000000*/ private byte inAction[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ForceVSPawn[9437185];
    local /*0x97E50000-0x00000000*/ private bool bIsKismetEvent[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, ACB, AkComp;
    local /*0x97E50000-0x00000000*/ private name EventName;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> EventFinishedDelegate;
    local /*0x97E50000-0x00000000*/ private bool bIsPlayingNow, bIsPausedNow, bDoIt;

    none
    false
    vsPawn = ((ForceVSPawn != none) ? ForceVSPawn : LPVSPlayerPawn(Pawn));
    // End:0x3FA
    if(vsPawn != none)
    {
        bIsPlayingNow = IsMusicPlayerPlaying(vsPawn);
        bIsPausedNow = IsMusicPlayerPaused(vsPawn);
        switch(inAction)
        {
            // End:0xEB
            case 0:
                EventName = 'VSMusicPlayerStart';
                EventFinishedDelegate = None;
                bDoIt = !bIsPlayingNow;
                // End:0x2C4
                break;
            // End:0x136
            case 1:
                EventName = 'VSMusicPlayerStop';
                EventFinishedDelegate = StopEventFinished;
                bDoIt = bIsPlayingNow;
                // End:0x2C4
                break;
            // End:0x1AA
            case 2:
                EventName = ((bIsKismetEvent) ? 'VSMusicPlayerKismetPause' : 'VSMusicPlayerPause');
                EventFinishedDelegate = PauseEventFinished;
                bDoIt = bIsPlayingNow && !bIsPausedNow;
                // End:0x2C4
                break;
            // End:0x21C
            case 3:
                EventName = ((bIsKismetEvent) ? 'VSMusicPlayerKismetResume' : 'VSMusicPlayerResume');
                EventFinishedDelegate = ResumeEventFinished;
                bDoIt = bIsPlayingNow && bIsPausedNow;
                // End:0x2C4
                break;
            // End:0x267
            case 4:
                EventName = 'VSMusicPlayerNext';
                EventFinishedDelegate = None;
                bDoIt = bIsPlayingNow;
                // End:0x2C4
                break;
            // End:0x2B2
            case 5:
                EventName = 'VSMusicPlayerPrevious';
                EventFinishedDelegate = None;
                bDoIt = bIsPlayingNow;
                // End:0x2C4
                break;
            // End:0xFFFF
            default:
                bDoIt = false;
                // End:0x2C4
                break;
                break;
        }
        // End:0x3FA
        if(bDoIt)
        {
            ACB = vsPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx(EventName, 'None', vsPawn, none);
            // End:0x3FA
            if(ACB != none)
            {
                AkComp = AkComponent(ACB);
                // End:0x3FA
                if(AkComp != none)
                {
                    AkComp.BoneName = 'JO_PlayerCamera';
                    AkComp.bUseLocation = false;
                    AkComp.bAutoDestroy = true;
                    AkComp.__OnPlayEventFinished__Delegate = EventFinishedDelegate;
                }
            }
        }
    }
    //return;    
}

function @NULL StopEventFinished()
{
    local /*0x97E50000-0x00000400*/ private @NULL InAkComp[8388609];

    // End:0x40
    if(InAkComp != none)
    {
        TurnOffVSMusicPlayer(LPVSPlayerPawn(InAkComp.Owner));
    }
    //return;    
}

function @NULL PauseEventFinished()
{
    local /*0x97E50000-0x00000400*/ private @NULL InAkComp[8388609];

    // End:0x40
    if(InAkComp != none)
    {
        PauseVSMusicPlayer(LPVSPlayerPawn(InAkComp.Owner));
    }
    //return;    
}

function @NULL ResumeEventFinished()
{
    local /*0x97E50000-0x00000400*/ private @NULL InAkComp[8388609];

    // End:0x40
    if(InAkComp != none)
    {
        ResumeVSMusicPlayer(LPVSPlayerPawn(InAkComp.Owner));
    }
    //return;    
}

function IsRolling()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CanRoll()
{
    local /*0x97E50000-0x00000000*/ private bool bAllowRollFromHitReaction[9437185], ReturnValue;

    return ((!bIsInVitalSuit && DoesPlayerCSAAllowDodging()) && int(Pawn.Physics) != int(2)) && CanOverrideMoveWith(Class'LPSM_PlayerRollBase') || bAllowRollFromHitReaction && MySPPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_DirectionalHitReaction');
    //return ReturnValue;    
}

function CanDash()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((int(Pawn.Physics) != int(2)) && !IsDoingASpecialMove()) && (WorldInfo.TimeSeconds - LastVSDashTime) > LPTuneDataVSFuturePlayerPawn(LPVSFuturePlayerPawn(Pawn).TuneDataBasePawn).DashCooldownTime.GetValue();
    //return ReturnValue;    
}

function StartRoll()
{
    local /*0x97E50000-0x00000000*/ private class RollSMClass[8388609];

    // End:0x34
    if(IsLocalPlayerController())
    {
        DoSpecialMove(RollSMClass, true, true, OnRollSMFinished);
    }
    //return;    
}

function OnRollSMFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function AllowEvade()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetPlayerRoll()
{
    local /*0x97E50000-0x00000000*/ private bool bAllowRollFromHitReaction[9437185];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPI, relativeInputRot, relativeInput;
    local /*0x97E50000-0x00000000*/ private class RollSMClass;
    local /*0x97E50000-0x00000000*/ private bool bUseInfilteredInputValues;

    // End:0x1C
    if(!CanRoll(bAllowRollFromHitReaction))
    {
        return none;
    }
    LPPI = LPPlayerInput(PlayerInput);
    // End:0x6F
    if(MySPPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_DirectionalHitReaction'))
    {
        bUseInfilteredInputValues = true;
    }
    LPPI.GetRelativeInput(relativeInput, bUseInfilteredInputValues);
    relativeInputRot = Rotator(relativeInput);
    RollSMClass = none;
    // End:0x12B
    if((Abs(float(relativeInputRot.Yaw)) < float(8192)) && relativeInputRot.Yaw > -8192)
    {
        RollSMClass = Class'LPSM_PlayerRollForward';        
    }
    else
    {
        // End:0x18F
        if((relativeInputRot.Yaw > 8192) && relativeInputRot.Yaw < 24576)
        {
            RollSMClass = Class'LPSM_PlayerRollRight';            
        }
        else
        {
            // End:0x1F3
            if((relativeInputRot.Yaw < -8192) && relativeInputRot.Yaw > -24576)
            {
                RollSMClass = Class'LPSM_PlayerRollLeft';                
            }
            else
            {
                RollSMClass = Class'LPSM_PlayerRollBackward';
            }
        }
    }
    return RollSMClass;
    //return ReturnValue;    
}

simulated event HandleAnimNotifySpecialDodgeReady()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];

    //return;    
}

function ExtinguishIncendiaryDOT()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL SPP;
    local /*0x97E50000-0x00000000*/ private bool bExtinguished;
    local /*0x97E50000-0x00000000*/ private @NULL ActiveDOT;
    local /*0x97E50000-0x00000000*/ private editfixedsize array DOTIndicesToRemove;
    local /*0x97E50000-0x00000000*/ private int I;

    bExtinguished = false;
    SPP = SPPawn(Pawn);
    // End:0x233
    if(SPP != none)
    {
        I = 0;
        J0x42:

        // End:0x1B6 [Loop If]
        if(I < SPP.DOTComponent.ActiveDOTs.Length)
        {
            ActiveDOT = SPP.DOTComponent.ActiveDOTs[I];
            // End:0x1A8
            if(ClassIsChildOf(ActiveDOT.DOTInfo.DamageType, Class'LPDamageTypeARIncendiaryDOT') || ClassIsChildOf(ActiveDOT.DOTInfo.DamageType, Class'LPDamageTypeParticleIncendiaryDOT'))
            {
                SPP.DOTComponent.DeactivateDOT(ActiveDOT);
                DOTIndicesToRemove.AddItem(I);                
                bExtinguished = true;
            }
            I++;
            // [Loop Continue]
            goto J0x42;
        }
        I = DOTIndicesToRemove.Length - 1;
        J0x1CD:

        // End:0x233 [Loop If]
        if(I >= 0)
        {
            SPP.DOTComponent.ActiveDOTs.Remove(DOTIndicesToRemove[I], 1);            
            I--;
            // [Loop Continue]
            goto J0x1CD;
        }
    }
    return bExtinguished;
    //return ReturnValue;    
}

function GetVSDashAcceleration()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

function DecelerateDash()
{
    //return;    
}

function DashCooldownComplete()
{
    myLPHUD.ShowVSDash(false);
    //return;    
}

function IsDoingVSDash()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

reliable client simulated function ClientNotifyClearDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private int AttackType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AttackActor[8388609];

    // End:0x19
    if(SpecialDodgeActor != AttackActor)
    {
        return;
    }
    ClientNotifyDodgeWindow(AttackType, none);
    //return;    
}

function NotifyDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private int AttackType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AttackActor[8388609];

    // End:0x4B
    if(AttackActor != none)
    {
        TimeWasNotifiedOfDodgeWindowOpening = WorldInfo.TimeSeconds;
        TimeWasNotifiedOfDodgeWindowClosing = float(2147483647);        
    }
    else
    {
        TimeWasNotifiedOfDodgeWindowClosing = WorldInfo.TimeSeconds;
    }
    SpecialDodgeActor = AttackActor;
    SpecialDodgeType = AttackType;
    ClientNotifyDodgeWindow(AttackType, AttackActor);
    //return;    
}

reliable client simulated function ClientNotifyDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private int AttackType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AttackActor[8388609];

    SpecialDodgeActor = AttackActor;
    SpecialDodgeType = AttackType;
    HandleDodgeWindowTutorial(AttackType, AttackActor);
    // End:0x8D
    if(AttackActor != none)
    {
        TimeWasNotifiedOfDodgeWindowOpening = WorldInfo.TimeSeconds;
        TimeWasNotifiedOfDodgeWindowClosing = float(2147483647);        
    }
    else
    {
        TimeWasNotifiedOfDodgeWindowClosing = WorldInfo.TimeSeconds;
    }
    //return;    
}

function HandleDodgeWindowTutorial()
{
    local /*0x97E50000-0x00000000*/ private int AttackType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AttackActor[8388609];

    // End:0x139
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0xBA
        if(AttackActor != none)
        {
            // End:0x6A
            if((AttackType == 6) || AttackType == 7)
            {
                SetTutorialMode(9);                
            }
            else
            {
                // End:0x8A
                if(AttackType == 5)
                {
                    SetTutorialMode(8);                    
                }
                else
                {
                    // End:0xAA
                    if(AttackType == 8)
                    {
                        SetTutorialMode(10);                        
                    }
                    else
                    {
                        SetTutorialMode(5);
                    }
                }
            }            
        }
        else
        {
            // End:0xEC
            if((AttackType == 6) || AttackType == 7)
            {
                CloseTutorialMode(9);                
            }
            else
            {
                // End:0x10C
                if(AttackType == 5)
                {
                    CloseTutorialMode(8);                    
                }
                else
                {
                    // End:0x12C
                    if(AttackType == 8)
                    {
                        CloseTutorialMode(10);                        
                    }
                    else
                    {
                        CloseTutorialMode(5);
                    }
                }
            }
        }
    }
    //return;    
}

function NotifyCloseAllDodgeWindows()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpecialDodgePawn;

    SpecialDodgePawn = LPAIPawn(SpecialDodgeActor);
    // End:0x4A
    if(SpecialDodgePawn != none)
    {
        SpecialDodgePawn.NotifyAllPlayerDodgeWindowsClosed();
    }
    CloseTutorialMode(5);
    CloseTutorialMode(9);
    CloseTutorialMode(8);
    CloseTutorialMode(10);
    SpecialDodgeActor = none;
    SpecialDodgeType = -1;
    TimeWasNotifiedOfDodgeWindowClosing = WorldInfo.TimeSeconds;
    //return;    
}

function OnTransformFinish()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function VSExit_CenterPitch()
{
    //return;    
}

simulated function IsMeleeStompTargetInProximity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OPP;
    local /*0x97E50000-0x00000000*/ private float Distance;

    // End:0x110
    foreach Pawn.TouchingActors(Class'LPPlayerPawn', OPP)
    {
        // End:0x10F
        if(OPP.bIncapacitated && int(OPP.GetTeamNum()) != int(GetTeamNum()))
        {
            Distance = MyPlayerPawn.DistanceBetweenCollisionCylinders(OPP);
            // End:0x10F
            if(Distance <= MyPlayerPawn.TuneDataPlayerPawn.MeleeStompRange.GetValue())
            {                
                return true;
            }
        }        
    }    
    return false;
    //return ReturnValue;    
}

function CanMelee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bCanMelee;
    local /*0x97E50000-0x00000000*/ private float MinMeleeInterval;

    // End:0x5A
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        MinMeleeInterval = Class'LPSM_PlayerMeleeAttack'.default.BlendOutTime * float(2);        
    }
    else
    {
        MinMeleeInterval = Class'LPSM_PlayerMeleeAttack'.default.BlendOutTime;
    }
    bCanMelee = (((((!bIsInVitalSuit && (WorldInfo.TimeSeconds - LastMeleeTime) > MinMeleeInterval) && LPWeapon(Pawn.Weapon) != none) && !IsMoveInputIgnored()) && int(Pawn.Physics) != int(2)) && !MyBasePlayerPawn.IsAimingDownSight() || !LPWeapon(Pawn.Weapon).HasCameraModeOverride()) && !IsDoingASpecialMove() || MyBasePlayerPawn.GetCurrentSpecialMoveInstance().CanOverrideMoveWith(Class'LPSM_PlayerMeleeAttack');
    return bCanMelee;
    //return ReturnValue;    
}

function DisplayMeleeMessage_Stomp()
{
    // End:0x89
    if(IsLocalPlayerController())
    {
        myLPHUD.DisplayHUDMessageLayer(9, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_MeleeStomp>", -1.0000000, IsMeleeStompTargetInProximity);
    }
    //return;    
}

function StartMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherPlayerPawn, OtherPawn, BestCandidateChoreography, PlayerToPawn;
    local /*0x97E50000-0x00000000*/ private float BestRating, Rating, Distance, dotProduct, MaxDistance, FacingDotProduct,
	    PositionDotProduct;

    local /*0x97E50000-0x00000000*/ private @NULL SearchDirection, MeleeCombatWindow;
    local /*0x97E50000-0x00000000*/ private class MeleeSMClass;
    local /*0x97E50000-0x00000000*/ private @NULL OtherRot, myRot;
    local /*0x97E50000-0x00000000*/ private bool bWasADS;

    bWasADS = IsAimingDownSight();
    SetAimDownSightMode(false);
    LPPRI(PlayerReplicationInfo).PerksManager.DeactivateDeploymentMode();
    PlayerMoveInfo.bMeleeButtonPressed = false;
    // End:0x159
    if(MyPlayerPawn.FindValidActiveCombatWindow(Class'LPCombatWindow_Melee', MeleeCombatWindow))
    {
        PauseFire();
        MeleeSMClass = MeleeCombatWindow.Publisher.GetSMForCombatWindow_Melee(MeleeCombatWindow);
        MyPlayerPawn.ServerDoSpecialMove(MeleeSMClass, true, false, OnMeleeSMFinished, MeleeCombatWindow.Publisher);
        return;
    }
    myRot = MatrixGetRotator(Pawn.Mesh.GetBoneMatrix(Pawn.Mesh.MatchRefBone('JO_hip')));
    myRot.Yaw += 16384;
    SearchDirection = Vector(myRot);
    MaxDistance = MyPlayerPawn.TuneDataPlayerPawn.MaxDistanceCandidateForChoreography;
    PositionDotProduct = Cos(MyPlayerPawn.TuneDataPlayerPawn.MinAngleDegreesCandidateForChoreography * 0.0174533);
    FacingDotProduct = Cos(MyPlayerPawn.TuneDataPlayerPawn.MeleeTakedownMaxDifferenceInFacingDirections.GetValue() * 0.0174533);
    BestCandidateChoreography = none;
    // End:0x7F0
    foreach MySPPawn.WorldInfo.AllPawns(Class'LPPawn', OtherPawn)
    {
        // End:0x39D
        if(((OtherPawn == none) || OtherPawn == Pawn) || !OtherPawn.IsValidMeleeTargetNonCombatWindow())
        {
            continue;            
        }
        // End:0x3CF
        if(!OtherPawn.IsValidEnemyTargetFor(PlayerReplicationInfo, true))
        {
            continue;            
        }
        // End:0x41A
        if(OtherPawn.HasDamageImmunityWithEffects() || OtherPawn.IsInCover())
        {
            continue;            
        }
        // End:0x4AF
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            // End:0x4AF
            if(OtherPawn.IsDoingASpecialMove() && !OtherPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_MeleeTakedownAllowed, self))
            {
                continue;                
            }
        }
        // End:0x4DC
        if(OtherPawn.TimeSinceLastRendered() > 0.1000000)
        {
            continue;            
        }
        // End:0x4F8
        if(LPAIPawnDefender(OtherPawn) != none)
        {
            continue;            
        }
        Distance = MyPlayerPawn.DistanceBetweenCollisionCylinders(OtherPawn);
        // End:0x545
        if(Distance > MaxDistance)
        {
            continue;            
        }
        PlayerToPawn = Normal(OtherPawn.Location - MyPlayerPawn.Location);
        // End:0x5F4
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            dotProduct = PlayerToPawn Dot SearchDirection;
            // End:0x5F1
            if(dotProduct < PositionDotProduct)
            {
                continue;                
            }            
        }
        else
        {
            OtherPlayerPawn = LPPlayerPawn(OtherPawn);
            // End:0x655
            if((OtherPlayerPawn != none) && OtherPlayerPawn.bIncapacitated)
            {
                dotProduct = 1.0000000;                
            }
            else
            {
                OtherRot = MatrixGetRotator(OtherPawn.Mesh.GetBoneMatrix(OtherPawn.Mesh.MatchRefBone('JO_hip')));
                OtherRot.Yaw += 16384;
                dotProduct = PlayerToPawn Dot (Vector(OtherRot) * float(-1));
                // End:0x756
                if((dotProduct >= float(0)) || Abs(dotProduct) < PositionDotProduct)
                {
                    continue;                    
                }
                dotProduct = 1.0000000;
            }
        }
        Rating = (1.0000000 - (Distance / MaxDistance)) + ((dotProduct - PositionDotProduct) / (1.0000000 - PositionDotProduct));
        // End:0x7EF
        if(Rating > BestRating)
        {
            BestRating = Rating;
            BestCandidateChoreography = OtherPawn;
        }        
    }    
    OtherPlayerPawn = LPPlayerPawn(BestCandidateChoreography);
    // End:0xB8D
    if(((int(WorldInfo.NetMode) != int(NM_Standalone)) && OtherPlayerPawn != none) && !bWasADS)
    {
        Distance = MyPlayerPawn.DistanceBetweenCollisionCylinders(OtherPlayerPawn);
        // End:0x974
        if(OtherPlayerPawn.bIncapacitated)
        {
            // End:0x971
            if(Distance <= MyPlayerPawn.TuneDataPlayerPawn.MeleeStompRange.GetValue())
            {
                LPPRI(PlayerReplicationInfo).PerksManager.DeactivateDeploymentMode();
                DoSpecialMove(Class'LPSM_PlayerMeleeStomp', true, false, OnMeleeSMFinished, OtherPlayerPawn);
                return;
            }            
        }
        else
        {
            // End:0xB8D
            if(Distance <= MyPlayerPawn.TuneDataPlayerPawn.MeleeTakedownRange.GetValue())
            {
                OtherRot = MatrixGetRotator(OtherPlayerPawn.Mesh.GetBoneMatrix(OtherPlayerPawn.Mesh.MatchRefBone('JO_hip')));
                OtherRot.Yaw += 16384;
                dotProduct = Vector(OtherRot) Dot SearchDirection;
                // End:0xB8D
                if(MyPlayerPawn.IsPawnAMeleeTakedownTarget(OtherPlayerPawn, OtherRot, FacingDotProduct, PositionDotProduct, Distance))
                {
                    // End:0xB8D
                    if(dotProduct >= FacingDotProduct)
                    {
                        // End:0xB8D
                        if(!OtherPlayerPawn.HasDamageImmunityWithEffects())
                        {
                            LPPRI(PlayerReplicationInfo).PerksManager.DeactivateDeploymentMode();
                            DoSpecialMove(Class'LPSM_PlayerMeleeTakedown', true, false, OnMeleeSMFinished, OtherPlayerPawn);
                            return;
                        }
                    }
                }
            }
        }
    }
    // End:0xB9E
    if(!bMeleeEnabled)
    {
        return;
    }
    // End:0xC48
    if(VSize(MyPlayerPawn.Velocity) > (MyPlayerPawn.GroundSpeed * MyPlayerPawn.TuneDataPlayerPawn.PercentOfMaxSpeedForMovingMelee))
    {
        DoSpecialMove(Class'LPSM_PlayerMeleeAttackMoving', true, false, OnMeleeSMFinished, BestCandidateChoreography);        
    }
    else
    {
        // End:0xCEB
        if((BestCandidateChoreography != none) && MyPlayerPawn.DistanceBetweenCollisionCylinders(BestCandidateChoreography) > MyPlayerPawn.TuneDataPlayerPawn.MaxStationaryMeleeRange)
        {
            DoSpecialMove(Class'LPSM_PlayerMeleeAttackStationaryFar', true, false, OnMeleeSMFinished, BestCandidateChoreography);            
        }
        else
        {
            DoSpecialMove(Class'LPSM_PlayerMeleeAttackStationary', true, false, OnMeleeSMFinished, BestCandidateChoreography);
        }
    }
    //return;    
}

function OnMeleeSMFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    EnterWalkState();
    LastMeleeTime = WorldInfo.TimeSeconds;
    //return;    
}

function ShowStruggleReticle()
{
    local /*0x97E50000-0x00000000*/ private bool bShowReticle[8388609];

    // End:0x38
    if(myLPHUD != none)
    {
        myLPHUD.ShowStruggleReticle(bShowReticle);
    }
    //return;    
}

function TurnOnStruggleDisplayState()
{
    // End:0x2E
    if(myLPHUD != none)
    {
        myLPHUD.TurnOnStruggleDisplayState();
    }
    //return;    
}

function TurnOffStruggleDisplayState()
{
    local /*0x97E50000-0x00000000*/ private bool bResetReticle[9437185];

    // End:0x39
    if(myLPHUD != none)
    {
        myLPHUD.TurnOffStruggleDisplayState(bResetReticle);
    }
    //return;    
}

function StruggleButtonPress()
{
    SPPawn(Pawn).BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StruggleButton, self);
    //return;    
}

function StruggleStabPress()
{
    //return;    
}

function ShowButtonTexture()
{
    local /*0x97E50000-0x00000000*/ private @NULL inButtonTextureXBOX[8388609], inButtonTexturePS3;

    //return;    
}

function SetAimingInRange()
{
    local /*0x97E50000-0x00000000*/ private bool bInRange[8388609];

    //return;    
}

function SetStruggleButtonStrength()
{
    local /*0x97E50000-0x00000000*/ private float fTemp[8388609];

    StruggleButtonStrength = fTemp;
    //return;    
}

function UpdateStruggleModeDirection()
{
    local /*0x97E50000-0x00000000*/ private float AngleDegrees[8388609];

    myLPHUD.UpdateStruggleModeDirection(AngleDegrees);
    //return;    
}

function UpdateStruggleModeReticle()
{
    local /*0x97E50000-0x00000000*/ private float NewTime[8388609];

    myLPHUD.SetStruggleReticleProgress(NewTime);
    //return;    
}

function DrawDebugStruggle()
{
    //return;    
}

function CallUpdateGrappleHookTargets()
{
    UpdateGrappleHookTargets();
    //return;    
}

function CallUpdateCurrentGrappleHookTarget()
{
    UpdateCurrentGrappleHookTarget();
    //return;    
}

exec function BearTrapped()
{
    GotoState('BearTrapMode');
    //return;    
}

exec function ReleaseBearTrap()
{
    GotoState('PlayerWalking');
    //return;    
}

function CanOpenMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185], ReturnValue;

    // End:0x21
    if(!bForce && IsDoingASpecialMove())
    {
        return false;
    }
    // End:0x41
    if(!bForce && bIsInVitalSuit)
    {
        return false;
    }
    // End:0x86
    if(MyPlayerPawn != none)
    {
        // End:0x86
        if(MyPlayerPawn.bIncapacitated || IsInState('Incapacitated'))
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

exec function OpenMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];

    // End:0x56
    if(CanOpenMunitionsLocker(bForce))
    {
        // End:0x3F
        if(bIsInVitalSuit)
        {
            DoSpecialMove(Class'LPSM_PlayerMunitionsLockerVS');            
        }
        else
        {
            DoSpecialMove(Class'LPSM_PlayerMunitionsLocker');
        }
    }
    //return;    
}

exec function RequestMunitionsLockerInVS()
{
    bDesignerRequestedMunitionsLocker = true;
    //return;    
}

function TryToOpenMunitionsLockerForDesign()
{
    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    // End:0x45
    if(LPVSPlayerPawn(Pawn) == none)
    {
        return;
    }
    // End:0x69
    if(bDesignerRequestedMunitionsLocker)
    {
        bDesignerRequestedMunitionsLocker = false;
        OpenMunitionsLocker(true);
    }
    //return;    
}

function CanOpenJobLog()
{
    local /*0x97E50000-0x00000000*/ private bool bForceSpecialMove[9437185], ReturnValue;

    // End:0x12
    if(GFxFlashMovie_JobLog == none)
    {
        return false;
    }
    // End:0x32
    if(!bForceSpecialMove && IsDoingASpecialMove())
    {
        return false;
    }
    // End:0x43
    if(InputIsDisabledCount > 0)
    {
        return false;
    }
    // End:0x52
    if(bCinematicMode)
    {
        return false;
    }
    // End:0x96
    if((bIsInVitalSuit && myLPHUD != none) && myLPHUD.bVSHUDHidden)
    {
        return false;
    }
    // End:0x135
    if(MyPlayerPawn != none)
    {
        // End:0x135
        if((((MyPlayerPawn.bIncapacitated || IsInState('Incapacitated')) || IsInState('PlayerFalling')) || MyPlayerPawn.bIsUnderMatineeControl) || MyPlayerPawn.bUseZiplineVSTransition)
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function ClearFastTravelOptionMessage()
{
    // End:0x30
    if(myLPHUD != none)
    {
        myLPHUD.RemoveMessageLayer(17);
    }
    //return;    
}

function ShowFastTravelOptionMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    // End:0x122
    if(Pawn != none)
    {
        // End:0x122
        if(IsLocalPlayerController())
        {
            vsPawn = LPVSPlayerPawn(Pawn);
            // End:0xB6
            if(vsPawn != none)
            {
                myLPHUD.DisplayHUDMessageLayer(17, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_FastTravel_Rig>");                
            }
            else
            {
                myLPHUD.DisplayHUDMessageLayer(17, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_FastTravel_POF>");
            }
        }
    }
    //return;    
}

function FastTravelRequest()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPFTVolume;

    // End:0x51
    foreach Pawn.TouchingActors(Class'LPFastTravelVolume', LPFTVolume)
    {
        LPFTVolume.HandleFastTravelRequest(self);
        // End:0x51
        break;        
    }    
    //return;    
}

function OpenJobLogFromFastTravelVolume()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array IncomingFastTravelInfoList[25296897];
    local /*0x97E50000-0x00000000*/ private bool bWaitForLocationDiscoveredMessage[8388609];

    FastTravelInfoList = IncomingFastTravelInfoList;
    // End:0x2C
    if(bWaitForLocationDiscoveredMessage)
    {
        bWaitingForJobLogToOpen = true;
    }
    OpenJobLog(true, true);
    //return;    
}

exec function OpenJobLogMusicPlayer()
{
    // End:0x31
    if(bIsInVitalSuit)
    {
        bOpenJobLogToMusicPlayer = true;
        OpenJobLog();
        bOpenJobLogToMusicPlayer = false;
    }
    //return;    
}

function PickedUpMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL MailMessage[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array MailMessageList;
    local /*0x97E50000-0x00000000*/ private @NULL GameDataStore, QM, Q, OMM;
    local /*0x97E50000-0x00000000*/ private int QuestIdx, ObjectiveIdx, CatalogerTotalCount, CatalogerCompletedCount;

    JobLogAutoOpenMessage = MailMessage;
    // End:0x3B
    if(JobLogAutoOpenMessageTimeoutTime > float(0))
    {
        SetTimer(JobLogAutoOpenMessageTimeoutTime, false, 'JobLogAutoOpenMessageTimeout');
    }
    GameDataStore = SPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    QM = GameDataStore.QuestManager;
    QM.QuestTuneDataContainer.GetAllQuestsInChain('MailMessages', MailMessageList);
    CatalogerTotalCount = 0;
    CatalogerCompletedCount = 0;
    QuestIdx = 0;
    J0x11B:

    // End:0x255 [Loop If]
    if(QuestIdx < MailMessageList.Length)
    {
        Q = MailMessageList[QuestIdx];
        ObjectiveIdx = 0;
        J0x15B:

        // End:0x247 [Loop If]
        if(ObjectiveIdx < Q.Objectives.Length)
        {
            OMM = LPQO_ObjectiveMailMessage(Q.Objectives[ObjectiveIdx]);
            // End:0x239
            if((OMM != none) && OMM.bMasterCataloger)
            {
                CatalogerTotalCount++;
                // End:0x22E
                if(int(OMM.GetQuestStatus()) == int(1))
                {                    
                }
                else
                {
                    CatalogerCompletedCount++;
                }
            }
            ObjectiveIdx++;
            // [Loop Continue]
            goto J0x15B;
        }
        QuestIdx++;
        // [Loop Continue]
        goto J0x11B;
    }
    GetAchievementManager().SetAchievementValue('Lost_Log', CatalogerCompletedCount);
    GetAchievementManager().SetAchievementValue('Heavy_Reader', CatalogerCompletedCount);
    // End:0x2FA
    if(CatalogerCompletedCount == CatalogerTotalCount)
    {
        GetAchievementManager().SetAchievementValue('Master_Cataloger', 1);
    }
    //return;    
}

function ShowExitPointMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL InExitPoint[8388609];

    // End:0x17E
    if(Pawn != none)
    {
        // End:0xC8
        if((InExitPoint.ToLevelName != none) && InExitPoint.CanVisitForAStar())
        {
            myLPHUD.DisplayHUDMessageLayer(18, InExitPoint.ToLevelName.LocalizedTextMarkUp,, CheckExitPointMessageIsValid);            
        }
        else
        {
            // End:0x17E
            if((InExitPoint.DisabledDisplayText != none) && InExitPoint.bDisableDestination)
            {
                myLPHUD.DisplayHUDMessageLayer(18, InExitPoint.DisabledDisplayText.LocalizedTextMarkUp,, CheckExitPointDisabledMessageIsValid);
            }
        }
    }
    //return;    
}

simulated function CheckExitPointMessageIsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EP;

    // End:0x53
    foreach Pawn.TouchingActors(Class'LPBreadcrumbExitPoint', EP)
    {
        // End:0x52
        if(EP.CanVisitForAStar())
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

simulated function CheckExitPointDisabledMessageIsValid()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EP;

    // End:0x53
    foreach Pawn.TouchingActors(Class'LPBreadcrumbExitPoint', EP)
    {
        // End:0x52
        if(EP.bDisableDestination)
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function JobLogAutoOpenMessageTimeout()
{
    JobLogAutoOpenMessage = none;
    //return;    
}

exec function OpenJobLog()
{
    local /*0x97E50000-0x00000000*/ private bool bForceSpecialMove[9437185], bAlreadyFoundFastTravelVolume;
    local /*0x97E50000-0x00000000*/ private @NULL LPFTVolume;

    // End:0xD0
    if(CanOpenJobLog(bForceSpecialMove))
    {
        // End:0xB0
        if(bIsInVitalSuit)
        {
            // End:0x8D
            if(!bAlreadyFoundFastTravelVolume)
            {
                // End:0x8C
                foreach Pawn.TouchingActors(Class'LPFastTravelVolume', LPFTVolume)
                {
                    // End:0x88
                    if(LPFTVolume.HandleFastTravelRequest(self))
                    {                        
                        return;
                    }
                    // End:0x8C
                    break;                    
                }                
            }
            DoSpecialMove(Class'LPSM_PlayerJobLogVS', bForceSpecialMove);            
        }
        else
        {
            DoSpecialMove(Class'LPSM_PlayerJobLog', bForceSpecialMove);
        }
    }
    //return;    
}

function IsJobLogOpen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return MyBasePlayerPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerJobLog') || MyBasePlayerPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerJobLogVS');
    //return ReturnValue;    
}

function TryCloseJobLog()
{
    MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_AbortJobLog, self);
    //return;    
}

function NotifyLocationDiscoveredMessageComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL JobLogSM, vsPawn;

    // End:0x14A
    if(bWaitingForJobLogToOpen)
    {
        bWaitingForJobLogToOpen = false;
        // End:0x14A
        if(MyBasePlayerPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerJobLog'))
        {
            // End:0x9A
            if(MyPlayerPawn != none)
            {
                JobLogSM = LPSM_PlayerJobLog(MyPlayerPawn.SpecialMoveState.CurSMInstance);                
            }
            else
            {
                vsPawn = LPVSPlayerPawn(Pawn);
                JobLogSM = LPSM_PlayerJobLog(vsPawn.SpecialMoveState.CurSMInstance);
            }
            // End:0x14A
            if(JobLogSM != none)
            {
                // End:0x14A
                if(JobLogSM.bWaitingForMessageCompletion)
                {
                    JobLogSM.FinishedWaitingForHUDMessage();
                }
            }
        }
    }
    //return;    
}

function NotifyEndOfSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL LastMove[8388609];

    // End:0x24
    if(LPSM_PlayerJobLog(LastMove) != none)
    {
        FastTravelInfoList.Length = 0;
    }
    super(SPPlayerController).NotifyEndOfSpecialMove(LastMove);
    //return;    
}

reliable server function ServerAddAllAmmoToMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn, LPW;
    local /*0x97E50000-0x00000000*/ private int Idx, TotalAmmo;
    local /*0x97E50000-0x00000000*/ private @NULL TDAmmo;

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    PlayerPawn = GetMyPlayerPawn();
    // End:0x1AA
    if(PlayerPawn != none)
    {
        // End:0x1A9
        foreach PlayerPawn.InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            Idx = 0;
            J0xA2:

            // End:0x1A8 [Loop If]
            if(Idx < LPW.AmmoTypes.Length)
            {
                TotalAmmo = LPW.AmmoTypes[Idx].GetTotalAmmo();
                TDAmmo = LPTuneDataAmmoDefault(LPW.TuneDataBaseWeapon.SupportedAmmoTypes[Idx]);
                AddAmmoToMunitionsLocker(string(TDAmmo), TotalAmmo, ((Idx == 0) ? 1 : 0));
                Idx++;
                // [Loop Continue]
                goto J0xA2;
            }            
        }        
    }
    //return;    
}

reliable server function ServerRemoveAllAmmoFromWeapons()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn, LPW;

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    PlayerPawn = GetMyPlayerPawn();
    // End:0xB8
    if(PlayerPawn != none)
    {
        // End:0xB7
        foreach PlayerPawn.InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            LPW.RemoveAllAmmo();            
        }        
    }
    //return;    
}

reliable server function ServerSetWeaponLoadout()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string PrimaryWeaponClassName[8388609], SecondaryWeaponClassName, TertiaryWeaponClassName, PistolWeaponClassName;
    local /*0x97E50000-0x00000000*/ private @NULL LPW, Grenade;
    local /*0x97E50000-0x00000000*/ private class PrimaryInvClass, SecondaryInvClass, TertiaryInvClass, PistolInvClass;
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;
    local /*0x97E50000-0x00000000*/ private bool bHasPistol;
    local /*0x97E50000-0x00000000*/ private editfixedsize string CurrentWeaponName;

    PlayerPawn = GetMyPlayerPawn();
    ServerAddAllAmmoToMunitionsLocker();
    // End:0x82A
    if(PlayerPawn != none)
    {
        // End:0x99
        if(PlayerPawn.Weapon != none)
        {
            CurrentWeaponName = PathName(PlayerPawn.Weapon.Class);
        }
        // End:0x122
        foreach PlayerPawn.InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            // End:0x115
            if(LPWeaponPistol(LPW) == none)
            {
                LPW.Destroy();
                // End:0x121
                continue;
            }
            bHasPistol = true;            
        }        
        I = 0;
        J0x12E:

        // End:0x1DC [Loop If]
        if(I < PlayerPawn.10)
        {
            PlayerPawn.RemoteAmmoTypeRepInfos[I].WeaponClass = none;
            PlayerPawn.RemoteAmmoTypeRepInfos[I].NumAmmoTypesWeaponContains = 0;
            I++;
            // [Loop Continue]
            goto J0x12E;
        }
        I = 0;
        J0x1E7:

        // End:0x295 [Loop If]
        if(I < MyPlayerPawn.10)
        {
            PlayerPawn.RemoteWeaponUpgradeRepInfos[I].WeaponClass = none;
            PlayerPawn.RemoteWeaponUpgradeRepInfos[I].UpgadeNumToGive = 0;
            I++;
            // [Loop Continue]
            goto J0x1E7;
        }
        bDoNotActivate = true;
        // End:0x307
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            // End:0x307
            if(SecondaryWeaponClassName == CurrentWeaponName)
            {
                SecondaryWeaponClassName = PrimaryWeaponClassName;
                PrimaryWeaponClassName = CurrentWeaponName;
            }
        }
        PrimaryInvClass = class<Inventory>(FindObject(PrimaryWeaponClassName, Class'Core.Class'));
        // End:0x39F
        if((PrimaryInvClass != none) && !ClassIsChildOf(PrimaryInvClass, Class'LPWeaponPistol'))
        {
            PlayerPawn.CreateInventory(PrimaryInvClass, bDoNotActivate);
            bDoNotActivate = true;
        }
        SecondaryInvClass = class<Inventory>(FindObject(SecondaryWeaponClassName, Class'Core.Class'));
        // End:0x450
        if(((SecondaryInvClass != none) && SecondaryInvClass != PrimaryInvClass) && !ClassIsChildOf(SecondaryInvClass, Class'LPWeaponPistol'))
        {
            PlayerPawn.CreateInventory(SecondaryInvClass, bDoNotActivate);
            bDoNotActivate = true;
        }
        TertiaryInvClass = class<Inventory>(FindObject(TertiaryWeaponClassName, Class'Core.Class'));
        // End:0x4D3
        if((TertiaryInvClass != none) && !ClassIsChildOf(TertiaryInvClass, Class'LPWeaponPistol'))
        {
            PlayerPawn.CreateInventory(TertiaryInvClass, true);
        }
        // End:0x564
        if(!bHasPistol && PistolWeaponClassName != "")
        {
            PistolInvClass = class<Inventory>(FindObject(PistolWeaponClassName, Class'Core.Class'));
            // End:0x564
            if(PistolInvClass != none)
            {
                PlayerPawn.CreateInventory(PistolInvClass, bDoNotActivate);
            }
        }
        // End:0x5CE
        foreach PlayerPawn.InvManager.InventoryActors(Class'LPWeapon', LPW)
        {
            LPW.AddUnlockedAmmoTypes(self);            
        }        
        ServerRemoveAllAmmoFromWeapons();
        Grenade = MyPlayerPawn.GetGrenade();
        // End:0x66F
        if(Grenade != none)
        {
            PlayerPawn.ShowGrenades(Grenade.AmmoLeftInMagazine, Grenade.Class);            
        }
        else
        {
            PlayerPawn.ShowGrenades(0);
        }
        PlayerPawn.bLoadedProfileWeapons = bDoNotActivate;
        // End:0x7D4
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            PlayerPawn.ServerReplenishAmmoFromMunitionsLocker(self, true);
            // End:0x7D1
            if(PlayerPawn.Weapon == none)
            {
                // End:0x78A
                if((CurrentWeaponName != PathName(PrimaryInvClass)) && CurrentWeaponName != PathName(SecondaryInvClass))
                {
                    CurrentWeaponName = PathName(PrimaryInvClass);
                }
                PlayerPawn.LastEquippedWeaponClassName = CurrentWeaponName;
                PlayerPawn.CheckCSAForSwitchToBestWeapon();
            }            
        }
        else
        {
            PlayerPawn.InvManager.SwitchToBestWeapon();
        }
        PlayerPawn.bProfileLoadOutInitialized = true;
    }
    //return;    
}

reliable client simulated function ClientSwitchToBestWeapon()
{
    local /*0x97E50000-0x00000000*/ private bool bForceNewWeapon[9437185];

    super(Controller).ClientSwitchToBestWeapon(bForceNewWeapon);
    // End:0x43
    if(MyPlayerPawn != none)
    {
        MyPlayerPawn.NotifyAmmoCountUpdated();
    }
    //return;    
}

reliable client simulated function ClientNotifyProximityToMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private @NULL LockerActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bTouched[9437185], bVS;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;
    local /*0x97E50000-0x00000000*/ private bool bReloadOnly;

    true
    false
    // End:0x2F4
    if((MyPlayerPawn != none) && myLPHUD != none)
    {
        // End:0x2EA
        if(bTouched)
        {
            // End:0x2E7
            if(LockerActor != none)
            {
                bReloadOnly = bVS && !bVSHasFullMunitionsLocker;
                bMunitionsLockerEnabled = !bReloadOnly;
                bMunitionsLockerReloadEnabled = MyPlayerPawn.CanReplenishAmmoFromVS();
                MunitionsLockerActor = LockerActor;
                UIElementInfo.InputCalloutMarkupString = "<InputCallOuts:GBA_Use,GBA_Reload>";
                // End:0x1BF
                if(bReloadOnly)
                {
                    // End:0x1B1
                    if(bMunitionsLockerReloadEnabled)
                    {
                        myLPHUD.DisplayHUDMessageLayer(19, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_MunitionsLockerReloadOnly>", -1.0000000, CheckMunitionsLockerDisplayReloadOnly,,,, UIElementInfo);                        
                    }
                    else
                    {
                        MunitionsLockerActor = none;
                    }                    
                }
                else
                {
                    // End:0x25E
                    if(bMunitionsLockerReloadEnabled)
                    {
                        myLPHUD.DisplayHUDMessageLayer(19, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_MunitionsLockerReload>", -1.0000000, CheckMunitionsLockerDisplayAll,,,, UIElementInfo);                        
                    }
                    else
                    {
                        myLPHUD.DisplayHUDMessageLayer(19, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_MunitionsLocker>", -1.0000000, CheckMunitionsLockerDisplayAll,,,, UIElementInfo);
                    }
                }
            }            
        }
        else
        {
            CancelMunitionsLocker();
        }
    }
    //return;    
}

function CheckMunitionsLockerDisplay()
{
    local /*0x97E50000-0x00000000*/ private bool bReloadOnly[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL Format;
    local /*0x97E50000-0x00000000*/ private bool bCanReplenishAmmo;

    // End:0x250
    if(myLPHUD != none)
    {
        bCanReplenishAmmo = MyPlayerPawn.CanReplenishAmmoFromVS();
        // End:0x17C
        if(bCanReplenishAmmo && !bMunitionsLockerReloadEnabled)
        {
            // End:0xF2
            if(bReloadOnly)
            {
                myLPHUD.GFxFlashMovieInstanceKismetMessage.SetMessage("<Strings:LostPlanetGame.HUDHintMessages.HUDHint_MunitionsLockerReloadOnly>", "", Format);                
            }
            else
            {
                myLPHUD.GFxFlashMovieInstanceKismetMessage.SetMessage("<Strings:LostPlanetGame.HUDHintMessages.HUDHint_MunitionsLockerReload>", "", Format);
            }            
        }
        else
        {
            // End:0x21B
            if(!bCanReplenishAmmo && bMunitionsLockerReloadEnabled)
            {
                myLPHUD.GFxFlashMovieInstanceKismetMessage.SetMessage("<Strings:LostPlanetGame.HUDHintMessages.HUDHint_MunitionsLocker>", "", Format);
            }
        }
        bMunitionsLockerReloadEnabled = bCanReplenishAmmo;
        // End:0x250
        if(!bReloadOnly || bCanReplenishAmmo)
        {
            return true;
        }
    }
    CancelMunitionsLocker();
    return false;
    //return ReturnValue;    
}

exec function EnableVSHasFullMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[9437185];

    true
    bVSHasFullMunitionsLocker = bEnable;
    RefreshMunitionsLockerDisplay();
    //return;    
}

exec function ToggleVSHasFullMunitionsLocker()
{
    bVSHasFullMunitionsLocker = !bVSHasFullMunitionsLocker;
    RefreshMunitionsLockerDisplay();
    //return;    
}

function RefreshMunitionsLockerDisplay()
{
    CancelMunitionsLocker();
    CheckMunitionsLockerProximity();
    //return;    
}

function CheckMunitionsLockerDisplayAll()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CheckMunitionsLockerDisplay(false);
    //return ReturnValue;    
}

function CheckMunitionsLockerDisplayReloadOnly()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CheckMunitionsLockerDisplay(true);
    //return ReturnValue;    
}

simulated function CancelMunitionsLocker()
{
    // End:0x30
    if(myLPHUD != none)
    {
        myLPHUD.RemoveMessageLayer(19);
    }
    bMunitionsLockerEnabled = false;
    bMunitionsLockerReloadEnabled = false;
    MunitionsLockerActor = none;
    //return;    
}

function CheckMunitionsLockerProximity()
{
    local /*0x97E50000-0x00000000*/ private @NULL ML;

    ML = GetMunitionsLocker();
    ClientNotifyProximityToMunitionsLocker(ML, ML != none);
    //return;    
}

function GetMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], A, ML;

    // End:0x60
    if(MunitionsLockerActor != none)
    {
        // End:0x5F
        foreach Pawn.TouchingActors(Class'Engine.Actor', A)
        {
            // End:0x5E
            if(A == MunitionsLockerActor)
            {                
                return A;
            }            
        }        
    }
    // End:0x99
    foreach Pawn.TouchingActors(Class'LPMunitionsLocker', ML)
    {        
        return ML;        
    }    
    return none;
    //return ReturnValue;    
}

function NotifyOpenJobLog()
{
    local /*0x97E50000-0x00000000*/ private bool bShowIt;

    bShowIt = true;
    // End:0x46
    if((IsDoingSpecialMove(Class'LPSM_PlayerJobLog') == false) || IsInState('JobLog') == false)
    {
        bShowIt = false;
    }
    // End:0x75
    if(bShowIt)
    {
        myLPHUD.ShowJobLog(true);
    }
    //return;    
}

function StartJobLogEffects()
{
    // End:0x0F
    if(bIsInVitalSuit)
    {
        return;
    }
    // End:0x81
    if(MyPlayerPawn != none)
    {
        // End:0x81
        if(MyPlayerPawn.GetFXActionManager() != none)
        {
            MyPlayerPawn.GetFXActionManager().StartFXAction(Class'LPFXAction_JobLogPostProcess');
        }
    }
    //return;    
}

function StopJobLogEffects()
{
    // End:0x0F
    if(bIsInVitalSuit)
    {
        return;
    }
    // End:0x81
    if(MyPlayerPawn != none)
    {
        // End:0x81
        if(MyPlayerPawn.GetFXActionManager() != none)
        {
            MyPlayerPawn.GetFXActionManager().StopFXAction(Class'LPFXAction_JobLogPostProcess');
        }
    }
    //return;    
}

reliable client simulated function ClientNotifyProximityToCourierItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL CourierItem[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDestination[9437185], bTouched;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

    false
    true
    // End:0x1E6
    if(myLPHUD != none)
    {
        // End:0x1BB
        if(bTouched)
        {
            // End:0x4A
            if(MunitionsLockerActor != none)
            {
                ClientNotifyProximityToMunitionsLocker(MunitionsLockerActor, false);
            }
            UIElementInfo.InputCalloutMarkupString = "<InputCallOuts:GBA_PickupUseCourierItem>";
            // End:0x12D
            if(bDestination)
            {
                myLPHUD.DisplayHUDMessageLayer(15, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_DeliverCourierItem>", -1.0000000, None,,,, UIElementInfo);                
            }
            else
            {
                myLPHUD.DisplayHUDMessageLayer(15, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_PickupCourierItem>", -1.0000000, None,,,, UIElementInfo);
            }            
        }
        else
        {
            myLPHUD.RemoveMessageLayer(15);
            CheckMunitionsLockerProximity();
        }
    }
    //return;    
}

function PickupUseCourierItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL P;

    P = LPPawn(Pawn);
    // End:0x9A
    if((P.CourierItems.Length > 0) || (GetCourierItem()) != none)
    {
        LPPRI(PlayerReplicationInfo).PerksManager.DeactivateDeploymentMode();
        ServerPickupUseCourierItem();
    }
    //return;    
}

reliable server function ServerPickupUseCourierItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPCI;

    EndSprint();
    LPPawn(Pawn).DeliverCourierItems();
    LPCI = GetCourierItem();
    // End:0x7F
    if(LPCI != none)
    {
        LPCI.GiveTo(Pawn, true);
    }
    //return;    
}

function GetCourierItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPCI;

    // End:0x39
    foreach Pawn.TouchingActors(Class'LPCourierItem', LPCI)
    {        
        return LPCI;        
    }    
    return none;
    //return ReturnValue;    
}

function IsInEMPShutdown()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function OnEMPIntroSMFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function StartZiplineReturn()
{
    MPStartState('PlayerZipline');
    //return;    
}

function StartZipline()
{
    MPStartState('PlayerZipline');
    //return;    
}

reliable server function ServerTryConnectToZipline()
{
    local /*0x97E50000-0x00000000*/ private @NULL newZipline[8388609], NewZipInfo;

    // End:0x3B
    if(newZipline.ConnectToZipline(Pawn) == false)
    {
        AbortGrapple();        
    }
    else
    {
        ZiplineInfo = NewZipInfo;
    }
    //return;    
}

reliable server function ServerDisconnectFromZipline()
{
    local /*0x97E50000-0x00000000*/ private @NULL newZipline[8388609];

    newZipline.DisconnectFromZipline(Pawn);
    //return;    
}

function GetZiplineSpeedScale()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], NewMaxSpeedScale;

    NewMaxSpeedScale = 1.0000000;
    // End:0x71
    if(MyBasePlayerPawn != none)
    {
        NewMaxSpeedScale = MyPlayerPawn.TuneDataPlayerPawn.ZiplineSpeed.GetValue();
    }
    return NewMaxSpeedScale;
    //return ReturnValue;    
}

function GetZiplineSprintSpeedScale()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], NewMaxSpeedScale;

    NewMaxSpeedScale = 1.0000000;
    // End:0x71
    if(MyBasePlayerPawn != none)
    {
        NewMaxSpeedScale = MyPlayerPawn.TuneDataPlayerPawn.ZiplineSprintSpeed.GetValue();
    }
    return NewMaxSpeedScale;
    //return ReturnValue;    
}

function ZiplineTick()
{
    //return;    
}

function HasGrapplingHook()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (int(WorldInfo.NetMode) != int(NM_Standalone)) || HasUpgrade(Class'LPUpgrade_GrappleHook');
    //return ReturnValue;    
}

event HasMagneticGrapple()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (int(WorldInfo.NetMode) != int(NM_Standalone)) || HasUpgrade(Class'LPUpgrade_MagneticGrapple');
    //return ReturnValue;    
}

function NextGrappleSequence()
{
    // End:0x69
    if((IsLocalPlayerController()) && IsDoingSpecialMove_OF_Class(Class'LPSM_GrapplingHook'))
    {
        MyBasePlayerPawn.BroadcastSMMessageToAll(0, Class'LPSMMTypes'.default.SMM_NextAnimSequence, self);        
    }
    else
    {
        // End:0xCF
        if((IsLocalPlayerController()) && IsDoingSpecialMove(Class'LPSM_PlayerZiplineReturn'))
        {
            MyBasePlayerPawn.BroadcastSMMessageToAll(0, Class'LPSMMTypes'.default.SMM_NextZiplineSequence, self);
        }
    }
    //return;    
}

function PlayGrappleFinishedSequence()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target, HookMeshActor;
    local /*0x97E50000-0x00000000*/ private bool bAdvancedGrappleNode;

    bAdvancedGrappleNode = false;
    Target = LPGrapplePointActorBase(MyPlayerPawn.GrappleActor);
    // End:0x6D
    if(Target.GrappleType == none)
    {
        NextGrappleSequence();
        return;
    }
    HookMeshActor = LPHookMeshActor(Target);
    // End:0x10B
    if(HookMeshActor != none)
    {
        // End:0xCD
        if(int(HookMeshActor.AdvancedGrappleType) != int(0))
        {
            bAdvancedGrappleNode = true;
        }
        // End:0x10B
        if(bAdvancedGrappleNode && PlayerMoveInfo.bHookButtonPressed == false)
        {
            bAdvancedGrappleNode = false;
        }
    }
    PlayGrappleFinishSpecialMove(Target, bAdvancedGrappleNode);
    //return;    
}

reliable server function ServerPlayGrappleFinishSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool bAdvancedGrappleNode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL NewRot, GrapplePoint;

    GrapplePoint = LPGrapplePointActorBase(MyPlayerPawn.GrappleActor);
    NewRot = Rotator(MyPlayerPawn.GrappleDir);
    MyPlayerPawn.SetRotation(NewRot);
    MyPlayerPawn.SetLocationNoCheck(MyPlayerPawn.GrapplePoint);
    // End:0x10C
    if(bAdvancedGrappleNode)
    {
        MyPlayerPawn.DoSpecialMove(Class'LPSM_GrappleAdvanced', true, false, None);        
    }
    else
    {
        MyPlayerPawn.DoSpecialMove(GrapplePoint.GrappleType);
    }
    //return;    
}

function PlayGrappleFinishSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAdvancedGrappleNode[8388609];

    // End:0xC2
    if(IsLocalPlayerController())
    {
        // End:0x59
        if(bAdvancedGrappleNode)
        {
            MyPlayerPawn.DoSpecialMove(Class'LPSM_GrappleAdvanced', true, false, None);            
        }
        else
        {
            MyPlayerPawn.DoSpecialMove(Target.GrappleType);
        }
        // End:0xC2
        if(int(Role) != int(ROLE_Authority))
        {
            ServerPlayGrappleFinishSpecialMove(bAdvancedGrappleNode);
        }
    }
    //return;    
}

simulated function AbortGrapple()
{
    // End:0x1E
    if(int(Role) == int(ROLE_Authority))
    {
        ClientAbortGrapple();
    }
    // End:0x56
    if(IsDoingSpecialMove(Class'LPSM_GrapplingHook') || IsDoingSpecialMove(Class'LPSM_PlayerZiplineReturn'))
    {
        EndSpecialMove();
    }
    MyPlayerPawn.AbortGrapple();
    // End:0xB6
    if((Pawn != none) && Pawn.IsAliveAndWell())
    {
        GotoState('PlayerWalking');
    }
    //return;    
}

reliable client simulated function ClientAbortGrapple()
{
    // End:0x1E
    if(int(Role) != int(ROLE_Authority))
    {
        AbortGrapple();
    }
    //return;    
}

reliable server function ServerAbortGrapple()
{
    AbortGrapple();
    //return;    
}

function UpdateGrapple()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Hook, ZipBase, GrappleActorLocation, CollisionAdjustedGrapplePoint, Temp;

    local /*0x97E50000-0x00000000*/ private bool bCanUseGrapplePoint;
    local /*0x97E50000-0x00000000*/ private float dotprod;

    // End:0x37
    if((GrappleHookCurrentTarget == none) || !GrappleHookCurrentTarget.bValid)
    {
        return false;
    }
    // End:0x8B
    if((bIsInVitalSuit || int(Pawn.Physics) != int(1)) || !CanOverrideMoveWith(Class'LPSM_GrapplingHook'))
    {
        return false;
    }
    // End:0x9C
    if(!HasGrapplingHook())
    {
        return false;
    }
    GrappleActorLocation = GrappleHookCurrentTarget.GetGrapplePoint(LPPawn(Pawn));
    CollisionAdjustedGrapplePoint = GrappleHookCurrentTarget.GetGrapplePoint(LPPawn(Pawn), true);
    Hook = GetGrapplingHook();
    // End:0x8C4
    if((Hook != none) && MyPlayerPawn != none)
    {
        MyPlayerPawn.GrappleActor = GrappleHookCurrentTarget;
        MyPlayerPawn.GrappleActorLocation = GrappleActorLocation;
        Hook.GrapplePoint = CollisionAdjustedGrapplePoint;
        ZipBase = LPZiplinePoint_Base(GrappleHookCurrentTarget);
        bCanUseGrapplePoint = (Hook.IsInState('Idle') && !GrappleHookCurrentTarget.bMagnetic || HasMagneticGrapple()) && (ZipBase == none) || ZipBase.IsZiplineAvailable(Pawn) == true;
        // End:0x8C4
        if(bCanUseGrapplePoint)
        {
            // End:0x306
            if(GrappleActorLocation.Z < Pawn.Location.Z)
            {
                TryGrappleDown(GrappleHookCurrentTarget, GrappleActorLocation, CollisionAdjustedGrapplePoint);                
            }
            else
            {
                MyPlayerPawn.SetupGrappleBonus(GrappleActorLocation);
                // End:0x380
                if(int(Role) < int(ROLE_Authority))
                {
                    MyPlayerPawn.ServerGrappleTo(GrappleHookCurrentTarget, GrappleActorLocation, CollisionAdjustedGrapplePoint);                    
                }
                else
                {
                    MyPlayerPawn.MultiCastGrappleTo(GrappleHookCurrentTarget, GrappleActorLocation, CollisionAdjustedGrapplePoint);
                }
                // End:0x3F3
                if(ZipBase == none)
                {
                    DoSpecialMove(Class'LPSM_GrapplingHook', true, false, None);                    
                }
                else
                {
                    ZiplineInfo.bCanDropOff = ZipBase.bPlayerCanDropOff;
                    myLPHUD.StopGrapplePoint(GrappleHookCurrentTarget);
                    // End:0x6F1
                    if(LPZiplineActor(GrappleHookCurrentTarget) != none)
                    {
                        LPZiplineActor(GrappleHookCurrentTarget).GetCableEndpoints(ZiplineInfo.ZiplineStart, ZiplineInfo.ZiplineEnd);
                        // End:0x650
                        if(VSizeSq(ZiplineInfo.ZiplineStart - GrappleActorLocation) > float(750 * 750))
                        {
                            dotprod = Class'SPEngine.SPUtil'.static.Dot2D(Vector(MyPlayerPawn.GetWorldAimDir()), Normal(ZiplineInfo.ZiplineEnd - ZiplineInfo.ZiplineStart));
                            // End:0x650
                            if(dotprod < float(0))
                            {
                                Temp = ZiplineInfo.ZiplineStart;
                                ZiplineInfo.ZiplineStart = ZiplineInfo.ZiplineEnd;
                                ZiplineInfo.ZiplineEnd = Temp;
                                MyPlayerPawn.GrappleLandingDir *= float(-1);
                            }
                        }
                        ZiplineInfo.ZiplineStart = GrappleActorLocation;
                        ZiplineInfo.ZiplineType = 2;
                        ZiplineInfo.DropoffDist = LPZiplineActor(GrappleHookCurrentTarget).ZiplineConnection.DropoffDistance;                        
                    }
                    else
                    {
                        LPVSWinchPoint(GrappleHookCurrentTarget).WinchWeapon.GetCableEndpoints(ZiplineInfo.ZiplineEnd, ZiplineInfo.ZiplineStart);
                        ZiplineInfo.ZiplineType = 1;
                        Hook.GrapplePoint += (Normal(ZiplineInfo.ZiplineEnd - ZiplineInfo.ZiplineStart) * float(50));
                        ZiplineInfo.ZiplineStart = GrappleActorLocation;
                        ZiplineInfo.DropoffDist = ZiplineDepartDistance;
                    }
                    DoSpecialMove(Class'LPSM_PlayerZiplineReturn', true, false, None);
                }
                MyPlayerPawn.BeginGrapple();
                GotoState('PlayerGrappling');
                // End:0x8C4
                if(LPZiplinePoint_Base(GrappleHookCurrentTarget) != none)
                {
                    ServerTryConnectToZipline(LPZiplinePoint_Base(GrappleHookCurrentTarget), ZiplineInfo);
                }
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function OnStopGrappling()
{
    //return;    
}

function OnStartGrappling()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleActor[8388609];

    //return;    
}

function GrappleTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function SuperManHACKFix()
{
    //return;    
}

function HandleGrappleHookConnected()
{
    //return;    
}

function MovePlayerToGrapplePoint()
{
    //return;    
}

function OnPlayerReadyToMoveToGrapplePoint()
{
    bPlayerReadyToMoveToGrapplePoint = true;
    //return;    
}

function ScoochToGrapplePoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrapplePoint[8388609];
    local /*0x97E50000-0x00000000*/ private float distanceFromGrapplePoint[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Destination, DirToGrapplePoint;

    DirToGrapplePoint = GrapplePoint - Pawn.Location;
    DirToGrapplePoint.Z = 0.0000000;
    DirToGrapplePoint = Normal(DirToGrapplePoint);
    Destination = GrapplePoint - (DirToGrapplePoint * distanceFromGrapplePoint);
    Destination.Z = Pawn.Location.Z;
    SetDestinationPosition(Destination, true);
    bPreciseDestination = true;
    GotoState('GrappleDownScooch');
    //return;    
}

function TryGrappleDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrappleHookTarget[8388609], InGrappleActorLocation, InCollisionAdjustedGrappleLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float DistToGrapplePoint;

    // End:0x11
    if(MyBasePlayerPawn == none)
    {
        return false;
    }
    DistToGrapplePoint = VSize2D(InGrappleActorLocation - Pawn.Location);
    // End:0x119
    if(DistToGrapplePoint > MyPlayerPawn.GetGrappleParams().GrappleDownMaxDistanceFromLedgeToPerformAnim)
    {
        // End:0x116
        if(!MyBasePlayerPawn.SprintControl.bSprinting)
        {
            ScoochToGrapplePoint(InGrappleActorLocation, MyPlayerPawn.GetGrappleParams().GrappleDownMaxDistanceFromLedgeToPerformAnim / float(2));
            return true;
        }        
    }
    else
    {
        GotoState('PlayerGrapplingDown');
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AllowSprint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !bIsInVitalSuit;
    //return ReturnValue;    
}

function GetSprintSpeedScale()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], NewMaxSpeedScale;
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCSA;

    NewMaxSpeedScale = 1.0000000;
    // End:0x151
    if(MyBasePlayerPawn != none)
    {
        PlayerCSA = LPCSAO_Player(MyBasePlayerPawn.ContextSensitiveAnimInfo.CurrentCSA);
        // End:0xDA
        if((PlayerCSA != none) && PlayerCSA.GetSprintSpeedScale(MyBasePlayerPawn) > 0.0000000)
        {
            NewMaxSpeedScale = PlayerCSA.GetSprintSpeedScale(MyBasePlayerPawn);            
        }
        else
        {
            // End:0x151
            if(MyBasePlayerPawn.TuneDataPawn != none)
            {
                NewMaxSpeedScale = MyBasePlayerPawn.TuneDataPawn.SprintSpeedScale.GetValue();
            }
        }
    }
    return NewMaxSpeedScale;
    //return ReturnValue;    
}

function BeginSprint()
{
    // End:0x15F
    if(MyBasePlayerPawn != none)
    {
        super(SPPlayerController).BeginSprint();
        LPPRI(PlayerReplicationInfo).PerksManager.DeactivateDeploymentMode();
        // End:0x15F
        if(MyBasePlayerPawn.SprintControl.bSprinting)
        {
            // End:0xCF
            if(MyBasePlayerPawn.bIsCrouched)
            {
                MyBasePlayerPawn.ChangePosture(false);
            }
            MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = true;
            MyBasePlayerPawn.SetMaxSpeedScale(GetSprintSpeedScale());
            MinHitWall = LPTuneDataPlayerPawn(MyBasePlayerPawn.TuneDataBasePlayerPawn).MinHitWallDotForAutoMantleWhileSprinting;
        }
    }
    //return;    
}

function EndSprint()
{
    local /*0x97E50000-0x00000000*/ private bool bAborted[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CameraMgr, ThirdPersonCamMode;

    // End:0x108
    if(MyBasePlayerPawn != none)
    {
        // End:0xD0
        if(MyBasePlayerPawn.SprintControl.bSprinting)
        {
            CameraMgr = SPPlayerCameraManager(PlayerCamera);
            // End:0xD0
            if(CameraMgr != none)
            {
                ThirdPersonCamMode = SPCameraModeAimControlThirdPerson(CameraMgr.GetCameraMode());
                // End:0xD0
                if(ThirdPersonCamMode != none)
                {
                    ThirdPersonCamMode.BlendOutSprint();
                }
            }
        }
        super(SPPlayerController).EndSprint(bAborted);
        MyBasePlayerPawn.SetMaxSpeedScale(1.0000000);
    }
    MinHitWall = -1.0000000;
    //return;    
}

function CanSprint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCSA;

    // End:0x20
    if(bIsInVitalSuit || MyBasePlayerPawn == none)
    {
        return false;
    }
    // End:0x57
    if(MyBasePlayerPawn.SprintControl.bSprintDisabled)
    {
        return false;
    }
    PlayerCSA = LPCSAO_Player(MyBasePlayerPawn.ContextSensitiveAnimInfo.CurrentCSA);
    // End:0xDB
    if((PlayerCSA != none) && !PlayerCSA.DoesAllowSprint(MyBasePlayerPawn))
    {
        return false;
    }
    // End:0xEA
    if(IsAimingDownSight())
    {
        return false;
    }
    // End:0x10E
    if(MyBasePlayerPawn.bIsCrouched)
    {
        return false;
    }
    // End:0x172
    if((MyBasePlayerPawn.Weapon != none) && !MyBasePlayerPawn.Weapon.IsInState('Active'))
    {
        return false;
    }
    // End:0x181
    if(IsDoingASpecialMove())
    {
        return false;
    }
    // End:0x197
    if((GetSprintSpeedScale()) <= 1.0000000)
    {
        return false;
    }
    return super(SPPlayerController).CanSprint();
    //return ReturnValue;    
}

function CheckForCoverWhileSprinting()
{
    local /*0x97E50000-0x00000000*/ private @NULL CamLoc, CheckDir, CamRot, FoundCovInfo, WeaponSP;

    // End:0x11
    if(CoverPawn == none)
    {
        return;
    }
    WeaponSP = SPWeapon(CoverPawn.Weapon);
    // End:0x7A
    if((WeaponSP == none) || WeaponSP.bCoverCompatible == false)
    {
        return;
    }
    // End:0x328
    if(CoverPawn.SprintControl.bSprinting && (IsTakeCoverButtonPressed()) || !LPPlayerInput(PlayerInput).bUseNewFunkySprint)
    {
        CoverPawn.CoverAcquireFOV = CoverPawn.SprintCoverAcquireFOV;
        // End:0x23C
        if((PlayerInput.RawJoyUp > DeadZoneThreshold) || Abs(PlayerInput.RawJoyRight) > DeadZoneThreshold)
        {
            GetPlayerViewPoint(CamLoc, CamRot);
            CheckDir.X = PlayerInput.RawJoyUp;
            CheckDir.Y = PlayerInput.RawJoyRight;
            CheckDir = Normal(CheckDir >> CamRot);            
        }
        else
        {
            CheckDir = Vector(Pawn.Rotation);
        }
        // End:0x2EB
        if(CoverPawn.CanPrepareRun2Cover(CoverPawn.Sprint2CoverSlideDist, FoundCovInfo, CheckDir, CoverPawn.SprintPawnAcquireCoverFOV))
        {
            TransitionFromSprintToCover(FoundCovInfo);
        }
        CoverPawn.CoverAcquireFOV = CoverPawn.default.CoverAcquireFOV;
    }
    //return;    
}

function TryMantle()
{
    local /*0x97E50000-0x00000000*/ private @NULL CovInfo[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x37
    if((CoverPawn == none) || !CoverPawn.IsAliveAndWell())
    {
        return false;
    }
    return super.TryMantle(CovInfo);
    //return ReturnValue;    
}

function OnMantleBegin()
{
    // End:0x37
    if((CoverPawn == none) || !CoverPawn.IsAliveAndWell())
    {
        return;
    }
    super.OnMantleBegin();
    //return;    
}

event ShouldHideReticle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(IsSprinting())
    {
        return true;
    }
    // End:0x66
    if(MyPlayerPawn != none)
    {
        // End:0x42
        if(MyPlayerPawn.bIsCrouched)
        {
            return true;
        }
        // End:0x66
        if(MyPlayerPawn.bInReticuleOverride)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function DoesStateAllow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function DoesStateAllow_ForkArm()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function CanUseCombatWindow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPVSPlayerPawn(MyBasePlayerPawn) == none)
    {
        return false;
    }
    // End:0x2B
    if(!DoesStateAllow_ActiveDefense())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function TryCombatWindow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return MyBasePlayerPawn.TryCombatWindow_ActiveDefense();
    //return ReturnValue;    
}

event CanUseCombatWindow_ForkArm()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPVSPlayerPawn(MyBasePlayerPawn) == none)
    {
        return false;
    }
    // End:0x2B
    if(!DoesStateAllow_ForkArm())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function TryCombatWindow_ForkArm()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return LPVSPlayerPawn(MyBasePlayerPawn).TryCombatWindow_ForkArm();
    //return ReturnValue;    
}

function PerformedUseAction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bUsed;

    // End:0x48
    if(!IsDoingASpecialMove())
    {
        bUsed = super(PlayerController).PerformedUseAction();
        // End:0x48
        if(!bUsed)
        {
            bUsed = CheckMunitionsLocker();
        }
    }
    // End:0x6D
    if(!bUsed)
    {
        bUsed = CheckPlayerEnterOrExitVS();
    }
    return bUsed;
    //return ReturnValue;    
}

function TryToCancelMatinee()
{
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL InterpAction;

    // End:0x94
    if(Pawn != none)
    {
        Idx = 0;
        J0x1A:

        // End:0x94 [Loop If]
        if(Idx < LatentActions.Length)
        {
            InterpAction = LPSeqAct_Interp(LatentActions[Idx]);
            // End:0x86
            if(InterpAction != none)
            {
                InterpAction.PlayerTryingToCancel();
            }
            Idx++;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    //return;    
}

function OnVSPowerDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPowerOn;

    // End:0xC8
    if(bIsInVitalSuit)
    {
        bPowerOn = Action.InputLinks[0].bHasImpulse;
        // End:0x87
        if(myLPHUD != none)
        {
            myLPHUD.HideVSHUD(!bPowerOn);
        }
        // End:0xB5
        if(bPowerOn)
        {
            J0x94:

            // End:0xB2 [Loop If]
            if(PlayerInputStack.Length > 1)
            {
                PopPlayerInput(none);
                // [Loop Continue]
                goto J0x94;
            }            
        }
        else
        {
            OnPushPlayerInput(Action);
        }
    }
    //return;    
}

function SetCinematicMode()
{
    local /*0x97E50000-0x00000000*/ private bool bInCinematicMode[8388609], bHidePlayer, bAffectsHUD, bAffectsMovement, bAffectsTurning, bAffectsButtons,
	    bOldCinematicMode;

    bOldCinematicMode = bCinematicMode;
    super(PlayerController).SetCinematicMode(bInCinematicMode, bHidePlayer, bAffectsHUD, bAffectsMovement, bAffectsTurning, bAffectsButtons);
    // End:0xA9
    if(bOldCinematicMode != bCinematicMode)
    {
        Class'LPBreadcrumbManager'.static.GetBreadcrumbManager().ForceUpdateObjectMarkers();
    }
    // End:0xC0
    if(bInCinematicMode)
    {
        AbortMailMessagePlayback();
    }
    // End:0xFB
    if(bInCinematicMode && bAffectsMovement)
    {
        PlayerMoveInfo.bEvadeButtonPressed = false;
    }
    // End:0x2A7
    if(bInCinematicMode && bAffectsButtons)
    {
        // End:0x2A4
        if(Pawn != none)
        {
            // End:0x1DD
            if(Pawn.Weapon != none)
            {
                Pawn.Weapon.EndFire(Pawn.Weapon.CurrentFireMode);
                Pawn.bNoWeaponFiring = true;
                OnVSStopActions(none);
            }
            // End:0x2A4
            if(LPPawn(Pawn) != none)
            {
                // End:0x20D
                if(IsAimingDownSight())
                {
                    SetAimDownSightMode(false);
                }
                LPPawn(Pawn).AimNodeInfo.EndWantsToAimTime = 0.0000000;
                LPPawn(Pawn).SetPitchControllerTargetByRotationRate(0, 90.0000000);
                LPPawn(Pawn).SetPitchControllerLock(true);
            }
        }        
    }
    else
    {
        // End:0x327
        if(!bInCinematicMode)
        {
            // End:0x327
            if(Pawn != none)
            {
                Pawn.bNoWeaponFiring = false;
                // End:0x327
                if(LPPawn(Pawn) != none)
                {
                    LPPawn(Pawn).SetPitchControllerLock(false);
                }
            }
        }
    }
    //return;    
}

function UpdateControllerConfig()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ControllerConfig;

    super(SPPlayerController).UpdateControllerConfig();
    ControllerConfig = GetControlConfigurationString();
    // End:0x6F
    if((ControllerConfig == "ALTERNATE COVER") || ControllerConfig == "ALTERNATE COVER 2")
    {
        bAlternateCoverButton = true;        
    }
    else
    {
        bAlternateCoverButton = false;
    }
    //return;    
}

function WantsToStopSMOnNotifyEnablePlayerMovement()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x31
    if(LPPlayerInput(PlayerInput).UnfilteredMovementStickRadius > float(0))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function WantsToAimDownSight()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(!PlayerMoveInfo.bShoulderAimButtonPressed)
    {
        return false;
    }
    // End:0x4B
    if(!MyBasePlayerPawn.CanFireWeapon(true))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function NotifyShoulderAimCameraActive()
{
    // End:0x2E
    if(myLPHUD != none)
    {
        myLPHUD.NotifyShoulderAimCameraActive();
    }
    //return;    
}

simulated function NotifyShoulderAimCameraInactive()
{
    // End:0x2E
    if(myLPHUD != none)
    {
        myLPHUD.NotifyShoulderAimCameraInactive();
    }
    //return;    
}

function MeleeMoveButtonPress()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

    PlayerMoveInfo.bMeleeButtonPressed = bPressed;
    //return;    
}

function CheckSpecialAction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(MyBasePlayerPawn == none)
    {
        return false;
    }
    // End:0x35
    if(!PlayerMoveInfo.bSpecialActionButtonPressed)
    {
        return false;
    }
    // End:0x66
    if((!bIsInVitalSuit && !IsSprinting()) && CheckForMantle())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CheckSprint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(!PlayerMoveInfo.bSprintButtonPressed)
    {
        return false;
    }
    // End:0x112
    if((CanSprint()) && AllowSprint())
    {
        // End:0x112
        if(!MyBasePlayerPawn.SprintControl.bWantsToSprint)
        {
            MyBasePlayerPawn.SprintControl.bWantsToSprint = true;
            MySPPawn.SprintControl.SprintDelayTimeRemaining = MyBasePlayerPawn.TuneDataPawn.SprintDelayTime;
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function IsPressingSprintButton()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return PlayerMoveInfo.bSprintButtonPressed;
    //return ReturnValue;    
}

function SpecialActionButtonPress()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

    PlayerMoveInfo.bSpecialActionButtonPressed = bPressed;
    //return;    
}

function TakeCoverButtonPressed()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

    PlayerMoveInfo.bTakeCoverButtonPressed = bPressed;
    // End:0x43
    if(bPressed)
    {
        TryToRunToCover();
    }
    //return;    
}

function IsTakeCoverButtonPressed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(bAlternateCoverButton)
    {
        return PlayerMoveInfo.bTakeCoverButtonPressed;
    }
    return PlayerMoveInfo.bSpecialActionButtonPressed;
    //return ReturnValue;    
}

function SprintButtonPress()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609], newsprint;

    newsprint = LPPlayerInput(PlayerInput).bUseNewFunkySprint;
    PlayerMoveInfo.bSprintButtonPressed = bPressed;
    // End:0xB2
    if(!bPressed && !newsprint)
    {
        MyBasePlayerPawn.SprintControl.bWantsToSprint = false;        
    }
    else
    {
        // End:0x158
        if((bPressed && MyBasePlayerPawn.SprintControl.bSprinting) && newsprint)
        {
            MyBasePlayerPawn.SprintControl.bWantsToSprint = false;
            PlayerMoveInfo.bSprintButtonPressed = false;
        }
    }
    //return;    
}

function EvadeButtonPress()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitReactionSM;

    // End:0x182
    if(bPressed == LPPlayerInput(PlayerInput).bUseNewFunkySprint)
    {
        // End:0x182
        if(!MyBasePlayerPawn.SprintControl.bSprinting || LPPlayerInput(PlayerInput).bUseNewFunkySprint)
        {
            // End:0x182
            if(((bIsInVitalSuit || bAlternateCoverButton == true) || IsAimingDownSight()) || !TryToRunToCover())
            {
                // End:0x182
                if(AllowEvade())
                {
                    HitReactionSM = LPSM_DirectionalHitReaction(MySPPawn.GetCurrentSpecialMoveInstance());
                    // End:0x182
                    if(!IsMoveInputIgnored() || (HitReactionSM != none) && HitReactionSM.CanDodgeOutOfHitReaction())
                    {
                        PlayerMoveInfo.bEvadeButtonPressed = true;
                        return;
                    }
                }
            }
        }
    }
    PlayerMoveInfo.bEvadeButtonPressed = false;
    //return;    
}

function GrapplingHookButtonPress()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

    JetpackButtonPress(bPressed);
    // End:0x25
    if(!HasGrapplingHook())
    {
        return;
    }
    // End:0x62
    if(bPressed && IsMoveInputIgnored())
    {
        PlayerMoveInfo.bHookButtonPressed = false;
        return;
    }
    // End:0x90
    if(!bPressed)
    {
        PlayerMoveInfo.bHookButtonPressed = false;
    }
    // End:0x112
    if((bPressed && bGrappleEnabled) && CanOverrideMoveWith(Class'LPSM_GrapplingHook'))
    {
        // End:0xE2
        if(bIsInVitalSuit || bPlayVSExit)
        {
            return;
        }
        // End:0xF3
        if(!DoesPlayerCSAAllowGrapplingHook())
        {
            return;
        }
        PlayerMoveInfo.bHookButtonPressed = true;
    }
    //return;    
}

function JetpackButtonPress()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

    // End:0x3D
    if(bPressed && IsMoveInputIgnored())
    {
        PlayerMoveInfo.bJetpackButtonPressed = false;
        return;
    }
    // End:0x6B
    if(!bPressed)
    {
        PlayerMoveInfo.bJetpackButtonPressed = false;
    }
    // End:0x97
    if(bPressed)
    {
        PlayerMoveInfo.bJetpackButtonPressed = true;
    }
    //return;    
}

function WinchArmButtonPress()
{
    // End:0x70
    if(bIsInVitalSuit)
    {
        // End:0x70
        if(!MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_WinchButtonPressed))
        {
            PlayerMoveInfo.bWinchArmButtonPressed = true;
        }
    }
    //return;    
}

function CanWinchArmFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bIsInVitalSuit)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function VSCrushWithWinchArm()
{
    // End:0xB9
    if((bIsInVitalSuit && IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchArmGrabbedPawn')) && LPSM_PlayerVSWinchArmGrabbedPawn(MyBasePlayerPawn.SpecialMoveState.CurSMInstance).bIsHolding)
    {
        MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_CrushVSGrabbedPawn);
    }
    //return;    
}

function OnSetTaserRecharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], Upgrade, Taser;

    // End:0x12B
    if(HasUpgrade(Class'LPVSUpgrade_Taser', Upgrade))
    {
        Taser = LPVSUpgrade_Taser(Upgrade);
        // End:0xE7
        if(inAction.bResetToDefaults)
        {
            Taser.AmountToGive = Taser.VSUpgrade_TaserTuneData.RechargeRate / Taser.VSUpgrade_TaserTuneData.ChargeMax;            
        }
        else
        {
            Taser.AmountToGive = 1.0000000 / inAction.TimeToFullCharge;
        }
    }
    //return;    
}

function VSShockWithWinchArm()
{
    local /*0x97E50000-0x00000000*/ private bool ZapWasUseful;
    local /*0x97E50000-0x00000000*/ private @NULL Upgrade, Taser, currentVS, Defender;

    // End:0x420
    if(bIsInVitalSuit && HasUpgrade(Class'LPVSUpgrade_Taser', Upgrade))
    {
        currentVS = LPVSPlayerPawn(Pawn);
        Taser = LPVSUpgrade_Taser(Upgrade);
        // End:0x1AC
        if(!Taser.HasEnergy())
        {
            // End:0x105
            if(currentVS.TuneDataVSPlayerPawn.TaserFailedNoCharge != none)
            {
                PlaySound(currentVS.TuneDataVSPlayerPawn.TaserFailedNoCharge);
            }
            // End:0x149
            if(Taser.Source != self)
            {
                Taser.Source = self;
            }
            // End:0x1AA
            if(!IsTimerActive('StartRecharging', Taser))
            {
                // End:0x18B
                if(!IsTimerActive('DoRecharge', Taser))
                {
                }
                Taser.StartRecharging();
            }
            return;
        }
        // End:0x241
        if((IsDoingSpecialMove_OF_Class(Class'LPSM_ForkArmGrab_Base') || IsDoingSpecialMove_OF_Class(Class'LPSM_VSIPBase')) || IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchWinchPoint'))
        {
            ZapWasUseful = MyBasePlayerPawn.BroadcastSMMessageToAll(0, Class'LPSMMTypes'.default.SMM_ShockStart);            
        }
        else
        {
            ZapWasUseful = MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_ShockStart);
        }
        // End:0x375
        if(AkridOnFrontOfCockPit())
        {
            // End:0x375
            if(currentVS != none)
            {
                // End:0x375
                if(currentVS.AIResDefenderVS.AreAnyAttackSlotOccupied())
                {
                    // End:0x374
                    foreach currentVS.AIResDefenderVS.AllAttackers(Class'LPAIPawnDefender', Defender)
                    {
                        Defender.bPostLaunchDieTazed = true;
                        Defender.CheckStartDieDoT();
                        ZapWasUseful = true;                        
                    }                    
                }
            }
        }
        // End:0x3A5
        if(ZapWasUseful)
        {
            Taser.UseCharge(self);            
        }
        else
        {
            // End:0x420
            if(currentVS.TuneDataVSPlayerPawn.TaserFailedNoAction != none)
            {
                PlaySound(currentVS.TuneDataVSPlayerPawn.TaserFailedNoAction);
            }
        }
    }
    //return;    
}

function VSShockWithWinchArmReleased()
{
    // End:0x7F
    if((bIsInVitalSuit && HasUpgrade(Class'LPVSUpgrade_Taser')) && IsDoingSpecialMove_OF_Class(Class'LPSM_ForkArmGrab_Base'))
    {
        MyBasePlayerPawn.BroadcastSMMessageToAll(0, Class'LPSMMTypes'.default.SMM_ShockEnd);
    }
    //return;    
}

function VSWinchPointReleased()
{
    // End:0x66
    if(bIsInVitalSuit && IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchWinchPoint'))
    {
        MyBasePlayerPawn.BroadcastSMMessageToAll(0, Class'LPSMMTypes'.default.SMM_WinchPointRelease);
    }
    //return;    
}

simulated function AllowedToSwitchWeapons()
{
    local /*0x97E50000-0x00000000*/ private @NULL DesiredWeapon[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL W;

    // End:0xBA
    if(MyBasePlayerPawn != none)
    {
        // End:0x5A
        if(IsDoingASpecialMove() && !MyPlayerPawn.GetCurrentSpecialMoveInstance().CanBeInterruptedBySwitchWeapon())
        {
            return false;
        }
        W = LPWeapon(MyPlayerPawn.Weapon);
        // End:0xBA
        if(W != none)
        {
            return W.CanSwitchWeapon();
        }
    }
    return true;
    //return ReturnValue;    
}

function IgnoreMoveInput()
{
    local /*0x97E50000-0x00000000*/ private bool bNewMoveInput[8388609], bEndSpecialMove;

    super(SPInputPlayerController).IgnoreMoveInput(bNewMoveInput);
    // End:0x165
    if(bNewMoveInput && IsDoingASpecialMove())
    {
        bEndSpecialMove = true;
        // End:0x89
        if((int(WorldInfo.NetMode) == int(NM_Standalone)) && IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerRepairBase'))
        {
            bEndSpecialMove = false;
        }
        // End:0xD6
        if((int(WorldInfo.NetMode) != int(NM_Standalone)) && IsDoingSpecialMove_OF_Class(Class'LPSM_VSWaitEntryEnd'))
        {
            bEndSpecialMove = false;
        }
        // End:0x124
        if(MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_AllowSMToContinueOnIgnoreMoveInput, self))
        {
            bEndSpecialMove = false;
        }
        // End:0x165
        if(bEndSpecialMove && !IsInState('StruggleMode'))
        {
            MyBasePlayerPawn.EndCurrentSpecialMove();
        }
    }
    //return;    
}

function IsGrenadeUnderhand()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon, CamLoc, AimCollisionPoint, CamRot, StartTrace, EndTrace,
	    HitLocation, HitNormal, HitActor;

    local /*0x97E50000-0x00000000*/ private bool bJoyUpDominant;
    local /*0x97E50000-0x00000000*/ private float RemappedJoyUpAbs, RemappedJoyRightAbs;

    GrenadeWeapon = MyPlayerPawn.GetGrenade();
    // End:0x34E
    if(GrenadeWeapon != none)
    {
        // End:0x136
        if(MyPlayerPawn.IsUsingCover() && int(MyPlayerPawn.CoverType) == int(2))
        {
            RemappedJoyUpAbs = Abs(RemappedJoyUp);
            RemappedJoyRightAbs = Abs(RemappedJoyRight);
            // End:0x114
            if((RemappedJoyUpAbs > DeadZoneThreshold) || RemappedJoyRightAbs > DeadZoneThreshold)
            {
                bJoyUpDominant = RemappedJoyUpAbs > RemappedJoyRightAbs;
                SetPawnLeanPreference(!bJoyUpDominant);
            }
            return !MyPlayerPawn.bPreferLeanOverPopup;
        }
        PlayerCamera.GetCameraViewPoint(CamLoc, CamRot);
        // End:0x34E
        if(CamRot.Pitch < GrenadeWeapon.UnderhandTossViewPitchThreshold)
        {
            AimCollisionPoint = MyPlayerPawn.AimController.GetAimCollisionPoint();
            // End:0x34E
            if((AimCollisionPoint != vect(0.0000000, 0.0000000, 0.0000000)) && VSizeSq(AimCollisionPoint - CamLoc) < GrenadeWeapon.UnderhandTossFloorDistanceSquared)
            {
                StartTrace = MyPlayerPawn.Location + vect(0.0000000, 0.0000000, -20.0000000);
                EndTrace = StartTrace + (Vector(MyPlayerPawn.Rotation) * GrenadeWeapon.UnderhandTossWallDistance);
                HitActor = Class'LPWeapon'.static.WeaponTrace(GrenadeWeapon.Class, MyPlayerPawn, HitLocation, HitNormal, EndTrace, StartTrace);
                // End:0x34E
                if(HitActor == none)
                {
                    return true;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function WantsToThrowGrenade()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon;

    // End:0x24
    if(!PlayerMoveInfo.bGrenadeButtonPressed)
    {
        return false;
    }
    // End:0xE1
    if(!bIsInVitalSuit && !IsDoingASpecialMove() || MyBasePlayerPawn.GetCurrentSpecialMoveInstance().CanOverrideMoveWith(Class'LPSM_GrenadePrimeThrowBase'))
    {
        GrenadeWeapon = MyPlayerPawn.GetGrenade();
        return (GrenadeWeapon != none) && GrenadeWeapon.HasGrenades();
    }
    return false;
    //return ReturnValue;    
}

function PullOutGrenade()
{
    // End:0x48
    if(IsGrenadeUnderhand())
    {
        MyPlayerPawn.bUnderhandGrenadePose = true;
        DoSpecialMove(Class'LPSM_GrenadePrimeUnderhand', true);        
    }
    else
    {
        MyPlayerPawn.bUnderhandGrenadePose = false;
        DoSpecialMove(Class'LPSM_GrenadePrime', true);
    }
    MyPlayerPawn.ServerUpdateGrenadePose(MyPlayerPawn.bUnderhandGrenadePose);
    //return;    
}

function GrenadeButtonPress()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenadeWeapon;

    // End:0x27
    if(!MyBasePlayerPawn.CanFireWeapon(true))
    {
        return;
    }
    // End:0x105
    if(!bIsInVitalSuit && !IsDoingASpecialMove() || MyBasePlayerPawn.GetCurrentSpecialMoveInstance().CanOverrideMoveWith(Class'LPSM_GrenadePrimeThrowBase'))
    {
        GrenadeWeapon = MyPlayerPawn.GetGrenade();
        // End:0xFB
        if((!DoesPlayerCSAAllowWeapons() || GrenadeWeapon == none) || !GrenadeWeapon.HasGrenades())
        {
            return;
        }
        PullOutGrenade();
    }
    //return;    
}

function OnGrenadePull()
{
    PauseFire();
    //return;    
}

function NotifyGrenadeReleased()
{
    //return;    
}

function GrenadeStopButtonPress()
{
    // End:0xB1
    if(!bIsInVitalSuit && Pawn != none)
    {
        // End:0xB1
        if((MyPlayerPawn.GetGrenade() != none) && MyPlayerPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_GrenadePrime'))
        {
            MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_GrenadeReleased, self);
        }
    }
    //return;    
}

function CanToggleFlashLight()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bIsInVitalSuit)
    {
        return false;
    }
    return super(SPPlayerController).CanToggleFlashLight();
    //return ReturnValue;    
}

function ShoulderAimButtonPress()
{
    local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

    PlayerMoveInfo.bShoulderAimButtonPressed = bPressed;
    UpdateAimDownSight();
    //return;    
}

function ConditionalChangeZoom()
{
    // End:0x1CB
    if((((((!bIsInVitalSuit && !SPPlayerCameraManager(PlayerCamera).GetCameraMode().IsA('LPCameraModeAimControlGrenade')) && !SPPlayerCameraManager(PlayerCamera).GetCameraMode().IsA('LPCameraModeAimControlAnimated')) && !IsInState('StruggleMode')) && !MyPlayerPawn.IsReloadingWeapon() || !MyPlayerPawn.WeaponHasReloadAnim()) && !MyPlayerPawn.bUseZiplineVSTransition) && MyPlayerPawn.IsAliveAndWell())
    {
        // End:0x156
        if(!DoesPlayerCSAAllowWeapons())
        {
            return;
        }
        // End:0x18E
        if((MyPlayerPawn != none) && !MyPlayerPawn.CanFireWeapon(true))
        {
            return;
        }
        SPInventoryWeapon(MyPlayerPawn.Weapon).ConditionalChangeZoom();
    }
    //return;    
}

function CheckMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(bMunitionsLockerEnabled)
    {
        OpenMunitionsLocker();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function EnterWalkState()
{
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];

    false
    // End:0x112
    if(((((((Pawn != none) && !Pawn.bDeleteMe) && !Pawn.bPendingDelete) && !Pawn.IsInState('Dying')) && !Pawn.IsInState('Dead')) && !IsInState('Incapacitated')) && !LPPawn(Pawn).bBearTrapped)
    {
        MPStartState('PlayerWalking', bForce);
    }
    //return;    
}

function BeginRollState()
{
    //return;    
}

function StartVSDash()
{
    local /*0x97E50000-0x00000000*/ private name VSDashStateName[8388609];

    //return;    
}

function DoPlayerGrapplingState()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DoPlayerGrapplingDownState()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

delegate GrappleRecoverySort()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float DistA, DistB;
    local /*0x97E50000-0x00000000*/ private @NULL Delta;

    Delta = A.Location - LastSolidFootingLocation;
    DistA = VSizeSq(Delta);
    Delta = B.Location - LastSolidFootingLocation;
    DistB = VSizeSq(Delta);
    // End:0xA9
    if(DistA == DistB)
    {
        return 0;
    }
    // End:0xC2
    if(DistA < DistB)
    {
        return 1;
    }
    return -1;
    //return ReturnValue;    
}

function AttemptFallRecovery()
{
    //return;    
}

function RightArmButtonPress()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn, MyFutureVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(Pawn);
    // End:0xC8
    if(MyVSPawn != none)
    {
        MyFutureVSPawn = LPVSFuturePlayerPawn(MyVSPawn);
        // End:0x67
        if(MyFutureVSPawn != none)
        {
            StartVSFire(0, 0);            
        }
        else
        {
            // End:0xC8
            if(!LPVSPlayerPawn(MyVSPawn).RightArmPart.BroadcastSMMStart())
            {
                PlayerMoveInfo.bRightArmPrimaryActionPressed = true;
            }
        }
    }
    //return;    
}

function RightArmStopButtonPress()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn, MyFutureVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(Pawn);
    // End:0xB3
    if(MyVSPawn != none)
    {
        MyFutureVSPawn = LPVSFuturePlayerPawn(MyVSPawn);
        // End:0x67
        if(MyFutureVSPawn != none)
        {
            StopVSFire(0, 0);            
        }
        else
        {
            // End:0xB3
            if(!LPVSPlayerPawn(MyVSPawn).RightArmPart.BroadcastSMMEnd())
            {
                StartRightArmTransitionOut();
            }
        }
    }
    PlayerMoveInfo.bRightArmPrimaryActionPressed = false;
    //return;    
}

function RightArmAltButtonPress()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;

    MyVSPawn = LPVSPlayerPawn(Pawn);
    // End:0x8E
    if(MyVSPawn != none)
    {
        // End:0x8E
        if(!MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmAltActionPressed, self))
        {
            PlayerMoveInfo.bRightArmAltActionPressed = true;
        }
    }
    //return;    
}

function RightArmAltButtonRelease()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;

    MyVSPawn = LPVSPlayerPawn(Pawn);
    // End:0x6A
    if(MyVSPawn != none)
    {
        MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_VSRightArmAltActionReleased, self);
    }
    //return;    
}

function CanDoRightArmPrimaryAction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bIsInVitalSuit)
    {
        return false;
    }
    // End:0x3A
    if(IsDoingASpecialMove() && !IsDoingSpecialMove(Class'LPSM_PlayerVSHitReaction'))
    {
        return false;
    }
    // End:0x98
    if((LPVSPlayerPawn(Pawn) == none) || !LPVSPlayerPawn(Pawn).RightArmPart.IsEquippedAndIdle())
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function StartRightArmTransitionIn()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    vsPawn = LPVSPlayerPawn(MyBasePlayerPawn);
    // End:0x71
    if(vsPawn.SubscribedOnArmAction != none)
    {
        vsPawn.OnArmAction('RightActionShort');
    }
    vsPawn.RightArmPart.InitializeAction(self, 0);
    //return;    
}

function StartRightArmTransitionOut()
{
    // End:0x25
    if(IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSRightArmActionBase'))
    {
        DoSpecialMove(none, true);
    }
    //return;    
}

function CanDoRightArmAltAction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bIsInVitalSuit)
    {
        return false;
    }
    // End:0x3A
    if(IsDoingASpecialMove() && !IsDoingSpecialMove(Class'LPSM_PlayerVSHitReaction'))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function ProcessWinchArmFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPVP, Winch;

    LPVP = LPVSPlayerPawn(MyBasePlayerPawn);
    Winch = LPWeaponVSWinch(LPVP.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x69
    if(Winch == none)
    {
        return;
    }
    // End:0x8D
    if(Winch.bIsKismetLocked)
    {
        return;
    }
    // End:0x109
    if((Winch.SpawnedProjectile != none) && Winch.GrabbedPawn == none)
    {
        // End:0x106
        if(!IsDoingSpecialMove(Class'LPSM_PlayerVSWinchFireRetract'))
        {
            DoSpecialMove(Class'LPSM_PlayerVSWinchFireRetract', true);
        }        
    }
    else
    {
        // End:0x1FB
        if((!IsDoingASpecialMove() && Winch.IsInState('Idle')) || ((LPVP.GetCurrentSpecialMoveInstance() != none) && LPVP.GetCurrentSpecialMoveInstance().IsA('LPSM_PlayerVSWinchArmGrabbedPawn')) && LPSM_PlayerVSWinchArmGrabbedPawn(MyBasePlayerPawn.GetCurrentSpecialMoveInstance()).bIsHolding)
        {
            DoSpecialMove(Class'LPSM_PlayerVSWinchArmFire', true);
        }
    }
    //return;    
}

function ProcessRightArmAltAction()
{
    DoSpecialMove(Class'LPSM_PlayerVSDrillArmSwing1Start', true, true);
    //return;    
}

function CanShieldBlock()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, Winch;

    // End:0x11
    if(!bIsInVitalSuit)
    {
        return false;
    }
    // End:0x3E
    if(MyBasePlayerPawn.IsDoingSpecialMove(Class'LPSM_VSShieldBlock'))
    {
        return false;
    }
    // End:0x6E
    if(!MyBasePlayerPawn.CanDoSpecialMove(Class'LPSM_VSShieldBlock'))
    {
        return false;
    }
    vsPawn = LPVSPlayerPawn(Pawn);
    // End:0xF9
    if(vsPawn != none)
    {
        Winch = vsPawn.GetWinchWeapon();
        // End:0xF9
        if((Winch != none) && !Winch.IsRetracted())
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function VSShieldBlockButtonPress()
{
    PlayerMoveInfo.bVSShieldBlockPressed = true;
    PlayerMoveInfo.bVSShieldBlockPressedThisTick = true;
    //return;    
}

function VSShieldBlockButtonRelease()
{
    // End:0x4E
    if(bIsInVitalSuit)
    {
        MyBasePlayerPawn.BroadcastSMMessageToAll(0, Class'LPSMMTypes'.default.SMM_VSShieldBlockReleased);
    }
    PlayerMoveInfo.bVSShieldBlockPressed = false;
    PlayerMoveInfo.bVSShieldBlockPressedThisTick = false;
    //return;    
}

function StartVSShieldBlock()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3E
    if(PlayerMoveInfo.bVSShieldBlockPressedThisTick)
    {
        // End:0x3E
        if((CanUseCombatWindow_ActiveDefense()) && TryCombatWindow_ActiveDefense())
        {
            return true;
        }
    }
    // End:0x56
    if(IsDoingSpecialMove_OF_Class(Class'LPSM_DirectionalHitReaction'))
    {
        return false;
    }
    DoSpecialMove(Class'LPSM_VSShieldBlock',, true);
    return true;
    //return ReturnValue;    
}

function LeftArmButtonPress()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn, MyFutureVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(Pawn);
    // End:0xE2
    if(MyVSPawn != none)
    {
        MyFutureVSPawn = LPVSFuturePlayerPawn(MyVSPawn);
        // End:0x67
        if(MyFutureVSPawn != none)
        {
            StartVSFire(1, 0);            
        }
        else
        {
            // End:0xAC
            if(MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_ForkArmGrabPressed, self))
            {                
            }
            else
            {
                // End:0xCB
                if((CanUseCombatWindow_ForkArm()) && TryCombatWindow_ForkArm())
                {                    
                }
                else
                {
                    // End:0xE2
                    if(CanDoFreeStandingForkArmGrab())
                    {
                        StartFreeStandingForkArmGrab();
                    }
                }
            }
        }
    }
    //return;    
}

function LeftArmButtonRelease()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn, MyFutureVSPawn;

    MyVSPawn = LPBaseVSPlayerPawn(Pawn);
    // End:0xA6
    if(MyVSPawn != none)
    {
        MyFutureVSPawn = LPVSFuturePlayerPawn(MyVSPawn);
        // End:0x67
        if(MyFutureVSPawn != none)
        {
            StopVSFire(1, 0);            
        }
        else
        {
            MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_ForkArmGrabReleased, self);
        }
    }
    //return;    
}

event CanDoFreeStandingForkArmGrab()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x18
    if(IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchFireBase'))
    {
        return false;
    }
    return ((bIsInVitalSuit && DoesStateAllow_ForkArm()) && CanDoSpecialMove(Class'LPSM_ForkArmGrabMiss')) && MyBasePlayerPawn.GetSpecialMoveInstance(Class'LPSM_ForkArmGrab_Grab') != none;
    //return ReturnValue;    
}

function StartFreeStandingForkArmGrab()
{
    LPVSPlayerPawn(MyBasePlayerPawn).StartForkArmGrab();
    //return;    
}

exec function ForceEndMatch()
{
    // End:0x33
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        ServerForceEndMatch();
    }
    //return;    
}

exec function QuitToMainMenu()
{
    ReturnToMainMenu();
    //return;    
}

reliable server function ServerForceEndMatch()
{
    // End:0x6E
    if(WorldInfo.Game != none)
    {
        WorldInfo.Game.GameReplicationInfo.RemainingTime = 1;
    }
    //return;    
}

function StartTapOut()
{
    local /*0x97E50000-0x00000000*/ private bool bNoxious[9437185];

    false
    //return;    
}

function StartTapIn()
{
    //return;    
}

function StartTapOutNoxious()
{
    StartTapOut(true);
    //return;    
}

reliable server function ServerDoTapIn()
{
    //return;    
}

reliable server function ServerDoTapOut()
{
    local /*0x97E50000-0x00000000*/ private bool bNoxious[9437185];

    false
    //return;    
}

reliable server function ServerConfirmControllerState()
{
    local /*0x97E50000-0x00000000*/ private name st[8388609], curr;

    curr = GetStateName();
    // DebugMode: 0
    assert(curr == st);
    //return;    
}

function InitIncapacitationCamera()
{
    IncapacitatedCameraParams.PositionTarget = Pawn;
    IncapacitatedCameraParams.LookAtTarget = Pawn;
    ChangeCameraMode(IncapacitatedCameraParams, IncapacitatedTransitionParam);
    ClearTimer('InitIncapacitationCamera');
    //return;    
}

function InitInterestingCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillerPawn;
    local /*0x97E50000-0x00000000*/ private bool bOk;

    // End:0xC0
    if(TVCameraManager != none)
    {
        KillerPawn = FindKiller();
        // End:0x82
        if((KillerPawn != none) && KillerPawn != Pawn)
        {
            bOk = TVCameraManager.EnableTVCamera(1, KillerPawn, 2);
        }
        // End:0xC0
        if(!bOk)
        {
            bOk = TVCameraManager.EnableTVCamera(2, none, 2);
        }
    }
    // End:0xD9
    if(!bOk)
    {
        InitIncapacitationCamera();
    }
    ClearTimer('InitInterestingCamera');
    //return;    
}

simulated function CanDeployNoxious()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TE, ND;

    // End:0x14
    if(!IsInState('Incapacitated'))
    {
        return false;
    }
    TE = LPThermalEnergy(Pawn.FindInventoryType(Class'LPThermalEnergy', true));
    // End:0x61
    if(TE == none)
    {
        return false;
    }
    ND = LPPerkNoxiousDemise(MyPlayerPawn.GetEnabledPerk(13));
    // End:0xA6
    if(ND == none)
    {
        return false;
    }
    // End:0xEC
    if(TE.GetEnergyCount() < ND.GetCost(true))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function PauseBleedOut()
{
    DelayBleedOutUntilTime = 1.0000000 + WorldInfo.TimeSeconds;
    //return;    
}

function SetupRagdollRecoverPosition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Extent, TraceStart, TraceEnd, HeightVec, HitLocation, HitNormal,
	    HitActor;

    Extent.X = MySPPawn.CylinderComponent.CollisionRadius;
    Extent.Y = MySPPawn.CylinderComponent.CollisionRadius;
    Extent.Z = 1.0000000;
    HeightVec = vect(0.0000000, 0.0000000, 1.0000000) * MySPPawn.CylinderComponent.CollisionHeight;
    TraceStart = MySPPawn.LastGoodLocationBeforeRagdoll + (HeightVec * 1.1000000);
    TraceEnd = MySPPawn.LastGoodLocationBeforeRagdoll - (HeightVec * 2.0000000);
    HitActor = MySPPawn.Trace(HitLocation, HitNormal, TraceEnd, TraceStart, true, Extent,, MySPPawn.8);
    // End:0x1FB
    if(HitActor == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

reliable client simulated function ClientVerifyIncapacitated()
{
    GotoState('Incapacitated');
    EnableTapIn();
    //return;    
}

function MakeSureClientIncapacitated()
{
    //return;    
}

simulated function EnableTapIn()
{
    //return;    
}

function AutoRespawn()
{
    //return;    
}

function CloseRespawnScoreboard()
{
    local /*0x97E50000-0x00000000*/ private bool bImmediateClose[8388609];

    // End:0xA3
    if(myLPHUD != none)
    {
        HideCrosshair(false);
        myLPHUD.ShowRadar(true);
        myLPHUD.ShowWeaponCluster(true);
        myLPHUD.ShowHealthCluster(true);
        myLPHUD.CloseRoundScoreboard(bImmediateClose);
    }
    //return;    
}

function CloseRoundScoreboard()
{
    local /*0x97E50000-0x00000000*/ private bool bImmediateClose[8388609];

    // End:0x38
    if(myLPHUD != none)
    {
        myLPHUD.CloseRoundScoreboard(bImmediateClose);
    }
    //return;    
}

simulated function GetRespawnDelay()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    return 0;
    //return ReturnValue;    
}

function Timer_HandleScoreboard()
{
    //return;    
}

function FindKiller()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyPRI;

    MyPRI = LPPRI(PlayerReplicationInfo);
    return ((MyPRI != none) ? MyPRI.LastKillerPawn : none);
    //return ReturnValue;    
}

function InitDeathCameraZoom()
{
    local /*0x97E50000-0x00000000*/ private @NULL KillerPawn;

    KillerPawn = FindKiller();
    // End:0xB7
    if((KillerPawn != none) && KillerPawn.Controller != self)
    {
        DeathCameraZoomCamParams.Position = LastKnownPawnLocation;
        DeathCameraZoomCamParams.LookAtTarget = KillerPawn;
        ChangeCameraMode(DeathCameraZoomCamParams, DeathCameraZoomTransitionParam);
    }
    //return;    
}

function ReInitHUD()
{
    local /*0x97E50000-0x00000000*/ private class HUDType;

    // End:0x11
    if(myHUD == none)
    {
        return;
    }
    HUDType = myHUD.Class;
    ClientSetHUD(HUDType);
    //return;    
}

function OnCheckpoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        // End:0x46
        if(bMissionFailed)
        {
            return;
        }
    }
    super(SPPlayerController).OnCheckpoint(Action);
    //return;    
}

function OnMissionFailedContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    OnMissionFailed(Action);
    //return;    
}

function OnMissionFailed()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x219
    if(((int(WorldInfo.NetMode) == int(NM_Standalone)) && !bMissionFailed) && !IsInState('Dead'))
    {
        bMissionFailed = true;
        myLPHUD.AbortKismetMessage();
        // End:0xDB
        if((Action != none) && Action.MissionFailedSound != none)
        {
            PlaySound(Action.MissionFailedSound);
        }
        // End:0x171
        if((Action != none) && Action.MessageText != none)
        {
            myLPHUD.DisplayHUDMessageLayer(0, Action.MessageText.LocalizedTextMarkUp);            
        }
        else
        {
            myLPHUD.DisplayHUDMessageLayer(0, "<Strings:LostPlanetGame.HUDStatusMessages.HUDStatus_ObjectiveFailed>");
        }
        // End:0x20F
        if(MissionFailedDelayForPostProcessEffect > 0.0000000)
        {
            SetTimer(MissionFailedDelayForPostProcessEffect, false, 'StartMissionFail');            
        }
        else
        {
            StartMissionFail();
        }
    }
    //return;    
}

function StartMissionFail()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP, DPP;

    HideCrosshair(true);
    myLPHUD.SetMasterDisplaySwitchReticle(false);
    myLPHUD.ShowWeaponCluster(false);
    myLPHUD.SetMasterDisplaySwitchWeaponsCluster(false);
    myLPHUD.ShowHealthCluster(false);
    myLPHUD.ShowRadar(false);
    myLPHUD.SetMasterDisplaySwitchRadar(false);
    LPP = GetMyPlayerPawn();
    // End:0x1E3
    if(((LPP != none) && MissionFailedPostProcessEffectDuration > 0.0000000) && MissionFailedPercentPostProcessEffectToFinish > 0.0000000)
    {
        DPP = LPFXAction_DeathPostProcess(LPP.GetFXActionManager().GetFXAction(Class'LPFXAction_DeathPostProcess'));
        // End:0x1E3
        if(DPP != none)
        {
            DPP.SetFreezeTime(MissionFailedPostProcessEffectDuration);
            DPP.Begin();
            SetTimer(MissionFailedPostProcessEffectDuration * MissionFailedPercentPostProcessEffectToFinish, false, 'FinishMissionFail');
            return;
        }
    }
    FinishMissionFail();
    //return;    
}

function FinishMissionFail()
{
    PawnDied(Pawn);
    //return;    
}

exec function ReturnToLastMenu()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Reason[9437185], ReasonTitle;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0xD0
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(MPMgr.OwningControllerIndex));
    }
    // End:0x1CA
    if((int(LoginStatus) > int(0)) && MPMgr.IsInGame() || MPMgr.IsInParty())
    {
        // End:0x18A
        if((int(LoginStatus) == int(1)) && int(MPMgr.OnlineMode) == int(1))
        {
            ReturnToMainMenu(Reason, ReasonTitle);            
        }
        else
        {
            ReturnToMPLobby(Reason, ReasonTitle, !MPMgr.IsPartyLeader());
        }        
    }
    else
    {
        ReturnToMainMenu(Reason, ReasonTitle);
    }
    //return;    
}

function DisplayReturnToTitleError()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message[8388609], Title, AliasButtonString;
    local /*0x97E50000-0x00000000*/ private bool bClearExistingMessages[9437185], bPauseGameWhileActive;

    Class'LPUIDataStore_FrontEnd'.static.SetSkipTitleScreen(false);
    super(SPPlayerController).DisplayReturnToTitleError(Message, Title, AliasButtonString, bClearExistingMessages, bPauseGameWhileActive);
    //return;    
}

exec function ReturnToMainMenu()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Reason[9437185], ReasonTitle;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(MPMgr.OwningControllerIndex));
    // End:0x165
    if(int(LoginStatus) == int(2))
    {
        // End:0x12D
        if(int(Role) == int(ROLE_Authority))
        {
            Class'LPMultiplayerManager'.static.GetInstance().__OnDisbandPartyRequestComplete__Delegate = None;
            Class'LPMultiplayerManager'.static.GetInstance().HandleDisbandParty();
        }
        Class'LPMultiplayerManager'.static.GetInstance().DisbandAndDestroyParty();        
    }
    super(SPPlayerController).ReturnToMainMenu(Reason, ReasonTitle);
    Class'LPMultiplayerManager'.static.Destroy();
    bIsReturningToMenu = true;
    //return;    
}

exec function ReturnToMPLobby()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Reason[9437185], ReasonTitle;
    local /*0x97E50000-0x00000000*/ private bool bLeaveParty[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;
    local /*0x97E50000-0x00000000*/ private editfixedsize string URL;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    Class'LPMPMapList'.static.ShowMapGameSpecificLoadingMovie("", 0);
    MPMgr.ClearDelegates();
    // End:0xD6
    if(int(Role) == int(ROLE_Authority))
    {
        WorldInfo.Game.EndOnlineGame();
        WorldInfo.ForceGarbageCollection();
    }
    // End:0x107
    if(MPMgr.ConnectionErrorCount >= 2)
    {
        bLeaveParty = true;
    }
    URL = "LostPlanetMPLobby?game=MPLobby";
    // End:0x191
    if(Len(Reason) > 0)
    {        
        URL $= ("?ErrorMessage=" $ Class'SPEngine.SPUtil'.static.GetLocalizedString(Reason));
    }
    // End:0x1EF
    if(Len(ReasonTitle) > 0)
    {        
        URL $= ("?ErrorTitle=" $ Class'SPEngine.SPUtil'.static.GetLocalizedString(ReasonTitle));
    }
    // End:0x270
    if(int(MPMgr.OnlineMode) == int(2))
    {        
        URL $= "?Closed";
        ClientTravel(URL, 0);
        MPMgr.DestroyOnlineGame();        
    }
    else
    {
        // End:0x440
        if(int(WorldInfo.NetMode) == int(NM_ListenServer))
        {
            // End:0x2FC
            if(MPMgr.SessionNameGame == MPMgr.SessionNameParty)
            {
                MPMgr.ConvertGameToParty();                
            }
            else
            {
                // End:0x341
                if(Len(Reason) == 0)
                {
                    Reason = "<Strings:Engine.Errors.ConnectionFailed>";
                }
                // End:0x38C
                if(Len(ReasonTitle) == 0)
                {
                    ReasonTitle = "<Strings:Engine.Errors.ConnectionFailed_Title>";
                }
                MPMgr.KickNonPartyMembers(Reason, ReasonTitle);
                MPMgr.DestroyOnlineGame();
            }
            WorldInfo.Game.bUseSeamlessTravel = true;
            WorldInfo.ServerTravel(URL);            
        }
        else
        {
            // End:0x4A6
            if((!bLeaveParty && MPMgr.IsInParty()) && !MPMgr.IsPartyLeader())
            {
                ReturnToPartyLeader();                
            }
            else
            {                
                URL $= "?Listen";
                ClientTravel(URL, 0);
                MPMgr.DestroyOnlineGame();
                // End:0x528
                if(bLeaveParty)
                {
                    MPMgr.DestroyOnlineParty();
                }
            }
        }
    }
    MPMgr.ResetDLCFilter();
    bIsReturningToMenu = true;
    //return;    
}

reliable client simulated function ClientReturnToMPLobby()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Reason[9437185], ReasonTitle;
    local /*0x97E50000-0x00000000*/ private bool bLeaveParty[9437185];

    Class'SPEngine.SPUIManager'.static.CloseAllUIMessageBoxes();
    ReturnToMPLobby(Reason, ReasonTitle, bLeaveParty);
    //return;    
}

exec function ReturnToPartyLeader()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    Class'LPMPMapList'.static.ShowMapGameSpecificLoadingMovie("", 0);
    ScriptTrace();
    MPMgr.SessionToJoin = MPMgr.PartyOwnerSession;
    MPMgr.FinishJoinTravel();
    MPMgr.DestroyOnlineGame();
    bIsReturningToMenu = true;
    //return;    
}

reliable client simulated function ClientReturnToPartyLeader()
{
    ReturnToPartyLeader();
    //return;    
}

exec function ReturnToPreGameLobby()
{
    // End:0x11B
    if((int(Role) == int(ROLE_Authority)) && IsLocalPlayerController())
    {
        Class'LPMPMapList'.static.ShowMapGameSpecificLoadingMovie("", ROLE_None);
        WorldInfo.Game.EndOnlineGame();
        WorldInfo.ForceGarbageCollection();
        WorldInfo.Game.bUseSeamlessTravel = true;
        WorldInfo.ServerTravel("LostPlanetPreGameLobby?game=PreGameLobby");
    }
    //return;    
}

reliable client simulated function ClientTravelToSession()
{
    local /*0x97E50000-0x00000000*/ private name SessionName[8388609];
    local /*0x97E50000-0x00000000*/ private class SearchClass[8388609];
    local /*0x97E50000-0x00000000*/ private byte PlatformSpecificInfo[8388748];
    local /*0x97E50000-0x00000000*/ private bool bIsPartySession[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Search, LP, MPMgr, SessionToJoin;
    local /*0x97E50000-0x00000000*/ private bool bSkipBeaconCheck;

    LP = LocalPlayer(Player);
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x56
    if(LP == none)
    {
        return;
    }
    Search = new SearchClass;
    // End:0xDC
    if(!OnlineSub.GameInterface.BindPlatformSpecificSessionToSearch(byte(LP.ControllerId), Search, PlatformSpecificInfo))
    {
        return;
    }
    SessionToJoin = Search.Results[0];
    PreJoinUpdateGameSettings(SessionName, SessionToJoin.GameSettings);
    // End:0x1A0
    if(EqualEqual_UniqueNetIdUniqueNetId(SessionToJoin.GameSettings.OwningPlayerId, MPMgr.PartyOwnerNetId))
    {
        bSkipBeaconCheck = true;        
    }
    else
    {
        bSkipBeaconCheck = false;
    }
    // End:0x214
    if(bIsPartySession && !MPMgr.bGroupPartyMembers)
    {
        MPMgr.JoinParty(SessionToJoin, bSkipBeaconCheck);        
    }
    else
    {
        // End:0x261
        if(MPMgr.bGroupPartyMembers)
        {
            MPMgr.JoinReservedSession(SessionToJoin);            
        }
        else
        {
            MPMgr.JoinGame(SessionToJoin, true, bSkipBeaconCheck);
        }
    }
    //return;    
}

function WaitForJoinInProgressPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Game;

    // End:0xE6
    if(((int(WorldInfo.NetMode) != int(NM_Client)) && !IsLocalPlayerController()) && IsInState('PlayerWaiting'))
    {
        Game = LPGameMP_Base(WorldInfo.Game);
        // End:0xE6
        if(((Game != none) && Game.MatchIsInProgress()) && !Game.bStartingMatch)
        {
            GotoState('ServerWaitForJoinInProgressPlayer');
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function EnterStartState()
{
    // End:0x0F
    if(WaitForJoinInProgressPlayer())
    {
        return;
    }
    // End:0x45
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        super(PlayerController).EnterStartState();        
    }
    else
    {
        CheckEnterStartState();
        // End:0x7C
        if(IsLocalPlayerController())
        {
            Class'LPGameMP_Base'.static.StopLoadingOrClientMovie(self);
        }
    }
    //return;    
}

function DisplayThermalPostMessage_Drop()
{
    // End:0x13A
    if((IsLocalPlayerController()) && Pawn.IsAliveAndWell())
    {
        // End:0xCB
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            myLPHUD.DisplayHUDMessageLayer(14, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_DropTEngPostHold>");            
        }
        else
        {
            myLPHUD.DisplayHUDMessageLayer(14, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_DropTEngPostPress>");
        }
    }
    //return;    
}

function DisplayStruggleMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

    // End:0x106
    if(bOn)
    {
        // End:0x103
        if(IsLocalPlayerController())
        {
            UIElementInfo.InputCalloutMarkupString = "<InputCallOuts:GBA_StruggleButton>";
            UIElementInfo.UIElementClass = Class'LPGFxUIElementGameMessageStruggle';
            myLPHUD.DisplayHUDMessageLayer(2, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_Struggle>", -1.0000000, None,,,, UIElementInfo);
        }        
    }
    else
    {
        myLPHUD.RemoveMessageLayer(2);
    }
    //return;    
}

function DisplayStruggleWaggleMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

    // End:0x102
    if(bOn)
    {
        // End:0xFF
        if(IsLocalPlayerController())
        {
            UIElementInfo.InputCalloutMarkupString = "<InputCallouts:UI_SelectHoriz>";
            UIElementInfo.UIElementClass = Class'LPGFxUIElementGameMessageStruggleWaggle';
            myLPHUD.DisplayHUDMessageLayer(2, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_Struggle>", -1.0000000, None,,,, UIElementInfo);
        }        
    }
    else
    {
        myLPHUD.RemoveMessageLayer(2);
    }
    //return;    
}

function DisplayStruggleStickLeftMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

    // End:0x10A
    if(bOn)
    {
        // End:0x107
        if(IsLocalPlayerController())
        {
            UIElementInfo.InputCalloutMarkupString = "<InputCallouts:Gamepad_LeftStick_Left>";
            UIElementInfo.UIElementClass = Class'LPGFxUIElementGameMessageStruggleStickLeft';
            myLPHUD.DisplayHUDMessageLayer(2, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_Struggle>", -1.0000000, None,,,, UIElementInfo);
        }        
    }
    else
    {
        myLPHUD.RemoveMessageLayer(2);
    }
    //return;    
}

function DisplayStruggleStickRightMessage()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

    // End:0x10B
    if(bOn)
    {
        // End:0x108
        if(IsLocalPlayerController())
        {
            UIElementInfo.InputCalloutMarkupString = "<InputCallouts:Gamepad_LeftStick_Right>";
            UIElementInfo.UIElementClass = Class'LPGFxUIElementGameMessageStruggleStickRight';
            myLPHUD.DisplayHUDMessageLayer(2, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_Struggle>", -1.0000000, None,,,, UIElementInfo);
        }        
    }
    else
    {
        myLPHUD.RemoveMessageLayer(2);
    }
    //return;    
}

function DisplayThermalPostMessage_Pump()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

    // End:0x122
    if((IsLocalPlayerController()) && Pawn.IsAliveAndWell())
    {
        UIElementInfo.InputCalloutMarkupString = "<InputCallOuts:GBA_OperateThermalPost>";
        UIElementInfo.UIElementClass = Class'LPGFxUIElementGameMessageTENGPost';
        myLPHUD.DisplayHUDMessageLayer(14, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_PumpTEngPost>", -1.0000000, None,,,, UIElementInfo);
    }
    //return;    
}

function OnThermalPostAnimationEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function AnimNotifyThermalPostPlanted()
{
    //return;    
}

reliable server function ServerAbortThermalPostInflation()
{
    //return;    
}

function SetThermalPost()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPost[8388609];

    // End:0xE5
    if(PlayerReplicationInfo != none)
    {
        // End:0x8C
        if(TPost == none)
        {
            // End:0x89
            if(LPPRI(PlayerReplicationInfo).MyThermalPost != none)
            {
                LPPRI(PlayerReplicationInfo).MyThermalPost.SetPlayerPawn(none);
            }            
        }
        else
        {
            TPost.SetPlayerPawn(MyPlayerPawn);
        }
        LPPRI(PlayerReplicationInfo).SetThermalPost(TPost);
    }
    //return;    
}

function ServerSetThermalPost()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPost[8388609];

    // End:0x3A
    if(TPost != none)
    {
        TPost.SetPlayerPawn(MyPlayerPawn);        
    }
    else
    {
        // End:0xB6
        if((PlayerReplicationInfo != none) && LPPRI(PlayerReplicationInfo).MyThermalPost != none)
        {
            LPPRI(PlayerReplicationInfo).MyThermalPost.SetPlayerPawn(none);
        }
    }
    // End:0xF6
    if(PlayerReplicationInfo != none)
    {
        LPPRI(PlayerReplicationInfo).SetThermalPost(TPost);
    }
    //return;    
}

function GetPlayersThermalPost()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x37
    if(PlayerReplicationInfo != none)
    {
        return LPPRI(PlayerReplicationInfo).MyThermalPost;
    }
    return none;
    //return ReturnValue;    
}

reliable server function ServerStartThermalPostOperation()
{
    local /*0x97E50000-0x00000000*/ private @NULL NearestPost[8388609];

    // End:0x57
    if((bIsInVitalSuit || MyPlayerPawn.IsDoingASpecialMove()) || MyPlayerPawn.bUseZiplineVSTransition)
    {
        return;
    }
    // End:0x136
    if(LPPRI(PlayerReplicationInfo).MyThermalPost != none)
    {
        // End:0x134
        if(LPPRI(PlayerReplicationInfo).MyThermalPost.IsAvailable() || LPPRI(PlayerReplicationInfo).MyThermalPost.MyPlayerController != self)
        {
            LPPRI(PlayerReplicationInfo).SetThermalPost(none);            
        }
        else
        {
            return;
        }
    }
    // End:0x16D
    if((NearestPost == none) || !NearestPost.IsAvailable())
    {
        return;
    }
    // End:0x19C
    if(!NearestPost.IsPawnInRange(Pawn))
    {
        return;
    }
    // End:0x1C5
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
    }
    ServerSetThermalPost(NearestPost);
    NearestPost.SetPlayerPawn(MyPlayerPawn);
    ClientStartThermalPostOperation(NearestPost);
    return;
    //return;    
}

function StartThermalPostOperation()
{
    // End:0x57
    if((bIsInVitalSuit || MyPlayerPawn.IsDoingASpecialMove()) || MyPlayerPawn.bUseZiplineVSTransition)
    {
        return;
    }
    // End:0x1AC
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x15F
        if(LPPRI(PlayerReplicationInfo).MyThermalPost != none)
        {
            // End:0x15D
            if(LPPRI(PlayerReplicationInfo).MyThermalPost.IsAvailable() || LPPRI(PlayerReplicationInfo).MyThermalPost.MyPlayerController != self)
            {
                LPPRI(PlayerReplicationInfo).SetThermalPost(none);                
            }
            else
            {
                return;
            }
        }
        // End:0x170
        if(LastTouchedThermalPost == none)
        {
            return;
        }
        // End:0x196
        if(!LastTouchedThermalPost.IsAvailable())
        {
            return;
        }
        ServerStartThermalPostOperation(LastTouchedThermalPost);        
    }
    else
    {
        // End:0x1E3
        if((LastTouchedThermalPost == none) || !LastTouchedThermalPost.IsAvailable())
        {
            return;
        }
        ServerStartThermalPostOperation(LastTouchedThermalPost);
    }
    //return;    
}

reliable client simulated function ClientStartThermalPostOperation()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPost[8388609];

    DoThermalPostOperation(TPost);
    //return;    
}

reliable server function ServerRecoverThermalPost()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPost[8388609], P;

    // End:0x2A
    if(TPost != LastTouchedThermalPost)
    {
        SetThermalPost(TPost);
    }
    TPost.SetPlayerController(self);
    TPost.SetPlayerPawn(P);
    TPost.DeployPost(P);
    //return;    
}

function DoThermalPostOperation()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPost[8388609];

    // End:0x22
    if(LastTouchedThermalPost == none)
    {
        LastTouchedThermalPost = TPost;
    }
    ClearThermalPostMessage();
    TPost = LastTouchedThermalPost;
    SetThermalPost(TPost);
    // End:0xB1
    if(TPost.IsUnstable())
    {
        MPStartState('InflateThermalPost');
        ServerRecoverThermalPost(TPost, MyPlayerPawn);
        DisplayThermalPostMessage_Pump();        
    }
    else
    {
        MPStartState('PlantThermalPost');
    }
    //return;    
}

function DisplayThermalPostMessage_Transfer()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

    // End:0x10B
    if(IsLocalPlayerController())
    {
        UIElementInfo.InputCalloutMarkupString = "<InputCallOuts:GBA_DoThermalPostTransfer>";
        UIElementInfo.UIElementClass = Class'LPGFxUIElementGameMessageTENGPostTransfer';
        myLPHUD.DisplayHUDMessageLayer(14, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_TransferTEngPostEnergy>", -1.0000000, None,,,, UIElementInfo);
    }
    //return;    
}

function ClearThermalPostMessage()
{
    // End:0x2E
    if(IsLocalPlayerController())
    {
        myLPHUD.RemoveMessageLayer(14);
    }
    //return;    
}

function DisplayThermalPostMessage_DoTransfer()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

    // End:0x10B
    if(IsLocalPlayerController())
    {
        UIElementInfo.InputCalloutMarkupString = "<InputCallOuts:GBA_DoThermalPostTransfer>";
        UIElementInfo.UIElementClass = Class'LPGFxUIElementGameMessageTENGPostTransfer';
        myLPHUD.DisplayHUDMessageLayer(14, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_TransferTEngPostEnergy>", -1.0000000, None,,,, UIElementInfo);
    }
    //return;    
}

function StartPrepareThermalPostTransfer()
{
    local /*0x97E50000-0x00000000*/ private @NULL FP;

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    // End:0x82
    if((bIsInVitalSuit || MyPlayerPawn.IsDoingASpecialMove()) || MyPlayerPawn.bUseZiplineVSTransition)
    {
        return;
    }
    // End:0xB7
    if((LastTouchedThermalPost == none) || LastTouchedThermalPost.IsAvailable())
    {
        return;
    }
    // End:0xDF
    if(LastTouchedThermalPost.CurrentBatteryCapacity <= float(0))
    {
        return;
    }
    FP = LPThermalEnergyFannyPack(Pawn.InvManager.FindInventoryType(Class'LPThermalEnergyFannyPack', true));
    // End:0x16A
    if((FP == none) || FP.GetNormalizedCurrentCapacity() >= float(1))
    {
        return;
    }
    ServerStartPrepareThermalPostTransfer(LastTouchedThermalPost);
    //return;    
}

reliable server function ServerStartPrepareThermalPostTransfer()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPost[8388609], FP;

    // End:0x82
    if(((bIsInVitalSuit || MyPlayerPawn.IsDoingASpecialMove()) || MyPlayerPawn.bUseZiplineVSTransition) || int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    // End:0xB7
    if((TPost == none) || TPost.IsAvailable())
    {
        return;
    }
    // End:0xE6
    if(!TPost.IsPawnInRange(Pawn))
    {
        return;
    }
    // End:0x10E
    if(LastTouchedThermalPost.CurrentBatteryCapacity <= float(0))
    {
        return;
    }
    FP = LPThermalEnergyFannyPack(Pawn.InvManager.FindInventoryType(Class'LPThermalEnergyFannyPack', true));
    // End:0x199
    if((FP == none) || FP.GetNormalizedCurrentCapacity() >= float(1))
    {
        return;
    }
    ServerSetThermalPost(TPost);
    TPost.SetPlayerPawn(MyPlayerPawn);
    ClientStartPrepareThermalPostTransfer(TPost);
    //return;    
}

reliable client simulated function ClientStartPrepareThermalPostTransfer()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPost[8388609];

    DoPrepareThermalPostTransfer(TPost);
    //return;    
}

function DoPrepareThermalPostTransfer()
{
    local /*0x97E50000-0x00000000*/ private @NULL TPost[8388609];

    // End:0x22
    if(LastTouchedThermalPost == none)
    {
        LastTouchedThermalPost = TPost;
    }
    TPost = LastTouchedThermalPost;
    SetThermalPost(TPost);
    MPStartState('PrepareThermalPostTransfer');
    DisplayThermalPostMessage_Transfer();
    //return;    
}

function StartDoThermalPostTransfer()
{
    //return;    
}

function EndDoThermalPostTransfer()
{
    //return;    
}

reliable server function ServerStartDoThermalPostTransfer()
{
    //return;    
}

reliable server function ServerEndDoThermalPostTransfer()
{
    //return;    
}

function PlantBomb()
{
    // End:0x37
    if((Pawn == none) || !Pawn.IsAliveAndWell())
    {
        return;
    }
    // End:0x5E
    if(!IsDoingASpecialMove())
    {
        GotoState('PlantBombState');
        ServerPlantBomb();
    }
    //return;    
}

function DisarmBomb()
{
    // End:0x37
    if((Pawn == none) || !Pawn.IsAliveAndWell())
    {
        return;
    }
    // End:0x5E
    if(!IsDoingASpecialMove())
    {
        GotoState('DisarmBombState');
        ServerDisarmBomb();
    }
    //return;    
}

function DisplayBombMessage_Plant()
{
    local /*0x97E50000-0x00000000*/ private @NULL BombActor[8388609];

    myLPHUD.DisplayHUDMessageLayer(6, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_PlantBomb>");
    //return;    
}

function DisplayBombMessage_Disarm()
{
    myLPHUD.DisplayHUDMessageLayer(6, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_DisarmBomb>", -1.0000000, None);
    //return;    
}

function ClearBombMessage()
{
    myLPHUD.RemoveMessageLayer(6);
    //return;    
}

reliable client simulated function ClientClearBombMessage()
{
    ClearBombMessage();
    //return;    
}

reliable client simulated function ClientSetBombActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL BombActor[8388609];

    CurrentBombActor = BombActor;
    // End:0x4C
    if(CurrentBombActor.CanPlantBomb(self))
    {
        DisplayBombMessage_Plant(CurrentBombActor);        
    }
    else
    {
        // End:0x79
        if(CurrentBombActor.CanDisarmBomb(self))
        {
            DisplayBombMessage_Disarm();
        }
    }
    //return;    
}

function SetBombActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL BombActor[8388609];

    CurrentBombActor = BombActor;
    ClientSetBombActor(BombActor);
    //return;    
}

reliable client simulated function ClientClearCurrentBombActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL BombActor[8388609];

    // End:0x2C
    if(CurrentBombActor == BombActor)
    {
        CurrentBombActor = none;
        ClearBombMessage();
    }
    //return;    
}

function ClearCurrentBombActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL BombActor[8388609];

    // End:0x35
    if(CurrentBombActor == BombActor)
    {
        ClientClearCurrentBombActor(BombActor);
        CurrentBombActor = none;
    }
    //return;    
}

reliable server function ServerPlantBomb()
{
    // End:0x11
    if(CurrentBombActor == none)
    {
        return;
    }
    // End:0x48
    if((Pawn == none) || !Pawn.IsAliveAndWell())
    {
        return;
    }
    GotoState('PlantBombState');
    //return;    
}

reliable server function ServerDisarmBomb()
{
    // End:0x11
    if(CurrentBombActor == none)
    {
        return;
    }
    // End:0x48
    if((Pawn == none) || !Pawn.IsAliveAndWell())
    {
        return;
    }
    GotoState('DisarmBombState');
    //return;    
}

function OnBombPlantAnimDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function OnPlantBombAborted()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function AnimNotifyBombPlanted()
{
    //return;    
}

function PlantBombComplete()
{
    //return;    
}

reliable server function ServerAbortPlantBomb()
{
    //return;    
}

function OnBombDisarmAnimDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function OnDisarmBombAborted()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function AnimNotifyBombDisarmed()
{
    //return;    
}

function DisarmBombComplete()
{
    //return;    
}

reliable server function ServerAbortDisarmBomb()
{
    //return;    
}

function MPEnterWalkState()
{
    local /*0x97E50000-0x00000000*/ private bool bForce[9437185];

    false
    // End:0x138
    if((((((((Pawn != none) && !Pawn.bDeleteMe) && !Pawn.bPendingDelete) && !Pawn.IsInState('Dying')) && !Pawn.IsInState('Dead')) && !IsInState('Incapacitated')) && !MyPlayerPawn.bIncapacitated) && !LPPawn(Pawn).bBearTrapped)
    {
        MPStartClientState('PlayerWalking', bForce);
    }
    //return;    
}

simulated function IsIncapacitatedTeammateInProximity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL OPP;
    local /*0x97E50000-0x00000000*/ private float Distance;

    // End:0x110
    foreach Pawn.TouchingActors(Class'LPPlayerPawn', OPP)
    {
        // End:0x10F
        if(OPP.bIncapacitated && int(OPP.GetTeamNum()) == int(GetTeamNum()))
        {
            Distance = MyPlayerPawn.DistanceBetweenCollisionCylinders(OPP);
            // End:0x10F
            if(Distance <= MyPlayerPawn.TuneDataPlayerPawn.ReviveIncapacitatedDistance.GetValue())
            {                
                return true;
            }
        }        
    }    
    return false;
    //return ReturnValue;    
}

delegate IncapacitatedCandidateSortFunc()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609], B;
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float AbsA, AbsB;

    AbsA = Abs(A.Angle);
    AbsB = Abs(B.Angle);
    // End:0x69
    if(AbsA == AbsB)
    {
        return 0;
    }
    // End:0x86
    if(AbsA < AbsB)
    {
        return -1;
    }
    return 1;
    //return ReturnValue;    
}

simulated function FindBestMatchingIncapacitatedTeammateInProximity()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], OPP;
    local /*0x97E50000-0x00000000*/ private float Distance;
    local /*0x97E50000-0x00000000*/ private editfixedsize array Candidates;
    local /*0x97E50000-0x00000000*/ private @NULL C, V;

    // End:0x21A
    foreach Pawn.TouchingActors(Class'LPPlayerPawn', OPP)
    {
        // End:0x219
        if(OPP.bIncapacitated && int(OPP.GetTeamNum()) == int(GetTeamNum()))
        {
            Distance = VSize(Pawn.Location - OPP.Location);
            // End:0x219
            if(Distance <= MyPlayerPawn.TuneDataPlayerPawn.ReviveIncapacitatedDistance.GetValue())
            {
                C.Candidate = OPP;
                C.Distance = Distance;
                V = Normal(Pawn.Location - OPP.Location);
                C.Angle = Vector(MyBasePlayerPawn.GetAimDirection()) Dot V;
                Candidates.AddItem(C);                
            }
        }        
    }    
    // End:0x22D
    if(Candidates.Length == 0)
    {
        return none;
    }
    Candidates.Sort(IncapacitatedCandidateSortFunc);    
    return Candidates[0].Candidate;
    //return ReturnValue;    
}

function DisplayReviveIncapacitatedMessage_Revive()
{
    // End:0x85
    if(IsLocalPlayerController())
    {
        myLPHUD.DisplayHUDMessageLayer(10, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_Revive>", -1.0000000, IsIncapacitatedTeammateInProximity);
    }
    //return;    
}

function ClearReviveIncapacitatedMessage_Revive()
{
    // End:0x2E
    if(IsLocalPlayerController())
    {
        myLPHUD.RemoveMessageLayer(10);
    }
    //return;    
}

function StartReviveIncapacitated()
{
    // End:0x82
    if(((bIsInVitalSuit || MyPlayerPawn.IsDoingASpecialMove()) || MyPlayerPawn.bUseZiplineVSTransition) || int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return;
    }
    // End:0x93
    if(!IsIncapacitatedTeammateInProximity())
    {
        return;
    }
    MyPlayerPawn.IncapacitatedRevivalTarget = FindBestMatchingIncapacitatedTeammateInProximity();
    // End:0xE2
    if(MyPlayerPawn.IncapacitatedRevivalTarget == none)
    {
        return;
    }
    ServerStartReviveIncapacitated(MyPlayerPawn.IncapacitatedRevivalTarget);
    //return;    
}

reliable server function ServerStartReviveIncapacitated()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609];

    // End:0x82
    if(((bIsInVitalSuit || MyPlayerPawn.IsDoingASpecialMove()) || MyPlayerPawn.bUseZiplineVSTransition) || int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return;
    }
    MyPlayerPawn.IncapacitatedRevivalTarget = Target;
    PlayerMoveInfo.bDoReviveIncapacitated = true;
    ClientStartReviveIncapacitated(MyPlayerPawn.IncapacitatedRevivalTarget);
    //return;    
}

reliable client simulated function ClientStartReviveIncapacitated()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609];

    MyPlayerPawn.IncapacitatedRevivalTarget = Target;
    DoStartReviveIncapacitated();
    //return;    
}

function DoStartReviveIncapacitated()
{
    MPStartState('PrepareReviveIncapacitated');
    DisplayReviveIncapacitatedMessage_Revive();
    //return;    
}

function EndDoReviveIncapacitated()
{
    //return;    
}

reliable server function ServerEndDoReviveIncapacitated()
{
    //return;    
}

function OnPlayerPrepareReviveIncapacitatedEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

reliable client simulated function ClientAboutToBeRevived()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentCameraMode;

    CurrentCameraMode = SPPlayerCameraManager(PlayerCamera).GetCameraMode();
    // End:0x7B
    if((CurrentCameraMode == none) || ClassIsChildOf(CurrentCameraMode.Class, Class'SPCamera.SPCameraModeZoomToTarget'))
    {
        ResetCameraMode();
    }
    //return;    
}

function OnAcquireCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609], SlotInfo, CovInfo, LinkVar, ObjVar;

    local /*0x97E50000-0x00000000*/ private editfixedsize array objVars;

    // End:0x30B
    if(Action.bForce || CanTryToRunToCover())
    {
        // End:0xCD
        if(Action.bFindNearest)
        {
            CoverPawn.FindCoverFromLocAndDir(CoverPawn.Location, vect(0.0000000, 0.0000000, 0.0000000), 1.0000000, Action.SearchDistance, false, CovInfo);            
        }
        else
        {
            Action.GetObjectVars(objVars, "CoverNode");
            // End:0x1DB
            foreach objVars(ObjVar)
            {
                LinkVar = CoverLink(ObjVar);
                // End:0x1DA
                if(LinkVar != none)
                {
                    SlotInfo.Link = LinkVar;
                    SlotInfo.SlotIdx = Action.SlotIndex;
                    // End:0x1DA
                    if(CoverPawn.SetCoverInfoFromSlotInfo(CovInfo, SlotInfo))
                    {
                        // [Explicit Continue]
                        goto J0x1DB;
                    }
                }                
            }
            J0x1DB:
            
        }
        // End:0x30B
        if((CovInfo.Link != none) && !CoverPawn.IsInCover() && CoverPawn.CurrentLink == CovInfo.Link)
        {
            // End:0x2AB
            if(Action.bForce)
            {
                MyPlayerPawn.ServerDoSpecialMove(none);
            }
            // End:0x2D9
            if(Action.bLockInCover)
            {
                bLockInCover = true;
            }
            ClientAcquireCover(CovInfo, Action.bNoCameraAutoAlign);
        }
    }
    //return;    
}

function OnSetCoverLock()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x37
    if(MyPlayerPawn != none)
    {
        MyPlayerPawn.OnSetCoverLock(Action);
    }
    //return;    
}

function OnLeaveCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    bLockInCover = false;
    // End:0x3A
    if(!Action.bUnlockOnly)
    {
        ClientBreakFromCover();
    }
    //return;    
}

function MantleUp()
{
    local /*0x97E50000-0x00000000*/ private @NULL CovInfo[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    DoSpecialMove(Class'LPSM_MantleUp', true, false);
    return true;
    //return ReturnValue;    
}

function MantleOver()
{
    local /*0x97E50000-0x00000000*/ private @NULL CovInfo[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int SlotIdx;

    // End:0x4F
    if(CovInfo.LtToRtPct < 0.5000000)
    {
        SlotIdx = CovInfo.LtSlotIdx;        
    }
    else
    {
        SlotIdx = CovInfo.RtSlotIdx;
    }
    // End:0x123
    if((MySPPawn.SprintControl.bSprinting || MySPPawn.SprintControl.bWantsToSprint) && LPCoverLink(CovInfo.Link).bDisableSprintMantle)
    {
        return false;
    }
    // End:0x1E0
    if(!MyPlayerPawn.IsUsingCover())
    {
        MyPlayerPawn.SetCoverInfo(CovInfo.Link, SlotIdx, CovInfo.LtSlotIdx, CovInfo.RtSlotIdx, CovInfo.LtToRtPct, true);
    }
    // End:0x312
    if(CovInfo.Link.Slots[SlotIdx].bIsRailing)
    {
        // End:0x2F8
        if((MySPPawn.SprintControl.bSprinting || MySPPawn.SprintControl.bWantsToSprint) || SPGFCoverLink(CovInfo.Link).bMantleOnly)
        {
            DoSpecialMove(Class'LPSM_SprintMantleOverRailing', true, false);            
        }
        else
        {
            DoSpecialMove(Class'LPSM_MantleOverRailing', true, false);
        }        
    }
    else
    {
        // End:0x3D8
        if((MySPPawn.SprintControl.bSprinting || MySPPawn.SprintControl.bWantsToSprint) || SPGFCoverLink(CovInfo.Link).bMantleOnly)
        {
            DoSpecialMove(Class'LPSM_SprintMantleOver', true, false);            
        }
        else
        {
            DoSpecialMove(Class'LPSM_MantleOver', true, false);
        }
    }
    return true;
    //return ReturnValue;    
}

function UpdateJoystickRemapping()
{
    RemappedJoyRight = PlayerInput.RawJoyRight;
    RemappedJoyUp = PlayerInput.RawJoyUp;
    //return;    
}

function RemapControlsByRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL DeltaRot[8388609];
    local /*0x97E50000-0x00000000*/ private float NewRight[25165825], NewUp;
    local /*0x97E50000-0x00000000*/ private @NULL Controls, NewControls;

    Controls.X = PlayerInput.RawJoyRight;
    Controls.Y = PlayerInput.RawJoyUp;
    // End:0xA5
    if(IsZero(Controls))
    {
        NewRight = 0.0000000;
        NewUp = 0.0000000;
        return;
    }
    DeltaRot.Pitch = 0;
    NewControls = Controls >> DeltaRot;
    NewRight = NewControls.X;
    NewUp = NewControls.Y;
    //return;    
}

function LeftLedgeTimerExpired()
{
    bLeftLedgeTimerExpired = true;
    //return;    
}

function AcquireCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL CovInfo[8388609];
    local /*0x97E50000-0x00000000*/ private bool bNoCameraAutoAlign[9437185];

    // End:0x59
    if(LPLedgeWalkLink(CovInfo.Link) != none)
    {
        // End:0x4B
        if(GetStateName() == 'PlayerGrappling')
        {
            GotoState('None');
        }
        GotoState('PutWeaponAwayBeforeEnteringLedge');
    }
    super.AcquireCover(CovInfo, bNoCameraAutoAlign);
    //return;    
}

function OnGiveWeaponUpgrade()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x8B
    if((Pawn != none) && int(WorldInfo.NetMode) != int(NM_Client))
    {
        // End:0x8B
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            GiveWeaponUpgrade(Action.UpgradeTuneDataMP);
        }
    }
    //return;    
}

function GiveWeaponUpgrade()
{
    local /*0x97E50000-0x00000000*/ private @NULL WeaponUpgrade[8388609], SPIW;

    // End:0x120
    if((Pawn != none) && int(WorldInfo.NetMode) != int(NM_Client))
    {
        // End:0x11F
        foreach Pawn.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', SPIW)
        {
            // End:0x11E
            if((SPIW.TuneDataBaseWeapon != none) && SPIW.TuneDataBaseWeapon.SupportedUpgrades.Find(WeaponUpgrade) != )
            {                
                SPIW.GiveUpgrade(WeaponUpgrade);
                // End:0x11F
                break;
            }            
        }        
    }
    //return;    
}

function OnGiveAmmoType()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609], AmmoTD;

    // End:0xC5
    if((Pawn != none) && int(WorldInfo.NetMode) != int(NM_Client))
    {
        AmmoTD = ((int(WorldInfo.NetMode) == int(NM_Standalone)) ? Action.AmmoTypeTuneData : Action.AmmoTypeTuneDataMP);
        GiveAmmoType(string(AmmoTD));
    }
    //return;    
}

function GiveAmmoType()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string AmmoTDString[8388609];
    local /*0x97E50000-0x00000000*/ private int AmmoInMagazine[9437185], AmmoInPool;
    local /*0x97E50000-0x00000000*/ private byte StorageLocation[9437185];
    local /*0x97E50000-0x00000000*/ private bool bRefillMagazineFromPool[9437185], bForceInfiniteVSSupply;
    local /*0x97E50000-0x00000000*/ private @NULL SPIW, AmmoTD, PP;
    local /*0x97E50000-0x00000000*/ private int AmmoAdded;

    -1
    -1
    0        
    PP = MyPlayerPawn;
    // End:0x58
    if(PP == none)
    {
        PP = LPPlayerPawn(HumanPlayerPawn);
    }
    // End:0x2D2
    if((PP != none) && int(WorldInfo.NetMode) != int(NM_Client))
    {
        // End:0x250
        if((int(StorageLocation) == int(0)) || int(StorageLocation) == int(2))
        {
            // End:0x24F
            foreach PP.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', SPIW)
            {
                // End:0x24E
                if(SPIW.TuneDataBaseWeapon != none)
                {
                    AmmoTD = SPIW.TuneDataBaseWeapon.GetSupportedAmmoTypeFromString(AmmoTDString);
                    // End:0x24E
                    if(AmmoTD != none)
                    {
                        AmmoAdded = SPIW.GiveAmmoType(AmmoTD, AmmoInMagazine, AmmoInPool,, bRefillMagazineFromPool);
                        // End:0x24B
                        if(LPWeaponGrenade(SPIW) != none)
                        {
                            PP.ShowGrenades(SPIW.AmmoLeftForWeapon, class<LPWeaponGrenade>(SPIW.Class));
                        }
                        // End:0x24F
                        break;
                    }
                }                
            }            
        }
        // End:0x2D2
        if((int(StorageLocation) == int(1)) || int(StorageLocation) == int(2))
        {
            // End:0x29D
            if(AmmoInPool > 0)
            {
                AmmoInPool -= AmmoAdded;
            }
            AddAmmoToMunitionsLocker(AmmoTDString, Max(0, AmmoInPool), ((bForceInfiniteVSSupply) ? 1 : 0));            
        }
    }
    //return;    
}

simulated function OnSetUnlockStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x83
    if(inAction.InputLinks[0].bHasImpulse)
    {
        SetUnlockStatus(inAction.UnlockName, true, inAction.bSaveAfterUnlock);        
    }
    else
    {
        // End:0x103
        if(inAction.InputLinks[1].bHasImpulse)
        {
            SetUnlockStatus(inAction.UnlockName, false, inAction.bSaveAfterUnlock);
        }
    }
    //return;    
}

function OnMinimalPauseMenu()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bMinimalPauseMenu = true;        
    }
    else
    {
        // End:0x89
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bMinimalPauseMenu = false;
        }
    }
    //return;    
}

function OnMakeCreditsSkippable()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bCreditsSkippable = true;        
    }
    else
    {
        // End:0x89
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bCreditsSkippable = false;
        }
    }
    //return;    
}

function OnGiveAmmo()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609], AmmoAction, SPIW;

    AmmoAction = LPSeqAct_GiveAmmo(Action);
    // End:0x123
    if((Pawn != none) && int(WorldInfo.NetMode) != int(NM_Client))
    {
        // End:0x122
        foreach Pawn.InvManager.InventoryActors(Class'SPInventory.SPInventoryWeapon', SPIW)
        {
            // End:0x121
            if(ClassIsChildOf(SPIW.Class, AmmoAction.WeaponToGiveAmmoTo))
            {
                SPIW.AddAmmo(AmmoAction.AmountOfAmmoToGive);
                // End:0x122
                break;
            }            
        }        
    }
    //return;    
}

function OnReturnWeaponsToVSStorage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    ServerSetWeaponLoadout("", "", "");
    //return;    
}

simulated function OnSetVSGroundSpeed()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    TrySetVSGroundSpeed(LPBaseVSPlayerPawn(Pawn), inAction.GroundSpeed);
    //return;    
}

simulated function TrySetVSGroundSpeed()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVS[8388609];
    local /*0x97E50000-0x00000000*/ private int NewGroundSpeed[8388609];

    OverriddenVSSpeed = NewGroundSpeed;
    // End:0xC6
    if(InVS != none)
    {
        // End:0x5E
        if(OverriddenVSSpeed > 0)
        {
            InVS.GroundSpeed = float(OverriddenVSSpeed);            
        }
        else
        {
            InVS.GroundSpeed = InVS.TuneDataBasePawn.GroundSpeed_Tunable.GetValue();
        }
    }
    //return;    
}

function HandlePickup()
{
    local /*0x97E50000-0x00000000*/ private @NULL Inv[8388609], TE;
    local /*0x97E50000-0x00000000*/ private float ExchangeRate;

    // End:0x0F
    if(bIsInVitalSuit)
    {
        return;
    }
    TE = LPThermalEnergy(Inv);
    // End:0xEF
    if(TE != none)
    {
        // End:0xEC
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            // End:0xEC
            if(MyBasePlayerPawn != none)
            {
                ExchangeRate = MyBasePlayerPawn.TuneDataBasePlayerPawn.MP_TEnergyPointExchangeRate;
                ExchangeRate *= TE.GetEnergyDelta();
                AccumulateTEnergyPickupForScore(ExchangeRate);
            }
        }        
    }
    else
    {
        // End:0x131
        if(LPWeapon(Inv) != none)
        {
            ClientAddAmmoMessage(Inv.Class, 0);
        }
    }
    //return;    
}

function AccumulateTEnergyPickupForScore()
{
    local /*0x97E50000-0x00000000*/ private float EnergyAmount[8388609], Integral;
    local /*0x97E50000-0x00000000*/ private bool bCheck;

    // End:0x1EC
    if(int(Role) >= int(ROLE_Authority))
    {
        // End:0x1EC
        if(EnergyAmount > float(0))
        {
            TEngPickupAccumulator += EnergyAmount;
            // End:0x1EC
            if((TEngPickupAccumulator + 0.0001000) >= float(1))
            {
                TEngPickupAccumulator += 0.0001000;
                Integral = float(FFloor(TEngPickupAccumulator));
                TEngPickupAccumulator -= Integral;
                // End:0x1EC
                if(PlayerReplicationInfo != none)
                {
                    // End:0x12D
                    if(LPGameMP_Base(WorldInfo.Game).bThermalPickupsAccumulateTeamScore)
                    {
                        PlayerReplicationInfo.Team.Score += Integral;
                        bCheck = true;
                    }
                    // End:0x1A2
                    if(LPGameMP_Base(WorldInfo.Game).bThermalPickupsAccumulateScore)
                    {
                        PlayerReplicationInfo.Score += Integral;
                        bCheck = true;
                    }
                    // End:0x1EC
                    if(bCheck)
                    {
                        WorldInfo.Game.CheckScore(PlayerReplicationInfo);
                    }
                }
            }
        }
    }
    //return;    
}

simulated function OnToggleEquipmentVisibility()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShow;

    // End:0x11
    if(MyPlayerPawn == none)
    {
        return;
    }
    // End:0xA0
    if(Action.InputLinks[2].bHasImpulse)
    {
        bShow = MyPlayerPawn.Weapon.Mesh.HiddenGame;        
    }
    else
    {
        bShow = Action.InputLinks[0].bHasImpulse;
    }
    MyPlayerPawn.ToggleEquipmentVisibility(bShow, Action.bStowedOnly);
    //return;    
}

function On_LPSM_PlayerExitVS_Done()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x10E
    if(int(MyPlayerPawn.ExitStyle) == int(2))
    {
        MPStartState('PlayerZipline');
        Pawn.Mesh.RootMotionMode = Pawn.default.Mesh.RootMotionMode;
        Pawn.Mesh.RootMotionRotationMode = Pawn.default.Mesh.RootMotionRotationMode;        
    }
    else
    {
        PutAllLpAiControllersOnHold(false);
        EnterWalkState();
        // End:0x166
        if(LPPawn(Pawn) != none)
        {
            LPPawn(Pawn).bNotValidForAiWhileHidenRightNow = true;
        }
    }
    //return;    
}

function WinchBoneDetach()
{
    //return;    
}

exec function ActivatePerk()
{
    local /*0x97E50000-0x00000000*/ private int PerkNum[8388609];

    // End:0x6D
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        // End:0x6D
        if(!LPPRI(PlayerReplicationInfo).PerksManager.AnyPerksAssigned())
        {
            return;
        }
    }
    // End:0x7C
    if(IsUsingScope())
    {
        return;
    }
    // End:0x8B
    if(bIsInVitalSuit)
    {
        return;
    }
    // End:0x18A
    if(myLPHUD != none)
    {
        // End:0x105
        if(myLPHUD.IsDPADClusterVisible())
        {
            LPPRI(PlayerReplicationInfo).PerksManager.ActivatePerk(PerkNum);            
        }
        else
        {
            // End:0x18A
            if((Pawn != none) && Pawn.IsAliveAndWell())
            {
                // End:0x169
                if(bAlwaysDisplayDPAD)
                {
                    myLPHUD.ShowDPadCluster(true, false);                    
                }
                else
                {
                    myLPHUD.ShowDPadCluster(true);
                }
            }
        }
    }
    //return;    
}

function IsStandingOnSnowCat()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x37
    if((Pawn == none) || Pawn.Base == none)
    {
        return false;
    }
    // End:0x66
    if(LPInterpActor_PlayerTransport(Pawn.Base) != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CanDeployPerk()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(IsStandingOnSnowCat())
    {
        return false;
    }
    return (DoesPlayerCSAAllowWeapons()) && !IsDoingASpecialMove();
    //return ReturnValue;    
}

exec function AssignPerk()
{
    local /*0x97E50000-0x00000000*/ private int DPadSlotIdx[8388609];
    local /*0x97E50000-0x00000000*/ private name PerkName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Perks;

    Perks = LPPRI(PlayerReplicationInfo).PerksManager;
    // End:0x98
    if(Perks != none)
    {
        // End:0x98
        if((DPadSlotIdx > -1) && DPadSlotIdx < 4)
        {
            Perks.AssignPerk(DPadSlotIdx, PerkName);
        }
    }
    ForceDPadClusterUpdate();
    //return;    
}

function RefreshLoadoutUI()
{
    // End:0x2E
    if(myLPHUD != none)
    {
        myLPHUD.RefreshLoadoutUI();
    }
    //return;    
}

function ForceDPadClusterUpdate()
{
    // End:0x7D
    if(myLPHUD != none)
    {
        myLPHUD.ForceDPadClusterUpdate();
        myLPHUD.ShowDPadCluster(false, false);
        // End:0x7D
        if(bAlwaysDisplayDPAD)
        {
            myLPHUD.ShowDPadCluster(true, false);
        }
    }
    //return;    
}

function UseActivePerk()
{
    local /*0x97E50000-0x00000000*/ private @NULL Perks;
    local /*0x97E50000-0x00000000*/ private byte PerkEnum;

    // End:0x11
    if(!DoesPlayerCSAAllowWeapons())
    {
        return;
    }
    // End:0x48
    if((Pawn == none) || !Pawn.IsAliveAndWell())
    {
        return;
    }
    Perks = LPPRI(PlayerReplicationInfo).PerksManager;
    // End:0x281
    if(((Perks != none) && Perks.IsDeploymentModeActive()) && Perks.GetValidationResults())
    {
        PerkEnum = Perks.GetActiveDeploymentModePerk().PerkIndex;
        Perks.DeploymentRotation = MyBasePlayerPawn.GetAimDirection();
        Perks.DeploymentRotation.Pitch = 0;
        Perks.DeploymentRotation.Roll = 0;
        // End:0x26B
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            ServerUseActivePerk(PerkEnum, Perks.GetActiveDeploymentModeDPadIndex(), Perks.bCurrentDeploymentPerkIsCloned, Perks.DeploymentLocation, Perks.DeploymentRotation);            
        }
        else
        {
            GotoState('DeployManualPerk', 'None', false);
        }
    }
    //return;    
}

reliable server function ServerUseActivePerk()
{
    local /*0x97E50000-0x00000000*/ private byte PerkEnum[8388609];
    local /*0x97E50000-0x00000000*/ private int iDPADIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsThief[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PerkDeployLocation[8388609], PerkDeployDirection, Perks;

    Perks = LPPRI(PlayerReplicationInfo).PerksManager;
    // End:0x68
    if((Pawn == none) || !Pawn.IsAliveAndWell())
    {
        return;
    }
    // End:0x136
    if(Perks != none)
    {
        Perks.DeploymentLocation = PerkDeployLocation;
        Perks.DeploymentRotation = PerkDeployDirection;
        Perks.bCurrentDeploymentPerkIsCloned = bIsThief;
        Perks.SetActiveDeploymentModePerk(PerkEnum, iDPADIndex);
        MPStartClientState('DeployManualPerk', false);
    }
    //return;    
}

function MPIncrementPerkCount()
{
    local /*0x97E50000-0x00000000*/ private byte PerkEnum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bStatsOnly[9437185];

    IncrementPerkCount(PerkEnum, bStatsOnly);
    // End:0x4A
    if(!IsLocalPlayerController())
    {
        ClientIncrementPerkCount(PerkEnum, bStatsOnly);
    }
    //return;    
}

reliable client simulated function ClientIncrementPerkCount()
{
    local /*0x97E50000-0x00000000*/ private byte PerkEnum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bStatsOnly[9437185];

    IncrementPerkCount(PerkEnum);
    //return;    
}

function IncrementPerkCount()
{
    local /*0x97E50000-0x00000000*/ private byte PerkEnum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bStatsOnly[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL Perks, PD;

    // End:0xE1
    if(!bStatsOnly)
    {
        Perks = LPPRI(PlayerReplicationInfo).PerksManager;
        // End:0xE1
        if((Perks != none) && !Perks.bCurrentDeploymentPerkIsCloned)
        {
            PD = LPPerkDeployable(Perks.PerkList[int(PerkEnum)]);
            // End:0xE1
            if(PD != none)
            {
                PD.IncrementActiveCount();
            }
        }
    }
    IncrementStat('Stat_TotemsDeployed');
    // End:0x11B
    if(int(PerkEnum) == int(7))
    {
        IncrementStat('Stat_ShieldsDeployed');
    }
    //return;    
}

function MPNotifyPerkDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL DeployedPerk[8388609];
    local /*0x97E50000-0x00000000*/ private byte PerkEnum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIgnoreCount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PD;

    // End:0xE8
    if(!bIgnoreCount)
    {
        NotifyPerkDestroyed(PerkEnum, bIgnoreCount);
        // End:0x58
        if(!IsLocalPlayerController())
        {
            ClientNotifyPerkDestroyed(PerkEnum, bIgnoreCount);
        }
        PD = LPPerkDeployable(LPPRI(PlayerReplicationInfo).PerksManager.QueryPerkInstance(PerkEnum));
        // End:0xE8
        if(PD != none)
        {
            PD.RemoveDeployedPerk(DeployedPerk);
        }
    }
    //return;    
}

reliable client simulated function ClientNotifyPerkDestroyed()
{
    local /*0x97E50000-0x00000000*/ private byte PerkEnum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIgnoreCount[8388609];

    NotifyPerkDestroyed(PerkEnum, bIgnoreCount);
    //return;    
}

function NotifyPerkDestroyed()
{
    local /*0x97E50000-0x00000000*/ private byte PerkEnum[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIgnoreCount[8388609];

    LPPRI(PlayerReplicationInfo).PerksManager.NotifyPerkDestroyed(PerkEnum, bIgnoreCount);
    //return;    
}

function OperateActivePerk()
{
    //return;    
}

reliable server function ServerOperateActivePerk()
{
    //return;    
}

function DeployAnimationDeployNotify()
{
    //return;    
}

simulated function DeployAnimationCompleted()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

exec function SetAimAssist()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    LPPlayerInput(PlayerInput).bAimAssistDisabled = !bOn;
    //return;    
}

function IsUsingFloatingAim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2C
    if(ProfileSettings.GetFloatingAimRegionScale() > float(0))
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function UpdateDynamicFloatingAimInputScale()
{
    local /*0x97E50000-0x00000000*/ private @NULL AimController;

    AimController = GetAimController();
    // End:0x67
    if(AimController != none)
    {
        // End:0x67
        if(ThirdPersonAimCamParams != none)
        {
            // End:0x67
            if(IsUsingFloatingAim())
            {
                SPGFAimControlPlayerControlled(AimController).ResetDynamicFloatingAimInputScale();
            }
        }
    }
    //return;    
}

simulated function OnPlayMailMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPlayed;

    bPlayed = PlayMailMessage(LPQO_ObjectiveMailMessage(inAction.QuestObject.GetQuestObject()));
    inAction.ActivateOutputLink(((bPlayed == true) ? 0 : 1));
    //return;    
}

simulated function PlayMailMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL MailMessage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AudioMsg, VideoMsg;
    local /*0x97E50000-0x00000000*/ private bool bPlayed;

    bPlayed = false;
    // End:0x162
    if(MailMessage != none)
    {
        // End:0x162
        if(int(MailMessage.GetQuestStatus()) != int(1))
        {
            AudioMsg = LPMailMessageDataAudio(MailMessage.Message);
            // End:0xD5
            if(AudioMsg != none)
            {
                // End:0xD2
                if(AudioMsg.CanPlayMessage())
                {
                    AudioMsg.Play();
                    bPlayed = true;
                }                
            }
            else
            {
                VideoMsg = LPMailMessageDataVideo(MailMessage.Message);
                // End:0x162
                if(VideoMsg != none)
                {
                    // End:0x162
                    if(VideoMsg.CanPlayMessage())
                    {
                        VideoMsg.Play();
                        bPlayed = true;
                    }
                }
            }
        }
    }
    return bPlayed;
    //return ReturnValue;    
}

function AbortMailMessagePlayback()
{
    // End:0x39
    if(CurrentMailMessage != none)
    {
        CurrentMailMessage.Stop();
        CurrentMailMessage = none;
    }
    //return;    
}

function PauseMailMessagePlayback()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x5D
    if(CurrentMailMessage != none)
    {
        // End:0x3E
        if(bPause)
        {
            CurrentMailMessage.Pause();            
        }
        else
        {
            CurrentMailMessage.Resume();
        }
    }
    //return;    
}

function OnWristPDA()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string stateString, speedString;

    // End:0x12F
    if(Action.InputLinks[0].bHasImpulse)
    {
        switch(Action.State)
        {
            // End:0x7B
            case 0:
                stateString = "incoming";
                // End:0x9A
                break;
            // End:0x97
            case 1:
                stateString = "playback";
                // End:0x9A
                break;
            // End:0xFFFF
            default:
                break;
        }
        switch(Action.Speed)
        {
            // End:0xDA
            case 0:
                speedString = "slow";
                // End:0x10F
                break;
            // End:0xF4
            case 1:
                speedString = "medium";
                // End:0x10F
                break;
            // End:0x10C
            case 2:
                speedString = "fast";
                // End:0x10F
                break;
            // End:0xFFFF
            default:
                break;
        }
        ShowWristPDA(true, stateString, speedString);        
    }
    else
    {
        // End:0x175
        if(Action.InputLinks[1].bHasImpulse)
        {
            ShowWristPDA(false, "", "");
        }
    }
    //return;    
}

exec function ShowWristPDA()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string State[8388609], Speed;

    // End:0x4D
    if(MyPlayerPawn != none)
    {
        MyPlayerPawn.ShowWristPDA(bShow, State, Speed);        
    }
    else
    {
        // End:0xA0
        if(HumanPlayerPawn != none)
        {
            LPPlayerPawn(HumanPlayerPawn).ShowWristPDA(bShow, State, Speed);
        }
    }
    //return;    
}

reliable client simulated event NotifyDialogueManagerParticipant()
{
    AbortMailMessagePlayback();
    super(SPPlayerController).NotifyDialogueManagerParticipant();
    //return;    
}

event ScriptedModifyPostProcessSettings()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PPSettings[25165825];

    // End:0x2B
    if(SubscribedPostProcessCB != none)
    {
        PostProcessCB(PPSettings);
    }
    //return;    
}

function CanJetPack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x44
    if(IsInState('PlayerWalking') || IsInState('PlayerFalling'))
    {
        // End:0x44
        if(!bIsInVitalSuit && !IsDoingASpecialMove())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function EndState_AcidStreamed()
{
    //return;    
}

function InitEnhancedRepair()
{
    local /*0x97E50000-0x00000000*/ private @NULL RP;

    // End:0xBC
    if(LPPRI(PlayerReplicationInfo) != none)
    {
        RP = LPPerkRepair(LPPRI(PlayerReplicationInfo).PerksManager.QueryPerkInstance(1));
        // End:0xBC
        if(RP != none)
        {
            SetTimer(RP.RepairTuneData.HealthBarCheckUpdateRate, true, 'UpdateEnhancedRepair');
            return;
        }
    }
    SetTimer(1.0000000, false, 'InitEnhancedRepair');
    //return;    
}

function @NULL UpdateEnhancedRepair()
{
    local /*0x97E50000-0x00000000*/ private @NULL RP, RepairComp;

    // End:0x11
    if(myLPHUD == none)
    {
        return;
    }
    myLPHUD.RemoveEnhancedRepairBar();
    // End:0xF7
    if(MyPlayerPawn != none)
    {
        RP = LPPerkRepair(MyPlayerPawn.GetEnabledPerk(1));
        // End:0xF7
        if(RP != none)
        {
            RepairComp = MyPlayerPawn.FindNearestVisibleRepairComponent();
            // End:0xF7
            if(RepairComp != none)
            {
                myLPHUD.CreateEnhancedRepairBar(RepairComp.Owner);
            }
        }
    }
    //return;    
}

function InitSixthSense()
{
    local /*0x97E50000-0x00000000*/ private @NULL SS;

    // End:0x10D
    if(LPPRI(PlayerReplicationInfo) != none)
    {
        SS = LPPerkSixthSense(LPPRI(PlayerReplicationInfo).PerksManager.QueryPerkInstance(11));
        // End:0x10D
        if(SS != none)
        {
            // End:0xCA
            if(IsLocalPlayerController())
            {
                SetTimer(SS.SenseTuneData.UpdateRate, true, 'UpdateSixthSense');                
            }
            else
            {
                SetTimer(SS.SenseTuneData.UpdateRate, true, 'UpdateSixthSenseTags');
            }
            return;
        }
    }
    SetTimer(1.0000000, false, 'InitSixthSense');
    //return;    
}

function UpdateSixthSense()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyGRI, SS, LPPP, TagCandidate, ThreatCandidate;

    local /*0x97E50000-0x00000000*/ private bool bLookForTagCandidate, bIsPawnADS, bIsSelfADS, bIsSelfIncapacitated;
    local /*0x97E50000-0x00000000*/ private float distToTarget, distOffset, threatDist, AngleInDegrees, aimAngleSq, detectAngleSq,
	    tagAngleSq, maxTagAngleSq, meleeRequiredDot;

    local /*0x97E50000-0x00000000*/ private @NULL rotPawnAim, rotSelfAim, rotDeltaAim, rotDeltaAimDeg, rotFromTarget, rotHipBone,
	    RotOffset, rotCamera, locCamera, vecRotHipBone;

    UpdateSixthSenseTags();
    // End:0x1B
    if(Pawn == none)
    {
        return;
    }
    SS = LPPerkSixthSense(LPPRI(PlayerReplicationInfo).PerksManager.QueryPerkClass(11));
    // End:0xE85
    if(SS != none)
    {
        RotOffset = rot(500, 700, 0);
        distOffset = 1000.0000000;
        bIsSelfIncapacitated = (MyPlayerPawn != none) && MyPlayerPawn.bIncapacitated;
        // End:0xB90
        if(!bIsSelfIncapacitated)
        {
            bIsSelfADS = IsAimingDownSight();
            bLookForTagCandidate = bIsSelfADS;
            // End:0x204
            if(bIsSelfADS)
            {
                rotSelfAim = Pawn.Rotation + MyPlayerPawn.AimNodeInfo.AdjustedLocalAim;
                maxTagAngleSq = SS.SenseTuneData.TagAngle * SS.SenseTuneData.TagAngle;
                tagAngleSq = maxTagAngleSq;
            }
            detectAngleSq = SS.SenseTuneData.DetectAngle * SS.SenseTuneData.DetectAngle;
            threatDist = 100000.0000000;
            // End:0x397
            if(!bIsInVitalSuit)
            {
                meleeRequiredDot = Cos(SS.SenseTuneData.TakedownWarningAngle * 0.0174533);
                rotHipBone = MatrixGetRotator(Pawn.Mesh.GetBoneMatrix(Pawn.Mesh.MatchRefBone('JO_hip')));
                rotHipBone.Yaw += 16384;
                vecRotHipBone = Vector(rotHipBone);
            }
            MyGRI = LPGRI(WorldInfo.GRI);
            // End:0xB8F
            foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPPP)
            {
                // End:0xB8E
                if((LPPP != Pawn) && !LPPP.bIncapacitated)
                {
                    // End:0xB8E
                    if(MyGRI.IsPlayerEnemy(Pawn, LPPP))
                    {
                        distToTarget = VSize(Pawn.Location - LPPP.Location);
                        rotFromTarget = Rotator(Pawn.Location - LPPP.Location);
                        // End:0x94F
                        if(distToTarget < threatDist)
                        {
                            // End:0x644
                            if(!bIsInVitalSuit && distToTarget < SS.SenseTuneData.TakedownWarningRange)
                            {
                                // End:0x644
                                if((Vector(rotFromTarget) Dot vecRotHipBone) >= meleeRequiredDot)
                                {
                                    // End:0x644
                                    if(SS.SenseTuneData.bDetectOnCamera || !IsPawnOnCamera(LPPP))
                                    {
                                        // End:0x644
                                        if(Pawn.FastTrace(LPPP.Location))
                                        {
                                            ThreatCandidate = LPPP;
                                            threatDist = distToTarget;
                                        }
                                    }
                                }
                            }
                            // End:0x94F
                            if(ThreatCandidate != LPPP)
                            {
                                bIsPawnADS = int(LPPP.AimNodeInfo.AimState) == int(4);
                                // End:0x94F
                                if(bIsPawnADS || SS.SenseTuneData.bDetectNonADS)
                                {
                                    rotPawnAim = LPPP.Rotation + LPPP.AimNodeInfo.AdjustedLocalAim;
                                    // End:0x78A
                                    if(rotPawnAim.Yaw > 32768)
                                    {
                                        rotPawnAim.Yaw -= 65536;
                                    }
                                    rotDeltaAim = ((rotPawnAim - rotFromTarget) * (distToTarget / distOffset)) + ((bIsPawnADS) ? RotOffset : rot(0, 0, 0));
                                    rotDeltaAimDeg = rotDeltaAim * 0.0054932;
                                    aimAngleSq = float((rotDeltaAimDeg.Yaw * rotDeltaAimDeg.Yaw) + (rotDeltaAimDeg.Pitch * rotDeltaAimDeg.Pitch));
                                    // End:0x94F
                                    if(aimAngleSq < detectAngleSq)
                                    {
                                        // End:0x94F
                                        if(SS.SenseTuneData.bDetectOnCamera || !IsPawnOnCamera(LPPP))
                                        {
                                            // End:0x94F
                                            if(Pawn.FastTrace(LPPP.Location))
                                            {
                                                ThreatCandidate = LPPP;
                                                threatDist = distToTarget;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        // End:0xB8E
                        if(bLookForTagCandidate)
                        {
                            rotFromTarget = Rotator(LPPP.Location - Pawn.Location);
                            rotDeltaAim = ((rotSelfAim - rotFromTarget) * (distToTarget / distOffset)) + RotOffset;
                            rotDeltaAimDeg = rotDeltaAim * 0.0054932;
                            aimAngleSq = float((rotDeltaAimDeg.Yaw * rotDeltaAimDeg.Yaw) + (rotDeltaAimDeg.Pitch * rotDeltaAimDeg.Pitch));
                            // End:0xB8E
                            if(aimAngleSq < maxTagAngleSq)
                            {
                                // End:0xB8E
                                if(SS.SenseTuneData.bRetaggingAllowed || !IsSixthSenseTagged(LPPP))
                                {
                                    // End:0xB8E
                                    if(IsPawnOnCamera(LPPP))
                                    {
                                        // End:0xB51
                                        if(LPPP == SS.TagCandidate)
                                        {
                                            TagCandidate = LPPP;
                                            bLookForTagCandidate = false;
                                            // End:0xB8E
                                            continue;
                                        }
                                        // End:0xB8E
                                        if(aimAngleSq < tagAngleSq)
                                        {
                                            TagCandidate = LPPP;
                                            tagAngleSq = aimAngleSq;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }                
            }            
        }
        // End:0xD3F
        if((TagCandidate != none) && TagCandidate == SS.TagCandidate)
        {
            SS.TagTimer += SS.SenseTuneData.UpdateRate;
            // End:0xD3C
            if(SS.TagTimer >= SS.SenseTuneData.TagAcquisitionTime.GetValue(self))
            {
                ServerSixthSenseTag(TagCandidate, SS.SenseTuneData.TagDuration.GetValue(self));
                SS.TagCandidate = none;
                SS.TagTimer = 0.0000000;
                ServerBroadcastChatter(3);
            }            
        }
        else
        {
            SS.TagCandidate = TagCandidate;
            SS.TagTimer = 0.0000000;
        }
        // End:0xE85
        if(ThreatCandidate != none)
        {
            GetPlayerViewPoint(locCamera, rotCamera);
            AngleInDegrees = float(Rotator(ThreatCandidate.Location - Pawn.Location).Yaw - rotCamera.Yaw) * 0.0054932;
            // End:0xE5D
            if(AngleInDegrees < float(0))
            {
                AngleInDegrees += float(360);
            }
            myLPHUD.SetSixthSenseWarning(AngleInDegrees);
        }
    }
    //return;    
}

reliable server function ServerSixthSenseTag()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609];
    local /*0x97E50000-0x00000000*/ private float TagDuration[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x111
    foreach WorldInfo.AllControllers(Class'LPPlayerController', LPPC)
    {
        // End:0x110
        if(LPGRI(WorldInfo.GRI).IsPlayerEnemy(LPPC.Pawn, Target))
        {
            LPPC.InternalSixthSenseTag(Target, Pawn, TagDuration);
            LPPC.ClientSixthSenseTag(Target, Pawn, TagDuration);
        }        
    }    
    //return;    
}

reliable client simulated function ClientSixthSenseTag()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], Tagger;
    local /*0x97E50000-0x00000000*/ private float TagDuration[8388609];

    InternalSixthSenseTag(Target, Tagger, TagDuration);
    //return;    
}

function InternalSixthSenseTag()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], Tagger;
    local /*0x97E50000-0x00000000*/ private float TagDuration[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SS;

    SS = LPPerkSixthSense(LPPRI(PlayerReplicationInfo).PerksManager.QueryPerkInstance(11));
    // End:0x9B
    if(SS != none)
    {
        SS.AddTag(Target, Tagger, TagDuration);
    }
    //return;    
}

// Export ULPPlayerController::execUpdateSixthSenseTags(FFrame&, void* const)
native function UpdateSixthSenseTags();

// Export ULPPlayerController::execIsSixthSenseTagged(FFrame&, void* const)
native function IsSixthSenseTagged()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function IsPawnOnCamera()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (P != none) && P.Mesh.bRecentlyRendered;
    //return ReturnValue;    
}

simulated function DisplayDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x97E50000-0x00000000*/ private float out_YL[25165825], out_YPos;

    super.DisplayDebug(HUD, out_YL, out_YPos);
    //return;    
}

function DisplayGeneralPlayerInteractionObjectPrompt()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDrawHoldIcon[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

    // End:0x13F
    if((IsLocalPlayerController()) && !myLPHUD.IsMessageLayerActive(13))
    {
        // End:0x10B
        if(bDrawHoldIcon)
        {
            UIElementInfo.InputCalloutMarkupString = "<InputCallOuts:GBA_DoGeneralInteractionOperation>";
            UIElementInfo.UIElementClass = Class'LPGFxUIElementGameMessageGeneralInteractionObjectPrompt';
            myLPHUD.DisplayHUDMessageLayer(13, Message, -1.0000000, None,,,, UIElementInfo);            
        }
        else
        {
            myLPHUD.DisplayHUDMessageLayer(13, Message);
        }
    }
    //return;    
}

function ClearGeneralPlayerInteractionObjectPrompt()
{
    // End:0x2E
    if(IsLocalPlayerController())
    {
        myLPHUD.RemoveMessageLayer(13);
    }
    //return;    
}

reliable client simulated function ClientClearGeneralPlayerInteractionObjectPrompt()
{
    // End:0x17
    if(IsLocalController())
    {
        ClearGeneralPlayerInteractionObjectPrompt();
    }
    //return;    
}

function StartGeneralInteractionOperation()
{
    // End:0x57
    if((bIsInVitalSuit || MyPlayerPawn.IsDoingASpecialMove()) || MyPlayerPawn.bUseZiplineVSTransition)
    {
        return;
    }
    // End:0x68
    if(LastTouchedGeneralInteractionObject == none)
    {
        return;
    }
    // End:0x97
    if(!LastTouchedGeneralInteractionObject.CanBeOperatedBy(MyBasePlayerPawn))
    {
        return;
    }
    ServerStartGeneralInteractionOperation(LastTouchedGeneralInteractionObject);
    //return;    
}

reliable server function ServerStartGeneralInteractionOperation()
{
    local /*0x97E50000-0x00000000*/ private @NULL targetObject[8388609];

    // End:0x57
    if((bIsInVitalSuit || MyPlayerPawn.IsDoingASpecialMove()) || MyPlayerPawn.bUseZiplineVSTransition)
    {
        return;
    }
    // End:0x8F
    if(!LastTouchedGeneralInteractionObject.CanBeOperatedBy(LPBasePlayerPawn(Pawn)))
    {
        return;
    }
    PlayerMoveInfo.bDoGeneralInteractionOperation = true;
    ClientStartGeneralInteractionOperation(LastTouchedGeneralInteractionObject);
    //return;    
}

reliable client simulated function ClientStartGeneralInteractionOperation()
{
    local /*0x97E50000-0x00000000*/ private @NULL targetObject[8388609];

    LastTouchedGeneralInteractionObject = targetObject;
    DoStartGeneralInteractionOperation(targetObject);
    //return;    
}

function DoStartGeneralInteractionOperation()
{
    local /*0x97E50000-0x00000000*/ private @NULL targetObject[8388609];

    MPStartState('InteractingWithGeneralInteractionObject');
    // End:0x81
    if(!LastTouchedGeneralInteractionObject.IsInteractive())
    {
        DisplayGeneralPlayerInteractionObjectPrompt(LastTouchedGeneralInteractionObject.HUDPromptString, !LastTouchedGeneralInteractionObject.IsPressOnly());
    }
    //return;    
}

function OnGeneralInteractionObjectSMEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function EndDoGeneralInteractionOperation()
{
    //return;    
}

reliable client simulated function ClientDoEndDoGeneralInteractionOperation()
{
    //return;    
}

reliable client simulated function ClientDoFinishDoGeneralInteractionOperation()
{
    //return;    
}

reliable server function ServerEndDoGeneralInteractionOperation()
{
    //return;    
}

function InteractionObjectEvent_PrepareComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL InterObj[8388609];

    //return;    
}

function InteractionObjectEvent_OperateComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL InterObj[8388609];

    ClearGeneralPlayerInteractionObjectPrompt();
    //return;    
}

function InteractionObjectEvent_CompleteComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL InterObj[8388609];

    ClearGeneralPlayerInteractionObjectPrompt();
    //return;    
}

function InteractionObjectEvent_AbortComplete()
{
    local /*0x97E50000-0x00000000*/ private @NULL InterObj[8388609];

    ClearGeneralPlayerInteractionObjectPrompt();
    //return;    
}

function InteractionObjectEvent_Interrupted()
{
    local /*0x97E50000-0x00000000*/ private @NULL InterObj[8388609];

    ClearGeneralPlayerInteractionObjectPrompt();
    //return;    
}

event HandleNotifyInteractionObjectTriggerExternal()
{
    //return;    
}

function InteractiveMovieInput()
{
    local /*0x97E50000-0x00000000*/ private int iDirection[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DisplayHackDeployablePrompt()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string Message[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

    // End:0xDE
    if(IsLocalPlayerController())
    {
        // End:0xDE
        if(!IsHackDeployablePromptVisible())
        {
            UIElementInfo.InputCalloutMarkupString = "<InputCallOuts:GBA_DoHackDeployableOperation>";
            UIElementInfo.UIElementClass = Class'LPGFxUIElementGameMessageHackDeployablePrompt';
            myLPHUD.DisplayHUDMessageLayer(16, Message, -1.0000000, None,,,, UIElementInfo);
        }
    }
    //return;    
}

function ClearHackDeployablePrompt()
{
    // End:0x2E
    if(IsHackDeployablePromptVisible())
    {
        myLPHUD.RemoveMessageLayer(16);
    }
    //return;    
}

function IsHackDeployablePromptVisible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x35
    if((IsLocalPlayerController()) && myLPHUD.IsMessageLayerActive(16))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

reliable client simulated function ClientClearHackDeployablePrompt()
{
    // End:0x17
    if(IsLocalController())
    {
        ClearHackDeployablePrompt();
    }
    //return;    
}

function @NULL StartHackDeployableOperation()
{
    local /*0x97E50000-0x00000400*/ private @NULL C;

    // End:0x57
    if((bIsInVitalSuit || MyPlayerPawn.IsDoingASpecialMove()) || MyPlayerPawn.bUseZiplineVSTransition)
    {
        return;
    }
    // End:0x68
    if(LastTouchedHackableDeployableComponentOwner == none)
    {
        return;
    }
    // End:0x9F
    if((Pawn == none) || !Pawn.IsAliveAndWell())
    {
        return;
    }
    C = Class'LPPerks'.static.FindHackableComponent(LastTouchedHackableDeployableComponentOwner);
    // End:0xE2
    if(C == none)
    {
        return;
    }
    // End:0x145
    if(LPPRI(PlayerReplicationInfo).PerksManager.QueryPerkIndex(Class'LPPerkNanoThief'.default.PerkIndex) < 0)
    {
        return;
    }
    // End:0x174
    if(!C.CanBeHacked(MyPlayerPawn))
    {
        return;
    }
    ServerStartHackDeployableOperation(LastTouchedHackableDeployableComponentOwner);
    //return;    
}

reliable server function @NULL ServerStartHackDeployableOperation()
{
    local /*0x97E50000-0x00000000*/ private @NULL targetObject[8388609], C;

    // End:0x57
    if((bIsInVitalSuit || MyPlayerPawn.IsDoingASpecialMove()) || MyPlayerPawn.bUseZiplineVSTransition)
    {
        return;
    }
    // End:0xBA
    if(LPPRI(PlayerReplicationInfo).PerksManager.QueryPerkIndex(Class'LPPerkNanoThief'.default.PerkIndex) < 0)
    {
        return;
    }
    // End:0xF1
    if((Pawn == none) || !Pawn.IsAliveAndWell())
    {
        return;
    }
    LastTouchedHackableDeployableComponentOwner = LPPlayerPawn(Pawn).FindNearestValidHackableComponent().Owner;
    // End:0x162
    if(targetObject != LastTouchedHackableDeployableComponentOwner)
    {
        targetObject = LastTouchedHackableDeployableComponentOwner;
    }
    // End:0x173
    if(targetObject == none)
    {
        return;
    }
    C = Class'LPPerks'.static.FindHackableComponent(LastTouchedHackableDeployableComponentOwner);
    // End:0x1B6
    if(C == none)
    {
        return;
    }
    // End:0x1E5
    if(!C.CanBeHacked(MyPlayerPawn))
    {
        return;
    }
    PlayerMoveInfo.bDoHackDeployableOperation = true;
    ClientStartHackDeployableOperation(targetObject);
    GotoState('HackDeployable');
    //return;    
}

reliable client simulated function ClientStartHackDeployableOperation()
{
    local /*0x97E50000-0x00000000*/ private @NULL targetObject[8388609];

    LastTouchedHackableDeployableComponentOwner = targetObject;
    // End:0x4A
    if((Pawn == none) || !Pawn.IsAliveAndWell())
    {
        return;
    }
    GotoState('HackDeployable');
    //return;    
}

function OnHackDeployableSMEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function EndDoHackDeployableOperation()
{
    //return;    
}

reliable client simulated function ClientDoEndDoHackDeployableOperation()
{
    //return;    
}

reliable client simulated function ClientDoFinishDoHackDeployableOperation()
{
    //return;    
}

reliable server function ServerEndDoHackDeployableOperation()
{
    //return;    
}

function @NULL HackDeployableEvent_PrepareComplete()
{
    local /*0x97E50000-0x00000400*/ private @NULL HackObj[8388609];

    //return;    
}

function @NULL HackDeployableEvent_OperateComplete()
{
    local /*0x97E50000-0x00000400*/ private @NULL HackObj[8388609];

    ClearHackDeployablePrompt();
    //return;    
}

function @NULL HackDeployableEvent_CompleteComplete()
{
    local /*0x97E50000-0x00000400*/ private @NULL HackObj[8388609];

    ClearHackDeployablePrompt();
    //return;    
}

function @NULL HackDeployableEvent_AbortComplete()
{
    local /*0x97E50000-0x00000400*/ private @NULL HackObj[8388609];

    ClearHackDeployablePrompt();
    //return;    
}

function @NULL HackDeployableEvent_Interrupted()
{
    local /*0x97E50000-0x00000400*/ private @NULL HackObj[8388609];

    ClearHackDeployablePrompt();
    //return;    
}

function GetHackDeployableCompletionPercentage()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

reliable client simulated function ClientSetNanoThiefIdentity()
{
    local /*0x97E50000-0x00000000*/ private byte PerkIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Thief;

    Thief = LPPerkNanoThief(LPPRI(PlayerReplicationInfo).PerksManager.QueryPerkClass(Class'LPPerkNanoThief'.default.PerkIndex));
    // End:0xD6
    if(Thief != none)
    {
        Thief.AssumePerkIdentity(PerkIndex);
        ForceDPadClusterUpdate();
        // End:0xD6
        if(int(Role) != int(ROLE_Authority))
        {
            IncrementStat('Stat_TotemsHacked');
        }
    }
    //return;    
}

function StopHacking()
{
    //return;    
}

reliable client simulated event ClientReceiveBroadcastHUDMessage()
{
    local /*0x97E50000-0x00000000*/ private int AttackingTeamIndex[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageBodyPrefix[142606337], MessageBodyPostfix, ObjectiveName;
    local /*0x97E50000-0x00000000*/ private @NULL PRI1[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string MessageTitle, MessageBody;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL MessageInfo;
    local /*0x97E50000-0x00000000*/ private editfixedsize string InstigatorName;
    local /*0x97E50000-0x00000000*/ private int InstigatorTeamNum;

    // End:0x26B
    if(myLPHUD != none)
    {
        InstigatorName = ((PRI1 != none) ? PRI1.PlayerName : "");
        InstigatorTeamNum = ((PRI1 != none) ? int(PRI1.GetTeamNum()) : -1);
        // End:0x26B
        if(Class'LPGRI_Base_MP'.static.ConstructHUDMessage(AttackingTeamIndex, MessageBodyPrefix, MessageBodyPostfix, ObjectiveName, InstigatorName, InstigatorTeamNum, MessageTitle, MessageBody))
        {
            MessageInfo.DisplayTime = fDisplayTime;
            MessageInfo.MessageTitle = MessageTitle;
            MessageInfo.MessageBody = MessageBody;
            myLPHUD.DisplayMPObjective(MessageInfo);
            LocalPlayer(Player).ViewportClient.ViewportConsole.OutputText(MessageInfo.MessageTitle);
            LocalPlayer(Player).ViewportClient.ViewportConsole.OutputText(MessageInfo.MessageBody);
        }
    }
    //return;    
}

reliable client simulated event ClientReceiveBroadcastObjectiveMessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string EventName[142606337], ObjectiveName;
    local /*0x97E50000-0x00000000*/ private int ObjectiveType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPrimary[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI1[8388609];
    local /*0x97E50000-0x00000000*/ private float fDisplayTime[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL MessageInfo;
    local /*0x97E50000-0x00000000*/ private editfixedsize string InstigatorName;
    local /*0x97E50000-0x00000000*/ private int InstigatorTeamNum;

    // End:0x206
    if(myLPHUD != none)
    {
        InstigatorName = ((PRI1 != none) ? PRI1.PlayerName : "");
        InstigatorTeamNum = ((PRI1 != none) ? int(PRI1.GetTeamNum()) : -1);
        // End:0x206
        if(Class'LPGRI_Base_MP'.static.ConstructObjectiveMessageInfo(EventName, ObjectiveName, ObjectiveType, bPrimary, InstigatorName, InstigatorTeamNum, fDisplayTime, int(GetTeamNum()), MessageInfo))
        {
            myLPHUD.DisplayMPObjective(MessageInfo);
            LocalPlayer(Player).ViewportClient.ViewportConsole.OutputText(MessageInfo.MessageTitle);
            LocalPlayer(Player).ViewportClient.ViewportConsole.OutputText(MessageInfo.MessageBody);
        }
    }
    //return;    
}

reliable client simulated event ClientWasKicked()
{
    ClearKickWarning();
    // End:0x56
    if(int(Role) == int(ROLE_Authority))
    {
        Class'LPMultiplayerManager'.static.GetInstance().HandleDisbandParty();        
    }
    else
    {
        Class'LPMultiplayerManager'.static.GetInstance().DestroyOnlineParty();
    }
    ReturnToMPLobby("<Strings:LostPlanetGame.MessageBoxStrings.ClientKickedDueToIdle_Message>", "<Strings:LostPlanetGame.MessageBoxStrings.ClientKickedDueToIdle_Title>", true);
    //return;    
}

function VerifyPreferredPawnClassForTeam()
{
    local /*0x97E50000-0x00000000*/ private byte TeamNum[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx, foundIdx, DefaultPawnClassIdx;
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;
    local /*0x97E50000-0x00000000*/ private editfixedsize string PrefPawnClassName, DefaultPawnClassName;
    local /*0x97E50000-0x00000000*/ private editfixedsize array SkinList;

    PrefPawnClassName = "";
    LPPS = LPProfileSettings(ProfileSettings);
    // End:0x379
    if(LPPS != none)
    {
        PrefPawnClassName = LPPS.GetPreferredPawnClass(int(TeamNum));
        // End:0x376
        if(PrefPawnClassName != "")
        {
            // End:0xE2
            if(int(TeamNum) == int(0))
            {
                SkinList = Class'LPGFxPreGameLobbySettings'.default.NevecSkins;
                DefaultPawnClassName = Class'LPPRI'.default.DesiredNevecPawnClassName;                
            }
            else
            {
                SkinList = Class'LPGFxPreGameLobbySettings'.default.PirateSkins;
                DefaultPawnClassName = Class'LPPRI'.default.DesiredPiratePawnClassName;
            }
            // End:0x151
            if(SkinList.Length == 0)
            {
                PrefPawnClassName = "";                
            }
            else
            {
                DefaultPawnClassIdx = -1;
                Idx = 0;
                J0x16B:

                // End:0x1DB [Loop If]
                if(Idx < SkinList.Length)
                {
                    // End:0x1CD
                    if(SkinList[Idx].ClassName ~= DefaultPawnClassName)
                    {
                        DefaultPawnClassIdx = Idx;
                        // [Explicit Break]
                        goto J0x1DB;
                    }
                    ++Idx;
                    // [Loop Continue]
                    goto J0x16B;
                }
                J0x1DB:

                // End:0x21D
                if(DefaultPawnClassIdx < 0)
                {
                    DefaultPawnClassIdx = 0;
                    DefaultPawnClassName = SkinList[0].ClassName;
                }
                foundIdx = -1;
                Idx = 0;
                J0x237:

                // End:0x2A7 [Loop If]
                if(Idx < SkinList.Length)
                {
                    // End:0x299
                    if(SkinList[Idx].ClassName ~= PrefPawnClassName)
                    {
                        foundIdx = Idx;
                        // [Explicit Break]
                        goto J0x2A7;
                    }
                    ++Idx;
                    // [Loop Continue]
                    goto J0x237;
                }
                J0x2A7:

                // End:0x2DC
                if(foundIdx < 0)
                {
                    foundIdx = DefaultPawnClassIdx;
                    PrefPawnClassName = DefaultPawnClassName;
                }
                // End:0x337
                if(!IsUnlockedMP(SkinList[foundIdx].UnlockName))
                {
                    foundIdx = DefaultPawnClassIdx;
                    PrefPawnClassName = DefaultPawnClassName;
                }
                // End:0x376
                if(!IsValidSkinForServer(PrefPawnClassName))
                {
                    foundIdx = DefaultPawnClassIdx;
                    PrefPawnClassName = DefaultPawnClassName;
                }
            }
        }        
    }
    return PrefPawnClassName;
    //return ReturnValue;    
}

function SendServerPlayerPreferences()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPS;
    local /*0x97E50000-0x00000000*/ private editfixedsize string NevecPawnClass, PiratePawnClass;

    LPPS = LPProfileSettings(ProfileSettings);
    // End:0x76
    if(LPPS != none)
    {
        NevecPawnClass = VerifyPreferredPawnClassForTeam(0);
        PiratePawnClass = VerifyPreferredPawnClassForTeam(1);
        SetPlayerPreferences(NevecPawnClass, PiratePawnClass);        
    }
    //return;    
}

function SeamlessTravelTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewPC[8388609], LPNewPC;

    super(PlayerController).SeamlessTravelTo(NewPC);
    LPNewPC = LPPlayerController(NewPC);
    // End:0xDE
    if(LPNewPC != none)
    {
        LPNewPC.PickedTeamNum = PickedTeamNum;
        LPNewPC.DesiredNevecPawnClassName = DesiredNevecPawnClassName;
        LPNewPC.DesiredPiratePawnClassName = DesiredPiratePawnClassName;
        LPNewPC.GameplayVoiceMuteList = GameplayVoiceMuteList;
    }
    //return;    
}

reliable server function ServerChangeTeam()
{
    local /*0x97E50000-0x00000000*/ private int N[8388609];

    PickedTeamNum = N;
    super(PlayerController).ServerChangeTeam(N);
    //return;    
}

reliable server function ServerSetPlayerPreferences()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string DesiredNevecPawn[8388609], DesiredPiratePawn;
    local /*0x97E50000-0x00000000*/ private @NULL GPRI;

    GPRI = LPPRI(PlayerReplicationInfo);
    // End:0x91
    if(Class'LPGameViewportClient'.static.IsTGSDemo())
    {
        DesiredNevecPawn = GPRI.default.DesiredNevecPawnClassName;
        DesiredPiratePawn = GPRI.default.DesiredPiratePawnClassName;        
    }
    else
    {
        // End:0xC6
        if(DesiredNevecPawn != "")
        {
            // End:0xC6
            if(!IsValidSkinForServer(DesiredNevecPawn))
            {
                DesiredNevecPawn = "";
            }
        }
        // End:0xFE
        if(DesiredNevecPawn == "")
        {
            DesiredNevecPawn = GPRI.default.DesiredNevecPawnClassName;
        }
        // End:0x133
        if(DesiredPiratePawn != "")
        {
            // End:0x133
            if(!IsValidSkinForServer(DesiredPiratePawn))
            {
                DesiredPiratePawn = "";
            }
        }
        // End:0x16B
        if(DesiredPiratePawn == "")
        {
            DesiredPiratePawn = GPRI.default.DesiredPiratePawnClassName;
        }
    }
    GPRI.DesiredNevecPawnClassName = DesiredNevecPawn;
    GPRI.DesiredPiratePawnClassName = DesiredPiratePawn;
    //return;    
}

function SetPlayerPreferences()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string DesiredNevecPawn[8388609], DesiredPiratePawn;

    // End:0x29
    if(IsLocalPlayerController())
    {
        ServerSetPlayerPreferences(DesiredNevecPawn, DesiredPiratePawn);
    }
    //return;    
}

event InitInputSystem()
{
    LoadWeaponClasses();
    super(SPInputPlayerController).InitInputSystem();
    // End:0x86
    if((int(Role) < int(ROLE_Authority)) && int(NetPlayerIndex) == int(0))
    {
        SeekFreeMultiClassLoader = new (self) Class'SPEngine.SPSeekFreeMultiClassLoader';
        SeekFreeMultiClassLoader.__LoadComplete__Delegate = PawnClassLoaded;
    }
    //return;    
}

function LoadWeaponClasses()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL MenuGRI;

    MenuGRI = LPMenuGameGRI(WorldInfo.GRI);
    // End:0x145
    if((int(WorldInfo.NetMode) != int(NM_Standalone)) || MenuGRI != none)
    {
        SeekFreeMultiWeaponClassLoader = new (self) Class'SPEngine.SPSeekFreeMultiClassLoader';
        SeekFreeMultiWeaponClassLoader.__LoadComplete__Delegate = WeaponClassLoaded;
        // End:0x145
        if(WeaponContentClassNames.Length > 0)
        {
            I = 0;
            J0xCE:

            // End:0x126 [Loop If]
            if(I < WeaponContentClassNames.Length)
            {
                SeekFreeMultiWeaponClassLoader.LoadClass(WeaponContentClassNames[I]);
                I++;
                // [Loop Continue]
                goto J0xCE;
            }
            SeekFreeMultiWeaponClassLoader.BlockLoad();
        }
    }
    //return;    
}

function UnloadWeaponClasses()
{
    local /*0x97E50000-0x00000000*/ private bool bPerformGC[9437185];

    // End:0x39
    if(SeekFreeMultiWeaponClassLoader != none)
    {
        SeekFreeMultiWeaponClassLoader.UnloadAll(bPerformGC);
    }
    WeaponContentReferences.Length = 0;
    //return;    
}

function AreAllWeaponClassesLoaded()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x32
    if(SeekFreeMultiWeaponClassLoader != none)
    {
        return SeekFreeMultiWeaponClassLoader.PendingClasses.Length == 0;
    }
    return false;
    //return ReturnValue;    
}

function WeaponClassLoaded()
{
    local /*0x97E50000-0x00000000*/ private class LoadedClass[8388609], WeaponClass;

    WeaponClass = class<Inventory>(LoadedClass);
    // End:0x4E
    if(WeaponContentReferences.Find(WeaponClass) < )
    {        
        WeaponContentReferences.AddItem(WeaponClass);        
    }
    //return;    
}

function PawnClassLoaded()
{
    local /*0x97E50000-0x00000000*/ private class LoadedClass[8388609];

    ClientPrestreamTexturesFor(LoadedClass);
    ServerPawnClassLoaded(PathName(LoadedClass));
    // End:0x5F
    if(SeekFreeMultiClassLoader.PendingClasses.Length == 0)
    {
        ServerAllSkinsLoaded();
    }
    //return;    
}

reliable server function ServerAllSkinsLoaded()
{
    bSkinsLoaded = true;
    //return;    
}

// Export ULPPlayerController::execServerPawnClassLoaded(FFrame&, void* const)
reliable server native final function ServerPawnClassLoaded()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string LoadedClassPath[8388609];


}

reliable client final simulated event ClientLoadCharacter()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CharacterPath[8388609];

    // End:0x37
    if(SeekFreeMultiClassLoader != none)
    {
        SeekFreeMultiClassLoader.LoadClass(CharacterPath);
    }
    //return;    
}

reliable client final simulated function ClientUnloadCharacter()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string CharacterPath[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x10D
    if(SeekFreeMultiClassLoader != none)
    {
        I = 0;
        J0x1A:

        // End:0xC2 [Loop If]
        if(I < SeekFreeMultiClassLoader.LoadedClasses.Length)
        {
            // End:0xB4
            if(PathName(SeekFreeMultiClassLoader.LoadedClasses[I]) ~= CharacterPath)
            {
                SeekFreeMultiClassLoader.LoadedClasses.Remove(I, 1);                
                // [Explicit Break]
                goto J0xC2;
            }
            I++;
            // [Loop Continue]
            goto J0x1A;
        }
        J0xC2:

        SeekFreeMultiClassLoader.PendingClasses.RemoveItem(CharacterPath);        
        WorldInfo.ForceGarbageCollection();
    }
    //return;    
}

reliable client simulated function ClientPrestreamTexturesFor()
{
    local /*0x97E50000-0x00000000*/ private class PawnClass[8388609], Temp;

    Temp = class<LPPawn>(PawnClass);
    // End:0x91
    if((Temp != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        Temp.default.Mesh.PrestreamTextures(5.0000000, false);
    }
    //return;    
}

reliable client simulated function ClientInitMatchData()
{
    local /*0x97E50000-0x00000000*/ private bool bResetMatchData[9437185], bResetRounds;

    false
    false
    // End:0x35
    if(IsLocalPlayerController())
    {
        InitMatchData(bResetMatchData, bResetRounds);
    }
    //return;    
}

simulated function InitMatchData()
{
    local /*0x97E50000-0x00000000*/ private bool bResetMatchData[9437185], bResetRounds;
    local /*0x97E50000-0x00000000*/ private @NULL DataStoreManager;

    false
    false
    // End:0xF8
    if(IsLocalPlayerController())
    {
        // End:0xBF
        if(MatchDataStore == none)
        {
            DataStoreManager = Class'Engine.UIInteraction'.static.GetDataStoreClient();
            // End:0xAF
            if(DataStoreManager != none)
            {
                MatchDataStore = LPUIDataStore_MatchSummary(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPUIDataStore_MatchSummary'.default.Tag));
            }
            // DebugMode: 0
            assert(MatchDataStore != none);
        }
        // End:0xF5
        if(bResetMatchData)
        {
            MatchDataStore.ResetMatch(bResetRounds);
        }        
    }
    else
    {
        ClientInitMatchData(bResetMatchData, bResetRounds);
    }
    //return;    
}

simulated function GetMatchData()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x1B
    if(MatchDataStore == none)
    {
        InitMatchData();
    }
    return MatchDataStore;
    //return ReturnValue;    
}

simulated function AddAwardToMatchData()
{
    local /*0x97E50000-0x00000000*/ private name AwardName[8388609];
    local /*0x97E50000-0x00000000*/ private int TimesAwarded[8388609], CreditsAwarded;

    // End:0x48
    if(IsLocalPlayerController())
    {
        GetMatchData().AddAward(AwardName, TimesAwarded, CreditsAwarded);
    }
    //return;    
}

reliable client simulated function ClientAwardMatchCompletionBonus()
{
    local /*0x97E50000-0x00000000*/ private int BonusCredits[8388609];

    // End:0x20
    if(IsLocalPlayerController())
    {
        AwardMatchCompletionBonus(BonusCredits);
    }
    //return;    
}

simulated function AwardMatchCompletionBonus()
{
    local /*0x97E50000-0x00000000*/ private int BonusCredits[8388609];

    // End:0x47
    if(int(Role) == int(ROLE_Authority))
    {
        LPPRI(PlayerReplicationInfo).AddMPCreditsEarned(BonusCredits);
    }
    // End:0x80
    if(IsLocalPlayerController())
    {
        GetMatchData().MatchBonusCredits = BonusCredits;        
    }
    else
    {
        ClientAwardMatchCompletionBonus(BonusCredits);
    }
    //return;    
}

reliable client simulated function ClientAddScoreStruct()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Score[8388609];

    // End:0x20
    if(IsLocalPlayerController())
    {
        AddScoreStruct(Score);
    }
    //return;    
}

simulated function AddScoreStruct()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Score[8388609];

    // End:0xF7
    if(IsLocalPlayerController())
    {
        Score.bLocalPlayer = (EqualEqual_UniqueNetIdUniqueNetId(Score.PlayerID, PlayerReplicationInfo.UniqueId) && Score.PlayerTag == (GetHumanReadableName())) && Score.TeamNum == int(GetTeamNum());
        GetMatchData().AddScoreStruct(Score);        
    }
    else
    {
        ClientAddScoreStruct(Score);
    }
    //return;    
}

reliable client simulated function ClientMatchOver()
{
    local /*0x97E50000-0x00000000*/ private int WinningTeamNum[8388609], MatchTimeInSeconds, RoundNum;

    // End:0x32
    if(IsLocalPlayerController())
    {
        MatchOver(WinningTeamNum, MatchTimeInSeconds, RoundNum);
    }
    //return;    
}

simulated function MatchOver()
{
    local /*0x97E50000-0x00000000*/ private int WinningTeamNum[8388609], MatchTimeInSeconds, RoundNum, Playtime;
    local /*0x97E50000-0x00000000*/ private @NULL StatManager;

    StatManager = GetStatManager();
    // End:0x2D
    if(IsLocalPlayerController())
    {
        bSavingDisabled = true;
    }
    Playtime = int(WorldInfo.TimeSeconds - PlayStartTime);
    ModifyStat('Stat_TotalPlaytime', Playtime);
    ModifyStat(StatManager.GetCurrentGameTypeStatName("Playtime"), Playtime);
    IncrementStat('Stat_MatchesPlayed');
    IncrementStat(StatManager.GetCurrentGameTypeStatName("MatchesPlayed"));
    // End:0x1A1
    if(WinningTeamNum == int(GetTeamNum()))
    {
        IncrementStat(StatManager.GetCurrentGameTypeStatName("MatchesWon"));
        IncrementStat('Stat_MatchesWon');
        // End:0x19E
        if(int(StatManager.GetGameType()) == int(2))
        {
            HandleBestAroundAchievement();
        }        
    }
    else
    {
        // End:0x207
        if(WinningTeamNum == (1 - int(GetTeamNum())))
        {
            IncrementStat('Stat_MatchesLost');
            IncrementStat(StatManager.GetCurrentGameTypeStatName("MatchesLost"));
        }
    }
    // End:0x391
    if(IsLocalPlayerController())
    {
        GetMatchData().MatchTimeInSeconds = MatchTimeInSeconds;
        MatchDataStore.MatchGameType = StatManager.GetGameType();
        MatchDataStore.MatchRounds = RoundNum;
        MatchDataStore.bMatchDataAvailable = true;
        MatchDataStore.bMatchDataNeedsShowing = true;
        MatchDataStore.bMatchWonByNevec = (WinningTeamNum == 0) || WinningTeamNum == -1;
        MatchDataStore.MatchTotalCredits = LPPRI(PlayerReplicationInfo).GetMPCreditsEarnedInRoundTotal();
        bSavingDisabled = false;
        ResetLastPlayerStorageProfileSaveTime();
        SaveProfile();        
    }
    else
    {
        ClientMatchOver(WinningTeamNum, MatchTimeInSeconds, RoundNum);
    }
    //return;    
}

reliable client simulated function ClientWriteLeaderboardStats()
{
    local /*0x97E50000-0x00000000*/ private class OnlineStatsWriteClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsIncomplete[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL PRI, OSI, LeaderStatsWrite, StatsWrite, StatManager;

    local /*0x97E50000-0x00000000*/ private byte TheGameType;
    local /*0x97E50000-0x00000000*/ private @NULL Winner;

    false
    PRI = LPPRI(PlayerReplicationInfo);
    // End:0x30
    if(IsInPrivateSession())
    {
        return;
    }
    OSI = OnlineSub.StatsInterface;
    // End:0x166F
    if(NotEqual_InterfaceInterface(OSI, OnlineStatsInterface(none)))
    {
        StatManager = GetStatManager();
        // End:0x9D
        if(StatManager == none)
        {
            return;
        }
        LeaderStatsWrite = new Class'LPWriteLeaderboardStats_Credits';
        LeaderStatsWrite.SetValue(StatManager.EvalStat('Stat_CreditsCareer'));
        // End:0x167
        if(!OSI.WriteOnlineStats(PRI.SessionName, PRI.UniqueId, LeaderStatsWrite))
        {
        }
        LeaderStatsWrite = new Class'LPWriteLeaderboardStats_Kills';
        LeaderStatsWrite.SetValue(StatManager.EvalStat('Stat_KillsHuman'));
        // End:0x231
        if(!OSI.WriteOnlineStats(PRI.SessionName, PRI.UniqueId, LeaderStatsWrite))
        {
        }
        TheGameType = StatManager.GetGameType();
        Winner = Class'Engine.WorldInfo'.static.GetWorldInfo().GRI.Winner;
        // End:0x52F
        if((Winner != none) && int(GetTeamNum()) == int(Winner.GetTeamNum()))
        {
            LeaderStatsWrite = none;
            switch(TheGameType)
            {
                // End:0x378
                case 3:
                    LeaderStatsWrite = new Class'LPWriteLeaderboardStats_TDMWins';
                    LeaderStatsWrite.SetValue(StatManager.EvalStat('Stat_TDM_MatchesWon'));
                    // End:0x4B3
                    break;
                // End:0x3E0
                case 1:
                    LeaderStatsWrite = new Class'LPWriteLeaderboardStats_TEngRushWins';
                    LeaderStatsWrite.SetValue(StatManager.EvalStat('Stat_EXTR_MatchesWon'));
                    // End:0x4B3
                    break;
                // End:0x448
                case 2:
                    LeaderStatsWrite = new Class'LPWriteLeaderboardStats_ScenarioWins';
                    LeaderStatsWrite.SetValue(StatManager.EvalStat('Stat_SCEN_MatchesWon'));
                    // End:0x4B3
                    break;
                // End:0x4B0
                case 4:
                    LeaderStatsWrite = new Class'LPWriteLeaderboardStats_SurvivalWins';
                    LeaderStatsWrite.SetValue(StatManager.EvalStat('Stat_SURV_MatchesWon'));
                    // End:0x4B3
                    break;
                // End:0xFFFF
                default:
                    break;
            }
            // End:0x52F
            if(LeaderStatsWrite != none)
            {
                // End:0x52C
                if(!OSI.WriteOnlineStats(PRI.SessionName, PRI.UniqueId, LeaderStatsWrite))
                {
                }                
            }
        }
        StatsWrite = new Class'LPWriteGameplayStats_All';
        StatsWrite.SetIntStat(268435480, GetMetagameManager().GetMetagameRank());
        StatsWrite.SetIntStat(268435481, StatManager.EvalStat('Stat_CreditsCurrent'));
        StatsWrite.SetIntStat(268435482, StatManager.EvalStat('Stat_CreditsCareer'));
        StatsWrite.SetIntStat(268435483, StatManager.EvalStat('Stat_KillsHuman'));
        StatsWrite.SetIntStat(268435484, StatManager.EvalStat('Stat_Deaths'));
        StatsWrite.SetIntStat(268435485, StatManager.EvalStat('Stat_MatchesPlayed'));
        StatsWrite.SetIntStat(268435486, StatManager.EvalStat('Stat_MatchesWon'));
        StatsWrite.SetIntStat(268435487, StatManager.EvalStat('Stat_MatchesLost'));
        StatsWrite.SetIntStat(268435488, StatManager.EvalStat('Stat_TotalPlaytime'));
        // End:0x85D
        if(!OSI.WriteOnlineStats(PRI.SessionName, PRI.UniqueId, StatsWrite))
        {
        }
        StatsWrite = none;
        switch(TheGameType)
        {
            // End:0xBD9
            case 3:
                StatsWrite = new Class'LPWriteGameplayStats_TDM';
                StatsWrite.SetIntStat(268435489, StatManager.EvalStat(StatManager.GetGameTypeStatName("Credits", TheGameType)));
                StatsWrite.SetIntStat(268435490, StatManager.EvalStat(StatManager.GetGameTypeStatName("Kills", TheGameType)));
                StatsWrite.SetIntStat(268435491, StatManager.EvalStat(StatManager.GetGameTypeStatName("Deaths", TheGameType)));
                StatsWrite.SetIntStat(268435492, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesPlayed", TheGameType)));
                StatsWrite.SetIntStat(268435493, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesWon", TheGameType)));
                StatsWrite.SetIntStat(268435494, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesLost", TheGameType)));
                StatsWrite.SetIntStat(268435495, StatManager.EvalStat(StatManager.GetGameTypeStatName("Playtime", TheGameType)));
                // End:0x15F6
                break;
            // End:0xF37
            case 2:
                StatsWrite = new Class'LPWriteGameplayStats_Scenario';
                StatsWrite.SetIntStat(268435496, StatManager.EvalStat(StatManager.GetGameTypeStatName("Credits", TheGameType)));
                StatsWrite.SetIntStat(268435497, StatManager.EvalStat(StatManager.GetGameTypeStatName("Kills", TheGameType)));
                StatsWrite.SetIntStat(268435498, StatManager.EvalStat(StatManager.GetGameTypeStatName("Deaths", TheGameType)));
                StatsWrite.SetIntStat(268435499, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesPlayed", TheGameType)));
                StatsWrite.SetIntStat(268435500, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesWon", TheGameType)));
                StatsWrite.SetIntStat(268435501, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesLost", TheGameType)));
                StatsWrite.SetIntStat(268435502, StatManager.EvalStat(StatManager.GetGameTypeStatName("Playtime", TheGameType)));
                // End:0x15F6
                break;
            // End:0x1295
            case 4:
                StatsWrite = new Class'LPWriteGameplayStats_Survival';
                StatsWrite.SetIntStat(268435503, StatManager.EvalStat(StatManager.GetGameTypeStatName("Credits", TheGameType)));
                StatsWrite.SetIntStat(268435504, StatManager.EvalStat(StatManager.GetGameTypeStatName("Kills", TheGameType)));
                StatsWrite.SetIntStat(268435505, StatManager.EvalStat(StatManager.GetGameTypeStatName("Deaths", TheGameType)));
                StatsWrite.SetIntStat(268435506, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesPlayed", TheGameType)));
                StatsWrite.SetIntStat(268435507, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesWon", TheGameType)));
                StatsWrite.SetIntStat(268435508, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesLost", TheGameType)));
                StatsWrite.SetIntStat(268435509, StatManager.EvalStat(StatManager.GetGameTypeStatName("Playtime", TheGameType)));
                // End:0x15F6
                break;
            // End:0x15F3
            case 1:
                StatsWrite = new Class'LPWriteGameplayStats_Extraction';
                StatsWrite.SetIntStat(268435510, StatManager.EvalStat(StatManager.GetGameTypeStatName("Credits", TheGameType)));
                StatsWrite.SetIntStat(268435511, StatManager.EvalStat(StatManager.GetGameTypeStatName("Kills", TheGameType)));
                StatsWrite.SetIntStat(268435512, StatManager.EvalStat(StatManager.GetGameTypeStatName("Deaths", TheGameType)));
                StatsWrite.SetIntStat(268435513, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesPlayed", TheGameType)));
                StatsWrite.SetIntStat(268435514, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesWon", TheGameType)));
                StatsWrite.SetIntStat(268435515, StatManager.EvalStat(StatManager.GetGameTypeStatName("MatchesLost", TheGameType)));
                StatsWrite.SetIntStat(268435516, StatManager.EvalStat(StatManager.GetGameTypeStatName("Playtime", TheGameType)));
                // End:0x15F6
                break;
            // End:0xFFFF
            default:
                break;
        }
        // End:0x166F
        if(StatsWrite != none)
        {
            // End:0x166F
            if(!OSI.WriteOnlineStats(PRI.SessionName, PRI.UniqueId, StatsWrite))
            {
            }
        }
    }
    //return;    
}

simulated function HandleBestAroundAchievement()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL AchieveInfo;

    AchieveInfo = Class'LPTuneDataMapInfoMP'.static.GetMapAchievementInfo();
    // End:0x9F
    if(AchieveInfo.BestAroundId > 0)
    {
        GetStatManager().ModifyStat('Stat_BestAround', int(float(2) ** float(AchieveInfo.BestAroundId - 1)), 2);
    }
    //return;    
}

final simulated event ScriptClientNotifyScoreHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL DamagedActor[8388609];
    local /*0x97E50000-0x00000000*/ private float DamageInflicted[8388609];
    local /*0x97E50000-0x00000000*/ private bool bIsKillShot[8388609], bPlayHitDetectionSound;

    ClientNotifyScoreHit(DamagedActor, DamageInflicted, bIsKillShot, bPlayHitDetectionSound);
    //return;    
}

function OnGameInviteAccepted()
{
    local /*0x97E50000-0x00000000*/ private @NULL InviteResult[25296897], LP, MPMgr;

    // End:0x26
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
    {
        return;
    }
    LP = LocalPlayer(Player);
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0xA0
    if((MPMgr == none) || LP == none)
    {
        super(PlayerController).OnGameInviteAccepted(InviteResult);
        return;
    }
    MPMgr.CancelAll();
    MPMgr.OnGameInviteAccepted(LP.ControllerId, InviteResult);
    //return;    
}

function RestoreShowSubtitles()
{
    SetShowSubtitles(ProfileSettings.GetSubtitleConfigOption());
    //return;    
}

event SetVSReticleHelpButton()
{
    local /*0x97E50000-0x00000000*/ private byte Type[8388609];
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Upgrade;

    // End:0x26
    if(VSReticleHelpButtonStates[int(Type)] == bOn)
    {
        return;
    }
    VSReticleHelpButtonStates[int(Type)] = bOn;
    switch(Type)
    {
        // End:0x5E
        case 0:
        // End:0x63
        case 2:
        // End:0x68
        case 1:
        // End:0xCC
        case 8:
            myLPHUD.ShowVSReticle_LeftArm_Tutorial(((VSReticleHelpButtonStates[0] || VSReticleHelpButtonStates[2]) || VSReticleHelpButtonStates[1]) || VSReticleHelpButtonStates[8]);
            // End:0x315
            break;
        // End:0x153
        case 3:
            // End:0x103
            if(!bOn)
            {
                myLPHUD.ShowVSReticle_ShieldBlock_Tutorial(false);                
            }
            else
            {
                // End:0x150
                if(LPVSPlayerPawn(Pawn).GrabbedPawn == none)
                {
                    myLPHUD.ShowVSReticle_ShieldBlock_Tutorial(true);
                }
            }
            // End:0x315
            break;
        // End:0x158
        case 4:
        // End:0x15D
        case 5:
        // End:0x1C9
        case 6:
            // End:0x1C6
            if(HasUpgrade(Class'LPVSUpgrade_Winch'))
            {
                myLPHUD.ShowVSReticle_Winch_Tutorial((VSReticleHelpButtonStates[4] || VSReticleHelpButtonStates[5]) || VSReticleHelpButtonStates[6]);
            }
            // End:0x315
            break;
        // End:0x1CE
        case 7:
        // End:0x212
        case 9:
            myLPHUD.ShowVSReticle_RightArm_Tutorial(VSReticleHelpButtonStates[7] || VSReticleHelpButtonStates[9]);
            // End:0x315
            break;
        // End:0x217
        case 10:
        // End:0x312
        case 11:
            // End:0x30F
            if(HasUpgrade(Class'LPVSUpgrade_Taser', Upgrade))
            {
                // End:0x29E
                if(VSReticleHelpButtonStates[10] || VSReticleHelpButtonStates[11])
                {
                    myLPHUD.ShowVSReticleShockMeter(true);
                    myLPHUD.SetVSReticleShockHelp(true);                    
                }
                else
                {
                    myLPHUD.SetVSReticleShockHelp(false);
                    // End:0x30F
                    if(LPVSUpgrade_Taser(Upgrade).EnergyPercent >= 1.0000000)
                    {
                        myLPHUD.ShowVSReticleShockMeter(false);
                    }
                }
            }
            // End:0x315
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function ClearAllVSReticleHelpButtons()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    myLPHUD.ShowVSReticle_LeftArm_Tutorial(false);
    myLPHUD.ShowVSReticle_ShieldBlock_Tutorial(false);
    myLPHUD.ShowVSReticle_Winch_Tutorial(false);
    myLPHUD.ShowVSReticle_RightArm_Tutorial(false);
    Idx = 0;
    J0x8B:

    // End:0xC6 [Loop If]
    if(Idx < VSReticleHelpButtonStates.Length)
    {
        VSReticleHelpButtonStates[Idx] = false;
        Idx++;
        // [Loop Continue]
        goto J0x8B;
    }
    //return;    
}

simulated function OnToggleTutorialMessages()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
    local /*0x97E50000-0x00000000*/ private byte Mode;
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x46
    if(Action.InputLinks[0].bHasImpulse)
    {
        bAreTutorialsActive = true;        
    }
    else
    {
        // End:0x8C
        if(Action.InputLinks[1].bHasImpulse)
        {
            bAreTutorialsActive = false;            
        }
        else
        {
            // End:0xDB
            if(Action.InputLinks[2].bHasImpulse)
            {
                bAreTutorialsActive = !bAreTutorialsActive;
            }
        }
    }
    // End:0x187
    if(bAreTutorialsActive)
    {
        TutorialTimeDilationStartSound = Action.TutorialTimeDilationStartSound;
        // End:0x184
        if(Action.bClearNotSelectedModes)
        {
            Idx = 0;
            J0x13D:

            // End:0x184 [Loop If]
            if(Idx < 15)
            {
                TutorialTrackingInfo[Idx].bEnabled = false;
                ++Idx;
                // [Loop Continue]
                goto J0x13D;
            }
        }        
    }
    else
    {
        TutorialTimeDilationStartSound = none;
        TutorialTimeDilationLoopingSound = none;
        TutorialTimeDilationEndSound = none;
    }
    // End:0x28D
    foreach Action.ModeTypes(Mode)
    {
        switch(Mode)
        {
            // End:0x24A
            case 1:
                Idx = 0;
                J0x1F7:

                // End:0x247 [Loop If]
                if(Idx < 15)
                {
                    TutorialTrackingInfo[Idx].bEnabled = bAreTutorialsActive;
                    ++Idx;
                    // [Loop Continue]
                    goto J0x1F7;
                }
                // End:0x28C
                break;
            // End:0x252
            case 0:
                // End:0x28C
                break;
            // End:0xFFFF
            default:
                TutorialTrackingInfo[int(Mode)].bEnabled = bAreTutorialsActive;
                // End:0x28C
                break;
                break;
        }        
    }    
    PersistentTutorialUpdateDelay = 0.0000000;
    //return;    
}

function UpdateAmmoTypeTutorial()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentWeapon[8388609];

    // End:0x8C
    if(LPWeaponPistol(CurrentWeapon) != none)
    {
        // End:0x7D
        if(SPInventoryWeapon(Pawn.Weapon).AmmoTypeInfo.CurrentAmmoMode == 0)
        {
            SetTutorialMode(12);            
        }
        else
        {
            CompletedTutorialMode(12);
        }        
    }
    else
    {
        CloseTutorialMode(12);
    }
    //return;    
}

function UpdateWeaponTypeTutorial()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurrentWeapon[8388609];

    // End:0x28
    if(LPWeaponPistol(CurrentWeapon) == none)
    {
        SetTutorialMode(11);        
    }
    else
    {
        CompletedTutorialMode(11);
    }
    //return;    
}

simulated function OnAdjustTutorialMessage()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    // End:0x2A5
    if(int(Action.TutorialType) != int(0))
    {
        // End:0xD2
        if(int(Action.StopDisplayingTextAfterXSuccessfulTimes.OverrideType) != 2)
        {
            TutorialTrackingInfo[int(Action.TutorialType)].StopDisplayingTextAfterXSuccessfulTimes = Action.StopDisplayingTextAfterXSuccessfulTimes.OverrideValue;
        }
        // End:0x17B
        if(int(Action.StopUsingTimeDilationAfterXSuccessfulTimes.OverrideType) != 2)
        {
            TutorialTrackingInfo[int(Action.TutorialType)].StopUsingTimeDilationAfterXSuccessfulTimes = Action.StopUsingTimeDilationAfterXSuccessfulTimes.OverrideValue;
        }
        // End:0x224
        if(int(Action.TimeDilation.OverrideType) != 2)
        {
            TutorialTrackingInfo[int(Action.TutorialType)].TimeDilation = Action.TimeDilation.OverrideValue;
        }
        // End:0x2A5
        if(Action.TutorialString != "")
        {
            TutorialTrackingInfo[int(Action.TutorialType)].TutorialString = Action.TutorialString;
        }
    }
    //return;    
}

function ShouldDisplayTutorialModeText()
{
    local /*0x97E50000-0x00000000*/ private byte InMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xE2
    if((TutorialTrackingInfo[int(InMode)].StopDisplayingTextAfterXSuccessfulTimes < 0) || (TutorialTrackingInfo[int(InMode)].StopDisplayingTextAfterXSuccessfulTimes > 0) && TutorialTrackingInfo[int(InMode)].NumTimesSuccesful < TutorialTrackingInfo[int(InMode)].StopDisplayingTextAfterXSuccessfulTimes)
    {
        return TutorialTrackingInfo[int(InMode)].TutorialString != "";
    }
    return false;
    //return ReturnValue;    
}

function ShouldUseTutorialModeTimeDilation()
{
    local /*0x97E50000-0x00000000*/ private byte InMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xB7
    if((TutorialTrackingInfo[int(InMode)].StopUsingTimeDilationAfterXSuccessfulTimes < 0) || (TutorialTrackingInfo[int(InMode)].StopUsingTimeDilationAfterXSuccessfulTimes > 0) && TutorialTrackingInfo[int(InMode)].NumTimesSuccesful < TutorialTrackingInfo[int(InMode)].StopUsingTimeDilationAfterXSuccessfulTimes)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsValidToUseTutorialMode()
{
    local /*0x97E50000-0x00000000*/ private byte InMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return false;
    }
    // End:0x41
    if(int(InMode) == int(0))
    {
        return true;
    }
    // End:0x52
    if(!bAreTutorialsActive)
    {
        return false;
    }
    // End:0x82
    if(!TutorialTrackingInfo[int(InMode)].bEnabled)
    {
        return false;
    }
    // End:0xCA
    if(TutorialTrackingInfo[int(InMode)].bOnlyValidInVS && LPVSPlayerPawn(Pawn) == none)
    {
        return false;
    }
    // End:0x112
    if(TutorialTrackingInfo[int(InMode)].bOnlyValidInPOF && LPVSPlayerPawn(Pawn) != none)
    {
        return false;
    }
    // End:0x12A
    if(ShouldDisplayTutorialModeText(InMode))
    {
        return true;
    }
    // End:0x142
    if(ShouldUseTutorialModeTimeDilation(InMode))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function SetTutorialMode()
{
    local /*0x97E50000-0x00000000*/ private byte InMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize string TutorialMessage;
    local /*0x97E50000-0x00000000*/ private float DesiredTimeDilation;
    local /*0x97E50000-0x00000000*/ private @NULL TutorialFX;

    // End:0x2F
    if((int(InMode) == int(CurrentTutorialMode)) || TuneDataTutorial == none)
    {
        return;
    }
    // End:0x2F7
    if(IsValidToUseTutorialMode(InMode))
    {
        // End:0x67
        if(inPawn == none)
        {
            inPawn = MyBasePlayerPawn;
        }
        myLPHUD.RemoveMessageLayer(1);
        CurrentTutorialMode = InMode;
        // End:0x142
        if(ShouldDisplayTutorialModeText(InMode))
        {
            TutorialMessage = ("<Strings:LostPlanetGame.Tutorials." $ TutorialTrackingInfo[int(InMode)].TutorialString) $ ">";
            myLPHUD.DisplayHUDMessageLayer(1, TutorialMessage);
        }
        // End:0x18D
        if(ShouldUseTutorialModeTimeDilation(InMode))
        {
            DesiredTimeDilation = TutorialTrackingInfo[int(InMode)].TimeDilation;            
        }
        else
        {
            DesiredTimeDilation = 1.0000000;
        }
        WorldInfo.Game.SetGameSpeed(DesiredTimeDilation);
        // End:0x22E
        if(DesiredTimeDilation == 1.0000000)
        {
            inPawn.GetFXActionManager().StopFXAction(Class'LPFXAction_Tutorial');            
        }
        else
        {
            TutorialFX = LPFXAction_Tutorial(inPawn.GetFXActionManager().GetFXAction(Class'LPFXAction_Tutorial'));
            TutorialFX.SetSounds(TutorialTimeDilationStartSound, TutorialTimeDilationLoopingSound, TutorialTimeDilationEndSound);
            inPawn.GetFXActionManager().StartFXAction(Class'LPFXAction_Tutorial');
        }
    }
    //return;    
}

function CloseTutorialMode()
{
    local /*0x97E50000-0x00000000*/ private byte VerifyMode[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[9437185];

    0    
    // End:0x63
    if(((int(VerifyMode) == int(0)) || int(VerifyMode) == int(1)) || int(VerifyMode) == int(CurrentTutorialMode))
    {
        SetTutorialMode(0, inPawn);
    }
    //return;    
}

function CompletedTutorialMode()
{
    local /*0x97E50000-0x00000000*/ private byte InMode[8388609];

    // End:0x52
    if(int(InMode) == int(CurrentTutorialMode))
    {
        TutorialTrackingInfo[int(InMode)].NumTimesSuccesful++;
        CloseTutorialMode(0);
    }
    //return;    
}

function UpdateTutorialMode()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x2B
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        return;
    }
    // End:0x50
    if(!IsValidToUseTutorialMode(CurrentTutorialMode))
    {
        CloseTutorialMode(0);
    }
    // End:0x18B
    if(bAreTutorialsActive)
    {
        PersistentTutorialUpdateDelay -= DeltaTime;
        // End:0x18B
        if(PersistentTutorialUpdateDelay < float(0))
        {
            PersistentTutorialUpdateDelay = 1.0000000;
            Idx = 0;
            J0x9C:

            // End:0x18B [Loop If]
            if(Idx < TutorialTrackingInfo.Length)
            {
                // End:0x17D
                if(TutorialTrackingInfo[Idx].bEnabled && TutorialTrackingInfo[Idx].bPersistentTutorial)
                {
                    // End:0x145
                    if(Idx == 11)
                    {
                        UpdateWeaponTypeTutorial(Pawn.Weapon);                        
                    }
                    else
                    {
                        // End:0x17D
                        if(Idx == 12)
                        {
                            UpdateAmmoTypeTutorial(Pawn.Weapon);
                        }
                    }
                }
                Idx++;
                // [Loop Continue]
                goto J0x9C;
            }
        }
    }
    //return;    
}

reliable client simulated function ClientSetWinner()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winner[8388609];

    WorldInfo.GRI.Winner = Winner;
    //return;    
}

reliable client simulated function ClientTriggerKismetEvent()
{
    local /*0x97E50000-0x00000000*/ private name EventName[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array AllRemoteEvents;
    local /*0x97E50000-0x00000000*/ private @NULL RemoteEvt, GameSeq;
    local /*0x97E50000-0x00000000*/ private int Idx;

    GameSeq = WorldInfo.GetGameSequence();
    // End:0x141
    if(GameSeq != none)
    {
        GameSeq.FindSeqObjectsByClass(Class'Engine.SeqEvent_RemoteEvent', true, AllRemoteEvents);
        // End:0x141
        if(EventName != 'None')
        {
            Idx = 0;
            J0x8C:

            // End:0x141 [Loop If]
            if(Idx < AllRemoteEvents.Length)
            {
                RemoteEvt = SeqEvent_RemoteEvent(AllRemoteEvents[Idx]);
                // End:0x133
                if((RemoteEvt != none) && EventName == RemoteEvt.EventName)
                {
                    RemoteEvt.CheckActivate(self, Pawn);
                }
                Idx++;
                // [Loop Continue]
                goto J0x8C;
            }
        }
    }
    //return;    
}

function CheckForMeleeTakedownTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private float Dist, RearDotProductWindow, FrontDotProductWindow;
    local /*0x97E50000-0x00000000*/ private @NULL KillerFacingRot;
    local /*0x97E50000-0x00000000*/ private int iValid;

    // End:0x11
    if(myLPHUD == none)
    {
        return;
    }
    // End:0xE0
    if(((((((MyBasePlayerPawn == none) || !MyBasePlayerPawn.IsAliveAndWell()) || MyBasePlayerPawn.IsDoingASpecialMove()) || MyBasePlayerPawn.IsInCover()) || !IsLocalController()) || IsAimingDownSight()) || bIsInVitalSuit)
    {
        myLPHUD.RemoveMessageLayer(8);
        return;
    }
    KillerFacingRot = MatrixGetRotator(MyBasePlayerPawn.Mesh.GetBoneMatrix(MyBasePlayerPawn.Mesh.MatchRefBone('JO_hip')));
    KillerFacingRot.Yaw += 16384;
    RearDotProductWindow = Cos(MyPlayerPawn.TuneDataPlayerPawn.MinAngleDegreesCandidateForChoreography * 0.0174533);
    FrontDotProductWindow = Cos(MyPlayerPawn.TuneDataPlayerPawn.MeleeTakedownMaxDifferenceInFacingDirections.GetValue() * 0.0174533);
    iValid = 0;
    // End:0x495
    foreach MyBasePlayerPawn.OverlappingActors(Class'LPPlayerPawn', LPP, MyPlayerPawn.TuneDataPlayerPawn.MaxDistanceCandidateForChoreography)
    {
        // End:0x439
        if((((((((LPP == MyBasePlayerPawn) || !LPP.IsAliveAndWell()) || !LPP.IsValidMeleeTargetNonCombatWindow()) || !LPP.IsValidEnemyTargetFor(PlayerReplicationInfo, true)) || int(LPP.GetTeamNum()) == int(MyBasePlayerPawn.GetTeamNum())) || LPP.IsInCover()) || LPP.IsDoingASpecialMove() && !LPP.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_MeleeTakedownAllowed, MyBasePlayerPawn)) || LPP.HasDamageImmunityWithEffects())
        {
            continue;            
        }
        // End:0x494
        if(MyPlayerPawn.IsPawnAMeleeTakedownTarget(LPP, KillerFacingRot, FrontDotProductWindow, RearDotProductWindow, Dist))
        {
            ++iValid;
        }        
    }    
    // End:0x539
    if(iValid != 0)
    {
        // End:0x536
        if(!myLPHUD.IsMessageLayerActive(8))
        {
            myLPHUD.DisplayHUDMessageLayer(8, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_MeleeTakedown>");
        }        
    }
    else
    {
        myLPHUD.RemoveMessageLayer(8);
    }
    //return;    
}

reliable server final event ServerNotifyRepairMinigameCompleted()
{
    local /*0x97E50000-0x00000000*/ private @NULL SM;

    // End:0x76
    if(MySPPawn != none)
    {
        // End:0x76
        if(IsDoingSpecialMove(Class'LPSM_PlayerRepairMinigame'))
        {
            SM = LPSM_PlayerRepairMinigame(MySPPawn.GetCurrentSpecialMoveInstance());
            SM.NotifyCompletedEarly();
        }
    }
    //return;    
}

simulated function NotifyHostMigrationStarted()
{
    super(SPPlayerController).NotifyHostMigrationStarted();
    //return;    
}

reliable client simulated function ClientRegisterWithParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    ServerSetPartyOwner(MPMgr.PartyOwnerNetId);
    //return;    
}

reliable server function ServerSetPartyOwner()
{
    local /*0x97E50000-0x00000000*/ private @NULL PartyOwnerUniqueId[8388609], PRI;

    PRI = LPPRI(PlayerReplicationInfo);
    // End:0x72
    if(PRI != none)
    {
        PRI.PartyOwnerUniqueId = PartyOwnerUniqueId;
        PRI.RegisterPlayerWithParty();
    }
    //return;    
}

function SendPartyMembersBackToParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI, PC, ZeroId, MPMgr;
    local /*0x97E50000-0x00000000*/ private byte LoginStatus;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0xA2
    if(EqualEqual_UniqueNetIdUniqueNetId(PlayerReplicationInfo.UniqueId, ZeroId) || MPMgr.SessionNameGame == MPMgr.SessionNameParty)
    {
        return;
    }
    // End:0x147
    if((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.PlayerInterface, OnlinePlayerInterface(none)))
    {
        LoginStatus = OnlineSub.PlayerInterface.GetLoginStatus(byte(MPMgr.OwningControllerIndex));
    }
    // End:0x15D
    if(int(LoginStatus) != int(2))
    {
        return;
    }
    // End:0x24B
    foreach WorldInfo.AllControllers(Class'LPPlayerController', PC)
    {
        // End:0x24A
        if(PC != self)
        {
            PRI = LPPRI(PC.PlayerReplicationInfo);
            // End:0x24A
            if((PRI != none) && EqualEqual_UniqueNetIdUniqueNetId(PRI.PartyOwnerUniqueId, PlayerReplicationInfo.UniqueId))
            {
                PC.ClientReturnToPartyLeader();
            }
        }        
    }    
    //return;    
}

function DisconnectPartyMembersFromParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI, PC, ZeroId, MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0xA2
    if(EqualEqual_UniqueNetIdUniqueNetId(PlayerReplicationInfo.UniqueId, ZeroId) || MPMgr.SessionNameGame == MPMgr.SessionNameParty)
    {
        return;
    }
    // End:0x190
    foreach WorldInfo.AllControllers(Class'LPPlayerController', PC)
    {
        // End:0x18F
        if(PC != self)
        {
            PRI = LPPRI(PC.PlayerReplicationInfo);
            // End:0x18F
            if((PRI != none) && EqualEqual_UniqueNetIdUniqueNetId(PRI.PartyOwnerUniqueId, PlayerReplicationInfo.UniqueId))
            {
                PC.ClientCreateParty();
            }
        }        
    }    
    //return;    
}

reliable client simulated function ClientCreateParty()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    MPMgr.CreateParty();
    //return;    
}

reliable client simulated function ClientSetPresenseInviteMode()
{
    local /*0x97E50000-0x00000000*/ private byte Mode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    MPMgr.SetPresenceInviteMode(Mode, false);
    MPMgr.SetPlayerOnlineStatus(MPMgr.OwningControllerIndex, 2);
    //return;    
}

function testerrorOnOptionSelected()
{
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int SelectedButtonIndex[8388609], PlayerIndex;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(SelectedButtonIndex == 0)
    {        
    }
    else
    {
        // End:0x21
        if(SelectedButtonIndex == 1)
        {
        }
    }
    return true;
    //return ReturnValue;    
}

exec function DisplayMem()
{
    //return;    
}

exec function testerrormessage()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array ButtonTitles;

    ButtonTitles.AddItem("<Strings:SPGameUI.CalloutButtonText.Yes>");    
    ButtonTitles.AddItem("<Strings:SPGameUI.CalloutButtonText.No>");    
    Class'LPUIManager'.static.ShowUIMessage('MyMessageTag', "<Strings:SPGameUI.MessageBoxErrorStrings.NoDevice_Title>", "<Strings:SPGameUI.MessageBoxErrorStrings.NoDevice_Message>", ButtonTitles, testerrorOnOptionSelected);
    //return;    
}

exec function testclear()
{
    Class'LPUIManager'.static.ClearUIMessage('LostLiveConnection_Message');
    //return;    
}

exec function testclearall()
{
    Class'LPUIManager'.static.CloseAllUIMessageBoxes();
    //return;    
}

event KickWarning()
{
    ClientShowKickWarning();
    //return;    
}

reliable client simulated function ClientShowKickWarning()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array OptionArray;
    local /*0x97E50000-0x00000000*/ private @NULL KickWarningMovie;

    OptionArray.Length = 0;
    ClosePauseMenu();
    Class'SPEngine.SPUIManager'.static.ShowUIMessage('KickWarning', Class'SPEngine.SPUtil'.static.GetLocalizedString("<Strings:LostPlanetGame.FrontEnd.NoSaveWarningTitle>"), Class'Engine.GameMessage'.default.KickWarning, OptionArray,,, KickWarningMovie,,,,,,, OnKickWarningMessageOpen);
    // End:0x10C
    if(KickWarningMovie != none)
    {
        KickWarningMovie.bCaptureInput = false;
    }
    SetTimer(0.5000000, false, 'ClearKickWarning');
    //return;    
}

function ClearKickWarning()
{
    Class'SPEngine.SPUIManager'.static.ClearUIMessage('KickWarning');
    //return;    
}

function OnKickWarningMessageOpen()
{
    local /*0x97E50000-0x00000000*/ private @NULL KickWarningMovie[8388609];

    // End:0x23
    if(!IsTimerActive('ClearKickWarning'))
    {
        ClearKickWarning();
    }
    //return;    
}

function OkToStartPlaying()
{
    //return;    
}

function CheckEnterStartState()
{
    local /*0x97E50000-0x00000000*/ private int SecondsUntilGameStarts;

    // End:0x71
    if(((int(Role) == int(ROLE_Authority)) && IsLocalPlayerController()) && !bGameStarted)
    {
        LPGRI_Base_MP(WorldInfo.GRI).StartGameStartCountdown();
    }
    SecondsUntilGameStarts = LPGRI_Base_MP(WorldInfo.GRI).SecondsUntilGameStarts;
    // End:0x102
    if(SecondsUntilGameStarts == 0)
    {
        EnterStartState();
        // End:0xF3
        if(!bGameStarted)
        {
            MPStartState('PlayerWalking');
        }
        bGameStarted = true;        
    }
    else
    {
        MPStartState('WaitingForGameStart');
    }
    //return;    
}

function onNotifySecondsUntilGameStarts()
{
    local /*0x97E50000-0x00000000*/ private int SecondsUntilGameStarts[8388609];

    //return;    
}

function TimeoutWaitingForJoinInProgressPlayer()
{
    //return;    
}

function UpdateStateFromAdjustment()
{
    local /*0x97E50000-0x00000000*/ private name NewState[8388609];

    // End:0x13
    if(GetStateName() == NewState)
    {
        return;
    }
    switch(NewState)
    {
        // End:0x32
        case 'InflateThermalPost':
        // End:0x3E
        case 'PrepareReviveIncapacitated':
        // End:0x4A
        case 'PlantBombState':
        // End:0x56
        case 'DisarmBombState':
        // End:0x62
        case 'Incapacitated':
        // End:0x6E
        case 'PlayerMantle':
        // End:0x7A
        case 'PlayerTakingCover':
        // End:0x86
        case 'PlayerZipline':
        // End:0x92
        case 'PlayerRolling':
        // End:0x9E
        case 'GrappleDownScooch':
        // End:0xAA
        case 'PlayerGrapplingDown':
        // End:0xB6
        case 'PlayerGrappling':
        // End:0xC4
        case 'ServerWaitForJoinInProgressPlayer':
            return;
        // End:0xFFFF
        default:
            super(PlayerController).UpdateStateFromAdjustment(NewState);
            //return;
            break;
    }    
}

function OnLinkStatusChange()
{
    local /*0x97E50000-0x00000000*/ private bool bIsConnected[8388609];

    // End:0x0F
    if(IsAtTitleScreen())
    {
        return;
    }
    super(SPPlayerController).OnLinkStatusChange(bIsConnected);
    //return;    
}

function OnConnectionStatusChange()
{
    local /*0x97E50000-0x00000000*/ private byte ConnectionStatus[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr, WI;

    // End:0x0F
    if(IsAtTitleScreen())
    {
        return;
    }
    switch(ConnectionStatus)
    {
        // End:0x27
        case 2:
        // End:0x2C
        case 3:
        // End:0x31
        case 4:
        // End:0x36
        case 5:
        // End:0x37A
        case 6:
            MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
            WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
            // End:0x37A
            if((int(WI.NetMode) != int(NM_Standalone)) && !MPMgr.CheckIsPlayerOnline(MPMgr.OwningControllerIndex))
            {
                // End:0x1D7
                if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
                {
                    DisplayReturnToTitleError("<Strings:SPGameUI.MessageBoxErrorStrings.LostPSNConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.PSN_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>", true);                    
                }
                else
                {
                    // End:0x2B9
                    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1))
                    {
                        DisplayReturnToTitleError("<Strings:SPGameUI.MessageBoxErrorStrings.LostLiveConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.XboxLive_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>", true);                        
                    }
                    else
                    {
                        DisplayReturnToTitleError("<Strings:SPGameUI.MessageBoxErrorStrings.LostInternetConnection_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.Internet_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>", true);
                    }
                }
                return;
            }
        // End:0xFFFF
        default:
            super(SPPlayerController).OnConnectionStatusChange(ConnectionStatus);
            //return;
            break;
    }    
}

function OnLoginChanged()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL WI, MPManager;

    bPlayerStorageRead = false;
    bProfileHasBeenLoaded = false;
    bProfileSettingsUpdated = true;
    // End:0x42
    if((IsAtTitleScreen()) || IsAttemptingGamespyLogin())
    {
        return;
    }
    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    MPManager = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x111
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(1) || int(NewStatus) == int(0))
    {
        MPManager.KickPartyMembers();
        MPManager.KickNonPartyMembers();
    }
    // End:0x4DB
    if(int(NewStatus) == int(0))
    {
        // End:0x218
        if(int(WI.NetMode) == int(NM_Standalone))
        {
            DisplayReturnToTitleError("<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>", true);            
        }
        else
        {
            // End:0x318
            if(Class'Engine.WorldInfo'.static.IsConsoleBuild(NM_ListenServer))
            {
                DisplayReturnToTitleError("<Strings:SPGameUI.MessageBoxErrorStrings.NeedProfileForMultiplayerPSN_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.NeedProfileForMultiplayerPSN_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>", true);                
            }
            else
            {
                // End:0x406
                if(Class'Engine.WorldInfo'.static.IsConsoleBuild(NM_DedicatedServer))
                {
                    DisplayReturnToTitleError("<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>", true);                    
                }
                else
                {
                    DisplayReturnToTitleError("<Strings:SPGameUI.MessageBoxErrorStrings.NeedProfileForMultiplayer_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.NeedProfileForMultiplayer_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>", true);
                }
            }
        }
        return;
    }
    // End:0x5D9
    if(!Class'Engine.WorldInfo'.static.IsConsoleBuild(NM_ListenServer) && HasSigninChanged())
    {
        DisplayReturnToTitleError("<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>", true);
        return;
    }
    // End:0x6C6
    if(Class'Engine.WorldInfo'.static.IsConsoleBuild(NM_DedicatedServer))
    {
        DisplayReturnToTitleError("<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.IllegalSigninChange_Title>", "<Strings:SPGameUI.CalloutButtonText.Continue>", true);
        return;
    }
    super(SPPlayerController).OnLoginChanged(NewStatus);
    //return;    
}

function IsAtTitleScreen()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SetOnlineStatusHACK()
{
    local /*0x97E50000-0x00000000*/ private @NULL LP, MPMgr;

    LP = LocalPlayer(Player);
    // End:0x2D
    if(LP == none)
    {
        return;
    }
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    MPMgr.SetPlayerOnlineStatus(LP.ControllerId, 4);
    //return;    
}

reliable client simulated function ClientSetOnlineStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL LP, MPMgr;

    LP = LocalPlayer(Player);
    // End:0x2D
    if(LP == none)
    {
        return;
    }
    ClearTimer('SetOnlineStatusHACK');
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0xB8
    if(IsAtTitleScreen())
    {
        MPMgr.SetPlayerOnlineStatus(LP.ControllerId, 0);        
    }
    else
    {
        // End:0x107
        if(IsMenuPC())
        {
            MPMgr.SetPlayerOnlineStatus(LP.ControllerId, 2);            
        }
        else
        {
            // End:0x1A9
            if(int(WorldInfo.NetMode) != int(NM_Standalone))
            {
                MPMgr.SetPlayerOnlineStatus(LP.ControllerId, 4);
                // End:0x1A6
                if(Class'Engine.WorldInfo'.static.IsConsoleBuild(2))
                {
                    SetTimer(60.0000000, false, 'SetOnlineStatusHACK');
                }                
            }
            else
            {
                MPMgr.SetPlayerOnlineStatus(LP.ControllerId, 5);
            }
        }
    }
    //return;    
}

function HasSigninChanged()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr, ZeroId;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0xB9
    if(EqualEqual_UniqueNetIdUniqueNetId(MPMgr.OwningNetId, ZeroId))
    {
        MPMgr.OwningNetId = MPMgr.GetUniqueNetId(MPMgr.OwningControllerIndex);
    }
    // End:0x151
    if(NotEqual_UniqueNetIdUniqueNetId(MPMgr.OwningNetId, ZeroId) && !Class'Engine.OnlineSubsystem'.static.AreUniqueNetIdsEqual(MPMgr.OwningNetId, PlayerReplicationInfo.UniqueId))
    {
        return true;
    }
    return super(SPPlayerController).HasSigninChanged();
    //return ReturnValue;    
}

reliable client simulated event ClientMutePlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId[8388609], LocPlayer, MPMgr;
    local /*0x97E50000-0x00000000*/ private int VoiceChatInfoIndexThisPlayer;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL VoiceInfo, LocNetId;

    LocPlayer = LocalPlayer(Player);
    // End:0x56
    if(PlayerReplicationInfo != none)
    {
        LocNetId = PlayerReplicationInfo.UniqueId;        
    }
    else
    {
        // End:0x8E
        if(LocPlayer != none)
        {
            LocNetId = LocPlayer.GetUniqueNetId();
        }
    }
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    VoiceChatInfoIndexThisPlayer = MPMgr.FindVoiceChatInfoIndex(LocNetId);
    // End:0x157
    if(VoiceChatInfoIndexThisPlayer == -1)
    {
        VoiceInfo.UniqueId = LocNetId;
        VoiceChatInfoIndexThisPlayer = MPMgr.VoiceChatInfoList.AddItem(VoiceInfo);        
    }
    // End:0x20D
    if(MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.Find('Uid', PlayerNetId.Uid) == )
    {        
        MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.AddItem(PlayerNetId);        
    }
    // End:0x286
    if(NotEqual_InterfaceInterface(VoiceInterface, OnlineVoiceInterface(none)))
    {
        // End:0x286
        if(LocPlayer != none)
        {
            VoiceInterface.MuteRemoteTalker(byte(LocPlayer.ControllerId), PlayerNetId, false);
        }
    }
    //return;    
}

reliable client simulated event ClientUnmutePlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId[8388609], LocPlayer;
    local /*0x97E50000-0x00000000*/ private int RemoveIndex;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;
    local /*0x97E50000-0x00000000*/ private int VoiceChatInfoIndexThisPlayer;
    local /*0x97E50000-0x00000000*/ private @NULL LocNetId;

    LocPlayer = LocalPlayer(Player);
    // End:0x56
    if(PlayerReplicationInfo != none)
    {
        LocNetId = PlayerReplicationInfo.UniqueId;        
    }
    else
    {
        // End:0x8E
        if(LocPlayer != none)
        {
            LocNetId = LocPlayer.GetUniqueNetId();
        }
    }
    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    VoiceChatInfoIndexThisPlayer = MPMgr.FindVoiceChatInfoIndex(LocNetId);
    // End:0x1C7
    if(VoiceChatInfoIndexThisPlayer != -1)
    {
        RemoveIndex = MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.Find('Uid', PlayerNetId.Uid);        
        // End:0x1C4
        if(RemoveIndex != -1)
        {
            MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.Remove(RemoveIndex, 1);            
        }        
    }
    // End:0x240
    if(NotEqual_InterfaceInterface(VoiceInterface, OnlineVoiceInterface(none)))
    {
        // End:0x240
        if(LocPlayer != none)
        {
            VoiceInterface.UnmuteRemoteTalker(byte(LocPlayer.ControllerId), PlayerNetId, false);
        }
    }
    RemoveIndex = MPMgr.LocallyInitiatedVoiceMuteList.Find('Uid', PlayerNetId.Uid);    
    // End:0x2CE
    if(RemoveIndex != -1)
    {
        MPMgr.LocallyInitiatedVoiceMuteList.Remove(RemoveIndex, 1);        
    }
    //return;    
}

function GameplayMutePlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId[8388609], MPMgr;
    local /*0x97E50000-0x00000000*/ private int VoiceChatInfoIndexThisPlayer;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL VoiceInfo;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    VoiceChatInfoIndexThisPlayer = MPMgr.FindVoiceChatInfoIndex(PlayerReplicationInfo.UniqueId);
    // End:0xF3
    if(VoiceChatInfoIndexThisPlayer == -1)
    {
        VoiceInfo.UniqueId = PlayerReplicationInfo.UniqueId;
        VoiceChatInfoIndexThisPlayer = MPMgr.VoiceChatInfoList.AddItem(VoiceInfo);        
    }
    // End:0x145
    if(GameplayVoiceMuteList.Find('Uid', PlayerNetId.Uid) == )
    {        
        GameplayVoiceMuteList.AddItem(PlayerNetId);        
    }
    // End:0x1FB
    if(MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.Find('Uid', PlayerNetId.Uid) == )
    {        
        MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.AddItem(PlayerNetId);        
    }
    ClientMutePlayer(PlayerNetId);
    //return;    
}

function GameplayUnmutePlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId[8388609];
    local /*0x97E50000-0x00000000*/ private int RemoveIndex, VoiceChatInfoIndexThisPlayer, VoiceChatInfoIndexOtherPlayer;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    RemoveIndex = GameplayVoiceMuteList.Find('Uid', PlayerNetId.Uid);    
    // End:0x8D
    if(RemoveIndex != -1)
    {
        GameplayVoiceMuteList.Remove(RemoveIndex, 1);        
    }
    VoiceChatInfoIndexThisPlayer = MPMgr.FindVoiceChatInfoIndex(PlayerReplicationInfo.UniqueId);
    VoiceChatInfoIndexOtherPlayer = MPMgr.FindVoiceChatInfoIndex(PlayerNetId);
    // End:0x119
    if(VoiceChatInfoIndexThisPlayer == -1)
    {
    }
    // End:0x12C
    if(VoiceChatInfoIndexOtherPlayer == -1)
    {
    }
    // End:0x33A
    if(((VoiceChatInfoIndexThisPlayer == -1) || MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoiceMuteList.Find('Uid', PlayerNetId.Uid) == ) && )
    {
        (VoiceChatInfoIndexOtherPlayer == -1) || MPMgr.VoiceChatInfoList[VoiceChatInfoIndexOtherPlayer].VoiceMuteList.Find('Uid', PlayerReplicationInfo.UniqueId.Uid) == ;                
        // End:0x324
        if(VoiceChatInfoIndexThisPlayer != -1)
        {
            RemoveIndex = MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.Find('Uid', PlayerNetId.Uid);            
            // End:0x324
            if(RemoveIndex != -1)
            {
                MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.Remove(RemoveIndex, 1);                
            }
        }
        ClientUnmutePlayer(PlayerNetId);        
    }
    //return;    
}

reliable server event ServerMutePlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId[8388609], Other;
    local /*0x97E50000-0x00000000*/ private int VoiceChatInfoIndexThisPlayer, VoiceChatInfoIndexOtherPlayer;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr, VoiceInfo;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    VoiceChatInfoIndexThisPlayer = MPMgr.FindVoiceChatInfoIndex(PlayerReplicationInfo.UniqueId);
    // End:0xF3
    if(VoiceChatInfoIndexThisPlayer == -1)
    {
        VoiceInfo.UniqueId = PlayerReplicationInfo.UniqueId;
        VoiceChatInfoIndexThisPlayer = MPMgr.VoiceChatInfoList.AddItem(VoiceInfo);        
    }
    // End:0x1A9
    if(MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoiceMuteList.Find('Uid', PlayerNetId.Uid) == )
    {        
        MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoiceMuteList.AddItem(PlayerNetId);        
    }
    // End:0x25F
    if(MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.Find('Uid', PlayerNetId.Uid) == )
    {        
        MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.AddItem(PlayerNetId);        
    }
    ClientMutePlayer(PlayerNetId);
    VoiceChatInfoIndexOtherPlayer = MPMgr.FindVoiceChatInfoIndex(PlayerNetId);
    // End:0x312
    if(VoiceChatInfoIndexOtherPlayer == -1)
    {
        VoiceInfo.UniqueId = PlayerNetId;
        VoiceChatInfoIndexOtherPlayer = MPMgr.VoiceChatInfoList.AddItem(VoiceInfo);        
    }
    // End:0x3F2
    if(MPMgr.VoiceChatInfoList[VoiceChatInfoIndexOtherPlayer].VoicePacketFilter.Find('Uid', PlayerReplicationInfo.UniqueId.Uid) == )
    {        
        MPMgr.VoiceChatInfoList[VoiceChatInfoIndexOtherPlayer].VoicePacketFilter.AddItem(PlayerReplicationInfo.UniqueId);        
    }
    Other = GetPlayerControllerFromNetId(PlayerNetId);
    // End:0x45B
    if(Other != none)
    {
        Other.ClientMutePlayer(PlayerReplicationInfo.UniqueId);
    }
    //return;    
}

reliable server event ServerUnmutePlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId[8388609], Other;
    local /*0x97E50000-0x00000000*/ private int VoiceChatInfoIndexThisPlayer, VoiceChatInfoIndexOtherPlayer, ThisPlayersIndexInOthersMuteList, RemoveIndex;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    VoiceChatInfoIndexThisPlayer = MPMgr.FindVoiceChatInfoIndex(PlayerReplicationInfo.UniqueId);
    // End:0x14E
    if(VoiceChatInfoIndexThisPlayer != -1)
    {
        RemoveIndex = MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoiceMuteList.Find('Uid', PlayerNetId.Uid);        
        // End:0x14B
        if(RemoveIndex != -1)
        {
            MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoiceMuteList.Remove(RemoveIndex, 1);            
        }        
    }
    VoiceChatInfoIndexOtherPlayer = MPMgr.FindVoiceChatInfoIndex(PlayerNetId);
    // End:0x1A5
    if(VoiceChatInfoIndexOtherPlayer == -1)
    {
        ThisPlayersIndexInOthersMuteList = -1;        
    }
    else
    {
        ThisPlayersIndexInOthersMuteList = MPMgr.VoiceChatInfoList[VoiceChatInfoIndexOtherPlayer].VoiceMuteList.Find('Uid', PlayerReplicationInfo.UniqueId.Uid);        
    }
    Other = GetPlayerControllerFromNetId(PlayerNetId);
    // End:0x53B
    if(Other != none)
    {
        // End:0x2B8
        if((GameplayVoiceMuteList.Find('Uid', PlayerNetId.Uid) == ) && )
        {
            ThisPlayersIndexInOthersMuteList == -1;            
            ClientUnmutePlayer(PlayerNetId);
        }
        // End:0x53B
        if((ThisPlayersIndexInOthersMuteList == -1) && Other.GameplayVoiceMuteList.Find('Uid', PlayerReplicationInfo.UniqueId.Uid) == )
        {            
            // End:0x40E
            if(VoiceChatInfoIndexThisPlayer != -1)
            {
                RemoveIndex = MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.Find('Uid', PlayerNetId.Uid);                
                // End:0x40E
                if(RemoveIndex != -1)
                {
                    MPMgr.VoiceChatInfoList[VoiceChatInfoIndexThisPlayer].VoicePacketFilter.Remove(RemoveIndex, 1);                    
                }
            }
            // End:0x4FE
            if(VoiceChatInfoIndexOtherPlayer != -1)
            {
                RemoveIndex = MPMgr.VoiceChatInfoList[VoiceChatInfoIndexOtherPlayer].VoicePacketFilter.Find('Uid', PlayerReplicationInfo.UniqueId.Uid);                
                // End:0x4FE
                if(RemoveIndex != -1)
                {
                    MPMgr.VoiceChatInfoList[VoiceChatInfoIndexOtherPlayer].VoicePacketFilter.Remove(RemoveIndex, 1);                    
                }
            }
            Other.ClientUnmutePlayer(PlayerReplicationInfo.UniqueId);
        }
    }
    //return;    
}

function MutePlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId[8388609], LP, MPMgr;
    local /*0x97E50000-0x00000000*/ private bool bIs360Build;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x3A
    if(MPMgr == none)
    {
        return;
    }
    LP = LocalPlayer(Player);
    // End:0x1E2
    if(LP != none)
    {
        bIs360Build = Class'Engine.WorldInfo'.static.IsConsoleBuild(1);
        // End:0x12F
        if((bUseSystemWideMuting == false) || bIs360Build == false)
        {
            // End:0x12F
            if(MPMgr.LocallyInitiatedVoiceMuteList.Find('Uid', PlayerNetId.Uid) == )
            {                
                MPMgr.LocallyInitiatedVoiceMuteList.AddItem(PlayerNetId);                
            }
        }
        // End:0x1CC
        if(NotEqual_InterfaceInterface(OnlineSub.VoiceInterface, OnlineVoiceInterface(none)))
        {
            OnlineSub.VoiceInterface.MuteRemoteTalker(byte(LP.ControllerId), PlayerNetId, bUseSystemWideMuting);
        }
        ServerMutePlayer(PlayerNetId);        
    }
    //return;    
}

function UnmutePlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerNetId[8388609], LP;
    local /*0x97E50000-0x00000000*/ private int RemoveIndex;
    local /*0x97E50000-0x00000000*/ private @NULL MPMgr;
    local /*0x97E50000-0x00000000*/ private bool bIs360Build;

    MPMgr = Class'LPMultiplayerManager'.static.GetInstance();
    // End:0x3A
    if(MPMgr == none)
    {
        return;
    }
    // End:0x54
    if(LocalPlayer(Player) == none)
    {
        return;
    }
    RemoveIndex = MPMgr.LocallyInitiatedVoiceMuteList.Find('Uid', PlayerNetId.Uid);    
    // End:0xE2
    if(RemoveIndex != -1)
    {
        MPMgr.LocallyInitiatedVoiceMuteList.Remove(RemoveIndex, 1);        
    }
    LP = LocalPlayer(Player);
    // End:0x1FA
    if(LP != none)
    {
        bIs360Build = Class'Engine.WorldInfo'.static.IsConsoleBuild(1);
        // End:0x1FA
        if((NotEqual_InterfaceInterface(OnlineSub.VoiceInterface, OnlineVoiceInterface(none)) && bUseSystemWideMuting == true) && bIs360Build == true)
        {
            OnlineSub.VoiceInterface.UnmuteRemoteTalker(byte(LP.ControllerId), PlayerNetId, bUseSystemWideMuting);
        }
    }
    ServerUnmutePlayer(PlayerNetId);
    //return;    
}

function PauseGamePlayersOnly()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL currentNpc, currentPPawn;

    // End:0x54
    foreach WorldInfo.AllControllers(Class'LPAIController', currentNpc)
    {
        currentNpc.NotifyPlayersOnly();        
    }    
    // End:0xAB
    foreach WorldInfo.AllPawns(Class'LPBasePlayerPawn', currentPPawn)
    {
        currentPPawn.NotifyPlayersOnly();        
    }    
    // End:0x146
    if(!bPause)
    {
        WorldInfo.bPlayersOnlyPending = false;
        // End:0x143
        if(WorldInfo.bPlayersOnly || WorldInfo.bPlayersOnlyPending)
        {
            WorldInfo.bPlayersOnly = false;
        }        
    }
    else
    {
        WorldInfo.bPlayersOnlyPending = true;
    }
    //return;    
}

function CanPlayAudioMessage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CanPlayMessageType(true);
    //return ReturnValue;    
}

function CanPlayVideoMessage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CanPlayMessageType(false);
    //return ReturnValue;    
}

function CanPlayMessageType()
{
    local /*0x97E50000-0x00000000*/ private bool bAudioMessage[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL TD, Mode, LPP;
    local /*0x97E50000-0x00000000*/ private name CurrentMode;

    // End:0x11
    if(SoundModeManager == none)
    {
        return false;
    }
    LPP = MyPlayerPawn;
    // End:0x4F
    if(LPP == none)
    {
        LPP = LPPlayerPawn(HumanPlayerPawn);
    }
    // End:0x60
    if(LPP == none)
    {
        return false;
    }
    TD = LPP.TuneDataPlayerPawn;
    // End:0x99
    if(TD == none)
    {
        return true;
    }
    CurrentMode = SoundModeManager.FindBestSoundMode();
    // End:0x12F
    if(bAudioMessage)
    {
        // End:0x12B
        foreach TD.SoundModesWhichPreventAudioLogs(Mode)
        {
            // End:0x12A
            if(Mode.Name == CurrentMode)
            {                
                return false;
            }            
        }                
    }
    else
    {
        // End:0x18B
        foreach TD.SoundModesWhichPreventVideoLogs(Mode)
        {
            // End:0x18A
            if(Mode.Name == CurrentMode)
            {                
                return false;
            }            
        }        
    }
    return true;
    //return ReturnValue;    
}

function SetupPausedSubtitlesAndAudioTimer()
{
    PauseActiveSubtitles(true);
    AllowSubtitlesDuringPause(true);
    WorldInfo.StoreAudioTimerDuringPause();
    //return;    
}

function ShutdownPausedSubtitlesAndAudioTimer()
{
    local /*0x97E50000-0x00000000*/ private float fTimeDiff;

    AllowSubtitlesDuringPause(false);
    fTimeDiff = 0.0000000;
    // End:0x84
    if(WorldInfo.bAdvanceAudioTimeDuringPause)
    {
        fTimeDiff = WorldInfo.AudioTimeSeconds - WorldInfo.StoredAudioTimeSeconds;
    }
    PauseActiveSubtitles(false, -1.0000000 * fTimeDiff);
    WorldInfo.RestoreAudioTimerDuringPause();
    //return;    
}

function OnExternalUIChanged()
{
    local /*0x97E50000-0x00000000*/ private bool bIsOpening[8388609];

    // End:0x35
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        ClearQueuedOnExternalUIChangedPause();
        return;
    }
    super(SPPlayerController).OnExternalUIChanged(bIsOpening);
    //return;    
}

function ClosePauseMenu()
{
    // End:0xB5
    if((SPHUDGFx(myHUD).GFxFlashMovieInstancePauseMenu != none) && SPHUDGFx(myHUD).GFxFlashMovieInstancePauseMenu.bMovieIsOpen)
    {
        LPGFxMoviePlayerPauseMenu(SPHUDGFx(myHUD).GFxFlashMovieInstancePauseMenu).PauseMenuClose();
    }
    //return;    
}

function DelayedDestroy()
{
    local /*0x97E50000-0x00000000*/ private float Seconds[8388609];

    LastActiveTime = WorldInfo.TimeSeconds;
    SetTimer(Seconds, false, 'DelayedDestroyTimeout', self);
    //return;    
}

function DelayedDestroyTimeout()
{
    Destroy();
    //return;    
}

reliable client simulated function ClientGameFullError()
{
    ClientReturnToMPLobby("<Strings:SPGameUI.MessageBoxErrorStrings.JoinFailNoSpace_Message>", "<Strings:SPGameUI.MessageBoxErrorStrings.JoinFail_Title>");
    //return;    
}

reliable client simulated function ClientStartOnlineGame()
{
    // End:0xBB
    if((((OnlineSub != none) && NotEqual_InterfaceInterface(OnlineSub.GameInterface, OnlineGameInterface(none))) && IsPrimaryPlayer()) && PlayerReplicationInfo != none)
    {
        OnlineSub.GameInterface.StartOnlineGame(PlayerReplicationInfo.SessionName);
        return;
    }
    SetTimer(0.5000000, false, 'ClientStartOnlineGame', self);
    //return;    
}

function CleanupPRI()
{
    // End:0x32
    if(PlayerReplicationInfo != none)
    {
        PlayerReplicationInfo.Destroy();
        PlayerReplicationInfo = none;
    }
    //return;    
}

simulated state PlayerInShop
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        ReleaseHeldButtons();
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        //return;        
    }

    function ShopFinished()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

        ClearLatentAction(Action.Class);
        GotoState('PlayerWalking');
        //return;        
    }

    function CanOpenJobLog()
    {
        local /*0x97E50000-0x00000000*/ private bool bForceSpecialMove[9437185], ReturnValue;

        return false;
        //return ReturnValue;        
    }
    stop;    
}

state PlayerRoll
{
    ignores PrevWeapon, SwitchToBestWeapon;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        TriggerEventClass(Class'LPSeqEvent_PlayerRolled', none);
        // End:0x58
        if(IsAimingDownSight())
        {
            MyBasePlayerPawn.SetDepthPriorityGroup(1);
        }
        SetRollCam(true);
        ClearAmmoTypeSwitch();
        HideCrosshair(true);
        PauseFire();
        bWantsNextWeapon = false;
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0xBD
        if(((Pawn != none) && !Pawn.bDeleteMe) && !Pawn.IsInState('Dying'))
        {
            SetRollCam(false);
            // End:0xBA
            if(ExtinguishIncendiaryDOT())
            {
                LPPRI(PlayerReplicationInfo).GiveAward('Emblem_StopDropRoll');
            }            
        }
        else
        {
            SetDefaultCam();
        }
        UnPauseFire();
        HideCrosshair(false);
        // End:0x115
        if(SpecialDodgeActorDodged != none)
        {
            LPAIPawn(SpecialDodgeActor).NotifyThatSpecialDodgeReady(none);
        }
        SpecialDodgeActorDodged = none;
        //return;        
    }

    exec function NextWeapon()
    {
        // End:0x35
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            bWantsNextWeapon = true;
        }
        //return;        
    }

    function IsRolling()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x1B
        if(IsDoingSpecialMove(Class'LPSM_PlayerDodgeBase'))
        {
            return false;            
        }
        else
        {
            return true;
        }
        //return ReturnValue;        
    }

    function OnRollSMFinished()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        EnterWalkState(true);
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        // End:0x31
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            GotoState('Dead');            
        }
        else
        {
            ViewRotation = Rotation;
            DeltaRot.Yaw = int(PlayerInput.aTurn);
            DeltaRot.Pitch = int(PlayerInput.aLookUp);
            ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
            ProcessPlayerMove_RootMotion(DeltaTime);
        }
        //return;        
    }

    simulated event HandleAnimNotifySpecialDodgeReady()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];

        // End:0x40
        if(SpecialDodgeActorDodged != none)
        {
            LPAIPawn(SpecialDodgeActor).NotifyThatSpecialDodgeReady(MyPlayerPawn);
        }
        //return;        
    }
    stop;    
}

state VSDash
{
    ignores WinchArmButtonPress;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x30
        if(MyBasePlayerPawn != none)
        {
            MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = true;
        }
        bDecelerateDash = false;
        DashAcceleration = LPTuneDataVSFuturePlayerPawn(LPVSFuturePlayerPawn(Pawn).TuneDataBasePawn).DashSpeed.GetValue();
        SetTimer(LPTuneDataVSFuturePlayerPawn(LPVSFuturePlayerPawn(Pawn).TuneDataBasePawn).DashDuration.GetValue(), false, 'DecelerateDash');
        bIsVitalSuitExitLockedByCode = true;
        SPGFPawn(Pawn).SetMaxSpeedScale(1.0000000);
        // End:0x170
        if(IsLocalPlayerController())
        {
            myLPHUD.ShowVSDash(true);
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0xA5
        if(MyBasePlayerPawn != none)
        {
            MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = false;
            // End:0xA5
            if((MyBasePlayerPawn.GetCurrentSpecialMoveInstance() != none) && LPSM_VSFutureBoostBase(MyBasePlayerPawn.GetCurrentSpecialMoveInstance()) != none)
            {
                MyBasePlayerPawn.EndCurrentSpecialMove();
            }
        }
        bIsVitalSuitExitLockedByCode = false;
        SPGFPawn(Pawn).SetMaxSpeedScale(1.0000000);
        SetTimer(LPTuneDataVSFuturePlayerPawn(LPVSFuturePlayerPawn(Pawn).TuneDataBasePawn).DashCooldownTime.GetValue(), false, 'DashCooldownComplete');
        //return;        
    }

    function GetVSDashAcceleration()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], newAccel, X, Y, Z;

        GetAxes(Pawn.Rotation, X, Y, Z);
        newAccel = X * DashAcceleration;
        newAccel.Z = Pawn.Acceleration.Z;
        return newAccel;
        //return ReturnValue;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation, newAccel;

        ViewRotation = Rotation;
        DeltaRot.Yaw = 0;
        DeltaRot.Pitch = 0;
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x12E
        if(IsLocalPlayerController())
        {
            // End:0x11A
            if(bDecelerateDash)
            {
                DashAcceleration -= (DeltaTime * LPTuneDataVSFuturePlayerPawn(LPVSFuturePlayerPawn(Pawn).TuneDataBasePawn).DashDecelerationRate.GetValue());
                // End:0x11A
                if(DashAcceleration <= float(0))
                {
                    EndDash();
                }
            }
            newAccel = GetVSDashAcceleration();
        }
        // End:0x170
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, newAccel, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, newAccel, 0, rot(0, 0, 0));
        }
        //return;        
    }

    function DecelerateDash()
    {
        bDecelerateDash = true;
        //return;        
    }

    function EndDash()
    {
        LastVSDashTime = WorldInfo.TimeSeconds;
        EnterWalkState();
        //return;        
    }

    function IsDoingVSDash()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
    stop;    
}

state VSDashRight extends VSDash
{
    function GetVSDashAcceleration()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], newAccel, X, Y, Z;

        GetAxes(Pawn.Rotation, X, Y, Z);
        newAccel = Y * DashAcceleration;
        newAccel.Z = Pawn.Acceleration.Z;
        return newAccel;
        //return ReturnValue;        
    }
    stop;    
}

state VSDashLeft extends VSDash
{
    function GetVSDashAcceleration()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], newAccel, X, Y, Z;

        GetAxes(Pawn.Rotation, X, Y, Z);
        newAccel = -Y * DashAcceleration;
        newAccel.Z = Pawn.Acceleration.Z;
        return newAccel;
        //return ReturnValue;        
    }
    stop;    
}

state VSDashBack extends VSDash
{
    function GetVSDashAcceleration()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], newAccel, X, Y, Z;

        GetAxes(Pawn.Rotation, X, Y, Z);
        newAccel = -X * DashAcceleration;
        newAccel.Z = Pawn.Acceleration.Z;
        return newAccel;
        //return ReturnValue;        
    }
    stop;    
}

state VSDeployPlatform
{
    ignores WinchArmButtonPress;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        bIsVitalSuitExitLockedByCode = true;
        Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        LPPlayerPawn(HumanPlayerPawn).bDeployPlatform = true;
        // End:0x9E
        if(int(Role) == int(ROLE_Authority))
        {
            SetTimer(3.0000000, false, 'BeginDeploy');
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

        ClearTimer('BeginDeploy');
        bIsVitalSuitExitLockedByCode = false;
        vsPawn = LPVSPlayerPawn(Pawn);
        // End:0x95
        if(vsPawn != none)
        {
            LPPlayerPawn(HumanPlayerPawn).bDeployPlatform = false;
            vsPawn.SetPitchControllerLock(false);
        }
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function CanOpenJobLog()
    {
        local /*0x97E50000-0x00000000*/ private bool bForceSpecialMove[9437185], ReturnValue;

        return false;
        //return ReturnValue;        
    }

    function BeginDeploy()
    {
        local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

        vsPawn = LPVSPlayerPawn(Pawn);
        // End:0x1F0
        if(vsPawn != none)
        {
            ClearTimer('BeginDeploy');
            SetRotation(vsPawn.VSExtractInfo.Rotation);
            vsPawn.SetRotation(vsPawn.VSExtractInfo.Rotation);
            vsPawn.SetLocation((vsPawn.VSExtractInfo.Location * vect(1.0000000, 1.0000000, 0.0000000)) + (vsPawn.Location * vect(0.0000000, 0.0000000, 1.0000000)));
            vsPawn.SetPitchControllerTarget(-8192, 10.0000000);
            vsPawn.SetPitchControllerLock(true);
            DoSpecialMove(Class'LPSM_VSPlatformIn', true, false, OnTransformFinish, none);
            vsPawn.TriggerEventClass(Class'LPSeqEvent_VSExtractionState', self, 4);
        }
        //return;        
    }

    function OnTransformFinish()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM, vsPawn;

        bIsVitalSuitExitLockedByCode = false;
        vsPawn = LPVSPlayerPawn(Pawn);
        // End:0xB6
        if(vsPawn != none)
        {
            vsPawn.SetLocation(vsPawn.Location + (Vector(vsPawn.Rotation) * 100.0000000));
            vsPawn.SetPitchControllerLock(false);
        }
        ServerExitVS(true);
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation, NewRotation, vsPawn;
        local /*0x97E50000-0x00000000*/ private float TurnRate;

        vsPawn = LPVSPlayerPawn(Pawn);
        DeltaRot = rot(0, 0, 0);
        TurnRate = GetPawnYawRotationRate();
        NewRotation = vsPawn.Rotation;
        NewRotation.Yaw = fixedTurn(NewRotation.Yaw, vsPawn.VSExtractInfo.Rotation.Yaw, int(TurnRate * DeltaTime));
        vsPawn.SetRotation(NewRotation);
        Pawn.Acceleration = vsPawn.VSExtractInfo.Location - Pawn.Location;
        Pawn.Acceleration.Z = 0.0000000;
        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x2E4
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

state VSExitPlatform
{
    ignores WinchArmButtonPress;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

        super(SPStateObject).BeginState(PreviousStateName);
        bIsVitalSuitExitLockedByCode = true;
        vsPawn = LPVSPlayerPawn(Pawn);
        // End:0xA6
        if(vsPawn != none)
        {
            vsPawn.SetPitchControllerTarget(-8192, 0.0000000);
            vsPawn.SetPitchControllerLock(true);
            SetTimer(1.0000000, false, 'VSExit_CenterPitch');
        }
        Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        LPPlayerPawn(HumanPlayerPawn).bDeployPlatform = false;
        //return;        
    }

    function VSExit_CenterPitch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

        vsPawn = LPVSPlayerPawn(Pawn);
        // End:0x90
        if(vsPawn != none)
        {
            vsPawn.SetPitchControllerLock(false);
            vsPawn.SetPitchControllerTarget(0, 3.0000000);
            vsPawn.SetPitchControllerLock(true);
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

        bIsVitalSuitExitLockedByCode = false;
        vsPawn = LPVSPlayerPawn(Pawn);
        // End:0x7C
        if(vsPawn != none)
        {
            vsPawn.SetPitchControllerLock(false);
            vsPawn.SetPitchControllerTarget(0, 0.0000000);
        }
        super(SPStateObject).EndState(PreviousStateName);
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        // End:0x3B
        if(!SPPawn(Pawn).IsDoingASpecialMove())
        {
            GotoState('PlayerWalking');
        }
        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x144
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

state UsingVS
{
    ignores NextWeapon, PrevWeapon, SwitchToBestWeapon;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        ExtinguishIncendiaryDOT();
        SetAimDownSightMode(false);
        HideCrosshair(true);
        PauseFire();
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        UnPauseFire();
        //return;        
    }

    function MeleeMoveButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

        PlayerMoveInfo.bMeleeButtonPressed = false;
        //return;        
    }

    function IsRolling()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    event ApplyViewRotationConstraints()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL ViewRotation[25296897], DesiredFacing;

        ConstrainRotationFromAim(DeltaTime, ViewRotation, DesiredFacing);
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL newAccel, OldRotation, DeltaRot;

        // End:0x31
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            GotoState('Dead');            
        }
        else
        {
            newAccel = vect(0.0000000, 0.0000000, 0.0000000);
            OldRotation = Rotation;
            DeltaRot = rot(0, 0, 0);
            UpdateRotationFromView(DeltaTime, Rotation, DeltaRot);
            // End:0xE1
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, newAccel, 0, OldRotation - Rotation);                
            }
            else
            {
                ProcessMove(DeltaTime, newAccel, 0, OldRotation - Rotation);
            }
            PlayerMoveInfo.bEvadeButtonPressed = false;
            PlayerMoveInfo.bHookButtonPressed = false;
            PlayerMoveInfo.bMeleeButtonPressed = false;
        }
        //return;        
    }
    stop;    
}

state StruggleMode
{
    ignores NextWeapon, PrevWeapon, SwitchToBestWeapon, CallUpdateGrappleHookTargets, CallUpdateCurrentGrappleHookTarget, PostOnTeleport;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        PauseFire();
        ShowStruggleReticle(true);
        ClearAmmoTypeSwitch();
        SetGrappleHookCurrentTarget(none);
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        UnPauseFire();
        ShowStruggleReticle(false);
        Class'SPEngine.SPUtil'.static.SetIntegrateButtonSubSamples(true);
        // End:0xA4
        if((Pawn.Health > 0) && MainPlayerInput.IsButtonPressed(name("Fire")))
        {
            bFire = 1;
        }
        //return;        
    }

    function PerformedUseAction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    event CanStartKismetMessage()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x1A
        if(!super(SPPlayerController).CanStartKismetMessage(Action))
        {
            return false;
        }
        // End:0x3E
        if(Action.bWaitUntilYouCanDoIt)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    event IsMoveInputIgnored()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function CanAimDownSight()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function SetStruggleHUD()
    {
        local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

        // End:0x7D
        if(myLPHUD != none)
        {
            // End:0x7D
            if(bEnable && !myLPHUD.IsKismetMessageDone())
            {
                AbortKismetMessage(myLPHUD.KismetMessage.Action);
            }
        }
        //return;        
    }

    function SetAimingInRange()
    {
        local /*0x97E50000-0x00000000*/ private bool bInRange[8388609];

        // End:0x38
        if(myLPHUD != none)
        {
            myLPHUD.ToggleStruggleReticleInRange(bInRange);
        }
        //return;        
    }

    function StruggleStabPress()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;

        PlayerPawn = GetStruggleLeader();
        // End:0x77
        if(!PlayerPawn.InStruggleMode9PointAim)
        {
            PlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StruggleStabAttempt, self);
        }
        //return;        
    }

    function EvadeButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];
        local /*0x97E50000-0x00000000*/ private byte DodgeDirection;

        // End:0x8F
        if(SpecialDodgeActor != none)
        {
            DodgeDirection = ((PlayerInput.RawJoyRight < float(0)) ? 0 : 1);
            GetStruggleLeader().BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StruggleDodgeButton, self, int(DodgeDirection));
        }
        //return;        
    }

    function StruggleButtonPress()
    {
        GetStruggleLeader().BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StruggleButton, self);
        //return;        
    }

    function VSShieldBlockButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;

        PlayerPawn = GetStruggleLeader();
        // End:0x77
        if(!PlayerPawn.InStruggleMode9PointAim)
        {
            PlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StruggleVsBlockAttempt, self);
        }
        //return;        
    }

    function MeleeMoveButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

        PlayerMoveInfo.bMeleeButtonPressed = false;
        //return;        
    }

    simulated function DrawHUD()
    {
        local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

        // End:0x90
        if(StruggleButtonTexture != none)
        {
            H.Canvas.SetPos(50.0000000, 50.0000000);
            H.Canvas.DrawTexture(StruggleButtonTexture, 1.0000000);
        }
        global.DrawHUD(H);
        //return;        
    }

    function DrawDebugStruggle()
    {
        local /*0x97E50000-0x00000000*/ private @NULL smStruggleMode;

        smStruggleMode = GetStruggleLeaderSM();
        // End:0x4B
        if(smStruggleMode != none)
        {
            smStruggleMode.DrawDebug(myLPHUD);
        }
        //return;        
    }

    function GetStruggleLeaderSM()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LeaderPawn;

        LeaderPawn = GetStruggleLeader();
        // End:0x25
        if(LeaderPawn == none)
        {
            return none;
        }
        return LPSM_LeadStruggleMode(GetStruggleLeader().SpecialMoveState.CurSMInstance);
        //return ReturnValue;        
    }

    function GetStruggleLeader()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

        return MyBasePlayerPawn;
        //return ReturnValue;        
    }
    stop;    
}

state StruggleLeechAttack extends StruggleMode
{    stop;    
}

state StruggleSepiaNPH extends StruggleMode
{    stop;    
}

state StrugglePackHunterAttack extends StruggleMode
{    stop;    
}

state StrugglePackHunterAttackNPH extends StruggleMode
{    stop;    
}

state StruggleFireWaspAttack extends StruggleMode
{    stop;    
}

state StruggleAct1BossAttack extends StruggleMode
{    stop;    
}

state SoloStruggle extends StruggleMode
{    stop;    
}

state StruggleBurrowerAttackMelee extends StruggleMode
{    stop;    
}

state StruggleBurrowerAttack extends StruggleMode
{    stop;    
}

state StruggleIssAttack extends StruggleMode
{    stop;    
}

state StruggleVsLarocheAttack extends StruggleMode
{    stop;    
}

state StruggleVsLarocheMobilityKillAttack extends StruggleVsLarocheAttack
{
    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    simulated function DrawHUD()
    {
        local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

        // End:0x90
        if(StruggleButtonTexture != none)
        {
            H.Canvas.SetPos(50.0000000, 50.0000000);
            H.Canvas.DrawTexture(StruggleButtonTexture, 1.0000000);
        }
        global.DrawHUD(H);
        //return;        
    }
    stop;    
}

state StruggleStalkerAttack extends StruggleMode
{    stop;    
}

state Electricution
{
    ignores GrapplingHookButtonPress, RepairVS;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    function MeleeMoveButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

        // End:0x4C
        if(bPressed)
        {
            MyBasePlayerPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_MeleeWhileFrozen, self);
        }
        //return;        
    }
Begin:

    stop;                
}

state BearTrapMode
{
    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MyBasePlayerPawn.bBearTrapped = true;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        MyBasePlayerPawn.bBearTrapped = false;
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event IsMoveInputIgnored()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0xEB
        if(PlayerMoveInfo.bMeleeButtonPressed && CanMelee())
        {
            StartMelee();
        }
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x19A
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        PlayerMoveInfo.bMeleeButtonPressed = false;
        //return;        
    }
    stop;    
}

simulated state MunitionsLocker
{
    ignores EndState;

    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        EndSprint(true);
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        ClearAmmoTypeSwitch();
        ReleaseHeldButtons();
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = 0;
        DeltaRot.Pitch = 0;
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0xCB
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

simulated state InPlaceRepair
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL CameraRot, CameraLoc;

        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        EndSprint(true);
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        ClearAmmoTypeSwitch();
        ReleaseHeldButtons();
        GetPlayerViewPoint(CameraLoc, CameraRot);
        CameraRot.Pitch = 0;
        Pawn.SetDesiredRotation(CameraRot);
        // End:0x113
        if(IsLocalPlayerController())
        {
            SetInPlaceRepairCam();
        }
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x18
        if(IsLocalPlayerController())
        {
            SetDefaultCam();
        }
        // End:0x2F
        if(IsDoingInPlaceRepairSpecialMove())
        {
            EndSpecialMove();
        }
        //return;        
    }

    simulated function IsDoingInPlaceRepairSpecialMove()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerRepairBase');
        //return ReturnValue;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        ComputeLookAndTurnDeltas(DeltaTime, DeltaRot);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        Pawn.FaceRotation(Pawn.DesiredRotation, DeltaTime);
        SetRotation(Pawn.Rotation);
        // End:0x119
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

simulated state JobLog
{
    event ScriptedModifyPostProcessSettings()
    {
        local /*0x97E50000-0x00000000*/ private editfixedsize @NULL PPSettings[25165825];

        // End:0x0F
        if(bIsInVitalSuit)
        {
            return;
        }
        // End:0x6C
        if(int(Pawn.Mesh.DepthPriorityGroup) == int(2))
        {
            PPSettings.bEnableDOF = false;
        }
        //return;        
    }

    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL CameraRot, CameraLoc;

        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        EndSprint(true);
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        ClearAmmoTypeSwitch();
        ReleaseHeldButtons();
        // End:0x115
        if(!bIsInVitalSuit)
        {
            GetPlayerViewPoint(CameraLoc, CameraRot);
            CameraRot.Pitch = 0;
            Pawn.SetDesiredRotation(CameraRot);
            SetJobLogCam();
        }
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPFTVolume;

        // End:0x22
        if(!bIsInVitalSuit)
        {
            SetDefaultCam(JobLogTransitionOutParam);
        }
        // End:0x42
        if(IsDoingSpecialMove(Class'LPSM_PlayerJobLog'))
        {
            EndSpecialMove();
        }
        // End:0xA1
        if(NextStateName != 'Dead')
        {
            // End:0xA1
            if(Pawn != none)
            {
                // End:0xA0
                foreach Pawn.TouchingActors(Class'LPFastTravelVolume', LPFTVolume)
                {
                    ShowFastTravelOptionMessage();                    
                }                
            }
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        // End:0x5E
        if(bIsInVitalSuit)
        {
            SPPlayerCameraManager(PlayerCamera).Targeting.LookInput = vect2d(0.0000000, 0.0000000);
        }
        ViewRotation = Rotation;
        ComputeLookAndTurnDeltas(DeltaTime, DeltaRot);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x107
        if(!bIsInVitalSuit)
        {
            Pawn.FaceRotation(Pawn.DesiredRotation, DeltaTime);
        }
        SetRotation(Pawn.Rotation);
        // End:0x186
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    function CanAimDownSight()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

simulated state PlayerBusy
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        EndSprint(true);
        ClearAmmoTypeSwitch();
        ReleaseHeldButtons();
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x161
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

simulated state Interacting
{
    ignores BlockExitVS;

    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPVS;

        bIsVitalSuitExitLockedByCode = true;
        MyBasePlayerPawn.SetPitchControllerTarget(0, 0.5000000);
        LPVS = LPBaseVSPlayerPawn(MyBasePlayerPawn);
        LPVS.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        LPVS.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        SetTimer(0.7500000, false, 'BlockExitVS');
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        bIsVitalSuitExitLockedByCode = false;
        //return;        
    }

    function CanExitVitalSuit()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x56
        if(LPVSPlayerPawn(Pawn).IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchWinchPoint'))
        {
            // End:0x54
            if(bIsVitalSuitExitLockedByKismet && !bDoesVitalSuitZiplineOverrideExitLocking)
            {
                return false;
            }
            return true;
        }
        return super(LPPlayerController).CanExitVitalSuit();
        //return ReturnValue;        
    }

    function RightArmButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private @NULL VSIP;

        VSIP = LPVSPlayerPawn(Pawn).GetVSInteractionPoint();
        // End:0x6F
        if((VSIP != none) && VSIP.CanDoVSRightArm())
        {
            super(Interacting).RightArmButtonPress();
        }
        //return;        
    }

    function WinchArmButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPVS, Winch;

        // End:0x149
        if(bIsInVitalSuit && MyBasePlayerPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchWinchPoint'))
        {
            LPVS = LPVSPlayerPawn(Pawn);
            Winch = LPWeaponVSWinch(LPVS.FindInventoryType(Class'LPWeaponVSWinch', true));
            // End:0x149
            if(((Winch.SpawnedProjectile == none) || Winch.SpawnedProjectile.AttachedWinchPoint == none) || Winch.SpawnedProjectile.AttachedWinchPoint.bAllowVSWinchAction)
            {
                ProcessWinchArmFire();
            }
        }
        //return;        
    }

    function ExitVS()
    {
        local /*0x97E50000-0x00000000*/ private bool bForced[9437185], bPreventSpecialMove, bResetOnly, bHardReset;
        local /*0x97E50000-0x00000000*/ private @NULL LPVS, VSIP, Winch;

        false
        false
        false
        false
        // End:0x2D
        if(IsTimerActive('BlockExitVS'))
        {
            return;
        }
        // End:0x57
        if(bIsVitalSuitExitLockedByKismet && !bDoesVitalSuitZiplineOverrideExitLocking)
        {
            ShowCockpitLockedMessage();
            return;
        }
        LPVS = LPVSPlayerPawn(Pawn);
        // End:0x263
        if(LPVS.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchWinchPoint'))
        {
            Winch = LPWeaponVSWinch(LPVS.FindInventoryType(Class'LPWeaponVSWinch', true));
            // End:0x156
            if(((Winch == none) || Winch.SpawnedProjectile == none) || Winch.SpawnedProjectile.AttachedWinchPoint == none)
            {
                ShowCockpitLockedMessage();
                return;
            }
            Winch.SpawnedProjectile.AttachedWinchPoint.ConnectToZipline(HumanPlayerPawn);
            SetGrappleHookCurrentTarget(Winch.SpawnedProjectile.AttachedWinchPoint);
            super(LPPlayerController).ExitVS(true, false, bResetOnly);
            // End:0x260
            if(LPVS.Health > 0)
            {
                MyPlayerPawn.SetBestZiplineWeapon();
                MyPlayerPawn.bUseZiplineVSTransition = true;
            }            
        }
        else
        {
            VSIP = LPVS.GetVSInteractionPoint();
            // End:0x340
            if(VSIP != none)
            {
                // End:0x336
                if(VSIP.CanDoVSExit())
                {
                    // End:0x301
                    if(VSIP.HasAltVSExit())
                    {
                        VSIP.DoAltVSExit();                        
                    }
                    else
                    {
                        super(LPPlayerController).ExitVS(bForced, bPreventSpecialMove, bResetOnly, bHardReset);
                    }                    
                }
                else
                {
                    ShowCockpitLockedMessage();
                }
            }
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        ComputeLookAndTurnDeltas(DeltaTime, DeltaRot);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        SetRotation(Pawn.Rotation);
        // End:0xD3
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

simulated state VSEMPShutdown_MP extends PlayerWalking
{
    ignores RightArmButtonPress, LeftArmButtonPress, WinchArmButtonPress, VSShieldBlockButtonPress, HandleVSWinchCrush, EnterVS;

    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        VSShieldBlockButtonRelease();
        LeftArmButtonRelease();
        RightArmStopButtonPress();
        //return;        
    }

    function IsInEMPShutdown()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
    stop;    
}

simulated state VSEMPShutdown
{
    ignores RightArmButtonPress, LeftArmButtonPress, WinchArmButtonPress, VSShieldBlockButtonPress, EvadeButtonPress, HandleVSWinchCrush, 
	    EnterVS;

    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        MyBasePlayerPawn.SetPitchControllerLock(true);
        MyBasePlayerPawn.ZeroMovementVariables();
        VSShieldBlockButtonRelease();
        LeftArmButtonRelease();
        RightArmStopButtonPress();
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x2F
        if(MyBasePlayerPawn != none)
        {
            MyBasePlayerPawn.SetPitchControllerLock(false);
        }
        //return;        
    }

    function IsInEMPShutdown()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        ComputeLookAndTurnDeltas(DeltaTime, DeltaRot);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        SetRotation(Pawn.Rotation);
        // End:0xD3
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

simulated state VSLaRocheEMPState extends StruggleMode
{
    ignores RightArmButtonPress, LeftArmButtonPress, WinchArmButtonPress, VSShieldBlockButtonPress, EvadeButtonPress, HandleVSWinchCrush, 
	    EnterVS, PlayerMove, DoStartup;
Begin:

    DoStartup();
    stop;        
}

simulated state VSLaRocheEMPInto extends VSLaRocheEMPState
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL currAI;

        super(StruggleMode).BeginState(PreviousStateName);
        bIsVitalSuitExitLockedByCode = true;
        MyBasePlayerPawn.SetPitchControllerTarget(0, 0.5000000);
        MyBasePlayerPawn.SetPitchControllerLock(true);
        MyBasePlayerPawn.ZeroMovementVariables();
        VSShieldBlockButtonRelease();
        LeftArmButtonRelease();
        RightArmStopButtonPress();
        // End:0x127
        foreach WorldInfo.AllPawns(Class'LPAIPawn', currAI)
        {
            // End:0x126
            if(!ClassIsChildOf(currAI.Class, Class'LPAIPawnVsLaroche'))
            {
                currAI.PauseForVsEntryExit(true);
            }            
        }        
        myLPHUD.DisplayVSEnvironmentalMessage(1, "<Strings:LostPlanetGame.EnvironmentMessages.VS_EMP1>", "", false, 1.0000000);
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x4E
        if(NextStateName != 'VSLaRocheEMPShutdown')
        {
            bIsVitalSuitExitLockedByCode = false;
            PutAllLpAiControllersOnHold(false);
            MyBasePlayerPawn.SetPitchControllerLock(false);
        }
        super(StruggleMode).EndState(NextStateName);
        //return;        
    }

    function DoStartup()
    {
        GotoState('VSLaRocheEMPShutdown');
        //return;        
    }
Begin:

    DoStartup();
    stop;        
}

simulated state VSLaRocheEMPAnimInto extends VSLaRocheEMPInto
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function OnEMPIntroSMFinished()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        GotoState('VSLaRocheEMPShutdown');
        //return;        
    }

    function DoStartup()
    {
        MyBasePlayerPawn.DoSpecialMove(Class'LPSM_PlayerVSIntoLarocheEmp', true, true, OnEMPIntroSMFinished);
        //return;        
    }
Begin:

    DoStartup();
    stop;        
}

simulated state VSLaRocheEMPShutdown extends VSLaRocheEMPState
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL JimLoc, JimRot;

        super(StruggleMode).BeginState(PreviousStateName);
        MyBasePlayerPawn.ZeroMovementVariables();
        PreEMPRot = MyBasePlayerPawn.Rotation;
        JimRot.Yaw = MyBasePlayerPawn.Rotation.Yaw;
        JimLoc = MyBasePlayerPawn.Location;
        JimLoc += (Vector(JimRot) * float(100));
        HumanPlayerPawn.SetBase(none);
        HumanPlayerPawn.SetLocation(JimLoc);
        HumanPlayerPawn.SetRotation(JimRot);
        HumanPlayerPawn.Mesh.HideBoneByName('JO_Neck_A', 2);
        HumanPlayerPawn.SetHidden(false);
        HumanPlayerPawn.Mesh.SetViewOwnerDepthPriorityGroup(true, 2);
        MyBasePlayerPawn.Mesh.SetViewOwnerDepthPriorityGroup(false, 2);
        SetNotifyInstigator();
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        bIsVitalSuitExitLockedByCode = false;
        PutAllLpAiControllersOnHold(false);
        // End:0x171
        if(HumanPlayerPawn != none)
        {
            HumanPlayerPawn.Mesh.SetViewOwnerDepthPriorityGroup(false, 2);
            HumanPlayerPawn.SetHidden(true);
            HumanPlayerPawn.Mesh.UnHideBoneByName('JO_Neck_A');
            HumanPlayerPawn.SetLocation(MyBasePlayerPawn.Location);
            HumanPlayerPawn.SetRotation(MyBasePlayerPawn.Rotation);
            HumanPlayerPawn.SetHardAttach(true);
            HumanPlayerPawn.SetBase(MyBasePlayerPawn);
        }
        // End:0x211
        if(MyBasePlayerPawn != none)
        {
            MyBasePlayerPawn.SetPitchControllerLock(false);
            MyBasePlayerPawn.SetDesiredRotation(PreEMPRot, false, false, 0.2500000, true);
            MyBasePlayerPawn.Mesh.SetViewOwnerDepthPriorityGroup(true, 2);
            NotifyInstigator();
        }
        ClearTimer('NotifyInstigator');
        super(StruggleMode).EndState(NextStateName);
        //return;        
    }

    function SetNotifyInstigator()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPVS;

        LPVS = LPBaseVSPlayerPawn(MyBasePlayerPawn);
        // End:0xF4
        if(((LPVS != none) && LPVS.EMPShutdownInstigator != none) && ClassIsChildOf(LPVS.EMPShutdownInstigator.Class, Class'LPAIPawnVsLaroche'))
        {
            SetTimer(LPAIPawnVsLaroche(LPVS.EMPShutdownInstigator).TuneDataVsLaroche.MaxTimeInBackoffForWaitAfterTaseringJim, false, 'NotifyInstigator');
        }
        //return;        
    }

    function NotifyInstigator()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPVS;

        LPVS = LPBaseVSPlayerPawn(MyBasePlayerPawn);
        // End:0xAE
        if((LPVS != none) && LPVS.EMPShutdownInstigator != none)
        {
            LPVS.EMPShutdownInstigator.NotifyEmpShutdownInstigatorShutdownOver(LPVS);
            LPVS.EMPShutdownInstigator = none;
        }
        ClearTimer('NotifyInstigator');
        //return;        
    }

    function StruggleButtonPress()
    {
        SPPawn(HumanPlayerPawn).BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StruggleButton, self);
        //return;        
    }

    function GetStruggleLeader()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

        return GetMyPlayerPawn();
        //return ReturnValue;        
    }

    simulated function DrawHUD()
    {
        local /*0x97E50000-0x00000000*/ private @NULL H[8388609];

        GetStruggleLeaderSM().DrawHUD(H);
        super(StruggleMode).DrawHUD(H);
        //return;        
    }

    function DoStartup()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;

        PlayerPawn = GetMyPlayerPawn();
        PlayerPawn.DoSpecialMove(Class'LPSM_PlayerStruggleRestartTheUR', true, false,, MyBasePlayerPawn);
        //return;        
    }
    stop;    
}

simulated state PlayerZipline
{
    ignores PrevWeapon, SwitchToBestWeapon, GrenadeButtonPress, GrenadeStopButtonPress;

    function GetZiplineOffset()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], ZiplineLocation, DeltaLoc;

        MySPPawn.Mesh.GetSocketWorldLocationAndRotation('ZiplineCableHookup', ZiplineLocation);
        DeltaLoc = ZiplineLocation - MySPPawn.Location;
        return DeltaLoc;
        //return ReturnValue;        
    }

    function PositionPawnForVSToZipline()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CableDir, PawnOffsetLoc, NewPawnLoc;

        CableDir = -LPVSWinchPoint(GrappleHookCurrentTarget).GetLineDirection();
        PawnOffsetLoc = CableDir * vect(32.8400000, -12.9900000, 0.0000000);
        PawnOffsetLoc.Z += 166.4600000;
        NewPawnLoc = ZiplineInfo.ZiplineStart - PawnOffsetLoc;
        Pawn.SetLocation(NewPawnLoc);
        //return;        
    }

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        myLPHUD.SetGrapplePointValid(GrappleHookCurrentTarget, false);
        // End:0x19B
        if(IsLocalPlayerController())
        {
            Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            // End:0x127
            if(int(WorldInfo.NetMode) == int(NM_Standalone))
            {
                Pawn.SetRotation(Rotator(Normal(ZiplineInfo.ZiplineEnd - ZiplineInfo.ZiplineStart)));
            }
            // End:0x15B
            if(int(ZiplineInfo.ZiplineType) == int(0))
            {
                PositionPawnForVSToZipline();                
            }
            else
            {
                Pawn.SetLocation(ZiplineInfo.ZiplineStart - (GetZiplineOffset()));
            }
        }
        bReplicateMovement = false;
        Pawn.GotoState('PlayerZipline');
        Pawn.SetPhysics(4);
        // End:0x227
        if(!MyPlayerPawn.IsTrollyShown())
        {
            MyPlayerPawn.PlayShowTrolly();
        }
        Pawn.bForceMaxAccel = true;
        Pawn.bNoEncroachCheck = true;
        MyPlayerPawn.bIsUsingAccelRateMaxSpeedModifier = true;
        MyPlayerPawn.bUseZiplineVSTransition = true;
        Pawn.bForceRegularVelocity = true;
        ZiplineInfo.bIsZipSprinting = false;
        // End:0x2FA
        if(GrappleHookCurrentTarget == none)
        {
        }
        HideCrosshair(true);
        PauseFire();
        AllowAimDownSight(false);
        SetDefaultCam();
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPP;

        LPP = MyPlayerPawn;
        // End:0x3E
        if(LPP == none)
        {
            LPP = LPPlayerPawn(HumanPlayerPawn);
        }
        bReplicateMovement = true;
        PlayerMoveInfo.bHookButtonPressed = false;
        super(SPStateObject).EndState(NextStateName);
        // End:0x2CB
        if(LPP != none)
        {
            // End:0xD5
            if(!int(ZiplineInfo.ZiplineType) == int(1))
            {
                LPP.bUseZiplineVSTransition = false;
            }
            MyPlayerPawn.PlayHideTrolly();
            LPP.bForceRegularVelocity = false;
            // End:0x14F
            if(NextStateName != 'Incapacitated')
            {
                LPP.GotoState('None');
            }
            LPP.bNoEncroachCheck = LPP.default.bNoEncroachCheck;
            LPP.AccelRate = LPP.TuneDataBasePawn.AccelerationRate_Tunable.GetValue();
            LPP.bIsUsingAccelRateMaxSpeedModifier = false;
            EndSprint(true);
            LPP.SetMaxSpeedScale(1.0000000);
            Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            LPP.bGrappleHooked = false;
            bPreciseDestination = false;
        }
        AllowAimDownSight();
        UnPauseFire();
        HideCrosshair(false);
        // End:0x316
        if(GrappleHookCurrentTarget != none)
        {
            ServerDisconnectFromZipline(LPZiplinePoint_Base(GrappleHookCurrentTarget));
        }
        LastSolidFootingLocation = Pawn.Location;
        LastSolidFootingLocation.Z -= Pawn.GetCollisionHeight();
        GrappleHookCurrentTarget = none;
        //return;        
    }

    function PerformedUseAction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x2F
        if(MyPlayerPawn.CanFallFromZipline())
        {
            DropOffLine(true);
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    simulated function DropOffLine()
    {
        local /*0x97E50000-0x00000000*/ private bool UserTriggered[8388609];

        MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = false;
        // End:0x30
        if(GrappleHookCurrentTarget == none)
        {
        }
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        MyBasePlayerPawn.bForceMaxAccel = false;
        Pawn.bForceRegularVelocity = false;
        MyBasePlayerPawn.DoSpecialMove(Class'LPSM_PlayerZiplineRelease');
        //return;        
    }

    function PlayerCanPerformVSMove()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    exec function NextWeapon()
    {
        // End:0x35
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            bWantsNextWeapon = true;
        }
        //return;        
    }

    function AdjustAccelToAvoidOthersOnZip()
    {
        local /*0x97E50000-0x00000000*/ private @NULL newAccel[25165825], LPP;
        local /*0x97E50000-0x00000000*/ private float Dist;

        // End:0x20C
        foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPP)
        {
            // End:0x51
            if(LPP == Pawn)
            {
                continue;                
            }
            // End:0xC4
            if(Abs(Pawn.Location.Z - LPP.Location.Z) > float(200))
            {
                continue;                
            }
            Dist = VSize(Pawn.Location - LPP.Location);
            // End:0x127
            if(Dist > float(500))
            {
                continue;                
            }
            // End:0x173
            if((Pawn.Velocity Dot LPP.Velocity) < 0.9800000)
            {
                continue;                
            }
            // End:0x1F8
            if(VSize(Pawn.Location - ZiplineInfo.ZiplineEnd) < VSize(LPP.Location - ZiplineInfo.ZiplineEnd))
            {
                continue;                
            }
            newAccel *= 0.2500000;            
            return;            
        }        
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL newAccel, ZipDir, DeltaRot, ViewRotation, NewRot, GrappleSocketLocation;

        local /*0x97E50000-0x00000000*/ private float ThisZiplineSlowdownDistance;

        // End:0x1D
        if(Pawn == none)
        {
            GotoState('Dead');
        }
        Pawn.Mesh.GetSocketWorldLocationAndRotation('ZiplineCableHookup', GrappleSocketLocation);
        ZipDir = ZiplineInfo.ZiplineEnd - GrappleSocketLocation;
        ZipDir = Normal(ZipDir);
        // End:0x1BB
        if(true)
        {
            // End:0x13A
            if(!ZiplineInfo.bIsZipSprinting)
            {
                ZiplineInfo.bIsZipSprinting = true;
                MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = true;
                MyBasePlayerPawn.SetMaxSpeedScale(GetZiplineSprintSpeedScale());
            }
            newAccel = (ZipDir * Pawn.AccelRate) * MyPlayerPawn.TuneDataPlayerPawn.ZiplineSprintAccelRate.GetValue();            
        }
        else
        {
            // End:0x1FA
            if(ZiplineInfo.bIsZipSprinting)
            {
                ZiplineInfo.bIsZipSprinting = false;
            }
            MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = true;
            MyBasePlayerPawn.SetMaxSpeedScale(GetZiplineSpeedScale());
            newAccel = (ZipDir * Pawn.AccelRate) * MyPlayerPawn.TuneDataPlayerPawn.ZiplineAccelRate.GetValue();
        }
        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x385
        if(GrappleHookCurrentTarget == none)
        {
            return;
        }
        ThisZiplineSlowdownDistance = ZiplineInfo.DropoffDist + ZiplineSlowdownDistance;
        // End:0x479
        if(VSizeSq(ZiplineInfo.ZiplineEnd - (Pawn.Location + (GetZiplineOffset()))) < (ThisZiplineSlowdownDistance * ThisZiplineSlowdownDistance))
        {
            // End:0x466
            if(int(WorldInfo.NetMode) == int(NM_Standalone))
            {
                MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = false;                
            }
            else
            {
                newAccel *= 0.2500000;
            }            
        }
        else
        {
            AdjustAccelToAvoidOthersOnZip(newAccel);
        }
        NewRot = Rotator(Normal(ZiplineInfo.ZiplineEnd - ZiplineInfo.ZiplineStart));
        TurnToFace(DeltaTime, NewRot);
        // End:0x532
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, newAccel, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, newAccel, 0, rot(0, 0, 0));
        }
        Pawn.Velocity = Normal(newAccel) * VSize(Pawn.Velocity);
        bPressedJump = false;
        PlayerMoveInfo.bEvadeButtonPressed = false;
        PlayerMoveInfo.bMeleeButtonPressed = false;
        //return;        
    }

    function ZiplineTick()
    {
        CheckForZiplineEnd();
        //return;        
    }

    function CheckForZiplineEnd()
    {
        // End:0x0F
        if(IsDoingASpecialMove())
        {
            return;
        }
        // End:0x2C0
        if((VSizeSq(ZiplineInfo.ZiplineEnd - (Pawn.Location + (GetZiplineOffset()))) < (ZiplineInfo.DropoffDist * ZiplineInfo.DropoffDist)) || VSizeSq(ZiplineInfo.ZiplineEnd - ZiplineInfo.ZiplineStart) < VSizeSq((Pawn.Location + (GetZiplineOffset())) - ZiplineInfo.ZiplineStart))
        {
            switch(ZiplineInfo.ZiplineType)
            {
                // End:0x2A5
                case 1:
                    Pawn.bForceRegularVelocity = false;
                    ServerDisconnectFromZipline(LPZiplinePoint_Base(GrappleHookCurrentTarget));
                    Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
                    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
                    MyPlayerPawn.PlayHideTrolly();
                    Pawn.SetPhysics(4);
                    MyPlayerPawn.bUseZiplineVSTransition = true;
                    ServerAttemptVSEntryExit(false);
                    Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
                    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
                    // End:0x2C0
                    break;
                // End:0x2AA
                case 2:
                // End:0x2BD
                case 0:
                    DropOffLine(false);
                    // End:0x2C0
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
            //return;            
        }
    }

    function CanDeployPerk()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

state PlayerGrappling
{
    ignores CallUpdateGrappleHookTargets, CallUpdateCurrentGrappleHookTarget, UpdateStateFromAdjustment, CheckSpecialAction;

    function DoesPlayerCSAAllowWeapons()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        ClearAmmoTypeSwitch();
        PauseFire();
        AllowAimDownSight(false);
        // End:0xF7
        if(MyPlayerPawn.GrappleActor != none)
        {
            MyPlayerPawn.GrappleActor.TriggerEventClass(Class'LPSeqEvent_Grapple', Pawn, 0);
        }
        // End:0x127
        if(IsLocalPlayerController())
        {
            // End:0x127
            if(LPZiplinePoint_Base(GrappleHookCurrentTarget) == none)
            {
                SetGrappleHookCurrentTarget(none);
            }
        }
        IncrementStat('Stat_NumTimesUsedGrapple');
        MyBasePlayerPawn.bForceMaxAccel = false;
        bReplicateMovement = false;
        bPlayerReadyToMoveToGrapplePoint = false;
        //return;        
    }

    function SuperManHACKFix()
    {
        // End:0x17
        if(int(Role) == int(ROLE_Authority))
        {            
        }
        Suicide();
        //return;        
    }

    reliable server function ServerSuicide()
    {
        Pawn.Suicide();
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL SM, Target, CameraMan;

        SM = CoverPawn.GetCurrentSpecialMoveInstance();
        // End:0x5C
        if((SM != none) && LPSM_GrapplingBase(SM) != none)
        {
            EndSpecialMove();
        }
        super(SPStateObject).EndState(NextStateName);
        ClearTimer('SuperManHACKFix');
        bPreciseDestination = false;
        UnPauseFire();
        AllowAimDownSight();
        // End:0x177
        if((IsTakeCoverButtonPressed()) && NextStateName == 'PlayerTakingCover')
        {
            Target = LPGrapplePointActorBase(MyPlayerPawn.GrappleActor);
            // End:0x177
            if(Target != none)
            {
                CameraMan = SPPlayerCameraManager(PlayerCamera);
                CameraMan.ForceCameraDirectionStatic(Vector(Target.Rotation) * float(-1), HardCutTransitionParam);
            }
        }
        // End:0x1E4
        if(MyPlayerPawn.GrappleActor != none)
        {
            MyPlayerPawn.GrappleActor.TriggerEventClass(Class'LPSeqEvent_Grapple', Pawn, 1);
        }
        // End:0x24A
        if(IsLocalPlayerController())
        {
            // End:0x217
            if(LPZiplinePoint_Base(GrappleHookCurrentTarget) == none)
            {
                SetGrappleHookCurrentTarget(none);                
            }
            else
            {
                // End:0x24A
                if(NextStateName != 'PlayerZipline')
                {
                    ServerDisconnectFromZipline(LPZiplinePoint_Base(GrappleHookCurrentTarget));
                }
            }
        }
        // End:0x2A8
        if(Pawn != none)
        {
            // End:0x2A8
            if(MyPlayerPawn.bGrappleIsVS)
            {
                MyPlayerPawn.bGrappleIsVS = false;
                EnterVS();
            }
        }
        bReplicateMovement = true;
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation, newAccel;

        // End:0x31
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            GotoState('Dead');            
        }
        else
        {
            // End:0xCC
            if(MyPlayerPawn.bGrappleHooked && bPlayerReadyToMoveToGrapplePoint)
            {
                newAccel = Normal(MyPlayerPawn.GrapplePoint - Pawn.Location) * Pawn.AccelRate;
            }
            ViewRotation = Rotation;
            DeltaRot.Yaw = int(PlayerInput.aTurn);
            DeltaRot.Pitch = int(PlayerInput.aLookUp);
            ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
            // End:0x1C0
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, newAccel, 0, rot(0, 0, 0));                
            }
            else
            {
                ProcessMove(DeltaTime, newAccel, 0, rot(0, 0, 0));
            }
            bPressedJump = false;
            PlayerMoveInfo.bEvadeButtonPressed = false;
        }
        //return;        
    }

    function TryToRunToCover()
    {
        local /*0x97E50000-0x00000000*/ private bool bSkipSpecialMoveCheck[9437185];
        local /*0x97E50000-0x00000000*/ private float CheckScale[9437185];
        local /*0x97E50000-0x00000000*/ private byte DblClickDirToCheck[9437185];
        local /*0x97E50000-0x00000000*/ private bool bPreventSideEntry[9437185], ReturnValue;

        0        
        return false;
        //return ReturnValue;        
    }

    function OnStopGrappling()
    {
        MyPlayerPawn.bGrappleHooked = false;
        // End:0x79
        if(LPZiplineActor(MyPlayerPawn.GrappleActor) == none)
        {
            // End:0x6E
            if(IsTakeCoverButtonPressed())
            {
                // End:0x6E
                if(global.TryToRunToCover())
                {
                    return;
                }
            }
            EnterWalkState();
        }
        //return;        
    }

    function OnStartGrappling()
    {
        local /*0x97E50000-0x00000000*/ private @NULL GrappleActor[8388609];

        NextGrappleSequence();
        //return;        
    }

    event ReachedPreciseDestination()
    {
        bPreciseDestination = false;
        MyPlayerPawn.OnReachedGrapple();
        //return;        
    }

    function GetTurnSpeedModifier()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return 1.0000000;
        //return ReturnValue;        
    }

    function GrappleTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL NewRot, DirToStoppingPoint;

        // End:0x11
        if(MyPlayerPawn == none)
        {
            return;
        }
        // End:0x312
        if(MyPlayerPawn.bGrappleHooked && bPlayerReadyToMoveToGrapplePoint)
        {
            // End:0x135
            if(MyPlayerPawn.bGrappleStopping)
            {
                MyPlayerPawn.AccelRate = 0.0000000;
                MyPlayerPawn.Velocity = MyPlayerPawn.Velocity * 0.8000000;
                // End:0x132
                if(MyPlayerPawn.bGrappleFaceNodeDir)
                {
                    NewRot = MyPlayerPawn.GrappleLandingDir;
                    TurnToFace(DeltaTime, NewRot);
                }                
            }
            else
            {
                // End:0x30F
                if(MyPlayerPawn.bGrappleFaceNodeDir)
                {
                    DirToStoppingPoint = MyPlayerPawn.GrapplePoint - MyPlayerPawn.Location;
                    // End:0x269
                    if(VSize(DirToStoppingPoint) < MyPlayerPawn.GetGrappleParams().PlayerRotateTowardsHookDist)
                    {
                        NewRot = MyPlayerPawn.GrappleLandingDir;
                        TurnToFace((DeltaTime * MyPlayerPawn.GetGrappleParams().PlayerHookRotationModifier) * (GetTurnSpeedModifier()), NewRot);
                    }
                    // End:0x30F
                    if((LPGrapplePointActorBase(MyPlayerPawn.GrappleActor).GrappleType == Class'LPSM_GrappleToZipline') && VSize(DirToStoppingPoint) < float(600))
                    {
                        // End:0x30F
                        if(!MyPlayerPawn.IsTrollyShown())
                        {
                            MyPlayerPawn.PlayShowTrolly();
                        }
                    }
                }
            }            
        }
        else
        {
            NewRot = Rotator(MyPlayerPawn.GrappleDir);
            NewRot.Pitch = 0;
            TurnToFace(DeltaTime * (GetTurnSpeedModifier()), NewRot);
        }
        //return;        
    }

    function CanRunToCover()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CoverCanRunTo[25165825];
        local /*0x97E50000-0x00000000*/ private int NoCameraAutoAlign[25165825];
        local /*0x97E50000-0x00000000*/ private bool bSkipSpecialMoveCheck[9437185];
        local /*0x97E50000-0x00000000*/ private float CheckScale[9437185];
        local /*0x97E50000-0x00000000*/ private byte DblClickDirToCheck[9437185];
        local /*0x97E50000-0x00000000*/ private bool bPreventSideEntry[9437185], bRequireJoystickInput, ReturnValue;
        local /*0x97E50000-0x00000000*/ private @NULL CheckDir;
        local /*0x97E50000-0x00000000*/ private float DistanceToCheckToEnterCover;

        0        
        false
        NoCameraAutoAlign = 0;
        // End:0x102
        if((CoverPawn != none) && PlayerInput != none)
        {
            // End:0x5B
            if(CheckScale <= 0.0000000)
            {
                CheckScale = 1.0000000;
            }
            CheckDir = Vector(Pawn.Rotation) * float(-1);
            DistanceToCheckToEnterCover = CoverPawn.Run2CoverMaxDist * CheckScale;
            // End:0x102
            if(CoverPawn.CanPrepareRun2Cover(DistanceToCheckToEnterCover, CoverCanRunTo, CheckDir))
            {
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function OnPlayerReadyToMoveToGrapplePoint()
    {
        bPlayerReadyToMoveToGrapplePoint = true;
        // End:0x38
        if(MyPlayerPawn.bGrappleHooked)
        {
            MovePlayerToGrapplePoint();
        }
        //return;        
    }

    function HandleGrappleHookConnected()
    {
        // End:0x17
        if(bPlayerReadyToMoveToGrapplePoint)
        {
            MovePlayerToGrapplePoint();
        }
        //return;        
    }

    function MovePlayerToGrapplePoint()
    {
        bPreciseDestination = true;
        SetDestinationPosition(MyPlayerPawn.GrapplePoint, false);
        //return;        
    }

    function PlayGrappleFinishSpecialMove()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Target[8388609];
        local /*0x97E50000-0x00000000*/ private bool bAdvancedGrappleNode[8388609];

        // End:0x7E
        if(LPGrapplePointActorBase(MyPlayerPawn.GrappleActor).GrappleType == Class'LPSM_GrappleToZipline')
        {
            LPPlayerPawn(MySPPawn).StopGrappling();
            StartZipline();
            return;
        }
        global.PlayGrappleFinishSpecialMove(Target, bAdvancedGrappleNode);
        //return;        
    }
    stop;    
}

state PlayerFallGrappelRecovery extends PlayerGrappling
{
    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL BaseGrapplePoint;

        ClearAmmoTypeSwitch();
        PauseFire();
        BaseGrapplePoint = GrappleHookCurrentTarget.GetGrapplePoint(LPPawn(Pawn));
        // End:0x152
        if(MyPlayerPawn.IsLocallyControlled())
        {
            GrappleHookCurrentTarget.TriggerEventClass(Class'LPSeqEvent_Grapple', Pawn, 0);
            // End:0xEE
            if(int(Role) < int(ROLE_Authority))
            {
                MyPlayerPawn.ServerPlayerFallingGrappleTo(GrappleHookCurrentTarget, BaseGrapplePoint);                
            }
            else
            {
                MyPlayerPawn.MultiCastGrappleTo(GrappleHookCurrentTarget, BaseGrapplePoint, BaseGrapplePoint);
            }
            DoSpecialMove(Class'LPSM_GrappleFallRecovery', true, false, None);            
        }
        else
        {
            // End:0x1A0
            if(int(Role) == int(ROLE_Authority))
            {
                MyPlayerPawn.MultiCastGrappleTo(GrappleHookCurrentTarget, BaseGrapplePoint, BaseGrapplePoint);
            }
        }
        MyPlayerPawn.GrappleTo(GrappleHookCurrentTarget, BaseGrapplePoint, BaseGrapplePoint);
        SetGrappleHookCurrentTarget(none);
        IncrementStat('Stat_NumTimesUsedGrapple');
        MyPlayerPawn.bForceMaxAccel = false;
        bReplicateMovement = false;
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearAnimatedCamera();
        // End:0x80
        if(((Pawn != none) && !Pawn.bDeleteMe) && !Pawn.IsInState('Dying'))
        {
            SetDefaultCam();
            UpdateAimDownSight();            
        }
        else
        {
            SetDefaultCam();
        }
        super.EndState(NextStateName);
        //return;        
    }

    function OnStopGrappling()
    {
        EnterWalkState();
        //return;        
    }

    function HandleGrappleHookConnected()
    {
        MyPlayerPawn.bGrappleHooked = false;
        //return;        
    }

    function MovePlayerToGrapplePoint()
    {
        MyPlayerPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        MyPlayerPawn.bGrappleHooked = true;
        super.MovePlayerToGrapplePoint();
        //return;        
    }
    stop;    
}

state PlayerFallRappelRecovery
{
    ignores CallUpdateGrappleHookTargets;

    function DoesPlayerCSAAllowWeapons()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0xF0
        if(IsLocalPlayerController())
        {
            DoSpecialMove(Class'LPSM_GrappleRappelRecovery', true, false, None);
            // End:0x9C
            if(int(Role) < int(ROLE_Authority))
            {
                MyPlayerPawn.ServerDoFallRappelRecovery(GrappleHookCurrentTarget, GrappleHookCurrentTarget.GetGrapplePoint(MyPlayerPawn));                
            }
            else
            {
                MyPlayerPawn.MultiCastDoFallRappelRecovery(GrappleHookCurrentTarget, GrappleHookCurrentTarget.GetGrapplePoint(MyPlayerPawn));
            }            
        }
        else
        {
            // End:0x155
            if(int(Role) == int(ROLE_Authority))
            {
                MyPlayerPawn.MultiCastDoFallRappelRecovery(GrappleHookCurrentTarget, GrappleHookCurrentTarget.GetGrapplePoint(MyPlayerPawn));
            }
        }
        IncrementStat('Stat_NumTimesUsedGrapple');
        MyPlayerPawn.DoFallRappelRecovery(GrappleHookCurrentTarget, GrappleHookCurrentTarget.GetGrapplePoint(MyPlayerPawn));
        SetGrappleHookCurrentTarget(none);
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function OnStopGrappling()
    {
        EnterWalkState();
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation, newAccel, OldRotation;

        // End:0x31
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            GotoState('Dead');            
        }
        else
        {
            ViewRotation = Rotation;
            DeltaRot.Yaw = int(PlayerInput.aTurn);
            DeltaRot.Pitch = int(PlayerInput.aLookUp);
            ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
            OldRotation = Rotation;
            SetRotation(Pawn.Rotation);
            // End:0x168
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, newAccel, 0, OldRotation - Rotation);                
            }
            else
            {
                ProcessMove(DeltaTime, newAccel, 0, OldRotation - Rotation);
            }
        }
        //return;        
    }
    stop;    
}

state PlayerGrapplingDown
{
    ignores CallUpdateGrappleHookTargets, UpdateGrapple, CheckForFalling;

    function DoesPlayerCSAAllowWeapons()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private bool bRunningLeap;
        local /*0x97E50000-0x00000000*/ private float dotprod, dotAngle;
        local /*0x97E50000-0x00000000*/ private @NULL playerDir, GrappleDir;

        // End:0x2E5
        if(IsLocalPlayerController())
        {
            playerDir = Vector(MyPlayerPawn.Rotation);
            GrappleDir = Vector(GrappleHookCurrentTarget.Rotation) * float(-1);
            GrappleDir.Z = 0.0000000;
            GrappleDir = Normal(GrappleDir);
            dotprod = GrappleDir Dot playerDir;
            dotAngle = 57.2957800 * Acos(dotprod);
            // End:0x131
            if(dotAngle <= MyPlayerPawn.GetGrappleParams().GrappleDownRunningLeapMaxAngle)
            {
                bRunningLeap = true;
            }
            // End:0x168
            if(bRunningLeap)
            {
                DoSpecialMove(Class'LPSM_GrappleDownRunningLeap', true, false, None);                
            }
            else
            {
                DoSpecialMove(Class'LPSM_GrappleDownStart', true, false, None);
            }
            // End:0x1D8
            if(int(Role) < int(ROLE_Authority))
            {
                MyPlayerPawn.ServerGrappleDown(GrappleHookCurrentTarget, bRunningLeap);                
            }
            else
            {
                MyPlayerPawn.MultiCastGrappleDown(GrappleHookCurrentTarget, bRunningLeap);
            }
            MyPlayerPawn.GrappleDown(GrappleHookCurrentTarget, bRunningLeap);
            // End:0x278
            if(int(WorldInfo.NetMode) != int(NM_Standalone))
            {
                SetTimer(6.0000000, false, 'SuperManHACKFix');
            }
            // End:0x2E5
            if(MyPlayerPawn.GrappleActor != none)
            {
                MyPlayerPawn.GrappleActor.TriggerEventClass(Class'LPSeqEvent_Rappel', Pawn, 0);
            }
        }
        super(SPStateObject).BeginState(PreviousStateName);
        IncrementStat('Stat_NumTimesUsedGrapple');
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        PauseFire();
        AllowAimDownSight(false);
        // End:0x390
        if(IsLocalPlayerController())
        {
            SetGrappleHookCurrentTarget(none);
        }
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        UnPauseFire();
        AllowAimDownSight();
        // End:0xAD
        if(IsLocalPlayerController())
        {
            // End:0xA2
            if(MyPlayerPawn.GrappleActor != none)
            {
                MyPlayerPawn.GrappleActor.TriggerEventClass(Class'LPSeqEvent_Rappel', Pawn, 1);
            }
            SetGrappleHookCurrentTarget(none);
        }
        // End:0xEA
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            ClearTimer('SuperManHACKFix');
        }
        //return;        
    }

    function GrappleTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL NewRot;

        // End:0xA4
        if(IsLocalPlayerController())
        {
            // End:0x1E
            if(MyPlayerPawn == none)
            {
                return;
            }
            // End:0xA4
            if(MyPlayerPawn.bGrappleFaceNodeDir)
            {
                NewRot = Rotator(MyPlayerPawn.GrappleDir);
                NewRot.Pitch = 0;
                TurnToFace(DeltaTime, NewRot);
            }
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation, newAccel, OldRotation;

        // End:0x31
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            GotoState('Dead');            
        }
        else
        {
            ViewRotation = Rotation;
            DeltaRot.Yaw = int(PlayerInput.aTurn);
            DeltaRot.Pitch = int(PlayerInput.aLookUp);
            ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
            OldRotation = Rotation;
            SetRotation(Pawn.Rotation);
            // End:0x168
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, newAccel, 0, OldRotation - Rotation);                
            }
            else
            {
                ProcessMove(DeltaTime, newAccel, 0, OldRotation - Rotation);
            }
            bPressedJump = false;
            PlayerMoveInfo.bEvadeButtonPressed = false;
        }
        //return;        
    }

    function OnStopGrappling()
    {
        EnterWalkState();
        //return;        
    }

    function SuperManHACKFix()
    {
        // End:0x17
        if(int(Role) == int(ROLE_Authority))
        {            
        }
        Suicide();
        //return;        
    }
    stop;    
}

state GrappleDownScooch
{
    ignores CallUpdateGrappleHookTargets;

    event NotifyBump()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], HitNormal;
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        MPStartState('PlayerWalking');
        return super(Controller).NotifyBump(Other, HitNormal);
        //return ReturnValue;        
    }

    event NotifyHitWall()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall;
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        MPStartState('PlayerWalking');
        return super(Controller).NotifyHitWall(HitNormal, Wall);
        //return ReturnValue;        
    }

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Dest;

        Dest = GetDestinationPosition();
        MyPlayerPawn.GrappleDir = Normal(Dest - Pawn.Location);
        super(SPStateObject).BeginState(PreviousStateName);
        MyBasePlayerPawn.SetMaxSpeedScale(GetSprintSpeedScale());
        MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = true;
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        MyBasePlayerPawn.SetMaxSpeedScale(1.0000000);
        MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = false;
        bPreciseDestination = false;
        //return;        
    }

    event ReachedPreciseDestination()
    {
        GotoState('PlayerGrapplingDown');
        //return;        
    }

    function GetScoochAcceleration()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], newAccel;

        newAccel = MyPlayerPawn.GrappleDir * MyPlayerPawn.AccelRate;
        return newAccel;
        //return ReturnValue;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation, newAccel, OldRotation, DestDir, NewRot;

        DestDir = MyPlayerPawn.GrappleDir;
        NewRot = Rotator(DestDir);
        TurnToFace(DeltaTime, NewRot);
        // End:0x8A
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            GotoState('Dead');            
        }
        else
        {
            // End:0xC0
            if(Pawn.IsLocallyControlled())
            {
                newAccel = GetScoochAcceleration();
            }
            ViewRotation = Rotation;
            DeltaRot.Yaw = int(PlayerInput.aTurn);
            DeltaRot.Pitch = int(PlayerInput.aLookUp);
            ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
            OldRotation = Rotation;
            SetRotation(Pawn.Rotation);
            // End:0x1F7
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, newAccel, 0, OldRotation - Rotation);                
            }
            else
            {
                ProcessMove(DeltaTime, newAccel, 0, OldRotation - Rotation);
            }
            bPressedJump = false;
            PlayerMoveInfo.bEvadeButtonPressed = false;
        }
        //return;        
    }
    stop;    
}

state PlayerWalking
{
    function DoPlayerGrapplingState()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        GotoState('PlayerGrappling');
        return true;
        //return ReturnValue;        
    }

    function DoPlayerGrapplingDownState()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        GotoState('PlayerGrapplingDown');
        return true;
        //return ReturnValue;        
    }

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private bool wantsCrouch;

        // End:0x3C
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            SetTimer(0.1000000, true, 'TEnergyCheck');
        }
        wantsCrouch = Pawn.bWantsToCrouch;
        // End:0x96
        if(MyPlayerPawn != none)
        {
            MyPlayerPawn.bUseZiplineVSTransition = false;
        }
        super.BeginState(PreviousStateName);
        // End:0xD9
        if(MyBasePlayerPawn != none)
        {
            MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = true;
        }
        // End:0x106
        if(wantsCrouch)
        {
            Pawn.ShouldCrouch(true);
        }
        UpdateAimDownSight();
        Pawn.SetPhysics(1);
        PlayerMoveInfo.bRightArmAltActionPressed = false;
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPPI;

        super.EndState(NextStateName);
        // End:0x43
        if(myLPHUD != none)
        {
            myLPHUD.RemoveMessageLayer(20);
        }
        ClearTimer('TEnergyCheck');
        // End:0x16B
        if(MyBasePlayerPawn != none)
        {
            MyBasePlayerPawn.SprintControl.bWantsToSprint = false;
            LPPI = LPPlayerInput(PlayerInput);
            // End:0x14A
            if(MyBasePlayerPawn.SprintControl.bSprinting)
            {
                // End:0x13F
                if((LPPI != none) && !LPPI.bUseNewFunkySprint)
                {
                    PlayerMoveInfo.bSpecialActionButtonPressed = true;
                }
                EndSprint(true);
            }
            MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = false;
        }
        // End:0x1B7
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            // End:0x1B7
            if(bWantsNextWeapon)
            {
                bWantsNextWeapon = false;
                NextWeapon();
            }
        }
        // End:0x238
        if(LPPRI(PlayerReplicationInfo).PerksManager != none)
        {
            // End:0x238
            if(NextStateName != 'DeployManualPerk')
            {
                LPPRI(PlayerReplicationInfo).PerksManager.DeactivateDeploymentMode();
            }
        }
        //return;        
    }

    function TEnergyCheck()
    {
        // End:0xEE
        if(myLPHUD != none)
        {
            // End:0xCD
            if(CanDeployForExtraction())
            {
                // End:0xCA
                if(!myLPHUD.IsMessageLayerActive(20))
                {
                    myLPHUD.DisplayHUDMessageLayer(20, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_DeployPlatform>", -1.0000000, None, true, 0.0000000, 0.3200000);
                }                
            }
            else
            {
                myLPHUD.RemoveMessageLayer(20);
            }
        }
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    event ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    simulated function AllowedToSwitchWeapons()
    {
        local /*0x97E50000-0x00000000*/ private @NULL DesiredWeapon[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return global.AllowedToSwitchWeapons(DesiredWeapon);
        //return ReturnValue;        
    }

    function ShouldAutoGrappleOverLedge()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function TryToRunToLedge()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL FoundCovInfo;
        local /*0x97E50000-0x00000000*/ private int NoCameraAutoAlign;

        // End:0xB6
        if(CanRunToCover(FoundCovInfo, NoCameraAutoAlign, true, 1.0000000, 0, true, false))
        {
            // End:0xB6
            if(int(FoundCovInfo.Link.Slots[FoundCovInfo.LtSlotIdx].CoverType) == int(3))
            {
                AcquireCover(FoundCovInfo, NoCameraAutoAlign == 1);
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    event UpdateRotationFromView()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL ViewRotation[25296897], deltaRotation;

        // End:0x4F
        if(!UpdateRotationFromViewNative_PlayerWalking(DeltaTime, ViewRotation, deltaRotation))
        {
            global.UpdateRotationFromView(DeltaTime, ViewRotation, deltaRotation);
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL newAccel, OldRotation;
        local /*0x97E50000-0x00000000*/ private byte DoubleClickMove;
        local /*0x97E50000-0x00000000*/ private bool bSaveJump;
        local /*0x97E50000-0x00000000*/ private @NULL LPPI, relativeInputRot, relativeInput, playerToAttacker, inputVector;

        local /*0x97E50000-0x00000000*/ private float stickMag2;
        local /*0x97E50000-0x00000000*/ private class RollSMClass, SpecialRollSMClass;
        local /*0x97E50000-0x00000000*/ private bool bHasSpecialDodgeWindow;

        LPPI = LPPlayerInput(PlayerInput);
        // End:0x4D
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            GotoState('Dead');            
        }
        else
        {
            // End:0xD4C
            if(LPPI != none)
            {
                inputVector = LPPI.GetInputVectorWalkingFlat();
                newAccel = Normal(inputVector) * (Pawn.AccelRate * LPPI.UnfilteredMovementStickRadius);
                DoubleClickMove = 0;
                OldRotation = Rotation;
                UpdateRotation(DeltaTime);
                stickMag2 = VSizeSq(inputVector);
                // End:0x198
                if(IsSprinting())
                {
                    // End:0x198
                    if(LPPlayerInput(PlayerInput).bUseNewFunkySprint && stickMag2 < 0.2500000)
                    {
                        PlayerMoveInfo.bSprintButtonPressed = false;
                        EndSprint(false);
                    }
                }
                UpdateAccelRateForSprinting(newAccel, inputVector, Vector(OldRotation));
                UpdateAccelRateForSpecialMove(DeltaTime, newAccel);
                // End:0x22F
                if((PlayerMoveInfo.bHookButtonPressed || ShouldAutoGrappleOverLedge()) && !bIsInVitalSuit)
                {
                    UpdateGrappleHookTargets();
                    UpdateGrapple();
                }
                // End:0x268
                if(PlayerMoveInfo.bMeleeButtonPressed && CanMelee())
                {
                    StartMelee();
                }
                // End:0x278
                if(CheckSprint())
                {                    
                }
                else
                {
                    // End:0x288
                    if(CheckSpecialAction())
                    {                        
                    }
                    else
                    {
                        // End:0xB87
                        if(PlayerMoveInfo.bEvadeButtonPressed)
                        {
                            bHasSpecialDodgeWindow = (SpecialDodgeActor != none) && Class'LPAnimNotify_PlayerDodgeWindow'.static.DoesThisAttackTypeHaveSpecialDodge(SpecialDodgeType);
                            RollSMClass = GetPlayerRoll(bHasSpecialDodgeWindow);
                            // End:0x97E
                            if(RollSMClass != none)
                            {
                                // End:0x95C
                                if(SpecialDodgeActor != none)
                                {
                                    // End:0x837
                                    if(bHasSpecialDodgeWindow)
                                    {
                                        playerToAttacker = SpecialDodgeActor.Location;
                                        playerToAttacker.Z = Pawn.Location.Z;
                                        playerToAttacker = Normal(playerToAttacker - Pawn.Location);
                                        // End:0x41D
                                        if(SpecialDodgeType == 9)
                                        {
                                            SpecialRollSMClass = Class'LPSM_PlayerDodgeBossBite'.static.GetDirection(self);                                            
                                        }
                                        else
                                        {
                                            relativeInput = Pawn.Acceleration Cross playerToAttacker;
                                            // End:0x658
                                            if(relativeInput.Z <= 0.0000000)
                                            {
                                                switch(SpecialDodgeType)
                                                {
                                                    // End:0x48E
                                                    case 25:
                                                    // End:0x4A9
                                                    case 26:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeLClawRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x4C3
                                                    case 1:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeLClawRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x4DE
                                                    case 2:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeClawRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x4E3
                                                    case 3:
                                                    // End:0x4FE
                                                    case 24:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeCrabChargeRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x503
                                                    case 5:
                                                    // End:0x51E
                                                    case 8:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeBossTongueRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x56D
                                                    case 6:
                                                        // End:0x56A
                                                        if(Class'LPAICmd_Act1BossTunedStrike'.static.IsDodgeCloseEnough(MyPlayerPawn, SpecialDodgeActor))
                                                        {
                                                            SpecialRollSMClass = Class'LPSM_PlayerDodgeBossTongueRight2';
                                                        }
                                                        // End:0x655
                                                        break;
                                                    // End:0x588
                                                    case 7:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeRightBossTongueRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x5A3
                                                    case 17:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeSpitterTailRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x5BE
                                                    case 20:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeSpitterTalonRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x5D9
                                                    case 18:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeDefenderRamRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x5F4
                                                    case 19:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeDongoChargeRollRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x60F
                                                    case 21:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeCarrierReactiveStrikeRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x62A
                                                    case 22:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeCarrierTalonSweepRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0x645
                                                    case 23:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeCarrierTalonStabRight';
                                                        // End:0x655
                                                        break;
                                                    // End:0xFFFF
                                                    default:
                                                        ScriptTrace();
                                                        // End:0x655
                                                        break;
                                                        break;
                                                }                                                
                                            }
                                            else
                                            {
                                                switch(SpecialDodgeType)
                                                {
                                                    // End:0x670
                                                    case 25:
                                                    // End:0x68B
                                                    case 26:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeClawLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x6A5
                                                    case 1:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeLClawLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x6C0
                                                    case 2:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeClawLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x6C5
                                                    case 3:
                                                    // End:0x6E0
                                                    case 24:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeCrabChargeLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x6E5
                                                    case 5:
                                                    // End:0x700
                                                    case 8:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeBossTongueLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x71B
                                                    case 6:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeLeftBossTongueLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x76A
                                                    case 7:
                                                        // End:0x767
                                                        if(Class'LPAICmd_Act1BossTunedStrike'.static.IsDodgeCloseEnough(MyPlayerPawn, SpecialDodgeActor))
                                                        {
                                                            SpecialRollSMClass = Class'LPSM_PlayerDodgeBossTongueLeft2';
                                                        }
                                                        // End:0x837
                                                        break;
                                                    // End:0x785
                                                    case 17:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeSpitterTailLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x7A0
                                                    case 20:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeSpitterTalonLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x7BB
                                                    case 18:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeDefenderRamLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x7D6
                                                    case 19:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeDongoChargeRollLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x7F1
                                                    case 21:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeCarrierReactiveStrikeLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x80C
                                                    case 22:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeCarrierTalonSweepLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0x827
                                                    case 23:
                                                        SpecialRollSMClass = Class'LPSM_PlayerDodgeCarrierTalonStabLeft';
                                                        // End:0x837
                                                        break;
                                                    // End:0xFFFF
                                                    default:
                                                        ScriptTrace();
                                                        // End:0x837
                                                        break;
                                                        break;
                                                }
                                            }
                                        }
                                    }
                                    // End:0x95C
                                    if((SpecialRollSMClass != none) && SpecialRollSMClass.static.IsValidSpecialDodge(LPPawn(Pawn), SpecialDodgeActor))
                                    {
                                        // End:0x8E7
                                        if(SpecialDodgeType != 9)
                                        {
                                            Pawn.SetRotation(Rotator(playerToAttacker));
                                            SetRotation(Pawn.Rotation);
                                        }
                                        RollSMClass = SpecialRollSMClass;
                                        SpecialDodgeActorDodged = SpecialDodgeActor;
                                        TriggerEventClass(Class'LPSeqEvent_PlayerDodgedAI', SpecialDodgeActorDodged);
                                        CompletedTutorialMode(5);
                                        CompletedTutorialMode(9);
                                        CompletedTutorialMode(8);
                                        CompletedTutorialMode(10);
                                    }
                                }
                                bPressedJump = false;
                                StartRoll(RollSMClass);                                
                            }
                            else
                            {
                                // End:0xB84
                                if((((Pawn != none) && LPPlayerTurretPawn(Pawn) == none) && LPVSFuturePlayerPawn(Pawn) != none) && CanDash())
                                {
                                    LPPI.GetRelativeInput(relativeInput);
                                    relativeInputRot = Rotator(relativeInput);
                                    // End:0xB84
                                    if(VSizeSq(relativeInput) > 0.0000000)
                                    {
                                        bPressedJump = false;
                                        // End:0xA9D
                                        if((Abs(float(relativeInputRot.Yaw)) < float(8192)) && relativeInputRot.Yaw > -8192)
                                        {
                                            DoSpecialMove(Class'LPSM_VSFutureBoostForward');                                            
                                        }
                                        else
                                        {
                                            // End:0xB05
                                            if((relativeInputRot.Yaw > 8192) && relativeInputRot.Yaw < 24576)
                                            {
                                                DoSpecialMove(Class'LPSM_VSFutureBoostRight');                                                
                                            }
                                            else
                                            {
                                                // End:0xB6D
                                                if((relativeInputRot.Yaw < -8192) && relativeInputRot.Yaw > -24576)
                                                {
                                                    DoSpecialMove(Class'LPSM_VSFutureBoostLeft');                                                    
                                                }
                                                else
                                                {
                                                    DoSpecialMove(Class'LPSM_VSFutureBoostBackward');
                                                }
                                            }
                                        }
                                    }
                                }
                            }                            
                        }
                        else
                        {
                            // End:0xBE2
                            if(PlayerMoveInfo.bRightArmAltActionPressed && CanDoRightArmAltAction())
                            {
                                ProcessRightArmAltAction();
                                PlayerMoveInfo.bRightArmAltActionPressed = false;                                
                            }
                            else
                            {
                                // End:0xC3D
                                if(PlayerMoveInfo.bRightArmPrimaryActionPressed && CanDoRightArmPrimaryAction())
                                {
                                    StartRightArmTransitionIn();
                                    PlayerMoveInfo.bRightArmPrimaryActionPressed = false;                                    
                                }
                                else
                                {
                                    // End:0xC98
                                    if(PlayerMoveInfo.bPlayerWeaponSwitchPressed && CanDoSwitchToPistol())
                                    {
                                        DoSwitchToPistol();
                                        PlayerMoveInfo.bPlayerWeaponSwitchPressed = false;                                        
                                    }
                                    else
                                    {
                                        // End:0xCF6
                                        if(PlayerMoveInfo.bVSShieldBlockPressed && CanShieldBlock())
                                        {
                                            // End:0xCF3
                                            if(StartVSShieldBlock())
                                            {
                                                PlayerMoveInfo.bVSShieldBlockPressed = false;
                                            }                                            
                                        }
                                        else
                                        {
                                            // End:0xD4C
                                            if(PlayerMoveInfo.bWinchArmButtonPressed)
                                            {
                                                // End:0xD4C
                                                if(CanWinchArmFire())
                                                {
                                                    ProcessWinchArmFire();
                                                    PlayerMoveInfo.bWinchArmButtonPressed = false;
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            // End:0xD98
            if(bPressedJump && MyBasePlayerPawn.CannotJumpNow())
            {
                bSaveJump = true;
                bPressedJump = false;                
            }
            else
            {
                bSaveJump = false;
            }
            // End:0xE07
            if(MyBasePlayerPawn.SprintControl.bSprinting)
            {
                // End:0xE04
                if(!WantsToSprint() || !CanSprint())
                {
                    EndSprint(true);
                }                
            }
            else
            {
                // End:0xEA4
                if((WantsToSprint()) && CanSprint())
                {
                    // End:0xEA4
                    if(MySPPawn.SprintControl.SprintDelayTimeRemaining <= 0.0000000)
                    {
                        BeginSprint();
                        UpdateAccelRateForSprinting(newAccel, inputVector, Vector(Pawn.Rotation));
                    }
                }
            }
            // End:0xF41
            if((bMobilityMode && PlayerMoveInfo.bJetpackButtonPressed) && CanJetPack())
            {
                Pawn.Velocity.Z = 50.0000000;
                Pawn.SetPhysics(2);
                GotoState('PlayerFalling');
            }
            // End:0xF92
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, newAccel, DoubleClickMove, OldRotation - Rotation);                
            }
            else
            {
                ProcessMove(DeltaTime, newAccel, DoubleClickMove, OldRotation - Rotation);
            }
            // End:0xFFE
            if(LPPlayerTurretPawn(Pawn) != none)
            {
                Pawn.SetPhysics(0);
            }
            bPressedJump = bSaveJump;
            PlayerMoveInfo.bEvadeButtonPressed = false;
            PlayerMoveInfo.bMeleeButtonPressed = false;
            PlayerMoveInfo.bRightArmAltActionPressed = false;
            PlayerMoveInfo.bVSShieldBlockPressedThisTick = false;
            PlayerMoveInfo.bWinchArmButtonPressed = false;
        }
        //return;        
    }

    function AllowEvade()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function DoesStateAllow_ActiveDefense()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function DoesStateAllow_ForkArm()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    event NotifyHitWall()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall;
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL moveDir;
        local /*0x97E50000-0x00000000*/ private float dotprod;

        // End:0x2C
        if(!IsSprinting())
        {
            return super(Controller).NotifyHitWall(HitNormal, Wall);
        }
        moveDir = Vector(Pawn.Rotation);
        moveDir = -moveDir;
        dotprod = moveDir Dot HitNormal;
        // End:0xF0
        if(dotprod < LPTuneDataPlayerPawn(MyBasePlayerPawn.TuneDataBasePlayerPawn).MinHitWallDotForAutoMantleWhileSprinting)
        {
            return super(Controller).NotifyHitWall(HitNormal, Wall);
        }
        // End:0x161
        if(!IsDoingASpecialMove())
        {
            // End:0x161
            if(CheckForMantle())
            {
                MySPPawn.SprintControl.bWantsToSprint = true;
                PlayerMoveInfo.bSprintButtonPressed = true;
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }

    function BeginRollState()
    {
        GotoState('PlayerRoll');
        //return;        
    }

    function StartVSDash()
    {
        local /*0x97E50000-0x00000000*/ private name VSDashStateName[8388609];

        GotoState(VSDashStateName);
        //return;        
    }
    stop;    
}

state PlayerFalling
{
    ignores NextWeapon, PrevWeapon, SwitchToBestWeapon, CallUpdateGrappleHookTargets, UpdateGrapple, UpdateLastSolidFootingLocation, 
	    CheckForFalling, StartHackDeployableOperation;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        PauseFire();
        AllowAimDownSight(false);
        // End:0x58
        if(int(Pawn.Physics) != int(2))
        {
            Pawn.SetPhysics(2);
        }
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        UnPauseFire();
        AllowAimDownSight();
        //return;        
    }

    function GrapplingHookButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

        JetpackButtonPress(bPressed);
        // End:0x25
        if(!HasGrapplingHook())
        {
            return;
        }
        PlayerMoveInfo.bHookButtonPressed = bPressed;
        //return;        
    }

    function MeleeMoveButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

        PlayerMoveInfo.bMeleeButtonPressed = false;
        //return;        
    }

    function IsRolling()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    event SetFallLandingState()
    {
        local /*0x97E50000-0x00000000*/ private bool bLanding[8388609];

        // End:0xAC
        if((DoesPlayerCSAAllowDodging()) && (LastSolidFootingLocation.Z - Pawn.Location.Z) > MyBasePlayerPawn.TuneDataBasePlayerPawn.RollAfterFallDistance)
        {
            StartRoll(Class'LPSM_PlayerRollForward');            
        }
        else
        {
            // End:0xE3
            if(int(Pawn.Physics) != int(2))
            {
                GotoState('PlayerWalking');
            }
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL newAccel, OldRotation, JRot, DeltaRot, ViewRotation, LPPI;

        LPPI = LPPlayerInput(PlayerInput);
        // End:0x59
        if(int(Pawn.Physics) == int(1))
        {
            MPStartState('PlayerWalking');
        }
        // End:0x8A
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            GotoState('Dead');            
        }
        else
        {
            // End:0x412
            if(LPPI != none)
            {
                newAccel = LPPI.GetInputVectorWalkingFlat();
                newAccel = Pawn.AccelRate * (Normal(newAccel) * LPPI.UnfilteredMovementStickRadius);
                OldRotation = Rotation;
                // End:0x1BD
                if(bMobilityMode)
                {
                    UpdateRotation(DeltaTime);
                    JRot = Rotator(Pawn.Velocity);
                    JRot.Pitch = 0;
                    Pawn.SetRotation(JRot);                    
                }
                else
                {
                    ViewRotation = Rotation;
                    DeltaRot.Yaw = int(PlayerInput.aTurn);
                    DeltaRot.Pitch = int(PlayerInput.aLookUp);
                    ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
                    SetRotation(Pawn.Rotation);
                }
                // End:0x357
                if((bMobilityMode && PlayerMoveInfo.bJetpackButtonPressed) && CanJetPack())
                {
                    // End:0x357
                    if(Pawn.Velocity.Z < float(800))
                    {
                        Pawn.Velocity.Z += (float(6000) * DeltaTime);
                    }
                }
                // End:0x3A1
                if(int(Role) < int(ROLE_Authority))
                {
                    ReplicateMove(DeltaTime, newAccel, 0, OldRotation - Rotation);                    
                }
                else
                {
                    ProcessMove(DeltaTime, newAccel, 0, OldRotation - Rotation);
                }
                PlayerMoveInfo.bEvadeButtonPressed = false;
                PlayerMoveInfo.bMeleeButtonPressed = false;
            }
        }
        //return;        
    }

    event PlayerTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super(SPPlayerController).PlayerTick(DeltaTime);
        // End:0x75
        if(IsLocalPlayerController())
        {
            // End:0x62
            if(!bMobilityMode)
            {
                // End:0x62
                if(int(WorldInfo.NetMode) == int(NM_Standalone))
                {
                    AttemptFallRecovery();
                }
            }
            UpdateForcedCameraRotation(DeltaTime);
        }
        //return;        
    }

    function FindFallRecoveryGrapplePoint()
    {
        local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], A, Closest;
        local /*0x97E50000-0x00000000*/ private float ClosestDot, CurrentDot, MaxPlayerAngleToHookDot, RequiredCameraDot, MaxPlayerAngleToHookDotMagnetic, RequiredCameraDotMagnetic;

        local /*0x97E50000-0x00000000*/ private @NULL tempPos, TempDir, TempDir2;
        local /*0x97E50000-0x00000000*/ private float TempDot;
        local /*0x97E50000-0x00000000*/ private @NULL GrapplePoint, CameraDir;
        local /*0x97E50000-0x00000000*/ private float GrapplePointHeight, HeightDistanceFromLastSolidFooting, SearchRange;
        local /*0x97E50000-0x00000000*/ private editfixedsize array PossibleGrappleRecoveryNodes, PossibleRappelRecoveryNodes;
        local /*0x97E50000-0x00000000*/ private bool bCheckMagneticGrapple;
        local /*0x97E50000-0x00000000*/ private editfixedsize @NULL GP, MGP, CurGP, GrapplePointOctree;
        local /*0x97E50000-0x00000000*/ private int I;
        local /*0x97E50000-0x00000000*/ private float deltaDist;

        Closest = none;
        // End:0x2D
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            return none;
        }
        bCheckMagneticGrapple = HasMagneticGrapple();
        GP = MyBasePlayerPawn.GetGrappleParams(false, true);
        MaxPlayerAngleToHookDot = Cos(GP.HookValidAngleToPlayer * 0.0174533);
        RequiredCameraDot = Cos(GP.FallRecoveryMaxAngleToGrapplePoint * 0.0174533);
        SearchRange = GP.HookValidRange.GetValue() * float(2);
        // End:0x1F0
        if(bCheckMagneticGrapple)
        {
            MGP = MyBasePlayerPawn.GetGrappleParams(true, true);
            MaxPlayerAngleToHookDotMagnetic = Cos(MGP.HookValidAngleToPlayer * 0.0174533);
            RequiredCameraDotMagnetic = Cos(MGP.FallRecoveryMaxAngleToGrapplePoint * 0.0174533);
            SearchRange = FMax(SearchRange, MGP.HookValidRange.GetValue() * float(2));
        }
        GrapplePointOctree = Class'LPMapInfo'.static.GetGrapplePointOctree();
        PossibleRappelRecoveryNodes.Length = 0;
        PossibleGrappleRecoveryNodes.Length = 0;
        // End:0x478
        foreach GrapplePointOctree.OverlappingActors(Class'LPHookMeshActor', A, SearchRange, LastSolidFootingLocation, self, false)
        {
            // End:0x2A1
            if(!A.bEnabled)
            {
                continue;                
            }
            // End:0x2D6
            if(A.bMagnetic)
            {
                // End:0x2D6
                if(!bCheckMagneticGrapple)
                {
                    continue;                    
                }
            }
            GrapplePointHeight = A.GetGrapplePoint(MyBasePlayerPawn).Z;
            HeightDistanceFromLastSolidFooting = LastSolidFootingLocation.Z - GrapplePointHeight;
            CurGP = ((A.bMagnetic) ? MGP : GP);
            // End:0x3BD
            if(Abs(HeightDistanceFromLastSolidFooting) > CurGP.FallRecoveryMaxDistanceFromLastFooting)
            {
                continue;                
            }
            deltaDist = Abs(GrapplePointHeight - Pawn.Location.Z);
            // End:0x433
            if(deltaDist < CurGP.FallRecoveryMinDistanceToGrapplePoint)
            {
                continue;                
            }
            // End:0x461
            if(deltaDist > CurGP.FallRecoveryMaxDistanceToGrapplePoint)
            {
                continue;                
            }
            PossibleRappelRecoveryNodes.AddItem(A);                        
        }        
        PossibleRappelRecoveryNodes.Sort(GrappleRecoverySort);        
        I = 0;
        J0x4A2:

        // End:0x9AD [Loop If]
        if(I < PossibleRappelRecoveryNodes.Length)
        {
            A = PossibleRappelRecoveryNodes[I];
            CurGP = ((A.bMagnetic) ? MGP : GP);
            A.UpdateForFallRecovery(Pawn.Location);
            A.bGrappleDownMode = false;
            GrapplePoint = A.GetGrapplePoint(MyBasePlayerPawn);
            // End:0x5F9
            if(VSize(GrapplePoint - LastSolidFootingLocation) > MyPlayerPawn.TuneDataBasePlayerPawn.FallRecoveryMaxSearchDistFromLastSolidFooting)
            {                
            }
            else
            {
                TempDir = GrapplePoint - MyBasePlayerPawn.Location;
                TempDir = Normal(TempDir);
                tempPos = GrapplePoint;
                tempPos.Z = MyBasePlayerPawn.Location.Z;
                TempDir2 = Normal(tempPos - MyBasePlayerPawn.Location);
                TempDot = TempDir Dot TempDir2;
                // End:0x772
                if((!A.bMagnetic && TempDot > MaxPlayerAngleToHookDot) || A.bMagnetic && TempDot > MaxPlayerAngleToHookDotMagnetic)
                {                    
                }
                else
                {
                    CameraDir = Normal(A.GetGrapplePoint(MyBasePlayerPawn) - Pawn.Location);
                    // End:0x877
                    if(A.bMagnetic)
                    {
                        CurrentDot = A.IsInViewableRange(Pawn.Location, CameraDir, RequiredCameraDotMagnetic, CurGP.HookValidRange.GetValue());                        
                    }
                    else
                    {
                        CurrentDot = A.IsInViewableRange(Pawn.Location, CameraDir, RequiredCameraDot, CurGP.HookValidRange.GetValue());
                    }
                    // End:0x916
                    if(CurrentDot < float(0))
                    {                        
                    }
                    else
                    {
                        // End:0x951
                        if(A.bDisableGrappleDown)
                        {
                            PossibleGrappleRecoveryNodes.AddItem(A);                                                        
                        }
                        else
                        {
                            // End:0x99F
                            if((Closest == none) || CurrentDot > ClosestDot)
                            {
                                Closest = A;
                                ClosestDot = CurrentDot;
                            }
                        }
                    }
                }
            }
            I++;
            // [Loop Continue]
            goto J0x4A2;
        }
        // End:0xBF7
        if(Closest == none)
        {
            ClosestDot = -1.0000000;
            I = 0;
            J0x9D6:

            // End:0xBF7 [Loop If]
            if(I < PossibleGrappleRecoveryNodes.Length)
            {
                A = PossibleGrappleRecoveryNodes[I];
                CameraDir = Normal(A.GetGrapplePoint(MyBasePlayerPawn) - Pawn.Location);
                // End:0xB10
                if(A.bMagnetic)
                {
                    CurrentDot = A.IsInViewableRange(Pawn.Location, CameraDir, RequiredCameraDotMagnetic, MGP.HookValidRange.GetValue());                    
                }
                else
                {
                    CurrentDot = A.IsInViewableRange(Pawn.Location, CameraDir, RequiredCameraDot, GP.HookValidRange.GetValue());
                }
                // End:0xBE9
                if((Closest == none) || CurrentDot > ClosestDot)
                {
                    Closest = A;
                    ClosestDot = CurrentDot;
                }
                I++;
                // [Loop Continue]
                goto J0x9D6;
            }
        }
        return Closest;
        //return ReturnValue;        
    }

    function AttemptFallRecovery()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Hook;
        local /*0x97E50000-0x00000000*/ private float FallRecoveryMinDist;
        local /*0x97E50000-0x00000000*/ private @NULL TraceHitLoc, TraceHitNorm, HowFar, TraceDest;
        local /*0x97E50000-0x00000000*/ private float TraceTime;

        // End:0x11
        if(!HasGrapplingHook())
        {
            return;
        }
        // End:0x22
        if(MyBasePlayerPawn == none)
        {
            return;
        }
        FallRecoveryMinDist = MyBasePlayerPawn.GetGrappleParams(false, true).FallRecoveryMinDistanceToGrapplePoint;
        // End:0xB6
        if(HasMagneticGrapple())
        {
            FallRecoveryMinDist = FMin(FallRecoveryMinDist, MyBasePlayerPawn.GetGrappleParams(true, true).FallRecoveryMinDistanceToGrapplePoint);
        }
        // End:0x136
        if((LastSolidFootingLocation.Z - (Pawn.Location.Z - Pawn.GetCollisionHeight())) < FallRecoveryMinDist)
        {
            return;
        }
        // End:0x145
        if(PlayerIsDoingVSTransition())
        {
            return;
        }
        Hook = FindFallRecoveryGrapplePoint();
        // End:0x16A
        if(Hook == none)
        {
            return;
        }
        // End:0x1B4
        if(!PlayerMoveInfo.bHookButtonPressed && !Hook.bAutoFallRecovery)
        {
            return;
        }
        // End:0x344
        if(!Hook.bDisableGrappleDown)
        {
            TraceTime = MyPlayerPawn.TuneDataBasePlayerPawn.GrapplingHookParams.FallRecoveryMinTimeNeededForRappelRecovery;
            HowFar = Pawn.Velocity;
            HowFar.X *= 0.2000000;
            HowFar.Y *= 0.2000000;
            HowFar = HowFar * TraceTime;
            TraceDest = Pawn.Location + HowFar;
            // End:0x32F
            if(Trace(TraceHitLoc, TraceHitNorm, TraceDest, Pawn.Location) != none)
            {
                return;
            }
            DoFallRappelRecovery(Hook);
            return;
        }
        // End:0x37B
        if(Hook.bDisableGrappleDown)
        {
            DoGrappleRecovery(Hook);
            return;
        }
        //return;        
    }

    function DoFallRappelRecovery()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Hook[8388609];

        PlayerMoveInfo.bHookButtonPressed = false;
        SetGrappleHookCurrentTarget(Hook);
        GotoState('PlayerFallRappelRecovery');
        //return;        
    }

    function DoGrappleRecovery()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Hook[8388609];

        PlayerMoveInfo.bHookButtonPressed = false;
        SetGrappleHookCurrentTarget(Hook);
        GotoState('PlayerFallGrappelRecovery');
        //return;        
    }

    function CanDeployPerk()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

state Incapacitated
{
    ignores CallUpdateGrappleHookTargets, CoverAcquired, StartRoll, CheckForFalling, BeginRollState, OnMantleBegin, 
	    ServerStartState;

    reliable client simulated function ClientVerifyIncapacitated()
    {
        //return;        
    }

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private float fDelay;

        super(SPStateObject).BeginState(PreviousStateName);
        StopFire(0);
        // End:0x6F
        if(myLPHUD != none)
        {
            // End:0x6F
            if(myLPHUD.IsMunitionsLockerOpen())
            {
                myLPHUD.CancelMunitionsLocker();
            }
        }
        bDeadDuringIncap = false;
        ClearAnimatedCamera();
        SetRagdollCam();
        EndSprint();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        SetHumanOwnerNoSee(false);
        Class'SPCamera.SPCameraRigOffset'.static.SetLocalPlayerInvisibility(MyBasePlayerPawn, false);
        LPPRI(PlayerReplicationInfo).PerksManager.DeactivateDeploymentMode();
        // End:0x14B
        if(int(Role) == int(ROLE_Authority))
        {
            BroadcastChatter();
        }
        SetGrappleHookCurrentTarget(none);
        SetTimer(0.5000000, true, 'CheckForRagdollSleepyTime');
        // End:0x198
        if(MyBasePlayerPawn != none)
        {
            MyBasePlayerPawn.Health = 0;
        }
        IncapacitatedTapInHealthAccumulator = 0.0000000;
        IncapacitationBeginTime = WorldInfo.TimeSeconds;
        HideCrosshair(true);
        fDelay = 0.1000000;
        // End:0x2E3
        if(MyPlayerPawn.TuneDataPlayerPawn.DeathCameraZoomDuration > float(0))
        {
            fDelay = MyPlayerPawn.TuneDataPlayerPawn.DeathCameraZoomDelay + MyPlayerPawn.TuneDataPlayerPawn.DeathCameraZoomDuration;
            bHasDeathCameraBeenActivatedThroughIncapacitation = true;
            SetTimer(MyPlayerPawn.TuneDataPlayerPawn.DeathCameraZoomDelay, false, 'InitDeathCameraZoom');
        }
        // End:0x328
        if((IsLocalPlayerController()) == true)
        {
            SetTimer(fDelay, false, 'InitIncapacitationCamera');
            SetTimer(fDelay + 0.1000000, false, 'EnableTapIn');
        }
        IncapacitatedHealthDeccumulator = 0.0000000;
        // End:0x37C
        if(int(Role) == int(ROLE_Authority))
        {
            SetTimer(fDelay + 0.1000000, true, 'ApplyBleedOut');
            SetTimer(2.0000000, false, 'MakeSureClientIncapacitated');
        }
        DelayBleedOutUntilTime = 1.0000000 + WorldInfo.TimeSeconds;
        MyBasePlayerPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        MyBasePlayerPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        //return;        
    }

    function MakeSureClientIncapacitated()
    {
        ClientVerifyIncapacitated();
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('EnableTapIn');
        ClearTimer('InitIncapacitationCamera');
        ClearTimer('InitInterestingCamera');
        ClearTimer('ApplyBleedOut');
        ClearTimer('InitDeathCameraZoom');
        ClearTimer('MakeSureClientIncapacitated');
        // End:0x98
        if(IsDoingSpecialMove(Class'LPSM_PlayerIncapacitated'))
        {
            EndSpecialMove();
        }
        // End:0xC8
        if(myLPHUD != none)
        {
            myLPHUD.RemoveMessageLayer(5);
        }
        // End:0x146
        if(((Pawn != none) && !Pawn.bDeleteMe) && !Pawn.IsInState('Dying'))
        {
            SetDefaultCam(RagdollTransitionOutParam);
            UpdateAimDownSight();            
        }
        else
        {
            SetDefaultCam();
        }
        // End:0x1A5
        if(NextStateName != 'Dead')
        {
            bHasDeathCameraBeenActivatedThroughIncapacitation = false;
            // End:0x196
            if(NextStateName != 'RoundEnded')
            {
                HideCrosshair(false);
            }
            bDeadDuringIncap = false;            
        }
        else
        {
            bDeadDuringIncap = true;
        }
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function CheckForRagdollSleepyTime()
    {
        local /*0x97E50000-0x00000000*/ private float fVelocity, fMinVel;

        fVelocity = VSizeSq(MyBasePlayerPawn.Velocity);
        fMinVel = MyPlayerPawn.TuneDataPlayerPawn.IncapacitatedRagdollSettlingVelocity;
        fMinVel *= fMinVel;
        // End:0x298
        if((fVelocity < fMinVel) || WorldInfo.TimeSeconds > (IncapacitationBeginTime + MyPlayerPawn.TuneDataPlayerPawn.MaximumIncapacitatedRagdollSettlingTime))
        {
            // End:0x127
            if((int(Role) == int(ROLE_Authority)) && !SetupRagdollRecoverPosition())
            {
                DoBleedOut();                
            }
            else
            {
                // End:0x284
                if((MyBasePlayerPawn != none) && MyBasePlayerPawn.Mesh != none)
                {
                    MyBasePlayerPawn.Mesh.SetRBLinearVelocity(vect(0.0000000, 0.0000000, 0.0000000));
                    MyBasePlayerPawn.Mesh.SetRBAngularVelocity(vect(0.0000000, 0.0000000, 0.0000000));
                    MyBasePlayerPawn.bUseRigidBodySync = false;
                    // End:0x284
                    if(MyBasePlayerPawn.Mesh.PhysicsAssetInstance != none)
                    {
                        MyBasePlayerPawn.Mesh.PhysicsAssetInstance.SetAllBodiesFixed(true);
                    }
                }
            }
            ClearTimer('CheckForRagdollSleepyTime');
        }
        //return;        
    }

    function CanAimDownSight()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    simulated function EnableTapIn()
    {
        local /*0x97E50000-0x00000000*/ private editfixedsize @NULL UIElementInfo;

        ClearTimer('EnableTapIn');
        // End:0x196
        if(myLPHUD != none)
        {
            UIElementInfo.InputCalloutMarkupString = "<InputCallOuts:GBA_TapIn>";
            UIElementInfo.UIElementClass = Class'LPGFxUIElementGameMessageTapIn';
            // End:0x117
            if(CanDeployNoxious())
            {
                myLPHUD.DisplayHUDMessageLayer(5, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_TapInNoxious>", -1.0000000, None,,,, UIElementInfo);                
            }
            else
            {
                myLPHUD.DisplayHUDMessageLayer(5, "<Strings:LostPlanetGame.HUDHintMessages.HUDHint_TapIn>", -1.0000000, None,,,, UIElementInfo);
            }
        }
        //return;        
    }

    function StartTapIn()
    {
        // End:0x1E
        if(int(Role) < int(ROLE_Authority))
        {
            ServerDoTapIn();
        }
        DoTapIn();
        //return;        
    }

    reliable server function ServerDoTapIn()
    {
        DoTapIn();
        //return;        
    }

    function DoTapIn()
    {
        local /*0x97E50000-0x00000000*/ private float fIncrement;
        local /*0x97E50000-0x00000000*/ private @NULL TapInUIElement;

        fIncrement = MyPlayerPawn.TuneDataPlayerPawn.TapInHealthPress;
        IncapacitatedTapInHealthAccumulator += fIncrement;
        // End:0xC2
        if(myLPHUD != none)
        {
            TapInUIElement = LPGFxUIElementGameMessageTapIn(myLPHUD.GetGameMessageUIElementForLayer(5));
            // End:0xC2
            if(TapInUIElement != none)
            {
                TapInUIElement.OnPressed();
            }
        }
        //return;        
    }

    reliable server function ServerDoTapOut()
    {
        local /*0x97E50000-0x00000000*/ private bool bNoxious[9437185];
        local /*0x97E50000-0x00000000*/ private @NULL MyPRI, KillerController;
        local /*0x97E50000-0x00000000*/ private class KillerDamageType;

        false
        MyPRI = LPPRI(PlayerReplicationInfo);
        // End:0xC2
        if(MyPRI != none)
        {
            KillerController = Controller(MyPRI.LastKillerPRI.Owner);
            KillerDamageType = MyPRI.LastKillerDamageType;
            MyPRI.bTappedOut = true;            
        }
        else
        {
            KillerDamageType = Class'Engine.DmgType_Suicided';
            KillerController = self;
        }
        // End:0x115
        if(bNoxious)
        {
            MyPlayerPawn.HandleNoxiousDemise(KillerDamageType);
        }
        bDeadDuringIncap = true;
        Pawn.Died(KillerController, KillerDamageType, Location);
        //return;        
    }

    function StartTapOut()
    {
        local /*0x97E50000-0x00000000*/ private bool bNoxious[9437185];

        false
        // End:0x55
        if(myLPHUD != none)
        {
            myLPHUD.RemoveMessageLayer(5);
            myLPHUD.CloseRoundScoreboard(false);
        }
        ServerDoTapOut(bNoxious);
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        // End:0x2E
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            GotoState('Dead');
        }
        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x12A
        if(Location.Z < WorldInfo.KillZ)
        {
            ServerDoTapOut();
        }
        //return;        
    }

    function ApplyBleedOut()
    {
        local /*0x97E50000-0x00000000*/ private float HealthInc, HealthIncMod;
        local /*0x97E50000-0x00000000*/ private int Damage;
        local /*0x97E50000-0x00000000*/ private @NULL TP, PH, LPMI;
        local /*0x97E50000-0x00000000*/ private int iIndex;
        local /*0x97E50000-0x00000000*/ private float fTimerRate;

        // End:0x2E
        if(DelayBleedOutUntilTime > WorldInfo.TimeSeconds)
        {
            return;
        }
        fTimerRate = GetTimerRate('ApplyBleedOut');
        // End:0xB9
        if(MyPlayerPawn != none)
        {
            HealthInc = fTimerRate * MyPlayerPawn.TuneDataPlayerPawn.IncapacitationBleedOutRate.GetValue();
        }
        // End:0x147
        if((((HealthInc == float(0)) || MyPlayerPawn == none) || !MyPlayerPawn.IsDBNO()) || MyPlayerPawn.Health < MyPlayerPawn.GetMinimumHealthThreshold())
        {
            return;
        }
        HealthIncMod = 1.0000000;
        TP = LPPerkThermalPadding(MyPlayerPawn.GetEnabledPerk(Class'LPPerkThermalPadding'.default.PerkIndex));
        // End:0x23E
        if((TP != none) && TP.ThermalPaddingTuneData != none)
        {
            HealthIncMod -= (1.0000000 - (TP.ThermalPaddingTuneData.BleedOutModifier.GetValue(self) / float(100)));
        }
        LPMI = LPMapInfo(WorldInfo.GetMapInfo());
        // End:0x361
        if(LPMI != none)
        {
            // End:0x360
            foreach LPMI.ProtoHarmonizerList(PH, iIndex)
            {
                // End:0x35F
                if(PH.CanHarmonize(MyPlayerPawn))
                {
                    HealthIncMod -= (1.0000000 - (PH.PHTuneData.BleedOutModifier.GetValue(PH.OwningController) / float(100)));
                }                
            }            
        }
        HealthInc *= FMax(HealthIncMod, 0.0000000);
        HealthInc -= IncapacitatedTapInHealthAccumulator;
        // End:0x450
        if(HealthInc < (MyPlayerPawn.TuneDataPlayerPawn.MinimumIncapacitationBleedOutRate.GetValue() * fTimerRate))
        {
            HealthInc = MyPlayerPawn.TuneDataPlayerPawn.MinimumIncapacitationBleedOutRate.GetValue() * fTimerRate;
        }
        IncapacitatedHealthDeccumulator += HealthInc;
        // End:0x517
        if(IncapacitatedHealthDeccumulator > 1.0000000)
        {
            Damage = int(IncapacitatedHealthDeccumulator);
            IncapacitatedHealthDeccumulator -= float(Damage);
            MyPlayerPawn.Health -= Damage;
            // End:0x517
            if(MyPlayerPawn.Health <= MyPlayerPawn.GetMinimumHealthThreshold())
            {
                DoBleedOut();
            }
        }
        IncapacitatedTapInHealthAccumulator = 0.0000000;
        //return;        
    }

    function DoBleedOut()
    {
        local /*0x97E50000-0x00000000*/ private @NULL MyPRI, KillerController;
        local /*0x97E50000-0x00000000*/ private class KillerDamageType;

        // End:0x182
        if(int(Role) == int(ROLE_Authority))
        {
            MyPRI = LPPRI(PlayerReplicationInfo);
            // End:0xCE
            if(MyPRI != none)
            {
                KillerController = Controller(MyPRI.LastKillerPRI.Owner);
                KillerDamageType = MyPRI.LastKillerDamageType;
                MyPRI.bBledOut = true;
            }
            bDeadDuringIncap = true;
            // End:0x13B
            if(KillerController != none)
            {
                Pawn.Died(KillerController, KillerDamageType, Pawn.Location);                
            }
            else
            {
                Pawn.Died(self, Class'LPDamageTypeIncapacitatedBleedOut', Pawn.Location);
            }
        }
        //return;        
    }

    unreliable server function ServerBroadcastChatter()
    {
        local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];

        switch(ChatterEvent)
        {
            // End:0x18
            case 10:
            // End:0x33
            case 0:
                global.ServerBroadcastChatter(ChatterEvent);
                // End:0x36
                break;
            // End:0xFFFF
            default:
                break;
        }
        //return;        
    }

    simulated event BroadcastChatter()
    {
        local /*0x97E50000-0x00000000*/ private byte ChatterEvent[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL ChatterTarget[9437185];

        switch(ChatterEvent)
        {
            // End:0x19
            case 10:
            // End:0x3D
            case 0:
                global.BroadcastChatter(ChatterEvent, ChatterTarget);
                // End:0x40
                break;
            // End:0xFFFF
            default:
                break;
        }
        //return;        
    }

    function IsDead()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return bDeadDuringIncap;
        //return ReturnValue;        
    }

    function UpdateStateFromAdjustment()
    {
        local /*0x97E50000-0x00000000*/ private name NewState[8388609];

        // End:0x19
        if(NewState != 'Dead')
        {
            return;
        }
        super(LPPlayerController).UpdateStateFromAdjustment(NewState);
        //return;        
    }
    stop;    
}

state Dead
{
    ignores StartRoll, ServerBroadcastChatter, BroadcastChatter, CheckForFalling, BeginRollState;

    reliable client simulated function ClientVerifyIncapacitated()
    {
        //return;        
    }

    simulated function GetRespawnDelay()
    {
        local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL LPG, TI;
        local /*0x97E50000-0x00000000*/ private int RespawnDelay;

        LPG = LPGRI_Base_MP(WorldInfo.GRI);
        TI = LPTeamInfo_MP(WorldInfo.GRI.Teams[int(GetTeamNum())]);
        RespawnDelay = 0;
        // End:0x19B
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            // End:0x13E
            if(LPG != none)
            {
                RespawnDelay = LPG.GetRespawnDelay(int(GetTeamNum()));
                // End:0x13B
                if(TI != none)
                {
                    // End:0x13B
                    if(TI.GetRemainingLives() == 0)
                    {
                        RespawnDelay = 0;
                    }
                }                
            }
            else
            {
                // End:0x18F
                if(MyBasePlayerPawn != none)
                {
                    RespawnDelay = int(MyBasePlayerPawn.TuneDataBasePlayerPawn.MPRespawnDelay);                    
                }
                else
                {
                    RespawnDelay = 5;
                }
            }
        }
        return RespawnDelay;
        //return ReturnValue;        
    }

    simulated function SetupRespawnDelay()
    {
        MinRespawnDelay = float(GetRespawnDelay());
        //return;        
    }

    function CloseRoundScoreboard()
    {
        local /*0x97E50000-0x00000000*/ private bool bImmediateClose[8388609];

        // End:0x65
        if(bExitingScoreboardRequiresInput)
        {
            bExitingScoreboardRequiresInput = false;
            // End:0x51
            if(myLPHUD != none)
            {
                myLPHUD.CloseRoundScoreboard(bImmediateClose);
            }
            SetupRespawnDelay();
            Timer_HandleScoreboard();
        }
        //return;        
    }

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPG;
        local /*0x97E50000-0x00000000*/ private bool bWasInVitalSuit;

        InitTVCameraManager();
        ClearAnimatedCamera();
        SetDefaultCam();
        LPG = LPGRI_Base_MP(WorldInfo.GRI);
        bWasInVitalSuit = bIsInVitalSuit;
        bIsInVitalSuit = false;
        SetupRespawnDelay();
        super.BeginState(PreviousStateName);
        // End:0xBC
        if(myLPHUD != none)
        {
            myLPHUD.PlayerDied();
        }
        AllowAimDownSight(false);
        myLPHUD.SetScopeActive("None", false);
        LPPRI(PlayerReplicationInfo).PerksManager.DeactivateDeploymentMode();
        ClearAnimatedCamera();
        PauseFire();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        bWantsNextWeapon = false;
        HideCrosshair(true);
        Class'SPCamera.SPCameraRigOffset'.static.SetLocalPlayerInvisibility(MyBasePlayerPawn, false);
        // End:0x29B
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            // End:0x1F6
            if(myLPHUD != none)
            {
                myLPHUD.ShowRadar(false);
            }
            // End:0x248
            if(MySPPawn.TakeDamageParams.DamageType == Class'Engine.KillZDamageType')
            {
                StartFadeToBlack(FadeToBlockOnKillZDuration);
            }
            // End:0x26B
            if(bMissionFailed)
            {
                SetTimer(0.1000000, false, 'AutoRespawn');                
            }
            else
            {
                SetTimer(5.0000000, false, 'AutoRespawn');
            }
            // End:0x298
            if(bWasInVitalSuit == false)
            {
                InitIncapacitationCamera();
            }            
        }
        else
        {
            bExitingScoreboardRequiresInput = false;
            // End:0x30F
            if(LPG != none)
            {
                SetTimer(LPG.MPScoreboardDelay, false, 'Timer_HandleScoreboard');
                bExitingScoreboardRequiresInput = LPG.bExitSpectatorModeWithInput;                
            }
            else
            {
                SetTimer(1.5000000, false, 'Timer_HandleScoreboard');
            }
            // End:0x497
            if(IsLocalPlayerController())
            {
                // End:0x39F
                if((bHasDeathCameraBeenActivatedThroughIncapacitation || MinRespawnDelay == 0.0000000) || MySPPawn.TakeDamageParams.DamageType == Class'Engine.KillZDamageType')
                {
                    InitInterestingCamera();                    
                }
                else
                {
                    // End:0x497
                    if(MyPlayerPawn.TuneDataPlayerPawn.DeathCameraZoomDelay < MinRespawnDelay)
                    {
                        SetTimer(MyPlayerPawn.TuneDataPlayerPawn.DeathCameraZoomDelay, false, 'InitDeathCameraZoom');
                        SetTimer(MyPlayerPawn.TuneDataPlayerPawn.DeathCameraZoomDelay + MyPlayerPawn.TuneDataPlayerPawn.DeathCameraZoomDuration, false, 'InitInterestingCamera');
                    }
                }
            }
        }
        bHasDeathCameraBeenActivatedThroughIncapacitation = false;
        // End:0x4D7
        if(int(Role) < int(ROLE_Authority))
        {
            WorldInfo.ForceGarbageCollection();
        }
        //return;        
    }

    function StartFadeToBlack()
    {
        local /*0x97E50000-0x00000000*/ private float Duration[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL FadeColor;

        bDoingFadeToBlackDeath = true;
        FadeColor.R = 0;
        FadeColor.G = 0;
        FadeColor.B = 0;
        FadeColor.A = 0;
        ClientColorFade(FadeColor, 0, 255, Duration);
        //return;        
    }

    function EndFadeToBlack()
    {
        local /*0x97E50000-0x00000000*/ private float Duration[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL FadeColor;

        // End:0xB5
        if(bDoingFadeToBlackDeath)
        {
            bDoingFadeToBlackDeath = false;
            FadeColor.R = 0;
            FadeColor.G = 0;
            FadeColor.B = 0;
            FadeColor.A = 0;
            ClientColorFade(FadeColor, 255, 0, Duration);
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0xF8
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000), 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, vect(0.0000000, 0.0000000, 0.0000000), 0, rot(0, 0, 0));
        }
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x116
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            // End:0xD6
            if(myLPHUD != none)
            {
                myLPHUD.ShowRadar(true);
                myLPHUD.ShowWeaponCluster(true);
                myLPHUD.ShowHealthCluster(true);
                RefreshLoadoutUI();
                myLPHUD.CloseRoundScoreboard(true);
                ClearTimer('UpdateRespawnHUDCounter');
            }
            // End:0x113
            if((TVCameraManager != none) && IsLocalPlayerController())
            {
                TVCameraManager.DisableTVCamera();
            }            
        }
        else
        {
            // End:0x145
            if(myLPHUD != none)
            {
                myLPHUD.ShowRadar(true);
            }
            EndFadeToBlack(FadeToBlockOnKillZDuration);
        }
        HideCrosshair(false);
        UpdateDynamicFloatingAimInputScale();
        super.EndState(NextStateName);
        ClearAnimatedCamera();
        ClearTimer('InitIncapacitationCamera');
        ClearTimer('InitInterestingCamera');
        ClearTimer('InitDeathCameraZoom');
        AllowAimDownSight();
        SetDefaultCam();
        ClearTimer('AutoRespawn');
        // End:0x233
        if((IsLocalPlayerController()) && int(Role) != int(ROLE_Authority))
        {
            WorldInfo.ForceGarbageCollection();
        }
        //return;        
    }

    function UpdateRespawnHUDCounter()
    {
        local /*0x97E50000-0x00000000*/ private bool bStopTimer;

        // End:0x5A
        if(myLPHUD != none)
        {
            bStopTimer = myLPHUD.DecrementRespawnCounter();
            // End:0x5A
            if(bStopTimer)
            {
                ClearTimer('UpdateRespawnHUDCounter');
            }
        }
        //return;        
    }

    reliable server function ServerRestartPlayer()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Engine;

        Engine = SPEngine(Class'Engine.Engine'.static.GetEngine());
        // End:0x9E
        if((Engine != none) && Engine.CurrentCheckpoint != none)
        {
            // End:0x9E
            if(int(WorldInfo.NetMode) == int(NM_Standalone))
            {
                LoadCheckpointNamed();
                return;
            }
        }
        super.ServerRestartPlayer();
        //return;        
    }

    function CloseRespawnScoreboard()
    {
        local /*0x97E50000-0x00000000*/ private bool bImmediateClose[8388609];

        ClearTimer('UpdateRespawnHUDCounter');
        AutoRespawn();
        //return;        
    }

    function AutoRespawn()
    {
        bFrozen = false;
        StartFire(0);
        //return;        
    }

    function Timer_HandleScoreboard()
    {
        // End:0x157
        if(myLPHUD != none)
        {
            // End:0x77
            if(bExitingScoreboardRequiresInput)
            {
                myLPHUD.CreateRoundScoreboard(false, 0, int(PlayerReplicationInfo.Team.GetTeamNum()), true);                
            }
            else
            {
                myLPHUD.CreateRoundScoreboard(true, int(MinRespawnDelay), int(PlayerReplicationInfo.Team.GetTeamNum()));
                SetTimer(1.0000000, true, 'UpdateRespawnHUDCounter');
            }
            myLPHUD.ShowRadar(false);
            myLPHUD.ShowWeaponCluster(false);
            myLPHUD.ShowHealthCluster(false);
            HideCrosshair(true);
        }
        //return;        
    }

    reliable server function ServerStartState()
    {
        local /*0x97E50000-0x00000000*/ private name NewState[8388609];
        local /*0x97E50000-0x00000000*/ private bool bForce[8388609];

        // End:0x49
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            global.ServerStartState(NewState, bForce);            
        }
        //return;        
    }
    stop;    
}

state RoundEnded
{
    ignores EnterWalkState, CallUpdateGrappleHookTargets, BeginRollState, CheckForFalling;

    reliable client simulated function ClientVerifyIncapacitated()
    {
        //return;        
    }

    event Timer()
    {
        super.Timer();
        // End:0x57
        if(LPGameMP_Base(WorldInfo.Game).IsMatchComplete())
        {
            ReturnToPreGameLobby();            
        }
        else
        {
            StartFire();
        }
        //return;        
    }

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL GameSeq;
        local /*0x97E50000-0x00000000*/ private editfixedsize array AllSeqEvents, ActivateIndices;
        local /*0x97E50000-0x00000000*/ private int I;
        local /*0x97E50000-0x00000000*/ private @NULL LPPC;

        // End:0x1A
        if(myLPHUD != none)
        {
            SetGrappleHookCurrentTarget(none);
        }
        bGameStarted = false;
        // End:0x253
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            // End:0x213
            if(IsLocalPlayerController())
            {
                bSavingDisabled = true;
                SetAimDownSightMode(false);
                GameSeq = WorldInfo.GetGameSequence();
                // End:0x162
                if(GameSeq != none)
                {
                    GameSeq.FindSeqObjectsByClass(Class'LPSeqEvent_MatchEnded', true, AllSeqEvents);
                    ActivateIndices[0] = 0;
                    I = 0;
                    J0xF5:

                    // End:0x162 [Loop If]
                    if(I < AllSeqEvents.Length)
                    {
                        LPSeqEvent_MatchEnded(AllSeqEvents[I]).CheckActivate(WorldInfo, self, false, ActivateIndices);
                        I++;
                        // [Loop Continue]
                        goto J0xF5;
                    }
                }
                // End:0x213
                if(int(Role) == int(ROLE_Authority))
                {
                    // End:0x212
                    foreach WorldInfo.AllControllers(Class'LPPlayerController', LPPC)
                    {
                        // End:0x1F1
                        if(LPPC.PickedTeamNum == 1)
                        {
                            LPPC.PickedTeamNum = 0;
                            // End:0x211
                            continue;
                        }
                        LPPC.PickedTeamNum = 1;                        
                    }                    
                }
            }
            // End:0x253
            if(LPPlayerInput(PlayerInput) != none)
            {
                LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
            }
        }
        super.BeginState(PreviousStateName);
        // End:0x294
        if(myLPHUD != none)
        {
            myLPHUD.RoundEnded();
        }
        // End:0x2C8
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            SetTimer(18.0000000, false);
        }
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x42
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            // End:0x42
            if(IsLocalPlayerController())
            {
                bSavingDisabled = false;
            }
        }
        super.EndState(NextStateName);
        //return;        
    }

    function EnterStartState()
    {
        // End:0x36
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            super(PlayerController).EnterStartState();            
        }
        //return;        
    }
    stop;    
}

state PlantThermalPost
{
    ignores PrevWeapon, SwitchToBestWeapon, StartThermalPostOperation;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x56
        if(LPPRI(PlayerReplicationInfo).MyThermalPost == none)
        {
            MPStartState('PlayerWalking');
            return;
        }
        SetDefaultCam(ThermalPostTransitionParam);
        // End:0x9E
        if(IsLocalPlayerController())
        {
            LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
        }
        PauseFire();
        bWantsNextWeapon = false;
        AllowAimDownSight(false);
        EndSprint();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        HideCrosshair(true);
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MyPlayerPawn.DoSpecialMove(Class'LPSM_PlayerPrepareThermalPostDeployment', true, true, OnThermalPostAnimationEnd, LPPRI(PlayerReplicationInfo).MyThermalPost);
        bThermalPostPlantedOK = false;
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x101
        if(NextStateName != 'InflateThermalPost')
        {
            // End:0x59
            if(MyPlayerPawn != none)
            {
                MyPlayerPawn.EndSpecialMove(none);
            }
            ClearAnimatedCamera();
            SetDefaultCam();
            AllowAimDownSight();
            UnPauseFire();
            // End:0xB8
            if(IsLocalPlayerController())
            {
                LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
            }
            HideCrosshair(false);
            // End:0xF7
            if(int(WorldInfo.NetMode) == int(NM_Standalone))
            {
                SetThermalPost(none);
            }
            ClearThermalPostMessage();
        }
        //return;        
    }

    function OnThermalPostAnimationEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        // End:0xAD
        if(!SPSM_PlayAnimBase(FinishedSM).bLastPlaybackInterrupted)
        {
            // End:0x6D
            if(int(WorldInfo.NetMode) == int(NM_Standalone))
            {
                MPStartState('InflateThermalPost');                
            }
            else
            {
                ClearAnimatedCamera();
                UnPauseFire();
                HideCrosshair(false);
                ClearThermalPostMessage();
                MPStartState('PlayerWalking');
            }            
        }
        else
        {
            // End:0xFA
            if(!LPPRI(PlayerReplicationInfo).MyThermalPost.IsInflating())
            {
                SetThermalPost(none);
            }
            ClearAnimatedCamera();
            UnPauseFire();
            HideCrosshair(false);
            ClearThermalPostMessage();
            MPStartState('PlayerWalking');
        }
        //return;        
    }

    function AnimNotifyThermalPostPlanted()
    {
        // End:0x5A
        if(int(Role) == int(ROLE_Authority))
        {
            LPPRI(PlayerReplicationInfo).MyThermalPost.DeployPost(MyPlayerPawn);
        }
        // End:0xB5
        if((IsLocalController()) && myLPHUD != none)
        {
            ClearThermalPostMessage();
            // End:0xB5
            if(int(WorldInfo.NetMode) == int(NM_Standalone))
            {
                DisplayThermalPostMessage_Pump();
            }
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

state InflateThermalPost
{
    ignores PrevWeapon, SwitchToBestWeapon;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x56
        if(LPPRI(PlayerReplicationInfo).MyThermalPost == none)
        {
            MPStartState('PlayerWalking');
            return;
        }
        // End:0xEB
        if(PreviousStateName != 'PlantThermalPost')
        {
            AllowAimDownSight(false);
            SetDefaultCam(ThermalPostTransitionParam);
            // End:0xCB
            if(IsLocalPlayerController())
            {
                ShoulderAimButtonPress(false);
                LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
            }
            EndSprint();
            PauseFire();
            HideCrosshair(true);
        }
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        bWantsNextWeapon = false;
        bThermalPostPlantedOK = false;
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MyPlayerPawn.DoSpecialMove(Class'LPSM_PlayerThermalPostDeployment', true, true, OnThermalPostAnimationEnd, LPPRI(PlayerReplicationInfo).MyThermalPost);
        // End:0x218
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            SetTimer(0.1000000, true, 'CheckTPostInflationState');
        }
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        ClearAnimatedCamera();
        UnPauseFire();
        AllowAimDownSight();
        HideCrosshair(false);
        // End:0x6C
        if(MyPlayerPawn != none)
        {
            MyPlayerPawn.EndSpecialMove(none);
        }
        ClearTimer('CheckTPostInflationState');
        // End:0xA4
        if(!bThermalPostPlantedOK)
        {
            ServerAbortThermalPostInflation();
            SetThermalPost(none);
        }
        ClearThermalPostMessage();
        //return;        
    }

    function OnThermalPostAnimationEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM, TPost;

        TPost = LPPRI(PlayerReplicationInfo).MyThermalPost;
        // End:0x70
        if((TPost != none) && TPost.IsExtracting())
        {
            bThermalPostPlantedOK = true;
        }
        MPStartState('PlayerWalking');
        //return;        
    }

    function CheckTPostInflationState()
    {
        local /*0x97E50000-0x00000000*/ private @NULL TPost;

        TPost = LPPRI(PlayerReplicationInfo).MyThermalPost;
        // End:0x7A
        if((TPost == none) || !TPost.IsInflating())
        {
            MPStartState('PlayerWalking');
        }
        // End:0xC7
        if(IsLocalPlayerController())
        {
            // End:0xC7
            if(!PlayerMoveInfo.bOperateThermalPostPressed)
            {
                ServerAbortThermalPostInflation();
                MPStartState('PlayerWalking');
            }
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    reliable server function ServerAbortThermalPostInflation()
    {
        local /*0x97E50000-0x00000000*/ private @NULL TPost;

        TPost = LPPRI(PlayerReplicationInfo).MyThermalPost;
        // End:0x5F
        if(TPost != none)
        {
            TPost.AbortInflation();
        }
        //return;        
    }
    stop;    
}

state PrepareThermalPostTransfer
{
    ignores PrevWeapon, SwitchToBestWeapon;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x4D
        if(LPPRI(PlayerReplicationInfo).MyThermalPost == none)
        {
            EnterWalkState();
            return;
        }
        SetDefaultCam(ThermalPostTransitionParam);
        // End:0x95
        if(IsLocalPlayerController())
        {
            LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
        }
        PauseFire();
        bWantsNextWeapon = false;
        EndSprint();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        bThermalTransferInterruptedByDamage = false;
        HideCrosshair(true);
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MyPlayerPawn.DoSpecialMove(Class'LPSM_PlayerPrepareThermalPostBattery', true, true, OnThermalPostAnimationEnd, LPPRI(PlayerReplicationInfo).MyThermalPost);
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0xA0
        if(NextStateName != 'DoThermalPostTransfer')
        {
            // End:0x61
            if(MyPlayerPawn != none)
            {
                MyPlayerPawn.EndSpecialMove(Class'LPSM_PlayerPrepareThermalPostBattery');
            }
            ClearAnimatedCamera();
            SetDefaultCam();
            SetThermalPost(none);
            HideCrosshair(false);
            UnPauseFire();
            ClearThermalPostMessage();
        }
        //return;        
    }

    function OnThermalPostAnimationEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        // End:0x55
        if(!SPSM_PlayAnimBase(FinishedSM).bLastPlaybackInterrupted && !bThermalTransferInterruptedByDamage)
        {
            MPStartState('DoThermalPostTransfer');            
        }
        else
        {
            EnterWalkState();
        }
        //return;        
    }

    function AnimNotifyThermalPostPlanted()
    {
        // End:0x14
        if(int(Role) == int(ROLE_Authority))
        {
        }
        // End:0x3C
        if((IsLocalController()) && myLPHUD != none)
        {
            DisplayThermalPostMessage_DoTransfer();
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

state DoThermalPostTransfer
{
    ignores PrevWeapon, SwitchToBestWeapon, StartPrepareThermalPostTransfer;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x4D
        if(LPPRI(PlayerReplicationInfo).MyThermalPost == none)
        {
            EnterWalkState();
            return;
        }
        // End:0xCC
        if(PreviousStateName != 'PrepareThermalPostTransfer')
        {
            SetDefaultCam(ThermalPostTransitionParam);
            // End:0xAC
            if(IsLocalPlayerController())
            {
                LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
            }
            EndSprint();
            PauseFire();
            HideCrosshair(true);
        }
        bThermalTransferInterruptedByDamage = false;
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        bWantsNextWeapon = false;
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MyPlayerPawn.DoSpecialMove(Class'LPSM_PlayerDoThermalPostTransfer', true, true, OnThermalPostAnimationEnd, LPPRI(PlayerReplicationInfo).MyThermalPost);
        SetTimer(MyBasePlayerPawn.TuneDataBasePlayerPawn.TENGPostToPlayerInputDelay, false, 'CheckThermalPostTransfer');
        LPPRI(PlayerReplicationInfo).MyThermalPost.BeginTransferEnergyFromBattery();
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        UnPauseFire();
        MyPlayerPawn.EndSpecialMove(Class'LPSM_PlayerDoThermalPostTransfer');
        ClearTimer('CheckThermalPostTransfer');
        ClearThermalPostMessage();
        // End:0xA1
        if(!bThermalTransferInterruptedByDamage)
        {
            MyPlayerPawn.DoSpecialMove(Class'LPSM_PlayerThermalPostBatteryComplete', true, true);            
        }
        else
        {
            ClearAnimatedCamera();
            SetDefaultCam();
            UnPauseFire();
        }
        LPPRI(PlayerReplicationInfo).MyThermalPost.EndTransferEnergyFromBattery();
        //return;        
    }

    function CheckThermalPostTransfer()
    {
        local /*0x97E50000-0x00000000*/ private @NULL TPost;

        TPost = LPPRI(PlayerReplicationInfo).MyThermalPost;
        // End:0x71
        if((TPost == none) || !PlayerMoveInfo.bPrepareThermalPostTransferPressed)
        {
            EnterWalkState();
            return;
        }
        // End:0x9D
        if(!IsTimerActive('CheckThermalPostTransfer'))
        {
            SetTimer(0.5000000, true, 'CheckThermalPostTransfer');
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], EnergyToTransfer;
        local /*0x97E50000-0x00000000*/ private @NULL TPost, DeltaRot, ViewRotation, FP;
        local /*0x97E50000-0x00000000*/ private float Transferred;

        TPost = LPPRI(PlayerReplicationInfo).MyThermalPost;
        // End:0x71
        if((TPost == none) || !PlayerMoveInfo.bPrepareThermalPostTransferPressed)
        {
            EnterWalkState();
            return;
        }
        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x17A
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        FP = LPThermalEnergyFannyPack(Pawn.InvManager.FindInventoryType(Class'LPThermalEnergyFannyPack', true));
        // End:0x40E
        if(FP != none)
        {
            EnergyToTransfer = DeltaTime * LPBasePlayerPawn(Pawn).TuneDataBasePlayerPawn.TENGPostToPlayerTransferRate;
            // End:0x27E
            if(EnergyToTransfer <= float(0))
            {
                return;
            }
            EnergyToTransfer = TPost.TransferEnergyFromBattery(EnergyToTransfer);
            // End:0x316
            if(EnergyToTransfer <= float(0))
            {
                // End:0x309
                if(int(WorldInfo.NetMode) != int(NM_Standalone))
                {
                    TPost.SendTransferCompleteEvent();
                }
                EnterWalkState();
                return;
            }
            Transferred = FP.AddEnergy(EnergyToTransfer);
            // End:0x3E7
            if(Transferred != EnergyToTransfer)
            {
                // End:0x3A7
                if(int(WorldInfo.NetMode) != int(NM_Standalone))
                {
                    TPost.SendTransferCompleteEvent();
                }
                TPost.TransferEnergyFromBattery(EnergyToTransfer - Transferred);
                EnterWalkState();
                return;
            }
            MyPlayerPawn.SetTEnergyFannyPackGlowTimer(1.5000000);            
        }
        else
        {
            EnterWalkState();
            return;
        }
        //return;        
    }

    function StartDoThermalPostTransfer()
    {
        // End:0x2B
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            return;
        }
        // End:0x6B
        if((LastTouchedThermalPost == none) || LastTouchedThermalPost.IsAvailable())
        {
            EnterWalkState();
            return;
        }
        ServerStartDoThermalPostTransfer();
        //return;        
    }

    reliable server function ServerStartDoThermalPostTransfer()
    {
        local /*0x97E50000-0x00000000*/ private float Distance;

        // End:0x40
        if((LastTouchedThermalPost == none) || LastTouchedThermalPost.IsAvailable())
        {
            EnterWalkState();
            return;
        }
        Distance = VSize2D(LastTouchedThermalPost.Location - Pawn.Location);
        // End:0xEC
        if(Distance > (LastTouchedThermalPost.Radius + Pawn.GetCollisionRadius()))
        {
            EnterWalkState();
            return;
        }
        Distance = Abs(LastTouchedThermalPost.Location.Z - Pawn.Location.Z);
        // End:0x1AA
        if(Distance > LastTouchedThermalPost.CollisionCylinder.CollisionHeight)
        {
            EnterWalkState();
            return;
        }
        PlayerMoveInfo.bDoThermalPostTransferPressed = true;
        //return;        
    }

    function EndDoThermalPostTransfer()
    {
        // End:0x2B
        if(int(WorldInfo.NetMode) != int(NM_Standalone))
        {
            return;
        }
        ServerEndDoThermalPostTransfer();
        //return;        
    }

    reliable server function ServerEndDoThermalPostTransfer()
    {
        PlayerMoveInfo.bDoThermalPostTransferPressed = false;
        PlayerMoveInfo.bPrepareThermalPostTransferPressed = false;
        CheckThermalPostTransfer();
        //return;        
    }
    stop;    
}

state PlantBombState
{
    ignores PrevWeapon, SwitchToBestWeapon, PlantBomb, DisarmBomb;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL SpecialMove;

        // End:0x1F
        if(CurrentBombActor == none)
        {
            GotoState('PreviousStateName');
            return;
        }
        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x7D
        if(IsLocalPlayerController())
        {
            SetDefaultCam();
            SetAimDownSightMode(false);
            LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
        }
        PauseFire();
        bWantsNextWeapon = false;
        EndSprint();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MyPlayerPawn.DoSpecialMove(Class'LPSM_PlayerPlantBomb', true, true, OnPlantBombAborted, CurrentBombActor);
        SpecialMove = LPSM_PlayerPlantBomb(MyPlayerPawn.GetCurrentSpecialMoveInstance());
        // End:0x218
        if(SpecialMove != none)
        {
            SpecialMove.SetPlantBombTime(CurrentBombActor.GetTimeToArmBomb(self));
            CurrentBombActor.SetTimeRemaining(CurrentBombActor.GetTimeToArmBomb(self));
        }
        // End:0x254
        if(int(Role) == int(ROLE_Authority))
        {
            CurrentBombActor.StartPlantBomb(MyPlayerPawn);
        }
        ClearBombMessage();
        //return;        
    }

    function PlantBombComplete()
    {
        // End:0x2F
        if(CurrentBombActor != none)
        {
            CurrentBombActor.SetDeployed(self);
        }
        GotoState('PlayerWalking');
        //return;        
    }

    function OnPlantBombAborted()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        CurrentBombActor.AbortBombPlant();
        // End:0x4F
        if(MyPlayerPawn.IsAlive())
        {
            GotoState('PlayerWalking');
        }
        // End:0x6D
        if(int(Role) == int(ROLE_AutonomousProxy))
        {
            ServerAbortPlantBomb();
        }
        //return;        
    }

    reliable server function ServerAbortPlantBomb()
    {
        MyPlayerPawn.EndSpecialMove(Class'LPSM_PlayerPlantBomb');
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        SetDefaultCam();
        UnPauseFire();
        // End:0xD8
        if(int(Role) == int(ROLE_Authority))
        {
            CurrentBombActor.AbortBombPlant();
            // End:0xC5
            if(!CurrentBombActor.CanPlantBomb(self) || !CurrentBombActor.IsTouching(Pawn))
            {
                ClearCurrentBombActor(CurrentBombActor);                
            }
            else
            {
                SetBombActor(CurrentBombActor);
            }
        }
        MyPlayerPawn.EndSpecialMove(Class'LPSM_PlayerPlantBomb');
        //return;        
    }

    function AnimNotifyBombPlanted()
    {
        // End:0x3C
        if(int(Role) == int(ROLE_Authority))
        {
            CurrentBombActor.PlantBomb(MyPlayerPawn);
        }
        // End:0x64
        if((IsLocalController()) && myLPHUD != none)
        {
            ClearBombMessage();
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    function WantsToStopSMOnNotifyEnablePlayerMovement()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x2B
        if(int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            return false;
        }
        return global.WantsToStopSMOnNotifyEnablePlayerMovement();
        //return ReturnValue;        
    }
    stop;    
}

state DisarmBombState
{
    ignores PrevWeapon, SwitchToBestWeapon, PlantBomb, DisarmBomb;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL SpecialMove;

        // End:0x1F
        if(CurrentBombActor == none)
        {
            GotoState(PreviousStateName);
            return;
        }
        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x7D
        if(IsLocalPlayerController())
        {
            SetDefaultCam();
            SetAimDownSightMode(false);
            LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
        }
        PauseFire();
        bWantsNextWeapon = false;
        EndSprint();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MyPlayerPawn.DoSpecialMove(Class'LPSM_PlayerDisarmBomb', true, true, OnDisarmBombAborted, CurrentBombActor);
        SpecialMove = LPSM_PlayerDisarmBomb(MyPlayerPawn.GetCurrentSpecialMoveInstance());
        // End:0x218
        if(SpecialMove != none)
        {
            SpecialMove.SetDisarmBombTime(CurrentBombActor.GetTimeToDisarmBomb(self));
            CurrentBombActor.SetTimeRemaining(CurrentBombActor.GetTimeToDisarmBomb(self));
        }
        ClearBombMessage();
        //return;        
    }

    function DisarmBombComplete()
    {
        // End:0x2F
        if(CurrentBombActor != none)
        {
            CurrentBombActor.SetDisarmed(self);
        }
        // End:0x70
        if((Pawn != none) && Pawn.IsAliveAndWell())
        {
            GotoState('PlayerWalking');
        }
        //return;        
    }

    function OnDisarmBombAborted()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        // End:0x8D
        if(CurrentBombActor != none)
        {
            CurrentBombActor.AbortBombDisarm();
            // End:0x6F
            if((Pawn != none) && Pawn.IsAliveAndWell())
            {
                GotoState('PlayerWalking');
            }
            // End:0x8D
            if(int(Role) == int(ROLE_AutonomousProxy))
            {
                ServerAbortDisarmBomb();
            }
        }
        //return;        
    }

    reliable server function ServerAbortDisarmBomb()
    {
        MyPlayerPawn.EndSpecialMove(Class'LPSM_PlayerDisarmBomb');
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        SetDefaultCam();
        UnPauseFire();
        // End:0xFF
        if(int(Role) == int(ROLE_Authority))
        {
            CurrentBombActor.AbortBombDisarm();
            // End:0xEC
            if(!CurrentBombActor.IsTouching(Pawn) || !CurrentBombActor.CanDisarmBomb(self) && !CurrentBombActor.CanPlantBomb(self))
            {
                ClearCurrentBombActor(CurrentBombActor);                
            }
            else
            {
                SetBombActor(CurrentBombActor);
            }
        }
        MyPlayerPawn.EndSpecialMove(Class'LPSM_PlayerDisarmBomb');
        //return;        
    }

    function AnimNotifyBombPlanted()
    {
        AnimNotifyBombDisarmed();
        //return;        
    }

    function AnimNotifyThermalPostPlanted()
    {
        AnimNotifyBombDisarmed();
        //return;        
    }

    function AnimNotifyBombDisarmed()
    {
        // End:0x3C
        if(int(Role) == int(ROLE_Authority))
        {
            CurrentBombActor.DisarmBomb(MyPlayerPawn);
        }
        // End:0x64
        if((IsLocalController()) && myLPHUD != none)
        {
            ClearBombMessage();
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

state PrepareReviveIncapacitated
{
    ignores PrevWeapon, SwitchToBestWeapon, StartReviveIncapacitated, ServerStartReviveIncapacitated, ClientStartReviveIncapacitated, DoStartReviveIncapacitated, 
	    EndDoReviveIncapacitated, ServerEndDoReviveIncapacitated;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL RevivalTargetPlayerController;

        super(SPStateObject).BeginState(PreviousStateName);
        SetDefaultCam(ReviveIncapacitatedTransitionParam);
        // End:0x5B
        if(IsLocalPlayerController())
        {
            LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
        }
        // End:0x159
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0xE5
            if((MyPlayerPawn.IncapacitatedRevivalTarget == none) || !MyPlayerPawn.IncapacitatedRevivalTarget.IsDBNO())
            {
                ClearReviveIncapacitatedMessage_Revive();
                MPEnterWalkState();
                return;
            }
            RevivalTargetPlayerController = LPPlayerController(MyPlayerPawn.IncapacitatedRevivalTarget.Controller);
            // End:0x159
            if(RevivalTargetPlayerController != none)
            {
                RevivalTargetPlayerController.ClientAboutToBeRevived();
            }
        }
        PauseFire();
        bWantsNextWeapon = false;
        EndSprint();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        HideCrosshair(true);
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MyPlayerPawn.DoSpecialMove(Class'LPSM_PlayerPrepareReviveIncapacitated', true, true, OnPlayerPrepareReviveIncapacitatedEnd, MyPlayerPawn.IncapacitatedRevivalTarget);
        // End:0x289
        if(int(Role) == int(ROLE_Authority))
        {
            BroadcastChatter();
            SetTimer(0.1000000, true, 'CheckTargetValidity');
        }
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('CheckTargetValidity');
        MyPlayerPawn.EndSpecialMove(Class'LPSM_PlayerPrepareReviveIncapacitated');
        super(SPStateObject).EndState(NextStateName);
        // End:0x90
        if(NextStateName != 'DoReviveIncapacitated')
        {
            HideCrosshair(false);
            ClearAnimatedCamera();
            UnPauseFire();
            SetDefaultCam();
        }
        //return;        
    }

    function OnPlayerPrepareReviveIncapacitatedEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        // End:0x41
        if(!SPSM_PlayAnimBase(FinishedSM).bLastPlaybackInterrupted)
        {
            MPStartState('DoReviveIncapacitated');
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    simulated function CheckTargetValidity()
    {
        // End:0x6A
        if((MyPlayerPawn.IncapacitatedRevivalTarget == none) || !MyPlayerPawn.IncapacitatedRevivalTarget.IsDBNO())
        {
            MPEnterWalkState();
        }
        //return;        
    }
    stop;    
}

state DoReviveIncapacitated
{
    ignores PrevWeapon, SwitchToBestWeapon, StartReviveIncapacitated, ServerStartReviveIncapacitated, ClientStartReviveIncapacitated, DoStartReviveIncapacitated;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private float fMinimumRevivalHealth;

        super(SPStateObject).BeginState(PreviousStateName);
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        // End:0x6B
        if(!PlayerMoveInfo.bDoReviveIncapacitated)
        {
            ClearReviveIncapacitatedMessage_Revive();
            MPEnterWalkState();
            return;
        }
        // End:0x1B4
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0xF5
            if((MyPlayerPawn.IncapacitatedRevivalTarget == none) || !MyPlayerPawn.IncapacitatedRevivalTarget.IsDBNO())
            {
                ClearReviveIncapacitatedMessage_Revive();
                MPEnterWalkState();
                return;
            }
            fMinimumRevivalHealth = MyPlayerPawn.TuneDataPlayerPawn.MinimumHealthThresholdOnInitialRevival;
            // End:0x1B4
            if(float(MyPlayerPawn.IncapacitatedRevivalTarget.Health) > fMinimumRevivalHealth)
            {
                MyPlayerPawn.IncapacitatedRevivalTarget.Health = int(fMinimumRevivalHealth);
            }
        }
        bWantsNextWeapon = false;
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MyPlayerPawn.DoSpecialMove(Class'LPSM_PlayerDoReviveIncapacitated', true, true, None, MyPlayerPawn.IncapacitatedRevivalTarget);
        DisplayReviveIncapacitatedMessage_Revive();
        IncapacitatedHealthAccumulator = 0.0000000;
        // End:0x2B1
        if(int(Role) == int(ROLE_Authority))
        {
            SetTimer(0.1000000, true, 'CheckTargetValidityAndHealth');
        }
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('CheckTargetValidityAndHealth');
        super(SPStateObject).EndState(NextStateName);
        MyPlayerPawn.EndSpecialMove(none);
        ClearReviveIncapacitatedMessage_Revive();
        HideCrosshair(false);
        ClearAnimatedCamera();
        UnPauseFire();
        MyPlayerPawn.DoSpecialMove(Class'LPSM_PlayerReviveIncapacitatedComplete', true, true);
        PlayerMoveInfo.bDoReviveIncapacitated = false;
        SetDefaultCam();
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        // End:0x182
        if(!PlayerMoveInfo.bDoReviveIncapacitated)
        {
            // End:0x182
            if(IsLocalPlayerController())
            {
                EndDoReviveIncapacitated();
            }
        }
        //return;        
    }

    function CheckTargetValidityAndHealth()
    {
        local /*0x97E50000-0x00000000*/ private @NULL RevivalPerk;
        local /*0x97E50000-0x00000000*/ private float HealthInc, ThermalReward;
        local /*0x97E50000-0x00000000*/ private int I;

        // End:0x2F
        if(!PlayerMoveInfo.bDoReviveIncapacitated)
        {
            MPEnterWalkState();
            return;
        }
        // End:0x9B
        if((MyPlayerPawn.IncapacitatedRevivalTarget == none) || !MyPlayerPawn.IncapacitatedRevivalTarget.IsDBNO())
        {
            MPEnterWalkState();
            return;
        }
        RevivalPerk = LPPerkRevival(MyPlayerPawn.GetPerkInstance(Class'LPPerkRevival'.default.PerkIndex));
        // End:0x107
        if(RevivalPerk == none)
        {
            MPEnterWalkState();
            return;
        }
        HealthInc = RevivalPerk.GetRecoveryParams().HealthRestoreRatePerSecond.GetValue(self);
        HealthInc *= GetTimerRate('CheckTargetValidityAndHealth');
        IncapacitatedHealthAccumulator += HealthInc;
        // End:0x21F
        if(IncapacitatedHealthAccumulator >= 1.0000000)
        {
            I = int(IncapacitatedHealthAccumulator);
            IncapacitatedHealthAccumulator -= float(I);
            // End:0x21F
            if(int(Role) == int(ROLE_Authority))
            {
                MyPlayerPawn.IncapacitatedRevivalTarget.HealDamage(I, self, none);
            }
        }
        // End:0x5EE
        if(MyPlayerPawn.IncapacitatedRevivalTarget.Health > 0)
        {
            MyPlayerPawn.IncapacitatedRevivalTarget.RecoverFromKnockDown(Pawn);
            LPPRI(PlayerReplicationInfo).NotifyRevive(LPPRI(MyPlayerPawn.IncapacitatedRevivalTarget.PlayerReplicationInfo));
            // End:0x3AB
            if(int(Role) == int(ROLE_Authority))
            {
                // End:0x3AB
                if(LPGameMP_Base(WorldInfo.Game) != none)
                {
                    LPGameMP_Base(WorldInfo.Game).ScoreRevival(self, MyPlayerPawn.IncapacitatedRevivalTarget.Controller);
                }
            }
            // End:0x495
            if(MyPlayerPawn.IncapacitatedRevivalTarget.Controller != none)
            {
                LPPlayerController(MyPlayerPawn.IncapacitatedRevivalTarget.Controller).MPStartClientState('PlayerWalking');
                LPPlayerController(MyPlayerPawn.IncapacitatedRevivalTarget.Controller).BroadcastChatter(0);
            }
            // End:0x5C4
            if(MyPlayerPawn.IncapacitatedRevivalTarget.PlayerReplicationInfo != none)
            {
                // End:0x5C4
                if(LPPRI(MyPlayerPawn.IncapacitatedRevivalTarget.PlayerReplicationInfo).LastKillerPRI != PlayerReplicationInfo)
                {
                    ThermalReward = RevivalPerk.GetRecoveryParams().ThermalEnergyRewardOnCompletion.GetValue(self);
                    // End:0x5C4
                    if(ThermalReward > float(0))
                    {
                        LPPawn(Pawn).AddThermalEnergy(ThermalReward, true);
                    }
                }
            }
            PlayerMoveInfo.bDoReviveIncapacitated = false;
            MPEnterWalkState();
        }
        //return;        
    }

    function EndDoReviveIncapacitated()
    {
        PlayerMoveInfo.bDoReviveIncapacitated = false;
        ServerEndDoReviveIncapacitated();
        //return;        
    }

    reliable server function ServerEndDoReviveIncapacitated()
    {
        PlayerMoveInfo.bDoReviveIncapacitated = false;
        //return;        
    }
    stop;    
}

simulated state PlayerTakingCover
{
    ignores CheckForFalling;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        EndSprint(true);
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        // End:0x93
        if((GrappleHookCurrentTarget != none) && (CoverPawn == none) || int(CoverPawn.CoverType) != int(3))
        {
            SetGrappleHookCurrentTarget(none);
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextState[8388609];

        // End:0x45
        if(!IsDoingASpecialMove())
        {
            CoverPawn.Mesh.RootMotionMode = 2;
        }
        super.EndState(NextState);
        //return;        
    }

    simulated function AllowedToSwitchWeapons()
    {
        local /*0x97E50000-0x00000000*/ private @NULL DesiredWeapon[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x1A
        if(!super.AllowedToSwitchWeapons(DesiredWeapon))
        {
            return false;
        }
        return ((CoverPawn == none) || int(CoverPawn.CoverType) != int(3)) || ClassIsChildOf(DesiredWeapon.Class, Class'SPInventory.SPInventoryWeaponNone');
        //return ReturnValue;        
    }

    function SetShoulderAimCam()
    {
        local /*0x97E50000-0x00000000*/ private bool bAllowShoulderCam;

        bAllowShoulderCam = IsLeaning(CoverPawn.CoverAction);
        // End:0x61
        if(CoverPawn.bDoing360Aiming)
        {
            bAllowShoulderCam = true;
        }
        // End:0xA7
        if((CoverPawn != none) && int(CoverPawn.CoverType) == int(3))
        {
            bAllowShoulderCam = false;
        }
        // End:0xC9
        if(bAllowShoulderCam)
        {
            global.SetShoulderAimCam();
            HideCrosshair(false);
        }
        //return;        
    }

    simulated function AbortRun2Cover()
    {
        // End:0x0F
        if(bLockInCover)
        {
            return;
        }
        super(SPGFCoverPlayerController).AbortRun2Cover();
        //return;        
    }

    simulated function LeaveCover()
    {
        local /*0x97E50000-0x00000000*/ private bool bPushOut[9437185], bLeavingLedgeCover;

        bLeavingLedgeCover = (CoverPawn != none) && int(CoverPawn.CoverType) == int(3);
        super(SPGFCoverPlayerController).LeaveCover(bPushOut);
        // End:0xA8
        if(bLeavingLedgeCover)
        {
            CoverPawn.UseContextSensitiveAnimObject(none, 0.2500000);
            bLeftLedgeTimerExpired = false;
            SetTimer(1.0000000, false, 'LeftLedgeTimerExpired');
        }
        //return;        
    }

    function EvadeButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

        global.EvadeButtonPress(bPressed);
        // End:0x5D
        if(PlayerMoveInfo.bEvadeButtonPressed)
        {
            HandleCoverButtonPress();
            PlayerMoveInfo.bEvadeButtonPressed = false;
        }
        //return;        
    }

    function AllowEvade()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function TakeCoverButtonPressed()
    {
        local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

        PlayerMoveInfo.bTakeCoverButtonPressed = bPressed;
        // End:0x3F
        if(IsTakeCoverButtonPressed())
        {
            HandleCoverButtonPress();
        }
        //return;        
    }

    function HandleCoverButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CamLoc, InputOrient, InputDir, CoverNormal, CoverCross, CamRot;

        local /*0x97E50000-0x00000000*/ private float InputDot;
        local /*0x97E50000-0x00000000*/ private @NULL PossibleSwatTurnInfo;

        // End:0x5C
        if(int(CoverPawn.CoverType) == int(3))
        {
            // End:0x59
            if(CanDoSpecialMove(Class'LPSM_LedgeJump', true))
            {
                DoSpecialMove(Class'LPSM_LedgeJump', true);
                return;
            }            
        }
        else
        {
            // End:0xFE
            if(!IsDoingASpecialMove() || MyPlayerPawn.IsReloadingWeapon())
            {
                // End:0xCE
                if(!bLockInCover)
                {
                    // End:0xCE
                    if(CanDoSpecialMove(Class'SPGameFramework.SPGFSM_CoverSlip', true))
                    {
                        DoSpecialMove(Class'SPGameFramework.SPGFSM_CoverSlip', true, true);
                        return;
                    }
                }
                // End:0xFE
                if(CanDoSpecialMove(Class'SPGameFramework.SPGFSM_SwatTurn', true))
                {
                    DoSpecialMove(Class'SPGameFramework.SPGFSM_SwatTurn', true, true);
                    return;
                }
            }
        }
        // End:0x10D
        if(bLockInCover)
        {
            return;
        }
        // End:0x189
        if((int(CoverPawn.CoverType) != int(3)) && (!IsDoingASpecialMove() || IsDoingRunToCover()) || MyPlayerPawn.IsReloadingWeapon())
        {
            // End:0x189
            if(CheckForMantle())
            {
                return;
            }
        }
        // End:0x57E
        if(!IsDoingASpecialMove() || MyPlayerPawn.IsReloadingWeapon())
        {
            GetPlayerViewPoint(CamLoc, CamRot);
            InputOrient.X = PlayerInput.RawJoyUp;
            InputOrient.Y = PlayerInput.RawJoyRight;
            InputOrient = InputOrient >> CamRot;
            InputDir = Normal(InputOrient);
            // End:0x3FC
            if(int(CoverPawn.CoverType) != int(3))
            {
                // End:0x2BA
                if(CheckForMantle())
                {
                    return;
                }
                // End:0x3FC
                if((Abs(PlayerInput.RawJoyUp) > DeadZoneThreshold) || Abs(PlayerInput.RawJoyRight) > DeadZoneThreshold)
                {
                    // End:0x3FC
                    if(CanRoll())
                    {
                        CoverNormal = CoverPawn.GetCoverNormal(false);
                        InputDot = InputDir Dot CoverNormal;
                        // End:0x3FC
                        if(Abs(InputDot) < 0.6000000)
                        {
                            bPressedJump = false;
                            CoverCross = CoverNormal Cross InputDir;
                            // End:0x3E7
                            if(CoverCross.Z < float(0))
                            {
                                StartRoll(Class'LPSM_CoverRollRight');                                
                            }
                            else
                            {
                                StartRoll(Class'LPSM_CoverRollLeft');
                            }
                            return;
                        }
                    }
                }
            }
            // End:0x548
            if(int(CoverPawn.CoverType) == int(3))
            {
                // End:0x49C
                if(CoverPawn.IsAtLeftEdgeSlot() && !CoverPawn.CurrentLink.GetSwatTurnTarget(0, 0, PossibleSwatTurnInfo))
                {
                    DoLeaveLedgeWalk();                    
                }
                else
                {
                    // End:0x546
                    if(CoverPawn.IsAtRightEdgeSlot() && !CoverPawn.CurrentLink.GetSwatTurnTarget(CoverPawn.CurrentLink.Slots.Length - 1, 1, PossibleSwatTurnInfo))
                    {
                        DoLeaveLedgeWalk();
                    }
                }
                return;
            }
            // End:0x57E
            if(Abs(InputOrient.X) < DeadZoneThreshold)
            {
                DoPushOutOfCover();
            }
        }
        //return;        
    }

    function SpecialActionButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

        PlayerMoveInfo.bSpecialActionButtonPressed = bPressed;
        // End:0x3F
        if(IsTakeCoverButtonPressed())
        {
            HandleCoverButtonPress();
        }
        //return;        
    }

    function AllowSprint()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function OnGrenadePull()
    {
        CoverPawn.SetCoverAction(0);
        global.OnGrenadePull();
        //return;        
    }

    function SprintButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

        // End:0xF0
        if(bPressed)
        {
            // End:0x90
            if(CanDoSpecialMove(Class'SPGameFramework.SPGFSM_CoverSlip', true))
            {
                DoSpecialMove(Class'SPGameFramework.SPGFSM_CoverSlip', true, true);
                MySPPawn.SprintControl.bWantsToSprint = true;
                PlayerMoveInfo.bSprintButtonPressed = true;
                return;
            }
            // End:0xF0
            if(CheckForMantle())
            {
                MySPPawn.SprintControl.bWantsToSprint = true;
                PlayerMoveInfo.bSprintButtonPressed = true;
            }
        }
        //return;        
    }

    event PlayerTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super.PlayerTick(DeltaTime);
        // End:0x88
        if((LPPlayerPawn(CoverPawn).GetLedgeWalkType() >= 0) && !IsDoingASpecialMove())
        {
            CoverPawn.Mesh.RootMotionMode = 1;
        }
        UpdateForcedCameraRotation(DeltaTime);
        CallUpdateCurrentGrappleHookTarget();
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LWSM;

        // End:0xB2
        if(int(CoverPawn.CoverType) == int(3))
        {
            LWSM = LPSM_LedgeWalkReach(CoverPawn.GetCurrentSpecialMoveInstance());
            // End:0xB2
            if((LWSM != none) && LWSM.bPlayerReaching == true)
            {
                LWSM.bPlayerReaching = false;
            }
        }
        super.PlayerMove(DeltaTime);
        // End:0x11D
        if(PlayerMoveInfo.bPlayerWeaponSwitchPressed && CanDoSwitchToPistol())
        {
            DoSwitchToPistol();
            PlayerMoveInfo.bPlayerWeaponSwitchPressed = false;
        }
        // End:0x196
        if(LWSM != none)
        {
            // End:0x196
            if((LWSM.bPlayerReaching == false) && !LWSM.bPlayingReachEndAnim)
            {
                LWSM.EndReach();
            }
        }
        //return;        
    }

    function NotifyPlayKismetAnim()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function UpdateJoystickRemapping()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CamLoc, CamRot, Link;

        global.UpdateJoystickRemapping();
        Link = LPLedgeWalkLink(CoverPawn.CurrentLink);
        // End:0x72
        if((Link != none) && !Link.bCameraRelativeMovement)
        {
            return;
        }
        GetPlayerViewPoint(CamLoc, CamRot);
        ControlsRemapRotation = CamRot;
        RemapControlsByRotation(Normalize(Pawn.Rotation - ControlsRemapRotation), RemappedJoyRight, RemappedJoyUp);
        //return;        
    }

    function NotifyReachedCoverSlot()
    {
        local /*0x97E50000-0x00000000*/ private int SlotIdx[8388609], OldSlotIdx, LastSlotIdx;

        super(SPGFCoverPlayerController).NotifyReachedCoverSlot(SlotIdx, OldSlotIdx);
        // End:0x47
        if(int(CoverPawn.CoverType) != int(3))
        {
            return;
        }
        LastSlotIdx = CoverPawn.CurrentLink.Slots.Length - 1;
        // End:0xDE
        if((SlotIdx == 0) || SlotIdx == LastSlotIdx)
        {
            // End:0xDE
            if(CanDoSpecialMove(Class'LPSM_LedgeJump', true))
            {
                DoSpecialMove(Class'LPSM_LedgeWalkNearFall');
            }
        }
        //return;        
    }

    function DoLedgeWalkReach()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LWSM, SM;

        SM = CoverPawn.GetCurrentSpecialMoveInstance();
        LWSM = LPSM_LedgeWalkReach(SM);
        // End:0x67
        if((SM != none) && LWSM == none)
        {
            return;
        }
        // End:0x90
        if(LWSM == none)
        {
            DoSpecialMove(Class'LPSM_LedgeWalkReach');            
        }
        else
        {
            LWSM.bPlayerReaching = true;
        }
        //return;        
    }

    function ShouldAutoLeaveLedge()
    {
        local /*0x97E50000-0x00000000*/ private bool bLeft[8388609], ReturnValue;
        local /*0x97E50000-0x00000000*/ private @NULL Node;

        Node = LPLedgeWalkLink(CoverPawn.CurrentLink);
        // End:0x42
        if(Node == none)
        {
            return true;
        }
        // End:0x6F
        if(bLeft)
        {
            return Node.bAutoExitLeft;
        }
        return Node.bAutoExitRight;
        //return ReturnValue;        
    }

    event ShouldHideReticle()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(IsAimingDownSight())
        {
            return false;
        }
        // End:0x46
        if((MyPlayerPawn != none) && MyPlayerPawn.PerkEnabled(17))
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function BeginRollState()
    {
        GotoState('PlayerRoll');
        //return;        
    }
    stop;    
}

state PlayerMantle
{
    function SpecialActionButtonPress()
    {
        local /*0x97E50000-0x00000000*/ private bool bPressed[8388609];

        PlayerMoveInfo.bSpecialActionButtonPressed = bPressed;
        //return;        
    }
    stop;    
}

state PutWeaponAwayBeforeEnteringLedge
{
    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        bPreciseDestination = false;
        MyBasePlayerPawn.SetMaxSpeedScale(1.0000000);
        MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = false;
        //return;        
    }

    function CoverAcquired()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CovInfo[8388609];
        local /*0x97E50000-0x00000000*/ private bool bNoCameraAutoAlign[9437185];
        local /*0x97E50000-0x00000000*/ private @NULL LedgeWalkLink, Dest;

        LedgeWalkCovInfo = CovInfo;
        LedgeWalkLink = LPLedgeWalkLink(LedgeWalkCovInfo.Link);
        CoverPawn.UseContextSensitiveAnimObject(LedgeWalkLink.LedgeWalkCSA, 0.2500000);
        MyBasePlayerPawn.SetMaxSpeedScale(1.0000000);
        MyBasePlayerPawn.bIsUsingAccelRateMaxSpeedModifier = true;
        Dest = LedgeWalkCovInfo.Location;
        Dest.Z = MyBasePlayerPawn.Location.Z;
        SetDestinationPosition(Dest, true);
        bPreciseDestination = true;
        //return;        
    }

    function GetAcceleration()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Dir[8388609], ReturnValue, newAccel;

        newAccel = Dir * MyBasePlayerPawn.AccelRate;
        return newAccel;
        //return ReturnValue;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation, newAccel, OldRotation, DestDir, NewRot;

        // End:0x41
        if(!bPreciseDestination)
        {
            DestDir = LedgeWalkCovInfo.Normal * float(-1);            
        }
        else
        {
            DestDir = Normal(LedgeWalkCovInfo.Location - MyBasePlayerPawn.Location);
        }
        NewRot = Rotator(DestDir);
        TurnToFace(DeltaTime, NewRot);
        // End:0xEB
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            GotoState('Dead');            
        }
        else
        {
            // End:0x139
            if(MyBasePlayerPawn.IsLocallyControlled() && bPreciseDestination)
            {
                newAccel = GetAcceleration(DestDir);
            }
            ViewRotation = Rotation;
            DeltaRot.Yaw = int(PlayerInput.aTurn);
            DeltaRot.Pitch = int(PlayerInput.aLookUp);
            ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
            OldRotation = Rotation;
            SetRotation(Pawn.Rotation);
            // End:0x270
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, newAccel, 0, OldRotation - Rotation);                
            }
            else
            {
                ProcessMove(DeltaTime, newAccel, 0, OldRotation - Rotation);
            }
            bPressedJump = false;
            PlayerMoveInfo.bEvadeButtonPressed = false;
        }
        // End:0x331
        if(!bPreciseDestination)
        {
            // End:0x331
            if(!MyBasePlayerPawn.bSwitchingWeapons && !MyBasePlayerPawn.bEquipTransition)
            {
                AcquireLedgeCover();
            }
        }
        //return;        
    }

    event ReachedPreciseDestination()
    {
        bPreciseDestination = false;
        // End:0x54
        if(MyBasePlayerPawn.bSwitchingWeapons || MyBasePlayerPawn.bEquipTransition)
        {
            return;
        }
        AcquireLedgeCover();
        //return;        
    }

    function AcquireLedgeCover()
    {
        GotoState('None');
        CoverAcquired(LedgeWalkCovInfo);
        //return;        
    }

    function OnWeaponEquipped()
    {
        // End:0x10
        if(bPreciseDestination == false)
        {
        }
        //return;        
    }
    stop;    
}

simulated state EjectVSState
{
    ignores NextWeapon, PrevWeapon, SwitchToBestWeapon, CheckForFalling;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        bDoBoneTranslation = false;
        super(SPStateObject).BeginState(PreviousStateName);
        // End:0xA8
        if(((int(MyPlayerPawn.ExitType) == int(0)) && int(MyPlayerPawn.ExitStyle) == int(1)) && int(MyPlayerPawn.ExitDirection) != int(2))
        {
            WinchBoneAttach();
        }
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        WinchBoneDetach();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function @NULL WinchBoneAttach()
    {
        local /*0x97E50000-0x00000000*/ private @NULL vsPawn;
        local /*0x97E50000-0x00000000*/ private name HideCableSocket;
        local /*0x97E50000-0x00000400*/ private @NULL CableMesh;

        vsPawn = LPVSPlayerPawn(ExitVSPawn);
        // End:0x380
        if((vsPawn != none) && MyPlayerPawn != none)
        {
            bDoBoneTranslation = true;
            CableMesh = vsPawn.KernCableComponent;
            ExitCableSkelControl = ((int(MyPlayerPawn.ExitDirection) == int(0)) ? vsPawn.FrontCableSkelControl : vsPawn.RearCableSkelControl);
            HideCableSocket = ((int(MyPlayerPawn.ExitDirection) == int(0)) ? 'HideCableFront' : 'HideCableBack');
            UpdateWinchLocation(ExitCableSkelControl, vsPawn, HideCableSocket);
            ExitCableSkelControl.SetSkelControlActive(true);
            ExitCableSkelControl.SetSkelControlStrength(1.0000000, 0.0000000);
            ExitCableEndComponentSkelControl = SkelControlSingleBone(CableMesh.FindSkelControl(vsPawn.KernCableEndSkelControllerName));
            ExitCableHookComponentSkelControl = SkelControlSingleBone(CableMesh.FindSkelControl(vsPawn.KernCableHookSkelControllerName));
            HumanPlayerPawn.Mesh.AttachComponentToSocket(CableMesh, 'ExitCableAttach');
            ExitCableAttachSocket = ((int(MyPlayerPawn.ExitDirection) == int(0)) ? 'GrappleFront' : 'GrappleBack');
            UpdateWinch();
            ExitCableEndComponentSkelControl.SetSkelControlActive(true);
            ExitCableEndComponentSkelControl.SetSkelControlStrength(1.0000000, 0.0000000);
            ExitCableHookComponentSkelControl.SetSkelControlActive(true);
            ExitCableHookComponentSkelControl.SetSkelControlStrength(1.0000000, 0.0000000);
            CableMesh.SetHidden(false);
        }
        //return;        
    }

    function @NULL WinchBoneDetach()
    {
        local /*0x97E50000-0x00000400*/ private @NULL CableMesh;

        // End:0x165
        if(bDoBoneTranslation && ExitCableSkelControl != none)
        {
            bDoBoneTranslation = false;
            UpdateWinchLocation(ExitCableSkelControl, Pawn, 'ExitCableAttach');
            ExitCableSkelControl.SetSkelControlStrength(0.0000000, 0.5000000);
            ExitCableSkelControl = none;
            CableMesh = LPVSPlayerPawn(ExitVSPawn).KernCableComponent;
            CableMesh.SetHidden(true);
            HumanPlayerPawn.DetachComponent(CableMesh);
            ExitCableEndComponentSkelControl.SetSkelControlStrength(0.0000000, 0.0000000);
            ExitCableEndComponentSkelControl = none;
            ExitCableHookComponentSkelControl.SetSkelControlStrength(0.0000000, 0.0000000);
            ExitCableHookComponentSkelControl = none;
        }
        //return;        
    }

    function UpdateWinchLocation()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InSkelControl[8388609], InRoot;
        local /*0x97E50000-0x00000000*/ private name InSocket[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL socketLoc[26214401];

        // End:0x7E
        if((InRoot != none) && InRoot.Mesh != none)
        {
            InRoot.Mesh.GetSocketWorldLocationAndRotation(InSocket, socketLoc);
        }
        // End:0xB5
        if(InSkelControl != none)
        {
            InSkelControl.BoneTranslation = socketLoc;
        }
        //return;        
    }

    function UpdateWinch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL VSAttachLoc, HandAttachLoc, rotToVS;

        UpdateWinchLocation(ExitCableEndComponentSkelControl, ExitVSPawn, ExitCableAttachSocket, VSAttachLoc);
        HumanPlayerPawn.Mesh.GetSocketWorldLocationAndRotation('ExitCableAttach', HandAttachLoc);
        rotToVS = Rotator(VSAttachLoc - HandAttachLoc);
        ExitCableHookComponentSkelControl.BoneRotation = rotToVS;
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        // End:0x17
        if(bDoBoneTranslation)
        {
            UpdateWinch();
        }
        //return;        
    }
    stop;    
}

state DeployManualPerk
{
    ignores PrevWeapon, NextWeapon, SwitchToBestWeapon, ActivatePerk, AssignPerk, UseActivePerk;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Perks, PD, PBB;

        Perks = LPPRI(PlayerReplicationInfo).PerksManager;
        // End:0x5F
        if(Perks != none)
        {
            Perks.UseActivePerk();
        }
        super(SPStateObject).BeginState(PreviousStateName);
        SetDefaultCam();
        // End:0xB2
        if(IsLocalPlayerController())
        {
            LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
        }
        AllowAimDownSight(false);
        PauseFire();
        bWantsNextWeapon = false;
        EndSprint();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        PerkDeploySpecialMoveClass = none;
        Perks.GetActiveDeploymentModePerk().DeactivateDeploymentGuides();
        // End:0x330
        if(int(Role) == int(ROLE_Authority))
        {
            PD = Perks.GetActiveDeploymentModePerk();
            // End:0x1EE
            if(PD == none)
            {
                MPEnterWalkState();
                return;
            }
            PBB = LPTuneDataPerkBeaconBase(PD.GetTuneData());
            // End:0x23C
            if(PBB == none)
            {
                MPEnterWalkState();
                return;
            }
            // End:0x2CC
            if((PBB.PlayerDeploySpecialMove == none) || PBB.DeploymentTime.GetValue() <= float(0))
            {
                Perks.SpawnPerkTarget();
                MPEnterWalkState();
                return;
            }
            PerkDeploySpecialMoveClass = PBB.PlayerDeploySpecialMove;
            MyPlayerPawn.ServerDoSpecialMove(PerkDeploySpecialMoveClass, true, true, DeployAnimationCompleted, none);
        }
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        ClearAnimatedCamera();
        SetDefaultCam();
        UnPauseFire();
        AllowAimDownSight();
        // End:0xA4
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x99
            if((MyPlayerPawn != none) && PerkDeploySpecialMoveClass != none)
            {
                MyPlayerPawn.ServerEndSpecialMove(PerkDeploySpecialMoveClass);
            }
            PerkDeploySpecialMoveClass = none;
        }
        LPPRI(PlayerReplicationInfo).PerksManager.DeactivateDeploymentMode();
        //return;        
    }

    function NotifyGrenadeReleased()
    {
        DeployAnimationDeployNotify();
        //return;        
    }

    function DeployAnimationDeployNotify()
    {
        local /*0x97E50000-0x00000000*/ private float DeploymentTime;
        local /*0x97E50000-0x00000000*/ private @NULL Perks;
        local /*0x97E50000-0x00000000*/ private bool bSpawned;
        local /*0x97E50000-0x00000000*/ private @NULL MyPRI, LPSM;

        MyPRI = LPPRI(PlayerReplicationInfo);
        Perks = MyPRI.PerksManager;
        // End:0x1BF
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x1BF
            if(!Perks.bPerkDeployedOK)
            {
                DeploymentTime = MyPRI.GetReplicatedPerkDeployTime(Perks.GetActiveDeploymentModePerk().PerkIndex);
                bSpawned = Perks.SpawnPerkTarget();
                Perks.bPerkDeployedOK = bSpawned;
                // End:0x1BF
                if(!bSpawned || DeploymentTime <= float(0))
                {
                    LPSM = LPSM_PlayerDeployDeployableBase(MySPPawn.GetCurrentSpecialMoveInstance());
                    // End:0x1B2
                    if(LPSM != none)
                    {
                        LPSM.NextSequence();                        
                    }
                    else
                    {
                        MPEnterWalkState();
                    }
                    return;
                }
            }
        }
        //return;        
    }

    simulated function DeployAnimationCompleted()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM, DeployedPerk;

        // End:0xF5
        if(int(Role) == int(ROLE_Authority))
        {
            DeployedPerk = LPPRI(PlayerReplicationInfo).PerksManager.GetActiveDeploymentModePerk();
            // End:0x83
            if(LPPerkProtoHarmonizer(DeployedPerk) != none)
            {
                BroadcastChatter(18);                
            }
            else
            {
                // End:0xAB
                if(LPPerkAmmoPack(DeployedPerk) != none)
                {
                    BroadcastChatter(1);                    
                }
                else
                {
                    // End:0xEA
                    if((LPPerkChaingunTurret(DeployedPerk) != none) || LPPerkProximityMine(DeployedPerk) != none)
                    {
                        BroadcastChatter(21);
                    }
                }
            }
            MPEnterWalkState();
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x8C
        if(int(Pawn.Physics) == int(2))
        {
            EnterWalkState();
        }
        // End:0xC3
        if((MyBasePlayerPawn == none) || Pawn == none)
        {
            MPStartState('Dead');            
        }
        else
        {
            TurnToFace(DeltaTime, LPPRI(PlayerReplicationInfo).PerksManager.DeploymentRotation);
            ViewRotation = Rotation;
            DeltaRot.Yaw = int(PlayerInput.aTurn);
            DeltaRot.Pitch = int(PlayerInput.aLookUp);
            ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
            // End:0x21B
            if(int(Role) < int(ROLE_Authority))
            {
                ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));                
            }
            else
            {
                ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
            }
        }
        //return;        
    }

    function CanSprint()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

state ActiveDefense
{
    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        PauseFire();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        UnPauseFire();
        //return;        
    }

    function DoesStateAllow_ForkArm()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

state ForkArmGrab
{
    ignores WinchArmButtonPress;

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        ComputeLookAndTurnDeltas(DeltaTime, DeltaRot);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        SetRotation(Pawn.Rotation);
        // End:0xD3
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

state WinchedLargePawn
{
    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        ComputeLookAndTurnDeltas(DeltaTime, DeltaRot);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        SetRotation(Pawn.Rotation);
        // End:0xD3
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

state AcidStreamed
{
    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x2A
        if(IsLocalPlayerController())
        {
            PauseFire();
        }
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        // End:0x2A
        if(IsLocalPlayerController())
        {
            UnPauseFire();
        }
        //return;        
    }

    function AllowEvade()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation, newAccel;
        local /*0x97E50000-0x00000000*/ private class RollSMClass;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        UpdateAccelRateForSpecialMove(DeltaTime, newAccel);
        // End:0x150
        if(PlayerMoveInfo.bEvadeButtonPressed)
        {
            RollSMClass = GetPlayerRoll();
            // End:0x131
            if(RollSMClass != none)
            {
                bPressedJump = false;
                StartRoll(RollSMClass);
            }
            PlayerMoveInfo.bEvadeButtonPressed = false;
        }
        // End:0x192
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, newAccel, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, newAccel, 0, rot(0, 0, 0));
        }
        //return;        
    }

    function EndState_AcidStreamed()
    {
        GotoState('PlayerWalking');
        //return;        
    }
    stop;    
}

state InteractingWithGeneralInteractionObject
{
    ignores PrevWeapon, SwitchToBestWeapon, InteractionObjectEvent_OperateComplete, InteractionObjectEvent_AbortComplete;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x48
        if(IsLocalPlayerController())
        {
            LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
        }
        SetDefaultCam(GeneralInteractionObjectTransitionParam);
        // End:0xCD
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0xCD
            if((LastTouchedGeneralInteractionObject == none) || !LastTouchedGeneralInteractionObject.CanBeOperatedBy(LPBasePlayerPawn(Pawn)))
            {
                ClearGeneralPlayerInteractionObjectPrompt();
                MPEnterWalkState();
                return;
            }
        }
        LastTouchedGeneralInteractionObject.SetCurrentOperator(LPBasePlayerPawn(Pawn));
        bFire = 0;
        StopFire(0);
        bWantsNextWeapon = false;
        EndSprint();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        HideCrosshair(true);
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x21A
        if(int(Role) == int(ROLE_Authority))
        {
            MyPlayerPawn.ServerDoSpecialMove(Class'LPSM_PlayerInteractionObject', true, true, OnGeneralInteractionObjectSMEnd, LastTouchedGeneralInteractionObject);
            SetTimer(0.1000000, true, 'CheckInteractionProgress');
        }
        // End:0x246
        if(LastTouchedGeneralInteractionObject.IsInteractive())
        {
            ClearGeneralPlayerInteractionObjectPrompt();
        }
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearTimer('CheckInteractionProgress');
        ClearTimer('FinishInteraction');
        super(SPStateObject).EndState(NextStateName);
        HideCrosshair(false);
        // End:0x8E
        if((LastTouchedGeneralInteractionObject != none) && LastTouchedGeneralInteractionObject.bResetCameraOnComplete)
        {
            ClearAnimatedCamera();
            SetDefaultCam();
        }
        //return;        
    }

    function OnGeneralInteractionObjectSMEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        MPEnterWalkState();
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    function DoFinishInteraction()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SM;

        SM = LPSM_PlayerInteractionObject(MySPPawn.GetCurrentSpecialMoveInstance());
        // End:0x63
        if(SM != none)
        {
            SM.CompleteInteraction();            
        }
        else
        {
            MPEnterWalkState();
        }
        ClearTimer('FinishInteraction');
        //return;        
    }

    function FinishInteraction()
    {
        DoFinishInteraction();
        ClientDoFinishDoGeneralInteractionOperation();
        //return;        
    }

    reliable client simulated function ClientDoFinishDoGeneralInteractionOperation()
    {
        DoFinishInteraction();
        //return;        
    }

    function CheckInteractionProgress()
    {
        // End:0x40
        if((LastTouchedGeneralInteractionObject == none) || !LastTouchedGeneralInteractionObject.IsEnabled())
        {
            MPEnterWalkState();
        }
        //return;        
    }

    function DoEndDoGeneralInteractionOperation()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SM;

        SM = LPSM_PlayerInteractionObject(MySPPawn.GetCurrentSpecialMoveInstance());
        // End:0x63
        if(SM != none)
        {
            SM.AbortInteraction();            
        }
        else
        {
            MPEnterWalkState();
        }
        ClearTimer('CheckInteractionProgress');
        //return;        
    }

    reliable client simulated function ClientDoEndDoGeneralInteractionOperation()
    {
        DoEndDoGeneralInteractionOperation();
        //return;        
    }

    function EndDoGeneralInteractionOperation()
    {
        // End:0x3F
        if((LastTouchedGeneralInteractionObject != none) && !LastTouchedGeneralInteractionObject.IsPressOnly())
        {
            ServerEndDoGeneralInteractionOperation();
        }
        //return;        
    }

    reliable server function ServerEndDoGeneralInteractionOperation()
    {
        DoEndDoGeneralInteractionOperation();
        ClientDoEndDoGeneralInteractionOperation();
        //return;        
    }

    function InteractionObjectEvent_PrepareComplete()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InterObj[8388609], SM;

        SM = LPSM_PlayerInteractionObject(MySPPawn.GetCurrentSpecialMoveInstance());
        // End:0x152
        if((((int(Role) == int(ROLE_Authority)) && SM != none) && !SM.bAbortedByController) && !SM.bCompletedByController)
        {
            // End:0x102
            if(InterObj.IsPressOnly() && !InterObj.IsInteractive())
            {
                HandleNotifyInteractionObjectTriggerExternal();
                FinishInteraction();                
            }
            else
            {
                // End:0x152
                if(!InterObj.IsInteractive())
                {
                    SetTimer(InterObj.OperationLength, false, 'FinishInteraction');
                }
            }
        }
        //return;        
    }

    function InteractionObjectEvent_CompleteComplete()
    {
        local /*0x97E50000-0x00000000*/ private @NULL InterObj[8388609];

        HandleNotifyInteractionObjectTriggerExternal();
        //return;        
    }

    event HandleNotifyInteractionObjectTriggerExternal()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SM;

        SM = LPSM_PlayerInteractionObject(MySPPawn.GetCurrentSpecialMoveInstance());
        // End:0x8A
        if(((int(Role) == int(ROLE_Authority)) && SM != none) && LastTouchedGeneralInteractionObject != none)
        {
            LastTouchedGeneralInteractionObject.HandleNotifyInteractionObjectTriggerExternal();            
        }
        //return;        
    }

    function InteractiveMovieInput()
    {
        local /*0x97E50000-0x00000000*/ private int iDirection[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x4A
        if(LastTouchedGeneralInteractionObject.IsInteractive())
        {
            LastTouchedGeneralInteractionObject.InputDirection(iDirection);
        }
        return true;
        //return ReturnValue;        
    }

    function StartGeneralInteractionOperation()
    {
        // End:0x2C
        if(LastTouchedGeneralInteractionObject.IsInteractive())
        {
            ServerEndDoGeneralInteractionOperation();
        }
        //return;        
    }
    stop;    
}

state HackDeployable
{
    ignores PrevWeapon, SwitchToBestWeapon;

    simulated event @NULL BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000400*/ private @NULL C;

        C = Class'LPPerks'.static.FindHackableComponent(LastTouchedHackableDeployableComponentOwner);
        // End:0x4D
        if(C == none)
        {
            StopHacking();
            return;
        }
        super(SPStateObject).BeginState(PreviousStateName);
        // End:0xD3
        if(IsLocalPlayerController())
        {
            DisplayHackDeployablePrompt(C.HUDHackPromptString);
            SetDefaultCam();
            SetAimDownSightMode(false);
            LPPlayerInput(PlayerInput).UseDefaultRotationInputCurve();
        }
        // End:0x131
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0x131
            if((LastTouchedHackableDeployableComponentOwner == none) || !C.CanBeHacked(MyPlayerPawn))
            {
                StopHacking();
                return;
            }
        }
        PauseFire();
        bWantsNextWeapon = false;
        EndSprint();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        HideCrosshair(true);
        Pawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MyPlayerPawn.DoSpecialMove(Class'LPSM_PlayerHackDeployable', true, true, OnHackDeployableSMEnd, C.Owner);
        // End:0x254
        if(int(Role) == int(ROLE_Authority))
        {
            SetTimer(0.1000000, true, 'CheckHackDeployableProgress');
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL SM;

        ClearTimer('CheckHackDeployableProgress');
        ClearTimer('FinishHackDeployable');
        // End:0xA5
        if(int(Role) != int(ROLE_Authority))
        {
            SM = LPSM_PlayerHackDeployable(MySPPawn.GetCurrentSpecialMoveInstance());
            // End:0xA5
            if(SM != none)
            {
                MyPlayerPawn.EndSpecialMove(Class'LPSM_PlayerHackDeployable');
            }
        }
        // End:0xE6
        if(IsLocalPlayerController())
        {
            HideCrosshair(false);
            ClearAnimatedCamera();
            SetDefaultCam();
            UnPauseFire();
            ClearHackDeployablePrompt();
        }
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function OnHackDeployableSMEnd()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        StopHacking();
        //return;        
    }

    function StopHacking()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SM;

        // End:0x8B
        if(int(Role) == int(ROLE_Authority))
        {
            SM = LPSM_PlayerHackDeployable(MySPPawn.GetCurrentSpecialMoveInstance());
            // End:0x80
            if(SM != none)
            {
                MyPlayerPawn.EndSpecialMove(Class'LPSM_PlayerHackDeployable');                
            }
            else
            {
                MPEnterWalkState();
            }
        }
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x109
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }

    function DoFinishHackDeployable()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SM;

        SM = LPSM_PlayerHackDeployable(MySPPawn.GetCurrentSpecialMoveInstance());
        // End:0x63
        if(SM != none)
        {
            SM.CompleteHack();            
        }
        else
        {
            StopHacking();
        }
        ClearHackDeployablePrompt();
        ClearTimer('FinishHackDeployable');
        //return;        
    }

    function FinishHackDeployable()
    {
        // End:0x37
        if(int(Role) == int(ROLE_Authority))
        {
            DoFinishHackDeployable();
            // End:0x37
            if(!IsLocalPlayerController())
            {
                ClientDoFinishDoHackDeployableOperation();
            }
        }
        //return;        
    }

    reliable client simulated function ClientDoFinishDoHackDeployableOperation()
    {
        DoFinishHackDeployable();
        //return;        
    }

    function @NULL CheckHackDeployableProgress()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SM, C;

        C = Class'LPPerks'.static.FindHackableComponent(LastTouchedHackableDeployableComponentOwner);
        // End:0x4D
        if(C == none)
        {
            StopHacking();
            return;
        }
        SM = LPSM_PlayerHackDeployable(MySPPawn.GetCurrentSpecialMoveInstance());
        // End:0xCF
        if(((LastTouchedHackableDeployableComponentOwner == none) || C.Owner == none) || SM == none)
        {
            StopHacking();
        }
        //return;        
    }

    function DoEndDoHackDeployableOperation()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SM;

        SM = LPSM_PlayerHackDeployable(MySPPawn.GetCurrentSpecialMoveInstance());
        // End:0x63
        if(SM != none)
        {
            SM.AbortHack();            
        }
        else
        {
            StopHacking();
        }
        ClearHackDeployablePrompt();
        ClearTimer('CheckHackDeployableProgress');
        //return;        
    }

    reliable client simulated function ClientDoEndDoHackDeployableOperation()
    {
        DoEndDoHackDeployableOperation();
        //return;        
    }

    function EndDoHackDeployableOperation()
    {
        ServerEndDoHackDeployableOperation();
        //return;        
    }

    reliable server function ServerEndDoHackDeployableOperation()
    {
        DoEndDoHackDeployableOperation();
        ClientDoEndDoHackDeployableOperation();
        //return;        
    }

    function @NULL HackDeployableEvent_PrepareComplete()
    {
        local /*0x97E50000-0x00000400*/ private @NULL HackObj[8388609], SM;
        local /*0x97E50000-0x00000000*/ private float HackTime;

        SM = LPSM_PlayerHackDeployable(MySPPawn.GetCurrentSpecialMoveInstance());
        // End:0xF4
        if(((SM != none) && !SM.bAbortedByController) && !SM.bCompletedByController)
        {
            HackTime = 2.0000000 / MyPlayerPawn.GetHackSpeedMultiplier();
            // End:0xEA
            if(HackTime > 0.0000000)
            {
                SetTimer(HackTime, false, 'FinishHackDeployable');                
            }
            else
            {
                FinishHackDeployable();
            }
        }
        //return;        
    }

    function @NULL HackDeployableEvent_OperateComplete()
    {
        local /*0x97E50000-0x00000400*/ private @NULL HackObj[8388609], Target, Thief, C, PRI;

        ClearHackDeployablePrompt();
        C = Class'LPPerks'.static.FindHackableComponent(LastTouchedHackableDeployableComponentOwner);
        // End:0x58
        if(C == none)
        {
            EndDoHackDeployableOperation();            
        }
        else
        {
            // End:0x222
            if(LastTouchedHackableDeployableComponentOwner != none)
            {
                PRI = LPPRI(PlayerReplicationInfo);
                Target = C.GetPerkDeployable();
                Thief = LPPerkNanoThief(PRI.PerksManager.QueryPerkClass(Class'LPPerkNanoThief'.default.PerkIndex));
                // End:0x218
                if((Target != none) && Thief != none)
                {
                    C.AssimilateTotem(self);
                    ClientSetNanoThiefIdentity(Target.PerkIndex);
                    // End:0x208
                    if(int(Role) == int(ROLE_Authority))
                    {
                        MyPlayerPawn.AddThermalEnergy(-1.0000000 * FMin(MyPlayerPawn.GetEnergyCount(), Thief.GetCost(true)), false);
                        IncrementStat('Stat_TotemsHacked');
                    }
                    BroadcastChatter(8);                    
                }
                else
                {
                    EndDoHackDeployableOperation();
                }
            }
        }
        ClearTimer('CheckHackDeployableProgress');
        //return;        
    }

    function @NULL GetHackDeployableCompletionPercentage()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], HackTime, HackTotal, HackPercentage;
        local /*0x97E50000-0x00000000*/ private @NULL SM, C;

        // End:0x143
        if(IsTimerActive('FinishHackDeployable') && LastTouchedHackableDeployableComponentOwner != none)
        {
            SM = LPSM_PlayerHackDeployable(MySPPawn.GetCurrentSpecialMoveInstance());
            // End:0x143
            if((SM != none) && SM.IsOperating())
            {
                C = Class'LPPerks'.static.FindHackableComponent(LastTouchedHackableDeployableComponentOwner);
                // End:0xD4
                if(C == none)
                {
                    return 0.0000000;
                }
                HackTotal = GetTimerRate('FinishHackDeployable');
                HackTime = GetRemainingTimeForTimer('FinishHackDeployable');
                HackPercentage = (HackTotal - HackTime) / HackTotal;
                return HackPercentage;
            }
        }
        return 0.0000000;
        //return ReturnValue;        
    }
    stop;    
}

state PlayerTakeDownDeath extends PlayerFaceRotationState
{
    ignores CheckForFalling, DoPawnRotation;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        ClearAnimatedCamera();
        PauseFire();
        PlayerMoveInfo.bSpecialActionButtonPressed = false;
        bWantsNextWeapon = false;
        SetDefaultCam();
        CutCameraModeInternalParams();
        HideCrosshair(true);
        SetHumanOwnerNoSee(false);
        Class'SPCamera.SPCameraRigOffset'.static.SetLocalPlayerInvisibility(MyBasePlayerPawn, false);
        EndSprint();
        MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.SetPhysics(4);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        MyBasePlayerPawn.ServerEndSpecialMove(none);
        // End:0x55
        if(NextStateName != 'Incapacitated')
        {
            MPEnterWalkState();
        }
        // End:0x98
        if(int(Pawn.Physics) == int(4))
        {
            Pawn.SetPhysics(1);
        }
        //return;        
    }
    stop;    
}

state WaitingForGameStart
{
    ignores CallUpdateGrappleHookTargets, CallUpdateCurrentGrappleHookTarget;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        LocalSecondsUntilGameStarts = LPGRI_Base_MP(WorldInfo.GRI).TimeToDelayGameStart;
        SetTimer(1.0000000, false, 'UpdateCountdown');
        // End:0xB0
        if((int(Role) == int(ROLE_Authority)) && IsLocalPlayerController())
        {
            WorldInfo.bPlayersOnlyPending = true;
        }
        //return;        
    }

    function onNotifySecondsUntilGameStarts()
    {
        local /*0x97E50000-0x00000000*/ private int SecondsUntilGameStarts[8388609];

        ClearTimer('UpdateCountdown');
        LocalSecondsUntilGameStarts = SecondsUntilGameStarts;
        // End:0x5E
        if(myLPHUD != none)
        {
            myLPHUD.SetGameBeginCountdownTime(LocalSecondsUntilGameStarts);
        }
        // End:0x7A
        if(SecondsUntilGameStarts == 0)
        {
            OkToStartPlaying();            
        }
        else
        {
            SetTimer(1.0000000, false, 'UpdateCountdown');
        }
        //return;        
    }

    function UpdateCountdown()
    {
        ClearTimer('UpdateCountdown');
        // End:0x10E
        if((int(Role) == int(ROLE_Authority)) && IsLocalPlayerController())
        {
            --LPGRI_Base_MP(WorldInfo.GRI).SecondsUntilGameStarts;
            LocalSecondsUntilGameStarts = LPGRI_Base_MP(WorldInfo.GRI).SecondsUntilGameStarts;
            // End:0xF2
            if(myLPHUD != none)
            {
                myLPHUD.SetGameBeginCountdownTime(LocalSecondsUntilGameStarts);
            }
            // End:0x10B
            if(LocalSecondsUntilGameStarts == 0)
            {
                OkToStartPlaying();
            }            
        }
        else
        {
            --LocalSecondsUntilGameStarts;
            // End:0x1B8
            if(LocalSecondsUntilGameStarts < 0)
            {
                // End:0x1B8
                if((LocalSecondsUntilGameStarts < -3) && int(Role) != int(ROLE_Authority))
                {
                    ReturnToMPLobby("<Strings:Engine.Errors.ConnectionFailed>", "<Strings:Engine.Errors.ConnectionFailed_Title>", true);
                    return;
                }
            }
            // End:0x200
            if((myLPHUD != none) && LocalSecondsUntilGameStarts >= 0)
            {
                myLPHUD.SetGameBeginCountdownTime(LocalSecondsUntilGameStarts);
            }
        }
        SetTimer(1.0000000, false, 'UpdateCountdown');
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        WorldInfo.bPlayersOnlyPending = false;
        WorldInfo.bPlayersOnly = false;
        ClearTimer('UpdateCountdown');
        ClearTimer('OkToStartPlaying');
        myLPHUD.SetGameBeginCountdownTime(0);
        bGameStarted = true;
        // End:0xC0
        if(NextStateName != 'PlayerWalking')
        {
        }
        // End:0x11F
        if(IsLocalPlayerController())
        {
            // End:0x11F
            if((myLPHUD != none) && myLPHUD.ScoreboardIsShown())
            {
                myLPHUD.ToggleRoundScoreboard();
            }
        }
        //return;        
    }

    function OkToStartPlaying()
    {
        MPStartState('PlayerWalking');
        //return;        
    }

    function DisableAI()
    {
        local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

        // End:0x8A
        foreach WorldInfo.AllControllers(Class'LPAIController', currentNpc)
        {
            currentNpc.SetTickIsDisabled(true);
            currentNpc.Pawn.SetTickIsDisabled(true);            
        }        
        //return;        
    }

    function EnableAI()
    {
        local /*0x97E50000-0x00000000*/ private @NULL currentNpc;

        // End:0x8A
        foreach WorldInfo.AllControllers(Class'LPAIController', currentNpc)
        {
            currentNpc.SetTickIsDisabled(false);
            currentNpc.Pawn.SetTickIsDisabled(false);            
        }        
        //return;        
    }

    function PlayerMove()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DeltaRot, ViewRotation;

        // End:0x43
        if(!myLPHUD.ScoreboardIsShown())
        {
            myLPHUD.ToggleRoundScoreboard();
        }
        ViewRotation = Rotation;
        DeltaRot.Yaw = int(PlayerInput.aTurn);
        DeltaRot.Pitch = int(PlayerInput.aLookUp);
        ProcessViewRotation(DeltaTime, ViewRotation, DeltaRot);
        // End:0x14C
        if(int(Role) < int(ROLE_Authority))
        {
            ReplicateMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));            
        }
        else
        {
            ProcessMove(DeltaTime, Pawn.Acceleration, 0, rot(0, 0, 0));
        }
        //return;        
    }
    stop;    
}

state ServerWaitForJoinInProgressPlayer
{
    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        Pawn.SetHidden(true);
        SetTimer(15.0000000, false, 'TimeoutWaitingForJoinInProgressPlayer');
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        ClearTimer('TimeoutWaitingForJoinInProgressPlayer');
        Pawn.SetHidden(false);
        ClientStartOnlineGame();
        //return;        
    }

    function TimeoutWaitingForJoinInProgressPlayer()
    {
        EnterStartState();
        //return;        
    }
    stop;    
}

auto state PlayerWaiting
{
    ignores PlayerMove;

    reliable client simulated event ClientShowLoadingMovie()
    {
        local /*0x97E50000-0x00000000*/ private bool bShowMovie[8388609], bPauseAfterHide;
        local /*0x97E50000-0x00000000*/ private float PauseDuration[9437185], KeepPlayingDuration;
        local /*0x97E50000-0x00000000*/ private bool OverridePreviousDelays[9437185];
        local /*0x97E50000-0x00000000*/ private editfixedsize string ForMap[9437185];

        // End:0x83
        if(bShowMovie || int(WorldInfo.NetMode) == int(NM_Standalone))
        {
            super(SPPlayerController).ClientShowLoadingMovie(bShowMovie, bPauseAfterHide, PauseDuration, KeepPlayingDuration, OverridePreviousDelays, ForMap);            
        }
        else
        {
            ScriptTrace();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: LPFXActionManager'Default__LPPlayerController.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0 class=Class'LPFXActionManager'
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPCameraModeAimControlFirstPersonParam'Default__LPPlayerController.FirstPersonAimCamParamObj'
    begin object name=FirstPersonAimCamParamObj class=Class'LPCameraModeAimControlFirstPersonParam'
    end object
    FirstPersonAimCamParams=FirstPersonAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPlayerController.FirstPersonAimTransitionParamObj'
    begin object name=FirstPersonAimTransitionParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.3500000
    end object
    FirstPersonAimTransitionParam=FirstPersonAimTransitionParamObj
    // Reference: LPCameraModeAimControlThirdPersonParam'Default__LPPlayerController.ThirdPersonAimCamParamObj'
    begin object name=ThirdPersonAimCamParamObj class=Class'LPCameraModeAimControlThirdPersonParam'
    end object
    ThirdPersonAimCamParams=ThirdPersonAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPlayerController.ThirdPersonAimTransitionParamObj'
    begin object name=ThirdPersonAimTransitionParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.2500000
    end object
    ThirdPersonAimTransitionParam=ThirdPersonAimTransitionParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPlayerController.ShoulderAimTransitionParamObj'
    begin object name=ShoulderAimTransitionParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.1000000
    end object
    ShoulderAimTransitionParam=ShoulderAimTransitionParamObj
    // Reference: LPCameraModeAimControlJobLogParam'Default__LPPlayerController.JobLogCamParamObj'
    begin object name=JobLogCamParamObj class=Class'LPCameraModeAimControlJobLogParam'
    end object
    JobLogCamParams=JobLogCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPlayerController.JobLogCamTransitionInParamObj'
    begin object name=JobLogCamTransitionInParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.3300000
    end object
    JobLogTransitionInParam=JobLogCamTransitionInParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPlayerController.JobLogCamTransitionOutParamObj'
    begin object name=JobLogCamTransitionOutParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.5000000
    end object
    JobLogTransitionOutParam=JobLogCamTransitionOutParamObj
    // Reference: LPCameraModeAimControlRagdollParam'Default__LPPlayerController.RagdollCamParamObj'
    begin object name=RagdollCamParamObj class=Class'LPCameraModeAimControlRagdollParam'
    end object
    RagdollCamParams=RagdollCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPlayerController.RagdollCamTransitionInParamObj'
    begin object name=RagdollCamTransitionInParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.5000000
    end object
    RagdollTransitionInParam=RagdollCamTransitionInParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPlayerController.RagdollCamTransitionOutParamObj'
    begin object name=RagdollCamTransitionOutParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.5000000
    end object
    RagdollTransitionOutParam=RagdollCamTransitionOutParamObj
    // Reference: LPCameraModeAimControlGrenadeParam'Default__LPPlayerController.GrenadeAimCamParamObj'
    begin object name=GrenadeAimCamParamObj class=Class'LPCameraModeAimControlGrenadeParam'
    end object
    GrenadeAimCamParams=GrenadeAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPlayerController.GrenadeAimTransitionParamObj'
    begin object name=GrenadeAimTransitionParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.2000000
    end object
    GrenadeAimTransitionParam=GrenadeAimTransitionParamObj
    // Reference: LPCameraModeAimControlCrouchParam'Default__LPPlayerController.CrouchAimCamParamObj'
    begin object name=CrouchAimCamParamObj class=Class'LPCameraModeAimControlCrouchParam'
    end object
    CrouchAimCamParams=CrouchAimCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPlayerController.CrouchAimTransitionParamObj'
    begin object name=CrouchAimTransitionParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.4600000
    end object
    CrouchAimTransitionParam=CrouchAimTransitionParamObj
    // Reference: LPCameraModeVSRepairParam'Default__LPPlayerController.VSRepairCamParamObj'
    begin object name=VSRepairCamParamObj class=Class'LPCameraModeVSRepairParam'
    end object
    VSRepairCamParams=VSRepairCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPPlayerController.VSRepairTransitionParamObj'
    begin object name=VSRepairTransitionParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.2500000
    end object
    VSRepairTransitionParam=VSRepairTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPlayerController.ThermalPostTransitionParamObj'
    begin object name=ThermalPostTransitionParamObj class=Class'LPCameraTransitionCutParam'
    end object
    ThermalPostTransitionParam=ThermalPostTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPlayerController.ReviveIncapacitatedTransitionParamObj'
    begin object name=ReviveIncapacitatedTransitionParamObj class=Class'LPCameraTransitionCutParam'
    end object
    ReviveIncapacitatedTransitionParam=ReviveIncapacitatedTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPlayerController.GeneralInteractionObjectTransitionParamObj'
    begin object name=GeneralInteractionObjectTransitionParamObj class=Class'LPCameraTransitionCutParam'
    end object
    GeneralInteractionObjectTransitionParam=GeneralInteractionObjectTransitionParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPPlayerController.HardCutTransitionParamObj'
    begin object name=HardCutTransitionParamObj class=Class'LPCameraTransitionCutParam'
    end object
    HardCutTransitionParam=HardCutTransitionParamObj
    // Reference: SPCameraModeZoomToTargetParam'Default__LPPlayerController.DeathCameraZoomCamParamObj'
    begin object name=DeathCameraZoomCamParamObj class=Class'SPCamera.SPCameraModeZoomToTargetParam'
    end object
    DeathCameraZoomCamParams=DeathCameraZoomCamParamObj
    // Reference: LPCameraTransitionEaseInOutParam'Default__LPPlayerController.DeathCameraZoomTransitionParamObj'
    begin object name=DeathCameraZoomTransitionParamObj class=Class'LPCameraTransitionEaseInOutParam'
        Duration=0.7500000
        bEnableInput=false
    end object
    DeathCameraZoomTransitionParam=DeathCameraZoomTransitionParamObj
    // Reference: LPCameraModeIncapacitatedThirdPersonParam'Default__LPPlayerController.IncapacitatedCameraParamsObj'
    begin object name=IncapacitatedCameraParamsObj class=Class'LPCameraModeIncapacitatedThirdPersonParam'
    end object
    IncapacitatedCameraParams=IncapacitatedCameraParamsObj
    // Reference: LPCameraTransitionEaseInOutParam'Default__LPPlayerController.IncapacitatedTransitionParamObj'
    begin object name=IncapacitatedTransitionParamObj class=Class'LPCameraTransitionEaseInOutParam'
        Duration=0.5000000
    end object
    IncapacitatedTransitionParam=IncapacitatedTransitionParamObj
    // Reference: LPCameraModeAimControlInPlaceRepairParam'Default__LPPlayerController.InPlaceRepairCamParamsObj'
    begin object name=InPlaceRepairCamParamsObj class=Class'LPCameraModeAimControlInPlaceRepairParam'
    end object
    InPlaceRepairCamParams=InPlaceRepairCamParamsObj
    bGrappleEnabled=true
    bMeleeEnabled=true
    bEnableExtendedGrappleSearch=true
    bLeftLedgeTimerExpired=true
    bDisplayGrabPoints=true
    bHostGameEnabled=true
    bVSHasFullMunitionsLocker=true
    bDisplayCombatWindows=true
    bAimDownSightAllowed=true
    bUseSystemWideMuting=true
    FutureVSRotate180DotMaxDotProduct=-0.5000000
    // Reference: LPCameraTransitionCutParam'Default__LPPlayerController.VSCamTransitionInParamObj'
    begin object name=VSCamTransitionInParamObj class=Class'LPCameraTransitionCutParam'
    end object
    VSCamTransitionInParam=VSCamTransitionInParamObj
    // Reference: AkComponent'Default__LPPlayerController.MPAnnouncementComponentObj'
    begin object name=MPAnnouncementComponentObj class=Class'AkAudio.AkComponent'
    end object
    MPAnnouncementComponent=MPAnnouncementComponentObj
    SafetyDelayToUnPauseAiAfterEnteringOrExitingVs=3.0000000
    TimeToDelayNextRightArmPress=0.7000000
    // Reference: SPSeekFreePackageLoader'Default__LPPlayerController.LPPCSFLoaderDefObj'
    begin object name=LPPCSFLoaderDefObj class=Class'SPEngine.SPSeekFreePackageLoader'
    end object
    SeekFreeLoader=LPPCSFLoaderDefObj
    JobLogInfo=(TabIndex=0,MissionsRecord=(ListIndex=-1,ListSelectedIndex=-1),MapRecord=(bWorldMap=false,bListOpen=false,bListState=false,LocalMapDisplayIndex=0,MapZoneNameID="None"),InventoryRecord=(ListIndex=-1,ListSelectedIndex=-1),CollectiblesRecord=(ListIndex=-1,ListSelectedIndex=-1),MessagesRecord=(ListSelectedIndex=-1),MusicPlayerRecord=(ListSelectedIndex=-1))
    JobLogAutoOpenMessageTimeoutTime=8.0000000
    LedgeWalkCovInfo=none
    Rotate180Duration=0.5000000
    PickedTeamNum=255
    WeaponContentClassNames=/* Array type was not detected. */
    ServerWeapons[0]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[1]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[2]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[3]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[4]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[5]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[6]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[7]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[8]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[9]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[10]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[11]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[12]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[13]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[14]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[15]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[16]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[17]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[18]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[19]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[20]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[21]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[22]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[23]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    ServerWeapons[24]=(ClassName="NotYetReplicated!",RequiredDLCs=0)
    QuestProgressMessagesDuration=4
    // Reference: LPTVCameraManager'Default__LPPlayerController.TVCameraManager0'
    begin object name=TVCameraManager0 class=Class'LPTVCameraManager'
    end object
    TVCameraManager=TVCameraManager0
    ZiplineSlowdownDistance=75.0000000
    ZiplineDepartDistance=300.0000000
    FadeToBlockOnKillZDuration=1.0000000
    MapZones=/* Array type was not detected. */
    MissionFailedDelayForPostProcessEffect=1.0000000
    MissionFailedPostProcessEffectDuration=6.0000000
    MissionFailedPercentPostProcessEffectToFinish=1.0000000
    MinimumTimeBetweenRepairs=0.5000000
    MinimumDurationOfRepair=1.0000000
    bSynchronizePlayers=false
    CheckpointClass=Class'LPCheckpoint'
    // Reference: LPSoundModeManager'Default__LPPlayerController.LPSoundModeManagerA'
    begin object name=LPSoundModeManagerA class=Class'LPSoundModeManager'
    end object
    SoundModeManager=LPSoundModeManagerA
    HostMigrationManagerClass=Class'LPHostMigrationManager'
    CameraClass=Class'LPPlayerCamera'
    SavedMoveClass=Class'LPSavedMove'
    CheatClass=Class'LPCheatManager'
    InputClass=Class'LPPlayerInput'
    // Reference: CylinderComponent'Default__LPPlayerController.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=FXActionManagerDefObj0
    Components[2]=MPAnnouncementComponentObj
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}