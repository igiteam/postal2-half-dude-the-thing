class LPVSPlayerPawn extends LPBaseVSPlayerPawn
    abstract
    nativereplication
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

const NUM_GLASS_COMPONENTS = 5;

struct native ForkArmGrabInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrabPoint;

    structdefaultproperties
    {
        GrabPoint=(HitPawn=none,GrabPointIndex=0,bFirmGrab=false)
    }
};

struct native ReplicatedForkArmGrabInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class GrabClass;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrabPointInfo;

    structdefaultproperties
    {
        GrabClass=none
        GrabPointInfo=(HitPawn=none,GrabPointIndex=0,bFirmGrab=false)
    }
};

struct native PlatformParticleInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HealthPercent;
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ParticleComponent[524289];

    structdefaultproperties
    {
        HealthPercent=0.0000000
        ParticleComponent=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrabbedPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LeftArmPart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CCDControl_LeftArm;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel class<LPVSInventoryParts> LeftArmPartClass[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bControllerUsingLeftArm[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bControllerUsingRightArm[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRepeatGameMusicPlaylist[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPersistent;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bExtractConsolesActive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIssuingADWindowSequenceEvent[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIssuingFAWindowSequenceEvent[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHideVSGlass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRequestWinchFire;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPreventAllZipline[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmPart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel class<LPVSInventoryParts> RightArmPartClass[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL RightArmPartInfo[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ForkArmSkelControlName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ForkArmSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name RearCableSkelControllerName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RearCableSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name FrontCableSkelControllerName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FrontCableSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name KernCableEndSkelControllerName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name KernCableHookSkelControllerName;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL KernCableComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TazerComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL WinchComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DrillSpinSkelControllerName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DrillSpinSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmAnimInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmWelderAnimInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmDrillAnimInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmClawAnimInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmBlendPerBone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmClawBlendPerBone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmWelderBlendPerBone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmDrillBlendPerBone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name WinchBoneName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name WinchProjBoneName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentMusicSource;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL GameMusicPlayerAudioComp[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL UserMusicPlayerAudioComp[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentGameMusicTrack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TaserAudioComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ReplicatedForkArmGrabInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReplicatedForkArmGrabCurTweenValue[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ForkArmGrabAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VSWinchAnimTree;
var(0.25_Pct) /*0x8ADE0000-0x00000000*/ private editfixedsize array DefaultRemoteInventoryParts[65537];
var(0.25_Pct) /*0x8ADE0000-0x00000000*/ private editfixedsize array DefaultCookOnlyInventoryParts[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TaserMeshComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PartsInvManager;
var(0.25_Pct_15663103) /*0x97E50000-0x00000000*/ private @NULL VSHUD_PanelsStaticInfo[2];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JobLogRenderTexture;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ExtractionSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DrillBeginSoundCue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DrillEndSoundCue;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExtractPocket;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ExtractionConsoles;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalExtractable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TotalExtracted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerRestartTheUR;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStrugglePlayerUnTaserTheUR;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerShutDownVsWithEmpPulseStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerShuttingDownUrWithTaser;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerKnockOutHitsOnUr;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerCuttingOffRightTool;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerLarocheVsSawingCockpitOnRightArmGrab;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerDrillingMainSawGen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerTorchingMainSawGen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerDrillingToExposeCommArray;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerTorchingToExposeCommArray;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerDrillingToDestroyCommArray;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerTorchingToDestroyCommArray;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerDrillingHipShield;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerTorchingHipShield;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerCauseByDrillMobilityKill;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerCauseByTorchMobilityKill;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerDisableToRipOpenTheCockpit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerRippingOpenTheCockpit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataWinchStruggleVsPlayerVsLaroche;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerCarrier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class WelderClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class WinchClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class TaserClass;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL VideoPlayerComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array LegsCollision[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL MainCollisionUnpossessed[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL MainCollisionPossessed[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RightGlassDamageFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LeftGlassDamageFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FrontGlassDamageFactor;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array FrontGlassMeshComps[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array RightGlassMeshComps[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array LeftGlassMeshComps[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LockerHologramBaseOpacity[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LockerHologramDesiredOpacity[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LockerHologramFadeInSpeed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LockerHologramFadeOutSpeed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL LockerHologram[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LockerHologramMat[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PSCompWinchBeam[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WinchBeamTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RequestedWinchLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array PlatformParticles[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> SubscribedOnArmAction[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HealthRegenRate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HealthRegenDelay[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DefenderOnHullMessageID;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UpperBodyCameraBypassBlendPerBone[536870913];
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OldParticleSystemFinishedDelegate__Delegate;
//var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> __OnArmAction__Delegate;

delegate @NULL OldParticleSystemFinishedDelegate()
{
    local /*0x97E50000-0x00000400*/ private @NULL PSystem[8388609];

    //return;    
}

delegate OnArmAction()
{
    local /*0x97E50000-0x00000000*/ private name InName[8388609];

    //return;    
}

// Export ULPVSPlayerPawn::execGetLPHUD(FFrame&, void* const)
native final function GetLPHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPVSPlayerPawn::execGetTaserChargeFactor(FFrame&, void* const)
native final simulated function GetTaserChargeFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPVSPlayerPawn::execGetArmorFactor(FFrame&, void* const)
native final simulated function GetArmorFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPVSPlayerPawn::execGetVSHUDDamageFactor(FFrame&, void* const)
native final simulated function GetVSHUDDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPVSPlayerPawn::execGetVSJobLogFocused(FFrame&, void* const)
native final simulated function GetVSJobLogFocused()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPVSPlayerPawn::execDetachMusicPlayerComponents(FFrame&, void* const)
native function DetachMusicPlayerComponents();

// Export ULPVSPlayerPawn::execPauseVSMusicPlayer(FFrame&, void* const)
native function PauseVSMusicPlayer();

// Export ULPVSPlayerPawn::execGetHealthRegenRate(FFrame&, void* const)
native function GetHealthRegenRate()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPVSPlayerPawn::execGetHealthRegenDelay(FFrame&, void* const)
native function GetHealthRegenDelay()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

function GetLocalPlayerController()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPPC;

    LPPC = LPPlayerController(Controller);
    // End:0x71
    if(LPPC == none)
    {
        // End:0x70
        foreach LocalPlayerControllers(Class'LPPlayerController', LPPC)
        {
            // End:0x6F
            if(LPPC.IsLocalPlayerController())
            {
                // End:0x70
                break;
            }            
        }        
    }
    return LPPC;
    //return ReturnValue;    
}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, UserMusicPlayer;

    super.PostBeginPlay();
    HealthRegenRate = TuneDataPawn.GetHealthRegenRate(self);
    HealthRegenDelay = TuneDataPawn.GetHealthRegenDelay(self);
    AddDefaultInventory();
    AddDefaultRemoteInventoryParts();
    // End:0xA5
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        NextVSWeapon();
    }
    CCDControl_LeftArm = LPSkelControl_CCD_IK(Mesh.FindSkelControl('CCDControl_ForkArm'));
    CCDControl_LeftArm.SetSkelControlActive(false);
    UseUnpossessedCollision();
    InitKernCable();
    InitVSGlass();
    InitMunitionsLocker();
    LPPC = GetLocalPlayerController();
    // End:0x1EF
    if(LPPC != none)
    {
        UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
        // End:0x1EF
        if((UserMusicPlayer != none) && UserMusicPlayer.__OnNewTrackStart__Delegate == none)
        {
            UserMusicPlayer.__OnNewTrackStart__Delegate = LPPC.NotifyNewTrack;
        }
    }
    AttachMusicPlayerComponents();
    ResumeVSMusicPlayer();
    //return;    
}

simulated event ScriptGetTeamNum()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 3;
    //return ReturnValue;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.PossessedBy(C, bVehicleTransition);
    UsePossessedCollision();
    //return;    
}

function UnPossessed()
{
    UseUnpossessedCollision();
    super.UnPossessed();
    //return;    
}

function UsePossessedCollision()
{
    local /*0x97E50000-0x00000000*/ private int I;

    bUseMultipleExtent = false;
    DetachComponent(MainCollisionUnpossessed);
    CollisionComponent = MainCollisionPossessed;
    CylinderComponent = MainCollisionPossessed;
    AttachComponent(MainCollisionPossessed);
    I = 0;
    J0x63:

    // End:0xA6 [Loop If]
    if(I < LegsCollision.Length)
    {
        DetachComponent(LegsCollision[I]);
        ++I;
        // [Loop Continue]
        goto J0x63;
    }
    SPKynapseBodiesHandle(myKynapseHandle).NotifyCollisionChanged();
    //return;    
}

function UseUnpossessedCollision()
{
    local /*0x97E50000-0x00000000*/ private int I;

    bUseMultipleExtent = true;
    DetachComponent(MainCollisionPossessed);
    CollisionComponent = MainCollisionUnpossessed;
    CylinderComponent = MainCollisionUnpossessed;
    AttachComponent(MainCollisionUnpossessed);
    I = 0;
    J0x63:

    // End:0xA6 [Loop If]
    if(I < LegsCollision.Length)
    {
        AttachComponent(LegsCollision[I]);
        ++I;
        // [Loop Continue]
        goto J0x63;
    }
    SPKynapseBodiesHandle(myKynapseHandle).NotifyCollisionChanged();
    //return;    
}

function AttachVideoPlayerComponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL relLocation, relRotation;

    relLocation.X = -28.0100000;
    relLocation.Y = 9.4089980;
    relLocation.Z = 82.3665000;
    relRotation.Pitch = 4463;
    relRotation.Yaw = -134;
    relRotation.Roll = -15617;
    Mesh.AttachComponent(VideoPlayerComponent, 'JO_PlayerCamera', relLocation, relRotation);
    // End:0x13F
    if(bRenderInForegroundWhenInCockpit)
    {
        VideoPlayerComponent.SetViewOwnerDepthPriorityGroup(true, 2);
    }
    //return;    
}

function DetachVideoPlayerComponent()
{
    Mesh.DetachComponent(VideoPlayerComponent);
    // End:0x57
    if(bRenderInForegroundWhenInCockpit)
    {
        VideoPlayerComponent.SetViewOwnerDepthPriorityGroup(false, 1);
    }
    //return;    
}

simulated function NextVSWeapon()
{
    PartsInvManager.NextVSWeapon();
    //return;    
}

simulated function RemoveVSInventory()
{
    local /*0x97E50000-0x00000000*/ private @NULL W;

    // End:0x4D
    foreach PartsInvManager.InventoryActors(Class'LPVSInventoryParts', W)
    {
        W.Destroy();        
    }    
    //return;    
}

simulated event @NULL TaserLineCreateParticleSystem()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689], ThePool, Rot, PS;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Source, WinchWeapon;

    PS = TuneDataVSPlayerPawn.TaserBeamParticleSystem;
    // End:0x294
    if(PS != none)
    {
        ThePool = SPEmitterPool(WorldInfo.MyEmitterPool);
        Mesh.GetSocketWorldLocationAndRotation('WinchCable', Source, Rot);
        WinchWeapon = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
        WinchWeapon.SpawnedProjectile.GetSkeletalMesh().GetSocketWorldLocationAndRotation('CableEnd', WinchBeamTarget);
        PSCompWinchBeam = ThePool.SPSpawnEmitterMeshAttachment(PS, Mesh, 'WinchCable', true);
        // End:0x294
        if(PSCompWinchBeam != none)
        {
            PSCompWinchBeam.ActivateSystem();
            PSCompWinchBeam.SetScale(2.5000000);
            I = 0;
            J0x1CD:

            // End:0x294 [Loop If]
            if(I < PSCompWinchBeam.EmitterInstances.Length)
            {
                PSCompWinchBeam.SetBeamSourcePoint(I, Source, 0);
                PSCompWinchBeam.SetBeamEndPoint(I, WinchBeamTarget);
                PSCompWinchBeam.SetKillOnDeactivate(I, true);
                ++I;
                // [Loop Continue]
                goto J0x1CD;
            }
        }
    }
    return PSCompWinchBeam;
    //return ReturnValue;    
}

function UpdateTaserBeam()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Source, WinchWeapon;

    // End:0x170
    if(PSCompWinchBeam != none)
    {
        Mesh.GetSocketWorldLocationAndRotation('WinchCable', Source);
        WinchWeapon = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
        WinchWeapon.SpawnedProjectile.GetSkeletalMesh().GetSocketWorldLocationAndRotation('CableEnd', WinchBeamTarget);
        I = 0;
        J0xD2:

        // End:0x170 [Loop If]
        if(I < PSCompWinchBeam.EmitterInstances.Length)
        {
            PSCompWinchBeam.SetBeamSourcePoint(I, Source, 0);
            PSCompWinchBeam.SetBeamEndPoint(I, WinchBeamTarget);
            ++I;
            // [Loop Continue]
            goto J0xD2;
        }
    }
    //return;    
}

simulated event @NULL CleanUpParticleSystem()
{
    local /*0x97E50000-0x00000400*/ private @NULL PSComp[8388609];

    // End:0x70
    if(PSComp != none)
    {
        PSComp.__OnSystemFinished__Delegate = OldParticleSystemFinishedDelegate;
        PSComp.OnSystemFinished(PSComp);
    }
    //return;    
}

simulated event Destroyed()
{
    RemoveVSInventory();
    super(LPBasePlayerPawn).Destroyed();
    TurnOffTaserAudioComponent();
    PauseVSMusicPlayer();
    DetachMusicPlayerComponents();
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x2F
    if(VarName == 'RightArmPartClass')
    {
        SwitchToInventoryPart(1, RightArmPartClass);        
    }
    else
    {
        // End:0x5E
        if(VarName == 'LeftArmPartClass')
        {
            SwitchToInventoryPart(2, LeftArmPartClass);            
        }
        else
        {
            // End:0xB0
            if(VarName == 'bControllerUsingRightArm')
            {
                // End:0xAD
                if(RightArmPart != none)
                {
                    RightArmPart.NewControllerState(bControllerUsingRightArm);
                }                
            }
            else
            {
                // End:0x102
                if(VarName == 'bControllerUsingLeftArm')
                {
                    // End:0xFF
                    if(LeftArmPart != none)
                    {
                        LeftArmPart.NewControllerState(bControllerUsingLeftArm);
                    }                    
                }
                else
                {
                    super(LPBasePlayerPawn).ReplicatedEvent(VarName);
                }
            }
        }
    }
    //return;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    // End:0x4F
    if(IsLocallyControlled())
    {
        // End:0x4C
        if(!IsTimerActive('SearchForVSHUDPoints'))
        {
            SetTimer(0.2500000, true, 'SearchForVSHUDPoints');
        }        
    }
    else
    {
        // End:0x7A
        if(IsTimerActive('SearchForVSHUDPoints'))
        {
            ClearTimer('SearchForVSHUDPoints');
        }
    }
    UpdateCombatWindowTutorials();
    // End:0xC4
    if(bRequestWinchFire && (FindInventoryType(Class'LPWeaponVSWinch', true)) != none)
    {
        bRequestWinchFire = false;
        LocalFireWinch();
    }
    //return;    
}

function LocalFireWinch()
{
    DoSpecialMove(Class'LPSM_PlayerVSWinchArmFire', true);
    //return;    
}

function UpdateCombatWindowTutorials()
{
    local /*0x97E50000-0x00000000*/ private bool bForceOff[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Controller);
    // End:0xEC
    if(((LPPC != none) && !bIssuingADWindowSequenceEvent) && IsAnyActiveDefenseWindowOpen())
    {
        bIssuingADWindowSequenceEvent = true;
        TriggerEventClass(Class'LPSeqEvent_VS_ActiveDefenseWindow', self, 0);
        // End:0xA5
        if(!IsAnyActiveDefenseWindowOpen(true))
        {
            LPPC.SetTutorialMode(4);            
        }
        else
        {
            LPPC.SetTutorialMode(2);
        }
        LPPC.SetVSReticleHelpButton(3, true);        
    }
    else
    {
        // End:0x1A0
        if(bForceOff || ((LPPC != none) && bIssuingADWindowSequenceEvent) && !IsAnyActiveDefenseWindowOpen())
        {
            bIssuingADWindowSequenceEvent = false;
            TriggerEventClass(Class'LPSeqEvent_VS_ActiveDefenseWindow', self, 1);
            // End:0x1A0
            if(LPPC != none)
            {
                LPPC.CloseTutorialMode();
                LPPC.SetVSReticleHelpButton(3, false);
            }
        }
    }
    // End:0x239
    if(((LPPC != none) && !bIssuingFAWindowSequenceEvent) && IsAnyForkArmWindowOpen())
    {
        bIssuingFAWindowSequenceEvent = true;
        TriggerEventClass(Class'LPSeqEvent_VS_ForkArmWindow', self, 0);
        LPPC.SetTutorialMode(3);
        LPPC.SetVSReticleHelpButton(0, true);        
    }
    else
    {
        // End:0x2EC
        if(bForceOff || ((LPPC != none) && bIssuingFAWindowSequenceEvent) && !IsAnyForkArmWindowOpen())
        {
            bIssuingFAWindowSequenceEvent = false;
            TriggerEventClass(Class'LPSeqEvent_VS_ForkArmWindow', self, 1);
            // End:0x2EC
            if(LPPC != none)
            {
                LPPC.CloseTutorialMode();
                LPPC.SetVSReticleHelpButton(0, false);
            }
        }
    }
    //return;    
}

function CreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825];

    LPVSCreateCheckpointRecord(Record.VSRecord);
    Record.VSRecord.bDesignerForcedVacantVSAttachmentsOff = bDesignerForcedVacantVSAttachmentsOff;
    Record.VSRecord.bDesignerForcedLightAttachments = bDesignerForcedLightAttachments;
    Record.SnowMinimum = SnowMinimum;
    //return;    
}

function LPVSCreateCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25165825];
    local /*0x97E50000-0x00000000*/ private bool bPreventSavedClassesAndAssetsFromGC[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array SavedClassesRefsToPreventFromGC[26214401], SavedObjectRefsToPreventFromGC;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, Winch;

    false        
    Record.MyGuid = MyGuid;
    Class'LPPawn'.static.LPCreatePawnCheckpointRecord(false, Record.LPPawnRecord, self, PlayerController(Controller), bPreventSavedClassesAndAssetsFromGC, SavedClassesRefsToPreventFromGC, SavedObjectRefsToPreventFromGC);
    Record.bReplicated = int(RemoteRole) != int(ROLE_None);
    Record.bHidden = bHidden;
    Record.bIsPossessedByPlayer = bIsPossessedByPlayer;
    Record.MusicTrackPlayed = 0;
    Record.bMusicTrackPlaying = (GameMusicPlayerAudioComp != none) && GameMusicPlayerAudioComp.IsPlaying();
    Record.bMusicTrackPaused = (GameMusicPlayerAudioComp != none) && GameMusicPlayerAudioComp.IsPaused();
    LPPC = LPPlayerController(Controller);
    // End:0x239
    if(LPPC != none)
    {
        Record.bPlayerInVitalSuit = LPPC.bIsInVitalSuit;
    }
    // End:0x295
    if(Record.bMusicTrackPlaying && int(CurrentMusicSource) == int(0))
    {
        Record.MusicTrackPlayed = CurrentGameMusicTrack;
    }
    Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x36B
    if(((Winch != none) && Winch.SpawnedProjectile != none) && Winch.IsInState('WinchPointInteracting'))
    {
        Record.WinchLocation = Winch.SpawnedProjectile.Location;        
    }
    else
    {
        Record.WinchLocation = vect(0.0000000, 0.0000000, 0.0000000);
    }
    Record.bIsPlatformMode = bIsPlatformMode;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25296897];

    LPVSApplyCheckpointRecord(Record.VSRecord, self);
    bDesignerForcedVacantVSAttachmentsOff = Record.VSRecord.bDesignerForcedVacantVSAttachmentsOff;
    bDesignerForcedLightAttachments = Record.VSRecord.bDesignerForcedLightAttachments;
    UpdateVSLightAttachmentState();
    SetHealth(HealthMax);
    SnowMinimum = Record.SnowMinimum;
    SnowPercent = SnowMinimum;
    //return;    
}

static function LPVSApplyCheckpointRecord()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Record[25296897], PawnToApply, ReturnValue, SPP, WI, LPPC,
	    VSPawnToApply;

    local /*0x97E50000-0x00000000*/ private bool bSavedIsInVitalSuit;
    local /*0x97E50000-0x00000000*/ private @NULL MyEngine, SPGame;

    // End:0x2A
    if(PawnToApply != none)
    {
        PawnToApply.SetCollision(true, false);
    }
    PawnToApply = Class'LPPawn'.static.LPApplyPawnCheckpointRecord(false, Record.LPPawnRecord, PawnToApply);
    PawnToApply.SetCollision(true, true);
    SPP = SPPawn(PawnToApply);
    // End:0xFD
    if(SPP != none)
    {
        SPP.MyGuid = Record.MyGuid;
    }
    PawnToApply.SetHidden(Record.bHidden);
    // End:0x447
    if(Record.bMusicTrackPlaying)
    {
        LPPC = LPPlayerController(PawnToApply.Controller);
        // End:0x22D
        if(LPPC == none)
        {
            WI = Class'Engine.WorldInfo'.static.GetWorldInfo();
            // End:0x22D
            if(WI != none)
            {
                // End:0x22C
                foreach WI.AllControllers(Class'LPPlayerController', LPPC)
                {
                    // End:0x22B
                    if(LPPC.IsLocalPlayerController())
                    {
                        // End:0x22C
                        break;
                    }                    
                }                
            }
        }
        // End:0x447
        if(LPPC != none)
        {
            bSavedIsInVitalSuit = LPPC.bIsInVitalSuit;
            LPPC.bIsInVitalSuit = Record.bPlayerInVitalSuit;
            VSPawnToApply = LPVSPlayerPawn(PawnToApply);
            // End:0x41D
            if((VSPawnToApply != none) && int(VSPawnToApply.CurrentMusicSource) == int(0))
            {
                // End:0x41D
                if(((VSPawnToApply.GameMusicPlayerAudioComp != none) && !VSPawnToApply.GameMusicPlayerAudioComp.IsPaused()) && LPPC.IsOkToPlayMusic(true))
                {
                    VSPawnToApply.CurrentGameMusicTrack = Record.MusicTrackPlayed;
                    LPPC.TurnOnVSMusicPlayer(VSPawnToApply, !Record.bMusicTrackPaused, Record.bMusicTrackPaused);
                }
            }
            LPPC.bIsInVitalSuit = bSavedIsInVitalSuit;
        }
    }
    // End:0x517
    if(Record.bReplicated)
    {
        PawnToApply.ForceNetRelevant();
        // End:0x517
        if(int(PawnToApply.RemoteRole) != int(ROLE_None))
        {
            PawnToApply.SetForcedInitialReplicatedProperty(BoolProperty'Engine.Actor.bHidden', PawnToApply.bHidden == PawnToApply.default.bHidden);
        }
    }
    MyEngine = SPEngine(Class'Engine.Engine'.static.GetEngine());
    SPGame = SPGameSP_Base(PawnToApply.WorldInfo.Game);
    // End:0x734
    if((((SPGame != none) && SPGame.bCheckpointLoadInProgress) && MyEngine != none) && (MyEngine.PendingCheckpointName == "zqv_FOL_PreSpitter") || MyEngine.PendingCheckpointName == "zqv_FOL_AfterSpitter")
    {
        LPVSPlayerPawn(PawnToApply).bRequestWinchFire = true;
        LPVSPlayerPawn(PawnToApply).RequestedWinchLocation.X = -554.6572000;
        LPVSPlayerPawn(PawnToApply).RequestedWinchLocation.Y = -7544.3830000;
        LPVSPlayerPawn(PawnToApply).RequestedWinchLocation.Z = 1491.1990000;        
    }
    else
    {
        // End:0x7C6
        if(!IsZero(Record.WinchLocation))
        {
            LPVSPlayerPawn(PawnToApply).bRequestWinchFire = true;
            LPVSPlayerPawn(PawnToApply).RequestedWinchLocation = Record.WinchLocation;
        }
    }
    // End:0x861
    if(Record.bIsPlatformMode)
    {
        LPVSPlayerPawn(PawnToApply).RevealPlatform(LPVSPlayerPawn(PawnToApply).ExtractPocket);
        LPVSPlayerPawn(PawnToApply).GotoState('VSExtraction');
    }
    return PawnToApply;
    //return ReturnValue;    
}

simulated event ConvertToProperPawnForKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], LPPC;

    LPPC = LPPlayerController(Controller);
    // End:0x80
    if(LPPC != none)
    {
        // End:0x80
        if(SPPawn(LPPC.HumanPlayerPawn) != none)
        {
            return SPPawn(LPPC.HumanPlayerPawn);
        }
    }
    return self;
    //return ReturnValue;    
}

simulated event PlayActorFaceFXAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSet[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string GroupName[8388609], SeqName;
    local /*0x97E50000-0x00000000*/ private @NULL SoundCueToPlay[8388609], AkEventToPlay, AkCBInfo;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Controller);
    // End:0xBB
    if(LPPC != none)
    {
        // End:0xBB
        if(LPPC.HumanPlayerPawn != none)
        {
            return LPPC.HumanPlayerPawn.PlayActorFaceFXAnim(AnimSet, GroupName, SeqName, SoundCueToPlay, AkEventToPlay, AkCBInfo);
        }
    }
    return super(Pawn).PlayActorFaceFXAnim(AnimSet, GroupName, SeqName, SoundCueToPlay, AkEventToPlay, AkCBInfo);
    //return ReturnValue;    
}

simulated function @NULL PerformPostInitAnimTreeActions()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super.PerformPostInitAnimTreeActions(SkelComp);
    RightArmAnimInfo.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(RightArmAnimInfo.AnimNodeSlotName));
    RightArmWelderAnimInfo.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(RightArmWelderAnimInfo.AnimNodeSlotName));
    RightArmDrillAnimInfo.AnimNodeSlot = SPAnimNodeSlot(SkelComp.FindAnimNode(RightArmDrillAnimInfo.AnimNodeSlotName));
    RightArmBlendPerBone = LPAnimNodeBlendPerBone(SkelComp.FindAnimNode('RightArmBlendPerBone'));
    RightArmBlendPerBone.SetBlendTarget(0.0000000, 0.0000000);
    RightArmDrillBlendPerBone = LPAnimNodeBlendPerBone(SkelComp.FindAnimNode('RightArmDrillBlendPerBone'));
    RightArmDrillBlendPerBone.SetBlendTarget(0.0000000, 0.0000000);
    RightArmWelderBlendPerBone = LPAnimNodeBlendPerBone(SkelComp.FindAnimNode('RightArmWelderBlendPerBone'));
    RightArmWelderBlendPerBone.SetBlendTarget(0.0000000, 0.0000000);
    UpperBodyCameraBypassBlendPerBone = LPAnimNodeBlendPerBone(SkelComp.FindAnimNode('UpperBodyCameraBypassBlendPerBone'));
    UpperBodyCameraBypassBlendPerBone.SetBlendTarget(0.0000000, 0.0000000);
    // End:0x318
    if(ForkArmSkelControlName != 'None')
    {
        ForkArmSkelControl = SkelControlSingleBone(SkelComp.FindSkelControl(ForkArmSkelControlName));
    }
    // End:0x38A
    if(FrontCableSkelControllerName != 'None')
    {
        FrontCableSkelControl = SkelControlSingleBone(SkelComp.FindSkelControl(FrontCableSkelControllerName));
        FrontCableSkelControl.SetSkelControlActive(false);
    }
    // End:0x3FC
    if(RearCableSkelControllerName != 'None')
    {
        RearCableSkelControl = SkelControlSingleBone(SkelComp.FindSkelControl(RearCableSkelControllerName));
        RearCableSkelControl.SetSkelControlActive(false);
    }
    // End:0x46E
    if(DrillSpinSkelControllerName != 'None')
    {
        DrillSpinSkelControl = SkelControlSingleBone(SkelComp.FindSkelControl(DrillSpinSkelControllerName));
        DrillSpinSkelControl.SetSkelControlActive(false);
    }
    //return;    
}

simulated function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super.GetAnimTemplateTreeForSpecialMove(SpecialMove);
    return MyAnimTree;
    //return ReturnValue;    
}

simulated function SwitchToNewInventoryPart()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL NewPart[8388609];
    local /*0x97E50000-0x00000000*/ private class NewPartClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    switch(PartSlot)
    {
        // End:0xE5
        case 1:
            // End:0xE2
            if(NewPart != RightArmPart)
            {
                // End:0x5D
                if(RightArmPart != none)
                {
                    RightArmPart.PartUnequipped();
                }
                RightArmPart = NewPart;
                RightArmPartClass = NewPartClass;
                // End:0xB4
                if(NewPartClass == Class'LPWeaponVSDrill')
                {
                    TriggerEventClass(Class'LPSeqEvent_VS_EquippedDrill', self);                    
                }
                else
                {
                    // End:0xE2
                    if(NewPartClass == Class'LPWeaponVSWelder')
                    {
                        TriggerEventClass(Class'LPSeqEvent_VS_EquippedTorch', self);
                    }
                }
            }
            // End:0x15D
            break;
        // End:0x158
        case 2:
            // End:0x155
            if(NewPart != LeftArmPart)
            {
                // End:0x12F
                if(LeftArmPart != none)
                {
                    LeftArmPart.PartUnequipped();
                }
                LeftArmPart = NewPart;
                LeftArmPartClass = NewPartClass;
            }
            // End:0x15D
            break;
        // End:0xFFFF
        default:
            return;
            break;
    }
    // End:0x194
    if(NewPart != none)
    {
        NewPart.PartEquipped(PartSlot);
    }
    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_NewVSRightArmPartEquipped, self);
    myLPHUD = GetLPHUD();
    // End:0x200
    if(myLPHUD != none)
    {
        myLPHUD.SwitchedToNewInventoryPart();
    }
    //return;    
}

function SetDrillSpinControlStrength()
{
    local /*0x97E50000-0x00000000*/ private float Value[8388609], BlendTime;
    local /*0x97E50000-0x00000000*/ private byte ForceProceduralSpinType[9437185];

    0
    // End:0x3E
    if(int(ForceProceduralSpinType) == int(1))
    {
        DrillSpinSkelControl.bAddRotation = true;        
    }
    else
    {
        // End:0x73
        if(int(ForceProceduralSpinType) == int(2))
        {
            DrillSpinSkelControl.bAddRotation = false;
        }
    }
    // End:0xE3
    if((Value > 0.0000000) && DrillSpinSkelControl.StrengthTarget == 0.0000000)
    {
        DrillSpinSkelControl.BoneRotation.Roll = 0;
    }
    DrillSpinSkelControl.SetSkelControlStrength(Value, BlendTime);
    //return;    
}

function AddDrillSpinControlRotation()
{
    local /*0x97E50000-0x00000000*/ private float degrees[8388609];
    local /*0x97E50000-0x00000000*/ private int Rot;

    Rot = int(degrees * 182.0444000);
    DrillSpinSkelControl.BoneRotation.Roll = NormalizeRotAxis(DrillSpinSkelControl.BoneRotation.Roll + Rot);
    //return;    
}

function AddDefaultInventory()
{
    // End:0x2B
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        return;
    }
    super(SPInventoryPawn).AddDefaultInventory();
    //return;    
}

simulated function AddDefaultRemoteInventoryParts()
{
    local /*0x97E50000-0x00000000*/ private class InvClass;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x8F
    if(PartsInvManager == none)
    {
        PartsInvManager = LPInventoryManager(Spawn(InventoryManagerClass, self));
        // End:0x4E
        if(PartsInvManager == none)
        {            
        }
        else
        {
            PartsInvManager.RemoteRole = ROLE_None;
            PartsInvManager.SetupFor(self);
        }
    }
    // End:0xBB
    foreach DefaultRemoteInventoryParts(InvClass)
    {
        TryToAddInventory(InvClass, false);        
    }    
    LPPC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);
    // End:0x1B5
    if(LPPC != none)
    {
        // End:0x149
        if(LPPC.HasUpgrade(Class'LPVSUpgrade_Blowtorch'))
        {
            AddBlowtorch();
        }
        // End:0x17F
        if(LPPC.HasUpgrade(Class'LPVSUpgrade_Winch'))
        {
            AddWinch();
        }
        // End:0x1B5
        if(LPPC.HasUpgrade(Class'LPVSUpgrade_Taser'))
        {
            AddTaser();
        }
    }
    //return;    
}

function TryToAddInventory()
{
    local /*0x97E50000-0x00000000*/ private class NewInvClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL Inv;

    Inv = FindInventoryType(NewInvClass);
    // End:0x6A
    if(Inv == none)
    {
        Inv = PartsInvManager.CreateInventory(NewInvClass, bDoNotActivate);
    }
    // End:0x79
    if(Inv == none)
    {
    }
    //return;    
}

simulated function AddWinch()
{
    TryToAddInventory(WinchClass, false);
    //return;    
}

simulated function AddBlowtorch()
{
    TryToAddInventory(WelderClass, false);
    //return;    
}

simulated function AddTaser()
{
    TryToAddInventory(TaserClass, false);
    //return;    
}

function LocalSwitchToInventoryPart()
{
    local /*0x97E50000-0x00000000*/ private byte PartID[8388609];
    local /*0x97E50000-0x00000000*/ private class NewPartClass[8388609];

    // End:0x54
    if(IsLocallyControlled() && int(WorldInfo.NetMode) == int(NM_Client))
    {
        ServerSwitchToInventoryPart(PartID, NewPartClass);
    }
    SwitchToInventoryPart(PartID, NewPartClass);
    //return;    
}

reliable server function ServerSwitchToInventoryPart()
{
    local /*0x97E50000-0x00000000*/ private byte PartID[8388609];
    local /*0x97E50000-0x00000000*/ private class NewPartClass[8388609];

    SwitchToInventoryPart(PartID, NewPartClass);
    //return;    
}

event CreateInventory()
{
    local /*0x97E50000-0x00000000*/ private class NewInvClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x5E
    if(ClassIsChildOf(NewInvClass, Class'LPVSInventoryParts'))
    {
        // End:0x5B
        if(PartsInvManager != none)
        {
            return PartsInvManager.CreateInventory(NewInvClass, bDoNotActivate);
        }        
    }
    else
    {
        return super(Pawn).CreateInventory(NewInvClass, bDoNotActivate);
    }
    //return ReturnValue;    
}

simulated function FindInventoryType()
{
    local /*0x97E50000-0x00000000*/ private class DesiredClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAllowSubclass[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x61
    if(ClassIsChildOf(DesiredClass, Class'LPVSInventoryParts'))
    {
        return ((PartsInvManager != none) ? PartsInvManager.FindInventoryType(DesiredClass, bAllowSubclass) : none);        
    }
    else
    {
        return super(Pawn).FindInventoryType(DesiredClass, bAllowSubclass);
    }
    //return ReturnValue;    
}

simulated function SwitchToInventoryPart()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private class NewPartClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL NewPart;

    NewPart = LPVSInventoryParts(FindInventoryType(NewPartClass, true));
    SwitchToNewInventoryPart(PartSlot, NewPart, NewPartClass);
    //return;    
}

function SetInventoryPartInUse()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInUse[8388609];

    // End:0xAC
    if(IsLocallyControlled() || (int(WorldInfo.NetMode) != int(NM_Client)) && Controller == none)
    {
        // End:0x8F
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            ServerSetInventoryPartInUse(PartSlot, bInUse);
        }
        InternalSetInventoryPartInUse(PartSlot, bInUse);
    }
    //return;    
}

reliable server function ServerSetInventoryPartInUse()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInUse[8388609];

    InternalSetInventoryPartInUse(PartSlot, bInUse);
    // End:0x5A
    if(int(PartSlot) == int(1))
    {
        RightArmPart.NewControllerState(bInUse);
    }
    //return;    
}

private final function InternalSetInventoryPartInUse()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInUse[8388609];

    switch(PartSlot)
    {
        // End:0x30
        case 1:
            bControllerUsingRightArm = bInUse;
            // End:0x50
            break;
        // End:0x4D
        case 2:
            bControllerUsingLeftArm = bInUse;
            // End:0x50
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

simulated function IsInventoryPartInUse()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(PartSlot)
    {
        // End:0x23
        case 1:
            return bControllerUsingRightArm;
        // End:0x33
        case 2:
            return bControllerUsingLeftArm;
        // End:0xFFFF
        default:
            return false;
            break;
    }
    //return ReturnValue;    
}

reliable server function ServerDoTraceDamageOnShieldFracture()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShieldFractureDamageInfo[8388609], BasePawn;

    BasePawn = LPPawn(ShieldFractureDamageInfo.Base);
    // End:0x66
    if(BasePawn != none)
    {
        BasePawn.DoTraceDamageOnShieldFracture(ShieldFractureDamageInfo);
    }
    //return;    
}

