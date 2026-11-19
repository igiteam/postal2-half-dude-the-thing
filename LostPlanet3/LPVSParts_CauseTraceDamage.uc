class LPVSParts_CauseTraceDamage extends LPVSInventoryParts
    abstract
    hidecategories(AnimDependency,Navigation);

const MAX_IMPACT_PARTICLE_SYSTEMS = 4;

struct native ImpactEmitterEntry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Emitter;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStamp;

    structdefaultproperties
    {
        Emitter=none
        TimeStamp=0.0000000
    }
};

struct native RightArmMinigameStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ModerateDamageBoostAngle;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FullDamageBoostAngle;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageModifier;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TargetSoundEventValue;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentSoundEventValue;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillAnimSpeed;

    structdefaultproperties
    {
        ModerateDamageBoostAngle=0.0000000
        FullDamageBoostAngle=0.0000000
        DamageModifier=0.0000000
        TargetSoundEventValue=0.0000000
        CurrentSoundEventValue=0.0000000
        DrillAnimSpeed=0.0000000
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DamagePerSecond;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageRemainder;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ImpactEmitterList[4];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ImpactParticleSystem;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL ImpactDecal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TraceRepeatPeriod;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeTilNextTrace;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ImpactLoopSoundInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ImpactEndSoundInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL ImpactSoundComponentInfo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RightArmMinigameInfo;

function ImpactEmitters_Init()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x139 [Loop If]
    if(I < 4)
    {
        // End:0x12B
        if((ImpactEmitterList[I].Emitter == none) || ImpactEmitterList[I].Emitter.IsPendingKill())
        {
            ImpactEmitterList[I].Emitter = Spawn(Class'SPEngine.SPEmitterSpawnable');
            ImpactEmitterList[I].Emitter.ParticleSystemComponent.__OnSystemFinished__Delegate = ParticleSystemFinished;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function ImpactEmitters_Cleanup()
{
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0xBD [Loop If]
    if(I < 4)
    {
        ImpactEmitterList[I].Emitter.ParticleSystemComponent.__OnSystemFinished__Delegate = ImpactEmitterList[I].Emitter.OnParticleSystemFinished;
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function ImpactEmitters_GetEmitterForSystem()
{
    local /*0x97E50000-0x00000000*/ private @NULL PS[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0xA8
    if(PS != none)
    {
        I = 0;
        J0x1A:

        // End:0xA8 [Loop If]
        if(I < 4)
        {
            // End:0x9A
            if(ImpactEmitterList[I].Emitter.ParticleTemplate == PS)
            {
                return ImpactEmitterList[I].Emitter;
            }
            ++I;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    return none;
    //return ReturnValue;    
}

function @NULL ImpactEmitters_GetEmitterForComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL PSC[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0xA8
    if(PSC != none)
    {
        I = 0;
        J0x1A:

        // End:0xA8 [Loop If]
        if(I < 4)
        {
            // End:0x9A
            if(ImpactEmitterList[I].Emitter.ParticleSystemComponent == PSC)
            {
                return ImpactEmitterList[I].Emitter;
            }
            ++I;
            // [Loop Continue]
            goto J0x1A;
        }
    }
    return none;
    //return ReturnValue;    
}

function ImpactEmitters_GetAvailableEmmitter()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I, Oldest;
    local /*0x97E50000-0x00000000*/ private float LongestTime, TimePassed, CurTime;

    CurTime = MyLPPawn.WorldInfo.TimeSeconds;
    LongestTime = 0.0000000;
    Oldest = 0;
    I = 0;
    J0x62:

    // End:0x160 [Loop If]
    if(I < 4)
    {
        // End:0xDA
        if(ImpactEmitterList[I].Emitter.ParticleTemplate == none)
        {
            return ImpactEmitterList[I].Emitter;
        }
        TimePassed = CurTime - ImpactEmitterList[I].TimeStamp;
        // End:0x152
        if(TimePassed > LongestTime)
        {
            Oldest = I;
            LongestTime = TimePassed;
        }
        ++I;
        // [Loop Continue]
        goto J0x62;
    }
    ImpactEmitterList[Oldest].TimeStamp = CurTime;
    return ImpactEmitterList[Oldest].Emitter;
    //return ReturnValue;    
}

function Init()
{
    super.Init();
    DamagePerSecond = int(TuneDataVSParts.DamagePerSecond.GetValue());
    ImpactEmitters_Init();
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideType = 2;
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideValue = 100000000000000000.0000000;
    //return;    
}

simulated function Destroyed()
{
    super.Destroyed();
    ImpactEmitters_Cleanup();
    // End:0x4D
    if(LoopingSoundComponent != none)
    {
        LoopingSoundComponent.DetachFromAny();
        LoopingSoundComponent = none;
    }
    // End:0x86
    if(StartSoundComponent != none)
    {
        StartSoundComponent.DetachFromAny();
        StartSoundComponent = none;
    }
    // End:0xBF
    if(EndSoundComponent != none)
    {
        EndSoundComponent.DetachFromAny();
        EndSoundComponent = none;
    }
    // End:0x131
    if(ImpactSoundComponentInfo.SoundCueAudioComponent != none)
    {
        ImpactSoundComponentInfo.SoundCueAudioComponent.DetachFromAny();
        ImpactSoundComponentInfo.SoundCueAudioComponent = none;
    }
    // End:0x1A3
    if(ImpactSoundComponentInfo.SoundAkComponent != none)
    {
        ImpactSoundComponentInfo.SoundAkComponent.DetachFromAny();
        ImpactSoundComponentInfo.SoundAkComponent = none;
    }
    //return;    
}

function TakeArmOut()
{
    super.TakeArmOut();
    PlayStartSound();
    //return;    
}

function PutArmAway()
{
    super.PutArmAway();
    EndLoopSound();
    PlayEndSound();
    //return;    
}

function WeaponTrace()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[25165825], HitNormal, EndLocation, StartLocation;
    local /*0x97E50000-0x00000000*/ private editfixedsize array PassedThroughActors[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[26214401], ReturnValue, HitActor;

    // End:0x1AA
    foreach MyLPPawn.TraceActors(Class'Engine.Actor', HitActor, HitLocation, HitNormal, EndLocation, StartLocation, GetExtent(), HitInfo, 1)
    {
        // End:0xA7
        if((MyLPPawn != none) && MyLPPawn == HitActor.Base)
        {
            continue;            
        }
        // End:0x19E
        if((((!HitActor.bBlockActors && HitActor.IsA('Trigger') || HitActor.IsA('TriggerVolume')) || HitActor.IsA('InteractiveFoliageActor')) || HitActor.IsA('LPWaypointMarker')) || HitActor.IsA('LPBreadcrumb'))
        {
            PassedThroughActors.AddItem(HitActor);            
            continue;            
        }        
        return HitActor;        
    }    
    return none;
    //return ReturnValue;    
}

function TraceDamageCollisionCheck()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL WorldAimPoint, TraceStartLoc, TraceStartRot, TraceDirection;
    local /*0x97E50000-0x00000000*/ private float CollisionTraceLength;
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation, HitNormal, TraceEnd, TraceStart, HitActor, OutHitInfo,
	    WorldAimDir, SPPhysMat;

    local /*0x97E50000-0x00000000*/ private int DamageAmountInt;
    local /*0x97E50000-0x00000000*/ private float DamageAmountFloat;
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn, instigatorForHit, ShieldFracture, ShieldFractureDamageInfo;
    local /*0x97E50000-0x00000000*/ private float reachDist;
    local /*0x97E50000-0x00000000*/ private @NULL CameraMgr, CurrentViewRot, CurrentViewLoc;
    local /*0x97E50000-0x00000000*/ private editfixedsize array PassThroughActors;
    local /*0x97E50000-0x00000000*/ private int Idx;

    TimeTilNextTrace -= DeltaTime;
    // End:0x29
    if(TimeTilNextTrace > 0.0000000)
    {
        return;
    }
    // End:0x4E
    if(TraceRepeatPeriod <= 0.0000000)
    {
        TimeTilNextTrace = 0.0000000;        
    }
    else
    {
        DeltaTime = TraceRepeatPeriod - TimeTilNextTrace;
        TimeTilNextTrace = TraceRepeatPeriod;
    }
    ImpactLoopSoundInfo.SoundCue = none;
    ImpactParticleSystem.ParticleSystem = none;
    ImpactDecal.DecalMaterials.Length = 0;
    // End:0xB00
    if(OwnersArmPartInfo.bTipDamageEnabled && int(PartState) == int(2))
    {
        CollisionTraceLength = TuneDataVSParts.DamageTraceLength;
        WorldAimPoint = MyLPPawn.AimController.GetAimCollisionPoint();
        WorldAimDir = MyLPPawn.AimController.GetWorldAimDir();
        WeaponMeshComp.GetSocketWorldLocationAndRotation(DamageTraceSocketName, TraceStartLoc, TraceStartRot);
        // End:0x43E
        if(OwnersArmPartInfo.bApplyDamageAtCrosshair)
        {
            // End:0x2D6
            if(VSizeSq(WorldAimPoint - MyLPPawn.Location) < VSizeSq(TraceStartLoc - MyLPPawn.Location))
            {
                TraceDirection = WorldAimDir;
                TraceStart = WorldAimPoint - (TraceDirection * CollisionTraceLength);
                TraceEnd = WorldAimPoint + (TraceDirection * CollisionTraceLength);                
            }
            else
            {
                CurrentViewRot = MyLPPawn.Rotation;
                CameraMgr = SPPlayerCameraManager(LPPlayerController(MyLPPawn.Controller).PlayerCamera);
                // End:0x38D
                if(CameraMgr != none)
                {
                    CameraMgr.GetCameraViewPoint(CurrentViewLoc, CurrentViewRot);
                }
                TraceDirection = WorldAimDir;
                reachDist = VSize(TraceStartLoc - CurrentViewLoc);
                WorldAimPoint = CurrentViewLoc + (WorldAimDir * reachDist);
                TraceStart = WorldAimPoint - (TraceDirection * CollisionTraceLength);
                TraceEnd = WorldAimPoint + (TraceDirection * CollisionTraceLength);
            }            
        }
        else
        {
            TraceDirection = Vector(TraceStartRot);
            TraceStart = TraceStartLoc - (TraceDirection * CollisionTraceLength);
            TraceEnd = TraceStartLoc + (TraceDirection * CollisionTraceLength);
        }
        // End:0x4F4
        if(MyLPPawn.Controller != none)
        {
            instigatorForHit = MyLPPawn.Controller;            
        }
        else
        {
            instigatorForHit = LPVSPlayerPawn(MyLPPawn).LastDriver;
        }
        HitActor = WeaponTrace(HitLocation, HitNormal, TraceEnd, TraceStart, PassThroughActors, OutHitInfo);
        Idx = 0;
        J0x57A:

        // End:0x61C [Loop If]
        if(Idx < PassThroughActors.Length)
        {
            PassThroughActors[Idx].TakeDamage(FCeil(GetDamageAmount(DeltaTime)), instigatorForHit, HitLocation, TraceDirection, PartDamageType, OutHitInfo, MyLPPawn);
            Idx++;
            // [Loop Continue]
            goto J0x57A;
        }
        HitPawn = LPPawn(HitActor);
        // End:0x69E
        if(HitActor == none)
        {
            // End:0x69B
            if(ForceFeedback != TuneDataVSParts.ForceFeedbackDefault)
            {
                ForceFeedback = TuneDataVSParts.ForceFeedbackDefault;
            }            
        }
        else
        {
            // End:0x6F2
            if(ForceFeedback == TuneDataVSParts.ForceFeedbackDefault)
            {
                ForceFeedback = TuneDataVSParts.ForceFeedbackNormalHit;
            }
            SPPhysMat = SPPhysicalMaterial(Class'SPEngine.SPPhysicalMaterialProperty'.static.GetTraceHitInfoPhysicalMaterial(OutHitInfo));
            // End:0x805
            if(SPPhysMat != none)
            {
                ImpactLoopSoundInfo = SPPhysMat.GetImpactSound(PartDamageType);
                ImpactEndSoundInfo = SPPhysMat.GetSecondaryImpactSound(PartDamageType);
                ImpactParticleSystem = SPPhysMat.GetImpactFX(PartDamageType);
                ImpactDecal = SPPhysMat.GetImpactDecal(PartDamageType);
            }
            DamageAmountFloat = GetDamageAmount(DeltaTime);
            DamageAmountInt = int(DamageAmountFloat);
            DamageRemainder = DamageAmountFloat - float(DamageAmountInt);
            // End:0xB00
            if(MyLPPawn.IsLocallyControlled())
            {
                MyLPPawn.DebugTraceDamageActor = HitActor;
                // End:0x9E2
                if(((int(MyLPPawn.WorldInfo.NetMode) != int(NM_Client)) || int(HitActor.Role) == int(ROLE_Authority)) || int(HitActor.Role) == int(ROLE_None))
                {
                    HitActor.TakeDamage(DamageAmountInt, instigatorForHit, HitLocation, TraceDirection, PartDamageType, OutHitInfo, MyLPPawn);
                    MyLPPawn.NotifyTraceDamagePartHitSomething(HitActor, HitLocation, DamageAmountInt, PartDamageType, OutHitInfo);                    
                }
                else
                {
                    ShieldFracture = LPShieldFracture(HitActor);
                    // End:0xAA2
                    if(ShieldFracture != none)
                    {
                        // End:0xA9F
                        if(ShieldFracture.GetDamageInfo(ShieldFractureDamageInfo, DamageAmountInt, instigatorForHit, HitLocation, TraceDirection, PartDamageType, OutHitInfo, MyLPPawn))
                        {
                            MyLPPawn.ServerDoTraceDamageOnShieldFracture(ShieldFractureDamageInfo);
                        }                        
                    }
                    else
                    {
                        MyLPPawn.ServerDoTraceDamage(HitActor, DamageAmountInt, instigatorForHit, HitLocation, TraceDirection, PartDamageType, OutHitInfo);
                    }
                }
            }
        }
    }
    // End:0xB53
    if((HitPawn == none) || HitPawn.Health <= 0)
    {
        BeginImpactFXAtLocation(HitLocation, Rotator(HitNormal));
    }
    // End:0xBA6
    if((ImpactLoopSoundInfo.SoundCue != none) || ImpactLoopSoundInfo.SoundAkEvent != none)
    {
        BeginImpactEffects();        
    }
    else
    {
        EndImpactEffects();
    }
    //return;    
}

function GetDamageRate()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return float(DamagePerSecond);
    //return ReturnValue;    
}

function GetDamageAmount()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], ReturnValue, DamageRate;

    DamageRate = GetDamageRate();
    return DamageRemainder + (DamageRate * DeltaTime);
    //return ReturnValue;    
}

function GetExtent()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return TuneDataVSParts.DamageTraceExtent;
    //return ReturnValue;    
}

function BeginImpactEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;

    // End:0x5F
    if(MyLPPawn != none)
    {
        vsPlayerPawn = LPVSPlayerPawn(MyLPPawn);
        // End:0x5F
        if(vsPlayerPawn != none)
        {
            vsPlayerPawn.SetVSReticleDrillSpeed("slow");
        }
    }
    BeginImpactSoundLoop();
    //return;    
}

function EndImpactEffects()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsPlayerPawn;

    // End:0x61
    if(MyLPPawn != none)
    {
        vsPlayerPawn = LPVSPlayerPawn(MyLPPawn);
        // End:0x61
        if(vsPlayerPawn != none)
        {
            vsPlayerPawn.SetVSReticleDrillSpeed("medium");
        }
    }
    EndImpactSoundLoop();
    //return;    
}

