class LPSnowcatInterpTransport extends LPInterpActor_PlayerTransport
    abstract
    hidecategories(AnimDependency,Navigation);

enum eActionEnum
{
    eActionEnum_None,               // 0
    eActionEnum_StartEngine,        // 1
    eActionEnum_StopEngine,         // 2
    eActionEnum_MAX                 // 3
};

struct native AudioLoopReplicationStruct
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ReplicationCounter;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMoving;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIdle;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bBroken;

    structdefaultproperties
    {
        ReplicationCounter=0
        bMoving=false
        bIdle=false
        bBroken=false
    }
};

var(0.25_Pct) /*0xABD20000-0x00000400*/ private const export @NULL RepairableComponent[589825];
var(0.25_Pct) /*0x9AE30000-0x00000400*/ private const export @NULL ObjectiveComponent[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int Health[2097153];
var(0.25_Pct) /*0x65FC0000-0x00000000*/ private int MaxHealth[65537];
var(0.25_Pct) /*0x65FC0000-0x00000000*/ private bool bAcceptFriendlyFire[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDisabled[2097153];
var(0.25_Pct) /*0xCE810000-0x00000000*/ private bool bAttacking[65537];
var(0.25_Pct) /*0xCE810000-0x00000000*/ private bool bMoveOnlyWithProximity[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldBeMoving[2097153];
var(0.25_Pct) /*0x88EA0000-0x00000000*/ private bool bEnabled[2162689];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEMPActive[2097153];
var(0.25_Pct) /*0xCE810000-0x00000000*/ private float TouchRadius[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private const export @NULL CollisionCylinder[655361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ProximityCount;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ParticleDamageComponent[524289];
var(0.25_Pct) /*0x65FC0000-0x00000000*/ private @NULL DamageParticleSystem[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int ParticleRepCount[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TeamNumber[2097153];
var(0.25_Pct) /*0x09A90000-0x00000000*/ private @NULL StartEngineSoundCue[65537];
var(0.25_Pct) /*0x09A90000-0x00000000*/ private @NULL StopEngineSoundCue[65537];
var(0.25_Pct) /*0x09A90000-0x00000000*/ private @NULL IdleEngineSoundCue[65537];
var(0.25_Pct) /*0x09A90000-0x00000000*/ private @NULL MovingEngineSoundCue[65537];
var(0.25_Pct) /*0x09A90000-0x00000000*/ private @NULL DisabledStartEngineSoundCue[65537];
var(0.25_Pct) /*0x09A90000-0x00000000*/ private @NULL DisabledIdleEngineSoundCue[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL IdleSoundLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL BrokenSoundLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPSnowcatInterpTransport.eActionEnum ActionEnum[2097153];
var(0.25_Pct) /*0xABD20000-0x00000000*/ private @NULL RepairInfographic[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel EMPInfoStruct EMPInfo[2097153];
var(0.25_Pct) /*0x50620000-0x00000400*/ private export @NULL EMPParticleSystemComponent[589825];
var(0.25_Pct) /*0x50620000-0x00000000*/ private name EMPParticleSystemSocket[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EMPSoundComponent[524289];
var(0.25_Pct) /*0x50620000-0x00000000*/ private float EMPDisruptionDuration[65537];
var(0.25_Pct) /*0x50620000-0x00000000*/ private @NULL EMPSoundCue[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel AudioLoopReplicationStruct AudioLoopReplicationInfo[2097153];

// Export ULPSnowcatInterpTransport::execGetDistanceFromPoint(FFrame&, void* const)
native function GetDistanceFromPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL To[8388609], From, HitPoint;
    local /*0x97E50000-0x00000000*/ private float Distance[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x2E
    if(VarName == 'ParticleRepCount')
    {
        SetDamageParticles(bIsDisabled);        
    }
    else
    {
        // End:0x52
        if(VarName == 'Health')
        {
            NotifyHUDStateChanged();            
        }
        else
        {
            // End:0xA6
            if(VarName == 'ActionEnum')
            {
                switch(ActionEnum)
                {
                    // End:0x8E
                    case 1:
                        StartEngine();
                        // End:0xA3
                        break;
                    // End:0xA0
                    case 2:
                        StopEngine();
                        // End:0xA3
                        break;
                    // End:0xFFFF
                    default:
                        break;
                }                
            }
            else
            {
                // End:0xFB
                if(VarName == 'EMPInfo')
                {
                    // End:0xEE
                    if(EMPInfo.EMPDuration > float(0))
                    {
                        StartEMPDamage();                        
                    }
                    else
                    {
                        StopEMPDamage();
                    }                    
                }
                else
                {
                    // End:0x176
                    if(VarName == 'AudioLoopReplicationInfo')
                    {
                        SetupAudioLoops(AudioLoopReplicationInfo.bMoving, AudioLoopReplicationInfo.bIdle, AudioLoopReplicationInfo.bBroken);                        
                    }
                    else
                    {
                        super.ReplicatedEvent(VarName);
                    }
                }
            }
        }
    }
    //return;    
}

simulated function NotifyHUDStateChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    // End:0x79
    foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
    {
        // End:0x78
        if(LPC.myLPHUD != none)
        {
            LPC.myLPHUD.SnowcatPointChangedState(self);
        }        
    }    
    //return;    
}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL GRI, TI, LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    ProximityCount = 0;
    ParticleRepCount = 0;
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.SnowcatActorList.Find(self);    
    // End:0xAC
    if(iIndex == -1)
    {
        LPMI.SnowcatActorList.AddItem(self);        
    }
    // End:0xD3
    if(int(Role) == int(ROLE_Authority))
    {
        SetTimer(0.5000000, true, 'CheckPlayerProximity');
    }
    Health = MaxHealth;
    TeamNumber = 0;
    // End:0x1F3
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        GRI = WorldInfo.GRI;
        // End:0x1F3
        if(GRI != none)
        {
            // End:0x1F3
            if(GRI.Teams.Length > 1)
            {
                TI = LPTeamInfo_MP(GRI.Teams[1]);
                // End:0x1F3
                if((TI != none) && bAttacking == TI.bAttackingTeam)
                {
                    TeamNumber = 1;
                }
            }
        }
    }
    bEnabled = default.bEnabled;
    bShouldBeMoving = false;
    bEMPActive = false;
    StopEngine();
    super.PostBeginPlay();
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.SnowcatActorList.Find(self);    
    // End:0x99
    if(iIndex >= 0)
    {
        LPMI.SnowcatActorList.Remove(iIndex, 1);        
    }
    SetupAudioLoops(false, false, false);
    SetDamageParticles(false);
    ClearTimer('CheckPlayerProximity');
    StopEMPDamage();
    super(Actor).Destroyed();
    //return;    
}

function CheckPlayerProximity()
{
    local /*0x97E50000-0x00000000*/ private int Count;
    local /*0x97E50000-0x00000000*/ private @NULL LPP, GRI, TI;

    GRI = WorldInfo.GRI;
    // End:0x61
    if((GRI == none) || !bEnabled)
    {
        ProximityCount = 0;
        bShouldBeMoving = false;
        return;
    }
    // End:0x1B9
    foreach OverlappingActors(Class'LPBasePlayerPawn', LPP, CollisionCylinder.CollisionRadius)
    {
        // End:0x1B8
        if(LPP.IsAliveAndWell())
        {
            // End:0xF0
            if(int(LPP.GetTeamNum()) == int(255))
            {
                continue;                
            }
            TI = LPTeamInfo_MP(GRI.Teams[int(LPP.GetTeamNum())]);
            // End:0x1B8
            if(((TI != none) && bAttacking == TI.bAttackingTeam) || int(WorldInfo.NetMode) == int(NM_Standalone))
            {
                ++Count;
            }
        }        
    }    
    // End:0x240
    if(Count != ProximityCount)
    {
        // End:0x20B
        if((Count == 0) && !bIsDisabled)
        {
            TriggerEventClass(Class'LPSeqEvent_ObjectiveUntouched', self);            
        }
        else
        {
            // End:0x240
            if(ProximityCount == 0)
            {
                // End:0x240
                if(!bIsDisabled)
                {
                    TriggerEventClass(Class'LPSeqEvent_ObjectiveTouched', self);
                }
            }
        }
    }
    // End:0x267
    if(bIsDisabled || bEMPActive)
    {
        Count = 0;
    }
    ProximityCount = Count;
    // End:0x2A1
    if(bMoveOnlyWithProximity)
    {
        bShouldBeMoving = Count != 0;        
    }
    else
    {
        bShouldBeMoving = !bIsDisabled;
    }
    // End:0x2F4
    if(!bShouldBeMoving)
    {
        LPSnowcatInterpTransportWheels(WheelActor).SetDrillStatus(1);        
    }
    else
    {
        // End:0x33E
        if(!bIsDisabled && !bEMPActive)
        {
            LPSnowcatInterpTransportWheels(WheelActor).SetDrillStatus(4);
        }
    }
    SetupAudioLoops(LPSnowcatInterpTransportWheels(WheelActor).MatineeSpeedModifier > 0.0010000, LPSnowcatInterpTransportWheels(WheelActor).MatineeSpeedModifier <= 0.0010000, bIsDisabled || bEMPActive);
    //return;    
}

simulated event @NULL TakeRadiusDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x97E50000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private float Momentum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HurtOrigin[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFullDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private float DamageFalloffExponent[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL Dir, HitLocation;
    local /*0x97E50000-0x00000000*/ private float DamageScale, Dist, ScaledDamage;
    local /*0x97E50000-0x00000400*/ private @NULL SkelMesh, SkelDamageCenter, SkelDamageRotation;

    1.0000000
    SkelMesh = LPSnowcatInterpTransportWheels(WheelActor).GetSkeleton();
    // End:0x4C
    if(SkelMesh == none)
    {
        return;
    }
    // End:0x8E
    if(!SkelMesh.GetSocketWorldLocationAndRotation('Socket_BodyMountingPoint', SkelDamageCenter, SkelDamageRotation))
    {
        return;
    }
    // End:0x1EA
    if(GetDistanceFromPoint(SkelDamageCenter, HurtOrigin, HitLocation, Dist))
    {
        Dir = SkelDamageCenter - HurtOrigin;
        Dir = Normal(Dir);
        // End:0x111
        if(bFullDamage)
        {
            DamageScale = 1.0000000;            
        }
        else
        {
            DamageScale = FClamp(1.0000000 - (Dist / DamageRadius), 0.0000000, 1.0000000);
            DamageScale = DamageScale ** DamageFalloffExponent;
        }
        // End:0x1EA
        if(DamageScale > 0.0000000)
        {
            ScaledDamage = DamageScale * BaseDamage;
            TakeDamage(int(ScaledDamage), InstigatedBy, HitLocation, (DamageScale * Momentum) * Dir, DamageType,, DamageCauser);
        }
    }
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser, GRI, TI;

    // End:0x13
    if(!bEnabled)
    {
        return;
    }
    // End:0x105
    if((EventInstigator != none) && !bAcceptFriendlyFire)
    {
        GRI = WorldInfo.GRI;
        // End:0x105
        if(GRI != none)
        {
            TI = LPTeamInfo_MP(GRI.Teams[int(LPPlayerController(EventInstigator).GetTeamNum())]);
            // End:0x105
            if(TI != none)
            {
                // End:0x105
                if(bAttacking == TI.bAttackingTeam)
                {
                    return;
                }
            }
        }
    }
    super(Actor).TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    // End:0x18D
    if((Health > 0) && Damage > 0)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveTakingDamage', EventInstigator);
    }
    // End:0x20C
    if((Health != 0) && (Health - Damage) <= 0)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveDisarmed', EventInstigator);
        SetDamageParticles(true);
        TriggerEventClass(Class'LPSeqEvent_ObjectiveUntouched', EventInstigator);
        ProximityCount = 0;
    }
    Health -= Damage;
    // End:0x289
    if(Health <= 0)
    {
        Health = 0;
        bIsDisabled = true;
        bShouldBeMoving = false;
        StopEngine();
        LPSnowcatInterpTransportWheels(WheelActor).SetDrillStatus(1);        
    }
    else
    {
        // End:0x47A
        if(ClassIsChildOf(DamageType, Class'LPDamageType') && class<LPDamageType>(DamageType).default.bCausesEMP)
        {
            // End:0x47A
            if(EMPDisruptionDuration > float(0))
            {
                EMPInfo.EMPRepCount++;
                EMPInfo.EMPDuration = EMPDisruptionDuration;
                // End:0x400
                if((ClassIsChildOf(DamageType, Class'LPDamageTypeHalberdEMP') && EventInstigator != none) && LPWeaponHalberd(EventInstigator.Pawn.Weapon) != none)
                {
                    EMPInfo.EMPDuration *= LPWeaponHalberd(EventInstigator.Pawn.Weapon).GetEMPIncreasedDuration();
                }
                // End:0x464
                if((LPPlayerController(EventInstigator) != none) && !IsTimerActive('EndEMPEffect'))
                {
                    LPPlayerController(EventInstigator).ServerIncrementStat('Stat_EMPShutdowns');
                }
                bForceNetUpdate = true;
                StartEMPDamage();
            }
        }
    }
    NotifyHUDStateChanged();
    //return;    
}

event HealDamage()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bEnabled)
    {
        return false;
    }
    // End:0x177
    if(Health < MaxHealth)
    {
        // End:0x59
        if((Health + Amount) >= MaxHealth)
        {
            bIsDisabled = false;            
        }
        else
        {
            // End:0x120
            if((Health < (MaxHealth / 2)) && (Health + Amount) >= (MaxHealth / 2))
            {
                TriggerEventClass(Class'LPSeqEvent_ObjectiveRepaired', Healer);
                bIsDisabled = false;
                SetDamageParticles(false);
                ProximityCount = 0;
                CheckPlayerProximity();
                // End:0x120
                if(!bEMPActive)
                {
                    LPSnowcatInterpTransportWheels(WheelActor).SetDrillStatus(4);
                }
            }
        }
        TriggerEventClass(Class'LPSeqEvent_ObjectiveBeingRepaired', Healer);
        Health = Min(MaxHealth, Health + Amount);
        NotifyHUDStateChanged();
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

simulated function GetHealthPercent()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 100.0000000 * (float(Health) / float(MaxHealth));
    //return ReturnValue;    
}

simulated function SetDamageParticles()
{
    local /*0x97E50000-0x00000000*/ private bool bOn[8388609];

    // End:0xC5
    if(bOn)
    {
        // End:0xC2
        if(!ParticleDamageComponent.bIsActive)
        {
            ParticleDamageComponent.KillParticlesForced();
            ParticleDamageComponent.DeactivateSystem();
            ParticleDamageComponent.SetTemplate(DamageParticleSystem);
            ParticleDamageComponent.ActivateSystem();
            ++ParticleRepCount;
        }        
    }
    else
    {
        // End:0x130
        if(ParticleDamageComponent.bIsActive)
        {
            ParticleDamageComponent.KillParticlesForced();
            ParticleDamageComponent.DeactivateSystem();
            ++ParticleRepCount;
        }
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    // End:0x50
    if(LPBasePlayerPawn(Other) != none)
    {
        CheckPlayerProximity();
    }
    //return;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x98
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;
            bShouldBeMoving = false;            
        }
        else
        {
            // End:0x102
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
                // End:0x102
                if(!bEnabled)
                {
                    bShouldBeMoving = false;
                }
            }
        }
    }
    // End:0x129
    if(bEnabled)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveBegin', self);        
    }
    else
    {
        ProximityCount = 0;
        SetDamageParticles(false);
        ClearTimer('CheckPlayerProximity');
    }
    //return;    
}

function OnObjectiveFinish()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    CheckForLoneWolf();
    //return;    
}

function ExternalTriggerEvent()
{
    local /*0x97E50000-0x00000000*/ private class EventClassToTrigger[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(EventInstigator == none)
    {
        EventInstigator = self;
    }
    return TriggerEventClass(EventClassToTrigger, EventInstigator);
    //return ReturnValue;    
}

protected simulated event SetupAudio()
{
    local /*0x97E50000-0x00000000*/ private bool bDoingPlayerAudio[8388609], bDoingNonPlayerAudio;
    local /*0x97E50000-0x00000000*/ private @NULL LocallyControlledPawn[8388609];

    //return;    
}

simulated function StopEngine()
{
    // End:0x49
    if(bEnabled)
    {
        // End:0x39
        if(bIsDisabled || bEMPActive)
        {
            SetupAudioLoops(false, false, true);            
        }
        else
        {
            SetupAudioLoops(false, true, false);
        }        
    }
    else
    {
        SetupAudioLoops(false, false, false);
    }
    bEngineRunning = false;
    ActionEnum = 2;
    //return;    
}

simulated function StartEngine()
{
    // End:0x38
    if(bIsDisabled || bEMPActive)
    {
        SetupAudioLoops(false, false, false);
        bEngineRunning = false;        
    }
    else
    {
        // End:0x79
        if(bEnabled)
        {
            PlaySound(StartEngineSoundCue, false, false, true);
            SetupAudioLoops(true, false, false);
            bEngineRunning = true;            
        }
        else
        {
            SetupAudioLoops(false, false, false);
        }
    }
    ActionEnum = 1;
    //return;    
}

simulated function SetupAudioLoops()
{
    local /*0x97E50000-0x00000000*/ private bool bMoving[8388609], bIdle, bBroken, bWasIdle, bWasBroken, bWasMoving;

    bWasIdle = false;
    bWasBroken = false;
    bWasMoving = false;
    // End:0x7A
    if(!bIdle && IdleSoundLoop != none)
    {
        IdleSoundLoop.Stop();
        IdleSoundLoop = none;
        bWasIdle = true;
    }
    // End:0xD0
    if(!bBroken && BrokenSoundLoop != none)
    {
        BrokenSoundLoop.Stop();
        BrokenSoundLoop = none;
        bWasBroken = true;
    }
    // End:0x126
    if(!bMoving && PlayerEngineMainLoop != none)
    {
        PlayerEngineMainLoop.Stop();
        PlayerEngineMainLoop = none;
        bWasMoving = true;
    }
    // End:0x195
    if(bMoving)
    {
        // End:0x161
        if(PlayerEngineMainLoop == none)
        {
            PlayerEngineMainLoop = CreateTransportAudioComponent(MovingEngineSoundCue, self, true);
        }
        // End:0x195
        if(bWasIdle || bWasBroken)
        {
            PlaySound(StartEngineSoundCue, false, false, true);
        }
    }
    // End:0x1F5
    if(bIdle)
    {
        // End:0x1D0
        if(IdleSoundLoop == none)
        {
            IdleSoundLoop = CreateTransportAudioComponent(IdleEngineSoundCue, self, true);
        }
        // End:0x1F5
        if(bWasMoving)
        {
            PlaySound(StopEngineSoundCue, false, false, true);
        }
    }
    // End:0x264
    if(bBroken)
    {
        // End:0x230
        if(BrokenSoundLoop == none)
        {
            BrokenSoundLoop = CreateTransportAudioComponent(DisabledStartEngineSoundCue, self, true);
        }
        // End:0x264
        if(bWasMoving || bWasIdle)
        {
            PlaySound(StopEngineSoundCue, false, false, true);
        }
    }
    bPlayerAudioIsPlaying = true;
    // End:0x31A
    if(int(Role) == int(ROLE_Authority))
    {
        AudioLoopReplicationInfo.bBroken = bBroken;
        AudioLoopReplicationInfo.bIdle = bIdle;
        AudioLoopReplicationInfo.bMoving = bMoving;
        ++AudioLoopReplicationInfo.ReplicationCounter;
    }
    //return;    
}

event Attach()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], PP;

    PP = LPPlayerPawn(Other);
    // End:0x5A
    if((PP != none) && PP.IsLocallyControlled())
    {
        SetLoopSpatialization(false);
    }
    super(LPInterpActor_PlayerTransportBase).Attach(Other);
    //return;    
}

event Detach()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], PP;

    PP = LPPlayerPawn(Other);
    // End:0x5A
    if((PP != none) && PP.IsLocallyControlled())
    {
        SetLoopSpatialization(true);
    }
    super(InterpActor).Detach(Other);
    //return;    
}

