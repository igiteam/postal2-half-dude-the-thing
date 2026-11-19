class LPWeaponPistol extends LPWeapon
    abstract
    config(Weapon)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentTaggedTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastTaggedTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExtractedTarget;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL LaserComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LaserEffect;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LaserTarget;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TagSoundClientEventName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TagSoundLocalPlayerEventName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TagCompleteSoundClientEventName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TagCompleteSoundLocalPlayerEventName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TagHitSoundClientEventName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name TagHitSoundLocalPlayerEventName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastChargeTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastConnectTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastDisconnectTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastHoverStartTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastHoverTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsTagConnected;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsTagUIVisible;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseTaggingBeam;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DisconnectTagTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReconnectTagTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DisconnectUITime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ReconnectUITime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HUDIconVisibleRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TagAimAssistMultiplier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TagForceFeedback;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoReloadAttemptFrequency;

// Export ULPWeaponPistol::execCanUseOffHandIKController(FFrame&, void* const)
native simulated function CanUseOffHandIKController()
{
    local /*0x97E50000-0x00000000*/ private byte UsersAimState[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPWeaponPistol::execGetFrictionMultiplierMax(FFrame&, void* const)
native simulated function GetFrictionMultiplierMax()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609], tdp;

    super.InitTuneData(TuneData);
    tdp = LPTuneDataWeaponPistol(TuneData);
    // End:0x22A
    if(tdp != none)
    {
        DisconnectTagTime = tdp.DisconnectTagTime.GetValue();
        ReconnectTagTime = tdp.ReconnectTagTime.GetValue();
        DisconnectUITime = tdp.DisconnectUITime.GetValue();
        ReconnectUITime = tdp.ReconnectUITime.GetValue();
        HUDIconVisibleRange = tdp.HUDIconVisibleRange.GetValue();
        TagAimAssistMultiplier = tdp.TagAimAssistMultiplier.GetValue();
        TagForceFeedback = tdp.TagForceFeedback;
        LaserEffect = tdp.LaserEffect;
        AutoReloadAttemptFrequency = tdp.AutoReloadAttemptFrequency;
    }
    //return;    
}

simulated function CalcRemoteImpactEffects()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GivenHitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];

    AbortWeaponReload(true);
    super(SPInventoryWeapon).CalcRemoteImpactEffects(FireModeNum, GivenHitLocation, bViaReplication);
    //return;    
}

simulated function StartFire()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

    // End:0x83
    if((WorldInfo.TimeSeconds - LastChargeTime) > 0.1000000)
    {
        // End:0x70
        if(((IsDNATaggerActive()) && int(FireModeNum) == 0) && CurrentTaggedTarget != none)
        {
            FireModeNum = 1;
        }
        super(SPGFWeapon).StartFire(FireModeNum);
    }
    //return;    
}

simulated function StopFire()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

    // End:0x2E
    if(int(CurrentFireMode) != int(FireModeNum))
    {
        FireModeNum = CurrentFireMode;
    }
    super(SPGFWeapon).StopFire(FireModeNum);
    //return;    
}

simulated function ConsumeAmmo()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];

    // End:0x48
    if((int(FireModeNum) == 1) || (WorldInfo.TimeSeconds - LastChargeTime) <= 0.1000000)
    {
        return;
    }
    super(SPGFWeapon).ConsumeAmmo(FireModeNum);
    //return;    
}

simulated function FireAmmunition()
{
    // End:0x35
    if((WorldInfo.TimeSeconds - LastChargeTime) <= 0.1000000)
    {
        return;
    }
    super.FireAmmunition();
    //return;    
}

simulated function HasAmmo()
{
    local /*0x97E50000-0x00000000*/ private byte FireModeNum[8388609];
    local /*0x97E50000-0x00000000*/ private int Amount[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x23
    if((IsDNATaggerActive()) && int(FireModeNum) == 1)
    {
        return true;
    }
    return super(SPGFWeapon).HasAmmo(FireModeNum, Amount);
    //return ReturnValue;    
}

simulated function GetDNATaggableActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609], ReturnValue;

    // End:0x40
    if(LPCoreShield(inActor) != none)
    {
        return LPCoreShield(inActor).MyAkridPawn;
    }
    // End:0x80
    if(LPVSPlayerPawn(inActor) != none)
    {
        return LPVSPlayerPawn(inActor).GrabbedPawn;
    }
    return inActor;
    //return ReturnValue;    
}

