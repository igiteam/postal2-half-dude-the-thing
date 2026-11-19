class LPAIPawnPackHunter extends LPAIPawnAkridMedium
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

struct native PackHunterGrenadeStuckToAndCoreIdPair
{
    var(0.25_Pct) /*0x9FAD0000-0x00000000*/ private @NULL GrenadeStuck[65537];
    var(0.25_Pct) /*0x9FAD0000-0x00000000*/ private byte CoreID[65537];

    structdefaultproperties
    {
        GrenadeStuck=none
        CoreID=ePackHunterCore.ePackHunterCore_Mouth
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataPackHunter[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DirectAttackSuperAggressiveAnimations;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MovingHitReactionAnimations;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MovingCoreHitReactionAnimations;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HeadGlowFactor[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TailGlowFactor[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedHeadGlowFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedTailGlowFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EffectiveScriptedHeadGlowFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EffectiveScriptedTailGlowFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedHeadGlowRampRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScriptedTailGlowRampRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_TailCoreHit_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_TailCoreHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_CoreHit_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_CoreHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_LeftShoulderHit_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_LeftShoulderHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_RightShoulderHit_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_RightShoulderHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_HeadHit_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_HeadHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AnimTemplateLogic_BackHipsHit_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AnimTemplateLogic_BackHipsHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseEmissiveLightingToShowWhoHasTheStrikeAccess[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanBreakThroughAllFracturedMeshes[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleNPH;

// Export ULPAIPawnPackHunter::execScriptToCodeDebugHelper(FFrame&, void* const)
native function ScriptToCodeDebugHelper();

// Export ULPAIPawnPackHunter::execPostSetPhatPawnBlockageCollidesWithFlags(FFrame&, void* const)
native simulated function PostSetPhatPawnBlockageCollidesWithFlags();

// Export ULPAIPawnPackHunter::execIsValidCoreTagType(FFrame&, void* const)
native simulated function IsValidCoreTagType()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnPackHunter::execGetDamageFactor(FFrame&, void* const)
native final simulated function GetDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnPackHunter::execGetTailGlowFactor(FFrame&, void* const)
native final simulated function GetTailGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnPackHunter::execGetHeadGlowFactor(FFrame&, void* const)
native final simulated function GetHeadGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated function SetRadarIconState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    super(LPPawn).SetRadarIconState(NewState);
    // End:0x55
    if(int(RadarIconState) != int(PrevRadarIconState))
    {
        // End:0x55
        if(int(RadarIconState) == int(2))
        {
            SetTimer(2.0000000, false, 'ClearRadarAttackAnnounceState');
        }
    }
    //return;    
}

simulated function ClearRadarAttackAnnounceState()
{
    SetRadarIconState(1);
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataPackHunter = LPTuneDataPackHunter(TuneData);
    super(LPAIPawnAkrid).InitTuneData(TuneData);
    bUseEmissiveLightingToShowWhoHasTheStrikeAccess = TuneDataPackHunter.bUseEmissiveLightingToShowWhoHasTheStrikeAccess;
    //return;    
}

simulated function InitAnimTemplates()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array MoveNames, MoveNodes;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x1C8
    if(AttackAnimTree != none)
    {
        MoveNames.AddItem(AnimTemplateLogic_TailCoreHit_Name);        
        MoveNames.AddItem(AnimTemplateLogic_CoreHit_Name);        
        MoveNames.AddItem(AnimTemplateLogic_LeftShoulderHit_Name);        
        MoveNames.AddItem(AnimTemplateLogic_RightShoulderHit_Name);        
        MoveNames.AddItem(AnimTemplateLogic_HeadHit_Name);        
        MoveNames.AddItem(AnimTemplateLogic_BackHipsHit_Name);        
        AttackAnimTree.FindAnimNodes(MoveNames, MoveNodes, Class'LPAnimNodeTemplateLogicNamedRoot');
        I = 0;
        AnimTemplateLogic_TailCoreHit = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
        AnimTemplateLogic_CoreHit = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
        AnimTemplateLogic_LeftShoulderHit = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
        AnimTemplateLogic_RightShoulderHit = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
        AnimTemplateLogic_HeadHit = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
        AnimTemplateLogic_BackHipsHit = LPAnimNodeTemplateLogicNamedRoot(MoveNodes[I++]);
    }
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

function IgnoreNonCorePassThroughFactor()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsDoingSpecialMove_OF_Class(Class'LPSM_WinchStruggleBase');
    //return ReturnValue;    
}

function OnSetPackHunterTailGlow()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    ScriptedTailGlowFactor = inAction.GlowValue;
    ScriptedTailGlowRampRate = inAction.RampRate;
    //return;    
}

function OnSetPackHunterHeadGlow()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    ScriptedHeadGlowFactor = inAction.GlowValue;
    ScriptedHeadGlowRampRate = inAction.RampRate;
    //return;    
}

function NotifyFromAnimToSpitGrenadeBackOutNow()
{
    //return;    
}

simulated function @NULL NotifyOfGrenadeGettingStuckTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenGettingStuck[8388609], ComponentGrenOn, HitNormal, PhysMat;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAIPawnAkrid).NotifyOfGrenadeGettingStuckTo(GrenGettingStuck, ComponentGrenOn, HitNormal, PhysMat);
    //return ReturnValue;    
}

simulated function GetNameOfBoneToAttackGrenadeToBasedOnPhysicalMaterial()
{
    local /*0x97E50000-0x00000000*/ private @NULL PhysMatToTest[8388609];
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL hitCoreTag;
    local /*0x97E50000-0x00000000*/ private int coreIdOn, iter;

    // End:0x140
    if(PhysMatToTest != none)
    {
        hitCoreTag = LPPhysMatPropTag_CoreId(PhysMatToTest.GetTag(Class'LPPhysMatPropTag_CoreId'));
        coreIdOn = hitCoreTag.GetCoreId();
        iter = 0;
        J0x7E:

        // End:0x140 [Loop If]
        if(iter < TuneDataPackHunter.BoneAttachPointByCore.Length)
        {
            // End:0x132
            if(int(TuneDataPackHunter.BoneAttachPointByCore[iter].CoreID) == coreIdOn)
            {
                return TuneDataPackHunter.BoneAttachPointByCore[iter].BoneName;
            }
            iter++;
            // [Loop Continue]
            goto J0x7E;
        }
    }
    //return ReturnValue;    
}

simulated function IsThisCoreAStickGrenadeToCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreIdToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x93 [Loop If]
    if(iter < TuneDataPackHunter.BoneAttachPointByCore.Length)
    {
        // End:0x85
        if(int(TuneDataPackHunter.BoneAttachPointByCore[iter].CoreID) == CoreIdToTest)
        {
            return true;
        }
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    return false;
    //return ReturnValue;    
}

simulated function PlayGrenadeInInternalGrenadeExplosionEffects()
{
    TuneDataPawnFXEventBindings.PlayEventFX('GrenadeInMouthExplosion', self, Mesh, none);
    TuneDataPawnSoundEventBindings.PlayEventSoundLocally('GrenadeExplosionInMouth', 'None', self, none, none);
    //return;    
}

simulated function AttachedGrenadeJustExploded()
{
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];

