class LPAIPawnFireWasp extends LPAIPawnMedFlyer
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataFireWasp[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AggressiveAnimations;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SwoopStingAnimations;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL StingerAggressiveParticleComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStingerAggressiveOnFlag[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StomachTailGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedStomachTailGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EffectiveScriptedStomachTailGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedStomachTailGlowFactorRampRate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MouthGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedMouthGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EffectiveScriptedMouthGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedMouthGlowFactorRampRate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LegsGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedLegsGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EffectiveScriptedLegsGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedLegsGlowFactorRampRate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HeadSpikesGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedHeadSpikesGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EffectiveScriptedHeadSpikesGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedHeadSpikesGlowFactorRampRate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WingsGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedWingsGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EffectiveScriptedWingsGlowFactor[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedWingsGlowFactorRampRate[536870913];

// Export ULPAIPawnFireWasp::execGetStomachTailGlowFactor(FFrame&, void* const)
native final simulated function GetStomachTailGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnFireWasp::execGetMouthGlowFactor(FFrame&, void* const)
native final simulated function GetMouthGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnFireWasp::execGetLegsGlowFactor(FFrame&, void* const)
native final simulated function GetLegsGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnFireWasp::execGetHeadSpikesGlowFactor(FFrame&, void* const)
native final simulated function GetHeadSpikesGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnFireWasp::execGetWingsGlowFactor(FFrame&, void* const)
native final simulated function GetWingsGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetPhysics(4);
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataFireWasp = LPTuneDataFireWasp(TuneData);
    super.InitTuneData(TuneData);
    StomachTailGlowFactor = TuneDataFireWasp.PreIdleStomachTailGlowFactor.GetValue();
    ScriptedStomachTailGlowFactor = -1.0000000;
    EffectiveScriptedStomachTailGlowFactor = -1.0000000;
    ScriptedStomachTailGlowFactorRampRate = 1.0000000;
    MouthGlowFactor = TuneDataFireWasp.PreIdleMouthGlowFactor.GetValue();
    ScriptedMouthGlowFactor = -1.0000000;
    EffectiveScriptedMouthGlowFactor = -1.0000000;
    ScriptedMouthGlowFactorRampRate = 1.0000000;
    LegsGlowFactor = TuneDataFireWasp.PreIdleLegsGlowFactor.GetValue();
    ScriptedLegsGlowFactor = -1.0000000;
    EffectiveScriptedLegsGlowFactor = -1.0000000;
    ScriptedLegsGlowFactorRampRate = 1.0000000;
    HeadSpikesGlowFactor = TuneDataFireWasp.PreIdleHeadSpikesGlowFactor.GetValue();
    ScriptedHeadSpikesGlowFactor = -1.0000000;
    EffectiveScriptedHeadSpikesGlowFactor = -1.0000000;
    ScriptedHeadSpikesGlowFactorRampRate = 1.0000000;
    HeadSpikesGlowFactor = TuneDataFireWasp.PreIdleHeadSpikesGlowFactor.GetValue();
    ScriptedHeadSpikesGlowFactor = -1.0000000;
    EffectiveScriptedHeadSpikesGlowFactor = -1.0000000;
    ScriptedHeadSpikesGlowFactorRampRate = 1.0000000;
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    DestroyStingerAggressiveParticleComponent(true);
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

simulated function InitAnimTemplates()
{
    super(LPPawn).InitAnimTemplates();
    //return;    
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

function EnableStingAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    StomachTailGlowFactor = ((bEnable) ? TuneDataFireWasp.StingAttackStomachTailGlowFactor.GetValue() : TuneDataFireWasp.IdleStomachTailGlowFactor.GetValue());
    //return;    
}

function EnableStruggleAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    MouthGlowFactor = ((bEnable) ? TuneDataFireWasp.StruggleAttackMouthGlow.GetValue() : TuneDataFireWasp.IdleMouthGlowFactor.GetValue());
    //return;    
}

function EnableAggressiveGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    LegsGlowFactor = ((bEnable) ? TuneDataFireWasp.AggressiveLegsGlow.GetValue() : TuneDataFireWasp.IdleLegsGlowFactor.GetValue());
    //return;    
}

function EnableRangedBodyAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    HeadSpikesGlowFactor = ((bEnable) ? TuneDataFireWasp.PlasmaLobAttackHeadSpikesGlow.GetValue() : TuneDataFireWasp.IdleHeadSpikesGlowFactor.GetValue());
    //return;    
}

function EnableRangedWingAttackGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    WingsGlowFactor = ((bEnable) ? TuneDataFireWasp.PlasmaLobAttackWingsGlow.GetValue() : TuneDataFireWasp.IdleWingsGlowFactor.GetValue());
    //return;    
}