simulated function ProcessInstantHit()
{
    local /*0x97E50000-0x00000000*/ private byte FiringMode[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Impact[8388609];
    local /*0x97E50000-0x00000000*/ private int NumHits[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL DNATaggedActor;

    super.ProcessInstantHit(FiringMode, Impact, NumHits);
    DNATaggedActor = GetDNATaggableActor(Impact.HitActor);
    // End:0xDC
    if((IsDNATaggerActive()) && IsActorDNATagged(DNATaggedActor))
    {
        AddDNATagHUDElement(DNATaggedActor);
        IncrementNumTimesTagged(DNATaggedActor);
        // End:0xDC
        if(bUseTaggingBeam)
        {
            bIsTagConnected = true;
            SetCurrentTaggedTarget(DNATaggedActor);
            GotoState('WeaponFiringCharge');
        }
    }
    //return;    
}

simulated function UpdateHoverActor()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPP, AimController, AimCollisionActor;
    local /*0x97E50000-0x00000000*/ private bool bIsDoingSpecialMove;

    LPPP = LPPlayerPawn(Instigator);
    // End:0x2D
    if(LPPP == none)
    {
        return;
    }
    AimController = SPGFAimControlPlayerControlled(LPPP.AimController);
    AimCollisionActor = (((AimController != none) && AmmoTypeInfo.CurrentAmmoMode == 1) ? AimController.GetAimCollisionActor() : none);
    // End:0x169
    if(IsActorDNATagged(AimCollisionActor))
    {
        LastHoverTime = WorldInfo.TimeSeconds;
        LastHoverStartTime = ((CurrentTaggedTarget == none) ? LastHoverTime : LastHoverStartTime);
        LaserTarget = AimController.GetAimCollisionPoint();
        SetCurrentTaggedTarget(AimCollisionActor);        
    }
    else
    {
        // End:0x203
        if(bIsTagConnected && (WorldInfo.TimeSeconds - LastHoverTime) > DisconnectTagTime)
        {
            LastDisconnectTime = WorldInfo.TimeSeconds;
            bIsTagConnected = false;
            StopTagForceFeedback();
            StopTagAudio();
            SetCurrentTaggedTarget();
        }
    }
    // End:0x34F
    if(CurrentTaggedTarget != none)
    {
        bIsDoingSpecialMove = SPPawn(Instigator).IsDoingASpecialMove();
        // End:0x31A
        if((bIsTagConnected || (WorldInfo.TimeSeconds - LastHoverStartTime) >= ReconnectTagTime) && !bIsDoingSpecialMove)
        {
            // End:0x2BC
            if(!IsInState('WeaponFiringCharge'))
            {
                GotoState('WeaponFiringCharge');
            }
            bIsTagConnected = true;
            LastConnectTime = WorldInfo.TimeSeconds;
            UpdateTaggedTime(DeltaTime);
            StartTagForceFeedback();
            StartTagAudio();            
        }
        else
        {
            // End:0x34F
            if(bIsDoingSpecialMove)
            {
                LastHoverStartTime = WorldInfo.TimeSeconds;
            }
        }
    }
    //return;    
}

simulated function UpdateTaggedTime()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TaggedPawn, TaggedHiveSpawner, TaggedNesting;
    local /*0x97E50000-0x00000000*/ private bool bDNAExtracted;

    bDNAExtracted = false;
    TaggedPawn = LPPawn(CurrentTaggedTarget);
    // End:0x16A
    if(TaggedPawn != none)
    {
        TaggedPawn.TaggedTime = FMin(TaggedPawn.TaggedTime + DeltaTime, TaggedPawn.TuneDataPawn.RequiredTagHoverTime.GetValue());
        // End:0x16A
        if(TaggedPawn.TaggedTime == TaggedPawn.TuneDataPawn.RequiredTagHoverTime.GetValue())
        {
            TaggedPawn.DNAExtracted(Instigator);
            bDNAExtracted = true;
        }
    }
    TaggedNesting = LPDestructibleNesting(CurrentTaggedTarget);
    // End:0x29E
    if(TaggedNesting != none)
    {
        TaggedNesting.TaggedTime = FMin(TaggedNesting.TaggedTime + DeltaTime, TaggedNesting.RequiredTagHoverTime.GetValue());
        // End:0x29E
        if(TaggedNesting.TaggedTime == TaggedNesting.RequiredTagHoverTime.GetValue())
        {
            TaggedNesting.DNAExtracted(Instigator);
            bDNAExtracted = true;
        }
    }
    TaggedHiveSpawner = LPHiveSpawnPoint(CurrentTaggedTarget);
    // End:0x3FC
    if(TaggedHiveSpawner != none)
    {
        TaggedHiveSpawner.TaggedTime = FMin(TaggedHiveSpawner.TaggedTime + DeltaTime, TaggedHiveSpawner.HiveTuneData.RequiredTagHoverTime.GetValue());
        // End:0x3FC
        if(TaggedHiveSpawner.TaggedTime == TaggedHiveSpawner.HiveTuneData.RequiredTagHoverTime.GetValue())
        {
            TaggedHiveSpawner.DNAExtracted(Instigator);
            bDNAExtracted = true;
        }
    }
    // End:0x4BE
    if(bDNAExtracted)
    {
        ExtractedTarget = CurrentTaggedTarget;
        SetTimer(4.0000000, false, 'ClearExtractedTarget');
        CurrentTaggedTarget.TriggerEventClass(Class'LPSeqEvent_DNAExtracted', Instigator);
        SetCurrentTaggedTarget();
        TuneDataWeaponSoundEventBindings.PlayEventSoundLocally(TagCompleteSoundClientEventName, TagCompleteSoundLocalPlayerEventName, ((Owner == none) ? self : Owner), none, none);
    }
    //return;    
}

