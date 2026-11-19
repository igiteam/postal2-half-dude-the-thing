class LPWeaponParticleThrower extends LPWeapon
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

struct ArcTargetInfoStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Source;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Target;
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ArcComponent[524289];

    structdefaultproperties
    {
        Source=none
        Target=none
        ArcComponent=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array TraceSockets;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL BeamComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BeamColorVector;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array ImpactInfosToProcess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayFireEffects;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsOverheated;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayedOverheatIntro;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastBeamUpdateTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OverheatSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OverheatLength;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CooldownSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinRampUpTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxRampUpTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name RampPrevStateName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentOverheatLevel;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentOverheatTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte OverheatFromFireMode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name OverheatFXEventName;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL OverheatParticles[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class OverheatSpecialMoveClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name OverheatSoundClientEventName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name OverheatSoundLocalPlayerEventName;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL OverheatAC[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array ArcTargetInfos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ImpactActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ArcRadius;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ArcDamageReduction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ArcTargets;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ArcDelay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ArcTimer;

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609], LPTDWPT;

    super.InitTuneData(TuneData);
    LPTDWPT = LPTuneDataWeaponParticleThrower(TuneData);
    BeamComponent.SetTemplate(LPTDWPT.BeamTemplate);
    OverheatSpeed = LPTDWPT.OverheatSpeed.GetValue();
    CooldownSpeed = LPTDWPT.CooldownSpeed.GetValue();
    OverheatLength = LPTDWPT.LengthOfOverheat.GetValue();
    MinRampUpTime = LPTDWPT.MinRampUpTime.GetValue();
    MaxRampUpTime = LPTDWPT.MaxRampUpTime.GetValue();
    //return;    
}

simulated function HasAmmo()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private int Amount[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (CurrentOverheatTime <= float(0)) && !SPPawn(Instigator).IsDoingSpecialMove_OF_Class(OverheatSpecialMoveClass);
    //return ReturnValue;    
}

simulated function OnOutOfAmmo()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function StartFire()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SoundOwner;

    // End:0xAD
    if(!HasAmmo(FireModeNum) && int(FireModeNum) != 2)
    {
        // End:0xAA
        if(!bTriggerPressed)
        {
            bTriggerPressed = true;
            SoundOwner = ((Owner == none) ? self : Owner);
            TuneDataWeaponSoundEventBindings.PlayEventSoundLocally(DryFireSoundEventname, DryFireSoundEventname, SoundOwner, none, none, false);
        }        
    }
    else
    {
        super(SPGFWeapon).StartFire(FireModeNum);
    }
    //return;    
}

simulated function @NULL PlayFireEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[9437185], SkelMesh;

    // End:0x10
    if(bPlayFireEffects)
    {
        return;
    }
    bPlayFireEffects = true;
    // End:0xE1
    if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        SkelMesh = SkeletalMeshComponent(Mesh);
        // End:0xC0
        if(!SkelMesh.IsComponentAttached(BeamComponent))
        {
            SkelMesh.AttachComponentToSocket(BeamComponent, MuzzleFlashSocketName);
        }
        BeamComponent.SetActive(false);
    }
    PlayFireSound();
    // End:0x1F5
    if(Instigator.IsLocallyControlled() && Instigator.IsHumanControlled())
    {
        PlayerController(Instigator.Controller).ClientPlayForceFeedbackWaveform(TuneDataBaseWeapon.WeaponFireWaveForm);
        // End:0x1EB
        if(CameraShake != none)
        {
            PlayerController(Instigator.Controller).ClientPlayCameraShake(CameraShake, 1.0000000, false);
        }
        SetWeaponRecoil();
    }
    super.PlayFireEffects(FireModeNum, HitLocation);
    SetTimer(0.1000000, false, 'DamageTargets');
    //return;    
}