    super(LPAIPawnAkrid).AttachedGrenadeJustExploded(CoreAttachedTo);
    //return;    
}

simulated function PlayHitReactionAnimation()
{
    // End:0x48
    if((Health > 0) && !IsDoingSpecialMove_OF_Class(Class'LPSM_WinchStruggleBase'))
    {
        DamageReactionManagerAI.ExecuteDamageReaction();
    }
    //return;    
}

simulated function NotifyJustGotGrabbed()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnGrabbingMe[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x5A [Loop If]
    if(iter < GrabPoints.Length)
    {
        GrabPoints[iter].bEnabledForFreeGrab = false;
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    EnableCoreById(0, true);
    //return;    
}

simulated function DoVSCrushTossAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL TossPawn[8388609], TossVelocity;

    vect(0.0000000, 0.0000000, -100.0000000)
    EndCurrentSpecialMove();
    SetPhysics(6);
    // End:0x60
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        Velocity = TossVelocity;        
    }
    else
    {
        Velocity = ReplicatedTossInfo.TossVelocity;
    }
    Class'SPEngine.SPUtil'.static.SetRBCollision(Mesh, TossPawn.Mesh, false);
    // End:0x115
    if(TossVelocity != vect(0.0000000, 0.0000000, -100.0000000))
    {
        TossPawn.TriggerEventClass(Class'LPSeqEvent_VitalSuitWinch', self, 2);
    }
    bShouldRagdoll = true;
    // End:0x1C7
    if(int(WorldInfo.NetMode) != int(NM_Client))
    {
        ReplicatedTossInfo.TossPawn = TossPawn;
        ReplicatedTossInfo.TossVelocity = Velocity;
        TakeDamage(1000000, none, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeForced');
    }
    //return;    
}

