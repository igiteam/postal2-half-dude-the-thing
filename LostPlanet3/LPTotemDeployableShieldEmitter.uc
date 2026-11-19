class LPTotemDeployableShieldEmitter extends LPTotemBase
    notplaceable
    hidecategories(AnimDependency,Navigation);

enum DeployableShieldState
{
    eDeployableShieldState_Invalid, // 0
    eDeployableShieldState_Deploying,// 1
    eDeployableShieldState_Inflating,// 2
    eDeployableShieldState_Opening, // 3
    eDeployableShieldState_Open,    // 4
    eDeployableShieldState_Closing, // 5
    eDeployableShieldState_Deflating,// 6
    eDeployableShieldState_Closed,  // 7
    eDeployableShieldState_Exploding,// 8
    eDeployableShieldState_MAX      // 9
};

enum DeployableShieldAnim
{
    eDeployableShieldAnim_Inflating,// 0
    eDeployableShieldAnim_Projecting,// 1
    eDeployableShieldAnim_Deflating,// 2
    eDeployableShieldAnim_MAX       // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPTotemDeployableShieldEmitter.DeployableShieldState ShieldState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SweepTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SweepTimeRemaining;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SweepTotalTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AnimNames;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ShieldTuneData;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL ShieldMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int ShieldHealth[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel int MaxShieldHealth[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ShieldMaterialInstance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ShieldBackMaterialInstance;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL OperatingSoundComponent[524289];

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x2A
    if(VarName == 'ShieldState')
    {
        SetShieldState(ShieldState);
    }
    // End:0xF0
    if(VarName == 'ShieldHealth')
    {
        // End:0x97
        if(ShieldMaterialInstance != none)
        {
            ShieldMaterialInstance.SetScalarParameterValue('DamageFactor', 1.0000000 - (float(ShieldHealth) / float(MaxShieldHealth)));
        }
        // End:0xED
        if(ShieldBackMaterialInstance != none)
        {
            ShieldBackMaterialInstance.SetScalarParameterValue('DamageFactor', 1.0000000 - (float(ShieldHealth) / float(MaxShieldHealth)));
        }        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    // End:0x43
    if(OperatingSoundComponent != none)
    {
        OperatingSoundComponent.Stop();
        OperatingSoundComponent = none;
    }
    //return;    
}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super(Actor).InitTuneData(TuneData);
    ShieldTuneData = LPTuneDataPerkShield(TuneDataTotem);
    // End:0xEA
    if(int(Role) == int(ROLE_Authority))
    {
        Health = int(ShieldTuneData.Health.GetValue(OwningController));
        ShieldHealth = int(ShieldTuneData.ShieldHealth.GetValue(OwningController));
        MaxShieldHealth = ShieldHealth;
    }
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    ShieldMesh.SetScale(0.0100000);
    ShieldMaterialInstance = ShieldMesh.CreateAndSetMaterialInstanceConstant(0);
    ShieldBackMaterialInstance = ShieldMesh.CreateAndSetMaterialInstanceConstant(1);
    // End:0xEB
    if(ShieldMaterialInstance != none)
    {
        ShieldMaterialInstance.SetScalarParameterValue('Power', 0.0000000);
        ShieldMaterialInstance.SetScalarParameterValue('DamageFactor', 0.0000000);
    }
    // End:0x127
    if(ShieldBackMaterialInstance != none)
    {
        ShieldBackMaterialInstance.SetScalarParameterValue('DamageFactor', 0.0000000);
    }
    ShieldMesh.SetHidden(true);
    ShieldMesh.SetActorCollision(false, false);
    ShieldState = 1;
    //return;    
}

