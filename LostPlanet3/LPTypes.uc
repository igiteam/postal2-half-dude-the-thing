class LPTypes extends Object
    abstract;

enum ETemplateLogicPawnClassType
{
    etlpctMyClassType,              // 0
    etlpctTargetClassType,          // 1
    ETemplateLogicPawnClassType_MAX // 2
};

enum EBestiaryCategories
{
    EBestiaryCat_S,                 // 0
    EBestiaryCat_M,                 // 1
    EBestiaryCat_L,                 // 2
    EBestiaryCat_G,                 // 3
    EBestiaryCat_MAX                // 4
};

enum EEnvironmentalMessageTypes
{
    ENVMessage_Normal,              // 0
    ENVMessage_Warning,             // 1
    ENVMessage_Danger,              // 2
    ENVMessage_MAX                  // 3
};

enum EShopTypes
{
    EShopTypes_Gale,                // 0
    EShopTypes_Nevec,               // 1
    EShopTypes_SnowPirate,          // 2
    EShopTypes_Ethologist,          // 3
    EShopTypes_MAX                  // 4
};

enum ECurrencyType
{
    ECT_TEnergy,                    // 0
    ECT_Scrap,                      // 1
    ECT_WhiteLeechDNA,              // 2
    ECT_MAX                         // 3
};

enum EHUDUmbilicalState
{
    UHS_Normal,                     // 0
    UHS_Enabled,                    // 1
    UHS_Disabled,                   // 2
    UHS_ShuttingDown,               // 3
    UHS_StartingUp,                 // 4
    UHS_ShutDown,                   // 5
    UHS_MAX                         // 6
};

enum EMapIconTypes
{
    EMapIcon_None,                  // 0
    EMapIcon_GenericRed,            // 1
    EMapIcon_GenericBlue,           // 2
    EMapIcon_VS,                    // 3
    EMapIcon_Crab,                  // 4
    EMapIcon_Packhunter,            // 5
    EMapIcon_ObjectivePrimary,      // 6
    EMapIcon_ObjectiveSecondary,    // 7
    EMapIcon_ObjectiveWaypointPrimary,// 8
    EMapIcon_ObjectiveWaypointSecondary,// 9
    EMapIcon_Player,                // 10
    EMapIcon_ThermalEnergyPocket,   // 11
    EMapIcon_ThermalEnergyPost,     // 12
    EMapIcon_SurveyMap,             // 13
    EMapIcon_ChaingunTurret,        // 14
    EMapIcon_ProximityMine,         // 15
    EMapIcon_BiotoxMine,            // 16
    EMapIcon_ShopTE,                // 17
    EMapIcon_ShopScrap,             // 18
    EMapIcon_ShopDNA,               // 19
    EMapIcon_ShopUnified,           // 20
    EMapIcon_Construction,          // 21
    EMapIcon_WhiteLeech,            // 22
    EMapIcon_Memento,               // 23
    EMapIcon_KovacSample,           // 24
    EMapIcon_Elevator,              // 25
    EMapIcon_Laboratory,            // 26
    EMapIcon_CommandCenter,         // 27
    EMapIcon_BraddockOffice,        // 28
    EMapIcon_Max                    // 29
};

enum EMapIconStates
{
    EMapIconStates_UnInitialized,   // 0
    EMapIconStates_Normal,          // 1
    EMapIconStates_AttackAnnounce,  // 2
    EMapIconStates_MAX              // 3
};

enum EVSHUD_Panels
{
    VSHUD_PanelCenter,              // 0
    VSHUD_PanelDummy,               // 1
    VSHUD_MAX                       // 2
};

enum EFutureVSHUD_Panels
{
    VSFutureHUD_PanelCenter,        // 0
    VSFutureHUD_PanelDummy,         // 1
    VSFutureHUD_MAX                 // 2
};

enum EPerkType
{
    PerkType_TotemAuto,             // 0
    PerkType_TotemManual,           // 1
    PerkType_AbilityPassive,        // 2
    PerkType_AbilityActive,         // 3
    PerkType_Handicap,              // 4
    PerkType_MAX                    // 5
};

enum EPerkCategory
{
    PerkCategory_Totem,             // 0
    PerkCategory_Ability,           // 1
    PerkCategory_Handicap,          // 2
    PerkCategory_MAX                // 3
};

enum EAddAmmoToVSStorageOptions
{
    EAVSO_None,                     // 0
    EAVSO_ForceInfiniteAmmo,        // 1
    EAVSO_MAX                       // 2
};

enum eDodgePhase
{
    eDodge_Begin,                   // 0
    eDodge_End,                     // 1
    eDodge_MAX                      // 2
};

enum eAttackType
{
    eAttack_Any,                    // 0
    eAttack_LeftCrabClawAttack,     // 1
    eAttack_RightCrabClawAttack,    // 2
    eAttack_CrabChargeAttack,       // 3
    eAttack_CrabPincerAttack,       // 4
    eAttack_Act1BossTongueAttack,   // 5
    eAttack_Act1BossTongueAttackRoomRight,// 6
    eAttack_Act1BossTongueAttackRoomLeft,// 7
    eAttack_Act1BossClawAttack,     // 8
    eAttack_Act1BossBite,           // 9
    eAttack_PackHunterStrikeWithoutSpecialDodge,// 10
    eAttack_LeechStrikeWithoutSpecialDodge,// 11
    eAttack_PhadyrStrikeWithoutSpecialDodge,// 12
    eAttack_BurrowerStrikeWithoutSpecialDodge,// 13
    eAttack_SepiaStrikeWithoutSpecialDodge,// 14
    eAttack_StalkerStrikeWithoutSpecialDodge,// 15
    eAttack_HumanSoldierStrikeWithoutSpecialDodge,// 16
    eAttack_SpitterTailSting,       // 17
    eAttack_DefenderRamAttack,      // 18
    eAttack_DongoChargeRollAttack,  // 19
    eAttack_SpitterTalon,           // 20
    eAttack_CarrierReactiveStrike,  // 21
    eAttack_CarrierTalonSweep,      // 22
    eAttack_CarrierTalonStab,       // 23
    eAttack_SpitterChargeAttack,    // 24
    eAttack_LeftCrabSwipe,          // 25
    eAttack_RightCrabSwipe,         // 26
    eAttack_MAX                     // 27
};

enum ePropType
{
    eGeneric,                       // 0
    eProximityMine,                 // 1
    ePropType_MAX                   // 2
};

enum EStopAtDestinationType
{
    ESADT_None,                     // 0
    ESADT_InstantStop,              // 1
    ESADT_ForwardStopAtDestination, // 2
    ESADT_ForwardStopAfterDestination,// 3
    ESADT_TurningStopAtDestination, // 4
    ESADT_TurningStopAfterDestination,// 5
    ESADT_MAX                       // 6
};

enum FlagsCombine
{
    Use_And,                        // 0
    Use_Or,                         // 1
    Use_MAX                         // 2
};

enum eSpitterCSA
{
    eSpitterCSA_None,               // 0
    eSpitterCSA_Attack,             // 1
    eSpitterCSA_AttackVs,           // 2
    eSpitterCSA_Stalk,              // 3
    eSpitterCSA_MAX                 // 4
};

enum eGrenadeReactionState
{
    eGrenadeReactionState_None,     // 0
    eGrenadeReactionState_JustHadGrenHitGrenStickyCore,// 1
    eGrenadeReactionState_TakingGrenadeIn,// 2
    eGrenadeReactionState_DoneTakingGrenadeIn,// 3
    eGrenadeReactionState_ReactingToGrenadeExplosion,// 4
    eGrenadeReactionState_DoneReactingToGrenadeExplosion,// 5
    eGrenadeReactionState_Stunned,  // 6
    eGrenadeReactionState_DoneBeingStunned,// 7
    eGrenadeReactionState_MAX       // 8
};

enum eDefenderHiveCellState
{
    eDefenderHiveCellState_Destroyed,// 0
    eDefenderHiveCellState_Vulnerable,// 1
    eDefenderHiveCellState_Protected,// 2
    eDefenderHiveCellState_MAX      // 3
};

enum eDefenderHiveLaunchType
{
    eDefenderHiveLaunchType_None,   // 0
    eDefenderHiveLaunchType_Default,// 1
    eDefenderHiveLaunchType_ShortSlow,// 2
    eDefenderHiveLaunchType_SlightArcUpThenBackDown,// 3
    eDefenderHiveLaunchType_UpWithTurnToRightAtEnd,// 4
    eDefenderHiveLaunchType_DownWithSlightTurnToRightAtEnd,// 5
    eDefenderHiveLaunchType_LongFlatHalfArcToTheRight,// 6
    eDefenderHiveLaunchType_MAX     // 7
};

enum eTauntState
{
    eTauntState_None,               // 0
    eTauntState_MovingInForTaunt,   // 1
    eTauntState_RisingIntoTaunt,    // 2
    eTauntState_RisingDoneWaitingToLoopTaunt,// 3
    eTauntState_LoopingTaunt,       // 4
    eTauntState_LoopingDoneWaitingToEndTaunt,// 5
    eTauntState_LoweringOutOfTaunt, // 6
    eTauntState_LoweringDoneWaitingToEnd,// 7
    eTauntState_StrikingOutOfTaunt, // 8
    eTauntState_StrikingDoneWaitingToEnd,// 9
    eTauntState_StoppingTauntBecauseTookGrenInTheMouth,// 10
    eTauntState_MAX                 // 11
};

enum eVsSawState
{
    eVsSawState_None,               // 0
    eVsSawState_WorkingButNotRunning,// 1
    eVsSawState_StartingUp,         // 2
    eVsSawState_Running,            // 3
    eVsSawState_ShutingDown,        // 4
    eVsSawState_StartingUpBackUp,   // 5
    eVsSawState_RunningBackUp,      // 6
    eVsSawState_ShutingDownBackUp,  // 7
    eVsSawState_DamagedButNotRunning,// 8
    eVsSawState_Destoryed,          // 9
    eVsSawState_MAX                 // 10
};

enum eLaRocheMacroCombatState
{
    eLaRocheMacroCombatState_None,  // 0
    eLaRocheMacroCombatState_SawCentric,// 1
    eLaRocheMacroCombatState_SawNoTaser,// 2
    eLaRocheMacroCombatState_TaserCentric,// 3
    eLaRocheMacroCombatState_BackupSaw,// 4
    eLaRocheMacroCombatState_Hips,  // 5
    eLaRocheMacroCombatState_Berserk,// 6
    eLaRocheMacroCombatState_BackingOffAfterStruggleWin,// 7
    eLaRocheMacroCombatState_WaitingForRecoveryAfterStruggleWin,// 8
    eLaRocheMacroCombatState_Defeated,// 9
    eLaRocheMacroCombatState_MAX    // 10
};