simulated function StopFireEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL SavedController;

    bPlayFireEffects = false;
    StopFireLoopingAudio();
    SavedController = LPPlayerPawn(Instigator).SavedController;
    // End:0x93
    if(SavedController != none)
    {
        SavedController.ClientStopForceFeedbackWaveform(TuneDataBaseWeapon.WeaponFireWaveForm);
    }
    BeamComponent.SetActive(false);
    ImpactActor = none;
    I = 0;
    J0xCA:

    // End:0x15A [Loop If]
    if(I < ArcTargetInfos.Length)
    {
        // End:0x14C
        if(ArcTargetInfos[I].ArcComponent != none)
        {
            ArcTargetInfos[I].ArcComponent.SetActive(false);
        }
        I++;
        // [Loop Continue]
        goto J0xCA;
    }
    super(SPInventoryWeapon).StopFireEffects(FireModeNum);
    ClearTimer('DamageTargets');
    //return;    
}

simulated function GetFireModeDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609], HitActor;
    local /*0x97E50000-0x00000000*/ private int HitNum[9437185];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], TotalDamage;

    TotalDamage = ((InstantHitDamage[int(CurrentFireMode)] * 0.1000000) * (GetDamageModifier())) * (GetDamageFallOff(HitLocation));
    // End:0xDB
    if(!Instigator.IsHumanControlled())
    {
        TotalDamage = FMax(TuneDataBaseWeapon.SupportedAmmoTypes[AmmoTypeInfo.CurrentAmmoMode].AIDamageMultiplier * TotalDamage, 1.0000000);
    }
    return TotalDamage;
    //return ReturnValue;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPInventoryWeapon).Tick(DeltaTime);
    // End:0x168
    if(Instigator != none)
    {
        // End:0xFF
        if(Instigator.IsLocallyControlled())
        {
            // End:0xBD
            if((CurrentOverheatTime > float(0)) || bIsOverheated)
            {
                CurrentOverheatTime -= DeltaTime;
                // End:0xBA
                if((CurrentOverheatTime <= float(0)) && Instigator.Weapon == self)
                {
                    SetOverheated(false);
                }                
            }
            else
            {
                // End:0xFF
                if(!IsInState('WeaponFiringCharge'))
                {
                    CurrentOverheatLevel = FMax(CurrentOverheatLevel - (CooldownSpeed * DeltaTime), 0.0000000);
                }
            }
        }
        // End:0x168
        if((Instigator.Weapon == self) && Instigator.InvManager.PendingWeapon == none)
        {
            HandleOverheatSpecialMove();
        }
    }
    UpdateBeam(DeltaTime);
    //return;    
}

simulated function FireModeUpdated()
{
    local /*0x97E50000-0x00000000*/ private byte FiringMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];

    super(SPInventoryWeapon).FireModeUpdated(FiringMode, bViaReplication);
    NotifyOverheated(int(FiringMode) == 4);
    //return;    
}

simulated function DrawHUD()
{
    local /*0x97E50000-0x00000000*/ private @NULL H[8388609], LPH, CustomAddColor;

    LPH = LPHUD(H);
    // End:0x7B
    if(CurrentOverheatLevel > 66.6600000)
    {
        CustomAddColor.R = 255;
        LPH.SetReticleCustomAmmoMode(true, CustomAddColor);        
    }
    else
    {
        LPH.SetReticleCustomAmmoMode(false);
        LPH.RefreshHUDAmmoCount();
    }
    //return;    
}

simulated function GetWeaponAmmoFillPercent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ((bIsOverheated) ? FClamp(CurrentOverheatTime * 250.0000000, 0.0000000, 100.0000000) : 0.0000000);
    //return ReturnValue;    
}

simulated function GetMagazineFillPercent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ((bIsOverheated) ? (CurrentOverheatTime * 100.0000000) / OverheatLength : CurrentOverheatLevel);
    //return ReturnValue;    
}

simulated function SetOverheated()
{
    local /*0x97E50000-0x00000000*/ private bool bIsOverHeating[8388609];

    // End:0x1B
    if(bIsOverheated == bIsOverHeating)
    {
        return;
    }
    // End:0x51
    if(bIsOverHeating)
    {
        CurrentOverheatTime = OverheatLength;
        StopFire(CurrentFireMode);        
    }
    else
    {
        ClearPendingFire(int(CurrentFireMode));
        // End:0xA9
        if(Instigator.Weapon == self)
        {
            Instigator.StopFiring();
        }
        CurrentOverheatTime = 0.0000000;
        CurrentOverheatLevel = 0.0000000;
    }
    SetOverheatFireMode(bIsOverHeating);
    //return;    
}