function BeginImpactSoundLoop()
{
    // End:0x101
    if(ImpactSoundComponentInfo.SoundCueAudioComponent != none)
    {
        // End:0x101
        if(ImpactSoundComponentInfo.SoundCueAudioComponent.IsPlaying() && (ImpactLoopSoundInfo.SoundCue == none) || ImpactSoundComponentInfo.SoundCueAudioComponent.SoundCue != ImpactLoopSoundInfo.SoundCue)
        {
            ImpactSoundComponentInfo.SoundCueAudioComponent.Stop();
        }
    }
    // End:0x2CF
    if(ImpactLoopSoundInfo.SoundCue != none)
    {
        // End:0x1A2
        if(ImpactSoundComponentInfo.SoundCueAudioComponent == none)
        {
            ImpactSoundComponentInfo.SoundCueAudioComponent = MyLPPawn.CreateAudioComponent(ImpactLoopSoundInfo.SoundCue, false, true);
        }
        // End:0x2CF
        if(ImpactSoundComponentInfo.SoundCueAudioComponent != none)
        {
            // End:0x2CF
            if(!ImpactSoundComponentInfo.SoundCueAudioComponent.IsPlaying() || ImpactSoundComponentInfo.SoundCueAudioComponent.SoundCue != ImpactLoopSoundInfo.SoundCue)
            {
                ImpactSoundComponentInfo.SoundCueAudioComponent.SoundCue = ImpactLoopSoundInfo.SoundCue;
                ImpactSoundComponentInfo.SoundCueAudioComponent.Play();
            }
        }
    }
    // End:0x3D0
    if(ImpactSoundComponentInfo.SoundAkComponent != none)
    {
        // End:0x3D0
        if(ImpactSoundComponentInfo.SoundAkComponent.IsPlaying() && (ImpactLoopSoundInfo.SoundAkEvent == none) || ImpactSoundComponentInfo.SoundAkComponent.PlayEvent != ImpactLoopSoundInfo.SoundAkEvent)
        {
            ImpactSoundComponentInfo.SoundAkComponent.Stop();
        }
    }
    // End:0x5AF
    if(ImpactLoopSoundInfo.SoundAkEvent != none)
    {
        // End:0x482
        if(ImpactSoundComponentInfo.SoundAkComponent == none)
        {
            ImpactSoundComponentInfo.SoundAkComponent = Class'AkAudio.AkComponent'.static.CreateAkComponent(ImpactLoopSoundInfo.SoundAkEvent, MyLPPawn, 'None', false, true, false);
        }
        // End:0x5AF
        if(ImpactSoundComponentInfo.SoundAkComponent != none)
        {
            // End:0x5AF
            if(!ImpactSoundComponentInfo.SoundAkComponent.IsPlaying() || ImpactSoundComponentInfo.SoundAkComponent.PlayEvent != ImpactLoopSoundInfo.SoundAkEvent)
            {
                ImpactSoundComponentInfo.SoundAkComponent.PlayEvent = ImpactLoopSoundInfo.SoundAkEvent;
                ImpactSoundComponentInfo.SoundAkComponent.Play();
            }
        }
    }
    //return;    
}

