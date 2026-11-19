class LPAIPawnNushiHeart extends LPAIPawnAkridStationary
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataNushiHeart[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ShieldHealth;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CoreHealth;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL CoreComponent[524289];

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataNushiHeart = LPTuneDataNushiHeart(TuneData);
    super.InitTuneData(TuneData);
    // End:0x5F
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

simulated function GetCoreGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
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
    GotoState('None');
    //return;    
}

function TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x40
    if((Health - Damage) <= 0)
    {
        Damage = Health - 1;
        GotoState('ShieldRetracted');
    }
    super(LPAIPawn).TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

function OnKillPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    GotoState('HeartDestroyed');
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
    ignores TakeDamage;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        TriggerEventClass(Class'LPSeqEvent_CoreShield_Retracted', self);
        DoSpecialMove(Class'LPSM_NushiHeart_Detach');
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
    stop;    
}

state HeartDestroyed
{
    ignores TakeDamage;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        DoSpecialMove(Class'LPSM_NushiHeart_GoLimp');
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
    // Reference: StaticMeshComponent'Default__LPAIPawnNushiHeart.CoreComp'
    begin object name=CoreComp class=Class'Engine.StaticMeshComponent'
    end object
    CoreComponent=CoreComp
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnNushiHeart.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnNushiHeart.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnNushiHeart.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnNushiHeart.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnNushiHeart.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnNushiHeart.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnNushiHeart.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    WalkingPhysics=EPhysics.PHYS_None
    // Reference: SkeletalMeshComponent'Default__LPAIPawnNushiHeart.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnNushiHeart.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnNushiHeart.FaceAudioComponent'
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
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnNushiHeart.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}