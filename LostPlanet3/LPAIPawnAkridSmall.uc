class LPAIPawnAkridSmall extends LPAIPawnAkrid
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

struct native KnockDownMeleeParams
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bActive;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ImpulseLocation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ImpulseSize;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int ReplicateMe;

    structdefaultproperties
    {
        bActive=false
        ImpulseLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ImpulseSize=0.0000000
        ReplicateMe=0
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataAkridSmall[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAnimTree;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel KnockDownMeleeParams KnockDownMeleeInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RecoverFromKnockDownTime;

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x44
    if(VarName == 'KnockDownMeleeInfo')
    {
        // End:0x41
        if(KnockDownMeleeInfo.bActive)
        {
            DoMeleeKnockDown();
        }        
    }
    else
    {
        super(LPPawn).ReplicatedEvent(VarName);
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataAkridSmall = LPTuneDataAkridSmall(TuneData);
    super.InitTuneData(TuneData);
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

function GetMeleeHitReactionImpulse()
{
    local /*0x97E50000-0x00000000*/ private @NULL ImpulseLocation[25165825];
    local /*0x97E50000-0x00000000*/ private float ImpulseSize[25165825];
    local /*0x97E50000-0x00000000*/ private @NULL HitDirection, CombinedImpulse, ImpulseDirection;
    local /*0x97E50000-0x00000000*/ private float MeleeHitHorizantalImpulse, MeleeHitUpwardImpulse;

    MeleeHitHorizantalImpulse = TuneDataAkridSmall.HitHorizontalImpulse;
    MeleeHitUpwardImpulse = TuneDataAkridSmall.HitUpwardImpulse;
    HitDirection = Vector(TakeDamageParams.DamageCauser.Rotation);
    HitDirection.Z = 0.0000000;
    HitDirection = Normal(HitDirection);
    CombinedImpulse = HitDirection * MeleeHitHorizantalImpulse;
    CombinedImpulse.Z = MeleeHitUpwardImpulse;
    ImpulseDirection = Normal(CombinedImpulse);
    ImpulseLocation = -ImpulseDirection * TuneDataAkridSmall.HitImpulseLocationOffset;
    ImpulseLocation += TakeDamageParams.DamageCauser.Location;
    ImpulseSize = VSize(CombinedImpulse) * TuneDataAkridSmall.HitImpulseSizeFactor;
    //return;    
}

reliable server function ServerKnockDownMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation, ImpulseLocation;
    local /*0x97E50000-0x00000000*/ private float ImpulseSize;

    TakeDamage(1, PlayerPawn.Controller, ImpactLocation, Vector(Rotation) * float(400), Class'LPDamageTypeMelee');
    GetMeleeHitReactionImpulse(ImpulseLocation, ImpulseSize);
    KnockDownMeleeInfo.bActive = true;
    KnockDownMeleeInfo.ImpulseLocation = ImpulseLocation;
    KnockDownMeleeInfo.ImpulseSize = ImpulseSize;
    KnockDownMeleeInfo.ReplicateMe++;
    DoMeleeKnockDown();
    //return;    
}

simulated function DoMeleeKnockDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyController;

    MyController = SPBaseAIController(Controller);
    // End:0x4B
    if(MyController != none)
    {
        MyController.ForceDisableAI();
    }
    DoRagdoll();
    ZeroMovementVariables();
    Mesh.AddRadialImpulse(KnockDownMeleeInfo.ImpulseLocation, 5000.0000000, KnockDownMeleeInfo.ImpulseSize, 1, true);
    RecoverFromKnockDownTime = TuneDataAkridSmall.RecoverFromRagdollTime;
    GotoState('KnockedDown');
    //return;    
}

function GetRecoverFromRagdollSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

reliable server function RecoverFromKnockDown()
{
    local /*0x97E50000-0x00000000*/ private class RecoverFromRagdollSM;

    RecoverFromRagdollSM = GetRecoverFromRagdollSM();
    // End:0x80
    if((int(Physics) == int(10)) && RecoverFromRagdollSM != none)
    {
        // End:0x68
        if(int(Role) == int(ROLE_Authority))
        {
            ServerDoSpecialMove(GetRecoverFromRagdollSM(), true, true);            
        }
        else
        {
            LocalDoSpecialMove(GetRecoverFromRagdollSM(), true, true);
        }
    }
    //return;    
}

state KnockedDown
{
    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        KnockDownMeleeInfo.bActive = false;
        //return;        
    }
Begin:

    Sleep(RecoverFromKnockDownTime);
    // End:0x4F
    if(!SPKynapseBotHandle(myKynapseHandle).PathFinder_IsLocationInNavMesh(Location))
    {
        Suicide();        
    }
    else
    {
        RecoverFromKnockDown();
        GotoState('None');
    }
    stop;                    
}

defaultproperties
{
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnAkridSmall.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnAkridSmall.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnAkridSmall.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnAkridSmall.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnAkridSmall.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnAkridSmall.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnAkridSmall.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnAkridSmall.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnAkridSmall.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnAkridSmall.FaceAudioComponent'
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
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnAkridSmall.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}