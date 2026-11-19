class LPAIPawnStalker extends LPAIPawnAkridMedium
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStalker[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StalkerCoverAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseAdditivesForFiring;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayingFiringAdditive[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsMale[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayFiringAnim[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayFiringAnimInOpen;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_FiringCycleMediumCover_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_FiringCycleMediumCover[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_FiringCycleStandingCover_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_FiringCycleStandingCover[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_FiringCycle_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_FiringCycle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ATL_AdditiveHitReaction02_Name;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ATL_AdditiveHitReaction02;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array GrenadesClose;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampPlayedCallOutSound[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleLong;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EyeGlowFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EyeGlowFactorDesired;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EyeGlowFactorRampRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ArmsGlowFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ArmsGlowFactorDesired;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ArmsGlowFactorRampRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpikesGlowFactor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpikesGlowFactorDesired;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SpikesGlowFactorRampRate;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel Vector ClientFirePositions[2097156];

// Export ULPAIPawnStalker::execHandleWeaponFiring(FFrame&, void* const)
native simulated function HandleWeaponFiring();

// Export ULPAIPawnStalker::execSetCoverAction(FFrame&, void* const)
native simulated function SetCoverAction()
{
    local /*0x97E50000-0x00000000*/ private byte NewCoverAction[8388609];


}

// Export ULPAIPawnStalker::execDoingAnimationTransition(FFrame&, void* const)
native simulated function DoingAnimationTransition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnStalker::execGetPawnViewLocation(FFrame&, void* const)
native simulated function GetPawnViewLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULPAIPawnStalker::execGetGlowFactor(FFrame&, void* const)
native final simulated function GetGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float Actual[8388609], Desired, RampRate, ReturnValue;


}

// Export ULPAIPawnStalker::execGetEyeGlowFactor(FFrame&, void* const)
native final simulated function GetEyeGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnStalker::execGetArmsGlowFactor(FFrame&, void* const)
native final simulated function GetArmsGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

// Export ULPAIPawnStalker::execGetSpikesGlowFactor(FFrame&, void* const)
native final simulated function GetSpikesGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x40
    if(VarName == 'ClientFirePositions')
    {
        LPWeaponStalker(Weapon).ClientBulletNum = 0;
    }
    super(LPPawn).ReplicatedEvent(VarName);
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataStalker = LPTuneDataAIPawnStalker(TuneData);
    super(LPAIPawnAkrid).InitTuneData(TuneData);
    HeadTrackComponent.LookInfo.Mode = 0;
    //return;    
}

simulated function GetAnimTemplateTreeForCoverSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], MyAnimTree;

    MyAnimTree = super(SPGFCoverPawn).GetAnimTemplateTreeForCoverSpecialMove(SpecialMove);
    // End:0x36
    if(MyAnimTree != none)
    {
        return MyAnimTree;
    }
    return StalkerCoverAnimTree;
    //return ReturnValue;    
}

simulated function InitAnimTemplates()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array SMNames, SMNodes;

    super(LPPawn).InitAnimTemplates();
    // End:0x125
    if(AttackAnimTree != none)
    {
        SMNames.AddItem(ATL_FiringCycle_Name);        
        SMNames.AddItem(ATL_FiringCycleMediumCover_Name);        
        SMNames.AddItem(ATL_FiringCycleStandingCover_Name);        
        SMNames.AddItem(ATL_AdditiveHitReaction02_Name);        
        AttackAnimTree.FindAnimNodes(SMNames, SMNodes, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
        ATL_FiringCycle = SPAnimNodeTemplateLogicNamedRoot(SMNodes[0]);
        ATL_FiringCycleMediumCover = SPAnimNodeTemplateLogicNamedRoot(SMNodes[1]);
        ATL_FiringCycleStandingCover = SPAnimNodeTemplateLogicNamedRoot(SMNodes[2]);
        ATL_AdditiveHitReaction02 = LPAnimNodeTemplateLogicNamedRoot(SMNodes[3]);
    }
    //return;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated event HeadBoneName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'JO_Eye';
    //return ReturnValue;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPPawn).Tick(DeltaTime);
    // End:0x5A
    if(IsInCover())
    {
        // End:0x5A
        if(IsCoverActionPopUp(5) || IsCoverActionLeaning(CoverAction))
        {
            UpdateWorldAimDir(DeltaTime);
        }
    }
    //return;    
}

function UpdateWorldAimDir()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    AimController.UpdateAim(DeltaTime);
    WorldAimDir = AimController.GetWorldAimRotator();
    //return;    
}

simulated event DoAILookAt()
{
    local /*0x97E50000-0x00000000*/ private @NULL whereToLook[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    whereToLook = (GetBurstFireStartTraceLocation()) + (Vector(WorldAimDir) * 100.0000000);
    return true;
    //return ReturnValue;    
}

simulated event GetBurstFireAdjustedAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLoc[8388609];
    local /*0x97E50000-0x00000000*/ private bool bUseDeadReckoning[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    false
    // End:0x3E
    if(Controller != none)
    {
        return Controller.GetAdjustedAimFor(none, StartLoc);
    }
    //return ReturnValue;    
}

simulated function HandleAnimStalkerFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL Notify[8388609];
    local /*0x97E50000-0x00000000*/ private float Duration[8388609];

    LPWeaponStalker(Weapon).HandFire(Duration, Notify.bLeftHand);
    //return;    
}

simulated function PlayAdditiveAnimationSequence()
{
    local /*0x97E50000-0x00000000*/ private @NULL SequenceTemplate[8519681];
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> EndDelegate[9437185];
    local /*0x97E50000-0x00000000*/ private int InUserData[9437185];
    local /*0x97E50000-0x00000000*/ private float Rate[9437185], BlendInTime, BlendOutTime;
    local /*0x97E50000-0x00000000*/ private bool bLooping[9437185], bOverride;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    None
    0
    1.0000000
    0.2000000
    0.2000000
    false
    true
    // End:0x4E
    if(bPlayingFiringAdditive)
    {
        return none;
    }
    return super(SPPawn).PlayAdditiveAnimationSequence(SequenceTemplate, EndDelegate, InUserData, Rate, BlendInTime, BlendOutTime, bLooping, bOverride);
    //return ReturnValue;    
}

function GetFiringCycle()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x3B
    if(IsInCover())
    {
        // End:0x2E
        if(int(CoverAction) == int(5))
        {
            return ATL_FiringCycleMediumCover;            
        }
        else
        {
            return ATL_FiringCycleStandingCover;
        }        
    }
    else
    {
        return ATL_FiringCycle;
    }
    //return ReturnValue;    
}

function StalkerFiringUpAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x24
    if(bPlayFiringAnimInOpen)
    {
        DoSpecialMove(Class'LPSM_StalkerFire', true, false);
    }
    //return;    
}

