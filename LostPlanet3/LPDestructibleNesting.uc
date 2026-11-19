class LPDestructibleNesting extends LPDestructibleRangedActor
    hidecategories(AnimDependency,Navigation);

struct DelayedDamageInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Delay;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRadiusDamage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Damage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL HitInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VMomentum;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InstigatedBy;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BaseDamage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageRadius;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DamageType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FMomentum;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HurtOrigin;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFullDamage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DamageCauser;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DamageFalloffExponent;

    structdefaultproperties
    {
        Delay=0.0000000
        bRadiusDamage=false
        Damage=0
        HitInfo=(Material=none,PhysMaterial=none,Item=0,LevelIndex=0,BoneName="None",HitComponent=none)
        VMomentum=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        InstigatedBy=none
        BaseDamage=0.0000000
        DamageRadius=0.0000000
        DamageType=none
        FMomentum=0.0000000
        HurtOrigin=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        bFullDamage=false
        DamageCauser=none
        DamageFalloffExponent=0.0000000
    }
};

struct DelayedDamageType
{
    var(0.25_Pct) /*0x455F0000-0x00000000*/ private class DamageType[65537];
    var(0.25_Pct) /*0x455F0000-0x00000000*/ private float RandomDestructTimeMin[65537];
    var(0.25_Pct) /*0x455F0000-0x00000000*/ private float RandomDestructTimeMax[65537];
    var(0.25_Pct) /*0x455F0000-0x00000000*/ private float DamageMultiplier[65537];

    structdefaultproperties
    {
        DamageType=none
        RandomDestructTimeMin=0.0000000
        RandomDestructTimeMax=0.0000000
        DamageMultiplier=0.0000000
    }
};

struct DamageTypeToIgnore
{
    var(0.25_Pct) /*0x2B950000-0x00000000*/ private class DamageType[65537];
    var(0.25_Pct) /*0x2B950000-0x00000000*/ private float Chance[65537];

    structdefaultproperties
    {
        DamageType=none
        Chance=0.0000000
    }
};

