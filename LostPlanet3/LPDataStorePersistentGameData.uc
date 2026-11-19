class LPDataStorePersistentGameData extends SPDataStorePersistentGameData
    transient
    config(Input)
    hidecategories(Object,UIRoot);

struct native LPVSMusicPlayerAudioComponents
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentMusicSource;
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL GameMusicAudioComp[524289];
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL UserMusicAudioComp[524289];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentGameMusicTrack;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRepeatGameMusicPlaylist;

    structdefaultproperties
    {
        CurrentMusicSource=EMusicSource.MS_GameMusic
        GameMusicAudioComp=none
        UserMusicAudioComp=none
        CurrentGameMusicTrack=0
        bRepeatGameMusicPlaylist=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL LevelTransitionData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL VSMusicPlayerAudioComponents;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBootupSaveWarningShown;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNextCheckpointSaveOverLast[536870913];

protected function ResetForNewGame_WorkerFunc()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL LTDDefault, LPGameFlowTpostBool;

    super.ResetForNewGame_WorkerFunc();
    LevelTransitionData = LTDDefault;
    LPGameFlowTpostBool = LPDataStoreTpost(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'LPDataStoreTpost'.default.Tag));
    // End:0x9C
    if(LPGameFlowTpostBool != none)
    {
        LPGameFlowTpostBool.Reset();
    }
    //return;    
}

protected function NotifyGameSessionEnded_WorkerFunc()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FoundVS, WI;

    WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
    // End:0xD3
    if(WI != none)
    {
        // End:0xD2
        foreach WI.AllPawns(Class'LPVSPlayerPawn', FoundVS)
        {
            // End:0xD1
            if(!FoundVS.IsPendingKill())
            {
                FoundVS.PauseVSMusicPlayer();
                FoundVS.DetachMusicPlayerComponents();
            }            
        }        
    }
    // End:0x18A
    if(FoundVS == none)
    {
        // End:0x136
        if(VSMusicPlayerAudioComponents.GameMusicAudioComp != none)
        {
            VSMusicPlayerAudioComponents.GameMusicAudioComp.Pause();
        }
        // End:0x18A
        if(VSMusicPlayerAudioComponents.UserMusicAudioComp != none)
        {
            VSMusicPlayerAudioComponents.UserMusicAudioComp.Pause();
        }
    }
    return super.NotifyGameSessionEnded_WorkerFunc();
    //return ReturnValue;    
}

function SaveCheckpointData()
{
    //return;    
}

function ApplyCheckpointData()
{
    //return;    
}

event SavePersistentVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL VSPawnToSave[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPreventSavedClassesAndAssetsFromGC[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array InSavedClassesRefsToPreventFromGC[26214401], InSavedObjectRefsToPreventFromGC;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL VSCPRDefault;

    false        
    // End:0x18
    if(VSPawnToSave == none)
    {
        return;
    }
    // End:0x3E
    if(!VSPawnToSave.bIsPersistent)
    {
        return;
    }
    LevelTransitionData.PersistentVS.VSPawnRecord = VSCPRDefault;
    VSPawnToSave.LPVSCreateCheckpointRecord(LevelTransitionData.PersistentVS.VSPawnRecord, bPreventSavedClassesAndAssetsFromGC, InSavedClassesRefsToPreventFromGC, InSavedObjectRefsToPreventFromGC);
    LevelTransitionData.PersistentVS.MeshTranslation = VSPawnToSave.default.Mesh.Translation;
    LevelTransitionData.PersistentVS.MapName = Class'SPEngine.SPUtil'.static.GetCurrentMapName();
    LevelTransitionData.PersistentVS.SubLevel = 'None';
    LevelTransitionData.PersistentVS.bSaved = true;
    //return;    
}

event RestorePersistentVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL VSPawnToRestore[8388609], ReturnValue, vsPawn;

    // End:0x102
    if(LevelTransitionData.PersistentVS.bSaved)
    {
        vsPawn = LPVSPlayerPawn(Class'LPVSPlayerPawn'.static.LPVSApplyCheckpointRecord(LevelTransitionData.PersistentVS.VSPawnRecord, VSPawnToRestore));
        // End:0xFF
        if(vsPawn != none)
        {
            LevelTransitionData.PersistentVS.MapName = Class'SPEngine.SPUtil'.static.GetCurrentMapName();            
        }        
    }
    return vsPawn;
    //return ReturnValue;    
}

