class LPAIPawnKingCrab extends LPAIPawnBaseSnowCrab
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataKingCrab[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL UnderBellyLight[537395201];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL MouthLight[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class BellyShellClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BellyShell[536870913];

// Export ULPAIPawnKingCrab::execGetBodyDamageFactor(FFrame&, void* const)
native simulated function GetBodyDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL grenadeGlueTag;

    super.PostBeginPlay();
    grenadeGlueTag = FindPhysMatPropTag_GrenadeGlueFromCoreID(8);
    // End:0x50
    if(grenadeGlueTag != none)
    {
        grenadeGlueTag.bCurrentlyValidForStick = false;
    }
    //return;    
}

simulated event Destroyed()
{
    super.Destroyed();
    // End:0x43
    if(UnderBellyLight != none)
    {
        UnderBellyLight.DetachFromAny();
        UnderBellyLight = none;
    }
    // End:0x7C
    if(MouthLight != none)
    {
        MouthLight.DetachFromAny();
        MouthLight = none;
    }
    //return;    
}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    TuneDataKingCrab = LPTuneDataIceCrab(TuneData);
    super.InitTuneData(TuneData);
    // End:0x295
    if(TuneDataIceCrab.UnderBellyLight != none)
    {
        UnderBellyLight = new (self) Class'LPFlashlightComponent' (TuneDataIceCrab.UnderBellyLight);
        // End:0x295
        if(UnderBellyLight != none)
        {
            Mesh.AttachComponentToSocket(UnderBellyLight, 'UnderBellyLight');
            UnderBellyLight.SetEnabled(true);
            // End:0x152
            if(UnderBellyLight.LensFlare != none)
            {
                Mesh.AttachComponentToSocket(UnderBellyLight.LensFlare, 'UnderBellyLight');
            }
            // End:0x295
            if(UnderBellyLight.LightParticleSystemTemplate != none)
            {
                // End:0x1C7
                if(UnderBellyLight.LightParticles == none)
                {
                    UnderBellyLight.LightParticles = new (self) Class'Engine.ParticleSystemComponent';
                }
                UnderBellyLight.LightParticles.SetTemplate(UnderBellyLight.LightParticleSystemTemplate);
                Mesh.AttachComponentToSocket(UnderBellyLight.LightParticles, 'UnderBellyLight');
                UnderBellyLight.LightParticles.SetActive(true);
            }
        }
    }
    // End:0x4FB
    if(TuneDataIceCrab.MouthLight != none)
    {
        MouthLight = new (self) Class'LPFlashlightComponent' (TuneDataIceCrab.MouthLight);
        // End:0x4FB
        if(MouthLight != none)
        {
            Mesh.AttachComponentToSocket(MouthLight, 'MouthCoreLight');
            MouthLight.SetEnabled(true);
            // End:0x3B8
            if(MouthLight.LensFlare != none)
            {
                Mesh.AttachComponentToSocket(MouthLight.LensFlare, 'MouthCoreLight');
            }
            // End:0x4FB
            if(MouthLight.LightParticleSystemTemplate != none)
            {
                // End:0x42D
                if(MouthLight.LightParticles == none)
                {
                    MouthLight.LightParticles = new (self) Class'Engine.ParticleSystemComponent';
                }
                MouthLight.LightParticles.SetTemplate(MouthLight.LightParticleSystemTemplate);
                Mesh.AttachComponentToSocket(MouthLight.LightParticles, 'MouthCoreLight');
                MouthLight.LightParticles.SetActive(true);
            }
        }
    }
    //return;    
}

function InitCrabShield()
{
    AttachBellyShell();
    // End:0x5D
    if(BellyShell != none)
    {
        BellyShell.SetVisibility(true);
        BellyShell.SetGlow(1.0000000);
    }
    //return;    
}

simulated function NotifyShieldAttached()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;

    super.NotifyShieldAttached(Shield, AttachSocket, ShieldId);
    // End:0x80
    if(Shield.AttachInfo.ShieldId == 'BellyShell')
    {
        BellyShell = LPCrabShell(Shield);
    }
    //return;    
}

