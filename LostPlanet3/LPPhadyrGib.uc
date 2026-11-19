class LPPhadyrGib extends KActorSpawnable
    hidecategories(AnimDependency);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EffectComp[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GooSystem;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LifeTimeOfGibMax;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LifeTimeOfGibMin;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScaleOfGibMax;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ScaleOfGibMin;

auto state TimeTilDestroySelf
{Begin:

    SetHidden(false);
    EffectComp = WorldInfo.MyEmitterPool.SpawnEmitter(GooSystem, Location, Rotation, self);
    EffectComp.SetScale(RandRange(ScaleOfGibMin, ScaleOfGibMax));
    EffectComp.ActivateSystem();
    Sleep(RandRange(LifeTimeOfGibMin, LifeTimeOfGibMax));
    Destroy();
    stop;            
}

defaultproperties
{
    LifeTimeOfGibMax=10.0000000
    LifeTimeOfGibMin=8.0000000
    ScaleOfGibMax=1.0000000
    ScaleOfGibMin=1.0000000
    // Reference: StaticMeshComponent'Default__LPPhadyrGib.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    StaticMeshComponent=StaticMeshComponent0
    // Reference: KynapseObstacleComponent'Default__LPPhadyrGib.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    // Reference: DynamicLightEnvironmentComponent'Default__LPPhadyrGib.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    Components[0]=MyLightEnvironment
    Components[1]=StaticMeshComponent0
    RemoteRole=ENetRole.ROLE_None
    CollisionComponent=StaticMeshComponent0
}