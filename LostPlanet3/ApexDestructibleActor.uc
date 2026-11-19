class ApexDestructibleActor extends Actor
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x03350000-0x00000400*/ private export @NULL LightEnvironment[589825];
var(*) /*0x03350000-0x00000000*/ private bool bFractureMaterialOverride[65537];
var(*) /*0x03350000-0x00000000*/ private editfixedsize array FractureMaterials[4390913];
var(*) /*0x03350000-0x00000400*/ private const export @NULL StaticDestructibleComponent[720897];
var(*) /*0x03350000-0x00000000*/ private int LOD[196609];
var(*) /*0x35EA0000-0x00000010*/ private editfixedsize array VisibilityFactors;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FractureSounds[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FractureParticleEffects[536870913];

event @NULL SpawnFractureEmitter()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EmitterTemplate[8388609], SpawnLocation, SpawnDirection, PSC, Lights;

    PSC = WorldInfo.MyEmitterPool.SpawnEmitter(EmitterTemplate, SpawnLocation, Rotator(SpawnDirection));
    Lights = PSC.LightingChannels;
    Lights.Dynamic = true;
    Lights.bInitialized = true;
    PSC.SetLightingChannels(Lights);
    //return;    
}

// Export UApexDestructibleActor::execCacheFractureEffects(FFrame&, void* const)
native function CacheFractureEffects();

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    CacheFractureEffects();
    //return;    
}

// Export UApexDestructibleActor::execTakeDamage(FFrame&, void* const)
native simulated function TakeDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;


}

// Export UApexDestructibleActor::execTakeRadiusDamage(FFrame&, void* const)
native simulated function TakeRadiusDamage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private float Momentum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HurtOrigin[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFullDamage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x35EA0000-0x00000000*/ private float DamageFalloffExponent[9437185];

    1.0000000                                            
}

function OnSetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    StaticDestructibleComponent.SetMaterial(Action.MaterialIndex, Action.NewMaterial);
    //return;    
}

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__ApexDestructibleActor.LightEnvironment0'
    begin object name=LightEnvironment0 class=Class'DynamicLightEnvironmentComponent'
    end object
    LightEnvironment=LightEnvironment0
    // Reference: ApexStaticDestructibleComponent'Default__ApexDestructibleActor.DestructibleComponent0'
    begin object name=DestructibleComponent0 class=Class'ApexStaticDestructibleComponent'
    end object
    StaticDestructibleComponent=DestructibleComponent0
    LOD=-1
    Components[0]=LightEnvironment0
    Components[1]=DestructibleComponent0
    bNoDelete=true
    bRouteBeginPlayEvenIfStatic=false
    bGameRelevant=true
    bMovable=false
    bCanBeDamaged=true
    bCollideActors=true
    bBlockActors=true
    bProjTarget=true
    bNoEncroachCheck=true
    bEdShouldSnap=true
    CollisionComponent=DestructibleComponent0
}