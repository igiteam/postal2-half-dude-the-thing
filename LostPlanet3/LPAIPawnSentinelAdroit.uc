class LPAIPawnSentinelAdroit extends LPAIPawnSentinel
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataSentinelAdroit[536870913];

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    TuneDataSentinelAdroit = LPTuneDataSentinelAdroit(TuneData);
    //return;    
}

simulated event @NULL PostInitAnimTree()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super.PostInitAnimTree(SkelComp);
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

defaultproperties
{
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnSentinelAdroit.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnSentinelAdroit.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnSentinelAdroit.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPHeadTrackComponent'Default__LPAIPawnSentinelAdroit.HeadTrackComponent0'
    begin object name=HeadTrackComponent0
    end object
    HeadTrackComponent=HeadTrackComponent0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnSentinelAdroit.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnSentinelAdroit.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnSentinelAdroit.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnSentinelAdroit.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    WalkingPhysics=EPhysics.PHYS_None
    // Reference: SkeletalMeshComponent'Default__LPAIPawnSentinelAdroit.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnSentinelAdroit.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnSentinelAdroit.FaceAudioComponent'
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
    Components[10]=HeadTrackComponent0
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnSentinelAdroit.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}