function EndImpactSoundLoop()
{
    ImpactLoopSoundInfo.SoundCue = none;
    // End:0xA7
    if(ImpactSoundComponentInfo.SoundCueAudioComponent != none)
    {
        // End:0xA7
        if(ImpactSoundComponentInfo.SoundCueAudioComponent.IsPlaying())
        {
            ImpactSoundComponentInfo.SoundCueAudioComponent.Stop();
        }
    }
    // End:0x127
    if(ImpactEndSoundInfo.SoundCue != none)
    {
        MyLPPawn.PlaySound(ImpactEndSoundInfo.SoundCue, true, true, true);
        ImpactEndSoundInfo.SoundCue = none;
    }
    ImpactLoopSoundInfo.SoundAkEvent = none;
    // End:0x1CE
    if(ImpactSoundComponentInfo.SoundAkComponent != none)
    {
        // End:0x1CE
        if(ImpactSoundComponentInfo.SoundAkComponent.IsPlaying())
        {
            ImpactSoundComponentInfo.SoundAkComponent.Stop();
        }
    }
    // End:0x24E
    if(ImpactEndSoundInfo.SoundAkEvent != none)
    {
        MyLPPawn.PlayAkEvent(ImpactEndSoundInfo.SoundAkEvent, true, true, true);
        ImpactEndSoundInfo.SoundAkEvent = none;
    }
    //return;    
}

