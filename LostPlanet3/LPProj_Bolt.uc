class LPProj_Bolt extends LPProj_Rocket
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bExplosiveWhileResting;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRetrievable;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bResting;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TeamID_PhysMaterial;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ProximityComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataExplodingBolt[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExplodeLocation;

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x24
    if(VarName == 'TeamNum')
    {
        HandleTeamColoring();        
    }
    else
    {
        super(LPProj_Grenade).ReplicatedEvent(VarName);
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(LPProj_Grenade).InitTuneData(TuneData);
    TuneDataExplodingBolt = LPTuneDataWeaponExplodingBolt(TuneData);
    ProximityComponent.SetCylinderSize(TuneDataExplodingBolt.InFlightProximityRadius, TuneDataExplodingBolt.InFlightProximityHeight);
    //return;    
}

simulated function PostBeginPlay()
{
    super(SPInventoryProjectile).PostBeginPlay();
    bExploded = false;
    HandleTeamColoring();
    //return;    
}

simulated function @NULL HandleTeamColoring()
{
    local /*0x97E50000-0x00000000*/ private @NULL MI, MIC, SkelMesh, LCol;
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0x150
    if(TeamID_PhysMaterial != none)
    {
        SkelMesh = GetSkeletalMesh();
        // End:0x150
        if(SkelMesh != none)
        {
            // End:0x14F
            foreach SkelMesh.SkeletalMesh.Materials(MI, Idx)
            {
                // End:0x14E
                if(MI.GetPhysicalMaterial() == TeamID_PhysMaterial)
                {
                    MIC = SkelMesh.CreateAndSetMaterialInstanceConstant(Idx);
                    // End:0x14E
                    if(MIC != none)
                    {
                        LCol = Class'LPGameMP_Base'.static.GetTeamLinearColor(int(TeamNum));
                        MIC.SetVectorParameterValue('Team', LCol);
                    }
                }                
            }            
        }
    }
    //return;    
}

simulated function KillPooledProjectile()
{
    ClearTimer('StopSimulating', self);
    super(SPEngineProjectile).KillPooledProjectile();
    //return;    
}

simulated function @NULL HitWall()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp;

    StopSimulating();
    // End:0x5A
    if(!bExplosiveWhileResting && !bRetrievable)
    {
        DoImpact(Wall, WallComp, Location, HitNormal);
        return;
    }
    CollisionComponent.SetTraceBlocking(false, true);
    SetCollision(true, false);
    SetPhysics(0);
    bResting = true;
    // End:0x10D
    if(!bExplosiveWhileResting)
    {
        CylinderComponent(CollisionComponent).SetCylinderSize(30.0000000, 30.0000000);
        SetLifetime(GrenadeTuneData.RestingLifeSpan);
        Instigator = none;
        SetOwner(none);        
    }
    else
    {
        SetLifetime(ExplodeTimer + float(1));
        CylinderComponent(CollisionComponent).SetCylinderSize(TuneDataExplodingBolt.ProximityRadius, TuneDataExplodingBolt.ProximityHeight);
    }
    super(LPProj_Grenade).HitWall(HitNormal, Wall, WallComp);
    //return;    
}

simulated event @NULL ShouldIgnoreCollision()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL P;

    // End:0x0F
    if(bExploded)
    {
        return true;
    }
    // End:0x29
    if(Projectile(Other) != none)
    {
        return true;
    }
    // End:0x72
    if((SPPawn(Other) != none) && !SPPawn(Other).IsAlive())
    {
        return true;
    }
    // End:0xC3
    if((LPDestructibleLeechSack(Other) != none) && LPDestructibleLeechSack(Other).ColCylinder == OtherComp)
    {
        return true;
    }
    // End:0x133
    if(bResting)
    {
        // End:0x133
        if(!bExplosiveWhileResting)
        {
            P = Pawn(Other);
            // End:0x133
            if((P != none) && !P.IsA('LPPlayerPawn'))
            {
                return true;
            }
        }
    }
    return super(LPProj_Grenade).ShouldIgnoreCollision(Other, OtherComp, HitLocation, HitNormal);
    //return ReturnValue;    
}

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPP, IM;

    // End:0x219
    if((Other != Instigator) && LPPlayerPawn(Other) != none)
    {
        // End:0x219
        if(bResting)
        {
            // End:0x155
            if(bExplosiveWhileResting)
            {
                // End:0x152
                if((InstigatorController == none) || int(InstigatorController.GetTeamNum()) != int(LPPlayerPawn(Other).GetTeamNum()))
                {
                    SetTimer(TuneDataExplodingBolt.ExplodeDelay, false, 'DoExplosion');
                    DoTriggeredSound();
                    // End:0x11B
                    if(SoundBeepTimer >= TuneDataExplodingBolt.ExplodeDelay)
                    {
                        DoBeepSound();                        
                    }
                    else
                    {
                        SetTimer(TuneDataExplodingBolt.ExplodeDelay - SoundBeepTimer, false, 'DoBeepSound');
                    }
                }                
            }
            else
            {
                // End:0x217
                if(bRetrievable)
                {
                    LPP = LPPlayerPawn(Other);
                    // End:0x20D
                    if((LPP != none) && LPP.InvManager != none)
                    {
                        IM = SPEngineInventoryManager(LPP.InvManager);
                        IM.AddAmmoFromWeaponClass(Class'LPWeaponCrossbow', 1);
                    }
                    KillPooledProjectile();
                }
            }
            return;
        }
    }
    ExplodeLocation = HitLocation;
    super(SPInventoryProjectile).Touch(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

simulated event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    ExplodeLocation = Location;
    super(LPProj_Grenade).Bump(Other, OtherComp, HitNormal);
    //return;    
}