simulated function SetOverheatFireMode()
{
    local /*0x97E50000-0x00000000*/ private bool bIsOverHeating[8388609];

    // End:0x2F
    if(bIsOverHeating)
    {
        OverheatFromFireMode = CurrentFireMode;
        SetCurrentFireMode(4);        
    }
    else
    {
        SetCurrentFireMode(OverheatFromFireMode);
    }
    NotifyOverheated(bIsOverHeating);
    // End:0x7E
    if(int(Role) < int(ROLE_Authority))
    {
        ServerSetOverheatFireMode(bIsOverHeating);
    }
    //return;    
}

reliable server function ServerSetOverheatFireMode()
{
    local /*0x97E50000-0x00000000*/ private bool bIsOverHeating[8388609];

    SetOverheatFireMode(bIsOverHeating);
    //return;    
}

simulated function HandleOverheatSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL MySPPawn;

    // End:0xC2
    if(bIsOverheated)
    {
        // End:0xB6
        if(CanDoOverheatSpecialMove())
        {
            MySPPawn = SPPawn(Instigator);
            MySPPawn.DoSpecialMove(OverheatSpecialMoveClass);
            // End:0xB6
            if(bPlayedOverheatIntro)
            {
                MySPPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_WeaponOverheatIdle, Instigator);
            }
        }
        bPlayedOverheatIntro = true;
    }
    //return;    
}

simulated function CanDoOverheatSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    LPP = LPPlayerPawn(Instigator);
    return (!LPP.IsDoingASpecialMove() && !LPP.IsInCover()) && !LPP.IsInState('PlayerZipline');
    //return ReturnValue;    
}

simulated function NotifyOverheated()
{
    local /*0x97E50000-0x00000000*/ private bool bIsOverHeating[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0x119
    if(bIsOverHeating != bIsOverheated)
    {
        bIsOverheated = bIsOverHeating;
        // End:0x7B
        if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
        {
            // End:0x71
            if(bIsOverHeating)
            {
                PlayOverheatedEffects();                
            }
            else
            {
                StopOverheatedEffects();
            }
        }
        // End:0x119
        if((Instigator != none) && Instigator.IsLocallyControlled())
        {
            LPPC = LPPlayerController(Instigator.Controller);
            // End:0x119
            if(LPPC != none)
            {
                LPPC.AllowAimDownSight(!bIsOverheated);
            }
        }
    }
    //return;    
}

simulated function @NULL PlayOverheatedEffects()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelMesh, AC, AkC;

    SkelMesh = SkeletalMeshComponent(Mesh);
    OverheatParticles = TuneDataWeaponFXEventBindings.PlayEventFX(OverheatFXEventName, none, SkelMesh, none);
    OverheatAC = TuneDataWeaponSoundEventBindings.PlayEventSoundLocallyEx(OverheatSoundClientEventName, OverheatSoundLocalPlayerEventName, ((Owner == none) ? self : Owner), SkelMesh);
    AC = AudioComponent(OverheatAC);
    // End:0x107
    if(AC != none)
    {
        AC.bStopWhenOwnerDestroyed = true;
    }
    AkC = AkComponent(OverheatAC);
    // End:0x153
    if(AkC != none)
    {
        AkC.bStopWhenOwnerDestroyed = true;
    }
    bPlayedOverheatIntro = false;
    //return;    
}

simulated function StopOverheatedEffects()
{
    // End:0x30
    if(OverheatParticles != none)
    {
        OverheatParticles.SetActive(false);
    }
    // End:0x73
    if(OverheatAC != none)
    {
        OverheatAC.FadeOut(0.1000000, 0.0000000);
        OverheatAC = none;
    }
    SPPawn(Instigator).BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_WeaponStopOverheating, Instigator);
    //return;    
}

simulated function RampedUp()
{
    //return;    
}