simulated function SetLoopSpatialization()
{
    local /*0x97E50000-0x00000000*/ private bool bSpatialized[8388609];

    // End:0x39
    if(PlayerEngineMainLoop != none)
    {
        PlayerEngineMainLoop.bAllowSpatialization = bSpatialized;
    }
    // End:0x72
    if(IdleSoundLoop != none)
    {
        IdleSoundLoop.bAllowSpatialization = bSpatialized;
    }
    // End:0xAB
    if(BrokenSoundLoop != none)
    {
        BrokenSoundLoop.bAllowSpatialization = bSpatialized;
    }
    //return;    
}

simulated function OnSnowcatControls()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    //return;    
}

simulated function GetMatineeModifier()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return LPSnowcatInterpTransportWheels(WheelActor).MatineeSpeedModifier;
    //return ReturnValue;    
}

simulated function TriggerSpeedModifierEvent()
{
    TriggerEventClass(Class'LPSeqEvent_SnowcatFeedback', self);
    //return;    
}

simulated function ShouldBeMoving()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bShouldBeMoving;
    //return ReturnValue;    
}

simulated function @NULL StartEMPDamage()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelMesh;

    // End:0x11
    if(WheelActor == none)
    {
        return;
    }
    SkelMesh = LPSnowcatInterpTransportWheels(WheelActor).GetSkeleton();
    // End:0x54
    if(SkelMesh == none)
    {
        return;
    }
    // End:0x193
    if(EMPParticleSystemComponent.Template != none)
    {
        // End:0x193
        if((!EMPParticleSystemComponent.bIsActive || EMPParticleSystemComponent.bWasDeactivated) || EMPParticleSystemComponent.bWasCompleted)
        {
            EMPParticleSystemComponent.__OnSystemFinished__Delegate = None;
            // End:0x173
            if(!SkelMesh.IsComponentAttached(EMPParticleSystemComponent))
            {
                SkelMesh.AttachComponentToSocket(EMPParticleSystemComponent, EMPParticleSystemSocket);
            }
            EMPParticleSystemComponent.ActivateSystem(true);
        }
    }
    // End:0x1C4
    if(EMPSoundComponent == none)
    {
        EMPSoundComponent = CreateAudioComponent(EMPSoundCue, false, true);
    }
    // End:0x2A6
    if((EMPSoundComponent != none) && !EMPSoundComponent.IsPlaying())
    {
        EMPSoundComponent.bUseOwnerLocation = true;
        EMPSoundComponent.bAutoDestroy = true;
        EMPSoundComponent.bStopWhenOwnerDestroyed = true;
        EMPSoundComponent.bShouldRemainActiveIfDropped = true;
        EMPSoundComponent.FadeIn(0.2000000, 1.0000000);
    }
    SetTimer(EMPInfo.EMPDuration, false, 'EndEMPEffect');
    LPSnowcatInterpTransportWheels(WheelActor).SetDrillStatus(1);
    bShouldBeMoving = false;
    bEMPActive = true;
    //return;    
}