var(0.25_Pct) /*0xB7800000-0x00000000*/ private int AggitationMaterialIndex[65537];
var(0.25_Pct) /*0xB7800000-0x00000000*/ private name AggitationMaterialParameterName[65537];
var(0.25_Pct) /*0xB7800000-0x00000000*/ private name AggitationMaterialCapParameterName[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AggitationMaterialInstances;
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private class InnerRadiusDamageType[65537];
var(0.25_Pct) /*0x2AB20000-0x00000400*/ private editfixedsize array DelayedDamageTypeList[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array DelayedDamageList;
var(0.25_Pct) /*0x2AB20000-0x00000400*/ private editfixedsize array IgnoredDamageTypes[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPrimaryExplosion;
var(0.25_Pct) /*0xCCED0000-0x00000000*/ private bool bExplodeAfterAggitation[65537];
var(0.25_Pct) /*0x2AB20000-0x00000000*/ private bool bPreventCascadeExplosions[65537];
var(0.25_Pct) /*0x493E0000-0x00000000*/ private bool bCanBeTagged[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsDNATagged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasDNATagged;
var(0.25_Pct) /*0xCCED0000-0x00000000*/ private float TimeAfterAggitationToExplode[65537];
var(0.25_Pct) /*0xCCED0000-0x00000000*/ private float TimeAfterAggitationReachMaxEmissive[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeAfterAggitationScaler;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastPawnToTouch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialTouchTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel float CurrentAggitationLevel[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel float TimerAggitationLevel[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel float DistanceAggitationLevel[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL AggitatedSoundComponent[524289];
var(0.25_Pct) /*0x7E100000-0x00000000*/ private @NULL AggitatedAKSoundCue[65537];
var(0.25_Pct) /*0x493E0000-0x00000400*/ private editfixedsize @NULL QuestEntry[589825];
var(0.25_Pct) /*0x493E0000-0x00000400*/ private editfixedsize @NULL RequiredNumTags[589825];
var(0.25_Pct) /*0x493E0000-0x00000400*/ private editfixedsize @NULL RequiredTagHoverTime[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumTimesTagged;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TaggedTime;
var(0.25_Pct) /*0x493E0000-0x00000000*/ private @NULL TagParticleSystem[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DNAParticles[524289];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x47
    if((VarName == 'DistanceAggitationLevel') || VarName == 'CurrentAggitationLevel')
    {
        SetAggitationLevelShaderParams();
        SetAggitationLevelSoundParams();        
    }
    else
    {
        super(SPGFDestructibleObject).ReplicatedEvent(VarName);
    }
    //return;    
}

simulated function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL CurrentSubobject, DT;
    local /*0x97E50000-0x00000000*/ private float Chance;

    SPKynapseObstacle = none;
    super.PostBeginPlay();
    AggitationMaterialInstances.Length = 0;
    AggitationMaterialInstances.Length = SubObjects.Length;
    TimeAfterAggitationScaler = TimeAfterAggitationToExplode / ((TimeAfterAggitationReachMaxEmissive != float(0)) ? TimeAfterAggitationReachMaxEmissive : 1.0000000);
    // End:0x1F9
    if((AggitationMaterialIndex != -1) && AggitationMaterialParameterName != 'None')
    {
        Idx = 0;
        J0xA3:

        // End:0x1F9 [Loop If]
        if(Idx < SubObjects.Length)
        {
            CurrentSubobject = SubObjects[Idx];
            // End:0x1EB
            if(CurrentSubobject.Mesh != none)
            {
                AggitationMaterialInstances[Idx] = CurrentSubobject.Mesh.CreateAndSetMaterialInstanceConstant(AggitationMaterialIndex);
                // End:0x1EB
                if(AggitationMaterialInstances[Idx] != none)
                {
                    AggitationMaterialInstances[Idx].SetScalarParameterValue(AggitationMaterialParameterName, 0.0000000);
                    // End:0x1EB
                    if(AggitationMaterialCapParameterName != 'None')
                    {
                        AggitationMaterialInstances[Idx].SetScalarParameterValue(AggitationMaterialCapParameterName, TimeAfterAggitationScaler);
                    }
                }
            }
            ++Idx;
            // [Loop Continue]
            goto J0xA3;
        }
    }
    DelayedDamageList.Length = 0;
    // End:0x2BD
    foreach IgnoredDamageTypes(DT)
    {
        Chance = RandRange(0.0000000, 1.0000000);
        // End:0x2BC
        if(Chance < DT.Chance)
        {
            // End:0x2BC
            if(IgnoreDamageType.Find(DT.DamageType) < )
            {                
                IgnoreDamageType.AddItem(DT.DamageType);                
            }
        }        
    }    
    bPrimaryExplosion = false;
    // End:0x362
    if((AggitatedAKSoundCue != none) && AggitatedSoundComponent == none)
    {
        AggitatedSoundComponent = Class'AkAudio.AkComponent'.static.CreateAkComponent(AggitatedAKSoundCue, self, 'None', false, true, false);
        // End:0x362
        if(AggitatedSoundComponent != none)
        {
            AggitatedSoundComponent.Play();
            SetAggitationLevelSoundParams();
        }
    }
    //return;    
}

simulated function CommonShutdownStuff()
{
    ClearTimer('PerformDelayedDamage');
    ClearTimer('ExplodeAfterAggitation');
    ClearTimer('CheckAggitationLevels');
    DelayedDamageList.Length = 0;
    // End:0x81
    if(AggitatedSoundComponent != none)
    {
        AggitatedSoundComponent.Stop();
        AggitatedSoundComponent = none;
    }
    //return;    
}

simulated function Reset()
{
    CommonShutdownStuff();
    super(SPGFDestructibleObject).Reset();
    //return;    
}

simulated function ShutDownObject()
{
    CommonShutdownStuff();
    // End:0x2E
    if(bHasBeenDestroyed)
    {
        TriggerEventClass(Class'LPSeqEvent_EggDestroyed', self);
    }
    super(SPGFDestructibleObject).ShutDownObject();
    //return;    
}

simulated event Destroyed()
{
    CommonShutdownStuff();
    // End:0x43
    if(DNAParticles != none)
    {
        DNAParticles.DeactivateSystem();
        DNAParticles = none;
    }
    // End:0x67
    if(bHasBeenDestroyed)
    {
        TriggerEventClass(Class'LPSeqEvent_EggDestroyed', self);
    }
    super(SPGFDestructibleObject).Destroyed();
    //return;    
}

simulated function ExplodeAfterAggitation()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    ClearTimer('ExplodeAfterAggitation');
    ClearTimer('CheckAggitationLevels');
    // End:0x66
    foreach TouchingActors(Class'LPBasePlayerPawn', LPP)
    {
        // End:0x65
        if(LPP.IsAliveAndWell())
        {
            // End:0x66
            break;
        }        
    }    
    // End:0x89
    if(LPP == none)
    {
        LPP = LastPawnToTouch;
    }
    // End:0xD5
    if(InnerRadiusDamageType != none)
    {
        TakeDamage(1000, none, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), InnerRadiusDamageType,, LPP);
    }
    //return;    
}

simulated function SetDistanceAggitationLevel()
{
    local /*0x97E50000-0x00000000*/ private float Level[8388609];

    Level = FClamp(Level, 0.0000000, 1.0000000);
    DistanceAggitationLevel = Level;
    //return;    
}

simulated function SetTimerAggitationLevel()
{
    local /*0x97E50000-0x00000000*/ private float CurrentTime, TimeSinceTouched, TimeToLive, Ratio;

    CurrentTime = WorldInfo.TimeSeconds;
    TimeSinceTouched = CurrentTime - InitialTouchTime;
    TimeToLive = TimeAfterAggitationToExplode;
    Ratio = TimeSinceTouched / TimeToLive;
    Ratio = FClamp(Ratio, 0.0000000, 1.0000000);
    TimerAggitationLevel = Ratio;
    //return;    
}

simulated function CheckAggitationLevels()
{
    local /*0x97E50000-0x00000000*/ private float OldLevel;

    OldLevel = CurrentAggitationLevel;
    SetTimerAggitationLevel();
    // End:0x42
    if(!bExplodeAfterAggitation)
    {
        CurrentAggitationLevel = DistanceAggitationLevel;        
    }
    else
    {
        CurrentAggitationLevel = TimerAggitationLevel;
    }
    // End:0x80
    if(OldLevel != CurrentAggitationLevel)
    {
        SetAggitationLevelShaderParams();
        SetAggitationLevelSoundParams();
    }
    //return;    
}

simulated function SetAggitationLevelShaderParams()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0xB1
    if((AggitationMaterialIndex != -1) && AggitationMaterialParameterName != 'None')
    {
        Idx = 0;
        J0x37:

        // End:0xB1 [Loop If]
        if(Idx < AggitationMaterialInstances.Length)
        {
            // End:0xA3
            if(AggitationMaterialInstances[Idx] != none)
            {
                AggitationMaterialInstances[Idx].SetScalarParameterValue(AggitationMaterialParameterName, CurrentAggitationLevel);
            }
            ++Idx;
            // [Loop Continue]
            goto J0x37;
        }
    }
    //return;    
}

simulated function SetAggitationLevelSoundParams()
{
    // End:0x51
    if(AggitatedSoundComponent != none)
    {
        AggitatedSoundComponent.SetRTPCValue("AkridEggProximity", 100.0000000 * CurrentAggitationLevel);
    }
    //return;    
}

simulated function OnTouchInnerRadius()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];

    // End:0x4C
    if(InnerRadiusDamageType != none)
    {
        TakeDamage(1000, none, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), InnerRadiusDamageType,, LPP);
    }
    //return;    
}

simulated function OnTouchRadius()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];
    local /*0x97E50000-0x00000000*/ private float NormalizedDistance[8388609];

    // End:0x39
    if(InitialTouchTime == float(0))
    {
        InitialTouchTime = WorldInfo.TimeSeconds;
    }
    SetDistanceAggitationLevel(NormalizedDistance);
    // End:0xC0
    if((bExplodeAfterAggitation && !IsTimerActive('ExplodeAfterAggitation')) && TimeAfterAggitationToExplode > float(0))
    {
        TimerAggitationLevel = 0.0000000;
        SetTimer(TimeAfterAggitationToExplode, false, 'ExplodeAfterAggitation');
        SetTimer(0.1000000, true, 'CheckAggitationLevels');
    }
    LastPawnToTouch = LPP;
    CheckAggitationLevels();
    //return;    
}

