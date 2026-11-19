class LPAIPawnNushiSpore extends LPAIPawnDefender
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataNushiSpore[536870913];

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataNushiSpore = LPTuneDataNushiSpore(TuneData);
    super.InitTuneData(TuneData);
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
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

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPPawn).Tick(DeltaTime);
    //return;    
}

function PlayWithdrawingScaredSound()
{
    //return;    
}

simulated state Dying
{
    ignores EndState, EncroachedBy, Timer;

    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function HasFreezeFXAction()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function StartFreezePawn()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    event @NULL Bump()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

        StartBlowMeUpWhileDying();
        //return;        
    }

    simulated event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

        // End:0x97
        if(((((!bDoneBlowingUpWhileDying && Other != none) && !Other.bHidden) && LPAIPawnMedFlyer(Other) == none) && LPThermalEnergyPickup(Other) == none) && !bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        //return;        
    }

    simulated function @NULL HitWall()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp;

        // End:0x1B
        if(!bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        //return;        
    }

    event Landed()
    {
        local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

        // End:0x1B
        if(!bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        super.Landed(HitNormal, FloorActor);
        //return;        
    }

    simulated event @NULL RigidBodyCollision()
    {
        local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
        local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];

        // End:0x5D
        if(((!bDoneBlowingUpWhileDying && OtherComponent != HitComponent) && IsOtherAValidExplodeAgainstTarget(OtherComponent)) && !bMeleeDeath)
        {
            StartBlowMeUpWhileDying();
        }
        super.RigidBodyCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
        //return;        
    }

    function IsItTimeToDestoryPawn()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float timeSinceDeath;

        // End:0x0F
        if(bDoneBlowingUpWhileDying)
        {
            return true;
        }
        timeSinceDeath = WorldInfo.TimeSeconds - TimeDied;
        // End:0x93
        if(bMeleeDeath)
        {
            // End:0x93
            if(timeSinceDeath > TuneDataMedFlyer.MeleeHitTimeAfterHitBeforeDestory.GetValue())
            {
                return true;
            }
        }
        // End:0xC1
        if(timeSinceDeath > TuneDataAIPawn.TimeBetweenDeathAndDelete)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    SetLifeCycleState(2);
    // End:0x27
    if(!bDoneBlowingUpWhileDying)
    {
        StartBlowMeUpWhileDying();
    }
    Mesh.SetHidden(true);
    Sleep(TuneDataMedFlyer.TimeAfterDeathExplosionBeforeDestory.GetValue());
    Destroy();
    stop;            
}

defaultproperties
{
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnNushiSpore.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnNushiSpore.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnNushiSpore.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnNushiSpore.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnNushiSpore.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnNushiSpore.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnNushiSpore.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnNushiSpore.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnNushiSpore.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnNushiSpore.FaceAudioComponent'
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
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnNushiSpore.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}