enum eLaRocheBossFightPhaseEvent
{
    eLaRocheBossFightPhaseEvent_JimWonFight,// 0
    eLaRocheBossFightPhaseEvent_JimTakesItInTheAss,// 1
    eLaRocheBossFightPhaseEvent_PreStartOfFightDialogStart,// 2
    eLaRocheBossFightPhaseEvent_AfterFirstAttackByLaRoche,// 3
    eLaRocheBossFightPhaseEvent_NotifyLeftShoulderShieldNotDestroyedYet1,// 4
    eLaRocheBossFightPhaseEvent_NotifyLeftShoulderShieldNotDestroyedYet2,// 5
    eLaRocheBossFightPhaseEvent_OtherThenLeftShoulderShieldShieldOrMajorCriticalEquipmentDestroyed,// 6
    eLaRocheBossFightPhaseEvent_JimsFirstNewGrabOnLaRocheNotify,// 7
    eLaRocheBossFightPhaseEvent_FirstShieldDestroyedNotifyForLaRocheSnarkyComment,// 8
    eLaRocheBossFightPhaseEvent_NotifyOneOfJimsAttacksWasInterupted,// 9
    eLaRocheBossFightPhaseEvent_NotifyJimToCloseToLaRocheAndNotDoingAnythingWorthADamn,// 10
    eLaRocheBossFightPhaseEvent_NotifyJimDestroyedLeftShoulderShieldAndExposedComm,// 11
    eLaRocheBossFightPhaseEvent_NotifyCommUnitNotDestroyedYet,// 12
    eLaRocheBossFightPhaseEvent_NotifyLaRocheUsingEmpAttackTheFirstTime,// 13
    eLaRocheBossFightPhaseEvent_JimsSecondNewGrabOnLaRocheNotify,// 14
    eLaRocheBossFightPhaseEvent_NotifyJimDestroyedCommUnit,// 15
    eLaRocheBossFightPhaseEvent_FirstMajorComponentDestroyedNotifyForLaRocheSnarkyComment,// 16
    eLaRocheBossFightPhaseEvent_NotifyJimDestroyedCommUnitAfterDelayAndSawGenStillActive,// 17
    eLaRocheBossFightPhaseEvent_NotifyRightShoulderShieldNotDestroyedYet1,// 18
    eLaRocheBossFightPhaseEvent_EmpProjectile,// 19
    eLaRocheBossFightPhaseEvent_JimsThirdNewGrabOnLaRocheNotify,// 20
    eLaRocheBossFightPhaseEvent_NotifyJimDestroyedRightShoulderShieldAndExposedGrabPointForSawGen,// 21
    eLaRocheBossFightPhaseEvent_NotifySawGeneratorNotDestroyedYet,// 22
    eLaRocheBossFightPhaseEvent_NotifyPrisonRapeHasStarted,// 23
    eLaRocheBossFightPhaseEvent_NotifyJimDestroyedSawGenerator,// 24
    eLaRocheBossFightPhaseEvent_SecondMajorComponentDestroyedNotifyForLaRocheSnarkyComment,// 25
    eLaRocheBossFightPhaseEvent_NotifyReadyToStartGoingAfterLeftHip,// 26
    eLaRocheBossFightPhaseEvent_NotifyLeftHipShieldNotDestroyedYet1,// 27
    eLaRocheBossFightPhaseEvent_NotifyLeftHipShieldNotDestroyedYet2,// 28
    eLaRocheBossFightPhaseEvent_JimsFourthNewGrabOnLaRocheNotify,// 29
    eLaRocheBossFightPhaseEvent_NotifyJimDestroyedLeftHipShieldAndExposedLeftHipServo,// 30
    eLaRocheBossFightPhaseEvent_NotifyFirstTimeJimLandsWinchOnLarocheAndAbleToSendHimToOldSparky,// 31
    eLaRocheBossFightPhaseEvent_JimsFifthNewGrabOnLaRocheNotify,// 32
    eLaRocheBossFightPhaseEvent_ThirdMajorComponentDestroyedNotifyForLaRocheNotSoSnarkyComment,// 33
    eLaRocheBossFightPhaseEvent_NotifyJimHasBrokenOff75PercentOfLaRochesShit,// 34
    eLaRocheBossFightPhaseEvent_JimsGrabForTheKillOnLaRocheNotify,// 35
    eLaRocheBossFightPhaseEvent_BackOffToSawGenDestroyedAndTaserStartUp,// 36
    eLaRocheBossFightPhaseEvent_BackOffToSawGenDestroyedAndEnergyShield,// 37
    eLaRocheBossFightPhaseEvent_BackOffToTaserGenDestroyedAndEnergyShield,// 38
    eLaRocheBossFightPhaseEvent_BackOffToJustTaserGenDestroyed,// 39
    eLaRocheBossFightPhaseEvent_BackOffToHipDestroyedAndStartBackUpSawGen,// 40
    eLaRocheBossFightPhaseEvent_TheNothingAtTheEndOfTheUniverse,// 41
    eLaRocheBossFightPhaseEvent_MAX // 42
};

enum eRigPulseType
{
    eRigPulseType_None,             // 0
    eRigPulseType_ATan,             // 1
    eRigPulseType_ACot,             // 2
    eRigPulseType_Sin,              // 3
    eRigPulseType_ASin,             // 4
    eRigPulseType_ACos,             // 5
    eRigPulseType_FlareUp,          // 6
    eRigPulseType_RandNoise,        // 7
    eRigPulseType_MAX               // 8
};

enum EOnlineModes
{
    EOnlineMode_None,               // 0
    EOnlineMode_Internet,           // 1
    EOnlineMode_LAN,                // 2
    EOnlineMode_MAX                 // 3
};

enum EMPGameType
{
    EMPGT_Default,                  // 0
    EMPGT_Extraction,               // 1
    EMPGT_Scenario,                 // 2
    EMPGT_TeamDeathmatch,           // 3
    EMPGT_Survival,                 // 4
    EMPGT_MAX                       // 5
};

enum EMPInviteMode
{
    EIM_InvitesOnly,                // 0
    EIM_FriendsOnly,                // 1
    EIM_FriendsOfFriends,           // 2
    EIM_Public,                     // 3
    EIM_MAX                         // 4
};

enum EMPMatchState
{
    EMS_LOBBY,                      // 0
    EMS_PLAYING,                    // 1
    EMS_RESULTS,                    // 2
    EMS_TRAVELING,                  // 3
    EMS_MAX                         // 4
};

enum EMPObjectiveType
{
    EMPOT_Default,                  // 0
    EMPOT_Extraction,               // 1
    EMPOT_TeamDeathmatch,           // 2
    EMPOT_Bomb,                     // 3
    EMPOT_Courier,                  // 4
    EMPOT_DisableRepair,            // 5
    EMPOT_SeizeControl,             // 6
    EMPOT_Escort,                   // 7
    EMPOT_Kill,                     // 8
    EMPOT_Survival,                 // 9
    EMPOT_MAX                       // 10
};

enum EMPSessionType
{
    EMPST_CustomGame,               // 0
    EMPST_QuickmatchGame,           // 1
    EMPST_Party,                    // 2
    EMPST_MAX                       // 3
};

enum EMPQuickMatchState
{
    EQMS_STOPPED,                   // 0
    EQMS_SEARCHING,                 // 1
    EQMS_MATCHES_FOUND,             // 2
    EQMS_JOINING,                   // 3
    EQMS_HOSTING,                   // 4
    EQMS_MAX                        // 5
};

enum eChatterEventName
{
    CEN_AcknowledgeSupport,         // 0
    CEN_AmmoPackDeployed,           // 1
    CEN_AssistKill,                 // 2
    CEN_EnemyTagged,                // 3
    CEN_FriendlyFire,               // 4
    CEN_GrenadeAlert,               // 5
    CEN_GrenadeKill,                // 6
    CEN_GrenadeThrown,              // 7
    CEN_HackCompleted,              // 8
    CEN_Headshot,                   // 9
    CEN_Incapacitated,              // 10
    CEN_LargeAkridAppearance,       // 11
    CEN_LowHealth,                  // 12
    CEN_MedLargeAkridKill,          // 13
    CEN_MeleeKill,                  // 14
    CEN_MetagameUnlock,             // 15
    CEN_MineKill,                   // 16
    CEN_OutOfAmmo,                  // 17
    CEN_ProtoHarmonizerDeployed,    // 18
    CEN_RevengeKill,                // 19
    CEN_ReviveInitiated,            // 20
    CEN_TurretMinePlanted,          // 21
    CEN_KillStreak,                 // 22
    CEN_MAX                         // 23
};

enum eChatterReplicationType
{
    CRT_LocalClient,                // 0
    CRT_LocalAndP2P,                // 1
    CRT_TeamAll,                    // 2
    CRT_TeamPositional,             // 3
    CRT_GlobalPositional,           // 4
    CRT_MAX                         // 5
};

enum PlayerVoiceStatus
{
    ePlayerVoiceStatus_Enabled,     // 0
    ePlayerVoiceStatus_Disabled,    // 1
    ePlayerVoiceStatus_Active,      // 2
    ePlayerVoiceStatus_Mute,        // 3
    ePlayerVoiceStatus_MAX          // 4
};

enum eStatModifyType
{
    StatModify_Delta,               // 0
    StatModify_Set,                 // 1
    StatModify_Or,                  // 2
    StatModify_Max                  // 3
};

enum eStatPeriod
{
    StatPeriod_Round,               // 0
    StatPeriod_Match,               // 1
    StatPeriod_Persistent,          // 2
    StatPeriod_MAX                  // 3
};

enum EAnimatedPickupHeight
{
    ECPH_Low,                       // 0
    ECPH_Medium,                    // 1
    ECPH_High,                      // 2
    ECPH_MAX                        // 3
};