simulated function UpdateForceFeedback()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    // End:0xFD
    if((MyLPPawn.IsLocallyControlled() && int(PartState) >= int(1)) && int(PartState) <= int(3))
    {
        LPC = LPPlayerController(MyLPPawn.Controller);
        // End:0xFD
        if(LPC != none)
        {
            // End:0xFD
            if((ForceFeedback != none) && !LPC.IsForceFeedbackWaveformPlaying(ForceFeedback))
            {
                LPC.LocalPlayForceFeedbackWaveform(ForceFeedback, MyLPPawn);
            }
        }
    }
    //return;    
}

function UpdateSound()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function PlayStartSound()
{
    // End:0x2E
    if(StartSoundComponent != none)
    {
        StartSoundComponent.Play();
    }
    MyLPPawn.SetTimer(TuneDataVSParts.DelayToStartLoopingSound, false, 'PlayLoopSound', self);
    //return;    
}

function PlayEndSound()
{
    // End:0x54
    if((EndSoundComponent != none) && !EndSoundComponent.IsPlaying())
    {
        EndSoundComponent.Play();
    }
    //return;    
}

function PlayLoopSound()
{
    // End:0x2E
    if(LoopingSoundComponent != none)
    {
        LoopingSoundComponent.Play();
    }
    //return;    
}

