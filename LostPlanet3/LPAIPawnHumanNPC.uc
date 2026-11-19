class LPAIPawnHumanNPC extends LPAIPawnHuman
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataHumanNPC[536870913];

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataHumanNPC = LPTuneDataAIPawnHumanNPC(TuneData);
    super.InitTuneData(TuneData);
    //return;    
}

defaultproperties
{
    // Reference: LPAIResManHuman'Default__LPAIPawnHumanNPC.LPAIResManHuman'
    begin object name=LPAIResManHuman
    end object
    AIResourceManager=LPAIResManHuman
    // Reference: LPDamageReactionManagerAIHuman'Default__LPAIPawnHumanNPC.DamageReactionManagerHuman'
    begin object name=DamageReactionManagerHuman
    end object
    DamageReactionManager=DamageReactionManagerHuman
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnHumanNPC.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnHumanNPC.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnHumanNPC.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPHeadTrackComponent'Default__LPAIPawnHumanNPC.HeadTrackComponent0'
    begin object name=HeadTrackComponent0 class=Class'LPHeadTrackComponent'
    end object
    HeadTrackComponent=HeadTrackComponent0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnHumanNPC.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnHumanNPC.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnHumanNPC.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnHumanNPC.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnHumanNPC.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnHumanNPC.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnHumanNPC.FaceAudioComponent'
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
    Components[10]=LPAIResManHuman
    Components[11]=HeadTrackComponent0
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnHumanNPC.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}