defaultproperties
{
    LevelTransitionData=(PCRecord=(bIsInVitalSuit=false,bWinchRangeExtension=false,SPPCRecord=(SavedGuid=(A=0,B=0,C=0,D=0),TeamIndex=0),HumanPawn=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName=""),HumanPawnMeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000),SelectedJobLogObjective="",LastActivatedObjective="",bCanUseFullMunitionsLocker=false,TEnergyAmount=0.0000000,ScrapAmountPlayer=0.0000000,WhiteLeechDNAAmount=0.0000000,DisableVSGameMusicPlaybackCount=0,DisableVSUserMusicPlaybackCount=0,bVSGameMusicPlayingOnDisable=false,bVSUserMusicPlayingOnDisable=false,AutoResumeMusicPlayerOnDisableCount=0,bVSMusicPlayerPausedbyPlayer=false,StoredPlayerAmmoInfo=none,StoredPlayerWeaponInfo=none,PerkInventoryInfo=none,JobLogRecord=(TabIndex=0,MissionsRecord=(ListIndex=-1,ListSelectedIndex=-1),MapRecord=(bWorldMap=false,bListOpen=false,bListState=false,LocalMapDisplayIndex=0,MapZoneNameID="None"),InventoryRecord=(ListIndex=-1,ListSelectedIndex=-1),CollectiblesRecord=(ListIndex=-1,ListSelectedIndex=-1),MessagesRecord=(ListSelectedIndex=-1),MusicPlayerRecord=(ListSelectedIndex=-1)),VisitedMapZoneNames=none,AchievementValues=none),PersistentVS=(bSaved=false,MapName="None",SubLevel="None",MeshTranslation=(X=0.0000000,Y=0.0000000,Z=0.0000000),VSPawnRecord=(MyGuid=(A=0,B=0,C=0,D=0),LPPawnRecord=(SPPawnRecord=(PawnClassName="",PawnPathName="",Location=(X=0.0000000,Y=0.0000000,Z=0.0000000),Rotation=(Pitch=0,Yaw=0,Roll=0),BasePathName="",SlotMarkerPathName="",PawnHealthPct=0.0000000,ReplicatedAnimSets=none,WeaponRecords=none,ActorStateRecord=(BodyPart=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[1]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[2]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[3]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[4]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[5]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[6]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false),BodyPart[7]=(ActorRelativeDamageRatioMin=0.0000000,ActorRelativeDamageRatioMax=0.0000000,ActorRelativeDamageFactor=0.0000000,DamageTransfer=1.0000000,MinDamageFactor=0.0000000,DamageFactorParamName="DamageFactor",DamageTimerParamName="DamageTimer",MaterialInstReference=none,CurrentDamage=0.0000000,CurrentDamageFactor=0.0000000,CurrentDamageTimer=0.0000000,NumHits=0,bDisableUpdates=false)),CSARecord=(KismetCSAName="",bKismetTopPriority=false),TemplateName="",OverrideModularSkeletalMeshSelectionTuneDataName=""),PartsInventory=none,TEnergyRecord=(InventoryClassPath="",EnergyData=(RepCounter=0,EnergyCount=0.0000000,EnergyDelta=0.0000000,bDoFX=false),MaxEnergy=0,TotalLimit=0),TEnergyFannyPackRecord=(InventoryClassPath="",MaxCapacity=0.0000000,CurrentCapacity=0.0000000),UmbilicalState=EHUDUmbilicalState.UHS_Normal,LastEquippedWeaponClassName=""),bReplicated=false,bHidden=false,bIsPossessedByPlayer=false,bMusicTrackPlaying=false,bMusicTrackPaused=false,bPlayerInVitalSuit=false,MusicTrackPlayed=0,WinchLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000),bIsPlatformMode=false,bDesignerForcedVacantVSAttachmentsOff=false,bDesignerForcedLightAttachments=false)))
    VSMusicPlayerAudioComponents=(CurrentMusicSource=EMusicSource.MS_GameMusic,GameMusicAudioComp=// Reference: AkComponent'Default__LPDataStorePersistentGameData.GameMusicPlayerAudioCompObj'
    begin object name=GameMusicPlayerAudioCompObj class=Class'AkAudio.AkComponent'
    end object
    GameMusicAudioComp=GameMusicPlayerAudioCompObj,UserMusicAudioComp=// Reference: AkComponent'Default__LPDataStorePersistentGameData.UserMusicPlayerAudioCompObj'
    begin object name=UserMusicPlayerAudioCompObj class=Class'AkAudio.AkComponent'
    end object
    UserMusicAudioComp=UserMusicPlayerAudioCompObj,CurrentGameMusicTrack=1,bRepeatGameMusicPlaylist=true)
    QuestManagerClass=Class'LPQuestManager'
}