enum EPlayerTutorialType
{
    EPTT_None,                      // 0
    EPTT_All,                       // 1
    EPTT_All_ActiveDefense,         // 2
    EPTT_All_ForkArmWindow,         // 3
    EPTT_All_Charge,                // 4
    EPTT_ALL_DodgeWindow,           // 5
    EPTT_Spitter_DrillTail,         // 6
    EPTT_Spitter_UpToExposeTail,    // 7
    EPTT_Boss_TongueAttack,         // 8
    EPTT_Boss_TongueSwipe,          // 9
    EPTT_Boss_ClawAttack,           // 10
    EPTT_Equip_Pistol,              // 11
    EPTT_Equip_DNA_Tagger_Ammo,     // 12
    EPTT_Crab_UpToLiftArm,          // 13
    EPTT_Laroche_SwingArm,          // 14
    EPTT_MAX                        // 15
};

enum EVSReticleHelpButtonType
{
    ERHBT_ForkArmGrabWindow,        // 0
    ERHBT_ForkArmGrabFreeGrab,      // 1
    ERHBT_CrushGrabbedPawn,         // 2
    ERHBT_ActiveDefenseWindow,      // 3
    ERHBT_WinchWindow,              // 4
    ERHBT_WinchPoint,               // 5
    ERHBT_WinchGrabbedPawn,         // 6
    ERHBT_RightArmWeapon,           // 7
    ERHBT_InteractionPoint,         // 8
    ERHBT_Welding,                  // 9
    ERHBT_Shock,                    // 10
    ERHBT_ShockDefenders,           // 11
    ERHBT_LastEntry,                // 12
    ERHBT_MAX                       // 13
};

enum EVSPartProceduralSpin
{
    EVSPPS_None,                    // 0
    EVSPPS_Additive,                // 1
    EVSPPS_Absolute,                // 2
    EVSPPS_MAX                      // 3
};

struct native sFastTravelMovieInfo
{
    var(0.25_Pct) /*0xB7770000-0x00000000*/ private editfixedsize string LoadingMovieName[65537];
    var(0.25_Pct) /*0xB7770000-0x00000000*/ private bool bLooping[65537];
    var(0.25_Pct) /*0xB7770000-0x00000000*/ private bool bNotSkippable[65537];

    structdefaultproperties
    {
        LoadingMovieName=""
        bLooping=false
        bNotSkippable=false
    }
};

struct native sFastTravelForcedMovieInfo
{
    var(0.25_Pct) /*0xB7750000-0x00000400*/ private editfixedsize @NULL ObjectiveEntry[589825];
    var(0.25_Pct) /*0xB7750000-0x00000000*/ private editfixedsize @NULL ForcedMovie[65537];

    structdefaultproperties
    {
        ObjectiveEntry=none
        ForcedMovie=(LoadingMovieName="",bLooping=false,bNotSkippable=false)
    }
};

struct native sFastTravelInfo
{
    var(0.25_Pct) /*0xB7760000-0x00000400*/ private editfixedsize @NULL ObjectiveEntry[589825];
    var(0.25_Pct) /*0xB7760000-0x00000000*/ private editfixedsize array MovieInfo[65537];
    var(0.25_Pct) /*0xB7760000-0x00000000*/ private editfixedsize string TravelURLOVERRIDE[65537];
    var(0.25_Pct) /*0xB7760000-0x00000000*/ private editfixedsize array ForcedMovieInfo[65537];

    structdefaultproperties
    {
        ObjectiveEntry=none
        MovieInfo=none
        TravelURLOVERRIDE=""
        ForcedMovieInfo=none
    }
};

struct MapActorInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Actor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte IconType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIconStaysOnEdge;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRotatesWithActor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSkipTransform;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWorldMapContainer;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NonActorLocation;

    structdefaultproperties
    {
        Actor=none
        IconType=EMapIconTypes.EMapIcon_None
        bIconStaysOnEdge=false
        bRotatesWithActor=false
        bSkipTransform=false
        bWorldMapContainer=false
        NonActorLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

struct native MapIconStateKeyframeInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte State;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string KeyframeLabel;

    structdefaultproperties
    {
        State=EMapIconStates.EMapIconStates_UnInitialized
        KeyframeLabel=""
    }
};

struct native MapIconClipInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Icon;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte State;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetedActor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ASTargetMC;

    structdefaultproperties
    {
        Icon=none
        State=EMapIconStates.EMapIconStates_UnInitialized
        TargetedActor=none
        bUsed=false
        ASTargetMC=none
    }
};

struct native MapIconInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ContainerMCName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ASTargetMCName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ContainerMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WorldMapContainerMC;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string IconMCName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int IconCount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array IconArray;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StateKeyframes;

    structdefaultproperties
    {
        ContainerMCName=""
        ASTargetMCName=""
        ContainerMC=none
        WorldMapContainerMC=none
        IconMCName=""
        IconCount=0
        IconArray=none
        StateKeyframes=none
    }
};

struct native RadarInfo
{
    var(0.25_Pct) /*0xA8A80000-0x00000000*/ private byte IconType[65537];
    var(0.25_Pct) /*0xA8A80000-0x00000000*/ private bool bIconStaysOnEdge[65537];
    var(0.25_Pct) /*0xA8A80000-0x00000000*/ private bool bRotatesWithActor[65537];

    structdefaultproperties
    {
        IconType=EMapIconTypes.EMapIcon_GenericRed
        bIconStaysOnEdge=false
        bRotatesWithActor=true
    }
};

struct native RadarItem
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Item;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RadarParams;

    structdefaultproperties
    {
        Item=none
        RadarParams=(IconType=EMapIconTypes.EMapIcon_GenericRed,bIconStaysOnEdge=false,bRotatesWithActor=true)
    }
};

struct native VSHudPanelInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovieInstance_VS;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPGFxMovie_VS;

    structdefaultproperties
    {
        GFxFlashMovieInstance_VS=none
        MyLPGFxMovie_VS=none
    }
};

struct native HudPanelStaticInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GFxFlashMovie;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GFxFlashMovieInstanceClass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RenderTexture;

    structdefaultproperties
    {
        GFxFlashMovie=none
        GFxFlashMovieInstanceClass=none
        RenderTexture=none
    }
};

struct native ThermalPocketStruct
{
    var(0.25_Pct) /*0xCAF70000-0x00000000*/ private editfixedsize string ThermalPostName[65537];
    var(0.25_Pct) /*0xCAF70000-0x00000000*/ private editfixedsize string FriendlyName[65537];
    var(0.25_Pct) /*0xCAF70000-0x00000000*/ private @NULL MapLocation[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ThermalEnergyLevel;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AccumulatedInfestationTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastUpdateTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastLevelLoadedTime;

    structdefaultproperties
    {
        ThermalPostName=""
        FriendlyName=""
        MapLocation=(X=0.0000000,Y=0.0000000)
        ThermalEnergyLevel=0.0000000
        AccumulatedInfestationTime=0.0000000
        LastUpdateTime=0.0000000
        LastLevelLoadedTime=0.0000000
    }
};

struct native ObjectiveStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ObjectiveActor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ObjectiveActorPathName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPrimary;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsWaypoint;

    structdefaultproperties
    {
        ObjectiveActor=none
        ObjectiveActorPathName=""
        bIsPrimary=false
        bIsWaypoint=false
    }
};

struct native JobStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string JobObjectPathName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCompleted;

    structdefaultproperties
    {
        JobObjectPathName=""
        bCompleted=false
    }
};

struct native LPPartsInventoryRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL SPPartsRecord;

    structdefaultproperties
    {
        SPPartsRecord=(InventoryClassPath="")
    }
};

struct native TEnergyData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RepCounter;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EnergyCount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EnergyDelta;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoFX;

    structdefaultproperties
    {
        RepCounter=0
        EnergyCount=0.0000000
        EnergyDelta=0.0000000
        bDoFX=false
    }
};

struct native ThermalEnergyRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string InventoryClassPath;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnergyData;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MaxEnergy;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TotalLimit;

    structdefaultproperties
    {
        InventoryClassPath=""
        EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false)
        MaxEnergy=0
        TotalLimit=0
    }
};

struct native ThermalEnergyFannyPackRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string InventoryClassPath;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxCapacity;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentCapacity;

    structdefaultproperties
    {
        InventoryClassPath=""
        MaxCapacity=0.0000000
        CurrentCapacity=0.0000000
    }
};

struct native LPPawnRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL SPPawnRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PartsInventory;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL TEnergyRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL TEnergyFannyPackRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte UmbilicalState;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LastEquippedWeaponClassName;

    structdefaultproperties
    {
        SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName="")
        PartsInventory=none
        TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0)
        TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000)
        UmbilicalState=EHUDUmbilicalState.UHS_Normal
        LastEquippedWeaponClassName=""
    }
};

struct native WaypointMarkerRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bActive;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WaypointActorPathName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ObjectiveMarkerActorPathName;

    structdefaultproperties
    {
        bActive=false
        WaypointActorPathName=""
        ObjectiveMarkerActorPathName=""
    }
};

struct native VSMunitionsLockerAmmoInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AmmoTuneDataString;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AmmoCount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInfiniteAmmo;

    structdefaultproperties
    {
        AmmoTuneDataString=""
        AmmoCount=0
        bInfiniteAmmo=false
    }
};

struct native VSMunitionsLockerWeaponInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponFriendlyName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponIconName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WeaponDescription;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanEquip;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJobLogViewed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string TuneDataUnloadedWeaponInfoString;

    structdefaultproperties
    {
        WeaponName=""
        WeaponFriendlyName=""
        WeaponIconName=""
        WeaponDescription=""
        bCanEquip=false
        bJobLogViewed=false
        TuneDataUnloadedWeaponInfoString=""
    }
};

struct native JobLogWorldMapIconInfo
{
    var(0.25_Pct) /*0x71060000-0x00000000*/ private byte IconType[65537];
    var(0.25_Pct) /*0x71060000-0x00000000*/ private @NULL MapCoordinate[65537];

    structdefaultproperties
    {
        IconType=EMapIconTypes.EMapIcon_None
        MapCoordinate=(X=0.0000000,Y=0.0000000)
    }
};

struct native JobLogMultiListRecordInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ListIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ListSelectedIndex;

    structdefaultproperties
    {
        ListIndex=-1
        ListSelectedIndex=-1
    }
};

struct native JobLogSingleListRecordInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ListSelectedIndex;

    structdefaultproperties
    {
        ListSelectedIndex=-1
    }
};

struct native JobLogMapRecordInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWorldMap;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bListOpen;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bListState;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int LocalMapDisplayIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name MapZoneNameID;

    structdefaultproperties
    {
        bWorldMap=false
        bListOpen=false
        bListState=false
        LocalMapDisplayIndex=0
        MapZoneNameID="None"
    }
};