simulated function PutDownWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL MySPPawn;

    MySPPawn = SPPawn(Instigator);
    // End:0x67
    if(MySPPawn.IsDoingSpecialMove(OverheatSpecialMoveClass))
    {
        MySPPawn.EndCurrentSpecialMove();
    }
    // End:0x8D
    if(bIsOverheated)
    {
        StopCustomWeaponAnimation(0.1000000);
        StopOverheatedEffects();
    }
    super.PutDownWeapon();
    //return;    
}

simulated function FlashLocationUpdated()
{
    local /*0x97E50000-0x00000000*/ private byte FiringMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL FlashLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];

    // End:0x29
    if(!bPlayFireEffects)
    {
        FlashLocation = vect(0.0000000, 0.0000000, 0.0000000);        
    }
    else
    {
        BeamComponent.SetVectorParameter('BeamTarget', FlashLocation);
    }
    super(SPInventoryWeapon).FlashLocationUpdated(FiringMode, FlashLocation, bViaReplication);
    //return;    
}

simulated function SetBeamColorVector()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewColorVector[8388609];

    // End:0x3D
    if(BeamColorVector != NewColorVector)
    {
        BeamColorVector = NewColorVector;
        UpdateBeamComponentColor(BeamComponent);
    }
    //return;    
}

simulated function @NULL UpdateBeamComponentColor()
{
    local /*0x97E50000-0x00000400*/ private @NULL BeamComp[8388609];

    // End:0x59
    if((BeamColorVector != default.BeamColorVector) && BeamComp != none)
    {
        BeamComp.SetVectorParameter('InstanceColor', BeamColorVector);
    }
    //return;    
}

simulated function @NULL UpdateBeam()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000400*/ private @NULL SkelMesh, StartTrace, EndTrace, SocketRot;
    local /*0x97E50000-0x00000000*/ private int Idx, I, PrevImpactActors;
    local /*0x97E50000-0x00000000*/ private @NULL AdjustedAimDir, FoundHitLocation, HitInfo;

    // End:0x20
    if(!bPlayFireEffects)
    {
        ArcTimer = 0.0000000;
        return;
    }
    SkelMesh = SkeletalMeshComponent(Mesh);
    Idx = 0;
    J0x47:

    // End:0xB9 [Loop If]
    if(Idx < ImpactInfosToProcess.Length)
    {
        // End:0xAB
        if(!ImpactInfosToProcess[Idx].HitActor.bHidden)
        {
            PrevImpactActors++;
        }
        Idx++;
        // [Loop Continue]
        goto J0x47;
    }
    I = 0;
    J0xC4:

    // End:0x233 [Loop If]
    if(I < TraceSockets.Length)
    {
        ImpactInfosToProcess.Length = 0;
        SkelMesh.GetSocketWorldLocationAndRotation(TraceSockets[I], StartTrace);
        AdjustedAimDir = Vector(GetAdjustedAim(StartTrace));
        EndTrace = StartTrace + (AdjustedAimDir * (GetTraceRange()));
        HitInfo = CalcWeaponFire(StartTrace, EndTrace, ImpactInfosToProcess);
        // End:0x1EE
        if(HitInfo.HitLocation != EndTrace)
        {
            FoundHitLocation = HitInfo.HitLocation;
        }
        // End:0x225
        if(FoundHitLocation != vect(0.0000000, 0.0000000, 0.0000000))
        {
            // End:0x222
            if(PrevImpactActors == 0)
            {
                DamageTargets();
            }
            // [Explicit Break]
            goto J0x233;
        }
        I++;
        // [Loop Continue]
        goto J0xC4;
    }
    J0x233:

    // End:0x421
    if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x400
        if((Instigator.IsLocallyControlled() || int(Role) == int(ROLE_Authority)) && ((WorldInfo.TimeSeconds - LastBeamUpdateTime) >= 0.1000000) || PrevImpactActors == 0)
        {
            // End:0x33C
            if(FoundHitLocation != vect(0.0000000, 0.0000000, 0.0000000))
            {
                BeamComponent.SetVectorParameter('BeamTarget', FoundHitLocation);
                SetFlashLocation(FoundHitLocation);                
            }
            else
            {
                SkelMesh.GetSocketWorldLocationAndRotation(MuzzleFlashSocketName, StartTrace, SocketRot);
                EndTrace = GetAdjustedEndPoint(StartTrace);
                BeamComponent.SetVectorParameter('BeamTarget', EndTrace);
                SetFlashLocation(EndTrace);
            }
            LastBeamUpdateTime = WorldInfo.TimeSeconds;
        }
        BeamComponent.SetActive(true);
    }
    // End:0x517
    if(Instigator.Controller != none)
    {
        // End:0x4BA
        if(ImpactActor != HitInfo.HitActor)
        {
            ArcTimer = 0.0000000;
            ImpactActor = LPPawn(HitInfo.HitActor);
            ClearArcTargets();            
        }
        else
        {
            ArcTimer = ((AmmoTypeInfo.CurrentAmmoMode == 1) ? ((ImpactActor != none) ? ArcTimer + DeltaTime : 0.0000000) : 0.0000000);
        }
    }
    ProjectArcBeams(DeltaTime);
    //return;    
}

