class LPPlayerPawnScript extends LPPlayerPawn
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: StaticMeshComponent'Default__LPPlayerPawnScript.KnifeComp'
    begin object name=KnifeComp
    end object
    KnifeComponent=KnifeComp
    // Reference: StaticMeshComponent'Default__LPPlayerPawnScript.MineComp'
    begin object name=MineComp
    end object
    MineComponent=MineComp
    // Reference: StaticMeshComponent'Default__LPPlayerPawnScript.Grenade1Comp'
    begin object name=Grenade1Comp
    end object
    Grenade1Component=Grenade1Comp
    // Reference: StaticMeshComponent'Default__LPPlayerPawnScript.Grenade2Comp'
    begin object name=Grenade2Comp
    end object
    Grenade2Component=Grenade2Comp
    // Reference: StaticMeshComponent'Default__LPPlayerPawnScript.Grenade3Comp'
    begin object name=Grenade3Comp
    end object
    Grenade3Component=Grenade3Comp
    // Reference: StaticMeshComponent'Default__LPPlayerPawnScript.Grenade4Comp'
    begin object name=Grenade4Comp
    end object
    Grenade4Component=Grenade4Comp
    // Reference: SkeletalMeshComponent'Default__LPPlayerPawnScript.ZiplineComp'
    begin object name=ZiplineComp
    end object
    ZiplineTrolleyComponent=ZiplineComp
    // Reference: StaticMeshComponent'Default__LPPlayerPawnScript.PerkGhostMeshA'
    begin object name=PerkGhostMeshA
    end object
    PerkGhostMesh=PerkGhostMeshA
    // Reference: PointLightComponent'Default__LPPlayerPawnScript.RepairScreenLightComponent0'
    begin object name=RepairScreenLightComponent0
    end object
    RepairScreenLightComponent=RepairScreenLightComponent0
    // Reference: StaticMeshComponent'Default__LPPlayerPawnScript.RepairScreenProjectionComponent0'
    begin object name=RepairScreenProjectionComponent0
    end object
    RepairScreenProjectionComponent=RepairScreenProjectionComponent0
    // Reference: StaticMeshComponent'Default__LPPlayerPawnScript.RepairConeProjectionComponent0'
    begin object name=RepairConeProjectionComponent0
    end object
    RepairConeProjectionComponent=RepairConeProjectionComponent0
    // Reference: PointLightComponent'Default__LPPlayerPawnScript.JobLogLightComp'
    begin object name=JobLogLightComp
    end object
    JobLogLightComponent=JobLogLightComp
    // Reference: StaticMeshComponent'Default__LPPlayerPawnScript.JobLogProjectionConeComp'
    begin object name=JobLogProjectionConeComp
    end object
    JobLogProjectionConeComponent=JobLogProjectionConeComp
    // Reference: SkeletalMeshComponent'Default__LPPlayerPawnScript.WristPDAComp'
    begin object name=WristPDAComp
    end object
    WristPDAComponent=WristPDAComp
    // Reference: LPAIResManPlayer'Default__LPPlayerPawnScript.LPAIResManPlayer'
    begin object name=LPAIResManPlayer
    end object
    AIResourceManager=LPAIResManPlayer
    // Reference: LPAimControlPlayerControlled'Default__LPPlayerPawnScript.AimControl'
    begin object name=AimControl
    end object
    AimController=AimControl
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPPlayerPawnScript.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPPlayerPawnScript.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPPlayerPawnScript.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPHeadTrackComponent'Default__LPPlayerPawnScript.HeadTrackComponent0'
    begin object name=HeadTrackComponent0
    end object
    HeadTrackComponent=HeadTrackComponent0
    // Reference: SPDamageOverTimeComponent'Default__LPPlayerPawnScript.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPPlayerPawnScript.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPPlayerPawnScript.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPPlayerPawnScript.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPPlayerPawnScript.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPPlayerPawnScript.FaceAudioComponent'
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
    Components[10]=KnifeComp
    Components[11]=MineComp
    Components[12]=Grenade1Comp
    Components[13]=Grenade2Comp
    Components[14]=Grenade3Comp
    Components[15]=Grenade4Comp
    Components[16]=ZiplineComp
    // Reference: SPDamageStateComponent'Default__LPPlayerPawnScript.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[17]=DamageStateComponentDefObj
    Components[18]=HeadTrackComponent0
    // Reference: LPActorInteractionMetaData'Default__LPPlayerPawnScript.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}