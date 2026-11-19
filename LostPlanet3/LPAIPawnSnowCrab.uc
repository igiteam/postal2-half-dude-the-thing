class LPAIPawnSnowCrab extends LPAIPawnBaseSnowCrab
    abstract
    config(Pawn)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private class OuterShieldCoverClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OuterShieldCover[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShouldSpawnOuterShieldCover;

// Export ULPAIPawnSnowCrab::execGetBodyDamageFactor(FFrame&, void* const)
native simulated function GetBodyDamageFactor()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];


}

simulated event InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    super.InitTuneData(TuneData);
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    //return;    
}

simulated function ShieldDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL Shield[8388609];

    // End:0x107
    if((Shield == BackInnerShell) && Mesh.PhysicsAssetInstance != none)
    {
        Mesh.PhysicsAssetInstance.ForceBodyUnfixed('JO_R_weakSpot', Mesh.PhysicsAsset, Mesh, true);
        Mesh.PhysicsAssetInstance.ForceBodyUnfixed('JO_L_weakSpot', Mesh.PhysicsAsset, Mesh, true);
    }
    super.ShieldDestroyed(Shield);
    //return;    
}

function InitCrabShield()
{
    super.InitCrabShield();
    // End:0x50
    if(!bShouldSpawnOuterShieldCover && int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        bShouldSpawnOuterShieldCover = true;
    }
    AttachOuterShieldCover();
    //return;    
}

simulated function NotifyShieldFractureAttached()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShieldFracture[8388609];
    local /*0x97E50000-0x00000000*/ private name AttachSocket[8388609], ShieldId;

    super(LPAIPawn).NotifyShieldFractureAttached(ShieldFracture, AttachSocket, ShieldId);
    // End:0x77
    if(ShieldFracture.AttachInfo.ShieldId == 'OuterShieldCover')
    {
        OuterShieldCover = ShieldFracture;
    }
    //return;    
}

function DoTraceDamageOnShieldFracture()
{
    local /*0x97E50000-0x00000000*/ private @NULL DI[8388609];

    // End:0x63
    if((DI.ShieldId == 'OuterShieldCover') && OuterShieldCover != none)
    {
        OuterShieldCover.ApplyDamageInfo(DI);
    }
    //return;    
}

simulated function AttachOuterShieldCover()
{
    // End:0x5E
    if((bShouldSpawnOuterShieldCover && OuterShieldCover == none) && OuterShieldCoverClass != none)
    {
        OuterShieldCover = InitShieldFracture(OuterShieldCoverClass, 'JO_iceShell', 'OuterShieldCover');
    }
    //return;    
}

simulated function PostShieldFractureTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL ShieldFracture[8388609];

    // End:0x2B
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x2B
        if(ShieldFracture == OuterShieldCover)
        {
        }
    }
    //return;    
}

simulated function ExplodeCap()
{
    super.ExplodeCap();
    // End:0x54
    if(OuterShieldCover != none)
    {
        OuterShieldCover.SetBase(none);
        OuterShieldCover.Explode();
    }
    //return;    
}

simulated function DestroyCap()
{
    super.DestroyCap();
    // End:0x5C
    if(OuterShieldCover != none)
    {
        OuterShieldCover.SetVisibility(false);
        OuterShieldCover.Destroy();
        OuterShieldCover = none;
    }
    //return;    
}

function DoKismetAttachment()
{
    local /*0x97E50000-0x00000000*/ private @NULL Attachment[8388609], Action, Cap;

    Cap = LPCrabShellCap(Attachment);
    // End:0x58
    if((Cap == none) || !bShouldSpawnOuterShieldCover)
    {
        super.DoKismetAttachment(Attachment, Action);
    }
    //return;    
}

simulated function SetStunnedGrabPointsEnabled()
{
    local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];

    // End:0x62
    if(bEnabled)
    {
        // End:0x2A
        if(IsClawLeftDismembered())
        {
            SetGrabPointEnabledByIndex(3, true);            
        }
        else
        {
            SetGrabPointEnabledByIndex(1, true);
        }
        // End:0x53
        if(IsClawRightDismembered())
        {
            SetGrabPointEnabledByIndex(2, true);            
        }
        else
        {
            SetGrabPointEnabledByIndex(0, true);
        }        
    }
    else
    {
        SetGrabPointEnabledByIndex(0, false);
        SetGrabPointEnabledByIndex(1, false);
        SetGrabPointEnabledByIndex(2, false);
        SetGrabPointEnabledByIndex(3, false);
    }
    //return;    
}

defaultproperties
{
    // Reference: SPSocketLineSweepHitTestComponent'Default__LPAIPawnSnowCrab.SPSocketLineSweepHitTestComponent0'
    begin object name=SPSocketLineSweepHitTestComponent0
    end object
    LineSweepHitTester=SPSocketLineSweepHitTestComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPAIPawnSnowCrab.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: LPFXActionManager'Default__LPAIPawnSnowCrab.FXActionManagerDefObj0'
    begin object name=FXActionManagerDefObj0
    end object
    FXActionManagerInstance=FXActionManagerDefObj0
    // Reference: SPMovementTransitionComponentAI'Default__LPAIPawnSnowCrab.SMTC'
    begin object name=SMTC
    end object
    TransitionComponent=SMTC
    // Reference: SPDamageOverTimeComponent'Default__LPAIPawnSnowCrab.SPDamageOverTimeComponentObj'
    begin object name=SPDamageOverTimeComponentObj
    end object
    DOTComponent=SPDamageOverTimeComponentObj
    // Reference: SPSeekFreePackageLoader'Default__LPAIPawnSnowCrab.SFLoaderDefObj'
    begin object name=SFLoaderDefObj
    end object
    SeekFreeLoader=SFLoaderDefObj
    // Reference: KynapseBodyHandle'Default__LPAIPawnSnowCrab.myKynapseBodyHandle'
    begin object name=myKynapseBodyHandle
    end object
    myKynapseHandle=myKynapseBodyHandle
    // Reference: SkeletalMeshComponent'Default__LPAIPawnSnowCrab.SPPawnMesh'
    begin object name=SPPawnMesh
    end object
    Mesh=SPPawnMesh
    // Reference: CylinderComponent'Default__LPAIPawnSnowCrab.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: AudioComponent'Default__LPAIPawnSnowCrab.FaceAudioComponent'
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
    // Reference: SPDamageStateComponent'Default__LPAIPawnSnowCrab.DamageStateComponentDefObj'
    begin object name=DamageStateComponentDefObj
    end object
    Components[10]=DamageStateComponentDefObj
    // Reference: LPActorInteractionMetaData'Default__LPAIPawnSnowCrab.IMetaData'
    begin object name=IMetaData
    end object
    InteractionMetaData=IMetaData
    CollisionComponent=CollisionCylinder
}