simulated function PlayAnimationSequenceOnBodyPart()
{
    local /*0x97E50000-0x00000000*/ private byte BodyPart[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Params[25296897], ReturnValue;

    switch(BodyPart)
    {
        // End:0x2C
        case 0:
            return PlayFullBodyAnimationFromParams(Params);
        // End:0x45
        case 1:
            return PlayUpperBodyAnimationFromParams(Params);
        // End:0x5E
        case 2:
            return PlayRightArmAnimationFromParams(Params);
        // End:0x63
        case 3:
        // End:0xFFFF
        default:
            ScriptTrace();
            return none;
            break;
    }
    //return ReturnValue;    
}

simulated function StopAnimationSequenceOnPart()
{
    local /*0x97E50000-0x00000000*/ private byte BodyPart[8388609];
    local /*0x97E50000-0x00000000*/ private float BlendOutTime[9437185];

    0.2500000
    switch(BodyPart)
    {
        // End:0x37
        case 0:
            StopFullBodyAnim(BlendOutTime);
            // End:0x7F
            break;
        // End:0x52
        case 1:
            StopUpperBodyAnim(BlendOutTime);
            // End:0x7F
            break;
        // End:0x6D
        case 2:
            StopRightArmAnimation(BlendOutTime);
            // End:0x7F
            break;
        // End:0x72
        case 3:
        // End:0xFFFF
        default:
            ScriptTrace();
            break;
    }
    //return;    
}

simulated function PlayRightArmAnimationFromParams()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Params[25296897], ReturnValue;

    RightArmBlendPerBone.SetBlendTarget(1.0000000, 0.0000000);
    return PlayAnimationFromParams(RightArmAnimInfo.AnimNodeSlot, Params);
    //return ReturnValue;    
}

