class LPProj_Grenade extends SPInventoryProjectile
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenadeTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenadeTuneData_MP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastImpactTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel byte TeamNum[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ExplodeTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SoundBeepTimer;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExplosionTemplate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDrawDebugExplosionSphere;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInstigatorCollisionAfterBounce;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsGlued;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasBounced;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bExploded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrenadeAssistTriggeredAtLeastOnce;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGrenadeAssistActive;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoneGuidingIntoGrenadeAssistSocket;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bExplodeOnClients[2097153];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bGrenLogging[1073807361];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bGrenLogToWindow[1073807361];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private bool bFlushGrenLogEachLine[1073807361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsGrenade;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowExplodeOnBeingRunOver;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataGrenade[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name BoneNameGluedTo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnGuidingTo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HiveGuidingTo;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PackHunterGrenadeAssistCoreACosAngRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CrabGrenadeAssistCoreACosAngRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HiveHoleACosAngRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GrenadeIncidentACosAngRange;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DistanceSqFromGrenadeAssistLocationToSwitchToFinalSocket;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PositionLastAssistUpdate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AllAIPawnsInRangeAtInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AllHivesInRangeAtInit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PrevGrenadePos;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxDamageBeforeExplode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenLogFile[536870913];
var(0.25_Pct) /*0x2C200000-0x00000000*/ private editfixedsize array GrenLogFilter[1073807361];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampBeginPlay;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RunOverByPawnRadiusCheck;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int MinBouncesBeforeRunOverCheck;

// Export ULPProj_Grenade::execForceExplosionTexturesRelevant(FFrame&, void* const)
native final simulated function ForceExplosionTexturesRelevant()
{
    local /*0x97E50000-0x00000000*/ private float Seconds[8388609];


}

// Export ULPProj_Grenade::execStaticForceExplosionTexturesRelevant(FFrame&, void* const)
native static final simulated function StaticForceExplosionTexturesRelevant()
{
    local /*0x97E50000-0x00000000*/ private bool bIsMP[8388609];
    local /*0x97E50000-0x00000000*/ private float Seconds[8388609];


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x42
    if(VarName == 'bExplodeOnClients')
    {
        // End:0x3F
        if(!bExploded && bExplodeOnClients)
        {
            DoExplosion();
        }        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(Actor).InitTuneData(TuneData);
    TuneDataGrenade = LPTuneDataWeaponGrenade(TuneData);
    PawnGuidingTo = none;
    HiveGuidingTo = none;
    // End:0x4BA
    if(TuneDataGrenade != none)
    {
        ExplosionTemplate = TuneDataGrenade.ExplosionTemplate;
        // End:0xD0
        if((Instigator != none) && LPAIPawn(Instigator) != none)
        {
            ExplodeTimer = TuneDataGrenade.GrenadeTimerSecondsAI;            
        }
        else
        {
            // End:0x145
            if(TuneDataGrenade.bUseGrenadeMinMaxTimer)
            {
                ExplodeTimer = RandRange(TuneDataGrenade.MinGrenadeTimerSeconds, TuneDataGrenade.MaxGrenadeTimerSeconds);                
            }
            else
            {
                ExplodeTimer = TuneDataGrenade.GrenadeTimerSeconds;
            }
        }
        SoundBeepTimer = TuneDataGrenade.GrenadeTimerSoundSeconds;
        bDrawDebugExplosionSphere = TuneDataGrenade.bDrawDebugExplosionRadius;
        CustomGravityScale = TuneDataGrenade.GrenadeGravityScale;
        // End:0x233
        if(TuneDataGrenade.TrailTemplate != none)
        {
            TrailTemplate = TuneDataGrenade.TrailTemplate;
        }
        // End:0x27F
        if(TuneDataGrenade.InFlightSoundTemplate != none)
        {
            InFlightSoundTemplate = TuneDataGrenade.InFlightSoundTemplate;
        }
        // End:0x2CF
        if(TuneDataGrenade.TrailEmitterLifeSpan > 0.0000000)
        {
            TrailEmitterLifeSpan = TuneDataGrenade.TrailEmitterLifeSpan;
        }
        Bounciness = TuneDataGrenade.Bounciness;
        VelocityDampingFactor = TuneDataGrenade.VelocityDampingFactor;
        InitialSpin.X = RandRange(TuneDataGrenade.MinInitialSpin.X, TuneDataGrenade.MaxInitialSpin.X);
        InitialSpin.Y = RandRange(TuneDataGrenade.MinInitialSpin.Y, TuneDataGrenade.MaxInitialSpin.Y);
        InitialSpin.Z = RandRange(TuneDataGrenade.MinInitialSpin.Z, TuneDataGrenade.MaxInitialSpin.Z);
    }
    //return;    
}

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x44
    if((int(WorldInfo.NetMode) > int(NM_Standalone)) && GrenadeTuneData_MP != none)
    {
        return GrenadeTuneData_MP;
    }
    return GrenadeTuneData;
    //return ReturnValue;    
}

simulated function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL pawnInRange, hiveInRange, LPMI;

    super.PostBeginPlay();
    // End:0x58
    if((int(Role) == int(ROLE_Authority)) && Instigator != none)
    {
        TeamNum = Instigator.GetTeamNum();
    }
    // End:0x78
    if((Instigator != none) && !bIsSimulating)
    {
    }
    DistanceSqFromGrenadeAssistLocationToSwitchToFinalSocket = TuneDataGrenade.DistanceFromGrenadeAssistLocationToSwitchToFinalSocket * TuneDataGrenade.DistanceFromGrenadeAssistLocationToSwitchToFinalSocket;
    bGrenadeAssistActive = false;
    bGrenadeAssistTriggeredAtLeastOnce = false;
    bIsGlued = false;
    TimeStampBeginPlay = WorldInfo.TimeSeconds;
    Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(GrenadeTuneData.AngleOfIncidentForGrenadesFlightPathToAllowAssist.GetValue(), GrenadeIncidentACosAngRange);
    // End:0x30F
    if(!bIsSimulating)
    {
        // End:0x22D
        foreach WorldInfo.AllPawns(Class'LPAIPawn', pawnInRange, Location, TuneDataGrenade.MaxSearchRangeForGrenadeAssist)
        {
            // End:0x22C
            if(pawnInRange.Health > 0)
            {
                AllAIPawnsInRangeAtInit.AddItem(pawnInRange);                
                pawnInRange.NotifyGrenadeOnRange(self);
            }            
        }        
        // End:0x297
        foreach WorldInfo.DynamicActors(Class'LPHiveSpawnPoint', hiveInRange)
        {
            // End:0x296
            if(hiveInRange.Health > 0)
            {
                AllHivesInRangeAtInit.AddItem(hiveInRange);                
            }            
        }        
        // End:0x2BC
        if(SoundBeepTimer >= ExplodeTimer)
        {
            DoBeepSound();            
        }
        else
        {
            SetTimer(ExplodeTimer - SoundBeepTimer, false, 'DoBeepSound');
        }
        ForceExplosionTexturesRelevant(ExplodeTimer + 1.0000000);
        SetTimer(ExplodeTimer, false, 'DoExplosion');
    }
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    // End:0x38E
    if(LPMI.GrenadeActorList.Find(self) < )
    {        
        LPMI.GrenadeActorList.AddItem(self);        
    }
    //return;    
}

simulated function Destroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.GrenadeActorList.Find(self);    
    // End:0x99
    if(iIndex >= 0)
    {
        LPMI.GrenadeActorList.Remove(iIndex, 1);        
    }
    super.Destroyed();
    //return;    
}

simulated function RestartForAkridSpitOut()
{
    local /*0x97E50000-0x00000000*/ private @NULL Spitter[8388609];
    local /*0x97E50000-0x00000000*/ private float TimeTooBoom[8388609];

    PostBeginPlay();
    // End:0x58
    if((int(Role) == int(ROLE_Authority)) && Spitter != none)
    {
        TeamNum = Spitter.GetTeamNum();
    }
    // End:0x67
    if(!bIsSimulating)
    {
    }
    bGrenadeAssistActive = false;
    bGrenadeAssistTriggeredAtLeastOnce = false;
    bIsGlued = false;
    // End:0xF7
    if(!bIsSimulating)
    {
        // End:0xBE
        if(SoundBeepTimer <= TimeTooBoom)
        {
            DoBeepSound();            
        }
        else
        {
            SetTimer(TimeTooBoom - SoundBeepTimer, false, 'DoBeepSound');
        }
        SetTimer(TimeTooBoom, false, 'DoExplosion');
    }
    //return;    
}

simulated function @NULL InitForSimulation()
{
    local /*0x97E50000-0x00000400*/ private @NULL PreviewComponent[8388609], PC;

    super.InitForSimulation(PreviewComponent);
    PC = SPGFWeaponArcPreviewComponent(PreviewComponent);
    // End:0x26B
    if(PC != none)
    {
        PC.MaxSimulationTime = ExplodeTimer;
        PC.MaxBounces = float(TuneDataGrenade.MaxBouncesForPreview);
        PC.SimPreviewPreStartDistance = TuneDataGrenade.SimPreviewPreStartDistance;
        // End:0x143
        if(TuneDataGrenade.PS_PreviewTrail != none)
        {
            PC.PS_PreviewTrail = TuneDataGrenade.PS_PreviewTrail;
        }
        // End:0x210
        if((int(WorldInfo.NetMode) != int(NM_Standalone)) && TuneDataGrenade.bPreviewUseTeamColoring)
        {
            PC.SetPreviewColor(Class'LPGameMP_Base'.static.GetTeamColor(int(Instigator.GetTeamNum())), TuneDataGrenade.PreviewColorIntensity);            
        }
        else
        {
            PC.SetPreviewColor(TuneDataGrenade.PreviewColor, TuneDataGrenade.PreviewColorIntensity);
        }
    }
    // End:0x2EB
    if(int(WorldInfo.NetMode) == int(NM_ListenServer))
    {
        PC.MaxSimulationTime = 1.0000000;
        PC.MaxSimulationTimeAfterFirstBounce = 0.1000000;
        SimFixedTimeStep = 0.0500000;
    }
    //return;    
}

static simulated function CalculateVelocityToHitPoint()
{
    local /*0x97E50000-0x00000000*/ private @NULL InStart[25296897], InEnd;
    local /*0x97E50000-0x00000000*/ private float InXYVel[8388609], InGravityZ;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], HorizontalDirection;
    local /*0x97E50000-0x00000000*/ private float HorizontalDistance, VerticalDistance, Time, InitialVerticalVelocity;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnVelocity;

    HorizontalDirection = InEnd - InStart;
    HorizontalDirection.Z = 0.0000000;
    HorizontalDistance = VSize(HorizontalDirection);
    // End:0x91
    if(HorizontalDistance < 0.0010000)
    {
        ReturnVelocity.Z = InXYVel;        
    }
    else
    {
        HorizontalDirection = HorizontalDirection / HorizontalDistance;
        Time = HorizontalDistance / InXYVel;
        VerticalDistance = InEnd.Z - InStart.Z;
        InitialVerticalVelocity = (VerticalDistance - (((0.5000000 * InGravityZ) * Time) * Time)) / Time;
        ReturnVelocity = HorizontalDirection * InXYVel;
        ReturnVelocity.Z = InitialVerticalVelocity;
    }
    return ReturnVelocity;
    //return ReturnValue;    
}