simulated function DoVSReleaseAction()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReleaseVelocity[9437185];

    vect(0.0000000, 0.0000000, -100.0000000)
    EndCurrentSpecialMove();
    SetPhysics(6);
    Velocity = ReleaseVelocity;
    bShouldRagdoll = true;
    bApplyRagdollImpulse = false;
    //return;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;

    // End:0x8F
    if((int(WorldInfo.NetMode) == int(NM_Client)) && ReplicatedTossInfo.TossPawn != none)
    {
        DoVSCrushTossAction(ReplicatedTossInfo.TossPawn, ReplicatedTossInfo.TossVelocity);
    }
    iter = 0;
    J0x9A:

    // End:0xE9 [Loop If]
    if(iter < GrabPoints.Length)
    {
        GrabPoints[iter].bEnabledForFreeGrab = false;
        ++iter;
        // [Loop Continue]
        goto J0x9A;
    }
    // End:0x1E3
    if(WantsToPlayDieAnim(DamageType))
    {
        // End:0x1E3
        if(!bShouldRagdoll)
        {
            // End:0x149
            if(IsDoingSpecialMove_OF_Class(Class'LPSM_WinchStruggleBase'))
            {
                DoVSReleaseAction();
                DoSpecialMove(Class'LPSM_PackHunterDieWinchArm');                
            }
            else
            {
                GetMovementInteruptionEffectBasedOnCurrentVelocityAndFacing(LastMovementInteruptionEffectDirection, LastMovementInteruptionEffectSpeedFactor, false);
                // End:0x1D0
                if((int(LastMovementInteruptionEffectDirection) == int(1)) && int(LastMovementInteruptionEffectSpeedFactor) > int(1))
                {
                    // End:0x1BA
                    if(int(LastMovementInteruptionEffectSpeedFactor) == int(5))
                    {
                        PlayDyingSpecialMove(Class'LPSM_PackHunterRunningPlowInAndDie');                        
                    }
                    else
                    {
                        PlayDyingSpecialMove(Class'LPSM_PackHunterWalkingPlowInAndDie');
                    }                    
                }
                else
                {
                    PlayDyingSpecialMove(Class'LPSM_PackHunterDie');
                }
            }
        }
    }
    //return;    
}

function EnableAnnounceHeadGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    EnableCoreById(0, bEnable);
    // End:0x7A
    if(bUseEmissiveLightingToShowWhoHasTheStrikeAccess)
    {
        HeadGlowFactor = ((bEnable) ? TuneDataPackHunter.HeadGlowFactorAnnounceTaunt : TuneDataPackHunter.HeadGlowFactorWhenOwnStrikeAccess);        
    }
    else
    {
        HeadGlowFactor = ((bEnable) ? TuneDataPackHunter.HeadGlowFactorAnnounceTaunt : 0.0000000);
    }
    //return;    
}

function EnableAnnounceTailGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x65
    if(bUseEmissiveLightingToShowWhoHasTheStrikeAccess)
    {
        TailGlowFactor = ((bEnable) ? TuneDataPackHunter.TailGlowFactorAnnounceTaunt : TuneDataPackHunter.TailGlowFactorWhenOwnStrikeAccess);        
    }
    else
    {
        TailGlowFactor = ((bEnable) ? TuneDataPackHunter.TailGlowFactorAnnounceTaunt : 0.0000000);
    }
    //return;    
}

function EnableStrikeAccessHeadGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    HeadGlowFactor = ((bEnable) ? TuneDataPackHunter.HeadGlowFactorWhenOwnStrikeAccess : 0.0000000);
    //return;    
}

function EnableStrikeAccessTailGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    TailGlowFactor = ((bEnable) ? TuneDataPackHunter.TailGlowFactorWhenOwnStrikeAccess : 0.0000000);
    //return;    
}

function PlayPackhunterScaredSound()
{
    TuneDataPawnSoundEventBindings.PlayEventSoundLocally('PackHunterScared', 'None', self, none, none);
    //return;    
}

simulated function OnOverrideFormationRadius()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    //return;    
}

simulated function TurnOffScriptedGlows()
{
    ScriptedTailGlowFactor = -1.0000000;
    ScriptedHeadGlowFactor = -1.0000000;
    //return;    
}

simulated event HandleAnimNotifyGlow()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609], NotifyPH;

    super(LPPawn).HandleAnimNotifyGlow(Notify);
    NotifyPH = LPAnimNotify_GlowPackhunter(Notify);
    // End:0x40
    if(NotifyPH == none)
    {
        return;
    }
    // End:0xB9
    if(int(NotifyPH.GlowPart) == 0)
    {
        ScriptedTailGlowFactor = NotifyPH.GlowFactor;
        ScriptedTailGlowRampRate = NotifyPH.GlowRampRate;        
    }
    else
    {
        // End:0x12F
        if(int(NotifyPH.GlowPart) == 1)
        {
            ScriptedHeadGlowFactor = NotifyPH.GlowFactor;
            ScriptedHeadGlowRampRate = NotifyPH.GlowRampRate;
        }
    }
    //return;    
}

simulated event DoIBreakFracturedMeshOfThisType()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FracturedMesh;

    FracturedMesh = SPFracturedStaticMeshActor(FracAct);
    // End:0x53
    if((FracturedMesh != none) && !FracturedMesh.bBigPawnsCanFractureByCollision)
    {
        return false;
    }
    return bCanBreakThroughAllFracturedMeshes;
    //return ReturnValue;    
}

simulated event DoIExplodeFracturedMeshOfThisType()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FracturedMesh;

    FracturedMesh = SPFracturedStaticMeshActor(FracAct);
    // End:0x53
    if((FracturedMesh != none) && !FracturedMesh.bBigPawnsCanFractureByCollision)
    {
        return false;
    }
    return bCanBreakThroughAllFracturedMeshes;
    //return ReturnValue;    
}

defaultproperties
{
    bCanBreakThroughAllFracturedMeshes=true
    bApplyRagdollImpulse=false
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnPackHunter.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    bCanCauseFractureOnTouch=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnPackHunter.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnPackHunter.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    SinkDepthMultiplier=0.3000000
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnPackHunter.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnPackHunter.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnPackHunter.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnPackHunter.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    bCanStrafe=false
    AccelRate=9100.0000000
    // Reference: SkeletalMeshComponent'Default__LPAIPawnPackHunter.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnPackHunter.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnPackHunter.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPAIPawnPackHunter.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    Components[10]=DamageStateComponentDefObj
    bUseMultipleExtent=true
    bCheckAIMeshWhenMoving=true
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnPackHunter.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}