simulated function IncrementNumTimesTagged()
{
    local /*0x97E50000-0x00000000*/ private @NULL TaggedActor[8388609], TaggedHiveSpawner, TaggedNesting, TaggedPawn;
    local /*0x97E50000-0x00000000*/ private bool bDNAExtracted, bTagHitSomething;

    bDNAExtracted = false;
    bTagHitSomething = false;
    TaggedPawn = LPPawn(TaggedActor);
    // End:0x122
    if(TaggedPawn != none)
    {
        TaggedPawn.NumTimesTagged++;
        bTagHitSomething = true;
        // End:0x122
        if(!bUseTaggingBeam && float(TaggedPawn.NumTimesTagged) >= TaggedPawn.TuneDataPawn.RequiredNumTags.GetValue())
        {
            TaggedPawn.DNAExtracted(Instigator);
            bDNAExtracted = true;
        }
    }
    TaggedNesting = LPDestructibleNesting(TaggedActor);
    // End:0x217
    if(TaggedNesting != none)
    {
        TaggedNesting.NumTimesTagged++;
        bTagHitSomething = true;
        // End:0x217
        if(!bUseTaggingBeam && float(TaggedNesting.NumTimesTagged) >= TaggedNesting.RequiredNumTags.GetValue())
        {
            TaggedNesting.DNAExtracted(Instigator);
            bDNAExtracted = true;
        }
    }
    TaggedHiveSpawner = LPHiveSpawnPoint(TaggedActor);
    // End:0x321
    if(TaggedHiveSpawner != none)
    {
        TaggedHiveSpawner.NumTimesTagged++;
        bTagHitSomething = true;
        // End:0x321
        if(!bUseTaggingBeam && float(TaggedHiveSpawner.NumTimesTagged) >= TaggedHiveSpawner.HiveTuneData.RequiredNumTags.GetValue())
        {
            TaggedHiveSpawner.DNAExtracted(Instigator);
            bDNAExtracted = true;
        }
    }
    // End:0x3B4
    if(bDNAExtracted)
    {
        TaggedActor.TriggerEventClass(Class'LPSeqEvent_DNAExtracted', Instigator);
        TuneDataWeaponSoundEventBindings.PlayEventSoundLocally(TagCompleteSoundClientEventName, TagCompleteSoundLocalPlayerEventName, ((Owner == none) ? self : Owner), none, none);        
    }
    else
    {
        // End:0x410
        if(bTagHitSomething)
        {
            TuneDataWeaponSoundEventBindings.PlayEventSoundLocally(TagHitSoundClientEventName, TagHitSoundLocalPlayerEventName, ((Owner == none) ? self : Owner), none, none);
        }
    }
    //return;    
}