simulated function SetShieldState()
{
    local /*0x97E50000-0x00000000*/ private byte eState[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVisible;

    switch(eState)
    {
        // End:0x44
        case 0:
            bVisible = false;
            SetCollision(false, false);
            Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            // End:0x422
            break;
        // End:0x5E
        case 1:
            bVisible = false;
            SetCollision(false, false);
            // End:0x422
            break;
        // End:0xC2
        case 2:
            SetCollision(true, true);
            Velocity = vect(0.0000000, 0.0000000, 0.0000000);
            PlayAnim(0, false);
            bVisible = true;
            SweepTimeRemaining = SweepTime;
            SweepTotalTime = SweepTime;
            // End:0x422
            break;
        // End:0xCA
        case 3:
            // End:0x422
            break;
        // End:0x273
        case 4:
            SetCollision(true, true);
            bVisible = true;
            ShieldMaterialInstance.SetScalarParameterValue('Power', 1.0000000);
            ShieldMesh.SetScale(1.0000000);
            // End:0x187
            if(OperatingSoundComponent != none)
            {
                // End:0x184
                if(!OperatingSoundComponent.IsPlaying())
                {
                    OperatingSoundComponent.Play();
                }                
            }
            else
            {
                OperatingSoundComponent = CreateAudioComponent(ShieldTuneData.OperatingSoundCue, false, true);
                // End:0x270
                if(OperatingSoundComponent != none)
                {
                    OperatingSoundComponent.bUseOwnerLocation = true;
                    OperatingSoundComponent.bAutoDestroy = true;
                    OperatingSoundComponent.bStopWhenOwnerDestroyed = true;
                    OperatingSoundComponent.bShouldRemainActiveIfDropped = true;
                    OperatingSoundComponent.Play();
                }
            }
            // End:0x422
            break;
        // End:0x3CF
        case 5:
            bVisible = true;
            SweepTimeRemaining = SweepTime;
            SweepTotalTime = SweepTime;
            // End:0x2E3
            if(OperatingSoundComponent != none)
            {
                OperatingSoundComponent.Stop();
                OperatingSoundComponent = none;
            }
            OperatingSoundComponent = CreateAudioComponent(ShieldTuneData.ClosingSoundCue, false, true);
            // End:0x3CC
            if(OperatingSoundComponent != none)
            {
                OperatingSoundComponent.bUseOwnerLocation = true;
                OperatingSoundComponent.bAutoDestroy = true;
                OperatingSoundComponent.bStopWhenOwnerDestroyed = true;
                OperatingSoundComponent.bShouldRemainActiveIfDropped = true;
                OperatingSoundComponent.Play();
            }
            // End:0x422
            break;
        // End:0x3F1
        case 6:
            bVisible = false;
            PlayAnim(2, false);
            // End:0x422
            break;
        // End:0x40B
        case 7:
            bVisible = false;
            SetCollision(false, false);
            // End:0x422
            break;
        // End:0x41F
        case 8:
            bVisible = false;
            // End:0x422
            break;
        // End:0xFFFF
        default:
            break;
    }
    ShieldMesh.SetHidden(!bVisible);
    ShieldMesh.SetActorCollision(bVisible, bVisible);
    // End:0x4B2
    if(int(Role) == int(ROLE_Authority))
    {
        ShieldState = eState;
        CheckForShieldDestroy();
    }
    //return;    
}

function CheckForShieldDestroy()
{
    // End:0x17
    if(int(ShieldState) == int(7))
    {
        Destroy();
    }
    //return;    
}

simulated function NotifyDeployed()
{
    super.NotifyDeployed();
    SetShieldState(2);
    //return;    
}

simulated function EndBeacon()
{
    local /*0x97E50000-0x00000000*/ private bool bReplace[9437185];

    false
    super.EndBeacon(bReplace);
    SetShieldState(5);
    //return;    
}

simulated function PlayAnim()
{
    local /*0x97E50000-0x00000000*/ private int AnimIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLoop[8388609];
    local /*0x97E50000-0x00000000*/ private float PlayBackRate[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL Slot;

    1.0000000
    // End:0xD0
    if(VisibleSkelMesh != none)
    {
        Slot = SPAnimNodeSlot(VisibleSkelMesh.FindAnimNode('TotemSlotNode'));
        // End:0xD0
        if(Slot != none)
        {
            Slot.PlayCustomAnimWithDelegate(OnAnimationFinished, AnimIndex, AnimNames[AnimIndex], PlayBackRate, 0.0000000, 0.0000000, bLoop, true);
        }
    }
    //return;    
}

simulated function OnAnimationFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x1F
    if(InUserData == 0)
    {
        PlayAnim(1, true);        
    }
    else
    {
        // End:0x3B
        if(InUserData == 2)
        {
            SetShieldState(7);
        }
    }
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;
    local /*0x97E50000-0x00000000*/ private int Idx;
    local /*0x97E50000-0x00000000*/ private float HealthRatio;
    local /*0x97E50000-0x00000000*/ private bool bHitShield;
    local /*0x97E50000-0x00000000*/ private @NULL HitActor, NewHitLocation, NewHitNormal, newHitInfo, StartLoc;

    local /*0x97E50000-0x00000000*/ private bool bAcceptsFriendlyFire;

    // End:0x415
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x126
        if((HitInfo.HitComponent == none) && DamageCauser != none)
        {
            StartLoc = DamageCauser.Location;
            HitActor = DamageCauser.Trace(NewHitLocation, NewHitNormal, self.Location, StartLoc, true, vect(0.0000000, 0.0000000, 0.0000000), newHitInfo);
            // End:0x123
            if((HitActor != none) && newHitInfo.HitComponent == ShieldMesh)
            {
                bHitShield = true;
            }            
        }
        else
        {
            // End:0x15C
            if(HitInfo.HitComponent == ShieldMesh)
            {
                bHitShield = true;
            }
        }
        // End:0x415
        if(bHitShield)
        {
            bAcceptsFriendlyFire = TuneDataTotem.AcceptFriendlyFireFlag.GetValue(OwningController) != 0.0000000;
            // End:0x233
            if((!bAcceptsFriendlyFire && InstigatedBy != none) && OwningController != none)
            {
                // End:0x233
                if(int(InstigatedBy.GetTeamNum()) == int(OwningController.GetTeamNum()))
                {
                    return;
                }
            }
            Idx = Class'SPEngine.SPUtil'.static.GetFilteredDamageFactorIndex(ShieldTuneData.ShieldDamageFilterInfo, DamageType);
            // End:0x2DC
            if(Idx > -1)
            {
                DamageAmount *= ShieldTuneData.DamageFilterInfo[Idx].DamageFactor;
            }
            // End:0x3CA
            if(ShieldHealth > 0)
            {
                ShieldHealth -= DamageAmount;
                // End:0x31A
                if(ShieldHealth <= 0)
                {
                    SetShieldState(5);
                }
                HealthRatio = float(ShieldHealth) / float(MaxShieldHealth);
                // End:0x383
                if(ShieldMaterialInstance != none)
                {
                    ShieldMaterialInstance.SetScalarParameterValue('DamageFactor', 1.0000000 - HealthRatio);
                }
                // End:0x3CA
                if(ShieldBackMaterialInstance != none)
                {
                    ShieldBackMaterialInstance.SetScalarParameterValue('DamageFactor', 1.0000000 - HealthRatio);
                }
            }
            // End:0x415
            if(!ClassIsChildOf(DamageType, Class'LPDamageType') || !class<LPDamageType>(DamageType).default.bCausesEMP)
            {
                return;
            }
        }
    }
    super.TakeDamage(DamageAmount, InstigatedBy, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    UpdateShieldState(DeltaTime);
    //return;    
}

simulated function UpdateShieldState()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], Ratio;

    // End:0x167
    if((int(ShieldState) == int(2)) || int(ShieldState) == int(5))
    {
        SweepTimeRemaining -= DeltaTime;
        Ratio = SweepTimeRemaining / SweepTotalTime;
        // End:0x7C
        if(SweepTimeRemaining < float(0))
        {
            Ratio = 0.0000000;
        }
        // End:0x127
        if(ShieldMaterialInstance != none)
        {
            Ratio = ((int(ShieldState) == int(2)) ? float(1) - Ratio : Ratio);
            ShieldMaterialInstance.SetScalarParameterValue('Power', Ratio);
            ShieldMesh.SetScale(FClamp(Ratio, 0.0100000, 1.0000000));
        }
        // End:0x167
        if(SweepTimeRemaining <= float(0))
        {
            // End:0x15B
            if(int(ShieldState) == int(2))
            {
                SetShieldState(4);                
            }
            else
            {
                SetShieldState(6);
            }
        }
    }
    //return;    
}