simulated function @NULL ShouldTouchedActorBlockUs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((((LPCoreShield(Other) != none) || LPDestructibleNesting(Other) != none) || LPDestructibleLeechSack(Other) != none) || LPThermalEnergyPostMeshActor(Other) != none) || (LPPawn(Other) != none) && LPPawn(Other).Mesh == OtherComp;
    //return ReturnValue;    
}

simulated event @NULL HandleCollision()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x75
    if(((!bIsSimulating && int(WorldInfo.NetMode) != int(NM_Standalone)) && int(Role) == int(ROLE_Authority)) && !IsTimerActive('WarnNearbyPlayers'))
    {
        WarnNearbyPlayers();
    }
    // End:0x84
    if(!bIsSimulating)
    {
    }
    super.HandleCollision(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

simulated event ShouldBounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x6A
    if(bIsSimulating)
    {
        // End:0x50
        if(!TuneDataGrenade.bBouncePreviewArcOffPawns && Pawn(Other) != none)
        {
            return false;            
        }
        else
        {
            // End:0x6A
            if(LPHiveSpawnPoint(Other) != none)
            {
                return false;
            }
        }
    }
    return super.ShouldBounce(Other, HitNormal);
    //return ReturnValue;    
}

simulated event @NULL ShouldIgnoreCollision()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo;

    // End:0x20
    if(Other == none)
    {
        // End:0x1E
        if(!bIsSimulating)
        {
        }
        return true;
    }
    // End:0x49
    if(bIsSimulating && SPInventoryProjectile(Other) != none)
    {
        return true;
    }
    // End:0x13C
    if(bBounce)
    {
        // End:0x13C
        if((Velocity Dot HitNormal) > 0.0000000)
        {
            // End:0x12B
            if(!bIsSimulating)
            {
                // End:0x12B
                if((Other == PawnGuidingTo) || LPHiveSpawnPoint(Other) != none)
                {
                    HitInfo = ComputeHitInfo(Other, OtherComp, HitLocation, HitNormal);
                    // End:0x12B
                    if(ProcessForSticking(Other, OtherComp, HitLocation, HitNormal, HitInfo))
                    {
                        return true;                        
                    }
                }
            }
            // End:0x13A
            if(!bIsSimulating)
            {
            }
            return true;
        }
    }
    // End:0x175
    if((Other == Instigator) && BounceCount == 0)
    {
        // End:0x173
        if(!bIsSimulating)
        {
        }
        return true;
    }
    // End:0x22A
    if((!Other.bWorldGeometry && !Other.bBlockActors || (OtherComp != none) && !OtherComp.BlockActors) && !ShouldTouchedActorBlockUs(Other, OtherComp))
    {
        // End:0x228
        if(!bIsSimulating)
        {
        }
        return true;
    }
    // End:0x239
    if(!bIsSimulating)
    {
    }
    return false;
    //return ReturnValue;    
}

