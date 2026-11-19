class LPProj_AkridBase extends SPInventoryProjectile
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Proj_AkridBaseTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Proj_AkridBaseTuneData_MP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte TeamNum[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExplosionTemplate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDrawDebugExplosionSphere;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bExploded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldTraceAginstPawnColCylInCover;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AkridInFlightSoundTemplate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InstigatorAkrid;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DamageTaken;

// Export ULPProj_AkridBase::execDisableRBCollisionWithPawn(FFrame&, void* const)
native function DisableRBCollisionWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];


}

// Export ULPProj_AkridBase::execInit(FFrame&, void* const)
native simulated function Init()
{
    local /*0x97E50000-0x00000000*/ private @NULL Direction[8388609];


}

// Export ULPProj_AkridBase::execStartInFlightAudio(FFrame&, void* const)
protected native simulated function StartInFlightAudio();

// Export ULPProj_AkridBase::execSpawnTrail(FFrame&, void* const)
protected native simulated function SpawnTrail();

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    super.ReplicatedEvent(VarName);
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(Actor).InitTuneData(TuneData);
    Proj_AkridBaseTuneData = LPTuneDataWeaponAkridBase(TuneData);
    // End:0x10F
    if(Proj_AkridBaseTuneData != none)
    {
        ExplosionTemplate = Proj_AkridBaseTuneData.ExplosionTemplate;
        bDrawDebugExplosionSphere = Proj_AkridBaseTuneData.bDrawDebugExplosionRadius;
        CustomGravityScale = float(Max(0, int(Proj_AkridBaseTuneData.AkridBaseProjGravityScale)));
        TrailTemplate = Proj_AkridBaseTuneData.TrailTemplate;
        AkridInFlightSoundTemplate = Proj_AkridBaseTuneData.InFlightSoundTemplate;
    }
    //return;    
}

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x44
    if((int(WorldInfo.NetMode) > int(NM_Standalone)) && Proj_AkridBaseTuneData_MP != none)
    {
        return Proj_AkridBaseTuneData_MP;
    }
    return Proj_AkridBaseTuneData;
    //return ReturnValue;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x58
    if((int(Role) == int(ROLE_Authority)) && Instigator != none)
    {
        TeamNum = Instigator.GetTeamNum();
    }
    bExploded = false;
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    //return;    
}

simulated function @NULL ShouldTouchedActorBlockUs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((LPCoreShield(Other) != none) || LPDestructibleNesting(Other) != none) || (LPPawn(Other) != none) && LPPawn(Other).Mesh == OtherComp;
    //return ReturnValue;    
}

simulated event @NULL ShouldIgnoreCollision()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPAIPawnAkrid(Other) != none)
    {
        return true;
    }
    // End:0x34
    if(LPHiveSpawnPoint(Other) != none)
    {
        return true;
    }
    // End:0x7B
    if((SPInventoryProjectile(Other) != none) && SPInventoryProjectile(Other).bIsSimulating)
    {
        return true;
    }
    return super.ShouldIgnoreCollision(Other, OtherComp, HitLocation, HitNormal);
    //return ReturnValue;    
}

simulated function @NULL DoImpact()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x35
    if(!bExploded)
    {
        DoExplosion();
        DoImpactDamage(Other, HitNormal);
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL currentMeshTranslationPos;

    // End:0x71
    if((InstigatorAkrid != none) && InstigatorAkrid.TuneDataAIPawn.bShowLobFireAttackDebug)
    {
        currentMeshTranslationPos = Mesh.GetPosition();
    }
    super(SPEngineProjectile).Tick(DeltaTime);
    // End:0xF7
    if((InstigatorAkrid != none) && InstigatorAkrid.TuneDataAIPawn.bShowLobFireAttackDebug)
    {
        InstigatorAkrid.LobProjMeshLocations.AddItem(currentMeshTranslationPos);        
    }
    //return;    
}

simulated function Explode()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609], HitNormal;

    //return;    
}