simulated function TurnOnStingerAggressiveParticleComponent()
{
    // End:0x144
    if(StingerAggressiveParticleComponent == none)
    {
        StingerAggressiveParticleComponent = TuneDataPawnFXEventBindings.PlayEventFX('FireWaspStingAnnounce', self, Mesh, none);
        // End:0x141
        if(StingerAggressiveParticleComponent != none)
        {
            StingerAggressiveParticleComponent.SetTickGroup(3);
            StingerAggressiveParticleComponent.__OnSystemFinished__Delegate = None;
            StingerAggressiveParticleComponent.bAutoActivate = false;
            StingerAggressiveParticleComponent.SetActive(true);
            StingerAggressiveParticleComponent.SetScale(TuneDataFireWasp.AmountToScaleStingAnnounceEffect.GetValue());
        }        
    }
    else
    {
        StingerAggressiveParticleComponent.SetActive(true);
    }
    //return;    
}

simulated function TurnOffStingerAggressiveParticleComponent()
{
    // End:0x30
    if(StingerAggressiveParticleComponent != none)
    {
        StingerAggressiveParticleComponent.SetActive(false);
    }
    //return;    
}

simulated function DestroyStingerAggressiveParticleComponent()
{
    local /*0x97E50000-0x00000000*/ private bool bDeleteFromPool[8388609];

    // End:0xA4
    if(StingerAggressiveParticleComponent != none)
    {
        // End:0x59
        if(bDeleteFromPool)
        {
            WorldInfo.MyEmitterPool.OnParticleSystemFinished(StingerAggressiveParticleComponent);
        }
        StingerAggressiveParticleComponent.DetachFromAny();
        StingerAggressiveParticleComponent.SetActive(false);
        StingerAggressiveParticleComponent = none;
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPPawn).Tick(DeltaTime);
    HandleStingerEffects();
    //return;    
}

simulated function HandleStingerEffects()
{
    // End:0x6E
    if((bStingerAggressiveOnFlag && StingerAggressiveParticleComponent == none) || (bStingerAggressiveOnFlag && StingerAggressiveParticleComponent != none) && !StingerAggressiveParticleComponent.bIsActive)
    {
        TurnOnStingerAggressiveParticleComponent();
    }
    // End:0xBC
    if((!bStingerAggressiveOnFlag && StingerAggressiveParticleComponent != none) && StingerAggressiveParticleComponent.bIsActive)
    {
        TurnOffStingerAggressiveParticleComponent();
    }
    //return;    
}

function PlayWithdrawingScaredSound()
{
    //return;    
}

function ShouldUseDeadReckoningForBurstFire()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function TorsoBoneName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'JO_Hips';
    //return ReturnValue;    
}

simulated function ProcessForGibbing()
{
    local /*0x97E50000-0x00000000*/ private float PercentTotalHealth[8388609];

    // End:0x4F
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        // End:0x4F
        if(Class'Engine.WorldInfo'.static.IsConsoleBuild(NM_ListenServer))
        {
            return;
        }
    }
    super(SPPawn).ProcessForGibbing(PercentTotalHealth);
    //return;    
}

simulated function TurnOffScriptedGlows()
{
    ScriptedStomachTailGlowFactor = -1.0000000;
    ScriptedMouthGlowFactor = -1.0000000;
    ScriptedLegsGlowFactor = -1.0000000;
    ScriptedHeadSpikesGlowFactor = -1.0000000;
    ScriptedWingsGlowFactor = -1.0000000;
    //return;    
}

simulated event HandleAnimNotifyGlow()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609], NotifyWasp;

    super(LPPawn).HandleAnimNotifyGlow(Notify);
    NotifyWasp = LPAnimNotify_GlowFireWasp(Notify);
    // End:0x40
    if(NotifyWasp == none)
    {
        return;
    }
    // End:0xBC
    if(int(NotifyWasp.GlowPart) == int(0))
    {
        ScriptedStomachTailGlowFactor = NotifyWasp.GlowFactor;
        ScriptedStomachTailGlowFactorRampRate = NotifyWasp.GlowRampRate;        
    }
    else
    {
        // End:0x138
        if(int(NotifyWasp.GlowPart) == int(1))
        {
            ScriptedMouthGlowFactor = NotifyWasp.GlowFactor;
            ScriptedMouthGlowFactorRampRate = NotifyWasp.GlowRampRate;            
        }
        else
        {
            // End:0x1B4
            if(int(NotifyWasp.GlowPart) == int(2))
            {
                ScriptedLegsGlowFactor = NotifyWasp.GlowFactor;
                ScriptedLegsGlowFactorRampRate = NotifyWasp.GlowRampRate;                
            }
            else
            {
                // End:0x230
                if(int(NotifyWasp.GlowPart) == int(3))
                {
                    ScriptedHeadSpikesGlowFactor = NotifyWasp.GlowFactor;
                    ScriptedHeadSpikesGlowFactorRampRate = NotifyWasp.GlowRampRate;                    
                }
                else
                {
                    // End:0x2A9
                    if(int(NotifyWasp.GlowPart) == int(4))
                    {
                        ScriptedWingsGlowFactor = NotifyWasp.GlowFactor;
                        ScriptedWingsGlowFactorRampRate = NotifyWasp.GlowRampRate;
                    }
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnFireWasp.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnFireWasp.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnFireWasp.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnFireWasp.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnFireWasp.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnFireWasp.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnFireWasp.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnFireWasp.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnFireWasp.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnFireWasp.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPAIPawnFireWasp.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    Components[10]=DamageStateComponentDefObj
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnFireWasp.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}