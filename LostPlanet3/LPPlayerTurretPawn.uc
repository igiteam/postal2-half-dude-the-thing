class LPPlayerTurretPawn extends LPVSFuturePlayerPawn
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SwivelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int SwivelYaw[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel @NULL SeatedPawn[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LocalSeatedPawn;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SeatedMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ShieldMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SeatedMeshSlotNode;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDisabled[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bRepEffects[2097153];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DestroyedParticles[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array ShieldMatInstances;

// Export ULPPlayerTurretPawn::execFaceRotationNative(FFrame&, void* const)
native simulated function FaceRotationNative()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewRotation[8388609];
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPPlayerTurretPawn::execSetSwivel(FFrame&, void* const)
native simulated function SetSwivel()
{
    local /*0x97E50000-0x00000000*/ private int InSwivel[8388609];


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x57
    if(VarName == 'SeatedPawn')
    {
        // End:0x54
        if((SeatedPawn != none) && LocalSeatedPawn == none)
        {
            LocalSeatedPawn = SeatedPawn;
            ParentToSeatedPawn();
        }        
    }
    else
    {
        // End:0xA9
        if(VarName == 'bRepEffects')
        {
            // End:0x92
            if(bRepEffects)
            {
                PlayDeathEffects();
                HideShield();                
            }
            else
            {
                DisableParticles();
                ShowShield();
            }            
        }
        else
        {
            super.ReplicatedEvent(VarName);
        }
    }
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    Mesh.AttachComponent(ShieldMesh, 'JO_oscillate');
    CreateMaterialInstances();
    //return;    
}

simulated function PlayerCanEnter()
{
    local /*0x97E50000-0x00000000*/ private @NULL EntryPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float PlayerDot;
    local /*0x97E50000-0x00000000*/ private @NULL LocalRot;
    local /*0x97E50000-0x00000000*/ private float newVal;

    // End:0x0F
    if(bDisabled)
    {
        return false;
    }
    newVal = (float(Rotation.Yaw) - (float(90) * 182.0444000)) - float(SwivelControl.BoneRotation.Yaw);
    // End:0xA7
    if((Abs(newVal) > float(1)) && Abs(newVal) < float(65535))
    {
        return false;
    }
    LocalRot = Rotation;
    LocalRot.Yaw += SwivelYaw;
    PlayerDot = Vector(LocalRot) Dot Normal(EntryPawn.Location - Location);
    return PlayerDot < 0.0000000;
    //return ReturnValue;    
}

simulated function @NULL PerformPostInitAnimTreeActions()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super(LPPawn).PerformPostInitAnimTreeActions(SkelComp);
    SwivelControl = SkelControlSingleBone(SkelComp.FindSkelControl('Swivel'));
    // End:0xAE
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        SetSwivel(int(float(Rotation.Yaw) - (float(90) * 182.0444000)));
    }
    //return;    
}

simulated function ParentToSeatedPawn()
{
    SeatedMesh.SetSkeletalMesh(SeatedPawn.Mesh.SkeletalMesh);
    SeatedMesh.SetPhysicsAsset(SeatedPawn.Mesh.PhysicsAsset);
    SeatedPawn.SetHidden(true);
    Mesh.AttachComponentToSocket(SeatedMesh, 'Seat');
    // End:0x141
    if(SeatedMeshSlotNode == none)
    {
        SeatedMeshSlotNode = SPAnimNodeSlot(SeatedMesh.FindAnimNode('FullBodySlotNode'));
    }
    SeatedMeshSlotNode.PlayCustomAnim('CHA_PlayerPast_turret_idle_Core', 1.0000000, 0.0000000, 0.1000000, true, true);
    //return;    
}

simulated function UnparentFromSeatedPawn()
{
    SeatedMeshSlotNode.StopCustomAnim(0.1000000);
    SeatedMesh.SetSkeletalMesh(none);
    SeatedMesh.SetPhysicsAsset(none);
    SeatedMesh.DetachFromAny();
    SetSwivel(int(float(Rotation.Yaw) - (float(90) * 182.0444000)));
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    BlendToSwivel();
    // End:0x52
    if((SeatedPawn == none) && LocalSeatedPawn != none)
    {
        UnparentFromSeatedPawn();
        LocalSeatedPawn = none;
    }
    // End:0xA8
    if((float(Health) / float(HealthMax)) >= 0.5000000)
    {
        // End:0xA8
        if(int(Role) == int(ROLE_Authority))
        {
            DisableParticles();
            ShowShield();
            bDisabled = false;
        }
    }
    SetShieldGlow(1.0000000 - (float(Health) / float(HealthMax)));
    //return;    
}

simulated function UpdateAnticipation()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

simulated function IsVitalSuit()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function UnPossessed()
{
    super.UnPossessed();
    SetSwivel(Rotation.Yaw);
    //return;    
}

function Died()
{
    local /*0x97E50000-0x00000000*/ private @NULL Killer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    // End:0x77
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        LPC = LPPlayerController(Controller);
        // End:0x77
        if(LPC != none)
        {
            LPC.ExitVS(true);
        }
    }
    PlayDeathEffects();
    HideShield();
    bDisabled = true;
    return false;
    //return ReturnValue;    
}

simulated function PlayDeathEffects()
{
    bRepEffects = true;
    PlayParticles();
    TuneDataPawnSoundEventBindings.PlayEventSoundLocally('Destroyed', 'None', self, none, none);
    //return;    
}

simulated function PlayParticles()
{
    DestroyedParticles = TuneDataPawnFXEventBindings.PlayEventFX('Destroyed', self, Mesh, none);
    // End:0x9D
    if(DestroyedParticles != none)
    {
        DestroyedParticles.__OnSystemFinished__Delegate = OnParticleSystemFinished;
        DestroyedParticles.SetActive(true);
    }
    //return;    
}

simulated function DisableParticles()
{
    bRepEffects = false;
    // End:0x47
    if(DestroyedParticles != none)
    {
        DestroyedParticles.SetActive(false);
        DestroyedParticles = none;
    }
    //return;    
}

simulated function @NULL OnParticleSystemFinished()
{
    local /*0x97E50000-0x00000400*/ private @NULL PSC[8388609];

    PSC.DetachFromAny();
    // End:0x36
    if(bDisabled)
    {
        PlayParticles();
    }
    //return;    
}

simulated function HideShield()
{
    ShieldMesh.SetHidden(true);
    ShieldMesh.SetActorCollision(false, false);
    //return;    
}

simulated function ShowShield()
{
    ShieldMesh.SetHidden(false);
    ShieldMesh.SetActorCollision(true, true);
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private bool bHitPlayer;
    local /*0x97E50000-0x00000000*/ private @NULL LPPC, LPP;
    local /*0x97E50000-0x00000000*/ private int I, actualDamage;
    local /*0x97E50000-0x00000000*/ private @NULL PhysMat, bodSet;

    // End:0xF0
    if((HitInfo.HitComponent == none) && DamageCauser != none)
    {
        bHitPlayer = false;
        // End:0xEC
        foreach SeatedMesh.PhysicsAsset.BodySetup(bodSet, I)
        {
            PhysMat = bodSet.PhysMaterial;
            // End:0xEB
            if(PhysMat == HitInfo.PhysMaterial)
            {
                bHitPlayer = true;                
            }
            else
            {                
            }
        }                
    }
    else
    {
        // End:0x135
        if(DamageCauser != none)
        {
            // End:0x135
            if(HitInfo.HitComponent == SeatedMesh)
            {
                bHitPlayer = true;
            }
        }
    }
    // End:0x150
    if(Controller == none)
    {
        bHitPlayer = false;
    }
    LPPC = LPPlayerController(Controller);
    LPP = LPPlayerPawn(LPPC.HumanPlayerPawn);
    // End:0x457
    if(bHitPlayer && LPP != none)
    {
        actualDamage = DamageAmount;
        WorldInfo.Game.ReduceDamage(actualDamage, self, EventInstigator, HitLocation, Momentum, DamageType, DamageCauser);
        LPPC.HumanPlayerPawn.AdjustDamage(actualDamage, Momentum, EventInstigator, HitLocation, DamageType, HitInfo, DamageCauser);
        // End:0x371
        if((LPP.Health - actualDamage) <= 0)
        {
            LPP.Health = 0;
            LPP.CachedKiller = EventInstigator;
            LPP.CachedDamageType = DamageType;
            LPPC.ExitVS(true);            
        }
        else
        {
            LPPC.HumanPlayerPawn.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
            // End:0x452
            if(LPPC.HumanPlayerPawn.Health < 1)
            {
                LPPC.HumanPlayerPawn.Health = 1;
            }
        }
        return;        
    }
    else
    {
        super.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        // End:0x4BA
        if(Health < 0)
        {
            Health = 0;
        }
    }
    //return;    
}

event HealDamage()
{
    local /*0x97E50000-0x00000000*/ private int Amount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Healer[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Health += Amount;
    UpdateDamagedEffects();
    return true;
    //return ReturnValue;    
}

function IncrementPitchController()
{
    local /*0x97E50000-0x00000000*/ private int PitchIncrement[8388609];

    // End:0x1DF
    if((PitchControl.PitchSkelController != none) && !PitchControl.bIsLocked)
    {
        PitchControl.PitchSkelController.BoneRotation.Roll += PitchIncrement;
        PitchControl.PitchSkelController.BoneRotation.Roll = Clamp(PitchControl.PitchSkelController.BoneRotation.Roll, TuneDataBasePlayerPawn.ViewPitchMin, TuneDataBasePlayerPawn.ViewPitchMax);
        PitchControl.PitchTarget = PitchControl.PitchSkelController.BoneRotation.Roll;
        PitchControl.BlendTime = 0.0000000;
    }
    ServerReplicatePitchTarget(PitchControl.PitchTarget, PitchControl.BlendTime);
    //return;    
}

simulated function SetPitchControllerTargetByRotationRate()
{
    local /*0x97E50000-0x00000000*/ private int PitchTarget[8388609];
    local /*0x97E50000-0x00000000*/ private float DegreesPerSecond[8388609], BlendTime;

    // End:0xE4
    if((PitchControl.PitchSkelController != none) && !PitchControl.bIsLocked)
    {
        // End:0xC8
        if(DegreesPerSecond > 0.0000000)
        {
            BlendTime = Abs(float(PitchTarget - PitchControl.PitchSkelController.BoneRotation.Roll)) / (DegreesPerSecond * 182.0444000);
        }
        SetPitchControllerTarget(PitchTarget, BlendTime);
    }
    //return;    
}

simulated function IsPitchControllerAtExtreme()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xF0
    if(PitchControl.PitchSkelController != none)
    {
        return (PitchControl.PitchSkelController.BoneRotation.Roll <= TuneDataBasePlayerPawn.ViewPitchMin) || PitchControl.PitchSkelController.BoneRotation.Roll >= TuneDataBasePlayerPawn.ViewPitchMax;
    }
    return false;
    //return ReturnValue;    
}

simulated function BlendToSwivel()
{
    local /*0x97E50000-0x00000000*/ private @NULL BlendedSwivel, SwivelRot;

    // End:0xF4
    if(SwivelYaw != SwivelControl.BoneRotation.Yaw)
    {
        SwivelRot.Yaw = SwivelYaw;
        BlendedSwivel = RLerp(SwivelControl.BoneRotation, SwivelRot, 1.0000000, true);
        SwivelControl.BoneRotation.Yaw = BlendedSwivel.Yaw;
    }
    //return;    
}

function CreateMaterialInstances()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL MIC;

    ShieldMatInstances.Length = ShieldMesh.GetNumElements();
    I = 0;
    J0x35:

    // End:0xAA [Loop If]
    if(I < ShieldMatInstances.Length)
    {
        MIC = ShieldMesh.CreateAndSetMaterialInstanceConstant(I);
        ShieldMatInstances[I] = MIC;
        ++I;
        // [Loop Continue]
        goto J0x35;
    }
    SetShieldGlow(0.0000000);
    //return;    
}