simulated function ProjectArcBeams()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x151
    if((AmmoTypeInfo.CurrentAmmoMode == 1) && ImpactActor != none)
    {
        I = 0;
        J0x3E:

        // End:0x151 [Loop If]
        if(I < ArcTargetInfos.Length)
        {
            // End:0x85
            if(ArcTargetInfos[I].Target == none)
            {                
            }
            else
            {
                ArcTargetInfos[I].ArcComponent.SetVectorParameter('BeamTarget', ArcTargetInfos[I].Target.Location);
                ArcTargetInfos[I].ArcComponent.SetActive(true);
            }
            I++;
            // [Loop Continue]
            goto J0x3E;
        }
    }
    //return;    
}

simulated function DamageTargets()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x14F
    if(Instigator.IsLocallyControlled())
    {
        Idx = 0;
        J0x2D:

        // End:0x82 [Loop If]
        if(Idx < ImpactInfosToProcess.Length)
        {
            ProcessInstantHit(CurrentFireMode, ImpactInfosToProcess[Idx], NumInstantHits);
            Idx++;
            // [Loop Continue]
            goto J0x2D;
        }
        FindArcTargets();
        // End:0x13C
        if((Instigator.IsLocallyControlled() && Instigator.IsHumanControlled()) && CameraShake != none)
        {
            PlayerController(Instigator.Controller).ClientPlayCameraShake(CameraShake, 1.0000000, false);
            SetWeaponRecoil();
        }
        SetTimer(0.1000000, false, 'DamageTargets');
    }
    //return;    
}

