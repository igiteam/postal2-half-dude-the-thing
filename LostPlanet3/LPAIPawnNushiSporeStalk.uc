class LPAIPawnNushiSporeStalk extends LPAIPawnDefenderHive
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataNushiSporeStalk[536870913];

// Export ULPAIPawnNushiSporeStalk::execGetBodyDamageFactor(FFrame&, void* const)
native simulated function GetBodyDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataNushiSporeStalk = LPTuneDataNushiSporeStalk(TuneData);
    super.InitTuneData(TuneData);
    //return;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function NotifyAnimReadyToLaunchDefenders()
{
    // End:0x51
    if((Controller != none) && LPAIControllerNushiSporeStalk(Controller) != none)
    {
        LPAIControllerNushiSporeStalk(Controller).NotifyAnimReadyToLaunchDefenders();
    }
    //return;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    // End:0x29
    if(WantsToPlayDieAnim(DamageType))
    {
        PlayDyingSpecialMove(Class'LPSM_NushiSporeStalkDie');
    }
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
    // Reference: LPActorFactoryAI'Default__LPAIPawnNushiSporeStalk.DefaultActorFactory'
    begin object name=DefaultActorFactory
    end object
    DefenderFactoryAI=DefaultActorFactory
    // Reference: LPSeqAct_ActorFactory'Default__LPAIPawnNushiSporeStalk.DefenderFactoryDataD0'
    begin object name=DefenderFactoryDataD0
    end object
    DefenderFactoryData=DefenderFactoryDataD0
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnNushiSporeStalk.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnNushiSporeStalk.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnNushiSporeStalk.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnNushiSporeStalk.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnNushiSporeStalk.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnNushiSporeStalk.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnNushiSporeStalk.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnNushiSporeStalk.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnNushiSporeStalk.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnNushiSporeStalk.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPAIPawnNushiSporeStalk.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[10]=DamageStateComponentDefObj
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnNushiSporeStalk.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}