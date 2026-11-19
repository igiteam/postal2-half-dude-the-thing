class LPAIPawnBurrower extends LPAIPawnAkridSmall
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataBurrower[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL BurrowingParticleLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL BurrowingSoundLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForBurrowingEffectToEnd;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bBearTrap[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel bool bUnderground[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bJumping;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MaxDistancePlaybackOverride;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeForJumpBiteStrikeAnimation[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AttackSlotSocketIdx[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleMelee;

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x2E
    if(VarName == 'bUnderground')
    {
        GoUnderground(bUnderground);        
    }
    else
    {
        // End:0x5C
        if(VarName == 'bBearTrap')
        {
            GoBearTrap(bBearTrap);            
        }
        else
        {
            super.ReplicatedEvent(VarName);
        }
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataBurrower = LPTuneDataBurrower(TuneData);
    super.InitTuneData(TuneData);
    //return;    
}

simulated event PostBeginPlay()
{
    CreateBurrowingEffect();
    super(LPAIPawn).PostBeginPlay();
    //return;    
}

function GetRecoverFromRagdollSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_BurrowerRecoverFromRagdoll';
    //return ReturnValue;    
}

simulated function GoBearTrap()
{
    local /*0x97E50000-0x00000000*/ private bool InBearTrap[8388609];

    bBearTrap = InBearTrap;
    // End:0x41
    if(bBearTrap && !IsUnderground())
    {
        GoUnderground(true);        
    }
    else
    {
        DefaultMeshTranslationZOffset = TuneDataBurrower.UndergroundZBearTrapTranslation;
    }
    //return;    
}

simulated function IsUnderground()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bUnderground && IsInState('Underground');
    //return ReturnValue;    
}

simulated function GoUnderground()
{
    local /*0x97E50000-0x00000000*/ private bool InUnderground[8388609];

    // End:0x85
    if((Health > 0) && !bRagdollDead)
    {
        bUnderground = InUnderground;
        // End:0x65
        if(bUnderground)
        {
            // End:0x62
            if(!IsInState('Underground'))
            {
                GotoState('Underground');
            }            
        }
        else
        {
            // End:0x85
            if(!IsInState('Surface'))
            {
                GotoState('Surface');
            }
        }
    }
    //return;    
}

simulated function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    // End:0x18
    if(bShouldRagdoll)
    {
        EndCurrentSpecialMove();
    }
    // End:0x68
    if(((BurrowingParticleLoop != none) && !BurrowingParticleLoop.bIsActive) && !bWaitingForBurrowingEffectToEnd)
    {
        DestroyBurrowingEffect();
    }
    TuneDataPawnSoundEventBindings.PlayEventSoundLocally('NormalDeath', 'None', self, none, none);
    super(LPAIPawn).StartDie(DamageType, HitLoc);
    //return;    
}

simulated function StopBurrowingEffect()
{
    // End:0x5C
    if(BurrowingParticleLoop != none)
    {
        bWaitingForBurrowingEffectToEnd = true;
        BurrowingParticleLoop.SetActive(false);
        Mesh.SetHidden(false);
    }
    // End:0x8A
    if(BurrowingSoundLoop != none)
    {
        BurrowingSoundLoop.Stop();
    }
    //return;    
}

simulated function PlayBurrowingEffect()
{
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0xF4
    if(BurrowingParticleLoop != none)
    {
        bWaitingForBurrowingEffectToEnd = false;
        BurrowingParticleLoop.SetActive(true);
        Mesh.SetHidden(true);
        I = 0;
        J0x67:

        // End:0xF4 [Loop If]
        if(I < BurrowingParticleLoop.EmitterInstances.Length)
        {
            BurrowingParticleLoop.SetKillOnDeactivate(I, false);
            BurrowingParticleLoop.SetKillOnCompleted(I, false);
            I++;
            // [Loop Continue]
            goto J0x67;
        }
    }
    // End:0x122
    if(BurrowingSoundLoop != none)
    {
        BurrowingSoundLoop.Play();
    }
    //return;    
}

private final simulated function CreateBurrowingEffect()
{
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideType = 2;
    MaxDistancePlaybackOverride.PlaybackDistanceOverride.OverrideValue = 100000000000000000.0000000;
    BurrowingParticleLoop = TuneDataPawnFXEventBindings.PlayEventFX('BurrowingLoopEffect', self, Mesh, MaxDistancePlaybackOverride);
    // End:0x110
    if(BurrowingParticleLoop != none)
    {
        BurrowingParticleLoop.__OnSystemFinished__Delegate = OnParticleSystemFinished;
        BurrowingParticleLoop.bAutoActivate = false;
    }
    BurrowingSoundLoop = AudioComponent(TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx('BurrowingLoopSound', 'None', self, Mesh, MaxDistancePlaybackOverride));
    // End:0x1BA
    if(BurrowingSoundLoop != none)
    {
        BurrowingSoundLoop.bAutoDestroy = false;
        BurrowingSoundLoop.bStopWhenOwnerDestroyed = true;
    }
    StopBurrowingEffect();
    //return;    
}

private final simulated function DestroyBurrowingEffect()
{
    // End:0x97
    if(BurrowingParticleLoop != none)
    {
        WorldInfo.MyEmitterPool.OnParticleSystemFinished(BurrowingParticleLoop);
        BurrowingParticleLoop.DetachFromAny();
        BurrowingParticleLoop.SetActive(false);
        BurrowingParticleLoop = none;
    }
    // End:0xD0
    if(BurrowingSoundLoop != none)
    {
        BurrowingSoundLoop.Stop();
        BurrowingSoundLoop = none;
    }
    //return;    
}

private final simulated function @NULL OnParticleSystemFinished()
{
    local /*0x97E50000-0x00000400*/ private @NULL FinishedComponent[8388609];

    bWaitingForBurrowingEffectToEnd = false;
    // End:0x25
    if(Health <= 0)
    {
        DestroyBurrowingEffect();
    }
    //return;    
}

simulated function GetSMForCombatWindow_Melee()
{
    local /*0x97E50000-0x00000000*/ private @NULL Window[25296897];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PlayerBurrowerStruggleMelee';
    //return ReturnValue;    
}

simulated state Surface
{    stop;    
}

auto simulated state Underground
{
    simulated function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x38
        if(bBearTrap)
        {
            DefaultMeshTranslationZOffset = TuneDataBurrower.UndergroundZBearTrapTranslation;            
        }
        else
        {
            DefaultMeshTranslationZOffset = TuneDataBurrower.UndergroundZTranslation;
        }
        SetCollisionType(1);
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    simulated function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        DefaultMeshTranslationZOffset = 0.0000000;
        // End:0x3B
        if((Health > 0) && !bRagdollDead)
        {
            SetCollisionType(2);
        }
        StopBurrowingEffect();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    // End:0x126
    if(BurrowingParticleLoop != none)
    {
        J0x0F:

        // End:0x126 [Loop If]
        if(true)
        {
            // End:0x4F
            if(bJumping)
            {
                // End:0x4C
                if(BurrowingParticleLoop.bIsActive)
                {
                    StopBurrowingEffect();
                }                
            }
            else
            {
                // End:0xAE
                if(BurrowingParticleLoop.bIsActive && VSize(Velocity) < TuneDataBurrower.MinVelocityPlaySnowEffects)
                {
                    StopBurrowingEffect();                    
                }
                else
                {
                    // End:0x11B
                    if((!BurrowingParticleLoop.bIsActive || bWaitingForBurrowingEffectToEnd) && VSize(Velocity) > TuneDataBurrower.MinVelocityPlaySnowEffects)
                    {
                        PlayBurrowingEffect();
                    }
                }
            }
            Sleep(0.1000000);
            // [Loop Continue]
            goto J0x0F;
        }
    }
    stop;        
}

defaultproperties
{
    // Reference: SPTuneDataEventDefSoundBase'Default__LPAIPawnBurrower.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj class=Class'SPEngine.SPTuneDataEventDefSoundBase'
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    MaxTimeForJumpBiteStrikeAnimation=8.0000000
    AttackSlotSocketIdx=-1
    bUsesAkridProceduralMovementSounds=true
    bShouldRagdoll=true
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnBurrower.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnBurrower.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnBurrower.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnBurrower.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnBurrower.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnBurrower.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnBurrower.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnBurrower.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnBurrower.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnBurrower.FaceAudioComponent'
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
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnBurrower.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}