simulated function OnUnTouchRadius()
{
    OnTouchRadius(none, 0.0000000);
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    bPrimaryExplosion = LPPlayerController(EventInstigator) != none;
    // End:0x76
    if(LPDestructibleNesting(DamageCauser) != none)
    {
        // End:0x76
        if(bPreventCascadeExplosions)
        {
            // End:0x76
            if(!LPDestructibleNesting(DamageCauser).bPrimaryExplosion)
            {
                return;
            }
        }
    }
    // End:0xA1
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeDNATag'))
    {
        ConditionalAttachDNATag(HitLocation);
    }
    // End:0x14E
    if(!SetupDelayedDamage(Damage, HitInfo, Momentum, false, EventInstigator, 0.0000000, 0.0000000, DamageType, 0.0000000, HitLocation, false, DamageCauser, 0.0000000))
    {
        super(SPGFDestructibleObject).TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    }
    //return;    
}

simulated function TakeRadiusDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x97E50000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private float Momentum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HurtOrigin[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFullDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private float DamageFalloffExponent[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo;

    1.0000000
    bPrimaryExplosion = LPPlayerController(InstigatedBy) != none;
    // End:0x7D
    if(LPDestructibleNesting(DamageCauser) != none)
    {
        // End:0x7D
        if(bPreventCascadeExplosions)
        {
            // End:0x7D
            if(!LPDestructibleNesting(DamageCauser).bPrimaryExplosion)
            {
                return;
            }
        }
    }
    // End:0x152
    if(!SetupDelayedDamage(0, HitInfo, vect(0.0000000, 0.0000000, 0.0000000), true, InstigatedBy, BaseDamage, DamageRadius, DamageType, Momentum, HurtOrigin, bFullDamage, DamageCauser, DamageFalloffExponent))
    {
        super(SPGFDestructibleObject).TakeRadiusDamage(InstigatedBy, BaseDamage, DamageRadius, DamageType, Momentum, HurtOrigin, bFullDamage, DamageCauser, DamageFalloffExponent);
    }
    //return;    
}

simulated function SetupDelayedDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], VMomentum;
    local /*0x97E50000-0x00000000*/ private bool bRadiusDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x97E50000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private float FMomentum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HurtOrigin[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFullDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private float DamageFalloffExponent[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DType;
    local /*0x97E50000-0x00000000*/ private float DelayTimer;
    local /*0x97E50000-0x00000000*/ private @NULL DamageInfo;
    local /*0x97E50000-0x00000000*/ private int Index;
    local /*0x97E50000-0x00000000*/ private @NULL NewInfo;
    local /*0x97E50000-0x00000000*/ private int Count;
    local /*0x97E50000-0x00000000*/ private float Mult;

    1.0000000
    // End:0x52A
    foreach DelayedDamageTypeList(DType)
    {
        // End:0x529
        if((DType.DamageType == DamageType) || ClassIsChildOf(DamageType, DType.DamageType))
        {
            DelayTimer = RandRange(DType.RandomDestructTimeMin, DType.RandomDestructTimeMax);
            Index = -1;
            // End:0x120
            foreach DelayedDamageList(DamageInfo, Index)
            {
                // End:0x11F
                if(DamageInfo.Delay > DelayTimer)
                {
                    continue;                    
                }
                else
                {                    
                }
            }            
            Mult = ((DType.DamageMultiplier <= 0.0000000) ? 1.0000000 : DType.DamageMultiplier);
            NewInfo.Delay = DelayTimer;
            NewInfo.Damage = int(float(Damage) * Mult);
            NewInfo.HitInfo = HitInfo;
            NewInfo.VMomentum = VMomentum;
            NewInfo.bRadiusDamage = bRadiusDamage;
            NewInfo.InstigatedBy = InstigatedBy;
            NewInfo.BaseDamage = BaseDamage;
            NewInfo.DamageRadius = DamageRadius;
            NewInfo.DamageType = DamageType;
            NewInfo.FMomentum = FMomentum;
            NewInfo.HurtOrigin = HurtOrigin;
            NewInfo.bFullDamage = bFullDamage;
            NewInfo.DamageCauser = DamageCauser;
            NewInfo.DamageFalloffExponent = DamageFalloffExponent;
            DelayedDamageList.InsertItem(Index + 1, NewInfo);            
            Count = Index + 2;
            J0x3D4:

            // End:0x42B [Loop If]
            if(Count < DelayedDamageList.Length)
            {
                DelayedDamageList[Count].Delay -= DelayTimer;
                ++Count;
                // [Loop Continue]
                goto J0x3D4;
            }
            // End:0x526
            if(!IsTimerActive('PerformDelayedDamage'))
            {
                // End:0x474
                if(DelayedDamageList[0].Delay <= float(0))
                {
                    PerformDelayedDamage();
                }
                // End:0x4B0
                if(DelayedDamageList.Length > 0)
                {
                    SetTimer(DelayedDamageList[0].Delay, false, 'PerformDelayedDamage');
                }
                // End:0x526
                if(bExplodeAfterAggitation && !IsTimerActive('ExplodeAfterAggitation'))
                {
                    TimerAggitationLevel = 0.0000000;
                    SetTimer(DelayedDamageList[0].Delay, false, 'ExplodeAfterAggitation');
                    SetTimer(0.1000000, true, 'CheckAggitationLevels');
                }
            }            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

simulated function PerformDelayedDamage()
{
    // End:0x26
    if(DelayedDamageList.Length <= 0)
    {
        ClearTimer('PerformDelayedDamage');
        return;
    }
    // End:0x57
    if(!IsAlive())
    {
        DelayedDamageList.Length = 0;
        ClearTimer('PerformDelayedDamage');
        return;
    }
    // End:0x195
    if(DelayedDamageList[0].bRadiusDamage)
    {
        TakeRadiusDamage(DelayedDamageList[0].InstigatedBy, DelayedDamageList[0].BaseDamage, DelayedDamageList[0].DamageRadius, DelayedDamageList[0].DamageType, DelayedDamageList[0].FMomentum, DelayedDamageList[0].HurtOrigin, DelayedDamageList[0].bFullDamage, DelayedDamageList[0].DamageCauser, DelayedDamageList[0].DamageFalloffExponent);        
    }
    else
    {
        TakeDamage(DelayedDamageList[0].Damage, DelayedDamageList[0].InstigatedBy, DelayedDamageList[0].HurtOrigin, DelayedDamageList[0].VMomentum, DelayedDamageList[0].DamageType, DelayedDamageList[0].HitInfo, DelayedDamageList[0].DamageCauser);
    }
    DelayedDamageList.Remove(0, 1);    
    // End:0x2CC
    if((IsAlive()) && DelayedDamageList.Length > 0)
    {
        SetTimer(DelayedDamageList[0].Delay, false, 'PerformDelayedDamage');        
    }
    else
    {
        DelayedDamageList.Length = 0;
        ClearTimer('PerformDelayedDamage');
    }
    //return;    
}

simulated function @NULL HurtRadius()
{
    local /*0x97E50000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private float Momentum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HurtOrigin[8388609], IgnoredActor, InstigatedByController;
    local /*0x97E50000-0x00000000*/ private bool bDoFullDamage[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL Victim;
    local /*0x97E50000-0x00000000*/ private bool bCausedDamage;
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo, HitComponent, NewKActor;

    ((Instigator != none) ? Instigator.Controller : none);    
    // End:0x45
    if(bHurtEntry)
    {
        return false;
    }
    bHurtEntry = true;
    bCausedDamage = false;
    // End:0x29B
    foreach CollidingActors(Class'Engine.Actor', Victim, DamageRadius, HurtOrigin,,, HitInfo)
    {
        // End:0x16A
        if(Victim.bWorldGeometry)
        {
            HitComponent = StaticMeshComponent(HitInfo.HitComponent);
            // End:0x16A
            if((HitComponent != none) && HitComponent.CanBecomeDynamic())
            {
                NewKActor = Class'Engine.KActorFromStatic'.static.MakeDynamic(HitComponent);
                // End:0x16A
                if(NewKActor != none)
                {
                    Victim = NewKActor;
                }
            }
        }
        // End:0x29A
        if(((!Victim.bWorldGeometry && Victim != self) && Victim != IgnoredActor) && Victim.bCanBeDamaged || Victim.bProjTarget)
        {
            Victim.TakeRadiusDamage(InstigatedByController, BaseDamage, DamageRadius, DamageType, Momentum, HurtOrigin, bDoFullDamage, self);
            bCausedDamage = bCausedDamage || Victim.bProjTarget;
        }        
    }    
    bHurtEntry = false;
    return bCausedDamage;
    //return ReturnValue;    
}

simulated function ConditionalAttachDNATag()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];

    // End:0x2F
    if((bIsDNATagged || bWasDNATagged) || !bCanBeTagged)
    {
        return;
    }
    bIsDNATagged = true;
    // End:0x8D
    if((int(WorldInfo.NetMode) != int(NM_DedicatedServer)) && TagParticleSystem != none)
    {
        DNAParticles = new (self) Class'Engine.ParticleSystemComponent';
    }
    // End:0x152
    if(DNAParticles != none)
    {
        DNAParticles.SetTemplate(TagParticleSystem);
        DNAParticles.SetAbsolute(true);
        DNAParticles.SetScale(10.0000000);
        DNAParticles.SetTranslation(HitLocation);
        DNAParticles.ActivateSystem(true);
    }
    //return;    
}

function DNAExtracted()
{
    local /*0x97E50000-0x00000000*/ private @NULL InTagger[8388609], Objective;

    // End:0x86
    if((InTagger != none) && QuestEntry != none)
    {
        Objective = SPQO_ObjectiveBool(QuestEntry.GetQuestObject());
        // End:0x86
        if(Objective != none)
        {
            Objective.AdjustQuestProgress(1.0000000);
        }
    }
    // End:0xB4
    if(DNAParticles != none)
    {
        DNAParticles.DeactivateSystem();
    }
    bIsDNATagged = false;
    bWasDNATagged = true;
    //return;    
}

function OnApplyQuestObjective()
{
    local /*0x97E50000-0x00000000*/ private @NULL Action[8388609];

    QuestEntry = Action.QuestEntry;
    //return;    
}

defaultproperties
{
    AggitationMaterialIndex=-1
    InnerRadiusDamageType=Class'LPDamageTypeMelee'
    bPreventCascadeExplosions=true
    bCanBeTagged=true
    TimeAfterAggitationToExplode=5.0000000
    // Reference: CylinderComponent'Default__LPDestructibleNesting.CollisionCylinder0'
    begin object name=CollisionCylinder0
    end object
    OuterCylinder=CollisionCylinder0
    // Reference: AudioComponent'Default__LPDestructibleNesting.AmbientSoundComponent0'
    begin object name=AmbientSoundComponent0
    end object
    AmbientSoundComponent=AmbientSoundComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPDestructibleNesting.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: DynamicLightEnvironmentComponent'Default__LPDestructibleNesting.MyLightEnvironment2'
    begin object name=MyLightEnvironment2
    end object
    LightEnvironmentToUseForActorSpawnParams=MyLightEnvironment2
    SPKynapseObstacle=none
    Components[0]=none
    Components[1]=CollisionCylinder0
    Components[2]=none
    // Reference: LPTeamAssignmentInteractionMetaData'Default__LPDestructibleNesting.IntMetaA'
    begin object name=IntMetaA class=Class'LPTeamAssignmentInteractionMetaData'
        TeamNumber=ELPTeams.LPTeam_Akrid
    end object
    InteractionMetaData=IntMetaA
    CollisionComponent=CollisionCylinder0
    SupportedEvents=/* Array type was not detected. */
}