simulated function GetCurrentTagPercent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetTagPercent(CurrentTaggedTarget);
    //return ReturnValue;    
}

static function GetTagPercent()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL TaggedHiveSpawner, TaggedNesting, TaggedPawn;

    TaggedPawn = LPPawn(A);
    // End:0x126
    if(TaggedPawn != none)
    {
        // End:0xAC
        if(default.bUseTaggingBeam)
        {
            return 100.0000000 * (TaggedPawn.TaggedTime / TaggedPawn.TuneDataPawn.RequiredTagHoverTime.GetValue());            
        }
        else
        {
            return FMin(100.0000000, 100.0000000 * (float(TaggedPawn.NumTimesTagged) / TaggedPawn.TuneDataPawn.RequiredNumTags.GetValue()));
        }
    }
    TaggedNesting = LPDestructibleNesting(A);
    // End:0x222
    if(TaggedNesting != none)
    {
        // End:0x1BD
        if(default.bUseTaggingBeam)
        {
            return 100.0000000 * (TaggedNesting.TaggedTime / TaggedNesting.RequiredTagHoverTime.GetValue());            
        }
        else
        {
            return FMin(100.0000000, 100.0000000 * (float(TaggedNesting.NumTimesTagged) / TaggedNesting.RequiredNumTags.GetValue()));
        }
    }
    TaggedHiveSpawner = LPHiveSpawnPoint(A);
    // End:0x348
    if(TaggedHiveSpawner != none)
    {
        // End:0x2CE
        if(default.bUseTaggingBeam)
        {
            return 100.0000000 * (TaggedHiveSpawner.TaggedTime / TaggedHiveSpawner.HiveTuneData.RequiredTagHoverTime.GetValue());            
        }
        else
        {
            return FMin(100.0000000, 100.0000000 * (float(TaggedHiveSpawner.NumTimesTagged) / TaggedHiveSpawner.HiveTuneData.RequiredNumTags.GetValue()));
        }
    }
    return 0.0000000;
    //return ReturnValue;    
}

simulated function IsDNATaggerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return AmmoTypeInfo.CurrentAmmoMode == 1;
    //return ReturnValue;    
}

simulated function IsActorDNATagged()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (A != none) && ((((LPPawn(A) != none) && LPPawn(A).bIsDNATagged) || (LPCoreShield(A) != none) && LPCoreShield(A).MyAkridPawn.bIsDNATagged) || (LPDestructibleNesting(A) != none) && LPDestructibleNesting(A).bIsDNATagged) || (LPHiveSpawnPoint(A) != none) && LPHiveSpawnPoint(A).bIsDNATagged;
    //return ReturnValue;    
}

