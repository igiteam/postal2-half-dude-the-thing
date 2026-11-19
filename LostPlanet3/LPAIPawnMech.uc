class LPAIPawnMech extends LPAIPawn
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0xCECA0000-0x00000000*/ private @NULL TuneDataMech[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MechLogicAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsPossessedByPlayer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DamageReactionManagerMech;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL UpperBodyBlendPerBone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastDriver;

// Export ULPAIPawnMech::execUseContextSensitiveAnimObject(FFrame&, void* const)
native simulated function UseContextSensitiveAnimObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL CSA[8388609];
    local /*0x97E50000-0x00000000*/ private float BlendTime[8388609];


}

// Export ULPAIPawnMech::execCanAim(FFrame&, void* const)
native simulated function CanAim()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnMech::execTakeDamage_SetParams(FFrame&, void* const)
native simulated function TakeDamage_SetParams()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609], InHitLocation, InMomentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], InstigatedByPawn, DamageCauser;
    local /*0x97E50000-0x00000000*/ private bool bShouldPlayHitReactAnim[9437185], bShouldPlayHitEffects;

    true
    true                                                
}

// Export ULPAIPawnMech::execCanBreakFracturedStaticMeshActor(FFrame&, void* const)
native function CanBreakFracturedStaticMeshActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InFracturedStaticMeshActor[8519681];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAIPawnMech::execMechDebugHelper(FFrame&, void* const)
native simulated function MechDebugHelper();

// Export ULPAIPawnMech::execGetPawnViewLocation(FFrame&, void* const)
native simulated function GetPawnViewLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];


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

    TuneDataMech = LPTuneDataMech(TuneData);
    super.InitTuneData(TuneData);
    RBPushStrength = TuneDataMech.PhysicsPushStrength;
    //return;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(LPPawn).Tick(DeltaTime);
    //return;    
}

simulated event HeadBoneName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'JO_PlayerCamera';
    //return ReturnValue;    
}

simulated function InitAnimTemplates()
{
    super(LPPawn).InitAnimTemplates();
    //return;    
}

simulated function @NULL PerformPostInitAnimTreeActions()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super(LPPawn).PerformPostInitAnimTreeActions(SkelComp);
    UpperBodyBlendPerBone = LPAnimNodeBlendPerBone(SkelComp.FindAnimNode('UpperBodyBlendPerBone'));
    UpperBodyBlendPerBone.SetBlendTarget(1.0000000, 0.0000000);
    //return;    
}

simulated function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMove[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], DesiredTree;

    DesiredTree = super(SPPawn).GetAnimTemplateTreeForSpecialMove(SpecialMove);
    // End:0x36
    if(DesiredTree == none)
    {
        return MechLogicAnimTree;
    }
    return DesiredTree;
    //return ReturnValue;    
}

simulated function GetAnimTemplateTreeForFXAction()
{
    local /*0x97E50000-0x00000000*/ private class FXAction[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MechLogicAnimTree;
    //return ReturnValue;    
}

reliable server function ServerDoTraceDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185];

    HitActor.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, self);
    //return;    
}

function PossessedBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL C[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.PossessedBy(C, bVehicleTransition);
    // End:0x68
    if(C.IsA('AIController'))
    {
        bIsPossessedByPlayer = true;
        LastDriver = LPAIController(C);
    }
    //return;    
}

function UnPossessed()
{
    super.UnPossessed();
    bIsPossessedByPlayer = false;
    //return;    
}

function LineSweepHitTesterHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    super.LineSweepHitTesterHitSomethingNew(Info);
    //return;    
}

simulated event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    RanIntoActor(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

simulated event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    super.Bump(Other, OtherComp, HitNormal);
    RanIntoActor(Other, OtherComp, vect(0.0000000, 0.0000000, 0.0000000), HitNormal);
    HandleBump(Other, OtherComp, HitNormal);
    //return;    
}

exec function HitRxn()
{
    PlayHitReactionAnimation();
    //return;    
}

simulated function PlayTakeDamageEffects()
{
    super(LPPawn).PlayTakeDamageEffects();
    //return;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag;

    // End:0xDC
    if(DamageReactionManagerMech != none)
    {
        CoreTag = DamageReactionManagerMech.hitCoreTag;
        // End:0xDC
        if((CoreTag != none) && (IsCoreProtectedByShield(CoreTag.GetCoreId())) || IsDamageFilteredForCore(CoreTag.GetCoreId(), TakeDamageParams.DamageType, TakeDamageParams.DamageCauser))
        {
            return false;
        }
    }
    return super.AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

simulated function GetTakeDamageAmount()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x2F
    if(DamageReactionManagerMech != none)
    {
        return DamageReactionManagerMech.GetTakeDamageAmount();
    }
    return super(SPPawn).GetTakeDamageAmount();
    //return ReturnValue;    
}

