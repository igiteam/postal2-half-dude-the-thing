class LPTotemBase extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPPerkDeployable Perk[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private LPPlayerController OwningController[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PerkIndex;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SkelMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL StaticMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EnemySkelMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EnemyStaticMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL VisibleMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL VisibleSkelMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataTotem[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class MyDamageType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int Health[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ExplosionTemplate[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bClientDoExplode[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDrawDebugExplosionSphere[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bExploded;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDeployed[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bBeaconEnded[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReplaced;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel float SinkDepth[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SinkRate[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SinkDepthRemaining;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private TeamInfo Team[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SinkThreshold[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel float TouchRadius[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BeaconLifetime;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL HackComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel EMPInfoStruct EMPInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EMPEffectComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EMPSoundComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GroundActor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TeamID_PhysMaterialIndex;

// Export ULPTotemBase::execFloorLineCheck(FFrame&, void* const)
native static function FloorLineCheck()
{
    local /*0x97E50000-0x00000000*/ private @NULL CheckActor[8388609], Start, End, HitLocation, HitNormal, Extent;

    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x24
    if(VarName == 'SinkDepth')
    {
        PostInitData();        
    }
    else
    {
        // End:0x49
        if(VarName == 'bBeaconEnded')
        {
            EndBeacon();            
        }
        else
        {
            // End:0x7D
            if(VarName == 'bClientDoExplode')
            {
                // End:0x7A
                if(bClientDoExplode == true)
                {
                    DoExplosion();
                }                
            }
            else
            {
                // End:0xA1
                if(VarName == 'TouchRadius')
                {
                    UpdateTouchRadius();                    
                }
                else
                {
                    // End:0x12D
                    if(VarName == 'EMPInfo')
                    {
                        // End:0xF5
                        if(EMPInfo.EMPDuration > float(0))
                        {
                            GotoState('EMPShutdown', 'Begin');                            
                        }
                        else
                        {
                            // End:0x12A
                            if(IsTimerActive('EndEMPEffect'))
                            {
                                ClearTimer('EndEMPEffect');
                                EndEMPEffect();
                            }
                        }                        
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

simulated function @NULL GetMesh()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689];

    return VisibleMesh;
    //return ReturnValue;    
}

simulated function PreBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP, TD;

    super.PreBeginPlay();
    LPP = LPPlayerPawn(Instigator);
    // End:0x10F
    if(LPP != none)
    {
        Perk = LPPerkDeployable(LPP.GetPerkInstance(PerkIndex));
        Team = LPP.GetTeam();
        OwningController = LPPlayerController(LPP.Controller);
        TD = LPTuneDataPerkBeaconBase(Perk.GetTuneData());
        TuneDataTotem = TD;
    }
    //return;    
}

simulated function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP, TD;

    super.PostBeginPlay();
    // End:0x303
    if(int(Role) == int(ROLE_Authority))
    {
        LPP = LPPlayerPawn(Instigator);
        // End:0x303
        if(LPP != none)
        {
            Perk = LPPerkDeployable(LPP.GetPerkInstance(PerkIndex));
            Team = LPP.GetTeam();
            OwningController = LPPlayerController(LPP.Controller);
            TD = LPTuneDataPerkBeaconBase(Perk.GetTuneData());
            TuneDataTotem = TD;
            // End:0x2B2
            if(TD != none)
            {
                ExplosionTemplate = TD.ExplosionTemplate;
                bDrawDebugExplosionSphere = TD.bDrawDebugExplosionRadius;
                Health = int(TD.Health.GetValue(OwningController));
                SinkRate = float(TD.SinkRate);
                SinkDepth = float(TD.SinkDepth);
                TouchRadius = TD.Radius.GetValue(OwningController);
                BeaconLifetime = TD.BeaconLifetime.GetValue(OwningController);
            }
            UpdateTouchRadius();
            // End:0x2F9
            if(LPP.DesiredSinkDepth < float(SinkThreshold))
            {
                SinkDepth = 0.0000000;
            }
            PostInitData();
        }
    }
    //return;    
}

simulated function UpdateTouchRadius()
{
    //return;    
}

simulated function ScriptGetTeamNum()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return byte(Team.TeamIndex);
    //return ReturnValue;    
}

simulated function @NULL PostInitData()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC, MI, MIC, DLE, LCol;

    local /*0x97E50000-0x00000000*/ private int Idx;

    LPC = LPPlayerController(Class'SPEngine.SPUtil'.static.GetPlayerOwner(0).Actor);
    // End:0x162
    if((LPC != none) && Instigator != none)
    {
        // End:0x105
        if(LPC.Pawn.IsSameTeam(Instigator))
        {
            // End:0xE0
            if(SkelMesh != none)
            {
                VisibleMesh = SkelMesh;
                VisibleSkelMesh = SkelMesh;                
            }
            else
            {
                // End:0x102
                if(StaticMesh != none)
                {
                    VisibleMesh = StaticMesh;
                }
            }            
        }
        else
        {
            // End:0x13D
            if(EnemySkelMesh != none)
            {
                VisibleMesh = EnemySkelMesh;
                VisibleSkelMesh = EnemySkelMesh;                
            }
            else
            {
                // End:0x15F
                if(EnemyStaticMesh != none)
                {
                    VisibleMesh = EnemyStaticMesh;
                }
            }
        }        
    }
    else
    {
        VisibleMesh = SkelMesh;
        VisibleSkelMesh = SkelMesh;
    }
    // End:0x217
    if((TuneDataTotem == none) && LPC != none)
    {
        TuneDataTotem = LPTuneDataPerkBeaconBase(LPPlayerPawn(LPC.Pawn).GetPerkInstance(PerkIndex).GetTuneData());
    }
    // End:0x48C
    if(((TeamID_PhysMaterialIndex >= 0) && TuneDataTotem != none) && VisibleMesh != none)
    {
        // End:0x351
        if(VisibleSkelMesh != none)
        {
            // End:0x34E
            if(TuneDataTotem.bDisplayEnemyMeshTeamID || VisibleSkelMesh == SkelMesh)
            {
                MIC = VisibleSkelMesh.CreateAndSetMaterialInstanceConstant(TeamID_PhysMaterialIndex);
                // End:0x34E
                if(MIC != none)
                {
                    LCol = Class'LPGameMP_Base'.static.GetTeamLinearColor(int(Instigator.GetTeamNum()));
                    MIC.SetVectorParameterValue('TeamColor', LCol);
                }
            }            
        }
        else
        {
            // End:0x489
            if(TuneDataTotem.bDisplayEnemyMeshTeamID || VisibleMesh == StaticMesh)
            {
                MI = VisibleMesh.GetMaterial(TeamID_PhysMaterialIndex);
                // End:0x489
                if(MI != none)
                {
                    MIC = VisibleMesh.CreateAndSetMaterialInstanceConstant(TeamID_PhysMaterialIndex);
                    // End:0x489
                    if(MIC != none)
                    {
                        LCol = Class'LPGameMP_Base'.static.GetTeamLinearColor(int(Instigator.GetTeamNum()));
                        MIC.SetVectorParameterValue('TeamColor', LCol);
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x82A
        if(((TuneDataTotem != none) && TuneDataTotem.TeamID_PhysMaterial != none) && VisibleMesh != none)
        {
            // End:0x668
            if(VisibleSkelMesh != none)
            {
                // End:0x665
                if(TuneDataTotem.bDisplayEnemyMeshTeamID || VisibleSkelMesh == SkelMesh)
                {
                    // End:0x664
                    foreach VisibleSkelMesh.SkeletalMesh.Materials(MI, Idx)
                    {
                        // End:0x663
                        if(MI.GetPhysicalMaterial() == TuneDataTotem.TeamID_PhysMaterial)
                        {
                            MIC = VisibleSkelMesh.CreateAndSetMaterialInstanceConstant(Idx);
                            // End:0x663
                            if(MIC != none)
                            {
                                LCol = Class'LPGameMP_Base'.static.GetTeamLinearColor(int(Instigator.GetTeamNum()));
                                MIC.SetVectorParameterValue('TeamColor', LCol);
                            }
                        }                        
                    }                    
                }                
            }
            else
            {
                // End:0x82A
                if(TuneDataTotem.bDisplayEnemyMeshTeamID || VisibleMesh == StaticMesh)
                {
                    Idx = 0;
                    J0x6AE:

                    // End:0x82A [Loop If]
                    if(Idx < VisibleMesh.GetNumElements())
                    {
                        MI = VisibleMesh.GetMaterial(Idx);
                        // End:0x81C
                        if((MI != none) && MI.GetPhysicalMaterial() == TuneDataTotem.TeamID_PhysMaterial)
                        {
                            MIC = VisibleMesh.CreateAndSetMaterialInstanceConstant(Idx);
                            // End:0x81C
                            if(MIC != none)
                            {
                                LCol = Class'LPGameMP_Base'.static.GetTeamLinearColor(int(Instigator.GetTeamNum()));
                                MIC.SetVectorParameterValue('TeamColor', LCol);
                            }
                        }
                        Idx++;
                        // [Loop Continue]
                        goto J0x6AE;
                    }
                }
            }
        }
    }
    VisibleMesh.SetHidden(false);
    AttachComponent(VisibleMesh);
    DLE = new Class'Engine.DynamicLightEnvironmentComponent';
    DLE.bUseBooleanEnvironmentShadowing = false;
    DLE.bSynthesizeSHLight = false;
    DLE.bDynamic = false;
    DLE.bForceNonCompositeDynamicLights = true;
    DLE.SetTickGroup(1);
    DLE.SetEnabled(true);
    AttachComponent(DLE);
    VisibleMesh.SetLightEnvironment(DLE);
    // End:0x98F
    if(bDeployed)
    {
        NotifyDeployed();        
    }
    else
    {
        SetPhysics(2);
    }
    //return;    
}

simulated function IsFriendly()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ((SkelMesh != none) && !SkelMesh.HiddenGame) || (StaticMesh != none) && !StaticMesh.HiddenGame;
    //return ReturnValue;    
}

simulated event @NULL PostInitAnimTree()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super.PostInitAnimTree(SkelComp);
    //return;    
}

simulated event Landed()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

    GroundActor = FloorActor;
    OrientAndDeploy();
    //return;    
}

simulated function OrientAndDeploy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Extent, Loc, Norm, Start, End, F,
	    S, M;

    SetPhysics(0);
    Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    // End:0x20A
    if(((GroundActor == none) || WorldInfo(GroundActor) != none) || GroundActor.bStatic)
    {
        Start = Location + vect(0.0000000, 0.0000000, 50.0000000);
        End = Location - vect(0.0000000, 0.0000000, 200.0000000);
        Extent = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x207
        if(FloorLineCheck(self, Start, End, Loc, Norm, Extent))
        {
            SetLocation(Loc);
            F = Vector(Rotation);
            S = F Cross Norm;
            F = Norm Cross S;
            M.XPlane = F;
            M.YPlane = -S;
            M.ZPlane = Norm;
            SetRotation(MatrixGetRotator(M));            
        }        
    }
    else
    {
        SetBase(GroundActor);
    }
    // End:0x28F
    if(!bDeployed)
    {
        SinkDepthRemaining = SinkDepth;
        NotifyDeployed();
        bDeployed = true;
        // End:0x28F
        if((int(Role) == int(ROLE_Authority)) && BeaconLifetime > float(0))
        {
            SetTimer(BeaconLifetime, false, 'EndBeacon');
        }
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], SinkAmount;
    local /*0x97E50000-0x00000000*/ private @NULL Loc;

    super.Tick(DeltaTime);
    // End:0xA7
    if(SinkDepthRemaining > float(0))
    {
        SinkAmount = FMin(SinkDepthRemaining, DeltaTime * SinkRate);
        SinkDepthRemaining -= SinkAmount;
        Loc = Location;
        Loc.Z -= SinkAmount;
        SetLocation(Loc);
    }
    //return;    
}

function NotifyDeployed()
{
    //return;    
}

simulated function EndBeacon()
{
    local /*0x97E50000-0x00000000*/ private bool bReplace[9437185];

    false
    GotoState('None');
    bBeaconEnded = true;
    bReplaced = bReplace;
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private @NULL InstigatorLPPC;
    local /*0x97E50000-0x00000000*/ private bool bAcceptsFriendlyFire;

    // End:0x48C
    if(int(Role) == int(ROLE_Authority))
    {
        InstigatorLPPC = LPPlayerController(EventInstigator);
        // End:0x48C
        if(!bExploded)
        {
            // End:0x1C3
            if(TuneDataTotem != none)
            {
                bAcceptsFriendlyFire = TuneDataTotem.AcceptFriendlyFireFlag.GetValue(OwningController) != 0.0000000;
                // End:0x11A
                if((!bAcceptsFriendlyFire && EventInstigator != none) && OwningController != none)
                {
                    // End:0x11A
                    if(int(EventInstigator.GetTeamNum()) == int(OwningController.GetTeamNum()))
                    {
                        return;
                    }
                }
                Idx = Class'SPEngine.SPUtil'.static.GetFilteredDamageFactorIndex(TuneDataTotem.DamageFilterInfo, DamageType);
                // End:0x1C3
                if(Idx > -1)
                {
                    DamageAmount *= TuneDataTotem.DamageFilterInfo[Idx].DamageFactor;
                }
            }
            Health -= DamageAmount;
            // End:0x23F
            if(Health <= 0)
            {
                bExploded = true;
                SetTimer(0.1000000, false, 'TimerExplode');
                // End:0x23C
                if(InstigatorLPPC != none)
                {
                    InstigatorLPPC.ServerIncrementStat('Stat_TotemsDestroyed');
                }                
            }
            else
            {
                // End:0x48C
                if(ClassIsChildOf(DamageType, Class'LPDamageType') && class<LPDamageType>(DamageType).default.bCausesEMP)
                {
                    // End:0x48C
                    if(TuneDataTotem.EMPDisruptionDuration.GetValue() > float(0))
                    {
                        EMPInfo.EMPRepCount++;
                        EMPInfo.EMPDuration = TuneDataTotem.EMPDisruptionDuration.GetValue(OwningController);
                        // End:0x418
                        if((ClassIsChildOf(DamageType, Class'LPDamageTypeHalberdEMP') && EventInstigator != none) && LPWeaponHalberd(EventInstigator.Pawn.Weapon) != none)
                        {
                            EMPInfo.EMPDuration *= LPWeaponHalberd(EventInstigator.Pawn.Weapon).GetEMPIncreasedDuration();
                        }
                        // End:0x46A
                        if((InstigatorLPPC != none) && !IsTimerActive('EndEMPEffect'))
                        {
                            InstigatorLPPC.ServerIncrementStat('Stat_EMPShutdowns');
                        }
                        bForceNetUpdate = true;
                        GotoState('EMPShutdown', 'Begin');
                    }
                }
            }
        }
    }
    //return;    
}

simulated event TimerExplode()
{
    DoExplosion();
    bClientDoExplode = true;
    //return;    
}

simulated function DoExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL explosionActor, ExplosionLoc;

    ExplosionLoc = Location;
    SetCollision(false, false);
    explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc + TuneDataTotem.ExplosionOffset);
    // End:0x1A4
    if(explosionActor != none)
    {
        explosionActor.TheWeaponThatSpawnedMe = none;
        explosionActor.Instigator = Instigator;
        explosionActor.InstigatorController = OwningController;
        explosionActor.bDrawDebug = bDrawDebugExplosionSphere;
        explosionActor.ExplosionPhysMaterial = ((VisibleMesh.PhysMaterialOverride != none) ? SPPhysicalMaterial(VisibleMesh.PhysMaterialOverride) : none);
        explosionActor.Explode(ExplosionTemplate);
    }
    SetHidden(true);
    LifeSpan = 1.0000000;
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private bool bIgnoreCount;

    // End:0xA0
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0xA0
        if(OwningController != none)
        {
            bIgnoreCount = bReplaced || (HackComponent != none) && HackComponent.bClonedDeployment;
            OwningController.MPNotifyPerkDestroyed(self, PerkIndex, bIgnoreCount);
        }
    }
    super.Destroyed();
    //return;    
}

simulated function EndEMPEffect()
{
    EMPInfo.EMPDuration = 0.0000000;
    EMPInfo.EMPRepCount++;
    GotoState('None');
    //return;    
}

simulated state EMPShutdown
{
    ignores BeginState;

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        EMPEffectComponent.DeactivateSystem();
        EMPSoundComponent.FadeOut(0.5000000, 0.0000000);
        //return;        
    }
Begin:

    // End:0x27
    if(EMPEffectComponent == none)
    {
        EMPEffectComponent = new (self) Class'Engine.ParticleSystemComponent';
    }
    // End:0xF5
    if(EMPEffectComponent != none)
    {
        EMPEffectComponent.SetTemplate(TuneDataTotem.EMPParticleSystem);
        EMPEffectComponent.__OnSystemFinished__Delegate = None;
        VisibleSkelMesh.AttachComponentToSocket(EMPEffectComponent, 'EMPEffectSocket');
        EMPEffectComponent.SetActive(true);
    }
    // End:0x11C
    if(EMPSoundComponent == none)
    {
        EMPSoundComponent = new (self) Class'Engine.AudioComponent';
    }
    // End:0x1C5
    if(EMPSoundComponent != none)
    {
        EMPSoundComponent.bStopWhenOwnerDestroyed = true;
        EMPSoundComponent.SoundCue = TuneDataTotem.EMPSoundCue;
        EMPSoundComponent.FadeIn(0.1000000, 1.0000000);
        AttachComponent(EMPSoundComponent);
    }
    SetTimer(EMPInfo.EMPDuration, false, 'EndEMPEffect');
    stop;                    
}

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPTotemBase.TotemMeshComp'
    begin object name=TotemMeshComp class=Class'Engine.SkeletalMeshComponent'
    end object
    SkelMesh=TotemMeshComp
    // Reference: SkeletalMeshComponent'Default__LPTotemBase.EnemyTotemMeshComp'
    begin object name=EnemyTotemMeshComp class=Class'Engine.SkeletalMeshComponent'
    end object
    EnemySkelMesh=EnemyTotemMeshComp
    Health=100
    SinkDepth=-999.0000000
    SinkThreshold=5
    // Reference: LPHackableTotemBaseComponent'Default__LPTotemBase.HackComponentA'
    begin object name=HackComponentA class=Class'LPHackableTotemBaseComponent'
    end object
    HackComponent=HackComponentA
    TeamID_PhysMaterialIndex=-1
    // Reference: CylinderComponent'Default__LPTotemBase.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'Engine.CylinderComponent'
    end object
    Components[0]=CollisionCylinder
    Components[1]=HackComponentA
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bAlwaysRelevant=true
    bReplicateInstigator=true
    bKillDuringLevelTransition=true
    bCollideWorld=true
    bNoEncroachCheck=true
    // Reference: LPTotemInteractionMetaData'Default__LPTotemBase.TotemInteract0'
    begin object name=TotemInteract0 class=Class'LPTotemInteractionMetaData'
    end object
    InteractionMetaData=TotemInteract0
    CollisionComponent=CollisionCylinder
}