simulated function AttachBellyShell()
{
    // End:0xC9
    if(BellyShell == none)
    {
        BellyShell = LPCrabShell(InitCoreShield(BellyShellClass, 'BellyShield', 'BellyShell'));
        // End:0xC9
        if(BellyShell != none)
        {
            SPActorDestructComponent(BellyShell.DestructComponent).HitPoints = int(TuneDataKingCrab.HitPointsBellyShell.GetValue());
        }
    }
    //return;    
}

simulated function ShieldDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609], grenadeGlueTag;

    // End:0xFD
    if((Shield == BellyShell) && Mesh.PhysicsAssetInstance != none)
    {
        Mesh.PhysicsAssetInstance.ForceBodyUnfixed('JO_R_weakSpot', Mesh.PhysicsAsset, Mesh, true);
        BellyShell = none;
        grenadeGlueTag = FindPhysMatPropTag_GrenadeGlueFromCoreID(8);
        // End:0xF3
        if(grenadeGlueTag != none)
        {
            grenadeGlueTag.bCurrentlyValidForStick = true;
        }
        SetAlwaysValidTargetForGrenadeAssist();
    }
    super.ShieldDestroyed(Shield);
    //return;    
}

simulated function DestroyShields()
{
    // End:0x32
    if(BellyShell != none)
    {
        BellyShell.Destroy();
        BellyShell = none;
    }
    super.DestroyShields();
    //return;    
}

simulated function HasAnyDismemberables()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return BellyShell != none;
    //return ReturnValue;    
}

event AnimDismemberPart()
{
    local /*0x97E50000-0x00000000*/ private @NULL NotifyDismember[8388609];

    // End:0x141
    if(NotifyDismember.CoreToDismember.GetCoreId() == 8)
    {
        // End:0x134
        if(BellyShell != none)
        {
            // End:0xBE
            if(NotifyDismember.EventName != 'None')
            {
                TuneDataPawnFXEventBindings.PlayEventFX(NotifyDismember.EventName, self, Mesh, none);
            }
            // End:0x134
            if(NotifyDismember.SoundName != 'None')
            {
                TuneDataPawnSoundEventBindings.PlayEventSoundLocally(NotifyDismember.SoundName, 'None', self, none, none);
            }
        }
        DestroyShields();        
    }
    else
    {
        super.AnimDismemberPart(NotifyDismember);
    }
    //return;    
}

simulated function StopTheReleaseToKillVs()
{
    EndSpecialMove(Class'LPSM_ForkArmGrabVictim_Release');
    //return;    
}

function StartDie()
{
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitLoc[8388609];

    // End:0x29
    if(WantsToPlayDieAnim(DamageType))
    {
        PlayDyingSpecialMove(Class'LPSM_KingCrabDie');
    }
    //return;    
}