simulated function StopRightArmAnimation()
{
    local /*0x97E50000-0x00000000*/ private float BlendOutTime[9437185];

    0.2500000
    RightArmBlendPerBone.SetBlendTarget(0.0000000, BlendOutTime);
    // End:0x93
    if(RightArmAnimInfo.AnimNodeSlot != none)
    {
        RightArmAnimInfo.AnimNodeSlot.StopCustomAnim(BlendOutTime);
    }
    //return;    
}

simulated function EnableUpperBodyCameraBypass()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private float InBlendTime[9437185];

    0.2500000
    // End:0x46
    if(bOn)
    {
        UpperBodyCameraBypassBlendPerBone.SetBlendTarget(1.0000000, InBlendTime);        
    }
    else
    {
        UpperBodyCameraBypassBlendPerBone.SetBlendTarget(0.0000000, InBlendTime);
    }
    //return;    
}

simulated function StartRightArmPartAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[9437185], SlotType;
    local /*0x97E50000-0x00000000*/ private bool bAllowDamage[9437185];
    local /*0x97E50000-0x00000000*/ private byte IKType[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL IKTargetPawn[9437185];
    local /*0x97E50000-0x00000000*/ private name IKTargetDepthSocket[9437185];
    local /*0x97E50000-0x00000000*/ private bool bUseAnimation[9437185], bUseDamageMinigame, bApplyDamageAtCrosshair, bForceRestart;
    local /*0x97E50000-0x00000000*/ private name IKTargetAssistSocket[9437185];
    local /*0x97E50000-0x00000000*/ private byte ForceProceduralSpinType[9437185];

    0
    1
    true
    0
    none
    'None'
    true
    false
    true
    false
    'None'
    0
    // End:0x76
    if(bForceRestart)
    {
        StopRightArmPartAction(ActionMode, true, 0.0000000);
    }
    RightArmPartInfo.SlotType = SlotType;
    RightArmPartInfo.bTipDamageEnabled = bAllowDamage;
    RightArmPartInfo.IKType = IKType;
    RightArmPartInfo.IKTargetPawn = IKTargetPawn;
    RightArmPartInfo.IKTargetDepthSocket = IKTargetDepthSocket;
    RightArmPartInfo.bUseAnimation = bUseAnimation;
    RightArmPartInfo.bUseDamageMinigame = bUseDamageMinigame && RightArmPart.bHasDamageMinigame;
    RightArmPartInfo.bApplyDamageAtCrosshair = bApplyDamageAtCrosshair;
    RightArmPartInfo.IKTargetAssistSocket = ((IKTargetAssistSocket == 'None') ? IKTargetDepthSocket : IKTargetAssistSocket);
    RightArmPartInfo.ForceProceduralSpinType = ForceProceduralSpinType;
    RightArmPart.StartRightArmAction(ActionMode, bForceRestart);
    //return;    
}

function SetVSReticle()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReticleName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    myLPHUD = GetLPHUD();
    // End:0x4B
    if(myLPHUD != none)
    {
        myLPHUD.SetVSReticle(ReticleName);
    }
    //return;    
}

function PlayVSGrabSuccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    myLPHUD = GetLPHUD();
    // End:0x42
    if(myLPHUD != none)
    {
        myLPHUD.PlayVSGrabSuccess();
    }
    //return;    
}

function ShowVSGrabIndicator()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    myLPHUD = GetLPHUD();
    // End:0x4C
    if(myLPHUD != none)
    {
        myLPHUD.ShowVSGrabIndicator(bShow);
    }
    //return;    
}

event GetWinchWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    //return ReturnValue;    
}

function GetWinchPos()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Winch;

    Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x55
    if(Winch != none)
    {
        return Winch.WinchPos;
    }
    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

function NotifyWinchProjectileFired()
{
    local /*0x97E50000-0x00000000*/ private @NULL WinchProj[8388609], myLPHUD, Winch;

    myLPHUD = GetLPHUD();
    // End:0x4C
    if(myLPHUD != none)
    {
        myLPHUD.ShowWinchGear(true, WinchProj);
    }
    Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0xC0
    if(Winch != none)
    {
        myLPHUD.SetMaxWinchDistance(Winch.GetWinchRange());
    }
    NotifyAIOfWinchProjectileFire(WinchProj);
    //return;    
}

function NotifyWinchProjectileRetracting()
{
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    myLPHUD = GetLPHUD();
    // End:0x42
    if(myLPHUD != none)
    {
        myLPHUD.NotifyWinchProjectileRetracting();
    }
    NotifyAIOfWinchProjectileRetracting();
    //return;    
}

function NotifyWinchProjectileRetracted()
{
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    myLPHUD = GetLPHUD();
    // End:0x42
    if(myLPHUD != none)
    {
        myLPHUD.NotifyWinchProjectileRetracted();
    }
    //return;    
}

function NotifyArmWeld()
{
    SetVSReticle("weld");
    //return;    
}

function NotifyArmGrab()
{
    SetVSReticle("grab");
    //return;    
}

function NotifyPistonGrabCore()
{
    SetVSReticleGrabState(true);
    //return;    
}

function NotifyUIStartForkArmGrabMiss()
{
    NotifyArmQuickGrab();
    //return;    
}

function NotifyUIStartForkArmGrabMissComplete()
{
    SetVSReticleGrabState(false);
    //return;    
}

function NotifyArmQuickGrab()
{
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    myLPHUD = GetLPHUD();
    // End:0x42
    if(myLPHUD != none)
    {
        myLPHUD.SetVSReticleQuickGrab();
    }
    //return;    
}

function NotifyArmDrill()
{
    SetVSReticle("drill");
    //return;    
}

function SetVSReticleDrillSpeed()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string SpeedName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    myLPHUD = GetLPHUD();
    // End:0x4B
    if(myLPHUD != none)
    {
        myLPHUD.SetVSReticleDrillSpeed(SpeedName);
    }
    //return;    
}

function SetVSReticleWelderState()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    myLPHUD = GetLPHUD();
    // End:0x4C
    if(myLPHUD != none)
    {
        myLPHUD.SetVSReticleWelderState(bOn);
    }
    //return;    
}

function SetVSReticleGrabState()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myLPHUD;

    myLPHUD = GetLPHUD();
    // End:0x4C
    if(myLPHUD != none)
    {
        myLPHUD.SetVSReticleGrabState(bOn);
    }
    //return;    
}