simulated function @NULL Bounce()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, HitInfo;

    // End:0x0F
    if(!bIsSimulating)
    {
    }
    // End:0x4B
    if(ProcessForSticking(Other, OtherComp, HitLocation, HitNormal, HitInfo))
    {
        return;
    }
    bGrenadeAssistActive = false;
    super.Bounce(Other, OtherComp, HitLocation, HitNormal, HitInfo);
    //return;    
}

simulated function @NULL ProcessForSticking()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, HitInfo;

    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xF1
    if(bIsGrenade && IsPhysicalMaterialGrenadeGlue(LPPhysicalMaterial(HitInfo.PhysMaterial)))
    {
        // End:0x50
        if(!bIsSimulating)
        {
        }
        // End:0xDF
        if(StickTo(OtherComp.Owner, OtherComp, HitLocation, HitNormal, LPPhysicalMaterial(HitInfo.PhysMaterial)))
        {
            bGrenadeAssistActive = false;
            StopBounce(HitNormal);
            return true;            
        }
        else
        {
            // End:0xEE
            if(!bIsSimulating)
            {
            }
        }        
    }
    else
    {
        // End:0x100
        if(!bIsSimulating)
        {
        }
    }
    return false;
    //return ReturnValue;    
}

event IsPhysicalMaterialGrenadeGlue()
{
    local /*0x97E50000-0x00000000*/ private @NULL PhysMat[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL grenadeGlueTag;

    // End:0x7F
    if(PhysMat != none)
    {
        grenadeGlueTag = LPPhysMatPropTag_GrenadeGlue(PhysMat.GetTag(Class'LPPhysMatPropTag_GrenadeGlue'));
        // End:0x7F
        if((grenadeGlueTag != none) && grenadeGlueTag.bCurrentlyValidForStick)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function DrawStickToDebugArtifacts()
{
    local /*0x97E50000-0x00000000*/ private @NULL ActorStickingTo[8388609], HitLoc;

    //return;    
}

simulated function @NULL StickTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], OtherComponent, HitLocation, HitNormal, PhysMat;

    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn, hitHive;

    // End:0x20
    if(bIsSimulating || !bIsGrenade)
    {
        return false;
    }
    // End:0x293
    if(!bIsGlued)
    {
        HitPawn = LPPawn(HitActor);
        // End:0x176
        if(HitPawn != none)
        {
            // End:0x98
            if(TuneDataGrenade.bShowAssistArc)
            {
                DrawStickToDebugArtifacts(HitPawn, HitLocation);
            }
            // End:0x171
            if((!HitPawn.IsPendingKill() && HitPawn.Health > 0) && !HitPawn.HasDamageImmunityWithEffects())
            {
                // End:0x16E
                if(HitPawn.NotifyOfGrenadeGettingStuckTo(self, OtherComponent, HitNormal, PhysMat))
                {
                    // End:0x156
                    if(!bIsSimulating)
                    {
                    }
                    bIsGlued = true;
                    StopSimulating();
                    return true;
                }                
            }
            else
            {
                return false;
            }            
        }
        else
        {
            hitHive = LPHiveSpawnPoint(HitActor);
            // End:0x293
            if(hitHive != none)
            {
                // End:0x1DF
                if(TuneDataGrenade.bShowAssistArc)
                {
                    DrawStickToDebugArtifacts(hitHive, HitLocation);
                }
                // End:0x291
                if(!hitHive.IsPendingKill() && hitHive.Health > 0)
                {
                    // End:0x28E
                    if(hitHive.NotifyOfGrenadeGettingStuckTo(self, OtherComponent, HitNormal, PhysMat))
                    {
                        // End:0x276
                        if(!bIsSimulating)
                        {
                        }
                        bIsGlued = true;
                        StopSimulating();
                        return true;
                    }                    
                }
                else
                {
                    return false;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function WarnNearbyPlayers()
{
    local /*0x97E50000-0x00000000*/ private @NULL P;

    // End:0x11
    if(!bIsGrenade)
    {
        return;
    }
    // End:0xCC
    foreach VisibleActors(Class'LPBasePlayerPawn', P, DamageRadius)
    {
        // End:0xCB
        if((P.Controller != none) && int(P.GetTeamNum()) != int(GetTeamNum()))
        {
            LPPlayerController(P.Controller).BroadcastChatter(5);
        }        
    }    
    SetTimer(0.5000000, false, 'WarnNearbyPlayers');
    //return;    
}

simulated function IsGrenadeInAssistZoneForThisPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTestAgainst[8388609], ProjectilesMeshLocation;
    local /*0x97E50000-0x00000000*/ private float RangeSqToPawn[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL grenadeAssistSockLoc, grenadeAssistSockRot, displacementToGrenadeAssist;
    local /*0x97E50000-0x00000000*/ private float dotOfGrenadeAssistCoreToGrensLocaiton, dotOfGrensFlightPathToGrenadeAssistCore;
    local /*0x97E50000-0x00000000*/ private @NULL normalizedVelocityVec;

    PawnToTestAgainst.Mesh.GetSocketWorldLocationAndRotation('GrenadeFinalTarget', grenadeAssistSockLoc, grenadeAssistSockRot);
    displacementToGrenadeAssist = ProjectilesMeshLocation - grenadeAssistSockLoc;
    RangeSqToPawn = VSizeSq(displacementToGrenadeAssist);
    // End:0x18F
    if(RangeSqToPawn <= PawnToTestAgainst.RangeSqFromGrenadeFinalDestinationSocketToStartAssist)
    {
        displacementToGrenadeAssist = Normal(displacementToGrenadeAssist);
        dotOfGrenadeAssistCoreToGrensLocaiton = Vector(grenadeAssistSockRot) Dot displacementToGrenadeAssist;
        // End:0x18F
        if(dotOfGrenadeAssistCoreToGrensLocaiton > PawnToTestAgainst.CosAngRangeInFrontOfGrenadeFinalDestinationSocketToAllowAssist)
        {
            displacementToGrenadeAssist = grenadeAssistSockLoc - ProjectilesMeshLocation;
            displacementToGrenadeAssist = Normal(displacementToGrenadeAssist);
            normalizedVelocityVec = Normal(Velocity);
            dotOfGrensFlightPathToGrenadeAssistCore = displacementToGrenadeAssist Dot normalizedVelocityVec;
            // End:0x18F
            if(dotOfGrensFlightPathToGrenadeAssistCore >= GrenadeIncidentACosAngRange)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function IsGrenadeInAssistZoneForThisHive()
{
    local /*0x97E50000-0x00000000*/ private @NULL HiveTestAgainst[8388609], ProjectilesMeshLocation;
    local /*0x97E50000-0x00000000*/ private float RangeSqToHive[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL grenadeAssistSockLoc, grenadeAssistSockRot, displacementToGrenadeAssist;
    local /*0x97E50000-0x00000000*/ private float dotOfGrenadeAssistCoreToGrensLocaiton, dotOfGrensFlightPathToGrenadeAssistCore;
    local /*0x97E50000-0x00000000*/ private @NULL normalizedVelocityVec;

    HiveTestAgainst.VisibleMesh.GetSocketWorldLocationAndRotation('GrenadeFinalTarget', grenadeAssistSockLoc, grenadeAssistSockRot);
    displacementToGrenadeAssist = ProjectilesMeshLocation - grenadeAssistSockLoc;
    RangeSqToHive = VSizeSq(displacementToGrenadeAssist);
    // End:0x18F
    if(RangeSqToHive <= HiveTestAgainst.RangeSqFromGrenadeFinalDestinationSocketToStartAssist)
    {
        displacementToGrenadeAssist = Normal(displacementToGrenadeAssist);
        dotOfGrenadeAssistCoreToGrensLocaiton = Vector(grenadeAssistSockRot) Dot displacementToGrenadeAssist;
        // End:0x18F
        if(dotOfGrenadeAssistCoreToGrensLocaiton > HiveTestAgainst.CosAngRangeInFrontOfGrenadeFinalDestinationSocketToAllowAssist)
        {
            displacementToGrenadeAssist = grenadeAssistSockLoc - ProjectilesMeshLocation;
            displacementToGrenadeAssist = Normal(displacementToGrenadeAssist);
            normalizedVelocityVec = Normal(Velocity);
            dotOfGrensFlightPathToGrenadeAssistCore = displacementToGrenadeAssist Dot normalizedVelocityVec;
            // End:0x18F
            if(dotOfGrensFlightPathToGrenadeAssistCore >= GrenadeIncidentACosAngRange)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

simulated function ShowDebugInitalAssistData()
{
    local /*0x97E50000-0x00000000*/ private bool bUsingGrenFinalTargetSocket[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GrenadesMeshLocation[25296897];

    //return;    
}

simulated function ShowDebugBreakOffAssistData()
{
    local /*0x97E50000-0x00000000*/ private bool bUsingGrenFinalTargetSocket[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL GrenadesMeshLocation[25296897];

    //return;    
}

simulated function DrawGrenadeAssistZone()
{
    //return;    
}

simulated function TestToSeeIfProjectileHasEnteredPawnAssistZone()
{
    local /*0x97E50000-0x00000000*/ private float distanceToCurTarget, rangeSqToPawnTesting;
    local /*0x97E50000-0x00000000*/ private bool bpossibleInZone;
    local /*0x97E50000-0x00000000*/ private @NULL currentTestPawn;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL currentMeshTranslationPos;

    // End:0x1D0
    if((AllAIPawnsInRangeAtInit.Length > 0) && TuneDataGrenade.bEnableGrenadeAssist)
    {
        currentMeshTranslationPos = Location;
        distanceToCurTarget = float(2147483647);
        iter = 0;
        J0x63:

        // End:0x1D0 [Loop If]
        if(iter < AllAIPawnsInRangeAtInit.Length)
        {
            currentTestPawn = AllAIPawnsInRangeAtInit[iter];
            bpossibleInZone = false;
            // End:0x1C2
            if(currentTestPawn.IsValidTargetForGrenadeAssist())
            {
                // End:0xFA
                if(IsGrenadeInAssistZoneForThisPawn(currentTestPawn, currentMeshTranslationPos, rangeSqToPawnTesting))
                {
                    bpossibleInZone = true;
                }
                // End:0x1C2
                if(bpossibleInZone)
                {
                    // End:0x1C2
                    if(rangeSqToPawnTesting < distanceToCurTarget)
                    {
                        // End:0x1C2
                        if(currentTestPawn.Health > 0)
                        {
                            distanceToCurTarget = rangeSqToPawnTesting;
                            bGrenadeAssistTriggeredAtLeastOnce = true;
                            bGrenadeAssistActive = true;
                            bDoneGuidingIntoGrenadeAssistSocket = false;
                            PawnGuidingTo = currentTestPawn;
                            // End:0x1C2
                            if(TuneDataGrenade.bShowAssistArc)
                            {
                                ShowDebugInitalAssistData(true, currentMeshTranslationPos);
                            }
                        }
                    }
                }
            }
            iter++;
            // [Loop Continue]
            goto J0x63;
        }
    }
    //return;    
}

simulated function TestToSeeIfProjectileHasEnteredAnHiveAssistZone()
{
    local /*0x97E50000-0x00000000*/ private float distanceToCurTarget, rangeSqToHiveTesting;
    local /*0x97E50000-0x00000000*/ private bool bpossibleInZone;
    local /*0x97E50000-0x00000000*/ private @NULL currentTestHive;
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private @NULL currentMeshTranslationPos;

    // End:0x212
    if((AllHivesInRangeAtInit.Length > 0) && TuneDataGrenade.bEnableGrenadeAssist)
    {
        currentMeshTranslationPos = Location;
        distanceToCurTarget = float(2147483647);
        iter = 0;
        J0x63:

        // End:0x212 [Loop If]
        if(iter < AllHivesInRangeAtInit.Length)
        {
            currentTestHive = AllHivesInRangeAtInit[iter];
            bpossibleInZone = false;
            // End:0x204
            if(currentTestHive.IsValidTargetForGrenadeAssist())
            {
                // End:0x109
                if(IsGrenadeInAssistZoneForThisHive(currentTestHive, currentMeshTranslationPos, rangeSqToHiveTesting))
                {
                    bpossibleInZone = true;
                    // End:0x109
                    if(!bIsSimulating)
                    {
                    }
                }
                // End:0x204
                if(bpossibleInZone)
                {
                    // End:0x1F5
                    if(rangeSqToHiveTesting < distanceToCurTarget)
                    {
                        // End:0x1E3
                        if(currentTestHive.Health > 0)
                        {
                            distanceToCurTarget = rangeSqToHiveTesting;
                            bGrenadeAssistTriggeredAtLeastOnce = true;
                            bGrenadeAssistActive = true;
                            bDoneGuidingIntoGrenadeAssistSocket = false;
                            HiveGuidingTo = currentTestHive;
                            // End:0x1AA
                            if(!bIsSimulating)
                            {
                            }
                            // End:0x1E0
                            if(TuneDataGrenade.bShowAssistArc)
                            {
                                ShowDebugInitalAssistData(true, currentMeshTranslationPos);
                            }                            
                        }
                        else
                        {
                            // End:0x1F2
                            if(!bIsSimulating)
                            {
                            }
                        }                        
                    }
                    else
                    {
                        // End:0x204
                        if(!bIsSimulating)
                        {
                        }
                    }
                }
            }
            iter++;
            // [Loop Continue]
            goto J0x63;
        }
    }
    //return;    
}

simulated function HandleProjectilePawnAssist()
{
    local /*0x97E50000-0x00000000*/ private @NULL grenadeAssistSockLoc, grenadeAssistSockRot, displacementToGrenadeAssist;
    local /*0x97E50000-0x00000000*/ private float distanceTogrenadeAssistSq, curSpeed;
    local /*0x97E50000-0x00000000*/ private @NULL grenadesNewVelocity, currentMeshTranslationPos;

    // End:0x222
    if(PawnGuidingTo != none)
    {
        currentMeshTranslationPos = Location;
        PawnGuidingTo.Mesh.GetSocketWorldLocationAndRotation('GrenadeAssist', grenadeAssistSockLoc, grenadeAssistSockRot);
        displacementToGrenadeAssist = grenadeAssistSockLoc - currentMeshTranslationPos;
        distanceTogrenadeAssistSq = VSizeSq(displacementToGrenadeAssist);
        // End:0x11A
        if(distanceTogrenadeAssistSq > DistanceSqFromGrenadeAssistLocationToSwitchToFinalSocket)
        {
            displacementToGrenadeAssist = Normal(displacementToGrenadeAssist);
            curSpeed = VSize(Velocity);
            grenadesNewVelocity = displacementToGrenadeAssist * curSpeed;
            SetVelocity(grenadesNewVelocity);            
        }
        else
        {
            PawnGuidingTo.Mesh.GetSocketWorldLocationAndRotation('GrenadeFinalTarget', grenadeAssistSockLoc, grenadeAssistSockRot);
            // End:0x188
            if(!bDoneGuidingIntoGrenadeAssistSocket)
            {
                // End:0x188
                if(!bIsSimulating)
                {
                }
            }
            displacementToGrenadeAssist = grenadeAssistSockLoc - currentMeshTranslationPos;
            displacementToGrenadeAssist = Normal(displacementToGrenadeAssist);
            curSpeed = VSize(Velocity);
            grenadesNewVelocity = displacementToGrenadeAssist * TuneDataGrenade.SpeedToShoveTheGrenadeIntoThePawn;
            SetVelocity(grenadesNewVelocity);
            bDoneGuidingIntoGrenadeAssistSocket = true;
        }
    }
    //return;    
}

simulated function HandleProjectileHiveAssist()
{
    local /*0x97E50000-0x00000000*/ private @NULL grenadeAssistSockLoc, grenadeAssistSockRot, displacementToGrenadeAssist;
    local /*0x97E50000-0x00000000*/ private float distanceTogrenadeAssistSq, curSpeed;
    local /*0x97E50000-0x00000000*/ private @NULL grenadesNewVelocity, currentMeshTranslationPos;

    // End:0x257
    if(HiveGuidingTo != none)
    {
        currentMeshTranslationPos = Location;
        HiveGuidingTo.VisibleMesh.GetSocketWorldLocationAndRotation('GrenadeAssist', grenadeAssistSockLoc, grenadeAssistSockRot);
        displacementToGrenadeAssist = grenadeAssistSockLoc - currentMeshTranslationPos;
        distanceTogrenadeAssistSq = VSizeSq(displacementToGrenadeAssist);
        // End:0x11A
        if(distanceTogrenadeAssistSq > DistanceSqFromGrenadeAssistLocationToSwitchToFinalSocket)
        {
            displacementToGrenadeAssist = Normal(displacementToGrenadeAssist);
            curSpeed = VSize(Velocity);
            grenadesNewVelocity = displacementToGrenadeAssist * curSpeed;
            SetVelocity(grenadesNewVelocity);            
        }
        else
        {
            HiveGuidingTo.VisibleMesh.GetSocketWorldLocationAndRotation('GrenadeFinalTarget', grenadeAssistSockLoc, grenadeAssistSockRot);
            // End:0x1BD
            if(!bDoneGuidingIntoGrenadeAssistSocket)
            {
                // End:0x1AE
                if(TuneDataGrenade.bShowAssistArc)
                {
                    PositionLastAssistUpdate = currentMeshTranslationPos;
                }
                // End:0x1BD
                if(!bIsSimulating)
                {
                }
            }
            displacementToGrenadeAssist = grenadeAssistSockLoc - currentMeshTranslationPos;
            displacementToGrenadeAssist = Normal(displacementToGrenadeAssist);
            curSpeed = VSize(Velocity);
            grenadesNewVelocity = displacementToGrenadeAssist * TuneDataGrenade.SpeedToShoveTheGrenadeIntoThePawn;
            SetVelocity(grenadesNewVelocity);
            bDoneGuidingIntoGrenadeAssistSocket = true;
        }
    }
    //return;    
}

simulated function TestToSeeIfProjectileIsBeingRunOver()
{
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL currentTestPawn, Extent;

    // End:0x77
    if((((((!bIsGrenade || bExploded) || bIsSimulating) || bIsGlued) || bGrenadeAssistActive) || !bAllowExplodeOnBeingRunOver) || BounceCount < MinBouncesBeforeRunOverCheck)
    {
        return;
    }
    Extent.X = RunOverByPawnRadiusCheck;
    Extent.Y = RunOverByPawnRadiusCheck;
    Extent.Z = RunOverByPawnRadiusCheck;
    Idx = 0;
    J0xF4:

    // End:0x1B7 [Loop If]
    if(Idx < AllAIPawnsInRangeAtInit.Length)
    {
        currentTestPawn = AllAIPawnsInRangeAtInit[Idx];
        // End:0x1A9
        if(currentTestPawn.ShouldGrenadesIRunOverExplode())
        {
            // End:0x1A9
            if(currentTestPawn.PointCheckComponent(currentTestPawn.Mesh, Location, Extent))
            {
                DoExplosion();
                return;
            }
        }
        Idx++;
        // [Loop Continue]
        goto J0xF4;
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(SPEngineProjectile).Tick(DeltaTime);
    // End:0x98
    if((((bIsGrenade && !bIsSimulating) && !bIsGlued) && !bGrenadeAssistActive) && BounceCount == 0)
    {
        TestToSeeIfProjectileHasEnteredPawnAssistZone();
        // End:0x98
        if(!bIsGlued && !bGrenadeAssistActive)
        {
            TestToSeeIfProjectileHasEnteredAnHiveAssistZone();
        }
    }
    // End:0x119
    if((((bIsGrenade && !bIsSimulating) && !bIsGlued) && bGrenadeAssistActive) && !bDoneGuidingIntoGrenadeAssistSocket)
    {
        // End:0x100
        if(PawnGuidingTo != none)
        {
            HandleProjectilePawnAssist();
        }
        // End:0x119
        if(HiveGuidingTo != none)
        {
            HandleProjectileHiveAssist();
        }
    }
    TestToSeeIfProjectileIsBeingRunOver();
    //return;    
}

simulated function @NULL HitWall()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp;

    // End:0x39
    if(bIsSimulating && (Velocity Dot HitNormal) > 0.0000000)
    {
        StopSimulating();
        return;
    }
    super.HitWall(HitNormal, Wall, WallComp);
    //return;    
}

simulated event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x39
    if(bIsSimulating && (Velocity Dot HitNormal) > 0.0000000)
    {
        StopSimulating();
        return;
    }
    super.Bump(Other, OtherComp, HitNormal);
    //return;    
}

simulated function Explode()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609], HitNormal;

    //return;    
}

simulated function StopExplosionTimer()
{
    // End:0x43
    if(SoundComponent != none)
    {
        SoundComponent.FadeOut(0.2000000, 0.0000000);
        SoundComponent = none;
    }
    ClearTimer('DoExplosion', self);
    StopSimulating();
    //return;    
}

simulated function DoBeepSound()
{
    // End:0x4F
    if(TuneDataWeaponSoundEventBindings != none)
    {
        SoundComponent = TuneDataWeaponSoundEventBindings.PlayEventSoundLocallyEx('GrenadeTimer', 'GrenadeTimer', self, none, none);
    }
    //return;    
}

simulated function @NULL DoImpact()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    //return;    
}

simulated function GetExplosionSpawnRotation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Rotator(vect(0.0000000, 0.0000000, 1.0000000));
    //return ReturnValue;    
}

simulated function InitExplosionActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InExplosion[8388609];

    //return;    
}

simulated function DoExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL explosionActor;

    bExploded = true;
    ClearTimer('DoExplosion', self);
    bExplodeOnClients = true;
    bForceNetUpdate = true;
    bNetDirty = true;
    // End:0x21A
    if(ExplosionTemplate != none)
    {
        explosionActor = Spawn(Class'LPExplosionActor',,, GetExplosionSpawnLocation(), GetExplosionSpawnRotation());
        // End:0x1EA
        if(explosionActor != none)
        {
            explosionActor.TheWeaponThatSpawnedMe = self;
            explosionActor.Instigator = Instigator;
            explosionActor.InstigatorController = InstigatorController;
            explosionActor.bDrawDebug = bDrawDebugExplosionSphere;
            explosionActor.ExplosionPhysMaterial = ((Mesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(Mesh.PhysMaterialOverride) : none);
            InitExplosionActor(explosionActor);
            explosionActor.Explode(ExplosionTemplate);
            // End:0x1EA
            if(!bIsSimulating)
            {
            }
        }
        SetHidden(true);
        SetLifetime(1.0000000);
        SetTimer(0.1000000, false, 'StopSimulating');        
    }
    else
    {
        SetHidden(true);
        SetLifetime(0.1000000);
        SetTimer(0.0000000, false, 'StopSimulating');
    }
    // End:0x2DA
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x2DA
        if(LPPRI(Instigator.PlayerReplicationInfo) != none)
        {
            LPPRI(Instigator.PlayerReplicationInfo).NoteWeaponDischargeTime();
        }
    }
    //return;    
}

simulated function GetVisibleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetSkeletalMesh().GetBoneLocation('JO_armingDvc');
    //return ReturnValue;    
}

simulated function GetExplosionSpawnLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return (GetVisibleLocation()) + (vect(0.0000000, 0.0000000, 1.0000000) * float(32));
    //return ReturnValue;    
}

function NotifyShootDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609];

    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmt[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private bool bAllowDamage;

    // End:0x38
    if(((int(Role) < int(ROLE_Authority)) || DamageAmt <= 0) || bExploded)
    {
        return;
    }
    // End:0x71
    if((InstigatorController != none) && InstigatedBy != none)
    {
        // End:0x71
        if(InstigatorController == InstigatedBy)
        {
            return;
        }
    }
    bAllowDamage = false;
    // End:0xB7
    if(class<LPDamageType>(DamageType).default.bCausesExplosiveReactions)
    {
        bAllowDamage = true;        
    }
    else
    {
        // End:0xFF
        if(GrenadeTuneData.bAllowDamageFromBullets && ClassIsChildOf(DamageType, Class'LPDamageTypeBallistic'))
        {
            bAllowDamage = true;
        }
    }
    // End:0x110
    if(!bAllowDamage)
    {
        return;
    }
    MaxDamageBeforeExplode -= float(DamageAmt);
    // End:0x16F
    if(MaxDamageBeforeExplode <= float(0))
    {
        // End:0x159
        if(InstigatedBy != none)
        {
            NotifyShootDown(InstigatedBy);
        }
        bForceNetUpdate = true;
        DoExplosion();
    }
    //return;    
}

event GrenLog_Internal()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string LogText[142606337];

    //return;    
}

defaultproperties
{
    bInstigatorCollisionAfterBounce=true
    bIsGrenade=true
    MaxDamageBeforeExplode=1.0000000
    RunOverByPawnRadiusCheck=10.0000000
    MinBouncesBeforeRunOverCheck=3
    bWantsMeshUsingPhysX=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_Grenade.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    CustomGravityScale=1.0000000
    DamageRadius=0.0000000
    // Reference: CylinderComponent'Default__LPProj_Grenade.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    bNetTemporary=false
    bAlwaysRelevant=true
    bNetInitialRotation=true
    bKillDuringLevelTransition=true
    bBlockActors=true
    bBounce=true
    NetUpdateFrequency=10.0000000
    CollisionComponent=CollisionCylinder
}