simulated state EMPShutdown
{
    ignores CheckForShieldDestroy;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super.BeginState(PrevStateName);
        SetShieldState(5);
        //return;        
    }

    simulated function EndBeacon()
    {
        local /*0x97E50000-0x00000000*/ private bool bReplace[9437185];

        false
        super(LPTotemBase).EndBeacon(bReplace);
        Destroy();
        //return;        
    }

    simulated event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        // End:0x2E
        if(!bBeaconEnded)
        {
            SetShieldState(2);
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    SweepTime=0.5000000
    AnimNames=/* Array type was not detected. */
    // Reference: StaticMeshComponent'Default__LPTotemDeployableShieldEmitter.ShieldMesh0'
    begin object name=ShieldMesh0 class=Class'Engine.StaticMeshComponent'
    end object
    ShieldMesh=ShieldMesh0
    PerkIndex=EPerks.EPERK_SHIELD
    // Reference: SkeletalMeshComponent'Default__LPTotemDeployableShieldEmitter.TotemMeshComp'
    begin object name=TotemMeshComp
    end object
    SkelMesh=TotemMeshComp
    // Reference: SkeletalMeshComponent'Default__LPTotemDeployableShieldEmitter.EnemyTotemMeshComp'
    begin object name=EnemyTotemMeshComp
    end object
    EnemySkelMesh=EnemyTotemMeshComp
    // Reference: LPHackableTotemBaseComponent'Default__LPTotemDeployableShieldEmitter.HackComponentA'
    begin object name=HackComponentA
    end object
    HackComponent=HackComponentA
    // Reference: CylinderComponent'Default__LPTotemDeployableShieldEmitter.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[0]=CollisionCylinder
    Components[1]=HackComponentA
    Components[2]=ShieldMesh0
    CollisionType=ECollisionType.COLLIDE_BlockAll
    bGameRelevant=true
    bCollideWhenPlacing=true
    bCollideActors=true
    // Reference: LPTotemDeployableShieldInteractionMetaData'Default__LPTotemDeployableShieldEmitter.TotemInteract0'
    begin object name=TotemInteract0 class=Class'LPTotemDeployableShieldInteractionMetaData'
    end object
    InteractionMetaData=TotemInteract0
    CollisionComponent=CollisionCylinder
}