struct native JobLogRecordInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TabIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MissionsRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MapRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InventoryRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CollectiblesRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MessagesRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MusicPlayerRecord;

    structdefaultproperties
    {
        TabIndex=0
        MissionsRecord=(ListIndex=-1,ListSelectedIndex=-1)
        MapRecord=(bWorldMap=false,bListOpen=false,bListState=false,LocalMapDisplayIndex=0,MapZoneNameID="None")
        InventoryRecord=(ListIndex=-1,ListSelectedIndex=-1)
        CollectiblesRecord=(ListIndex=-1,ListSelectedIndex=-1)
        MessagesRecord=(ListSelectedIndex=-1)
        MusicPlayerRecord=(ListSelectedIndex=-1)
    }
};

struct native MapZoneInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ZoneNameID;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Phase;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LocalMapDisplayName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DisplayName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DisplayNameSubLevel;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string DisplayNameSubLevel2;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WorldMapRegionMovieClipName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string WorldMapMovieClipName;

    structdefaultproperties
    {
        ZoneNameID="None"
        Phase=0
        LocalMapDisplayName=""
        DisplayName=""
        DisplayNameSubLevel=""
        DisplayNameSubLevel2=""
        WorldMapRegionMovieClipName=""
        WorldMapMovieClipName=""
    }
};

struct native PerkManagerInventoryInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PerkIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DPADAssignment;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int iCount;

    structdefaultproperties
    {
        PerkIndex=0
        DPADAssignment=0
        iCount=0
    }
};

struct native LPPlayerControllerCheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInVitalSuit;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWinchRangeExtension;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SPPCRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL HumanPawn;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HumanPawnMeshTranslation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string SelectedJobLogObjective;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string LastActivatedObjective;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanUseFullMunitionsLocker;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TEnergyAmount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScrapAmountPlayer;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WhiteLeechDNAAmount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DisableVSGameMusicPlaybackCount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DisableVSUserMusicPlaybackCount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSGameMusicPlayingOnDisable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSUserMusicPlayingOnDisable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AutoResumeMusicPlayerOnDisableCount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bVSMusicPlayerPausedbyPlayer;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StoredPlayerAmmoInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StoredPlayerWeaponInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array PerkInventoryInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array VisitedMapZoneNames;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AchievementValues;

    structdefaultproperties
    {
        bIsInVitalSuit=false
        bWinchRangeExtension=false
        SPPCRecord=(SavedGuid=(A=0,B=0,C=0,D=0),TeamIndex=0)
        HumanPawn=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName="")
        HumanPawnMeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        SelectedJobLogObjective=""
        LastActivatedObjective=""
        bCanUseFullMunitionsLocker=false
        TEnergyAmount=0.0000000
        ScrapAmountPlayer=0.0000000
        WhiteLeechDNAAmount=0.0000000
        DisableVSGameMusicPlaybackCount=0
        DisableVSUserMusicPlaybackCount=0
        bVSGameMusicPlayingOnDisable=false
        bVSUserMusicPlayingOnDisable=false
        AutoResumeMusicPlayerOnDisableCount=0
        bVSMusicPlayerPausedbyPlayer=false
        StoredPlayerAmmoInfo=none
        StoredPlayerWeaponInfo=none
        PerkInventoryInfo=none
        JobLogRecord=(TabIndex=0,MissionsRecord=(ListIndex=-1,ListSelectedIndex=-1),MapRecord=(bWorldMap=false,bListOpen=false,bListState=false,LocalMapDisplayIndex=0,MapZoneNameID="None"),InventoryRecord=(ListIndex=-1,ListSelectedIndex=-1),CollectiblesRecord=(ListIndex=-1,ListSelectedIndex=-1),MessagesRecord=(ListSelectedIndex=-1),MusicPlayerRecord=(ListSelectedIndex=-1))
        VisitedMapZoneNames=none
        AchievementValues=none
    }
};

struct native VSCheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyGuid;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL LPPawnRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReplicated;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHidden;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPossessedByPlayer;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMusicTrackPlaying;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMusicTrackPaused;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayerInVitalSuit;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MusicTrackPlayed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WinchLocation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPlatformMode;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDesignerForcedVacantVSAttachmentsOff;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDesignerForcedLightAttachments;

    structdefaultproperties
    {
        MyGuid=(A=0,B=0,C=0,D=0)
        LPPawnRecord=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName="")
        bReplicated=false
        bHidden=false
        bIsPossessedByPlayer=false
        bMusicTrackPlaying=false
        bMusicTrackPaused=false
        bPlayerInVitalSuit=false
        MusicTrackPlayed=0
        WinchLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        bIsPlatformMode=false
        bDesignerForcedVacantVSAttachmentsOff=false
        bDesignerForcedLightAttachments=false
    }
};

struct native LPAIControllerCheckpointRecord
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL SPAIRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL AIPawnRecord;

    structdefaultproperties
    {
        SPAIRecord=(SavedGuid=(A=0,B=0,C=0,D=0),TeamIndex=0,bAllowCombatTransitions=false,AttachmentArray=none,bAllowDamageWhenDisableAI=false,bDisableAI=false)
        AIPawnRecord=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName="")
    }
};

struct native PersistentVSSaveData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSaved;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name MapName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SubLevel;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeshTranslation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL VSPawnRecord;

    structdefaultproperties
    {
        bSaved=false
        MapName="None"
        SubLevel="None"
        MeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        VSPawnRecord=(MyGuid=(A=0,B=0,C=0,D=0),LPPawnRecord=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName=""),bReplicated=false,bHidden=false,bIsPossessedByPlayer=false,bMusicTrackPlaying=false,bMusicTrackPaused=false,bPlayerInVitalSuit=false,MusicTrackPlayed=0,WinchLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000),bIsPlatformMode=false,bDesignerForcedVacantVSAttachmentsOff=false,bDesignerForcedLightAttachments=false)
    }
};

struct native LPLevelTransitionData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PCRecord;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PersistentVS;

    structdefaultproperties
    {
        PCRecord=(bIsInVitalSuit=false,bWinchRangeExtension=false,SPPCRecord=(SavedGuid=(A=0,B=0,C=0,D=0),TeamIndex=0),HumanPawn=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName=""),HumanPawnMeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000),SelectedJobLogObjective="",LastActivatedObjective="",bCanUseFullMunitionsLocker=false,TEnergyAmount=0.0000000,ScrapAmountPlayer=0.0000000,WhiteLeechDNAAmount=0.0000000,DisableVSGameMusicPlaybackCount=0,DisableVSUserMusicPlaybackCount=0,bVSGameMusicPlayingOnDisable=false,bVSUserMusicPlayingOnDisable=false,AutoResumeMusicPlayerOnDisableCount=0,bVSMusicPlayerPausedbyPlayer=false,StoredPlayerAmmoInfo=none,StoredPlayerWeaponInfo=none,PerkInventoryInfo=none,JobLogRecord=(TabIndex=0,MissionsRecord=(ListIndex=-1,ListSelectedIndex=-1),MapRecord=(bWorldMap=false,bListOpen=false,bListState=false,LocalMapDisplayIndex=0,MapZoneNameID="None"),InventoryRecord=(ListIndex=-1,ListSelectedIndex=-1),CollectiblesRecord=(ListIndex=-1,ListSelectedIndex=-1),MessagesRecord=(ListSelectedIndex=-1),MusicPlayerRecord=(ListSelectedIndex=-1)),VisitedMapZoneNames=none,AchievementValues=none)
        PersistentVS=(bSaved=false,MapName="None",SubLevel="None",MeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000),VSPawnRecord=(MyGuid=(A=0,B=0,C=0,D=0),LPPawnRecord=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName=""),bReplicated=false,bHidden=false,bIsPossessedByPlayer=false,bMusicTrackPlaying=false,bMusicTrackPaused=false,bPlayerInVitalSuit=false,MusicTrackPlayed=0,WinchLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000),bIsPlatformMode=false,bDesignerForcedVacantVSAttachmentsOff=false,bDesignerForcedLightAttachments=false))
    }
};

struct native AmmoReplenishData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AmmoData;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AmmoLeft;

    structdefaultproperties
    {
        AmmoData=none
        AmmoLeft=0
    }
};

struct native WinchPointInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SocketName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name IconSocketName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Radius;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinDistance;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabledForWinching;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHideUI;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDestroyed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class RetractWinchSM;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int GrabPointIndex;

    structdefaultproperties
    {
        SocketName="None"
        IconSocketName="None"
        Radius=0.0000000
        MinDistance=0.0000000
        bEnabledForWinching=false
        bHideUI=false
        bDestroyed=false
        RetractWinchSM=none
        GrabPointIndex=0
    }
};

struct native ActiveCombatWindow
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CombatWindow;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Publisher;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTimedWindow;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EndTime;

    structdefaultproperties
    {
        CombatWindow=none
        Publisher=none
        bTimedWindow=false
        StartTime=0.0000000
        EndTime=0.0000000
    }
};

struct native CoreDamageReductionFilterData
{
    var(0.25_Pct) /*0x271C0000-0x00000000*/ private class DamageType[65537];
    var(0.25_Pct) /*0x271C0000-0x00000400*/ private editfixedsize @NULL DamageFactor[589825];

    structdefaultproperties
    {
        DamageType=none
        DamageFactor=none
    }
};

struct native AttackArc
{
    var(0.25_Pct) /*0x08D30000-0x00000000*/ private float TargetsFacing[65537];
    var(0.25_Pct) /*0x08D30000-0x00000000*/ private float HalfArcSize[65537];

    structdefaultproperties
    {
        TargetsFacing=0.0000000
        HalfArcSize=0.0000000
    }
};