simulated function EndLoopSound()
{
    MyLPPawn.ClearTimer('PlayLoopSound', self);
    // End:0x57
    if(LoopingSoundComponent != none)
    {
        LoopingSoundComponent.Stop();
    }
    //return;    
}

function EndImpactLoopSound()
{
    ImpactLoopSoundInfo.SoundCue = none;
    // End:0xA7
    if(ImpactSoundComponentInfo.SoundCueAudioComponent != none)
    {
        // End:0xA7
        if(ImpactSoundComponentInfo.SoundCueAudioComponent.IsPlaying())
        {
            ImpactSoundComponentInfo.SoundCueAudioComponent.Stop();
        }
    }
    // End:0x127
    if(ImpactEndSoundInfo.SoundCue != none)
    {
        MyLPPawn.PlaySound(ImpactEndSoundInfo.SoundCue, true, true, true);
        ImpactEndSoundInfo.SoundCue = none;
    }
    ImpactLoopSoundInfo.SoundAkEvent = none;
    // End:0x1CE
    if(ImpactSoundComponentInfo.SoundAkComponent != none)
    {
        // End:0x1CE
        if(ImpactSoundComponentInfo.SoundAkComponent.IsPlaying())
        {
            ImpactSoundComponentInfo.SoundAkComponent.Stop();
        }
    }
    // End:0x24E
    if(ImpactEndSoundInfo.SoundAkEvent != none)
    {
        MyLPPawn.PlayAkEvent(ImpactEndSoundInfo.SoundAkEvent, true, true, true);
        ImpactEndSoundInfo.SoundAkEvent = none;
    }
    //return;    
}

function BeginImpactFXAtLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL Loc[8388609], Rot, decalmgr, CurEmitter, rot2, DecalMaterial;

    local /*0x97E50000-0x00000000*/ private float DecalScaleAlpha;

    // End:0x12F
    if(ImpactParticleSystem.ParticleSystem != none)
    {
        CurEmitter = ImpactEmitters_GetEmitterForSystem(ImpactParticleSystem.ParticleSystem);
        // End:0xB1
        if(CurEmitter == none)
        {
            CurEmitter = ImpactEmitters_GetAvailableEmmitter();
            CurEmitter.SetTemplate(ImpactParticleSystem.ParticleSystem);
        }
        CurEmitter.SetLocation(Loc);
        CurEmitter.SetRotation(Rot);
        CurEmitter.ParticleSystemComponent.ActivateSystem();
    }
    // End:0x342
    if(ImpactDecal.DecalMaterials.Length != 0)
    {
        DecalMaterial = ImpactDecal.DecalMaterials[Rand(ImpactDecal.DecalMaterials.Length)];
        // End:0x342
        if(DecalMaterial != none)
        {
            DecalScaleAlpha = FRand();
            rot2 = Rotator(-Vector(Rot));
            decalmgr = SPDecalManager(Class'Engine.WorldInfo'.static.GetWorldInfo().MyDecalManager);
            decalmgr.SPSpawnDecal(ImpactDecal.DecalMaterial, Loc, rot2, Lerp(ImpactDecal.WidthMin, ImpactDecal.WidthMax, DecalScaleAlpha), Lerp(ImpactDecal.HeightMin, ImpactDecal.HeightMax, DecalScaleAlpha), ImpactDecal.Thickness, false, FRand() * 360.0000000, none, true, false, 'None', -1, -1, ImpactDecal.LifeSpan);
        }
    }
    //return;    
}

