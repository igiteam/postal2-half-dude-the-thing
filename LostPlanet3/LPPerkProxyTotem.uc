class LPPerkProxyTotem extends LPSkeletalMeshActor
    abstract
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DeploymentInstigator;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InstigatorPerk;

simulated function PostBeginPlay()
{
    // End:0x27
    if(int(Role) == int(ROLE_Authority))
    {
        SetTimer(5.0000000, false, 'TimerExpired');
    }
    super(SPSkeletalMeshActor).PostBeginPlay();
    //return;    
}

function TimerExpired()
{
    SetPhysics(0);
    SetHidden(true);
    SetCollision(false, false);
    Destroy();
    //return;    
}

defaultproperties
{
    // Reference: SPHeadTrackComponent'Default__LPPerkProxyTotem.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__LPPerkProxyTotem.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPPerkProxyTotem.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPPerkProxyTotem.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    Physics=EPhysics.PHYS_Falling
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionType=ECollisionType.COLLIDE_TouchAllButWeapons
    bNoDelete=false
    bAlwaysRelevant=true
    bReplicateInstigator=true
    bKillDuringLevelTransition=true
    bCollideWorld=true
    CollisionComponent=SkeletalMeshComponent0
}