simulated function StartEMP()
{
    super.StartEMP();
    // End:0x37
    if(IsLocallyControlled())
    {
        GetLPHUD().SetVSEmp();
    }
    //return;    
}

simulated function EndEMPEffect()
{
    super.EndEMPEffect();
    // End:0x37
    if(IsLocallyControlled())
    {
        GetLPHUD().ClearVSEmp();
    }
    //return;    
}

simulated function HandleLaRocheEMP()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedByPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name TargetControllerState[8388609];

    super.HandleLaRocheEMP(DamageType, InstigatedByPawn, TargetControllerState);
    // End:0x52
    if(IsLocallyControlled())
    {
        GetLPHUD().SetVSEmp();
    }
    //return;    
}

simulated function SetRightArmPartIKType()
{
    local /*0x97E50000-0x00000000*/ private byte InType[8388609];

    RightArmPartInfo.IKType = InType;
    //return;    
}

simulated function SetRightArmPartIKTargetDepthSocket()
{
    local /*0x97E50000-0x00000000*/ private name IKTargetDepthSocket[8388609];

    RightArmPartInfo.IKTargetDepthSocket = IKTargetDepthSocket;
    //return;    
}

simulated event StopRightArmPartAction()
{
    local /*0x97E50000-0x00000000*/ private byte ActionMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool bAbrupt[9437185];
    local /*0x97E50000-0x00000000*/ private float BlendOutTime[9437185];

    false
    0.2500000
    // End:0x4A
    if((RightArmPart == none) || int(RightArmPart.PartState) == int(0))
    {
        return;
    }
    // End:0xDF
    if(bAbrupt)
    {
        RightArmPart.StopAction(ActionMode);
        RightArmPart.StartPartState(0);
        StopAnimationSequenceOnPart(RightArmPartInfo.SlotType, BlendOutTime);
        StopRightArmAnimation();        
    }
    else
    {
        // End:0x122
        if(RightArmPart.NeedsGracefulStop())
        {
            RightArmPart.StartPartState(3);
        }
    }
    RightArmPart.NotifyPartStopped();
    //return;    
}

simulated function StopRightArmPartAltAction()
{
    RightArmPartInfo.bTipDamageEnabled = false;
    RightArmPartInfo.IKType = 0;
    RightArmPart.StopAction(1);
    //return;    
}

simulated function GetVSInteractionPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], VSIP;

    // End:0x4C
    foreach TouchingActors(Class'LPVSInteractionPoint', VSIP)
    {
        // End:0x40
        if(!VSIP.bEnabled)
        {
            continue;            
        }        
        return VSIP;        
    }    
    return none;
    //return ReturnValue;    
}

simulated function IsWeaponSwitchLocked()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x18
    if(IsInventoryPartInUse(PartSlot))
    {
        return true;
    }
    LPPC = LPPlayerController(Controller);
    // End:0x12B
    if(LPPC != none)
    {
        // End:0xB7
        if(int(PartSlot) == int(2))
        {
            // End:0x80
            if(LPPC.IsVSFiring(0))
            {
                return true;                
            }
            else
            {
                // End:0xB7
                if((LeftArmPart != none) && !LeftArmPart.IsEquipped())
                {
                    return true;
                }
            }
        }
        // End:0x12B
        if(int(PartSlot) == int(1))
        {
            // End:0xF4
            if(LPPC.IsVSFiring(1))
            {
                return true;                
            }
            else
            {
                // End:0x12B
                if((RightArmPart != none) && !RightArmPart.IsEquipped())
                {
                    return true;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

event StartForkArmGrab()
{
    local /*0x97E50000-0x00000000*/ private bool bSimulate[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL GenericSMGrab, RealSMGrab;
    local /*0x97E50000-0x00000000*/ private class GenericGrabClass, RealGrabClass;
    local /*0x97E50000-0x00000000*/ private @NULL VSIP;

    // End:0x21
    if(!bSimulate && NotifyAIOfGrab())
    {
        return false;
    }
    VSIP = GetVSInteractionPoint();
    // End:0x98
    if(!bSimulate)
    {
        // End:0x98
        if((VSIP != none) && VSIP.CanInteractWith(self))
        {
            VSIP.BeginInteraction(self);
        }
    }
    GenericGrabClass = Class'LPSM_ForkArmGrab_Grab';
    GenericSMGrab = LPSM_ForkArmGrab_Base(GetSpecialMoveInstance(GenericGrabClass));
    // End:0x2A8
    if(CanDoSpecialMoveInstance(GenericSMGrab, true))
    {
        // End:0xF7
        if(bSimulate)
        {
            return true;
        }
        RealGrabClass = GetGrabClassForPawn(GenericSMGrab.ForkArmGrabInfo.GrabPoint.HitPawn);
        // End:0x18F
        if(RealGrabClass != GenericGrabClass)
        {
            RealSMGrab = LPSM_ForkArmGrab_Base(GetSpecialMoveInstance(RealGrabClass));            
        }
        else
        {
            RealSMGrab = GenericSMGrab;
        }
        // End:0x274
        if((RealSMGrab == GenericSMGrab) || CanDoSpecialMoveInstance(RealSMGrab, true))
        {
            // End:0x274
            if(IsLocallyControlled() && int(WorldInfo.NetMode) == int(NM_Client))
            {
                DoSpecialMove(RealGrabClass, true, false, None, RealSMGrab.ForkArmGrabInfo.GrabPoint.HitPawn);
            }
        }
        ServerStartForkArmGrab(RealGrabClass, RealSMGrab.ForkArmGrabInfo);        
    }
    else
    {
        // End:0x2FF
        if(CanDoSpecialMoveInstance(GetSpecialMoveInstance(Class'LPSM_ForkArmGrab_GrabObject'), true))
        {
            // End:0x2FC
            if(IsLocallyControlled())
            {
                // End:0x2E5
                if(bSimulate)
                {
                    return true;
                }
                DoSpecialMove(Class'LPSM_ForkArmGrab_GrabObject', true, false);
            }            
        }
        else
        {
            // End:0x369
            if(CanDoSpecialMove(Class'LPSM_ForkArmGrabMiss'))
            {
                // End:0x325
                if(bSimulate)
                {
                    return false;
                }
                LocalDoSpecialMove(Class'LPSM_ForkArmGrabMiss', true);
                // End:0x367
                if(SubscribedOnArmAction != none)
                {
                    OnArmAction('LeftActionShort');
                }
                return false;
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function GetGrabClassForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x22
    if(LPAIPawnSpitter(inPawn) != none)
    {
        return Class'LPSM_ForkArmGrab_GrabSpitter';
    }
    return Class'LPSM_ForkArmGrab_Grab';
    //return ReturnValue;    
}

function StartForkArmGrabFromCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL Window[25296897];
    local /*0x97E50000-0x00000000*/ private class GrabClass;
    local /*0x97E50000-0x00000000*/ private @NULL SMGrab;

    GrabClass = Class'LPSM_ForkArmGrab_CombatWindow';
    SMGrab = LPSM_ForkArmGrab_Base(GetSpecialMoveInstance(GrabClass));
    ReplicatedCombatWindowInfo.Count++;
    ReplicatedCombatWindowInfo.Window = Window;
    // End:0x170
    if(CanDoSpecialMoveInstance(SMGrab, true))
    {
        // End:0x136
        if(IsLocallyControlled() && int(WorldInfo.NetMode) == int(NM_Client))
        {
            DoSpecialMove(GrabClass, true, false, None, SMGrab.ForkArmGrabInfo.GrabPoint.HitPawn);
        }
        ServerStartForkArmGrabFromCombatWindow(GrabClass, SMGrab.ForkArmGrabInfo, Window);
    }
    //return;    
}

reliable server function ServerStartForkArmGrab()
{
    local /*0x97E50000-0x00000000*/ private class GrabClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InForkArmGrabInfo[8388609], SMGrab;

    SMGrab = LPSM_ForkArmGrab_Base(GetSpecialMoveInstance(GrabClass));
    SMGrab.ForkArmGrabInfo = InForkArmGrabInfo;
    // End:0x82
    if(!IsLocallyControlled())
    {
        // End:0x82
        if(!CanDoSpecialMoveInstance(SMGrab, true))
        {
            ClientCancelForkArmGrab();
            return;
        }
    }
    DoSpecialMove(GrabClass, true, false, None, SMGrab.ForkArmGrabInfo.GrabPoint.HitPawn);
    ReplicatedForkArmGrabInfo.GrabPointInfo = InForkArmGrabInfo.GrabPoint;
    ReplicatedForkArmGrabInfo.GrabClass = GrabClass;
    //return;    
}

reliable server function ServerStartForkArmGrabFromCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private class GrabClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InForkArmGrabInfo[8388609], Window;

    ReplicatedCombatWindowInfo.Count++;
    ReplicatedCombatWindowInfo.Window = Window;
    ServerStartForkArmGrab(GrabClass, InForkArmGrabInfo);
    //return;    
}

unreliable server function ServerForkArmGrabUpdateTween()
{
    local /*0x97E50000-0x00000000*/ private float TweenValue[8388609];

    ReplicatedForkArmGrabCurTweenValue = TweenValue;
    //return;    
}

reliable client simulated function ClientCancelForkArmGrab()
{
    EndSpecialMove(Class'LPSM_ForkArmGrab_Base');
    //return;    
}

function NotifyInteractionPoint()
{
    local /*0x97E50000-0x00000000*/ private name InteractionType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL VSIP;

    VSIP = GetVSInteractionPoint();
    // End:0x4B
    if(VSIP != none)
    {
        VSIP.ProcessInteractionMessage(InteractionType);
    }
    //return;    
}

function @NULL PutGrabbedPawnInClaw()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrabbedPawn[8388609], grabbedMesh;

    GrabbedPawn = InGrabbedPawn;
    // End:0x229
    if(GrabbedPawn != none)
    {
        GrabbedPawn.SetPhysics(7);
        GrabbedPawn.SetCollision(true, true, true);
        GrabbedPawn.CollisionComponent.SetTraceBlocking(false, false);
        GrabbedPawn.Mesh.SetTraceBlocking(true, false);
        grabbedMesh = GrabbedPawn.Mesh;
        grabbedMesh.SetShadowParent(Mesh);
        grabbedMesh.SetLightEnvironment(LightEnvironment);
        Mesh.AttachComponentToSocket(grabbedMesh, InGrabbedPawn.TuneDataAIPawn.SocketNameToAttachToWhenGrabbedByVs);
        GrabbedPawn.SetHardAttach(true);
        GrabbedPawn.SetBase(self,, Mesh, InGrabbedPawn.TuneDataAIPawn.SocketNameToAttachToWhenGrabbedByVs);
        StopPawnChoreography();
        SetTimer(0.1000000, true, 'UpdateHoldingPawn');
    }
    //return;    
}

function StartHoldingPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrabbedPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bShouldPlayWinchGrabbedRetract[8388609];

    // End:0x2A
    if(GrabbedPawn != InGrabbedPawn)
    {
        PutGrabbedPawnInClaw(InGrabbedPawn);
    }
    GrabbedPawn.bAutoExplodeFrozen = true;
    // End:0x72
    if(bShouldPlayWinchGrabbedRetract)
    {
        DoSpecialMove(Class'LPSM_PlayerVSWinchArmGrabbedPawn');        
    }
    else
    {
        DoSpecialMove(Class'LPSM_PlayerVSClawArmGrabbedPawn');
    }
    //return;    
}

function StartThrowingPawn()
{
    SetVSReticleGrabState(false);
    ClearTimer('UpdateHoldingPawn');
    //return;    
}

function @NULL EndHoldingPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL curSM, grabbedMesh;

    SetVSReticleGrabState(false);
    // End:0x16E
    if(GrabbedPawn != none)
    {
        grabbedMesh = GrabbedPawn.Mesh;
        Mesh.DetachComponent(grabbedMesh);
        GrabbedPawn.AttachComponent(grabbedMesh);
        GrabbedPawn.SetHardAttach(false);
        GrabbedPawn.SetBase(none);
        GrabbedPawn.SetPhysics(2);
        Class'SPEngine.SPUtil'.static.SetRBCollision(grabbedMesh, Mesh, true);
        curSM = GetCurrentSpecialMoveInstance();
        // End:0x16E
        if(ClassIsChildOf(curSM.Class, Class'LPSM_PlayerVSWinchArmGrabbedPawn'))
        {
            EndCurrentSpecialMove(curSM);
        }
    }
    ClearTimer('UpdateHoldingPawn');
    //return;    
}

function ClearHoldingPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winch;

    Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0xC0
    if((Winch != none) && Winch.GrabbedPawn != none)
    {
        Winch.GrabbedPawn = none;
        Winch.bGrabbedFromClaw = false;
        Winch.GotoState('Idle');
    }
    EndHoldingPawn();
    GrabbedPawn = none;
    //return;    
}

function UpdateHoldingPawn()
{
    // End:0x11A
    if((GrabbedPawn != none) && !GrabbedPawn.IsPendingKill())
    {
        // End:0xC9
        if(IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSWinchArmGrabbedPawn'))
        {
            // End:0xC9
            if((GrabbedPawn.Health <= 0) && !LPSM_PlayerVSWinchArmGrabbedPawn(GetCurrentSpecialMoveInstance()).bIsReleasingPawn)
            {
                BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_PawnDiedInClaw, self);
            }
        }
        // End:0x117
        if(!GrabbedPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_IsPawnGrabbed, self))
        {
            ClearHoldingPawn();
        }        
    }
    else
    {
        ClearHoldingPawn();
    }
    //return;    
}

simulated function ConfirmAimHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[25165825], HitInfo;

    // End:0x63
    if((GrabbedPawn != none) && HitInfo.HitComponent == GrabbedPawn.Mesh)
    {
        HitActor = GrabbedPawn;
    }
    //return;    
}

function GetBestVSMeleeInterruptCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609], OutWindow;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array ADWindows;
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x23
    if(!FindAllValidActiveCombatWindows(Class'LPCombatWindow_VSMeleeInterrupt', ADWindows))
    {
        return false;
    }
    Idx = ADWindows.Length - 1;
    J0x3A:

    // End:0xA0 [Loop If]
    if(Idx >= 0)
    {
        // End:0x92
        if(ADWindows[Idx].Publisher != HitPawn)
        {
            ADWindows.Remove(Idx, 1);            
        }
        Idx--;
        // [Loop Continue]
        goto J0x3A;
    }
    // End:0xC3
    if(!DetermineBestValidCombatWindow(ADWindows, OutWindow))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

simulated function OnSavePersistentVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], PersistentGameDataStore;

    PersistentGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x86
    if(PersistentGameDataStore != none)
    {
        PersistentGameDataStore.SavePersistentVS(self);        
    }
    //return;    
}

simulated function OnToggleVSMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], LPPC;

    LPPC = GetLocalPlayerController();
    // End:0x4D
    if(LPPC != none)
    {
        LPPC.KismetToggleVSMusicPlayer(inAction, true, self);
    }
    //return;    
}

simulated function OnVSMusicPlayerControlContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], LPPC;

    LPPC = GetLocalPlayerController();
    // End:0x4D
    if(LPPC != none)
    {
        LPPC.ClientVSMusicPlayerControl(inAction, true, self);
    }
    //return;    
}

function OnSetExtractionConsoles()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL Con;

    ExtractionConsoles.Remove(0, ExtractionConsoles.Length);    
    // End:0xEB
    if(Action != none)
    {
        I = 0;
        J0x30:

        // End:0xEB [Loop If]
        if(I < Action.ActorList.Length)
        {
            Con = LPVSPlatformConsole(Action.ActorList[I]);
            // End:0xDD
            if(Con != none)
            {
                ExtractionConsoles.AddItem(Con);                
                Con.SetVSPawn(self);
            }
            I++;
            // [Loop Continue]
            goto J0x30;
        }
    }
    //return;    
}

simulated function OnGiveInventory()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private class InvClass;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NewVSInv, NewPlayerInv;

    // End:0x224
    if(inAction.InventoryList.Length > 0)
    {
        Idx = 0;
        J0x30:

        // End:0x221 [Loop If]
        if(Idx < inAction.InventoryList.Length)
        {
            InvClass = inAction.InventoryList[Idx];
            // End:0x1C6
            if(InvClass != none)
            {
                // End:0xEE
                if(class<LPWeapon>(InvClass) != none)
                {
                    NewPlayerInv.AddItem(inAction.InventoryList[Idx]);                                        
                }
                else
                {
                    // End:0x13E
                    if(class<LPThermalEnergyFannyPack>(InvClass) != none)
                    {
                        NewPlayerInv.AddItem(inAction.InventoryList[Idx]);                                                
                    }
                    else
                    {
                        // End:0x18E
                        if(class<LPGrapplingHook>(InvClass) != none)
                        {
                            NewPlayerInv.AddItem(inAction.InventoryList[Idx]);                                                        
                        }
                        else
                        {
                            NewVSInv.AddItem(inAction.InventoryList[Idx]);                            
                        }
                    }
                }                
            }
            else
            {
                inAction.ScriptLog("WARNING: Attempting to give NULL inventory!");
            }
            Idx++;
            // [Loop Continue]
            goto J0x30;
        }        
    }
    else
    {
        inAction.ScriptLog("WARNING: Give Inventory without any inventory specified!");
    }
    inAction.InventoryList = NewVSInv;
    super(SPInventoryPawn).OnGiveInventory(inAction);
    // End:0x37F
    if(((Controller != none) && LPPlayerController(Controller) != none) && LPPlayerController(Controller).HumanPlayerPawn != none)
    {
        inAction.InventoryList = NewPlayerInv;
        LPPlayerController(Controller).HumanPlayerPawn.OnGiveInventory(inAction);
    }
    //return;    
}

simulated function OnSetPitch()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    SetPitchControllerTarget(int(inAction.Pitch), inAction.BlendTime);
    SetPitchControllerLock(true);
    //return;    
}

simulated function OnVSForceWinchAttach()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x6D
    if(inAction.TargetWinchPoint != none)
    {
        bRequestWinchFire = true;
        RequestedWinchLocation = inAction.TargetWinchPoint.Location;
    }
    //return;    
}

simulated event NotifyStopPawnChoreography()
{
    super(SPPawn).NotifyStopPawnChoreography();
    // End:0x69
    if(SpecialMoveState.CurSMInfo.InteractionActor.IsA('LPAIPawnAct1Boss'))
    {
        EndCurrentSpecialMove();
        StopRightArmAnimation();
    }
    //return;    
}

simulated function InitMunitionsLocker()
{
    // End:0x6A
    if(LockerHologramMat == none)
    {
        LockerHologramMat = LockerHologram.CreateAndSetMaterialInstanceConstant(0);
        LockerHologramMat.GetScalarParameterValue('Opacity', LockerHologramBaseOpacity);
    }
    LockerHologramDesiredOpacity = 0.0000000;
    LockerHologramMat.SetScalarParameterValue('Opacity', 0.0000000);
    //return;    
}

function CheckMunitionsLocker()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609], RightLocker, LeftLocker;
    local /*0x97E50000-0x00000000*/ private bool bCanAccess;
    local /*0x97E50000-0x00000000*/ private float HologramOpacity, FadeUpdateRate, PlayerDistLeft, PlayerDistRight;
    local /*0x97E50000-0x00000000*/ private bool InRange;

    // End:0x24
    if(Class'LPGameViewportClient'.static.IsCaptivateDemo())
    {
        return;
    }
    Mesh.GetSocketWorldLocationAndRotation('RightLocker', RightLocker);
    Mesh.GetSocketWorldLocationAndRotation('LeftLocker', LeftLocker);
    LockerHologramMat.GetScalarParameterValue('Opacity', HologramOpacity);
    LockerHologramDesiredOpacity = 0.0000000;
    InRange = false;
    bCanAccess = CanAccessMunitionsLocker(LPPC);
    PlayerDistLeft = VSize(LPPC.Pawn.Location - LeftLocker);
    PlayerDistRight = VSize(LPPC.Pawn.Location - RightLocker);
    // End:0x2E8
    if((bCanAccess && PlayerDistLeft < PlayerDistRight) && PlayerDistLeft < LPPlayerPawn(LPPC.Pawn).TuneDataPlayerPawn.MunitionsLockerHologramDistance)
    {
        LockerHologramDesiredOpacity = LockerHologramBaseOpacity;
        LockerHologram.SetTranslation(vect(-30.0000000, -350.0000000, -300.0000000));
        LockerHologram.SetRotation(rot(0, -16386, 0));
        // End:0x2E5
        if(PlayerDistLeft < LPPlayerPawn(LPPC.Pawn).TuneDataPlayerPawn.MunitionsLockerEnableDistance)
        {
            InRange = true;
        }        
    }
    else
    {
        // End:0x445
        if((bCanAccess && PlayerDistRight < PlayerDistLeft) && PlayerDistRight < LPPlayerPawn(LPPC.Pawn).TuneDataPlayerPawn.MunitionsLockerHologramDistance)
        {
            LockerHologramDesiredOpacity = LockerHologramBaseOpacity;
            LockerHologram.SetTranslation(vect(-30.0000000, 350.0000000, -300.0000000));
            LockerHologram.SetRotation(rot(0, 16386, 0));
            // End:0x445
            if(PlayerDistRight < LPPlayerPawn(LPPC.Pawn).TuneDataPlayerPawn.MunitionsLockerEnableDistance)
            {
                InRange = true;
            }
        }
    }
    // End:0x521
    if(InRange)
    {
        // End:0x51E
        if((LPPC.MunitionsLockerActor == none) && LPPC.bVSHasFullMunitionsLocker || LPPlayerPawn(LPPC.Pawn).CanReplenishAmmoFromVS())
        {
            LPPC.MunitionsLockerActor = self;
            LPPC.ClientNotifyProximityToMunitionsLocker(self, true, true);
        }        
    }
    else
    {
        // End:0x587
        if(LPPC.MunitionsLockerActor == self)
        {
            LPPC.MunitionsLockerActor = none;
            LPPC.ClientNotifyProximityToMunitionsLocker(self, false);
        }
    }
    // End:0x6A9
    if(!IsTimerActive('FadeLockerHologram'))
    {
        // End:0x6A9
        if(HologramOpacity != LockerHologramDesiredOpacity)
        {
            FadeUpdateRate = 0.0100000;
            LockerHologramFadeInSpeed = LPPlayerPawn(LPPC.Pawn).TuneDataPlayerPawn.MunitionsLockerHologramFadeInSpeed * FadeUpdateRate;
            LockerHologramFadeOutSpeed = LPPlayerPawn(LPPC.Pawn).TuneDataPlayerPawn.MunitionsLockerHologramFadeOutSpeed * FadeUpdateRate;
            SetTimer(FadeUpdateRate, true, 'FadeLockerHologram');
        }
    }
    //return;    
}

simulated function FadeLockerHologram()
{
    local /*0x97E50000-0x00000000*/ private float HologramOpacity;

    LockerHologramMat.GetScalarParameterValue('Opacity', HologramOpacity);
    // End:0x15A
    if(HologramOpacity != LockerHologramDesiredOpacity)
    {
        // End:0xBC
        if(HologramOpacity < LockerHologramDesiredOpacity)
        {
            // End:0x90
            if(HologramOpacity == float(0))
            {
                LockerHologram.SetHidden(false);
            }
            HologramOpacity = FMin(HologramOpacity + LockerHologramFadeInSpeed, LockerHologramDesiredOpacity);            
        }
        else
        {
            // End:0x129
            if(HologramOpacity > LockerHologramDesiredOpacity)
            {
                HologramOpacity = FMax(HologramOpacity - LockerHologramFadeOutSpeed, 0.0000000);
                // End:0x129
                if(HologramOpacity == float(0))
                {
                    LockerHologram.SetHidden(true);
                }
            }
        }
        LockerHologramMat.SetScalarParameterValue('Opacity', HologramOpacity);
    }
    // End:0x185
    if(HologramOpacity == LockerHologramDesiredOpacity)
    {
        ClearTimer('FadeLockerHologram');
    }
    //return;    
}

simulated function GetWinchRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL WinchWeapon;

    WinchWeapon = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x56
    if(WinchWeapon != none)
    {
        return WinchWeapon.GetWinchRange();
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function GetWinchSearchRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL WinchWeapon;

    WinchWeapon = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x56
    if(WinchWeapon != none)
    {
        return WinchWeapon.GetWinchSearchRange();
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function SearchForVSHUDPoints()
{
    local /*0x97E50000-0x00000000*/ private @NULL DV, WP, IP, myLPHUD, LPPC, CameraLoc,
	    CameraRot;

    local /*0x97E50000-0x00000000*/ private float DistSq, SearchRangeSQ, WinchSearchRange, WinchUseRange;
    local /*0x97E50000-0x00000000*/ private bool bIsValidWinchPoint;
    local /*0x97E50000-0x00000000*/ private @NULL Winch;

    myLPHUD = LPHUD(PlayerController(Controller).myHUD);
    LPPC = LPPlayerController(Controller);
    LPPC.GetPlayerViewPoint(CameraLoc, CameraRot);
    myLPHUD.CleanupOrphans();
    WinchSearchRange = GetWinchSearchRange();
    // End:0x303
    if(WinchSearchRange > float(0))
    {
        WinchUseRange = GetWinchRange();
        Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
        // End:0x302
        foreach DynamicActors(Class'LPVSWinchPoint', WP)
        {
            // End:0x16F
            if(!WP.bEnabled)
            {
                myLPHUD.StopWinchPointReticle(WP);
                continue;                
            }
            // End:0x2D9
            if((VSizeSq(Location - WP.Location) < (WinchSearchRange * WinchSearchRange)) && LPPC.LineOfSightTo(WP, CameraLoc))
            {
                bIsValidWinchPoint = WP.bForceDisplayActive || (!bPreventAllZipline && !WP.bForceDisplayInactive) && Winch.IsValidWinchPointAlongAim(WP, WinchUseRange);
                myLPHUD.CreateWinchPointReticle(WP);
                myLPHUD.UpdateWinchPointForActor(WP, !bIsValidWinchPoint);
                // End:0x301
                continue;
            }
            myLPHUD.StopWinchPointReticle(WP);            
        }        
    }
    SearchRangeSQ = TuneDataVSPlayerPawn.DrillVolumeSearchRange * TuneDataVSPlayerPawn.DrillVolumeSearchRange;
    // End:0x4F8
    foreach DynamicActors(Class'LPVSDrillVolume', DV)
    {
        // End:0x3B5
        if(!DV.bEnabled)
        {
            myLPHUD.StopDrillVolumeReticle(DV);
            continue;            
        }
        DistSq = VSizeSq(Location - DV.CenterLocation);
        // End:0x4CE
        if((DistSq < SearchRangeSQ) && FastTrace(DV.CenterLocation, Location))
        {
            myLPHUD.CreateDrillVolumeReticle(DV);
            myLPHUD.SetDrillVolumeReticleLock(DV, DistSq < (TuneDataVSPlayerPawn.DrillVolumeLockOnRange * TuneDataVSPlayerPawn.DrillVolumeLockOnRange));
            // End:0x4F7
            continue;
        }
        myLPHUD.StopDrillVolumeReticle(DV);        
    }    
    SearchRangeSQ = TuneDataVSPlayerPawn.InteractionPointSearchRange * TuneDataVSPlayerPawn.InteractionPointSearchRange;
    // End:0x67A
    foreach DynamicActors(Class'LPVSInteractionPointHUD', IP)
    {
        // End:0x5AA
        if(!IP.bEnabled)
        {
            myLPHUD.StopInteractionReticle(IP);
            continue;            
        }
        DistSq = VSizeSq(Location - IP.Location);
        // End:0x651
        if((DistSq < SearchRangeSQ) && LPPC.LineOfSightTo(IP, CameraLoc))
        {
            myLPHUD.CreateInteractionReticle(IP);
            // End:0x679
            continue;
        }
        myLPHUD.StopInteractionReticle(IP);        
    }    
    //return;    
}

simulated function ShouldAllowHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x92 [Loop If]
    if(Idx < TuneDataVSPlayerPawn.PreventHitReactionFromDamageTypes.Length)
    {
        // End:0x84
        if(ClassIsChildOf(TakeDamageParams.DamageType, TuneDataVSPlayerPawn.PreventHitReactionFromDamageTypes[Idx]))
        {
            return false;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    return true;
    //return ReturnValue;    
}

simulated function PlayHitReactionAnimation()
{
    local /*0x97E50000-0x00000000*/ private class SPDT;
    local /*0x97E50000-0x00000000*/ private bool bShouldUseAdditive, bRestartIfPlaying;

    // End:0x217
    if(!BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_VSPlayHitReactionAnimation, self))
    {
        // End:0x6A
        if((Controller != none) && Controller.IsInState('Interacting'))
        {
            return;            
        }
        else
        {
            // End:0x217
            if(((TakeDamageParams.Damage > 0) && Health > 0) && ShouldAllowHitReaction())
            {
                bRestartIfPlaying = true;
                SPDT = class<SPDamageType>(TakeDamageParams.DamageType);
                // End:0x129
                if((SPDT != none) && SPDT.default.bAdditiveHitReaction)
                {
                    bShouldUseAdditive = true;                    
                }
                else
                {
                    // End:0x15C
                    if(ClassIsChildOf(SPDT, Class'LPDamageTypeSpitterAcid'))
                    {
                        bShouldUseAdditive = true;
                        bRestartIfPlaying = false;                        
                    }
                    else
                    {
                        // End:0x1DC
                        if((ClassIsChildOf(SPDT, Class'LPDamageTypeSpitterTalon') || BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_VSForceAdditiveHitReaction, self)) || LPAIPawnDefender(TakeDamageParams.InstigatedByPawn) != none)
                        {
                            bShouldUseAdditive = true;
                        }
                    }
                }
                // End:0x200
                if(bShouldUseAdditive)
                {
                    DoAdditiveHitReaction(bRestartIfPlaying);                    
                }
                else
                {
                    DoSpecialMove(Class'LPSM_DirectionalHitReactionVs', true, true);
                }
            }
        }
    }
    //return;    
}

simulated function PlayTakeDamageEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    super.PlayTakeDamageEffects();
    // End:0x1F5
    if(Health > 0)
    {
        LPPC = LPPlayerController(Controller);
        // End:0x1F5
        if((LPPC != none) && LPPC.IsLocalPlayerController())
        {
            // End:0x1F5
            if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeDefenderSuck'))
            {
                // End:0x128
                if(LPPC.myLPHUD.IsVSEnvironmentalMessageIDActive(DefenderOnHullMessageID))
                {
                    LPPC.myLPHUD.SetVSEnvironmentalMessageDuration(TuneDataVSPlayerPawn.DefenderDamageHullMessageDuration);                    
                }
                else
                {
                    DefenderOnHullMessageID = LPPC.myLPHUD.DisplayVSEnvironmentalMessage(2, "<Strings:LostPlanetGame.EnvironmentMessages.VS_DAMAGE>", "<Strings:LostPlanetGame.EnvironmentMessages.VS_HULL>", true, TuneDataVSPlayerPawn.DefenderDamageHullMessageDuration);
                }
            }
        }
    }
    //return;    
}

function NotifyDefenderCountChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x11
    if(Controller == none)
    {
        return;
    }
    LPPC = GetLocalPlayerController();
    // End:0x36
    if(LPPC == none)
    {
        return;
    }
    LPPC.SetVSReticleHelpButton(11, AIResDefenderVS.AreAnyAttackSlotOccupied());
    //return;    
}

function InitKernCable()
{
    KernCableComponent.SetHidden(true);
    KernCableComponent.SetShadowParent(Mesh);
    KernCableComponent.SetLightEnvironment(LightEnvironment);
    //return;    
}

function InitVSGlass()
{
    local /*0x97E50000-0x00000000*/ private @NULL MeshRotationOffset;
    local /*0x97E50000-0x00000000*/ private int Idx;

    MeshRotationOffset.Pitch = (180 * 65536) / 360;
    MeshRotationOffset.Roll = (-90 * 65536) / 360;
    MeshRotationOffset.Yaw = 0;
    Idx = 0;
    J0x86:

    // End:0x176 [Loop If]
    if(Idx < 5)
    {
        Mesh.AttachComponent(FrontGlassMeshComps[Idx], 'JO_Torso',, MeshRotationOffset);
        Mesh.AttachComponent(RightGlassMeshComps[Idx], 'JO_Torso',, MeshRotationOffset);
        Mesh.AttachComponent(LeftGlassMeshComps[Idx], 'JO_Torso',, MeshRotationOffset);
        Idx++;
        // [Loop Continue]
        goto J0x86;
    }
    //return;    
}

function HideVSGlass()
{
    local /*0x97E50000-0x00000000*/ private bool bSetHidden[9437185];
    local /*0x97E50000-0x00000000*/ private int Idx;

    true
    // End:0xE3
    if(bSetHidden)
    {
        bHideVSGlass = true;
        Idx = 0;
        J0x29:

        // End:0xE0 [Loop If]
        if(Idx < 5)
        {
            FrontGlassMeshComps[Idx].SetHidden(bSetHidden);
            RightGlassMeshComps[Idx].SetHidden(bSetHidden);
            LeftGlassMeshComps[Idx].SetHidden(bSetHidden);
            Idx++;
            // [Loop Continue]
            goto J0x29;
        }        
    }
    else
    {
        bHideVSGlass = false;
        SetGlassDamage(FrontGlassMeshComps, FrontGlassDamageFactor, 0.0000000);
        SetGlassDamage(RightGlassMeshComps, RightGlassDamageFactor, 0.0000000);
        SetGlassDamage(LeftGlassMeshComps, LeftGlassDamageFactor, 0.0000000);
    }
    //return;    
}

function array SetGlassDamage()
{
    local /*0x97E50000-0x00000400*/ private editfixedsize array InGlassArray[25165825];
    local /*0x97E50000-0x00000000*/ private float InDamageFactor[25165825], AdjustDmgPercent;

    InDamageFactor += AdjustDmgPercent;
    InDamageFactor = FClamp(InDamageFactor, 0.0000000, 1.0000000);
    // End:0x42
    if(bHideVSGlass)
    {
        return;
    }
    // End:0x105
    if(InDamageFactor > 0.9000000)
    {
        InGlassArray[0].SetHidden(false);
        InGlassArray[1].SetHidden(false);
        InGlassArray[2].SetHidden(false);
        InGlassArray[3].SetHidden(false);
        InGlassArray[4].SetHidden(false);        
    }
    else
    {
        // End:0x1C8
        if(InDamageFactor > 0.7000000)
        {
            InGlassArray[0].SetHidden(false);
            InGlassArray[1].SetHidden(false);
            InGlassArray[2].SetHidden(false);
            InGlassArray[3].SetHidden(false);
            InGlassArray[4].SetHidden(true);            
        }
        else
        {
            // End:0x28B
            if(InDamageFactor > 0.5000000)
            {
                InGlassArray[0].SetHidden(false);
                InGlassArray[1].SetHidden(false);
                InGlassArray[2].SetHidden(false);
                InGlassArray[3].SetHidden(true);
                InGlassArray[4].SetHidden(true);                
            }
            else
            {
                // End:0x34E
                if(InDamageFactor > 0.3000000)
                {
                    InGlassArray[0].SetHidden(false);
                    InGlassArray[1].SetHidden(false);
                    InGlassArray[2].SetHidden(true);
                    InGlassArray[3].SetHidden(true);
                    InGlassArray[4].SetHidden(true);                    
                }
                else
                {
                    // End:0x411
                    if(InDamageFactor > 0.1000000)
                    {
                        InGlassArray[0].SetHidden(false);
                        InGlassArray[1].SetHidden(true);
                        InGlassArray[2].SetHidden(true);
                        InGlassArray[3].SetHidden(true);
                        InGlassArray[4].SetHidden(true);                        
                    }
                    else
                    {
                        InGlassArray[0].SetHidden(true);
                        InGlassArray[1].SetHidden(true);
                        InGlassArray[2].SetHidden(true);
                        InGlassArray[3].SetHidden(true);
                        InGlassArray[4].SetHidden(true);
                    }
                }
            }
        }
    }
    //return;    
}

function GetMyPlayerController()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], PC;

    // End:0x5A
    if(Controller == none)
    {
        PC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);        
    }
    else
    {
        PC = LPPlayerController(Controller);
    }
    return PC;
    //return ReturnValue;    
}

function GetForkArmPressureDepletionModifier()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Upgrade, PC;
    local /*0x97E50000-0x00000000*/ private float Retval;

    PC = GetMyPlayerController();
    Retval = 1.0000000;
    // End:0xB2
    if((PC != none) && PC.HasUpgrade(Class'LPVSUpgrade_PreorderClawUpgrade', Upgrade))
    {
        // End:0xB2
        if(LPVSUpgrade_PreorderClawUpgrade(Upgrade) != none)
        {
            Retval = LPVSUpgrade_PreorderClawUpgrade(Upgrade).GetModifier();
        }
    }
    return ((Retval > 0.0000000) ? Retval : 1.0000000);
    //return ReturnValue;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser, Upgrade, PC, Winch;

    PC = GetMyPlayerController();
    super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    // End:0x16E
    if((PC != none) && PC.HasUpgrade(Class'LPVSUpgrade_ArmorUpgradeLvl1', Upgrade))
    {
        // End:0x13B
        if(PC.HasUpgrade(Class'LPVSUpgrade_ArmorUpgradeLvl2', Upgrade))
        {
            // End:0x13B
            if(PC.HasUpgrade(Class'LPVSUpgrade_ArmorUpgradeLvl3', Upgrade))
            {
                PC.HasUpgrade(Class'LPVSUpgrade_ArmorUpgradeLvl4', Upgrade);
            }
        }
        InDamage *= LPVSUpgrade_ArmorUpgrade(Upgrade).GetModifier();
    }
    // End:0x222
    if((PC != none) && PC.PlayerIsDoingVSTransition())
    {
        Momentum = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x222
        if((Health - InDamage) < TuneDataVSPlayerPawn.MinHealthForEntry)
        {
            InDamage = Health - TuneDataVSPlayerPawn.MinHealthForEntry;
        }
    }
    // End:0x299
    if(Controller == none)
    {
        Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
        // End:0x299
        if((Winch != none) && Winch.IsInState('WinchPointInteracting'))
        {
            InDamage = 0;
        }
    }
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private float HitDirDot;
    local /*0x97E50000-0x00000000*/ private @NULL FlatHitLoc, CrossProduct, HitDir;
    local /*0x97E50000-0x00000000*/ private float DmgAdjust;
    local /*0x97E50000-0x00000000*/ private int InitialHealth;

    // End:0xB2
    if((GrabbedPawn != none) && HitInfo.HitComponent == GrabbedPawn.Mesh)
    {
        GrabbedPawn.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        return;
    }
    InitialHealth = Health;
    CheckForNotifyOpponentCurrentTakeDamageWillShutdownVs(float(DamageAmount));
    super(LPBasePlayerPawn).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    FlatHitLoc = HitLocation;
    FlatHitLoc.Z = Location.Z;
    DmgAdjust = float(InitialHealth - Health) / float(HealthMax);
    HitDir = Normal(FlatHitLoc - Location);
    HitDirDot = HitDir Dot Vector(Rotation);
    // End:0x217
    if(HitDirDot > 0.9500000)
    {
        SetGlassDamage(FrontGlassMeshComps, FrontGlassDamageFactor, DmgAdjust);        
    }
    else
    {
        CrossProduct = Normal(Vector(Rotation) Cross HitDir);
        // End:0x285
        if(CrossProduct.Z >= float(0))
        {
            SetGlassDamage(RightGlassMeshComps, RightGlassDamageFactor, DmgAdjust);            
        }
        else
        {
            SetGlassDamage(LeftGlassMeshComps, LeftGlassDamageFactor, DmgAdjust);
        }
    }
    //return;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

event HealDamage()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], Retval;

    Retval = super(SPPawn).HealDamage(Amount, Healer, DamageType);
    HealGlass(Amount);
    return Retval;
    //return ReturnValue;    
}

simulated function HealGlass()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private float PercentHealed;

    // End:0x11
    if(Amount == 0)
    {
        return;
    }
    // End:0x138
    if(((FrontGlassDamageFactor > float(0)) || RightGlassDamageFactor > float(0)) || LeftGlassDamageFactor > float(0))
    {
        PercentHealed = float(Amount) / float(HealthMax);
        // End:0x90
        if(Health >= HealthMax)
        {
            PercentHealed = 1.0000000;
        }
        // End:0xC8
        if(FrontGlassDamageFactor > float(0))
        {
            SetGlassDamage(FrontGlassMeshComps, FrontGlassDamageFactor, -PercentHealed);
        }
        // End:0x100
        if(RightGlassDamageFactor > float(0))
        {
            SetGlassDamage(RightGlassMeshComps, RightGlassDamageFactor, -PercentHealed);
        }
        // End:0x138
        if(LeftGlassDamageFactor > float(0))
        {
            SetGlassDamage(LeftGlassMeshComps, LeftGlassDamageFactor, -PercentHealed);
        }
    }
    //return;    
}

simulated function NotifyWinchCrushToss()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winch;

    // End:0x6E
    if(GrabbedPawn != none)
    {
        // End:0x6E
        if(int(WorldInfo.NetMode) != int(NM_Client))
        {
            EndHoldingPawn();
            GrabbedPawn.DoVSCrushTossAction(self);
            GrabbedPawn = none;
        }
    }
    Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x10D
    if((Winch != none) && Winch.GrabbedPawn != none)
    {
        Winch.GotoState('Idle');
        Winch.GrabbedPawn = none;
    }
    //return;    
}

simulated function NotifyWinchReleasePawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winch;

    // End:0x6B
    if(GrabbedPawn != none)
    {
        EndHoldingPawn();
        Class'SPEngine.SPUtil'.static.SetRBCollision(GrabbedPawn.Mesh, Mesh, false);
        GrabbedPawn = none;
    }
    Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x10A
    if((Winch != none) && Winch.GrabbedPawn != none)
    {
        Winch.GotoState('Idle');
        Winch.GrabbedPawn = none;
    }
    //return;    
}

simulated function TurnOffTaserAudioComponent()
{
    // End:0x58
    if(TaserAudioComp != none)
    {
        TaserAudioComp.Stop();
        TaserAudioComp.DetachFromAny();
        TaserAudioComp = none;
    }
    //return;    
}

function Died()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Controller);
    // End:0x73
    if(LPPC != none)
    {
        // End:0x73
        if(LPPC.IsInState('Interacting'))
        {
            LPPC.GotoState('None');
        }
    }
    DoSpecialMove(Class'LPSM_PlayerVSDeath', true);
    return false;
    //return ReturnValue;    
}

function KillPlayerAndVS()
{
    bKillingPlayerInsideVS = true;
    LPPlayerController(Controller).GetMyPlayerPawn().Died(none, Class'LPDamageTypeForced', Location);
    Died(none, Class'LPDamageTypeForced', Location);
    //return;    
}

simulated function GetSMForCombatWindow_ActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private @NULL Window[25296897];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_ActiveDefenseLeaderVS';
    //return ReturnValue;    
}

event TryCombatWindow_ForkArm()
{
    local /*0x97E50000-0x00000000*/ private bool bSimulate[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL Window;

    // End:0x44
    if((IsDoingASpecialMove() && !IsDoingSpecialMove_OF_Class(Class'LPSM_ActiveDefenseLeader')) && !IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerVSArmSwingBase'))
    {
        return false;
    }
    // End:0x71
    if(!FindValidActiveCombatWindow(Class'LPCombatWindow_ForkArm', Window, bSimulate))
    {
        return false;
    }
    // End:0x93
    if(!bSimulate)
    {
        StartForkArmGrabFromCombatWindow(Window);
    }
    return true;
    //return ReturnValue;    
}

simulated event HandleAnimNotifyForkArmDropObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winch;

    Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    Winch.GrabbedObject.SetPhysics(10);
    Winch.GrabbedObject.SetBase(none);
    Winch.GrabbedObject = none;
    //return;    
}

simulated function NotifyAIOfGrab()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int HandledGrab;
    local /*0x97E50000-0x00000000*/ private @NULL AICtrl;

    HandledGrab = 0;
    // End:0xD1
    foreach WorldInfo.AllControllers(Class'LPAIController', AICtrl)
    {
        // End:0xA2
        if((AICtrl.Pawn == none) || AICtrl.Pawn.Health <= 0)
        {
            continue;            
        }
        // End:0xD0
        if(AICtrl.NotifyGettingGrabbed(self))
        {
            ++HandledGrab;
        }        
    }    
    return HandledGrab != 0;
    //return ReturnValue;    
}

simulated function NotifyAIOfWinchProjectileFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL WinchProj[8388609], AICtrl;

    // End:0xC1
    foreach WorldInfo.AllControllers(Class'LPAIController', AICtrl)
    {
        // End:0x97
        if((AICtrl.Pawn == none) || AICtrl.Pawn.Health <= 0)
        {
            continue;            
        }
        AICtrl.NotifyWinchProjectileFire(self, WinchProj);        
    }    
    //return;    
}

simulated function NotifyAIOfWinchProjectileRetracting()
{
    local /*0x97E50000-0x00000000*/ private @NULL AICtrl;

    // End:0xB8
    foreach WorldInfo.AllControllers(Class'LPAIController', AICtrl)
    {
        // End:0x97
        if((AICtrl.Pawn == none) || AICtrl.Pawn.Health <= 0)
        {
            continue;            
        }
        AICtrl.NotifyWinchProjectileRetracting(self);        
    }    
    //return;    
}

simulated function NotifyAIOfMeleeSwingStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL AICtrl;

    // End:0xB8
    foreach WorldInfo.AllControllers(Class'LPAIController', AICtrl)
    {
        // End:0x97
        if((AICtrl.Pawn == none) || AICtrl.Pawn.Health <= 0)
        {
            continue;            
        }
        AICtrl.NotifyVsMeleeSwingStart(self);        
    }    
    //return;    
}

simulated function NotifyAIOfMeleeSwingEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL AICtrl;

    // End:0xB8
    foreach WorldInfo.AllControllers(Class'LPAIController', AICtrl)
    {
        // End:0x97
        if((AICtrl.Pawn == none) || AICtrl.Pawn.Health <= 0)
        {
            continue;            
        }
        AICtrl.NotifyVsMeleeSwingEnd(self);        
    }    
    //return;    
}

simulated function CheckToSeeIfShouldApplyPhaseAction()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curSM, curLSM, tuneDataToUse;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private float weaponOnTime, AmountOfDamage;

    curSM = GetCurrentSpecialMoveInstance();
    // End:0x3ED
    if(curSM != none)
    {
        curLSM = LPSM_LeadVsStruggleMode(curSM);
        // End:0x3ED
        if((curLSM != none) && curLSM.TuneData != none)
        {
            tuneDataToUse = LPTuneDataStruggleVsPlayerBase(curLSM.TuneData);
            // End:0x3ED
            if(tuneDataToUse != none)
            {
                iter = 0;
                J0xBF:

                // End:0x3ED [Loop If]
                if(iter < tuneDataToUse.SuccessfulStrugglePhaseActionInfoList.Length)
                {
                    // End:0x3DF
                    if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].NameOfPhaseToActivateOn == PhaseNameEnding)
                    {
                        // End:0x3DF
                        if(!tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].bOnlyFollower)
                        {
                            // End:0x212
                            if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].AmountOfDamage != none)
                            {
                                AmountOfDamage = tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].AmountOfDamage.GetValue();
                            }
                            // End:0x333
                            if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].bStartWeapon)
                            {
                                StartRightArmPartAction(0, 1, true,,,, false);
                                // End:0x2F4
                                if(tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].DelayBeforeTurningOffWeapon > float(0))
                                {
                                    weaponOnTime = tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].DelayBeforeTurningOffWeapon;                                    
                                }
                                else
                                {
                                    weaponOnTime = tuneDataToUse.MaxTimeToLeaveWeaponOn;
                                }
                                SetTimer(weaponOnTime, false, 'ShutdownRightArmWeaponDown', self);
                            }
                            // End:0x3DF
                            if(AmountOfDamage > float(0))
                            {
                                curLSM.FollowerPawn.TakeDamage(int(AmountOfDamage), Controller, Location, vect(0.0000000, 0.0000000, 0.0000000), tuneDataToUse.SuccessfulStrugglePhaseActionInfoList[iter].TypeOfDamage);
                            }
                        }
                    }
                    ++iter;
                    // [Loop Continue]
                    goto J0xBF;
                }
            }
        }
    }
    //return;    
}

simulated function NotifyWonStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], StruggleModeSM;

    // End:0x37
    if(ClassIsChildOf(StruggleModeSM.Class, Class'LPSM_PlayerStruggleRestartTheUR'))
    {
        EndEMPEffect();
    }
    //return;    
}

simulated function NotifyLostStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawn[8388609], StruggleModeSM;

    // End:0x51
    if(ClassIsChildOf(StruggleModeSM.Class, Class'LPSM_PlayerStruggleRestartTheUR'))
    {
        // End:0x47
        if(Health <= 0)
        {
            Health = 1;
        }
        EndEMPEffect();
    }
    //return;    
}

simulated function NotifySucceedStruggleButtomMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    CheckToSeeIfShouldApplyPhaseAction(PhaseNameEnding);
    //return;    
}

simulated function NotifyFailedStruggleButtomMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function NotifySucceedStruggleWaggleMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    CheckToSeeIfShouldApplyPhaseAction(PhaseNameEnding);
    //return;    
}

simulated function NotifyFailedStruggleWaggleMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function NotifySucceedStruggleAimMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    CheckToSeeIfShouldApplyPhaseAction(PhaseNameEnding);
    //return;    
}

simulated function NotifyFailedStruggleAimMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    //return;    
}

simulated function NotifyEnddedStruggleDefaultMode()
{
    local /*0x97E50000-0x00000000*/ private name PhaseNameEnding[8388609];

    CheckToSeeIfShouldApplyPhaseAction(PhaseNameEnding);
    //return;    
}

simulated function CheckForNotifyOpponentCurrentTakeDamageWillShutdownVs()
{
    local /*0x97E50000-0x00000000*/ private float NewDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CurrentSpecialMove, LeadStruggleMode, opponentPawn;

    // End:0x109
    if(((float(self.Health) - NewDamage) <= float(1)) && SpecialMoveState.CurSMInstance != none)
    {
        CurrentSpecialMove = SpecialMoveState.CurSMInstance;
        LeadStruggleMode = LPSM_LeadStruggleMode(CurrentSpecialMove);
        // End:0x109
        if(LeadStruggleMode != none)
        {
            opponentPawn = LPAIPawn(LeadStruggleMode.FollowerPawn);
            // End:0x109
            if(opponentPawn != none)
            {
                opponentPawn.NotifyCurrentTakeDamageWillShutdownVsOpponent(self, NewDamage);
            }
        }
    }
    //return;    
}

final simulated function ShutdownRightArmWeaponDown()
{
    StopRightArmPartAction(0, false);
    //return;    
}

simulated function NotifyVSForcedRightArmPartEndThroughAnimNotify()
{
    // End:0x37
    if(IsLocallyControlled())
    {
        BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_VSForcedRightArmPartEndThroughAnimNotify, self);
    }
    SetDrillSpinControlStrength(0.0000000, 0.2500000);
    SetVSReticle("grab");
    SetVSReticleGrabState(false);
    //return;    
}

simulated function IsValidMeleeTargetNonCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldStartRegenCycle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x57
    if((Health < TuneDataVSPlayerPawn.MinHealthForEntry) && !IsDoingASpecialMove() || IsDoingSpecialMove(Class'LPSM_VSWaitEntryBegin'))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function StartRegenCycle()
{
    DoSpecialMove(Class'LPSM_PlayerVSDeath', true);
    GotoState('VSShutdown');
    //return;    
}

function AttachMusicPlayerComponents()
{
    local /*0x97E50000-0x00000000*/ private @NULL PersistentGameDataStore, TuneDataEventsToUse, EventToUse, SoundEventToUse, UserMusicPlayer;

    PersistentGameDataStore = LPDataStorePersistentGameData(Class'Engine.UIRoot'.static.StaticResolveDataStore(Class'SPEngine.SPDataStorePersistentGameData'.default.Tag));
    // End:0x63
    if(PersistentGameDataStore == none)
    {        
    }
    else
    {
        CurrentMusicSource = PersistentGameDataStore.VSMusicPlayerAudioComponents.CurrentMusicSource;
        GameMusicPlayerAudioComp = PersistentGameDataStore.VSMusicPlayerAudioComponents.GameMusicAudioComp;
        UserMusicPlayerAudioComp = PersistentGameDataStore.VSMusicPlayerAudioComponents.UserMusicAudioComp;
        // End:0x320
        if(GameMusicPlayerAudioComp != none)
        {
            // End:0x1F9
            if(GameMusicPlayerAudioComp.PlayEvent == none)
            {
                EventToUse = TuneDataPawnSoundEventBindings.GetEvent('MusicPlayer', TuneDataEventsToUse);
                // End:0x1F9
                if(EventToUse != none)
                {
                    SoundEventToUse = SPTuneDataEventDefSound(EventToUse);
                    // End:0x1F9
                    if(SoundEventToUse != none)
                    {
                        GameMusicPlayerAudioComp.PlayEvent = SoundEventToUse.EventSoundAkEvent;
                    }
                }
            }
            // End:0x24D
            if(GameMusicPlayerAudioComp.__OnMusicSegmentFinished__Delegate == none)
            {
                GameMusicPlayerAudioComp.__OnMusicSegmentFinished__Delegate = VSGameTrackFinished;
            }
            AttachComponent(GameMusicPlayerAudioComp);
            CurrentGameMusicTrack = PersistentGameDataStore.VSMusicPlayerAudioComponents.CurrentGameMusicTrack;
            // End:0x2E3
            if((CurrentGameMusicTrack < 1) || CurrentGameMusicTrack > TuneDataVSPlayerPawn.NumMusicTracks)
            {
                CurrentGameMusicTrack = 1;
            }
            bRepeatGameMusicPlaylist = PersistentGameDataStore.VSMusicPlayerAudioComponents.bRepeatGameMusicPlaylist;
        }
        // End:0x3CA
        if(UserMusicPlayerAudioComp != none)
        {
            AttachComponent(UserMusicPlayerAudioComp);
            UserMusicPlayer = Class'SPEngine.SPAkMusicPlayer'.static.GetMusicPlayerNative();
            // End:0x3CA
            if((UserMusicPlayer != none) && UserMusicPlayer.GetAkComponent() == none)
            {
                UserMusicPlayer.SetAkComponent(UserMusicPlayerAudioComp);
            }
        }
    }
    //return;    
}

function ResumeVSMusicPlayer()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = GetLocalPlayerController();
    // End:0xF7
    if(LPPC != none)
    {
        // End:0xF4
        if(LPPC.IsOkToPlayMusic(true))
        {
            // End:0x8B
            if(LPPC.bVSMusicPlayerPausedbyPlayer)
            {
                LPPC.PauseVSMusicPlayer(self);                
            }
            else
            {
                // End:0xD1
                if(LPPC.IsAllowedToPlayMusicPlayer(self))
                {
                    LPPC.ResumeVSMusicPlayer(self);                    
                }
                else
                {
                    LPPC.PauseVSMusicPlayer(self);
                }
            }            
        }        
    }
    //return;    
}

function @NULL VSGameTrackFinished()
{
    local /*0x97E50000-0x00000400*/ private @NULL InAkComp[8388609], LPPC;
    local /*0x97E50000-0x00000000*/ private bool bKeepGoing;

    // End:0x131
    if(InAkComp != none)
    {
        LPPC = GetLocalPlayerController();
        // End:0x131
        if(LPPC != none)
        {
            bKeepGoing = true;
            CurrentGameMusicTrack += 1;
            // End:0xCA
            if(CurrentGameMusicTrack > TuneDataVSPlayerPawn.NumMusicTracks)
            {
                CurrentGameMusicTrack = 1;
                // End:0xCA
                if(!bRepeatGameMusicPlaylist)
                {
                    // End:0xBE
                    if(GameMusicPlayerAudioComp != none)
                    {
                        GameMusicPlayerAudioComp.Stop();
                    }
                    bKeepGoing = false;
                }
            }
            // End:0x131
            if(bKeepGoing)
            {
                SetVSMusicPlayerState(GameMusicPlayerAudioComp, LPPC.bIsInVitalSuit);
                LPPC.SetTimer(1.0000000, false, 'NotifyNewTrack');
            }
        }
    }
    //return;    
}

function @NULL SetVSMusicPlayerState()
{
    local /*0x97E50000-0x00000400*/ private @NULL InAkComp[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInside[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string TrackStateName;

    // End:0x164
    if((InAkComp != none) && InAkComp.IsPlaying())
    {
        InAkComp.SetRTPCValue("InsideVitalSuit", ((bInside) ? 1.0000000 : 0.0000000));
        // End:0x13B
        if(InAkComp == GameMusicPlayerAudioComp)
        {
            TrackStateName = ((bInside) ? "Inside_Music_Player_Track_" : "Outside_Music_Player_Track_");            
            TrackStateName $= string(CurrentGameMusicTrack);
            InAkComp.SetState("VS_Player", TrackStateName);            
        }
        else
        {
            InAkComp.SetForce2D(bInside);
        }
    }
    //return;    
}

function ZiplineExitFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Winch, VSIP;

    VSIP = GetVSInteractionPoint();
    Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x82
    if(Winch.IsInState('WinchPointInteracting') && VSIP == none)
    {
        GotoState('Zipline');        
    }
    else
    {
        GotoState('None');
    }
    //return;    
}

simulated function AbortVSPlatformMode()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pocket, LPP;

    // End:0x106
    if(IsInState('VSExtraction'))
    {
        Pocket = ExtractPocket;
        GotoState('None');
        // End:0x7F
        if(Pocket != none)
        {
            Pocket.HidePlatform();
            Pocket.SetEnabled(false);
        }
        SetHidden(false);
        SetCollision(true, true);
        ExtractPocket = none;
        // End:0xD5
        foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPP)
        {
            // End:0xD5
            break;            
        }        
        // End:0x106
        if(LPP != none)
        {
            LPP.bDeployPlatform = false;
        }
    }
    //return;    
}

function ShowPlatformMeter()
{
    local /*0x97E50000-0x00000000*/ private bool bShow[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPHUD, LPP;

    // End:0x3A
    foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPP)
    {
        // End:0x3A
        break;        
    }    
    // End:0xBF
    if((LPP != none) && LPP.Controller != none)
    {
        LPHUD = LPHUD(PlayerController(LPP.Controller).myHUD);
    }
    // End:0x101
    if(LPHUD != none)
    {
        LPHUD.ShowPlatformMeter(bShow, ExtractPocket, self);
    }
    //return;    
}

function RevealPlatform()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pocket[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TEActor;
    local /*0x97E50000-0x00000000*/ private float D;

    // End:0x71
    if(GetNearestThermalEnergyPocket(TEActor, D, true))
    {
        Pocket = LPVSThermalEnergyPocket(TEActor);
        Pocket.RevealPlatform();
        SetHidden(true);
        SetCollision(false, false);
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function OnVSStopActions()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x4C
    if(LPPlayerController(Controller) != none)
    {
        LPPlayerController(Controller).OnVSStopActions(inAction);        
    }
    else
    {
        AbortVSPlatformMode();
    }
    //return;    
}

simulated function NotifyNewChoreographyParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChoreographyParams[25165825];

    // End:0x55
    if(ChoreographyParams.OtherTarget.IsA('LPAIPawnAct1Boss'))
    {
        ChoreographyParams.ZMatchType = 0;
    }
    //return;    
}

