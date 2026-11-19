class LPAIPawnAlphaPackHunter extends LPAIPawnPackHunter
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AlphaPackHunterRamCSA;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GrenCurrentlyDealingWith[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeGrenadeGlued[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AlphaPackHunterCtrl[536870913];

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    GrenCurrentlyDealingWith = none;
    TimeGrenadeGlued = -1.0000000;
    super.InitTuneData(TuneData);
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super(LPAIPawn).PossessedBy(C, bVehicleTransition);
    AlphaPackHunterCtrl = LPAIControllerAlphaPackHunter(C);
    //return;    
}

function UnPossessed()
{
    super(LPAIPawn).UnPossessed();
    AlphaPackHunterCtrl = none;
    //return;    
}

function NotifyFromAnimToSpitGrenadeBackOutNow()
{
    // End:0x37
    if(AlphaPackHunterCtrl != none)
    {
        AlphaPackHunterCtrl.SpitGrenadeBackOut(GrenCurrentlyDealingWith);
    }
    //return;    
}

defaultproperties
{
    bRejectsAnyAttachedGrenades=true
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnAlphaPackHunter.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnAlphaPackHunter.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnAlphaPackHunter.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    SinkDepthMultiplier=0.5000000
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnAlphaPackHunter.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnAlphaPackHunter.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnAlphaPackHunter.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnAlphaPackHunter.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnAlphaPackHunter.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnAlphaPackHunter.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnAlphaPackHunter.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPAIPawnAlphaPackHunter.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[10]=DamageStateComponentDefObj
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnAlphaPackHunter.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}