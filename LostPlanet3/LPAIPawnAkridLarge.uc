class LPAIPawnAkridLarge extends LPAIPawnAkrid
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

struct native ReplicatedMemberStatus
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeDismembered;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPartDismembered;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCoreDestroyed;

    structdefaultproperties
    {
        TimeDismembered=0.0000000
        bPartDismembered=false
        bCoreDestroyed=false
    }
};

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL RoarAudioComponent[537395201];

simulated event PostBeginPlay()
{
    super(LPAIPawn).PostBeginPlay();
    // End:0x3D
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        CheckOnAppearChatterForLocalPlayer();
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    TurnOffRoarAudioComponent();
    //return;    
}

simulated function HandleReplicatedMemberStatus()
{
    local /*0x97E50000-0x00000000*/ private int CoreType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Status[25296897], CoreID;
    local /*0x97E50000-0x00000000*/ private int CoreIndex;

    CoreID = FindPhysMatPropTag_CoreIdFromCoreID(CoreType);
    CoreIndex = GetCoreIndexFromTag(CoreID);
    // End:0xB9
    if(Status.bCoreDestroyed)
    {
        CoreDestroyed(CoreID, CoreIndex, (Status.TimeDismembered + 5.0000000) < WorldInfo.TimeSeconds);
    }
    // End:0x156
    if(Status.bPartDismembered)
    {
        DismemberPart(MyCoreData[CoreIndex].DismembermentInfo.BoneName);
        BlendMaxCoreDamageFactorByCoreIndex(CoreIndex, 1.0000000, TuneDataAIPawn.CoreFadeTime);
    }
    //return;    
}

simulated function BroadcastOnAppearChatter()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChatterPlayer[8388609];

    ChatterPlayer.BroadcastChatter(11);
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    super(LPAIPawn).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    // End:0x87
    if(ClassIsChildOf(DamageType, Class'LPDamageTypeVSDrill') || ClassIsChildOf(DamageType, Class'LPDamageTypeVSWelder'))
    {
        OnVSDrillOrTorchDamage();
    }
    //return;    
}

function OnVSDrillOrTorchDamage()
{
    // End:0x2C
    if(!IsTimerActive('StopDrillOrTorchDamageSoundEffect'))
    {
        TurnOnRoarAudioComponent('DrillOrTorchPainLoop');
    }
    SetTimer(0.5000000, false, 'StopDrillOrTorchDamageSoundEffect');
    //return;    
}

function StopDrillOrTorchDamageSoundEffect()
{
    TurnOffRoarAudioComponent();
    TuneDataPawnSoundEventBindings.PlayEventSound('DrillOrTorchPainLoopEnd', self, Mesh, none);
    //return;    
}

simulated function TurnOffRoarAudioComponent()
{
    // End:0x67
    if(RoarAudioComponent != none)
    {
        // End:0x1E
        if(MyLpAiController != none)
        {
        }
        RoarAudioComponent.Stop();
        RoarAudioComponent.DetachFromAny();
        RoarAudioComponent = none;
    }
    //return;    
}

simulated function TurnOnRoarAudioComponent()
{
    local /*0x97E50000-0x00000000*/ private name RoarToStart[8388609];

    // End:0x0F
    if(MyLpAiController != none)
    {
    }
    // End:0x37
    if(RoarAudioComponent != none)
    {
        // End:0x2D
        if(MyLpAiController != none)
        {
        }
        TurnOffRoarAudioComponent();
    }
    // End:0xB9
    if(RoarAudioComponent == none)
    {
        RoarAudioComponent = TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx(RoarToStart, 'None', self, none, none);
        // End:0xA7
        if(RoarAudioComponent != none)
        {
            // End:0xA4
            if(Controller != none)
            {
            }            
        }
        else
        {
            // End:0xB6
            if(Controller != none)
            {
            }
        }        
    }
    else
    {
        // End:0xC8
        if(MyLpAiController != none)
        {
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnAkridLarge.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnAkridLarge.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnAkridLarge.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    SpecialMoves=/* Array type was not detected. */
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnAkridLarge.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnAkridLarge.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnAkridLarge.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnAkridLarge.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnAkridLarge.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnAkridLarge.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnAkridLarge.FaceAudioComponent'
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
    bCanBeFrictionedTo=false
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnAkridLarge.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}