simulated function DoExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL explosionActor, ExplosionLoc, currentMeshTranslationPos;

    currentMeshTranslationPos = Mesh.GetPosition();
    ExplosionLoc = Mesh.GetPosition();
    // End:0xEA
    if((InstigatorAkrid != none) && InstigatorAkrid.TuneDataAIPawn.bShowLobFireAttackDebug)
    {
        InstigatorAkrid.LobProjImpactLocation = currentMeshTranslationPos;
        InstigatorAkrid.LobProjExplosionLocation = ExplosionLoc;
    }
    bExploded = true;
    explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc, Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
    // End:0x26F
    if(explosionActor != none)
    {
        explosionActor.TheWeaponThatSpawnedMe = self;
        explosionActor.Instigator = Instigator;
        explosionActor.InstigatorController = InstigatorController;
        explosionActor.bDrawDebug = bDrawDebugExplosionSphere;
        explosionActor.ExplosionPhysMaterial = ((Mesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(Mesh.PhysMaterialOverride) : none);
        explosionActor.Explode(ExplosionTemplate);
    }
    SetHidden(true);
    LifeSpan = 1.0000000;
    SetTimer(0.1000000, false, 'StopSimulating');
    // End:0x340
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        // End:0x340
        if((Instigator != none) && LPPRI(Instigator.PlayerReplicationInfo) != none)
        {
            LPPRI(Instigator.PlayerReplicationInfo).NoteWeaponDischargeTime();
        }
    }
    //return;    
}

simulated function DoImpactDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitVictim[8388609], ContactNormal, ExplosionLoc, PawnHit;
    local /*0x97E50000-0x00000000*/ private float ammountOfDamage;
    local /*0x97E50000-0x00000000*/ private class TypeOfDamageToApply;

    // End:0x104
    if(ClassIsChildOf(HitVictim.Class, Class'LPPawn'))
    {
        PawnHit = LPPawn(HitVictim);
        // End:0x101
        if(CanThisPawnBeDamagedByPhysicalContactWithTheBlob(PawnHit, ammountOfDamage, TypeOfDamageToApply))
        {
            ExplosionLoc = Mesh.GetPosition();
            PawnHit.TakeDamage(int(ammountOfDamage), InstigatorController, ExplosionLoc, -VSize2D(Velocity) * ContactNormal, TypeOfDamageToApply,, self);
        }        
    }
    else
    {
        // End:0x18E
        if(ClassIsChildOf(HitVictim.Class, Class'LPVSThermalEnergyPocket'))
        {
            LPVSThermalEnergyPocket(HitVictim).TakeImpactDamage(self.Class, Mesh.GetPosition());
        }
    }
    //return;    
}

simulated function CanThisPawnBeDamagedByPhysicalContactWithTheBlob()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pawn2Test[8388609];
    local /*0x97E50000-0x00000000*/ private float ammountOfDamage[25165825];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamageToApply[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int ipawnType, numOfPawnTypes;

    // End:0x169
    if(Pawn2Test != none)
    {
        numOfPawnTypes = Proj_AkridBaseTuneData.ListOfPawnTypesDamagedOnContact.Length;
        ipawnType = 0;
        J0x43:

        // End:0x169 [Loop If]
        if(ipawnType < numOfPawnTypes)
        {
            // End:0x15B
            if(ClassIsChildOf(Pawn2Test.Class, Proj_AkridBaseTuneData.ListOfPawnTypesDamagedOnContact[ipawnType].PawnTypeAllowedToDamage))
            {
                ammountOfDamage = Proj_AkridBaseTuneData.ListOfPawnTypesDamagedOnContact[ipawnType].AmmountOfDamageHitPawn.GetValue();
                TypeOfDamageToApply = Proj_AkridBaseTuneData.ListOfPawnTypesDamagedOnContact[ipawnType].DamageTypeForImpactHit;
                return true;
            }
            ipawnType++;
            // [Loop Continue]
            goto J0x43;
        }
    }
    return false;
    //return ReturnValue;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    DamageTaken += DamageAmount;
    // End:0xFF
    if(!bExploded && Proj_AkridBaseTuneData.bAllowedToDestoryOnTakeDamage)
    {
        super(Actor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        // End:0xFF
        if(DamageTaken >= Proj_AkridBaseTuneData.AmountOfDamageToDestroy)
        {
            DoImpact(DamageCauser, HitInfo.HitComponent, HitLocation, Momentum);
        }
    }
    //return;    
}

simulated function GetExplosionSpawnLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Mesh.GetPosition();
    //return ReturnValue;    
}

simulated function KillSelf()
{
    StopSimulating();
    SetHidden(true);
    LifeSpan = 0.0000000;
    //return;    
}

function UpdateCloudParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cloud[8388609];

    //return;    
}

defaultproperties
{
    bShouldTraceAginstPawnColCylInCover=true
    bForceZeroExtentMovement=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_AkridBase.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    CustomGravityScale=1.0000000
    DamageRadius=0.0000000
    // Reference: CylinderComponent'Default__LPProj_AkridBase.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    bNetTemporary=false
    bAlwaysRelevant=true
    bNetInitialRotation=true
    bKillDuringLevelTransition=true
    CollisionComponent=CollisionCylinder
}