simulated function FindArcTargets()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private int Idx, I;
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private int NumHitActors, FoundIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FoundTargets;
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo, HitActor;
    local /*0x97E50000-0x00000000*/ private editfixedsize string TargetString;

    // End:0x19
    if(ArcTimer < ArcDelay)
    {
        return;
    }
    Idx = 0;
    J0x24:

    // End:0x7B4 [Loop If]
    if(Idx < ImpactInfosToProcess.Length)
    {
        // End:0x66D
        if((!Class'Engine.Weapon'.static.PassThroughDamage(ImpactInfosToProcess[Idx].HitActor) && ImpactInfosToProcess[Idx].HitActor == ImpactActor) && int(ImpactActor.GetTeamNum()) != int(Instigator.GetTeamNum()))
        {
            // End:0x669
            foreach CollidingActors(Class'LPPawn', LPP, ArcRadius, ImpactActor.Location, true)
            {
                // End:0x161
                if(NumHitActors == ArcTargets)
                {
                    // End:0x669
                    break;
                }
                // End:0x232
                if(((((LPP == ImpactActor) || LPP == Instigator) || int(LPP.GetTeamNum()) == int(Instigator.GetTeamNum())) || LPP.IsInState('Dying')) || Class'Engine.Weapon'.static.PassThroughDamage(LPP))
                {
                    continue;                    
                }
                HitActor = Class'LPWeapon'.static.WeaponTrace(Class, ImpactActor, HitLocation, HitNormal, LPP.Location, ImpactActor.Location,, HitInfo);
                // End:0x2E1
                if(HitActor != LPP)
                {
                    continue;                    
                }
                ArcTargetInfos[NumHitActors].Target = LPP;
                // End:0x4EE
                if(ArcTargetInfos[NumHitActors].ArcComponent == none)
                {
                    ArcTargetInfos[NumHitActors].ArcComponent = new (self) Class'Engine.ParticleSystemComponent';
                    ArcTargetInfos[NumHitActors].ArcComponent.SetTemplate(BeamComponent.Template);
                    UpdateBeamComponentColor(ArcTargetInfos[NumHitActors].ArcComponent);
                    ArcTargetInfos[NumHitActors].ArcComponent.bAutoActivate = false;
                    ImpactActor.Mesh.AttachComponent(ArcTargetInfos[NumHitActors].ArcComponent, ImpactActor.Mesh.FindClosestBone(ImpactActor.Location));                    
                }
                else
                {
                    // End:0x60F
                    if(ArcTargetInfos[NumHitActors].Source != ImpactActor)
                    {
                        ArcTargetInfos[NumHitActors].ArcComponent.DetachFromAny();
                        ImpactActor.Mesh.AttachComponent(ArcTargetInfos[NumHitActors].ArcComponent, ImpactActor.Mesh.FindClosestBone(ImpactActor.Location));
                    }
                }
                ArcTargetInfos[NumHitActors].Source = ImpactActor;
                FoundTargets[FoundTargets.Length] = LPP;
                NumHitActors++;                
            }            
            // [Explicit Break]
            goto J0x7B4;
        }
        I = 0;
        J0x678:

        // End:0x7A6 [Loop If]
        if(I < ArcTargetInfos.Length)
        {
            FoundIndex = FoundTargets.Find(ArcTargetInfos[I].Target);            
            // End:0x798
            if(FoundIndex == -1)
            {
                ArcTargetInfos[I].Target = none;
                ArcTargetInfos[I].Source = none;
                // End:0x798
                if(ArcTargetInfos[I].ArcComponent != none)
                {
                    ArcTargetInfos[I].ArcComponent.DeactivateSystem();
                }
            }
            I++;
            // [Loop Continue]
            goto J0x678;
        }
        Idx++;
        // [Loop Continue]
        goto J0x24;
    }
    J0x7B4:

    FoundTargets.Insert(0, 1);    
    FoundTargets[0] = ImpactActor;
    TargetString = WriteTargetString(FoundTargets);
    // End:0x83B
    if(TargetString != LPPlayerPawn(Instigator).ParticleThrowerArcTargets)
    {
        ServerUpdateArcTargets(TargetString);
    }
    //return;    
}

simulated function ClearArcTargets()
{
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x135
    if((LPPlayerPawn(Instigator).ParticleThrowerArcTargets != "") || ArcTargetInfos.Length > 0)
    {
        I = 0;
        J0x4B:

        // End:0x129 [Loop If]
        if(I < ArcTargetInfos.Length)
        {
            ArcTargetInfos[I].Target = none;
            ArcTargetInfos[I].Source = none;
            // End:0x11B
            if(ArcTargetInfos[I].ArcComponent != none)
            {
                ArcTargetInfos[I].ArcComponent.DeactivateSystem();
            }
            I++;
            // [Loop Continue]
            goto J0x4B;
        }
        ServerUpdateArcTargets("");
    }
    //return;    
}

simulated function GetAdjustedEndPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL RealEndPoint[8388609], ReturnValue, CamLoc, AdjustedPlayerLoc, CamRot;

    // End:0x54
    if(!Instigator.IsLocallyControlled())
    {
        return RealEndPoint + (Vector(GetAdjustedAim(RealEndPoint)) * (GetTraceRange()));        
    }
    else
    {
        PlayerController(Instigator.Controller).PlayerCamera.GetCameraViewPoint(CamLoc, CamRot);
        AdjustedPlayerLoc = Instigator.Location;
        AdjustedPlayerLoc.Z = CamLoc.Z;
        AdjustedPlayerLoc.Y = CamLoc.Y;
        RealEndPoint = CamLoc + (Vector(CamRot) * (VSize(AdjustedPlayerLoc - CamLoc) + (GetTraceRange())));
        return RealEndPoint;
    }
    //return ReturnValue;    
}