simulated function StartStalkerFiringAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate, FiringCycle;

    // End:0x62
    if(!bUseAdditivesForFiring)
    {
        // End:0x54
        if(!IsInCover())
        {
            bPlayFiringAnimInOpen = true;
            DoSpecialMove(Class'LPSM_StalkerFireUp', true, false, StalkerFiringUpAnimFinished);            
        }
        else
        {
            bPlayFiringAnim = true;
        }
        return;
    }
    // End:0x120
    if(!bPlayingFiringAdditive)
    {
        bPlayingFiringAdditive = true;
        FiringCycle = GetFiringCycle();
        AnimSeqTemplate = FiringCycle.GetBestSequenceTemplate(self);
        AdditiveAnimInfo.AnimNodeSlot.PlayCustomSequenceWithDelegate(None, 0, AnimSeqTemplate, 1.0000000, 0.0000000, 0.0000000, true, false, 0, 0, false, 3);
    }
    //return;    
}

simulated function StopStalkerFiringAnimation()
{
    bPlayFiringAnim = false;
    bPlayFiringAnimInOpen = false;
    // End:0x4B
    if(!bUseAdditivesForFiring)
    {
        // End:0x49
        if(!IsInCover())
        {
            EndSpecialMove(Class'LPSM_StalkerFire');
        }
        return;
    }
    // End:0x9B
    if(bPlayingFiringAdditive)
    {
        bPlayingFiringAdditive = false;
        AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.1000000);
    }
    //return;    
}

simulated function NotifyGrenadeOnRange()
{
    local /*0x97E50000-0x00000000*/ private @NULL InGrenade[8388609];

    GrenadesClose.AddItem(InGrenade);    
    //return;    
}

function IsGrenadeClose()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;

    I = GrenadesClose.Length - 1;
    J0x17:

    // End:0xBF [Loop If]
    if(I >= 0)
    {
        // End:0x57
        if(GrenadesClose[I] == none)
        {
            GrenadesClose.Remove(I, 1);                        
        }
        else
        {
            // End:0xB1
            if(VSize(GrenadesClose[I].Location - TestLocation) < TuneDataStalker.DistanceToGrenadeDangerous)
            {
                return true;
            }
        }
        --I;
        // [Loop Continue]
        goto J0x17;
    }
    return false;
    //return ReturnValue;    
}

simulated event GetWeaponShortRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x2C
    if(bIsMale)
    {
        return mySPAITuneDataPawn.EnemyDistanceShort;
    }
    return super(SPGFPawn).GetWeaponShortRange();
    //return ReturnValue;    
}

simulated event GetWeaponMediumRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x2C
    if(bIsMale)
    {
        return mySPAITuneDataPawn.EnemyDistanceMedium;
    }
    return super(SPGFPawn).GetWeaponMediumRange();
    //return ReturnValue;    
}

simulated event GetWeaponLongRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x2C
    if(bIsMale)
    {
        return mySPAITuneDataPawn.EnemyDistanceLong;
    }
    return super(SPGFPawn).GetWeaponLongRange();
    //return ReturnValue;    
}

simulated function FindBestCoverSideFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL CovInfo[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689], CoverDir;

    CoverDir = GetEdgeCoverDirection(CovPosInfoToCoverInfo(CovInfo));
    // End:0x45
    if(int(CoverDir) != int(0))
    {
        return CoverDir;
    }
    return super(SPGFCoverPawn).FindBestCoverSideFor(CovInfo);
    //return ReturnValue;    
}