simulated event NotifySurfaceEffect()
{
    local /*0x97E50000-0x00000000*/ private @NULL SurfaceAnimNotify[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private name LeftClawSocket, RightClawSocket;

    // End:0x190
    if(int(SurfaceAnimNotify.SurfaceAction) == int(5))
    {
        // End:0x190
        if(IsDoingSpecialMove_OF_Class(Class'LPSM_SnowCrabAttackPOFStartBase'))
        {
            LeftClawSocket = 'LeftClaw2';
            RightClawSocket = 'RightClaw2';
            // End:0x190
            if(ExplosionRadialBlur == none)
            {
                ExplosionRadialBlur = new (self) Class'Engine.RadialBlurComponent' (TuneDataIceCrab.ClawStrikeRadialBlur);
                // End:0x190
                if(ExplosionRadialBlur != none)
                {
                    Mesh.AttachComponentToSocket(ExplosionRadialBlur, ((IsClawRightBeingUsedInStrike()) ? RightClawSocket : LeftClawSocket));
                    RadialBlurFadeTime = TuneDataIceCrab.ClawStrikeRadialBlurFadeOutTime_Tunable.GetValue();
                    RadialBlurFadeTimeRemaining = RadialBlurFadeTime;
                    RadialBlurMaxBlurAmount = TuneDataIceCrab.ClawStrikeRadialBlurMaxBlur_Tunable.GetValue();
                }
            }
        }
    }
    return true;
    //return ReturnValue;    
}

simulated function PlayVsClawHitBlurEffects()
{
    local /*0x97E50000-0x00000000*/ private name SocketName[8388609];

    // End:0x113
    if(ExplosionRadialBlur == none)
    {
        ExplosionRadialBlur = new (self) Class'Engine.RadialBlurComponent' (TuneDataIceCrab.ChargeStrikeRadialBlur);
        // End:0x113
        if(ExplosionRadialBlur != none)
        {
            Mesh.AttachComponentToSocket(ExplosionRadialBlur, SocketName);
            RadialBlurFadeTime = TuneDataIceCrab.ChargeStrikeRadialBlurFadeOutTime_Tunable.GetValue();
            RadialBlurFadeTimeRemaining = RadialBlurFadeTime;
            RadialBlurMaxBlurAmount = TuneDataIceCrab.ChargeStrikeRadialBlurMaxBlur_Tunable.GetValue();
        }
    }
    //return;    
}

simulated function PlayVsClawPushBlurEffects()
{
    local /*0x97E50000-0x00000000*/ private name SocketName[8388609];

    // End:0x113
    if(ExplosionRadialBlur == none)
    {
        ExplosionRadialBlur = new (self) Class'Engine.RadialBlurComponent' (TuneDataIceCrab.ClawPushRadialBlur);
        // End:0x113
        if(ExplosionRadialBlur != none)
        {
            Mesh.AttachComponentToSocket(ExplosionRadialBlur, SocketName);
            RadialBlurFadeTime = TuneDataIceCrab.ClawPushRadialBlurFadeOutTime_Tunable.GetValue();
            RadialBlurFadeTimeRemaining = RadialBlurFadeTime;
            RadialBlurMaxBlurAmount = TuneDataIceCrab.ClawPushRadialBlurMaxBlur_Tunable.GetValue();
        }
    }
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

function DrawUnderBellyCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL startOfCore, endOfCore, forwardVec, socketLoc, SocketRot;

    FlushPersistentDebugLines();
    Mesh.GetSocketWorldLocationAndRotation('UnderBellyCore', socketLoc, SocketRot);
    forwardVec = Vector(SocketRot);
    startOfCore = socketLoc + ((forwardVec * TuneDataIceCrab.BellyCoreSize_Tunable.GetValue()) / 2.0000000);
    endOfCore = socketLoc + ((forwardVec * TuneDataIceCrab.BellyCoreSize_Tunable.GetValue()) / -2.0000000);
    DrawDebugCylinder(startOfCore, endOfCore, TuneDataIceCrab.BellyCoreRadius_Tunable.GetValue(), TuneDataIceCrab.BellyCoreSegments, TuneDataIceCrab.BellyCoreColor.R, TuneDataIceCrab.BellyCoreColor.G, TuneDataIceCrab.BellyCoreColor.B, true);
    //return;    
}

function NotifyUberStrikeKillTheVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL kingCrabCtrl;

    kingCrabCtrl = LPAIControllerKingCrab(Controller);
    // End:0x4A
    if(kingCrabCtrl != none)
    {
        kingCrabCtrl.NotifyUberStrikeKillTheVS();
    }
    //return;    
}

simulated function HandleInternalGrenadeCoreExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrenExploding[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreAttachedTo[8388609];

    TuneDataPawnFXEventBindings.PlayEventFX('KingCrabBellyGreandeBlowout', self, Mesh, none);
    //return;    
}

simulated function SetStunnedGrabPointsEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

    SetGrabPointEnabledByIndex(1, bEnabled);
    SetGrabPointEnabledByIndex(0, bEnabled);
    //return;    
}

defaultproperties
{
    ChanceOfPlayingAggressiveClawStrike=1.0000000
    HealthRegenInfo=(bHealthRegenEnabled=true)
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnKingCrab.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnKingCrab.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnKingCrab.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnKingCrab.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnKingCrab.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnKingCrab.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnKingCrab.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnKingCrab.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnKingCrab.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnKingCrab.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPAIPawnKingCrab.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[10]=DamageStateComponentDefObj
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnKingCrab.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}