simulated function GetOverheatSpeed()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x2B
    if(Upgrades[0].bEnabled)
    {
        return 20.0000000;        
    }
    else
    {
        // End:0x3E
        if(IsPreOrderWeapon())
        {
            return 34.0000000;
        }
    }
    return OverheatSpeed;
    //return ReturnValue;    
}

reliable server function ServerUpdateArcTargets()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string TargetString[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x37
    if(!Instigator.IsLocallyControlled())
    {
        RemoteSetArcTargets(TargetString);
    }
    LPPlayerPawn(Instigator).ParticleThrowerArcTargets = TargetString;
    Instigator.bForceNetUpdate = true;
    I = 0;
    J0x94:

    // End:0x2E8 [Loop If]
    if(I < ArcTargetInfos.Length)
    {
        // End:0x2DA
        if(ArcTargetInfos[I].Target != none)
        {
            // End:0x2DA
            if(FastTrace(ArcTargetInfos[I].Target.Location, ImpactActor.Location))
            {
                ArcTargetInfos[I].Target.TakeDamage(int((GetFireModeDamage(ImpactActor.Location, ArcTargetInfos[I].Target)) * ArcDamageReduction), ((Instigator != none) ? Instigator.Controller : none), ArcTargetInfos[I].Target.Location, (GetInstantHitMomentum(0, ArcTargetInfos[I].Target)) * Normal(ArcTargetInfos[I].Target.Location - Instigator.Location), InstantHitDamageTypes[0],, self);
            }
        }
        I++;
        // [Loop Continue]
        goto J0x94;
    }
    //return;    
}

simulated function RemoteSetArcTargets()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string TargetString[8388609];

    ReadTargetString(TargetString);
    //return;    
}

simulated function WriteTargetString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Targets[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize string TargetString;

    I = 0;
    J0x0B:

    // End:0x8C [Loop If]
    if(I < Targets.Length)
    {
        // End:0x7E
        if(Targets[I] != none)
        {
            TargetString = (TargetString $ ",") $ Targets[I].ReplicatedName;
        }
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    return TargetString;
    //return ReturnValue;    
}

simulated function ReadTargetString()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string TargetString[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPP;
    local /*0x97E50000-0x00000000*/ private editfixedsize array TargetNames;
    local /*0x97E50000-0x00000000*/ private int FoundIndex, I;

    ParseStringIntoArray(TargetString, TargetNames, ",", true);
    // End:0xD1
    foreach WorldInfo.AllPawns(Class'LPPawn', LPP)
    {
        FoundIndex = TargetNames.Find(LPP.ReplicatedName);        
        // End:0xD0
        if(FoundIndex != -1)
        {
            // End:0xD0
            if(FoundIndex == 0)
            {
                TargetNames.Remove(0, 1);                
                ImpactActor = LPP;
                // End:0xD1
                break;
            }
        }        
    }    
    I = 0;
    // End:0x4F5
    foreach WorldInfo.AllPawns(Class'LPPawn', LPP)
    {
        FoundIndex = TargetNames.Find(LPP.ReplicatedName);        
        // End:0x4F4
        if(FoundIndex != -1)
        {
            ArcTargetInfos[I].Target = LPP;
            // End:0x398
            if(ArcTargetInfos[I].ArcComponent == none)
            {
                ArcTargetInfos[I].ArcComponent = new (self) Class'Engine.ParticleSystemComponent';
                ArcTargetInfos[I].ArcComponent.SetTemplate(BeamComponent.Template);
                UpdateBeamComponentColor(ArcTargetInfos[I].ArcComponent);
                ArcTargetInfos[I].ArcComponent.bAutoActivate = false;
                ArcTargetInfos[I].Source = ImpactActor;
                ImpactActor.Mesh.AttachComponent(ArcTargetInfos[I].ArcComponent, ImpactActor.Mesh.FindClosestBone(ImpactActor.Location));                
            }
            else
            {
                // End:0x4E9
                if(ArcTargetInfos[I].Source != ImpactActor)
                {
                    ArcTargetInfos[I].Source = ImpactActor;
                    ArcTargetInfos[I].ArcComponent.DetachFromAny();
                    ImpactActor.Mesh.AttachComponent(ArcTargetInfos[I].ArcComponent, ImpactActor.Mesh.FindClosestBone(ImpactActor.Location));
                }
            }
            I++;
        }        
    }    
    // End:0x510
    if(I == 0)
    {
        ImpactActor = none;
    }
    I = 0;
    J0x51B:

    // End:0x626 [Loop If]
    if(I < ArcTargetInfos.Length)
    {
        // End:0x562
        if(ArcTargetInfos[I].Target == none)
        {            
        }
        else
        {
            // End:0x618
            if(TargetNames.Find(ArcTargetInfos[I].Target.ReplicatedName) == )
            {                
                ArcTargetInfos[I].Target = none;
                ArcTargetInfos[I].ArcComponent.DeactivateSystem();
            }
        }
        I++;
        // [Loop Continue]
        goto J0x51B;
    }
    //return;    
}

simulated state WeaponEquipping
{
    ignores HandleOverheatSpecialMove;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        NotifyOverheated(int(CurrentFireMode) == 4);
        //return;        
    }
    stop;    
}

