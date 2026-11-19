class LPAIPawnHuman extends LPAIPawn
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataHuman[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class OverwriteDamageTypeMelee;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedWaitingForDelete[536870913];

// Export ULPAIPawnHuman::execCheckDeadBodyCount(FFrame&, void* const)
native function CheckDeadBodyCount()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataHuman = LPTuneDataAIPawnHuman(TuneData);
    super.InitTuneData(TuneData);
    //return;    
}

simulated function PlayDying()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    super(LPPawn).PlayDying(DamageType, HitLoc);
    // End:0x6F
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeFragGrenade') && (FRand() * 100.0000000) <= TuneDataHuman.RagdollOnGrenadeDeathPctg)
    {
        DoKnockDown();        
    }
    else
    {
        // End:0xC2
        if(ClassIsChildOf(DamageType, Class'LPDamageTypePlayerMelee') && (FRand() * 100.0000000) <= TuneDataHuman.RagdollOnMeleeDeathPctg)
        {
            DoKnockDown();            
        }
        else
        {
            // End:0xDC
            if(IsDoingASpecialMove())
            {
                DoKnockDown();                
            }
            else
            {
                // End:0x124
                if((IsInCover()) && (FRand() * 100.0000000) <= TuneDataHuman.RagdollOnCoverDeathPctg)
                {
                    DoKnockDown();                    
                }
                else
                {
                    // End:0x18A
                    if((!IsInCover() && (FRand() * 100.0000000) <= TuneDataHuman.RagdollOnNormalDeathPctg) && !ClassIsChildOf(DamageType, Class'LPDamageTypeShotgunPellet'))
                    {
                        DoKnockDown();                        
                    }
                    else
                    {
                        // End:0x1D4
                        if(!IsInCover() && (FRand() * 100.0000000) <= TuneDataHuman.RagdollOnNormalShotgunDeathPctg)
                        {
                            DoKnockDown();                            
                        }
                        else
                        {
                            DoSpecialMove(Class'LPSM_DirectionalDeathHuman', true);
                            // End:0x288
                            if(((DamageType == Class'LPDamageTypeVSWinch') || DamageType == TuneDataHuman.DamageTypeFromSlowVsKnockBackHit) || DamageType == TuneDataHuman.DamageTypeFromFastVsKnockBackHit)
                            {
                                BroadcastSMMessage(Class'SPEngine.SPSpecialMoveMessageTypes'.default.SMM_BeginRagdollBlend, none);
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x2B5
    if(myKynapseHandle != none)
    {
        DetachComponent(myKynapseHandle);
        myKynapseHandle = none;
    }
    //return;    
}

simulated function DoKnockDown()
{
    bUseRigidBodySync = true;
    EndCurrentSpecialMove();
    DoRagdoll();
    ApplyFlyBackImpulse();
    //return;    
}

function ApplyFlyBackImpulse()
{
    local /*0x97E50000-0x00000000*/ private float HorizantalImpulse, UpwardImpulse;
    local /*0x97E50000-0x00000000*/ private @NULL CombinedImpulse, ImpulseDirection, ImpulseLocation, HitDirection;
    local /*0x97E50000-0x00000000*/ private float ImpulseSize, RandHeight;

    // End:0x7E
    if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeFragGrenade'))
    {
        HorizantalImpulse = TuneDataHuman.PushAlongImpulsePlayerGrenade;
        UpwardImpulse = TuneDataHuman.PushUpImpulsePlayerGrenade;        
    }
    else
    {
        // End:0xFC
        if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeShotgunPellet'))
        {
            HorizantalImpulse = TuneDataHuman.PushAlongImpulsePlayerShotgun;
            UpwardImpulse = TuneDataHuman.PushUpImpulsePlayerShotgun;            
        }
        else
        {
            // End:0x17A
            if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeHuntingRifle'))
            {
                HorizantalImpulse = TuneDataHuman.PushAlongImpulsePlayerShotgun;
                UpwardImpulse = TuneDataHuman.PushUpImpulsePlayerShotgun;                
            }
            else
            {
                // End:0x1F8
                if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypeBallistic'))
                {
                    HorizantalImpulse = TuneDataAIPawn.PushAlongImpulse;
                    UpwardImpulse = TuneDataAIPawn.PushUpImpulse;                    
                }
                else
                {
                    // End:0x273
                    if(ClassIsChildOf(TakeDamageParams.DamageType, Class'LPDamageTypePlayerMelee'))
                    {
                        HorizantalImpulse = TuneDataHuman.PushAlongImpulsePlayerMelee;
                        UpwardImpulse = TuneDataHuman.PushUpImpulsePlayerMelee;
                    }
                }
            }
        }
    }
    // End:0x29D
    if((HorizantalImpulse == 0.0000000) && UpwardImpulse == 0.0000000)
    {
        return;
    }
    ZeroMovementVariables();
    HitDirection = Class'SPEngine.SPAnimNodeTemplateLogicHitDirection'.static.GetHitDirectionMomentum(self);
    HitDirection.Z = 0.0000000;
    HitDirection = Normal(HitDirection);
    CombinedImpulse = HitDirection * HorizantalImpulse;
    CombinedImpulse.Z = UpwardImpulse;
    ImpulseDirection = Normal(CombinedImpulse);
    ImpulseLocation = -ImpulseDirection * float(60);
    ImpulseLocation += TakeDamageParams.HitLocation;
    RandHeight = -10.0000000;
    // End:0x43F
    if(ImpulseLocation.Z > (Location.Z + RandHeight))
    {
        ImpulseLocation.Z = Location.Z + RandHeight;
    }
    ImpulseSize = VSize(CombinedImpulse);
    Mesh.AddRadialImpulse(ImpulseLocation, 5000.0000000, ImpulseSize, 1, true);
    //return;    
}

simulated function OnAddRemovePistolAnimSetsContent()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    OnAddRemoveAnimSets(inAction);
    //return;    
}

function AdjustDamage()
{
    local /*0x97E50000-0x00000000*/ private int InDamage[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL Momentum[25165825], InstigatedBy, HitLocation;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609], DamageCauser;

    // End:0x38
    if(IsSameTeam(InstigatedBy.Pawn))
    {
        InDamage = 0;
        return;
    }
    // End:0x87
    if((int(GetTeamNum()) == 3) && LPBasePlayerPawn(InstigatedBy.Pawn) != none)
    {
        InDamage = 0;
        return;
    }
    super.AdjustDamage(InDamage, Momentum, InstigatedBy, HitLocation, DamageType, HitInfo, DamageCauser);
    //return;    
}

simulated state Dying
{
    function StartWaitToDeletePawn()
    {
        TimeStartedWaitingForDelete = WorldInfo.TimeSeconds;
        //return;        
    }

    function GetTimeToDeleteCheckSleepInterval()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return 0.5000000;
        //return ReturnValue;        
    }

    function IsTimeToDeleteDeadPawn()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(super.IsTimeToDeleteDeadPawn())
        {
            return true;
        }
        return CheckDeadBodyCount();
        //return ReturnValue;        
    }
    stop;    
}

defaultproperties
{
    OverwriteDamageTypeMelee=Class'LPDamageTypeHumanSoldierMelee'
    bApplyRagdollImpulse=false
    bPlayImpactEffectsWhenDead=true
    bTrackAimStateNodesThatDelayFiring=true
    // Reference: LPAIResManHuman'Default__LPAIPawnHuman.LPAIResManHuman'
    begin object name=LPAIResManHuman class=Class'LPAIResManHuman'
    end object
    AIResourceManager=LPAIResManHuman
    // Reference: LPDamageReactionManagerAIHuman'Default__LPAIPawnHuman.DamageReactionManagerHuman'
    begin object name=DamageReactionManagerHuman class=Class'LPDamageReactionManagerAIHuman'
    end object
    DamageReactionManager=DamageReactionManagerHuman
    AdditiveHitReactionAnimInfo=(AnimNodeSlotName="AdditiveHitReactionSlotNode")
    AdditiveHitBlenderName="AdditiveHitBlender"
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnHuman.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnHuman.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnHuman.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0 class=Class'LPFXActionManager'
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnHuman.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnHuman.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnHuman.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnHuman.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnHuman.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnHuman.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnHuman.FaceAudioComponent'
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
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnHuman.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}