simulated function @NULL ShouldTouchedActorBlockUs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPPawn(Other) != none)
    {
        return true;
    }
    return super(LPProj_Grenade).ShouldTouchedActorBlockUs(Other, OtherComp);
    //return ReturnValue;    
}

simulated function @NULL DoImpact()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, HitInfo;

    HitInfo = ComputeHitInfo(Other, OtherComp, HitLocation, HitNormal);
    // End:0xD7
    if(int(Other.Role) <= int(Role))
    {
        NotifyHit(Other);
        Other.TakeDamage(int(Damage), InstigatorController, HitLocation, vect(0.0000000, 0.0000000, 0.0000000), MyDamageType, HitInfo, self);
    }
    // End:0x2CE
    if(!Class'Engine.Weapon'.static.PassThroughDamage(Other))
    {
        // End:0x18E
        if(HitInfo.PhysMaterial != none)
        {
            SPPhysicalMaterial(HitInfo.PhysMaterial).PlayImpactEffects(self, HitInfo, HitLocation, -Vector(Rotation), MyDamageType, false, false, false);
        }
        SetVelocity(vect(0.0000000, 0.0000000, 0.0000000));
        // End:0x234
        if(TuneDataExplodingBolt.bExplodeOnContact || !Other.bWorldGeometry && !Other.bStatic)
        {
            // End:0x231
            if(int(Role) == int(ROLE_Authority))
            {
                DoExplosion();
            }            
        }
        else
        {
            // End:0x2B5
            if(bExplosiveWhileResting)
            {
                StopInFlightAudio();
                StopTrailEmitter();
                SetTimer(ExplodeTimer, false, 'DoExplosion');
                // End:0x290
                if(SoundBeepTimer >= ExplodeTimer)
                {
                    DoBeepSound();                    
                }
                else
                {
                    SetTimer(ExplodeTimer - SoundBeepTimer, false, 'DoBeepSound');
                }                
            }
            else
            {
                // End:0x2CE
                if(!bRetrievable)
                {
                    KillPooledProjectile();
                }
            }
        }
    }
    //return;    
}

simulated function DoTriggeredSound()
{
    // End:0x4F
    if(TuneDataWeaponSoundEventBindings != none)
    {
        SoundComponent = TuneDataWeaponSoundEventBindings.PlayEventSoundLocallyEx('ExplodingBoltTriggered', 'ExplodingBoltTriggered', self, none, none);
    }
    //return;    
}

simulated function GetVisibleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Location;
    //return ReturnValue;    
}

simulated function GetExplosionSpawnLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return ExplodeLocation;
    //return ReturnValue;    
}

simulated function InitExplosionActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InExplosion[8388609];

    // End:0x80
    if(bExplosiveWhileResting && int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        ExplosionTemplate.Damage = 35.0000000;
        ExplosionTemplate.DamageToPlayerPawn = 21.0000000;
    }
    super.InitExplosionActor(InExplosion);
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmt[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    //return;    
}

defaultproperties
{
    // Reference: CylinderComponent'Default__LPProj_Bolt.ProximityCylinder'
    begin object name=ProximityCylinder class=Class'Engine.CylinderComponent'
    end object
    ProximityComponent=ProximityCylinder
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_Bolt.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    bPooledInstance_UseLifetime=true
    PooledInstance_LifeTime=4.0000000
    // Reference: CylinderComponent'Default__LPProj_Bolt.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    Components[2]=ProximityCylinder
    LifeSpan=4.0000000
    CollisionComponent=CollisionCylinder
}