simulated state WeaponFiringCharge
{
    simulated event IsCharging()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private float RampUpTime;

        ArcTimer = 0.0000000;
        RampPrevStateName = PreviousStateName;
        RampUpTime = MinRampUpTime + (((MaxRampUpTime - MinRampUpTime) * (100.0000000 - CurrentOverheatLevel)) / 100.0000000);
        SetTimer(RampUpTime, false, 'RampedUp');
        //return;        
    }

    simulated function RampedUp()
    {
        BeginState(RampPrevStateName);
        IncrementFlashCount();
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        global.Tick(DeltaTime);
        // End:0x9D
        if(!IsTimerActive('RampedUp'))
        {
            // End:0x9D
            if(Instigator.IsLocallyControlled())
            {
                CurrentOverheatLevel = FMin(CurrentOverheatLevel + (DeltaTime * (GetOverheatSpeed())), 100.0000000);
                // End:0x9D
                if(CurrentOverheatLevel == 100.0000000)
                {
                    SetOverheated(true);
                }
            }
        }
        // End:0xD3
        if(!StillFiring(CurrentFireMode))
        {
            ClearTimer('RampedUp');
            HandleFinishedFiring();
        }
        //return;        
    }

    simulated function BeginFire()
    {
        local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

        super(Weapon).BeginFire(FireModeNum);
        // End:0x2F
        if(int(FireModeNum) == 2)
        {
            HandleFinishedFiring();
        }
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        ClearArcTargets();
        ClearFlashCount();
        ClearPendingFire(int(CurrentFireMode));
        super.EndState(NextStateName);
        //return;        
    }

    simulated function GetWeaponAmmoFillPercent()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        // End:0x49
        if(IsTimerActive('RampedUp'))
        {
            return (GetTimerCount('RampedUp') * 100.0000000) / GetTimerRate('RampedUp');
        }
        return 100.0000000;
        //return ReturnValue;        
    }
    stop;    
}

defaultproperties
{
    OverheatFXEventName="Overheat"
    OverheatSoundClientEventName="OverheatSound_ForClients"
    OverheatSoundLocalPlayerEventName="OverheatSound_ForLocalPlayers"
    bRequiresInputForNewPickup=true
    // Reference: StaticMeshComponent'Default__LPWeaponParticleThrower.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponParticleThrower.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="particleThrower"
    HUDReticleName="particleThrower"
    HUDReticleName_SecondaryAmmomode="particleThrower"
    FriendlyName="Particle Thrower"
    Description="A weapon that projects a constant beam of superconductive particles. Can overheat."
    WeaponFireTypes=/* Array type was not detected. */
    EquipTime=0.2500000
    // Reference: SkeletalMeshComponent'Default__LPWeaponParticleThrower.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Particle Thrower"
    // Reference: StaticMeshComponent'Default__LPWeaponParticleThrower.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
}