struct native LobRangedStrikeData
{
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float HeightAboveTargetForLobRangedStrikeInUU[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float XY_DistanceFromTargetForLobRangedStrikeInUU[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float XY_DistanceSqFromTargetForLobRangedStrikeInUU;
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float RangedLobFireIdealSpeed[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float RangedLobFireMaxSpeed[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float RangedLobFireMinSpeed[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float DesiredZPercentOfLob[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float IntentionalMissRangedLobFireIdealSpeed[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float IntentionalMissRangedLobFireMaxSpeed[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float IntentionalMissRangedLobFireMinSpeed[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float IntentionalMissDesiredZPercentOfLob[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float IntentionalLobMissFrontOffsetDistance[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float IntentionalLobMissSideOffsetDistance[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float IntentionalLobMissHeightOffsetDistance[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private @NULL ShapeOfProjectileForLobCalc[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private float PercentOfArcToCheckForCalc[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private editfixedsize array AltDesiredZPercentOfLobList[65537];
    var(0.25_Pct) /*0x755B0000-0x00000000*/ private class TargetClass[65537];

    structdefaultproperties
    {
        HeightAboveTargetForLobRangedStrikeInUU=100.0000000
        XY_DistanceFromTargetForLobRangedStrikeInUU=1100.0000000
        XY_DistanceSqFromTargetForLobRangedStrikeInUU=0.0000000
        RangedLobFireIdealSpeed=1200.0000000
        RangedLobFireMaxSpeed=2500.0000000
        RangedLobFireMinSpeed=100.0000000
        DesiredZPercentOfLob=0.1000000
        IntentionalMissRangedLobFireIdealSpeed=1200.0000000
        IntentionalMissRangedLobFireMaxSpeed=2500.0000000
        IntentionalMissRangedLobFireMinSpeed=100.0000000
        IntentionalMissDesiredZPercentOfLob=0.2000000
        IntentionalLobMissFrontOffsetDistance=100.0000000
        IntentionalLobMissSideOffsetDistance=0.0000000
        IntentionalLobMissHeightOffsetDistance=0.0000000
        ShapeOfProjectileForLobCalc=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        PercentOfArcToCheckForCalc=1.0000000
        AltDesiredZPercentOfLobList=none
        TargetClass=none
    }
};

struct native DirectFireRangedStrikeData
{
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float HeightAboveTargetForRangedStrikeInUU[65537];
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float XY_DistanceFromTargetForRangedStrikeInUU[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float XY_DistanceSqFromTargetForRangedStrikeInUU;
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float RangedFireIdealSpeed[65537];
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float RangedFireMaxSpeed[65537];
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float RangedFireMinSpeed[65537];
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float IntentionalMissRangedFireIdealSpeed[65537];
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float IntentionalMissRangedFireMaxSpeed[65537];
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float IntentionalMissRangedFireMinSpeed[65537];
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float IntentionalMissFrontOffsetDistance[65537];
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float IntentionalMissSideOffsetDistance[65537];
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float IntentionalMissHeightOffsetDistance[65537];
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private @NULL ShapeOfProjectileForFireCalc[65537];
    var(0.25_Pct) /*0x473D0000-0x00000000*/ private float PercentOfTravelDistanceToCheckForCalc[65537];

    structdefaultproperties
    {
        HeightAboveTargetForRangedStrikeInUU=100.0000000
        XY_DistanceFromTargetForRangedStrikeInUU=1100.0000000
        XY_DistanceSqFromTargetForRangedStrikeInUU=-1.0000000
        RangedFireIdealSpeed=1200.0000000
        RangedFireMaxSpeed=2500.0000000
        RangedFireMinSpeed=100.0000000
        IntentionalMissRangedFireIdealSpeed=1200.0000000
        IntentionalMissRangedFireMaxSpeed=2500.0000000
        IntentionalMissRangedFireMinSpeed=100.0000000
        IntentionalMissFrontOffsetDistance=100.0000000
        IntentionalMissSideOffsetDistance=0.0000000
        IntentionalMissHeightOffsetDistance=0.0000000
        ShapeOfProjectileForFireCalc=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        PercentOfTravelDistanceToCheckForCalc=1.0000000
    }
};

struct native WaitMoveData
{
    var(0.25_Pct) /*0xD59C0000-0x00000000*/ private class SpecialMoveToPlay[65537];
    var(0.25_Pct) /*0xD59C0000-0x00000000*/ private float MaxTimeToPlay[65537];
    var(0.25_Pct) /*0xD59C0000-0x00000000*/ private bool bAllowedToRepeat[65537];

    structdefaultproperties
    {
        SpecialMoveToPlay=none
        MaxTimeToPlay=10.0000000
        bAllowedToRepeat=false
    }
};

struct native PustuleGrowthInfo
{
    var(0.25_Pct) /*0xA83C0000-0x00000000*/ private float HealthPercentToGrowPustule[65537];
    var(0.25_Pct) /*0xA83C0000-0x00000000*/ private float HealthPercentToBurstPustule[65537];
    var(0.25_Pct) /*0xA83C0000-0x00000000*/ private name DamagePustuleSkelControlName[65537];
    var(0.25_Pct) /*0xA83C0000-0x00000000*/ private float SkelCtrlStrength[65537];
    var(0.25_Pct) /*0xA83C0000-0x00000000*/ private float SkelCtrlBlendInTime[65537];
    var(0.25_Pct) /*0xA83C0000-0x00000000*/ private name GrowthParticleEffectEventName[65537];
    var(0.25_Pct) /*0xA83C0000-0x00000000*/ private name BurstParticleEffectEventName[65537];
    var(0.25_Pct) /*0xA83C0000-0x00000000*/ private float ScaleOfGrowPustule[65537];

    structdefaultproperties
    {
        HealthPercentToGrowPustule=0.8000000
        HealthPercentToBurstPustule=-1.0000000
        DamagePustuleSkelControlName="DamagePustule"
        SkelCtrlStrength=-1.0000000
        SkelCtrlBlendInTime=-1.0000000
        GrowthParticleEffectEventName="PhadyrDamagePustule"
        BurstParticleEffectEventName="PhadyrBurstPustule"
        ScaleOfGrowPustule=1.0000000
    }
};

struct native DeathBloomGibData
{
    var(0.25_Pct) /*0x2BFE0000-0x00000000*/ private @NULL DeathGibMesh[65537];
    var(0.25_Pct) /*0x2BFE0000-0x00000000*/ private @NULL DeathGibGooSpray[65537];
    var(0.25_Pct) /*0x2BFE0000-0x00000000*/ private @NULL SpawnOffset[65537];
    var(0.25_Pct) /*0x2BFE0000-0x00000000*/ private @NULL Impulse[65537];
    var(0.25_Pct) /*0x2BFE0000-0x00000000*/ private @NULL ImpulseAngularVelocity[65537];
    var(0.25_Pct) /*0x2BFE0000-0x00000000*/ private float LifeTimeOfGibMax[65537];
    var(0.25_Pct) /*0x2BFE0000-0x00000000*/ private float LifeTimeOfGibMin[65537];
    var(0.25_Pct) /*0x2BFE0000-0x00000000*/ private float ScaleOfGibMax[65537];
    var(0.25_Pct) /*0x2BFE0000-0x00000000*/ private float ScaleOfGibMin[65537];

    structdefaultproperties
    {
        DeathGibMesh=none
        DeathGibGooSpray=none
        SpawnOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Impulse=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ImpulseAngularVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        LifeTimeOfGibMax=5.0000000
        LifeTimeOfGibMin=4.5000000
        ScaleOfGibMax=1.0000000
        ScaleOfGibMin=1.0000000
    }
};

struct native LegDismembermentInfo
{
    var(0.25_Pct) /*0x74650000-0x00000000*/ private float HealthPercentToDismemberAt[65537];
    var(0.25_Pct) /*0x74650000-0x00000000*/ private name BoneName[65537];
    var(0.25_Pct) /*0x74650000-0x00000000*/ private name ParticleEffectEventName[65537];
    var(0.25_Pct) /*0x74650000-0x00000000*/ private float LifeSpawnAfterDismemberment[65537];

    structdefaultproperties
    {
        HealthPercentToDismemberAt=0.0000000
        BoneName="None"
        ParticleEffectEventName="None"
        LifeSpawnAfterDismemberment=1.0000000
    }
};

struct native LPTuneDataSpitter_AttackSelection
{
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL TimeBetweenAttack_Min[589825];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL TimeBetweenAttack_Max[589825];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL Probablility_Spit[589825];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL Probablility_TailSting[589825];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL Probablility_QuickTailSting[589825];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL Probablility_TalonAttack[589825];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL Probablility_QuickTalonAttack[589825];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL Probablility_ChargeAttack[589825];
    var(0.25_Pct) /*0x8A150000-0x00000000*/ private bool bEnableTaunt[65537];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL TauntDuration[589825];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL TimeBetweenTaunt_Min[589825];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL TimeBetweenTaunt_Max[589825];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL TimeBetweenHunkerAndSpit[589825];
    var(0.25_Pct) /*0x8A150000-0x00000400*/ private const editfixedsize @NULL TimeBetweenHunkerAndSting[589825];

    structdefaultproperties
    {
        TimeBetweenAttack_Min=none
        TimeBetweenAttack_Max=none
        Probablility_Spit=none
        Probablility_TailSting=none
        Probablility_QuickTailSting=none
        Probablility_TalonAttack=none
        Probablility_QuickTalonAttack=none
        Probablility_ChargeAttack=none
        bEnableTaunt=false
        TauntDuration=none
        TimeBetweenTaunt_Min=none
        TimeBetweenTaunt_Max=none
        TimeBetweenHunkerAndSpit=none
        TimeBetweenHunkerAndSting=none
    }
};

struct native LPAttachedParticleInfo
{
    var(0.25_Pct) /*0x7C390000-0x00000000*/ private name SocketName[65537];
    var(0.25_Pct) /*0x7C390000-0x00000000*/ private @NULL ParticleSystem[65537];

    structdefaultproperties
    {
        SocketName="None"
        ParticleSystem=none
    }
};

struct native LPAttachedParticleInfoArrayContainter
{
    var(0.25_Pct) /*0x7C3A0000-0x00000000*/ private editfixedsize array ParticleList[589825];

    structdefaultproperties
    {
        ParticleList=none
    }
};

struct native LPTempPlaceHolderWeakPointInfo
{
    var(0.25_Pct) /*0x89430000-0x00000000*/ private name NameOfWeakPoint[65537];
    var(0.25_Pct) /*0x89430000-0x00000000*/ private name SocketName[65537];
    var(0.25_Pct) /*0x89430000-0x00000000*/ private float Size[65537];
    var(0.25_Pct) /*0x89430000-0x00000000*/ private float Health[65537];
    var(0.25_Pct) /*0x89430000-0x00000000*/ private bool bCanRegenerate[65537];
    var(0.25_Pct) /*0x89430000-0x00000000*/ private float RegenerateTime[65537];
    var(0.25_Pct) /*0x89430000-0x00000000*/ private float StayDeadTime[65537];

    structdefaultproperties
    {
        NameOfWeakPoint="None"
        SocketName="None"
        Size=0.0000000
        Health=0.0000000
        bCanRegenerate=false
        RegenerateTime=0.0000000
        StayDeadTime=10.0000000
    }
};

struct native DirectionalSpeedFactorBins
{
    var(0.25_Pct) /*0x47530000-0x00000000*/ private float MinSpeedToConsideredMovingAtWalkSpeeds[65537];
    var(0.25_Pct) /*0x47530000-0x00000000*/ private float MinSpeedToConsideredMovingAtJogSpeeds[65537];
    var(0.25_Pct) /*0x47530000-0x00000000*/ private float MinSpeedToConsideredMovingAtRunSpeeds[65537];
    var(0.25_Pct) /*0x47530000-0x00000000*/ private float MinSpeedToConsideredMovingAtSprintSpeeds[65537];

    structdefaultproperties
    {
        MinSpeedToConsideredMovingAtWalkSpeeds=5.0000000
        MinSpeedToConsideredMovingAtJogSpeeds=200.0000000
        MinSpeedToConsideredMovingAtRunSpeeds=400.0000000
        MinSpeedToConsideredMovingAtSprintSpeeds=800.0000000
    }
};

struct native LobStrikeLocValidationData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCalulatedThisEngagement;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastLobLosArcCheckValid;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RadiusOfLobFireCheckPath;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobFireLastPointToStrikeFrom;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobFireLastLocOfEndOfArc;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobFireLastLocOfBlockage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LogAlgosSegmentEnds;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array LogAlgosSegmentValiditys;

    structdefaultproperties
    {
        bCalulatedThisEngagement=false
        bLastLobLosArcCheckValid=false
        RadiusOfLobFireCheckPath=0.0000000
        LobFireLastPointToStrikeFrom=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        LobFireLastLocOfEndOfArc=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        LobFireLastLocOfBlockage=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        LogAlgosSegmentEnds=none
        LogAlgosSegmentValiditys=none
    }
};

struct native AttackRangeInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Min;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Max;

    structdefaultproperties
    {
        Min=0.0000000
        Max=0.0000000
    }
};

struct native AttackVolumeAnimInfo
{
    var(0.25_Pct) /*0x09890000-0x00000000*/ private @NULL TemplateAnimTree[65537];
    var(0.25_Pct) /*0x09890000-0x00000000*/ private name TemplateAnimName[65537];

    structdefaultproperties
    {
        TemplateAnimTree=none
        TemplateAnimName="None"
    }
};

struct native DefenderHiveCellStatus
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte HiveCellState;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsOnFire;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSetOnFire;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToStopFire;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfTicksSinceLastTimeHiveCellBleed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastHiveCellBleed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeCellWasDestroyed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeCellWasMadeVulnerable;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToMakeCellProtected;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeCellWasMadeProtected;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCellClaimedForLaunchingDefender;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeClaimed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeUnclaimed;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToUnclaim;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastDefenderLaunchedFromThisCell;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefenderSpawnedInThisCellWaitingForLaunch;

    structdefaultproperties
    {
        HiveCellState=eDefenderHiveCellState.eDefenderHiveCellState_Protected
        bIsOnFire=false
        TimeSetOnFire=-1.0000000
        TimeToStopFire=-1.0000000
        NumOfTicksSinceLastTimeHiveCellBleed=-1
        TimeOfLastHiveCellBleed=-1.0000000
        TimeCellWasDestroyed=-1.0000000
        LastTimeCellWasMadeVulnerable=-1.0000000
        TimeToMakeCellProtected=-1.0000000
        LastTimeCellWasMadeProtected=-1.0000000
        bCellClaimedForLaunchingDefender=false
        LastTimeClaimed=-1.0000000
        LastTimeUnclaimed=-1.0000000
        TimeToUnclaim=-1.0000000
        LastDefenderLaunchedFromThisCell=none
        DefenderSpawnedInThisCellWaitingForLaunch=none
    }
};

struct native ProxyDefenderHiveCellData
{
    var(0.25_Pct) /*0xA7930000-0x00000000*/ private byte DefenderLaunchType[65537];
    var(0.25_Pct) /*0xA7930000-0x00000000*/ private bool bValidForLaunch[65537];
    var(0.25_Pct) /*0xA7930000-0x00000000*/ private bool bRequiredForTacticalKill[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OffSetForSpawnLocation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RoationOffsetOfSpawn;

    structdefaultproperties
    {
        DefenderLaunchType=eDefenderHiveLaunchType.eDefenderHiveLaunchType_Default
        bValidForLaunch=true
        bRequiredForTacticalKill=true
        OffSetForSpawnLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        RoationOffsetOfSpawn=(Pitch=0,Yaw=0,Roll=0)
    }
};

struct native DefenderLaunchPathRep
{
    var(0.25_Pct) /*0x44880000-0x00000000*/ private editfixedsize array PathPoints[65537];

    structdefaultproperties
    {
        PathPoints=none
    }
};

struct native LPSkelCoreToPresentInfo
{
    var(0.25_Pct) /*0x84590000-0x00000000*/ private name CoreToPresentSkelControlName[65537];
    var(0.25_Pct) /*0x84590000-0x00000000*/ private float SkelCtrlStrength[65537];
    var(0.25_Pct) /*0x84590000-0x00000000*/ private float SkelCtrlBlendInTime[65537];

    structdefaultproperties
    {
        CoreToPresentSkelControlName="JO_Core"
        SkelCtrlStrength=-1.0000000
        SkelCtrlBlendInTime=-1.0000000
    }
};

struct native AttackVolumeUseInfo
{
    var(0.25_Pct) /*0x098C0000-0x00000000*/ private @NULL AnimInfo[65537];
    var(0.25_Pct) /*0x098C0000-0x00000000*/ private @NULL AttackVolume[65537];
    var(0.25_Pct) /*0x098C0000-0x00000000*/ private @NULL GoToActor[65537];
    var(0.25_Pct) /*0x098C0000-0x00000000*/ private int ScriptedAttackIndex[65537];
    var(0.25_Pct) /*0x098C0000-0x00000000*/ private bool bDoNotFaceEnemyWhileMoving[65537];

    structdefaultproperties
    {
        AnimInfo=(TemplateAnimTree=none,TemplateAnimName="None")
        AttackVolume=none
        GoToActor=none
        ScriptedAttackIndex=0
        bDoNotFaceEnemyWhileMoving=false
    }
};

struct native AttachEffectTemplate
{
    var(0.25_Pct) /*0x08920000-0x00000000*/ private @NULL Template[65537];
    var(0.25_Pct) /*0x08920000-0x00000000*/ private name Socket[65537];
    var(0.25_Pct) /*0x08920000-0x00000000*/ private float Duration[65537];

    structdefaultproperties
    {
        Template=none
        Socket="None"
        Duration=0.0000000
    }
};

struct native DestroyEffectTemplate
{
    var(0.25_Pct) /*0x46820000-0x00000000*/ private name Socket[65537];
    var(0.25_Pct) /*0x46820000-0x00000000*/ private @NULL PsDestroyed[65537];
    var(0.25_Pct) /*0x46820000-0x00000000*/ private @NULL PsPostDestroy[65537];
    var(0.25_Pct) /*0x46820000-0x00000000*/ private float PostDestroyDuration[65537];

    structdefaultproperties
    {
        Socket="None"
        PsDestroyed=none
        PsPostDestroy=none
        PostDestroyDuration=3600.0000000
    }
};

struct EndOfLaRocheBossFightCombatModeMessage
{
    var(0.25_Pct) /*0x515E0000-0x00000000*/ private byte PhaseEnding[65537];
    var(0.25_Pct) /*0x515E0000-0x00000000*/ private bool bShowWinMessageForEndOfPhase[65537];
    var(0.25_Pct) /*0x515E0000-0x00000000*/ private bool bShowFailMessageForEndOfPhase[65537];
    var(0.25_Pct) /*0x515E0000-0x00000000*/ private editfixedsize @NULL WinMessage[65537];
    var(0.25_Pct) /*0x515E0000-0x00000000*/ private editfixedsize @NULL FailMessage[65537];

    structdefaultproperties
    {
        PhaseEnding=eLaRocheMacroCombatState.eLaRocheMacroCombatState_None
        bShowWinMessageForEndOfPhase=false
        bShowFailMessageForEndOfPhase=false
        WinMessage=(MessageText="",AppendedText="",MessageFont=none,MessageFontScale=(X=0.0000000,Y=0.0000000),MessageOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),MessageColor=(R=0,G=0,B=0,A=0),MessageEndTime=0.0000000)
        FailMessage=(MessageText="",AppendedText="",MessageFont=none,MessageFontScale=(X=0.0000000,Y=0.0000000),MessageOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000),MessageColor=(R=0,G=0,B=0,A=0),MessageEndTime=0.0000000)
    }
};

struct LaRocheBossFightPhaseEventPriorityPair
{
    var(0.25_Pct) /*0x72520000-0x00000000*/ private byte PhaseEvent[65537];
    var(0.25_Pct) /*0x72520000-0x00000000*/ private int Priority[65537];

    structdefaultproperties
    {
        PhaseEvent=eLaRocheBossFightPhaseEvent.eLaRocheBossFightPhaseEvent_JimWonFight
        Priority=0
    }
};

struct native RigPulsingLightValue
{
    var(0.25_Pct) /*0xAE120000-0x00000000*/ private bool bChangeRigPulseTypeOnCombatPhaseChange[65537];
    var(0.25_Pct) /*0xAE120000-0x00000000*/ private byte RigPulseType[65537];
    var(0.25_Pct) /*0xAE120000-0x00000000*/ private float PulseFrequency[65537];
    var(0.25_Pct) /*0xAE120000-0x00000000*/ private float PulseReductionFactor[65537];
    var(0.25_Pct) /*0xAE120000-0x00000000*/ private float PulseMaxOutput[65537];
    var(0.25_Pct) /*0xAE120000-0x00000000*/ private float PulseMinOutput[65537];
    var(0.25_Pct) /*0xAE120000-0x00000000*/ private float PulseRate[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PulseGlowFactor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PulseIndicatorValue;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastPulseTime;

    structdefaultproperties
    {
        bChangeRigPulseTypeOnCombatPhaseChange=false
        RigPulseType=eRigPulseType.eRigPulseType_Sin
        PulseFrequency=1.0000000
        PulseReductionFactor=1.0000000
        PulseMaxOutput=1.0000000
        PulseMinOutput=0.0000000
        PulseRate=1.0000000
        PulseGlowFactor=1.0000000
        PulseIndicatorValue=0.0000000
        LastPulseTime=-1.0000000
    }
};

struct RigLightValuesOnStateChange
{
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private @NULL SawGenPulseLightsFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private @NULL CockPitCameraEyeLightsFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private @NULL CockPitPulseLightsFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private float EmpFacePlateLightsFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private @NULL LeftShoulderShieldRailPulseLightFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private @NULL RightShoulderShieldRailPulseLightFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private @NULL LeftShoulderSpotPulseLightFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private @NULL RightShoulderSpotPulseLightFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private float LeftShoulderJointLightFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private float RightShoulderJointLightFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private @NULL LeftHipShieldRailPulseLightFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private @NULL LeftHipCriticalEquipmentLightFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private @NULL RightHipShieldRailPulseLightFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private float EmpChargeStateFactor[65537];
    var(0.25_Pct) /*0xAE0F0000-0x00000000*/ private float EmpLightFactor[65537];

    structdefaultproperties
    {
        SawGenPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
        CockPitCameraEyeLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
        CockPitPulseLightsFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
        EmpFacePlateLightsFactor=-1.0000000
        LeftShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
        RightShoulderShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
        LeftShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
        RightShoulderSpotPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
        LeftShoulderJointLightFactor=-1.0000000
        RightShoulderJointLightFactor=-1.0000000
        LeftHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
        LeftHipCriticalEquipmentLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
        RightHipShieldRailPulseLightFactor=(bChangeRigPulseTypeOnCombatPhaseChange=false,RigPulseType=eRigPulseType.eRigPulseType_Sin,PulseFrequency=1.0000000,PulseReductionFactor=1.0000000,PulseMaxOutput=1.0000000,PulseMinOutput=0.0000000,PulseRate=1.0000000,PulseGlowFactor=1.0000000,PulseIndicatorValue=0.0000000,LastPulseTime=-1.0000000)
        EmpChargeStateFactor=-1.0000000
        EmpLightFactor=-1.0000000
    }
};

struct native GrappleParameters
{
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float PlayerGrappleSpeed[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float PlayerGrappleAccelRate[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private bool bGrappleBonusEnabled[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float PlayerGrappleBonusMaxAngle[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float PlayerGrappleSpeedBonusModifier[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float PlayerGrappleAccelBonusModifier[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float HookSpeed[65537];
    var(0.25_Pct) /*0x63400000-0x00000400*/ private editfixedsize @NULL HookValidRange[589825];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float HookValidInnerRange[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float HookMinimumHeightOffset[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float HookInvalidRange[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float HookValidAngle[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float HookValidAngleToPlayer[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float PlayerRotateTowardsHookDist[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float PlayerHookRotationModifier[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float GrappleDescendVelocity[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float GrappleDownRunningLeapMaxAngle[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float GrappleDownMaxDistanceFromLedgeToPerformAnim[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float GrappleDownMaxDistanceFromLedge[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float GrappleDownMaxDistanceToShowIcon[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private @NULL GrapplePlayerHandOffset[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float FallRecoveryMinDistanceToGrapplePoint[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float FallRecoveryMaxDistanceToGrapplePoint[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float FallRecoveryMaxAngleToGrapplePoint[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float FallRecoveryMaxDistanceFromLastFooting[65537];
    var(0.25_Pct) /*0x63400000-0x00000000*/ private float FallRecoveryMinTimeNeededForRappelRecovery[65537];

    structdefaultproperties
    {
        PlayerGrappleSpeed=1250.0000000
        PlayerGrappleAccelRate=2500.0000000
        bGrappleBonusEnabled=true
        PlayerGrappleBonusMaxAngle=2.7500000
        PlayerGrappleSpeedBonusModifier=1.5000000
        PlayerGrappleAccelBonusModifier=1.5000000
        HookSpeed=5000.0000000
        HookValidRange=none
        HookValidInnerRange=900.0000000
        HookMinimumHeightOffset=100.0000000
        HookInvalidRange=500.0000000
        HookValidAngle=30.0000000
        HookValidAngleToPlayer=15.0000000
        PlayerRotateTowardsHookDist=200.0000000
        PlayerHookRotationModifier=0.5000000
        GrappleDescendVelocity=-1300.0000000
        GrappleDownRunningLeapMaxAngle=30.0000000
        GrappleDownMaxDistanceFromLedgeToPerformAnim=100.0000000
        GrappleDownMaxDistanceFromLedge=300.0000000
        GrappleDownMaxDistanceToShowIcon=500.0000000
        GrapplePlayerHandOffset=(X=-25.0000000,Y=15.0000000,Z=75.0000000)
        FallRecoveryMinDistanceToGrapplePoint=30.0000000
        FallRecoveryMaxDistanceToGrapplePoint=1000.0000000
        FallRecoveryMaxAngleToGrapplePoint=10.0000000
        FallRecoveryMaxDistanceFromLastFooting=30.0000000
        FallRecoveryMinTimeNeededForRappelRecovery=0.7500000
    }
};

struct native ObjectiveMessageInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string MessageTitle;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string MessageBody;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ObjectiveType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DisplayTime;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPrimary;

    structdefaultproperties
    {
        MessageTitle=""
        MessageBody=""
        ObjectiveType=0
        DisplayTime=0.0000000
        bPrimary=false
    }
};

struct native ActiveObjectiveMessageInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string EventName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string ObjectiveName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ObjectiveType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string InstigatorName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int InstigatorTeamNum;

    structdefaultproperties
    {
        EventName=""
        ObjectiveName=""
        ObjectiveType=0
        InstigatorName=""
        InstigatorTeamNum=0
    }
};

struct native MetagameCell
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name CellName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CellX[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CellY[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name Image[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name RewardType[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name RewardClass[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name UnlockType[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name UnlockStat[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StatAmount[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float IssuedTime[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ActiveTime[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CreditCost[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CreditReward[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSecretCell[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name Prerequisite1[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name Prerequisite2[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name Prerequisite3[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInitiallyUnlocked[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNoDisplayCell[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceReplicate[1073741825];

    structdefaultproperties
    {
        CellName="None"
        CellX=0
        CellY=0
        Image="None"
        RewardType="None"
        RewardClass="None"
        UnlockType="None"
        UnlockStat="None"
        StatAmount=0.0000000
        IssuedTime=0.0000000
        ActiveTime=0.0000000
        CreditCost=0
        CreditReward=0
        bSecretCell=false
        Prerequisite1="None"
        Prerequisite2="None"
        Prerequisite3="None"
        bInitiallyUnlocked=false
        bNoDisplayCell=false
        bForceReplicate=false
    }
};

struct native StatDefinition
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name StatName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string StatClassName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bServerOnly[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bClientOnly[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTransient[1073741825];

    structdefaultproperties
    {
        StatName="None"
        StatClassName=""
        bServerOnly=false
        bClientOnly=false
        bTransient=false
    }
};

struct native AwardDefinition
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AwardName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string AwardClassName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Credits[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CreditMultiplier[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Priority[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name RequiredStatName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RequiredCount[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RequirementParam[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name IconName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IconColor[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DialogueTuneDataSoundEventBindingName[1073741825];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DialogueFrequency[1073741825];

    structdefaultproperties
    {
        AwardName="None"
        AwardClassName=""
        Credits=0
        CreditMultiplier=0.0000000
        Priority=0
        RequiredStatName="None"
        RequiredCount=0
        RequirementParam=0.0000000
        IconName="None"
        IconColor=(R=0,G=0,B=0,A=0)
        DialogueTuneDataSoundEventBindingName="None"
        DialogueFrequency=0.0000000
    }
};

struct native MatchScoreStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize string PlayerTag;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int PlayerRank;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerID;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte VoiceStatus;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TeamNum;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Kills;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Deaths;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Assists;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Revives;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Credits;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLocalPlayer;

    structdefaultproperties
    {
        PlayerTag=""
        PlayerRank=0
        PlayerID=(Uid=(Data=none,Data[1]=none,Data[2]=none,Data[3]=none,Data[4]=none,Data[5]=none,Data[6]=none,Data[7]=none))
        VoiceStatus=PlayerVoiceStatus.ePlayerVoiceStatus_Enabled
        TeamNum=0
        Kills=0
        Deaths=0
        Assists=0
        Revives=0
        Credits=0
        bLocalPlayer=false
    }
};

struct native MatchAwardStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AwardName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AwardedNum;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AwardedCredits;

    structdefaultproperties
    {
        AwardName="None"
        AwardedNum=0
        AwardedCredits=0
    }
};

struct native MPMapAchievementInfo
{
    var(0.25_Pct) /*0x94FC0000-0x00000000*/ private editfixedsize string MapName[65537];
    var(0.25_Pct) /*0x94FC0000-0x00000000*/ private int BestAroundId[65537];

    structdefaultproperties
    {
        MapName=""
        BestAroundId=0
    }
};

struct native SentinelAttackChanceStruct
{
    var(0.25_Pct) /*0xB0EB0000-0x00000000*/ private float BurstChance[65537];
    var(0.25_Pct) /*0xB0EB0000-0x00000000*/ private float SingleShotChance[65537];
    var(0.25_Pct) /*0xB0EB0000-0x00000000*/ private float MortarChance[65537];

    structdefaultproperties
    {
        BurstChance=0.0000000
        SingleShotChance=0.0000000
        MortarChance=0.0000000
    }
};

struct native MortarAttackSetupData
{
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private bool bUseCombatManager[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private bool bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float RangeToAnyEnemyToQuitAttack[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float MinDelayBetweenLobStrikes[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float MaxDelayBetweenLobStrikes[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private int MinLobStrikesBetweenDamageAssessments[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private int MaxLobStrikesBetweenDamageAssessments[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float MinDurationOfDamageAssessmentInSecs[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float MaxDurationOfDamageAssessmentInSecs[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float MinRangeToLaunchFrom[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float MaxRangeToLaunchFrom[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float DistanceErrorBuffer[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float MinHeightDelta[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float MaxHeightDelta[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float HeightErrorBuffer[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private bool bUseHeightInsteadOfPitchForEvaluations[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float MaxPitchAllowedInDegrees[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float MinPitchAllowedInDegrees[65537];
    var(0.25_Pct) /*0x93E50000-0x00000000*/ private float PitchErrorBufferInDegrees[65537];

    structdefaultproperties
    {
        bUseCombatManager=false
        bCheckToSeeIfAnyEnemyHasGottenToCloseAndNeedsToQuitAttack=false
        RangeToAnyEnemyToQuitAttack=0.0000000
        MinDelayBetweenLobStrikes=0.0000000
        MaxDelayBetweenLobStrikes=0.0000000
        MinLobStrikesBetweenDamageAssessments=0
        MaxLobStrikesBetweenDamageAssessments=0
        MinDurationOfDamageAssessmentInSecs=0.0000000
        MaxDurationOfDamageAssessmentInSecs=0.0000000
        MinRangeToLaunchFrom=0.0000000
        MaxRangeToLaunchFrom=0.0000000
        DistanceErrorBuffer=0.0000000
        MinHeightDelta=0.0000000
        MaxHeightDelta=0.0000000
        HeightErrorBuffer=0.0000000
        bUseHeightInsteadOfPitchForEvaluations=false
        MaxPitchAllowedInDegrees=0.0000000
        MinPitchAllowedInDegrees=0.0000000
        PitchErrorBufferInDegrees=0.0000000
    }
};

struct native DongoBankingWhileRollingParams
{
    var(0.25_Pct) /*0x49FD0000-0x00000000*/ private bool bEnable[65537];
    var(0.25_Pct) /*0x49FD0000-0x00000000*/ private float TurnRateDegreesPerSecond[65537];
    var(0.25_Pct) /*0x49FD0000-0x00000000*/ private float MaximumBankAngleInDegrees[65537];
    var(0.25_Pct) /*0x49FD0000-0x00000000*/ private float MinimumBankAngleInDegrees[65537];
    var(0.25_Pct) /*0x49FD0000-0x00000000*/ private float BankRateInDegreesPerSecond[65537];
    var(0.25_Pct) /*0x49FD0000-0x00000000*/ private float MinimumSpeedScaleFactor[65537];

    structdefaultproperties
    {
        bEnable=true
        TurnRateDegreesPerSecond=190.0000000
        MaximumBankAngleInDegrees=50.0000000
        MinimumBankAngleInDegrees=20.0000000
        BankRateInDegreesPerSecond=90.0000000
        MinimumSpeedScaleFactor=0.1000000
    }
};

struct native EdgeGlowColorInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableEdgeGlow;
    var(0.25_Pct) /*0x4D800000-0x00000000*/ private @NULL EdgeGlowColor[65537];
    var(0.25_Pct) /*0x4D800000-0x00000000*/ private bool bEnableEdgeGlowSharp[65537];
    var(0.25_Pct) /*0x4D800000-0x00000000*/ private float EdgeGlowRamp[65537];
    var(0.25_Pct) /*0x4D800000-0x00000000*/ private float EdgeGlowThresholdRef[65537];
    var(0.25_Pct) /*0x4D800000-0x00000000*/ private float EdgeGlowThresholdSlope[65537];

    structdefaultproperties
    {
        bEnableEdgeGlow=true
        EdgeGlowColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000)
        bEnableEdgeGlowSharp=false
        EdgeGlowRamp=0.0000000
        EdgeGlowThresholdRef=0.0000000
        EdgeGlowThresholdSlope=0.0000000
    }
};

struct native EdgeGlowBlendInfo
{
    var(0.25_Pct) /*0x4D7D0000-0x00000000*/ private @NULL StartColorInfo[65537];
    var(0.25_Pct) /*0x4D7D0000-0x00000000*/ private @NULL EndColorInfo[65537];
    var(0.25_Pct) /*0x4D7D0000-0x00000000*/ private float BlendTime[65537];
    var(0.25_Pct) /*0x4D7D0000-0x00000000*/ private byte BlendType[65537];

    structdefaultproperties
    {
        StartColorInfo=(bEnableEdgeGlow=true,EdgeGlowColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),bEnableEdgeGlowSharp=false,EdgeGlowRamp=0.0000000,EdgeGlowThresholdRef=0.0000000,EdgeGlowThresholdSlope=0.0000000)
        EndColorInfo=(bEnableEdgeGlow=true,EdgeGlowColor=(R=0.0000000,G=0.0000000,B=0.0000000,A=1.0000000),bEnableEdgeGlowSharp=false,EdgeGlowRamp=0.0000000,EdgeGlowThresholdRef=0.0000000,EdgeGlowThresholdSlope=0.0000000)
        BlendTime=0.0000000
        BlendType=AlphaBlendType.ABT_Linear
    }
};

struct native EdgeGlowInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentBlendIndex;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCurrentBlendStarted;
    var(0.25_Pct) /*0x4D810000-0x00000000*/ private editfixedsize array EdgeGlowBlends[65537];
    var(0.25_Pct) /*0x4D810000-0x00000000*/ private bool bLooping[65537];

    structdefaultproperties
    {
        CurrentBlendIndex=0
        bCurrentBlendStarted=false
        EdgeGlowBlends=none
        bLooping=false
    }
};

struct native LPTutorialTrackingInfo
{
    var(0.25_Pct) /*0x8A8E0000-0x00000000*/ private const byte TutorialType[65537];
    var(0.25_Pct) /*0x8A8E0000-0x00000000*/ private int StopDisplayingTextAfterXSuccessfulTimes[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumTimesSuccesful;
    var(0.25_Pct) /*0x8A8E0000-0x00000000*/ private float TimeDilation[65537];
    var(0.25_Pct) /*0x8A8E0000-0x00000000*/ private int StopUsingTimeDilationAfterXSuccessfulTimes[65537];
    var(0.25_Pct) /*0x8A8E0000-0x00000000*/ private bool bPersistentTutorial[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOnlyValidInVS;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bOnlyValidInPOF;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnabled;
    var(0.25_Pct) /*0x8A8E0000-0x00000000*/ private editfixedsize string TutorialString[65537];

    structdefaultproperties
    {
        TutorialType=EPlayerTutorialType.EPTT_None
        StopDisplayingTextAfterXSuccessfulTimes=-1
        NumTimesSuccesful=0
        TimeDilation=1.0000000
        StopUsingTimeDilationAfterXSuccessfulTimes=1
        bPersistentTutorial=false
        bOnlyValidInVS=false
        bOnlyValidInPOF=false
        bEnabled=false
        TutorialString=""
    }
};

struct native HealthPostProcessStruct
{
    var(0.25_Pct) /*0x66210000-0x00000000*/ private float InitialStrengthDecayRate[65537];
    var(0.25_Pct) /*0x66210000-0x00000000*/ private float MinStrengthForAnyHit[65537];
    var(0.25_Pct) /*0x66210000-0x00000000*/ private float MinDesaturation[65537];
    var(0.25_Pct) /*0x66210000-0x00000000*/ private float MaxDesaturation[65537];
    var(0.25_Pct) /*0x66210000-0x00000000*/ private float ThersholdForTriggeringDesaturation[65537];
    var(0.25_Pct) /*0x66210000-0x00000000*/ private float StrengthInterpSpeed[65537];
    var(0.25_Pct) /*0x66210000-0x00000000*/ private float StrengthScaling[65537];
    var(0.25_Pct) /*0x66210000-0x00000000*/ private float HealthInterpSpeed[65537];
    var(0.25_Pct) /*0x66210000-0x00000000*/ private float HealthMinThreshold[65537];
    var(0.25_Pct) /*0x66210000-0x00000000*/ private float CurrentStrengthBlendFactor[65537];

    structdefaultproperties
    {
        InitialStrengthDecayRate=1.0000000
        MinStrengthForAnyHit=0.5000000
        MinDesaturation=0.2500000
        MaxDesaturation=0.7500000
        ThersholdForTriggeringDesaturation=0.2500000
        StrengthInterpSpeed=0.0000000
        StrengthScaling=0.0000000
        HealthInterpSpeed=4.0000000
        HealthMinThreshold=0.3000000
        CurrentStrengthBlendFactor=4.0000000
    }
};

struct native ActivateAIResourceData
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class AiPawnClass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RefCount;

    structdefaultproperties
    {
        AiPawnClass=none
        RefCount=0
    }
};

struct native AttackTargetInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Info;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TargetVelocity;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetRadius;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetHeight;

    structdefaultproperties
    {
        Info=(Actor=none,Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),LastSeenTime=-1.0000000,LastDamageTime=-1.0000000,RecentDamageDone=0.0000000,PathNotValidTime=-1.0000000,LastAttackTime=-1.0000000,LastAttackCost=0.0000000)
        TargetVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        TargetRadius=0.0000000
        TargetHeight=0.0000000
    }
};

struct native AdHocSquadData
{
    var(0.25_Pct) /*0x032B0000-0x00000000*/ private name SqaudTypeName[65537];
    var(0.25_Pct) /*0x032B0000-0x00000000*/ private class AiPawnTypesForThisSquad[65537];
    var(0.25_Pct) /*0x032B0000-0x00000000*/ private int MaxNumberInSquad[65537];
    var(0.25_Pct) /*0x032B0000-0x00000000*/ private float MaxSeperationFromLeaderToBeInGroupRange[65537];

    structdefaultproperties
    {
        SqaudTypeName="TheDirtyGirls"
        AiPawnTypesForThisSquad=Class'LPAIPawn'
        MaxNumberInSquad=2
        MaxSeperationFromLeaderToBeInGroupRange=1000.0000000
    }
};

struct native VSSpitterAcidSockets
{
    var(0.25_Pct) /*0xD5390000-0x00000000*/ private name SocketName[65537];
    var(0.25_Pct) /*0xD5390000-0x00000000*/ private @NULL ParticleSystem[65537];

    structdefaultproperties
    {
        SocketName="None"
        ParticleSystem=none
    }
};

struct native HiddenMapZoneInfo
{
    var(0.25_Pct) /*0x66860000-0x00000000*/ private name ZoneName[65537];

    structdefaultproperties
    {
        ZoneName="None"
    }
};

struct native EMPInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte EMPRepCount;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EMPDuration;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class EMPDamageType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EMPInstigator;

    structdefaultproperties
    {
        EMPRepCount=0
        EMPDuration=0.0000000
        EMPDamageType=none
        EMPInstigator=none
    }
};

//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __ValidMortarArcTest__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnSearchForMortarSpotFinish__Delegate;

delegate ValidMortarArcTest()
{
    local /*0x97E50000-0x00000000*/ private @NULL FromLocation[25296897], TestTargetActor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

delegate OnSearchForMortarSpotFinish()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocationFound[25296897];
    local /*0x97E50000-0x00000000*/ private int IndexOfMortarFromLocation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SearchRequesterPawn[8388609], MortarLocationExplorerDone;

    //return;    
}