simulated function GetDOTEffectSocketName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    // End:0x2F
    if(DamageReactionManagerMech != none)
    {
        return DamageReactionManagerMech.GetDOTEffectSocketName();
    }
    return super(SPPawn).GetDOTEffectSocketName();
    //return ReturnValue;    
}

function ForceShutdownAndPlayerEjection()
{
    //return;    
}

simulated function ForceRetractWinch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winch;

    Winch = LPWeaponVSWinch(FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x65
    if(Winch != none)
    {
        // End:0x65
        if(!IsDoingSpecialMove(Class'LPSM_PlayerVSWinchFireRetract'))
        {
            DoSpecialMove(Class'LPSM_PlayerVSWinchFireRetract', true);
        }
    }
    GotoState('None');
    //return;    
}

simulated function DoIExplodeFracturedMeshOfThisType()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPShieldFracture(FracAct) != none)
    {
        return false;
    }
    return CanBreakFracturedStaticMeshActor(FracAct);
    //return ReturnValue;    
}

simulated function DoIBreakFracturedMeshOfThisType()
{
    local /*0x97E50000-0x00000000*/ private @NULL FracAct[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPShieldFracture(FracAct) != none)
    {
        return false;
    }
    return false;
    //return ReturnValue;    
}

event @NULL RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherActor[8388609], OtherComp, HitLocation, HitNormal;

    BreakFractureMeshIfPossible(OtherActor);
    //return;    
}

function BreakFractureMeshIfPossible()
{
    local /*0x97E50000-0x00000000*/ private @NULL OtherActor[8388609], FracAct;

    FracAct = SPFracturedStaticMeshActor(OtherActor);
    // End:0xA1
    if((FracAct != none) && DoIExplodeFracturedMeshOfThisType(FracAct))
    {
        FracAct.ExplodeInSeconds(0.1000000, VSize(Velocity), vect(0.0000000, 0.0000000, 0.0000000), true, FracAct.Location);        
    }
    else
    {
        // End:0x121
        if((FracAct != none) && DoIBreakFracturedMeshOfThisType(FracAct))
        {
            FracAct.BreakOffPartsInRadius(Location, CylinderComponent.CollisionRadius * 3.0000000, VSize(Velocity), true);
        }
    }
    //return;    
}

event ShouldPhysicsPush()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bValid;

    bValid = super(SPPawn).ShouldPhysicsPush(inActor);
    bValid = bValid && inActor != none;
    bValid = bValid && LPProj_Grenade(inActor) == none;
    bValid = bValid && int(inActor.Physics) != int(6);
    return bValid;
    //return ReturnValue;    
}

function GetMechDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], D;

    // End:0x1D
    if(Health == HealthMax)
    {
        return 0.0000000;
    }
    D = 1.0000000 - Square(float(Health) / float(HealthMax));
    return FMin(1.0000000, D * 1.1000000);
    //return ReturnValue;    
}

function @NULL HandleBump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal, Destructible;

    Destructible = SPGFDestructibleObject(Other);
    // End:0xC9
    if(Destructible != none)
    {
        // End:0xC9
        if(Destructible.IsInInstaKillList(GetDamageTypeDoneToRanIntoActor(Other)))
        {
            Destructible.TakeDamage(1, Controller, Destructible.Location, vect(0.0000000, 0.0000000, 0.0000000), GetDamageTypeDoneToRanIntoActor(Destructible));
        }
    }
    //return;    
}

function GetDamageTypeDoneToRanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPPlayerController(Controller);
    // End:0x59
    if((LPPC != none) && LPPC.IsDoingVSDash())
    {
        return Class'LPDamageTypeVSDash';
    }
    return Class'LPDamageTypeVSBump';
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnMech.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    bAllowOwnerMeleeStrikeNotifies=true
    bCanCauseFractureOnTouch=true
    bIsPlayer=true
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnMech.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnMech.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnMech.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnMech.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnMech.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    bPushesRigidBodies=true
    bDontPossess=true
    ControllerClass=none
    // Reference: SkeletalMeshComponent'Default__LPAIPawnMech.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnMech.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    RBPushStrength=5000.0000000
    // Reference: AudioComponent'Default__LPAIPawnMech.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPAIPawnMech.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj class=Class'SPEngine.SPDamageStateComponent'
    end object
    Components[9]=DamageStateComponentDefObj
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnMech.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}