simulated function GetEdgeCoverDirection()
{
    local /*0x97E50000-0x00000000*/ private @NULL CovInfo[8388609];
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x64
    if(CovInfo.Link.IsLeftEdgeSlot(CovInfo.SlotIdx, true))
    {
        ReplicatedCoverDirection = 1;
        return 1;        
    }
    else
    {
        // End:0xC5
        if(CovInfo.Link.IsRightEdgeSlot(CovInfo.SlotIdx, true))
        {
            ReplicatedCoverDirection = 2;
            return 2;
        }
    }
    return super(SPGFCoverPawn).GetEdgeCoverDirection(CovInfo);
    //return ReturnValue;    
}

simulated event OnMirrorTransitionBegin()
{
    Mesh.RootMotionMode = 0;
    super(SPGFCoverPawn).OnMirrorTransitionBegin();
    //return;    
}

simulated event OnMirroredNotify()
{
    Mesh.RootMotionMode = 2;
    super(SPGFCoverPawn).OnMirroredNotify();
    //return;    
}

simulated function EnableEyeLookingGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    EyeGlowFactorDesired = ((bEnable) ? TuneDataStalker.GlowEyeLooking : TuneDataStalker.GlowEyeIdle);
    //return;    
}

simulated function EnableArmsShootingGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    ArmsGlowFactorDesired = ((bEnable) ? TuneDataStalker.GlowArmsShooting : TuneDataStalker.GlowArmsIdle);
    //return;    
}

simulated function EnableArmsStruggleGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    ArmsGlowFactorDesired = ((bEnable) ? TuneDataStalker.GlowArmsStruggle : TuneDataStalker.GlowArmsIdle);
    //return;    
}

simulated function EnableSpikesStruggleGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    SpikesGlowFactorDesired = ((bEnable) ? TuneDataStalker.GlowSpikesStruggle : TuneDataStalker.GlowSpikesIdle);
    //return;    
}

final function TimeSinceCallout()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return WorldInfo.TimeSeconds - TimeStampPlayedCallOutSound;
    //return ReturnValue;    
}

final function PlayCallOutSound()
{
    TimeStampPlayedCallOutSound = WorldInfo.TimeSeconds;
    TuneDataPawnSoundEventBindings.PlayEventSoundLocally('StalkerCallOutSound', 'None', self, none, none);
    //return;    
}

final function PlayStrikeWarningSound()
{
    TuneDataPawnSoundEventBindings.PlayEventSoundLocally('StalkerStrikeWarning', 'None', self, none, none);
    //return;    
}

simulated function FlashLocationUpdated()
{
    local /*0x97E50000-0x00000000*/ private @NULL InWeapon[8388609], InFlashLocation;
    local /*0x97E50000-0x00000000*/ private bool bViaReplication[8388609];

    super(SPInventoryPawn).FlashLocationUpdated(InWeapon, InFlashLocation, bViaReplication);
    // End:0xCF
    if(int(WorldInfo.NetMode) == int(NM_Client))
    {
        LPWeaponStalker(InWeapon).ClientBulletNum++;
        // End:0xCF
        if(LPWeaponStalker(InWeapon).ClientBulletNum >= 4)
        {
            LPWeaponStalker(InWeapon).ClientBulletNum = 0;
        }
    }
    //return;    
}

defaultproperties
{
    EyeGlowFactorRampRate=1.0000000
    ArmsGlowFactorRampRate=1.0000000
    SpikesGlowFactorRampRate=1.0000000
    bShouldRagdoll=true
    bPlayImpactEffectsWhenDead=true
    // Reference: LPDamageReactionManagerStalker'Default__LPAIPawnStalker.DamageReactionManagerStalker'
    begin object name=DamageReactionManagerStalker class=Class'LPDamageReactionManagerStalker'
    end object
    DamageReactionManager=DamageReactionManagerStalker
    bCanDo360AimingInCover=false
    bCanBlindFire=false
    AdjustPositionWhenMirroringDistance=200.0000000
    AdjustPositionWhenMirroringTime=0.3000000
    // Reference: LPAimControlStalker'Default__LPAIPawnStalker.AimControl'
    begin object name=AimControl class=Class'LPAimControlStalker'
    end object
    AimController=AimControl
    InventoryAttachSlotArray=/* Array type was not detected. */
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnStalker.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnStalker.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnStalker.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: LPHeadTrackComponent'Default__LPAIPawnStalker.HeadTrackComponent0'
    begin object name=HeadTrackComponent0 class=Class'LPHeadTrackComponent'
    end object
    HeadTrackComponent=HeadTrackComponent0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnStalker.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnStalker.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnStalker.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnStalker.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnStalker.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnStalker.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnStalker.FaceAudioComponent'
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
    Components[10]=HeadTrackComponent0
    // Reference: SPDamageStateComponent'Default__LPAIPawnStalker.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    Components[11]=DamageStateComponentDefObj
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnStalker.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}