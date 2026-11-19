class LPAIPawnLeech extends LPAIPawnAkridSmall
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataLeech[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InvertedMovementAnimations;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInverted[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsWhite[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsBossLeech;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeForJumpBiteAnimation[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeForSchnallStrikeAnimation[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeForFlippingTailWhipAnimation[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeForInvertedJumpingBiteStrikeAnimation[1073741825];

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataLeech = LPTuneDataLeech(TuneData);
    super.InitTuneData(TuneData);
    //return;    
}

function GetRecoverFromRagdollSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_LeechRecoverFromRagdoll';
    //return ReturnValue;    
}

simulated function InitAnimTemplates()
{
    super(LPPawn).InitAnimTemplates();
    //return;    
}

simulated function IsInverted()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bInverted;
    //return ReturnValue;    
}

simulated function SetInverted()
{
    bInverted = true;
    SetMaxSpeedScale(TuneDataLeech.InvertedMaxSpeedScale);
    //return;    
}

simulated function SetNotInverted()
{
    bInverted = false;
    SetMaxSpeedScale(TuneDataLeech.GetNormalMaxSpeedScale(self));
    //return;    
}

simulated function CanTakeNonCoreDamage()
{
    local /*0x97E50000-0x00000000*/ private class inDamageType[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function AllowedToProcessTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAIPawn).AllowedToProcessTakeDamage();
    //return ReturnValue;    
}

simulated function GetCoreGlowFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

function EnableAnnounceGlow()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    //return;    
}

function PlayWithdrawingScaredSound()
{
    //return;    
}

simulated function IsValidMeleeTargetNonCombatWindow()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609], BossPawn;

    // End:0xD4
    if(bIsBossLeech)
    {
        // End:0x47
        foreach WorldInfo.AllPawns(Class'LPAIPawnAct1Boss', BossPawn)
        {
            // End:0x47
            break;            
        }        
        // End:0xD4
        if(BossPawn != none)
        {
            BossPawn.TriggerEventClass(Class'LPSeqEvent_Act1BossLeechDestroyed', self, 0);
            // End:0xD4
            if(Class'LPAIControllerAct1Boss'.static.GetLeechCount() <= 0)
            {
                BossPawn.TriggerEventClass(Class'LPSeqEvent_Act1BossLeechDestroyed', self, 1);
            }
        }
    }
    // End:0xF9
    if(!bShouldRagdoll)
    {
        PlayDyingSpecialMove(Class'LPSM_LeechDie');        
    }
    else
    {
        // End:0x148
        if(!ClassIsChildOf(DamageType, Class'Engine.DmgType_Crushed'))
        {
            TuneDataPawnSoundEventBindings.PlayEventSoundLocally('NormalDeath', 'None', self, none, none);
        }
        super(LPAIPawn).StartDie(DamageType, HitLoc);
    }
    //return;    
}

defaultproperties
{
    MaxTimeForJumpBiteAnimation=8.0000000
    MaxTimeForSchnallStrikeAnimation=8.0000000
    MaxTimeForFlippingTailWhipAnimation=8.0000000
    MaxTimeForInvertedJumpingBiteStrikeAnimation=8.0000000
    bUsesAkridProceduralMovementSounds=true
    bShouldRagdoll=true
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnLeech.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnLeech.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnLeech.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnLeech.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnLeech.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnLeech.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnLeech.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnLeech.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnLeech.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnLeech.FaceAudioComponent'
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
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnLeech.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}