simulated function EndEMPEffect()
{
    StopEMPDamage();
    //return;    
}

simulated function @NULL StopEMPDamage()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelMesh;

    SkelMesh = LPSnowcatInterpTransportWheels(WheelActor).GetSkeleton();
    // End:0xC8
    if(EMPParticleSystemComponent != none)
    {
        EMPParticleSystemComponent.KillParticlesForced();
        EMPParticleSystemComponent.DeactivateSystem();
        EMPParticleSystemComponent.SetActive(false);
        SkelMesh.DetachComponent(EMPParticleSystemComponent);
    }
    // End:0xF6
    if(EMPSoundComponent != none)
    {
        EMPSoundComponent.Stop();
    }
    EMPInfo.EMPRepCount++;
    EMPInfo.EMPDuration = 0.0000000;
    bEMPActive = false;
    // End:0x17B
    if(!bIsDisabled)
    {
        LPSnowcatInterpTransportWheels(WheelActor).SetDrillStatus(4);
    }
    //return;    
}

function CheckForLoneWolf()
{
    local /*0x97E50000-0x00000000*/ private @NULL PRI;
    local /*0x97E50000-0x00000000*/ private int Count;
    local /*0x97E50000-0x00000000*/ private @NULL LPP, LoneWolf, TI;

    Count = 0;
    // End:0x160
    foreach OverlappingActors(Class'LPBasePlayerPawn', LPP, CollisionCylinder.CollisionRadius)
    {
        // End:0x15F
        if(LPP.IsAliveAndWell())
        {
            // End:0x9A
            if(int(LPP.GetTeamNum()) == int(255))
            {
                continue;                
            }
            TI = LPTeamInfo_MP(WorldInfo.GRI.Teams[int(LPP.GetTeamNum())]);
            // End:0x15F
            if((TI != none) && bAttacking == TI.bAttackingTeam)
            {
                LoneWolf = LPP;
                ++Count;
            }
        }        
    }    
    // End:0x238
    if((Count == 1) && LoneWolf != none)
    {
        PRI = LPPRI(LoneWolf.PlayerReplicationInfo);
        // End:0x238
        if((PRI != none) && !PRI.CheckForNearbyPlayers(Class'LPAwardManager'.static.GetDefaultAwardParam('Emblem_LoneWolf'), true))
        {
            PRI.ServerGiveAward('Emblem_LoneWolf');
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: LPObjectiveComponentEscort'Default__LPSnowcatInterpTransport.ObjectiveComp'
    begin object name=ObjectiveComp class=Class'LPObjectiveComponentEscort'
    end object
    ObjectiveComponent=ObjectiveComp
    Health=1000
    MaxHealth=1000
    bAttacking=true
    TouchRadius=850.0000000
    // Reference: CylinderComponent'Default__LPSnowcatInterpTransport.CollisionCylinder0'
    begin object name=CollisionCylinder0 class=Class'Engine.CylinderComponent'
    end object
    CollisionCylinder=CollisionCylinder0
    // Reference: ParticleSystemComponent'Default__LPSnowcatInterpTransport.EMPDamageComponent'
    begin object name=EMPDamageComponent class=Class'Engine.ParticleSystemComponent'
    end object
    EMPParticleSystemComponent=EMPDamageComponent
    EMPParticleSystemSocket="Socket_EMPEffects"
    EMPDisruptionDuration=15.0000000
    AudioLoopReplicationInfo=(ReplicationCounter=-1,bMoving=false,bIdle=false,bBroken=false)
    // Reference: StaticMeshComponent'Default__LPSnowcatInterpTransport.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPSnowcatInterpTransport.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPSnowcatInterpTransport.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    // Reference: StaticMeshComponent'Default__LPSnowcatInterpTransport.RBCollision0'
    begin object name=RBCollision0
    end object
    Components[2]=RBCollision0
    Components[3]=CollisionCylinder0
    Components[4]=ObjectiveComp
    Components[5]=EMPDamageComponent
    bCanStepUpOn=false
    bCollideActors=true
    bCollideComplex=true
    // Reference: LPSnowcatInterpTransportInteractionMetaData'Default__LPSnowcatInterpTransport.SnowcatInteract0'
    begin object name=SnowcatInteract0 class=Class'LPSnowcatInterpTransportInteractionMetaData'
    end object
    InteractionMetaData=SnowcatInteract0
    CollisionComponent=CollisionCylinder0
    SupportedEvents=/* Array type was not detected. */
}