function SetShieldGlow()
{
    local /*0x97E50000-0x00000000*/ private float val[8388609];
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x85 [Loop If]
    if(I < ShieldMatInstances.Length)
    {
        // End:0x77
        if(ShieldMatInstances[I] != none)
        {
            ShieldMatInstances[I].SetScalarParameterValue('DamageFactor', val);
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPPlayerTurretPawn.SeatedPawnMesh'
    begin object name=SeatedPawnMesh class=Class'Engine.SkeletalMeshComponent'
    end object
    SeatedMesh=SeatedPawnMesh
    // Reference: StaticMeshComponent'Default__LPPlayerTurretPawn.ShieldMesh'
    begin object name=ShieldMesh class=Class'Engine.StaticMeshComponent'
    end object
    ShieldMesh=ShieldMesh
    // Reference: LPAIResDefenderVS'Default__LPPlayerTurretPawn.LPAIResDefenderVS'
    begin object name=LPAIResDefenderVS
    end object
    AIResDefenderVS=LPAIResDefenderVS
    // Reference: LPAIResNushiSporeVS'Default__LPPlayerTurretPawn.LPAIResNushiSporeVS'
    begin object name=LPAIResNushiSporeVS
    end object
    AIResNushiSporeVS=LPAIResNushiSporeVS
    // Reference: LPRepairableVSComponent'Default__LPPlayerTurretPawn.RepairObj'
    begin object name=RepairObj
    end object
    RepairableComponent=RepairObj
    EnterPromptString="<Strings:LostPlanetGame.Tutorials.TURRETENTERPROMPT>"
    ExitPromptString="<Strings:LostPlanetGame.Tutorials.TURRETEXITPROMPT>"
    // Reference: LPAIResManPlayer'Default__LPPlayerTurretPawn.LPAIResManPlayer'
    begin object name=LPAIResManPlayer
    end object
    AIResourceManager=LPAIResManPlayer
    // Reference: LPAimControlPlayerControlled'Default__LPPlayerTurretPawn.AimControl'
    begin object name=AimControl
    end object
    AimController=AimControl
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPPlayerTurretPawn.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPPlayerTurretPawn.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPPlayerTurretPawn.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPDamageOverTimeComponent'Default__LPPlayerTurretPawn.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPPlayerTurretPawn.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    SlideOffWallInfo=(WallSlideOffCylinder=// Reference: CylinderComponent'Default__LPPlayerTurretPawn.WallSlideCylinder'
    begin object name=WallSlideCylinder
    end object
    WallSlideOffCylinder=WallSlideCylinder)
    // Reference: KynapseBodyHandle'Default__LPPlayerTurretPawn.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPPlayerTurretPawn.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPPlayerTurretPawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPPlayerTurretPawn.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPPlayerTurretPawn.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[10]=DamageStateComponentDefObj
    Components[11]=RepairObj
    Components[12]=SeatedPawnMesh
    Components[13]=ShieldMesh
    // Reference: LPActorInteractionMetaData'Default__LPPlayerTurretPawn.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}