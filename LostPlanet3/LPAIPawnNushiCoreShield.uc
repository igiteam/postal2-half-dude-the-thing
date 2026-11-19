class LPAIPawnNushiCoreShield extends LPAIPawnAkridStationary
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataCoreShield[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ShieldHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CoreHealth;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL CoreComponent[524289];

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataCoreShield = LPTuneDataCoreShield(TuneData);
    super.InitTuneData(TuneData);
    CoreHealth = int(TuneDataCoreShield.CoreHealth.GetValue());
    ShieldHealth = int(TuneDataCoreShield.ShieldHealth.GetValue());
    // End:0xDF
    if(LightEnvironment != none)
    {
        LightEnvironment.bDynamic = false;
    }
    //return;    
}

simulated function ShowCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL MeshRotationOffset;

    MeshRotationOffset.Pitch = 0;
    MeshRotationOffset.Roll = (-90 * 65536) / 360;
    MeshRotationOffset.Yaw = 0;
    // End:0x105
    if(CoreComponent != none)
    {
        CoreComponent.SetHidden(false);
        // End:0x105
        if(!Mesh.IsComponentAttached(CoreComponent))
        {
            Mesh.AttachComponent(CoreComponent, 'JO_positionTracker',, MeshRotationOffset);
        }
    }
    //return;    
}

simulated function HideCore()
{
    // End:0x2F
    if(CoreComponent != none)
    {
        CoreComponent.SetHidden(true);
    }
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    ShowCore();
    //return;    
}

simulated function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super(SPPawn).GetAnimTemplateTreeForSpecialMove(SpecialMove);
    // End:0x36
    if(MyAnimTree != none)
    {
        return MyAnimTree;
    }
    return AttackAnimTree;
    //return ReturnValue;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAIPawn).AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

function Recover()
{
    CoreHealth = int(TuneDataCoreShield.CoreHealth.GetValue());
    ShieldHealth = int(TuneDataCoreShield.ShieldHealth.GetValue());
    GotoState('None');
    TriggerEventClass(Class'LPSeqEvent_CoreShield_Regenerated', self);
    //return;    
}

simulated function GetCoreGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

function TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    ShieldHealth -= Damage;
    // End:0x33
    if(ShieldHealth <= 0)
    {
        GotoState('ShieldRetracted');
    }
    super(LPAIPawn).TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    Health = HealthMax;
    //return;    
}

function StartRecovery()
{
    BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_StartRecovery);
    //return;    
}

simulated function IsValidTargetForGrenadeAssist()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPPawn).Tick(DeltaTime);
    //return;    
}

simulated state ShieldRetracted
{
    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        TriggerEventClass(Class'LPSeqEvent_CoreShield_Retracted', self);
        DoSpecialMove(Class'LPSM_CoreShield_Retract');
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function TakeDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
        local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

        CoreHealth -= Damage;
        // End:0x33
        if(CoreHealth <= 0)
        {
            GotoState('InnerCoreDestroyed');
        }
        super(LPAIPawn).TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        Health = HealthMax;
        //return;        
    }
    stop;    
}

state InnerCoreDestroyed
{
    ignores TakeDamage;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        TriggerEventClass(Class'LPSeqEvent_CoreShield_Destroyed', self);
        DoSpecialMove(Class'LPSM_CoreShield_Destroyed');
        SetTimer(TuneDataCoreShield.RegenTime.GetValue(), false, 'StartRecovery');
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        ClearTimer('StartRecovery');
        //return;        
    }
    stop;    
}

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPAIPawnNushiCoreShield.CoreComp'
    begin object name=CoreComp class=Class'Engine.StaticMeshComponent'
    end object
    CoreComponent=CoreComp
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnNushiCoreShield.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnNushiCoreShield.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnNushiCoreShield.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnNushiCoreShield.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnNushiCoreShield.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnNushiCoreShield.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnNushiCoreShield.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    WalkingPhysics=EPhysics.PHYS_None
    // Reference: SkeletalMeshComponent'Default__LPAIPawnNushiCoreShield.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnNushiCoreShield.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnNushiCoreShield.FaceAudioComponent'
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
    Components[8]=SMTC
    Components[9]=FXActionManagerDefObj0
    Components[10]=CoreComp
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnNushiCoreShield.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}