static function ShouldShowDNATag()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL P, CS, DN, HSP;

    // End:0x296
    if(A != none)
    {
        P = LPPawn(A);
        // End:0xA2
        if(P != none)
        {
            return (P.bIsDNATagged || P.bWasDNATagged) && P.IsAlive();
        }
        CS = LPCoreShield(A);
        // End:0x16E
        if(CS != none)
        {
            P = CS.MyAkridPawn;
            return ((P != none) && P.bIsDNATagged || P.bWasDNATagged) && P.IsAlive();
        }
        DN = LPDestructibleNesting(A);
        // End:0x201
        if(DN != none)
        {
            return (DN.bIsDNATagged || DN.bWasDNATagged) && DN.IsAlive();
        }
        HSP = LPHiveSpawnPoint(A);
        // End:0x296
        if(HSP != none)
        {
            return (HSP.bIsDNATagged || HSP.bWasDNATagged) && HSP.Health > 0;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function SetCurrentTaggedTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL A[9437185];
    local /*0x97E50000-0x00000000*/ private bool bClearLastTarget[9437185];

    false
    CurrentTaggedTarget = GetDNATaggableActor(A);
    LastTaggedTarget = (((CurrentTaggedTarget != none) || bClearLastTarget) ? CurrentTaggedTarget : LastTaggedTarget);
    //return;    
}

simulated function ClearExtractedTarget()
{
    ExtractedTarget = none;
    //return;    
}

simulated function AddDNATagHUDElement()
{
    local /*0x97E50000-0x00000000*/ private @NULL TaggedTarget[8388609], PC;

    // End:0xAE
    if(Instigator != none)
    {
        // End:0xAE
        if(Instigator.IsLocallyControlled())
        {
            PC = LPPlayerController(Instigator.Controller);
            // End:0xAE
            if(PC != none)
            {
                PC.myLPHUD.CreateDNATag(TaggedTarget);
            }
        }
    }
    //return;    
}

simulated function StartTagForceFeedback()
{
    SetTagForceFeedback(true);
    //return;    
}

simulated function StopTagForceFeedback()
{
    SetTagForceFeedback(false);
    //return;    
}

simulated function SetTagForceFeedback()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PC;

    // End:0xFF
    if(Instigator != none)
    {
        // End:0xFF
        if(Instigator.IsLocallyControlled())
        {
            PC = LPPlayerController(Instigator.Controller);
            // End:0xFF
            if(PC != none)
            {
                // End:0xD7
                if(bOn)
                {
                    // End:0xD4
                    if(!PC.IsForceFeedbackWaveformPlaying(TagForceFeedback))
                    {
                        PC.ClientPlayForceFeedbackWaveform(TagForceFeedback);
                    }                    
                }
                else
                {
                    PC.ClientStopForceFeedbackWaveform(TagForceFeedback);
                }
            }
        }
    }
    //return;    
}

simulated function @NULL StartTagAudio()
{
    local /*0x97E50000-0x00000400*/ private @NULL AC, AkC;

    // End:0x12F
    if((FireLoopAC == none) || !FireLoopAC.IsPlaying())
    {
        FireLoopAC = TuneDataWeaponSoundEventBindings.PlayEventSoundLocallyEx(TagSoundClientEventName, TagSoundLocalPlayerEventName, ((Owner == none) ? self : Owner), none, none, FireLoopAC);
        AC = AudioComponent(FireLoopAC);
        // End:0xE3
        if(AC != none)
        {
            AC.bStopWhenOwnerDestroyed = true;
        }
        AkC = AkComponent(FireLoopAC);
        // End:0x12F
        if(AkC != none)
        {
            AkC.bStopWhenOwnerDestroyed = true;
        }
    }
    //return;    
}

simulated function StopTagAudio()
{
    // End:0x2E
    if(FireLoopAC != none)
    {
        FireLoopAC.Stop();
    }
    //return;    
}

simulated function ResumeInterruptedReload()
{
    // End:0x3C
    if((ShouldAutoReload()) && CanReload())
    {
        BeginFire(2);
        ClearTimer('ResumeInterruptedReload');
    }
    //return;    
}

simulated state Active
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x80
        if(((PreviousStateName != 'Reloading') && PendingFire(2) || ShouldAutoReload()) && FiringStatesArray[2] != 'None')
        {
            // End:0x71
            if(CanReload())
            {
                BeginFire(2);
                return;                
            }
            else
            {
                ClearPendingFire(2);
            }            
        }
        else
        {
            // End:0x9B
            if(AmmoLeftInMagazine <= 0)
            {
                SetWantsToResumeReloadAfterInterruption(true, true);
            }
            super.BeginState(PreviousStateName);
        }
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super.Tick(DeltaTime);
        // End:0x42
        if(bUseTaggingBeam && IsDNATaggerActive())
        {
            UpdateHoverActor(DeltaTime);
        }
        //return;        
    }
    stop;    
}