function @NULL ParticleSystemFinished()
{
    local /*0x97E50000-0x00000400*/ private @NULL FinishedComponent[8388609], CurEmitter;

    CurEmitter = ImpactEmitters_GetEmitterForComponent(FinishedComponent);
    // End:0x75
    if(CurEmitter != none)
    {
        CurEmitter.SetTemplate(none);
        CurEmitter.OnParticleSystemFinished(FinishedComponent);
    }
    //return;    
}

function CleanupPart()
{
    super.CleanupPart();
    EndLoopSound();
    // End:0x64
    if((ImpactSoundComponentInfo.SoundCueAudioComponent != none) || ImpactSoundComponentInfo.SoundAkComponent != none)
    {
        EndImpactEffects();
    }
    //return;    
}

function SetNormalParameters()
{
    //return;    
}

function SetWeakParameters()
{
    //return;    
}

function SetSweetSpotParameters()
{
    //return;    
}

function SetSuperSweetSpotParameters()
{
    //return;    
}

simulated function UpdateDamageMinigame()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

simulated function InitRightArmMinigame()
{
    local /*0x97E50000-0x00000000*/ private float HalfModerateAngleSize, HalfFullAngleSize, ZoneBuffer;
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, larPawn;

    vsPawn = LPVSPlayerPawn(MyLPPawn);
    // End:0xC7
    if(vsPawn == none)
    {
        larPawn = LPAIPawnVsLaroche(MyLPPawn);
        // End:0x5B
        if(larPawn == none)
        {
            return;            
        }
        else
        {
            SetNormalParameters();
            // End:0xC7
            if(!OwnersArmPartInfo.bUseDamageMinigame)
            {
                PartDamageType = GetDefaultDamageType();
                ForceFeedback = TuneDataVSParts.ForceFeedbackDefault;
                return;
            }
        }
    }
    SetNormalParameters();
    // End:0x133
    if(!OwnersArmPartInfo.bUseDamageMinigame)
    {
        PartDamageType = GetDefaultDamageType();
        ForceFeedback = TuneDataVSParts.ForceFeedbackDefault;
        return;
    }
    RightArmMinigameInfo.ModerateDamageBoostAngle = RandRange(-180.0000000, 180.0000000);
    HalfModerateAngleSize = vsPawn.TuneDataVSPlayerPawn.MiniGameModerateDamageHalfAngle.GetValue();
    HalfFullAngleSize = vsPawn.TuneDataVSPlayerPawn.MiniGameFullDamageHalfAngle.GetValue();
    ZoneBuffer = (10.0000000 + HalfModerateAngleSize) + HalfFullAngleSize;
    RightArmMinigameInfo.FullDamageBoostAngle = RightArmMinigameInfo.ModerateDamageBoostAngle + RandRange(ZoneBuffer, 360.0000000 - ZoneBuffer);
    RightArmMinigameInfo.FullDamageBoostAngle = NormalizeAngle(RightArmMinigameInfo.FullDamageBoostAngle);
    //return;    
}