simulated function NotifyEnterExitPlatformMode()
{
    // End:0xA3
    if(ExtractPocket != none)
    {
        // End:0x61
        if(bIsPlatformModeFinished)
        {
            ExtractPocket.Mesh.PlayAnim('VEC_jimpey_utirig_plafor_drillMorph_jimEnter_Core');            
        }
        else
        {
            ExtractPocket.Mesh.PlayAnim('VEC_jimpey_utirig_plafor_drillMorph_jimExit_Core');
        }
    }
    //return;    
}

simulated state Zipline
{
    ignores BeginState, EndState;

    simulated function CanAnticipatePlayerEntry()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    simulated function Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super(LPVSPlayerPawn).Tick(DeltaTime);
        //return;        
    }

    function TakeDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

        // End:0x32
        if((Health - Damage) <= 0)
        {
            Damage = Health - 1;
        }
        super(LPVSPlayerPawn).TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        //return;        
    }

    simulated function PlayHitReactionAnimation()
    {
        return;
        //return;        
    }
Begin:

    stop;                
}

simulated state VSShutdown
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        // End:0x7E
        if((GrabbedPawn != none) && !GrabbedPawn.IsPendingKill())
        {
            EndHoldingPawn();
            GrabbedPawn.DoVSCrushTossAction(self);
            GrabbedPawn = none;
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x17
        if(NextStateName == 'Dead')
        {
        }
        // End:0x26
        if(Health <= 0)
        {
        }
        //return;        
    }

    event HealDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Amount[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x58
        if(Health < HealthMax)
        {
            Health = Min(HealthMax, Health + Amount);
            HealGlass(Amount);
            return true;            
        }
        else
        {
            return false;
        }
        //return ReturnValue;        
    }

    function TakeDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

        // End:0x27
        if((int(Role) < int(ROLE_Authority)) || InGodMode())
        {
            return;
        }
        Momentum = Momentum / Mass;
        // End:0x73
        if(HitLocation == vect(0.0000000, 0.0000000, 0.0000000))
        {
            HitLocation = Location;
        }
        TakeDamage_SetParams(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo,, DamageCauser, ServerShouldPlayHitReactAnimGlobalMasterSwitch(DamageType), ServerShouldPlayHitEffectsGlobalMasterSwitch(DamageType));
        // End:0xF4
        if(!AllowedToProcessTakeDamage())
        {
            return;
        }
        Damage = TakeDamageParams.Damage;
        Momentum = TakeDamageParams.Momentum;
        DamageType = TakeDamageParams.DamageType;
        ReplicateTakeDamageEffects();
        PlayTakeDamageEffects();
        MakeNoise(1.0000000);
        //return;        
    }

    simulated function PlayTakeDamageEffects()
    {
        // End:0x91
        if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeCrabMelee'))
        {
            TuneDataPawnFXEventBindings.PlayEventFX('VS_ShutdownPushedSlideLeftFoot', self, Mesh, none);
            TuneDataPawnFXEventBindings.PlayEventFX('VS_ShutdownPushedSlideRightFoot', self, Mesh, none);
        }
        super(LPVSPlayerPawn).PlayTakeDamageEffects();
        //return;        
    }
Begin:

    stop;                
}

simulated state VSExtraction
{
    ignores VSExtractSMFinished;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        bIsPlatformMode = true;
        bIsPlatformModeFinished = false;
        TotalExtracted = 0.0000000;
        HealthMax = int(TuneDataVSPlayerPawn.ExtractionPlatformHealth);
        Health = HealthMax;
        HealthRegenInfo.bHealthRegenEnabled = false;
        DoSpecialMove(Class'LPSM_VSPlatformMode', true, true, VSExtractSMFinished, none);
        ShowPlatformMeter(true);
        // End:0x16C
        if(int(Role) == int(ROLE_Authority))
        {
            // End:0xE5
            if(ExtractPocket == none)
            {
                FinishExtraction();                
            }
            else
            {
                TriggerEventClass(Class'LPSeqEvent_VSExtractionState', ExtractPocket, 0);
                TotalExtractable = ExtractPocket.GetEnergyRemaining();
                SetTimer(TuneDataVSPlayerPawn.ExtractionTime, false, 'FinishExtraction');
                SetTimer(1.0000000, true, 'UpdateExtraction');
            }
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        CleanupParticles();
        StopExtractionSounds();
        bIsPlatformMode = false;
        bIsPlatformModeFinished = true;
        ShowPlatformMeter(false);
        // End:0x81
        if((Health == 0) || NextStateName == 'VSShutdown')
        {
            TriggerEventClass(Class'LPSeqEvent_VSExtractionState', ExtractPocket, 1);            
        }
        else
        {
            HealthMax = int(TuneDataVSPlayerPawn.GetHealth(self));
            Health = HealthMax;
            HealthRegenInfo.bHealthRegenEnabled = default.HealthRegenInfo.bHealthRegenEnabled;
        }
        ExtractionConsoles.Remove(0, ExtractionConsoles.Length);        
        ClearTimer('FinishExtraction');
        ClearTimer('UpdateExtraction');
        // End:0x15A
        if(IsDoingSpecialMove(Class'LPSM_VSPlatformMode'))
        {
            EndCurrentSpecialMove();
        }
        //return;        
    }

    function FinishExtraction()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPP;

        CleanupParticles();
        StopExtractionSounds();
        bIsPlatformModeFinished = true;
        TriggerEventClass(Class'LPSeqEvent_VSExtractionState', ExtractPocket, 3);
        // End:0x7A
        foreach WorldInfo.AllPawns(Class'LPPlayerPawn', LPP)
        {
            // End:0x7A
            break;            
        }        
        // End:0xAB
        if(LPP != none)
        {
            LPP.bDeployPlatform = true;
        }
        //return;        
    }

    function CleanupParticles()
    {
        local /*0x97E50000-0x00000000*/ private int I;

        // End:0xFD
        if(PlatformParticles.Length > 0)
        {
            I = 0;
            J0x1B:

            // End:0xE7 [Loop If]
            if(I < PlatformParticles.Length)
            {
                // End:0xD9
                if(PlatformParticles[I].ParticleComponent != none)
                {
                    PlatformParticles[I].ParticleComponent.SetActive(false);
                    PlatformParticles[I].ParticleComponent.DetachFromAny();
                }
                I++;
                // [Loop Continue]
                goto J0x1B;
            }
            PlatformParticles.Remove(0, PlatformParticles.Length);            
        }
        //return;        
    }

    function UpdateExtraction()
    {
        local /*0x97E50000-0x00000000*/ private float EnergyDown, EnergyUp, PrevTotal;
        local /*0x97E50000-0x00000000*/ private bool bConsolesActive;
        local /*0x97E50000-0x00000000*/ private int I;

        // End:0x0F
        if(bIsPlatformModeFinished)
        {
            return;
        }
        // End:0x215
        if((ExtractPocket != none) && ExtractPocket.bEnabled)
        {
            bConsolesActive = true;
            I = 0;
            J0x59:

            // End:0xB9 [Loop If]
            if(I < ExtractionConsoles.Length)
            {
                // End:0xAB
                if(ExtractionConsoles[I].Health <= 1)
                {
                    bConsolesActive = false;
                }
                I++;
                // [Loop Continue]
                goto J0x59;
            }
            // End:0xE7
            if(bConsolesActive != bExtractConsolesActive)
            {
                bExtractConsolesActive = bConsolesActive;
            }
            EnergyDown = ExtractPocket.DecrementEnergyRemaining(TuneDataVSPlayerPawn.ExtractionRate);
            // End:0x16A
            if(EnergyDown < float(1))
            {
                VSExtractInfo.bOnPocket = false;
                FinishExtraction();
                return;
            }
            // End:0x208
            if(bConsolesActive)
            {
                PlayExtractionSounds();
                // End:0x205
                if(EnergyDown > float(0))
                {
                    EnergyUp = AddThermalEnergy(EnergyDown);
                    PrevTotal = TotalExtracted;
                    TotalExtracted += EnergyUp;
                    CheckEventThresholds(PrevTotal);
                    // End:0x205
                    if(EnergyUp < float(1))
                    {
                        FinishExtraction();
                    }
                }                
            }
            else
            {
                StopExtractionSounds();
            }            
        }
        else
        {
            VSExtractInfo.bOnPocket = false;
            FinishExtraction();
        }
        //return;        
    }

    simulated function PlayExtractionSounds()
    {
        // End:0xE3
        if(ExtractionSoundComponent == none)
        {
            ExtractionSoundComponent = CreateAudioComponent(DrillBeginSoundCue, false, true);
            // End:0xE3
            if(ExtractionSoundComponent != none)
            {
                ExtractionSoundComponent.bUseOwnerLocation = true;
                ExtractionSoundComponent.bAutoDestroy = true;
                ExtractionSoundComponent.bStopWhenOwnerDestroyed = true;
                ExtractionSoundComponent.bShouldRemainActiveIfDropped = true;
                ExtractionSoundComponent.Play();
            }
        }
        //return;        
    }

    simulated function StopExtractionSounds()
    {
        // End:0x51
        if(ExtractionSoundComponent != none)
        {
            PlaySound(DrillEndSoundCue);
            ExtractionSoundComponent.Stop();
            ExtractionSoundComponent = none;
        }
        //return;        
    }

    simulated function CanAnticipatePlayerEntry()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    simulated function CanAccessMunitionsLocker()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function TakeDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
        local /*0x97E50000-0x00000000*/ private int HealthPre, HealthPost, Index;

        // End:0x157
        if(LPPlayerController(InstigatedBy) == none)
        {
            HealthPre = FCeil((float(Health) / float(HealthMax)) * 10.0000000);
            super(LPVSPlayerPawn).TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
            HealthPost = FCeil((float(Health) / float(HealthMax)) * 10.0000000);
            // End:0x157
            if((HealthPre != HealthPost) && HealthPre > HealthPost)
            {
                Index = 8 - (HealthPost - 1);
                // End:0x157
                if((Index > -1) && Index < 9)
                {
                    TriggerEventClass(Class'LPSeqEvent_VSPlatformDamage', self, Index);
                }
            }
        }
        //return;        
    }

    simulated function PlayHitReactionAnimation()
    {
        return;
        //return;        
    }

    function CheckEventThresholds()
    {
        local /*0x97E50000-0x00000000*/ private float PrevTotal[8388609], EnergyPre, EnergyPost;
        local /*0x97E50000-0x00000000*/ private int Index;

        EnergyPre = float(FFloor((PrevTotal / TotalExtractable) * 10.0000000));
        EnergyPost = float(FFloor((TotalExtracted / TotalExtractable) * 10.0000000));
        // End:0xDD
        if(EnergyPre != EnergyPost)
        {
            Index = int(float(8) - (EnergyPost - float(1)));
            // End:0xDD
            if((Index > -1) && Index < 9)
            {
                TriggerEventClass(Class'LPSeqEvent_ExtractionPercent', self, Index);
            }
        }
        //return;        
    }
Begin:

    stop;                
}

defaultproperties
{
    bExtractConsolesActive=true
    // Reference: LPVsPartInfo'Default__LPVSPlayerPawn.RightArmPartInfoD0'
    begin object name=RightArmPartInfoD0 class=Class'LPVsPartInfo'
    end object
    RightArmPartInfo=RightArmPartInfoD0
    RearCableSkelControllerName="RearCableControl"
    FrontCableSkelControllerName="FrontCableControl"
    KernCableEndSkelControllerName="KernCableEndControl"
    KernCableHookSkelControllerName="KernCableHookControl"
    // Reference: SkeletalMeshComponent'Default__LPVSPlayerPawn.KernCableComp'
    begin object name=KernCableComp class=Class'Engine.SkeletalMeshComponent'
    end object
    KernCableComponent=KernCableComp
    RightArmAnimInfo=(AnimNodeSlotName="RightArmSlotNode",AnimNodeSlot=none)
    RightArmWelderAnimInfo=(AnimNodeSlotName="RightArmWelderSlotNode",AnimNodeSlot=none)
    RightArmDrillAnimInfo=(AnimNodeSlotName="RightArmDrillSlotNode",AnimNodeSlot=none)
    RightArmClawAnimInfo=(AnimNodeSlotName="RightArmClawSlotNode",AnimNodeSlot=none)
    WinchBoneName="JO_L_Wrist_End"
    WinchProjBoneName="JO_L_WristOsc"
    bRenderInForegroundWhenInCockpit=true
    // Reference: LPAIResDefenderVS'Default__LPVSPlayerPawn.LPAIResDefenderVS'
    begin object name=LPAIResDefenderVS
    end object
    AIResDefenderVS=LPAIResDefenderVS
    // Reference: LPAIResNushiSporeVS'Default__LPVSPlayerPawn.LPAIResNushiSporeVS'
    begin object name=LPAIResNushiSporeVS
    end object
    AIResNushiSporeVS=LPAIResNushiSporeVS
    RepairableComponent=none
    EnterPromptString="<Strings:LostPlanetGame.Tutorials.RIGENTERPROMPT>"
    ExitPromptString="<Strings:LostPlanetGame.Tutorials.RIGEXITPROMPT>"
    SnowPercent=0.6100000
    SnowMinimum=0.6100000
    // Reference: LPAIResManPlayer'Default__LPVSPlayerPawn.LPAIResManPlayer'
    begin object name=LPAIResManPlayer
    end object
    AIResourceManager=LPAIResManPlayer
    bAllowFiringUponByTeammates=true
    // Reference: LPAimControlPlayerControlled'Default__LPVSPlayerPawn.AimControl'
    begin object name=AimControl
    end object
    AimController=AimControl
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPVSPlayerPawn.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPVSPlayerPawn.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPVSPlayerPawn.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPDamageOverTimeComponent'Default__LPVSPlayerPawn.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPVSPlayerPawn.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    SlideOffWallInfo=(WallSlideOffCylinder=// Reference: CylinderComponent'Default__LPVSPlayerPawn.WallSlideCylinder'
    begin object name=WallSlideCylinder
    end object
    WallSlideOffCylinder=WallSlideCylinder)
    // Reference: KynapseBodyHandle'Default__LPVSPlayerPawn.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    bCanPickupInventory=true
    // Reference: SkeletalMeshComponent'Default__LPVSPlayerPawn.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPVSPlayerPawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPVSPlayerPawn.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=myKynapseBodyHandle
    Components[4]=MyLightEnvironment
    Components[5]=SPPawnMesh
    Components[6]=FaceAudioComponent
    Components[7]=SPDamageOverTimeComponentObj
    Components[8]=FXActionManagerDefObj0
    Components[9]=LPAIResManPlayer
    // Reference: SPDamageStateComponent'Default__LPVSPlayerPawn.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[10]=DamageStateComponentDefObj
    Components[11]=KernCableComp
    // Reference: LPActorInteractionMetaData'Default__LPVSPlayerPawn.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}