simulated state WeaponFiringCharge
{
    ignores FireAmmunition, ConsumeAmmo;

    simulated event @NULL BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];
        local /*0x97E50000-0x00000400*/ private @NULL SkelMesh;

        // End:0x10B
        if(int(WorldInfo.NetMode) != int(NM_DedicatedServer))
        {
            // End:0x7D
            if(LaserComponent.Template != LaserEffect)
            {
                LaserComponent.SetTemplate(LaserEffect);
            }
            SkelMesh = SkeletalMeshComponent(Mesh);
            // End:0xF8
            if(!SkelMesh.IsComponentAttached(LaserComponent))
            {
                SkelMesh.AttachComponentToSocket(LaserComponent, MuzzleFlashSocketName);
            }
            SetTimer(0.1000000, true, 'ApplyExtractDamage');
        }
        //return;        
    }

    simulated function ApplyExtractDamage()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitInfo, StartTrace, EndTrace;

        // End:0x136
        if(bIsTagConnected)
        {
            SkeletalMeshComponent(Mesh).GetSocketWorldLocationAndRotation(MuzzleFlashSocketName, StartTrace);
            EndTrace = StartTrace + (Vector(GetAdjustedAim(StartTrace)) * (GetTraceRange()));
            HitInfo = CalcWeaponFire(StartTrace, EndTrace);
            // End:0x136
            if((HitInfo.HitLocation != EndTrace) && HitInfo.HitLocation != vect(0.0000000, 0.0000000, 0.0000000))
            {
                CurrentFireMode = 4;
                ProcessInstantHit(CurrentFireMode, HitInfo);
                CurrentFireMode = 1;
            }
        }
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        super(SPInventoryWeapon).Tick(DeltaTime);
        // End:0x33
        if(bUseTaggingBeam)
        {
            UpdateHoverActor(DeltaTime);
        }
        // End:0x96
        if((!StillFiring(CurrentFireMode) && !bIsTagConnected) || SPPawn(Instigator).IsDoingASpecialMove())
        {
            HandleFinishedFiring();            
        }
        else
        {
            LaserComponent.SetVectorParameter('BeamTarget', LaserTarget);
            LaserComponent.SetActive(bIsTagConnected);
        }
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        bIsTagConnected = false;
        CurrentFireMode = 0;
        LastChargeTime = WorldInfo.TimeSeconds;
        LaserComponent.SetActive(false);
        StopTagForceFeedback();
        StopTagAudio();
        ClearTimer('ApplyExtractDamage');
        //return;        
    }

    simulated function CanSwitchWeapon()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function CanSwitchAmmoTypes()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function ForceReload()
    {
        // End:0x1B
        if(CanReload())
        {
            GotoState('Active');
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    TagSoundClientEventName="DNATaggingSoundLooping_ForClients"
    TagSoundLocalPlayerEventName="DNATaggingSoundLooping_ForLocalPlayers"
    TagCompleteSoundClientEventName="DNATaggedSound_ForClients"
    TagCompleteSoundLocalPlayerEventName="DNATaggedSound_ForLocalPlayers"
    TagHitSoundClientEventName="DNATagHitSound_ForClients"
    TagHitSoundLocalPlayerEventName="DNATagHitSound_ForLocalPlayers"
    bUseTaggingBeam=true
    bAllowTracers=true
    bRequiresInputForNewPickup=true
    // Reference: StaticMeshComponent'Default__LPWeaponPistol.StowedStaticMeshComponent'
    begin object name=StowedStaticMeshComponent
    end object
    StowedMeshComponent=StowedStaticMeshComponent
    // Reference: StaticMeshComponent'Default__LPWeaponPistol.StowedEquippedStaticMeshComponent'
    begin object name=StowedEquippedStaticMeshComponent
    end object
    StowEquippedMeshComponent=StowedEquippedStaticMeshComponent
    HUDIconName="nevecPistol"
    HUDReticleName="nevecPistol"
    HUDReticleName_SecondaryAmmomode="nevecPistol"
    FriendlyName="Pistol"
    Description="Pistol"
    EquipTime=0.2500000
    bCanThrow=false
    // Reference: SkeletalMeshComponent'Default__LPWeaponPistol.WeaponSkeletalMesh'
    begin object name=WeaponSkeletalMesh
    end object
    Mesh=WeaponSkeletalMesh
    PickupMessage="Pistol Rounds"
    // Reference: StaticMeshComponent'Default__LPWeaponPistol.DroppedPickupStaticMeshComponent'
    begin object name=DroppedPickupStaticMeshComponent
    end object
    DroppedPickupMesh=DroppedPickupStaticMeshComponent
    Components[0]=WeaponSkeletalMesh
    SupportedEvents=/* Array type was not detected. */
}