simulated state PrimaryAction
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        DamageRemainder = 0.0000000;
        TimeTilNextTrace = TraceRepeatPeriod;
        // End:0x55
        if(int(PartState) != int(0))
        {
            StartPartState(0);
        }
        // End:0x83
        if(!MyLPPawn.IsLocallyControlled())
        {
            BroadcastSMMStart();
        }
        StartPartState(1);
        InitRightArmMinigame();
        //return;        
    }

    simulated event Tick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

        // End:0x52
        if((int(PartState) != int(0)) && int(OwnersArmPartInfo.IKType) != int(0))
        {
            UpdateArmIKController(DeltaTime);
        }
        UpdateSound(DeltaTime);
        TraceDamageCollisionCheck(DeltaTime);
        UpdateForceFeedback(DeltaTime);
        UpdateDamageMinigame(DeltaTime);
        super(Actor).Tick(DeltaTime);
        //return;        
    }

    simulated function ForceDamageMinigame()
    {
        // End:0x38
        if(bHasDamageMinigame)
        {
            OwnersArmPartInfo.bUseDamageMinigame = true;
            InitRightArmMinigame();
        }
        //return;        
    }

    simulated function UpdateDamageMinigame()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL PInput;
        local /*0x97E50000-0x00000000*/ private float AngleDif, StickAngle;
        local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

        vsPawn = LPVSPlayerPawn(MyLPPawn);
        // End:0x2D
        if(vsPawn == none)
        {
            return;
        }
        // End:0x79
        if(!OwnersArmPartInfo.bUseDamageMinigame || !MyLPPawn.IsLocallyControlled())
        {
            return;
        }
        PartDamageType = GetDefaultDamageType();
        ForceFeedback = TuneDataVSParts.ForceFeedbackDefault;
        PInput = LPPlayerInput(LPPlayerController(MyLPPawn.Controller).PlayerInput);
        // End:0x138
        if(PInput.UnfilteredRotationStickRadius < 0.5000000)
        {
            SetNormalParameters();
            return;
        }
        StickAngle = PInput.UnfilteredRotationStickAngle;
        AngleDif = StickAngle - RightArmMinigameInfo.FullDamageBoostAngle;
        AngleDif = Abs(NormalizeAngle(AngleDif));
        // End:0x213
        if(AngleDif <= vsPawn.TuneDataVSPlayerPawn.MiniGameFullDamageHalfAngle.GetValue())
        {
            SetSuperSweetSpotParameters();
            return;
        }
        AngleDif = StickAngle - RightArmMinigameInfo.ModerateDamageBoostAngle;
        AngleDif = Abs(NormalizeAngle(AngleDif));
        // End:0x2C6
        if(AngleDif <= vsPawn.TuneDataVSPlayerPawn.MiniGameModerateDamageHalfAngle.GetValue())
        {
            SetSweetSpotParameters();
            return;
        }
        SetWeakParameters();
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        CleanupPart();
        super.EndState(NextStateName);
        //return;        
    }
    stop;    
}

defaultproperties
{
    ImpactDecal=(DecalMaterials=none,ClipDecalsUsingFastPath=true,WidthMin=6.0000000,WidthMax=6.0000000,HeightMin=6.0000000,HeightMax=6.0000000,Thickness=10.0000000,LifeSpan=15.0000000,FxRelevanceInfo=(Relevance=none))
    // Reference: SkeletalMeshComponent'Default__LPVSParts_CauseTraceDamage.WeaponMesh'
    begin object name=WeaponMesh
    end object
    WeaponMeshComp=WeaponMesh
    // Reference: SPTuneDataEventDefSoundBase'Default__LPVSParts_CauseTraceDamage.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
}