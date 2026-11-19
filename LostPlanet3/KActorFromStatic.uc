class KActorFromStatic extends KActor
    transient
    notplaceable
    hidecategories(AnimDependency);

var(*) /*0x35EA0000-0x00000000*/ private @NULL MyStaticMeshActor;
var(*) /*0x35EA0000-0x00000000*/ private float MaxImpulseSpeed;

// Export UKActorFromStatic::execDisablePrecomputedLighting(FFrame&, void* const)
native final function DisablePrecomputedLighting();

event OnSleepRBPhysics()
{
    BecomeStatic();
    //return;    
}

event OnWakeRBPhysics()
{
    ClearTimer('BecomeStatic');
    //return;    
}

function BecomeStatic()
{
    // End:0x6E
    if(!WorldInfo.bDropDetail && (WorldInfo.TimeSeconds - LastRenderTime) < 0.1500000)
    {
        SetTimer(1.0000000, false, 'BecomeStatic');
        return;
    }
    // End:0x93
    if(StaticMeshComponent.RigidBodyIsAwake())
    {
        return;
    }
    MakeStatic();
    Destroy();
    //return;    
}

// Export UKActorFromStatic::execMakeStatic(FFrame&, void* const)
native static function MakeStatic();

// Export UKActorFromStatic::execMakeDynamic(FFrame&, void* const)
native static function @NULL MakeDynamic()
{
    local /*0x35EA0000-0x00000400*/ private @NULL MovableMesh[8388609], ReturnValue;


}

event ApplyImpulse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ImpulseDir[8388609];
    local /*0x35EA0000-0x00000000*/ private float ImpulseMag[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitLocation[8388609], HitInfo;
    local /*0x35EA0000-0x00000000*/ private class DamageType[9437185];
    local /*0x35EA0000-0x00000000*/ private float BodyMass;

    BodyMass = StaticMeshComponent.BodyInstance.GetBodyMass();
    // End:0xDB
    if((BodyMass > 0.0000000) && (DamageType == none) || !DamageType.default.bRadialDamageVelChange)
    {
        // End:0xB2
        if(BodyMass < 1.0000000)
        {
            BodyMass = Sqrt(BodyMass);
        }
        ImpulseMag = FMin(ImpulseMag / BodyMass, MaxImpulseSpeed);
    }
    CollisionComponent.AddImpulse(Normal(ImpulseDir) * ImpulseMag, HitLocation,, true);
    //return;    
}

function ReceiveImpulse()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], HitLocation, HitNormal, HitDir;
    local /*0x35EA0000-0x00000000*/ private float ImpulseMag;

    HitDir = Location - HitLocation;
    HitDir.Z = FMax(HitDir.Z, 0.0000000);
    HitDir = Normal(HitDir);
    ImpulseMag = FMax(0.5000000 * Other.GroundSpeed, (Other.Velocity - Velocity) Dot HitDir);
    ApplyImpulse(HitDir, ImpulseMag, Location);
    //return;    
}

event @NULL Bump()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    ReceiveImpulse(Pawn(Other), Other.Location, HitNormal);
    //return;    
}

event @NULL Touch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x46
    if(Pawn(Other) != none)
    {
        ReceiveImpulse(Pawn(Other), HitLocation, HitNormal);
    }
    //return;    
}

simulated function TakeRadiusDamage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private float Momentum[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HurtOrigin[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFullDamage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x35EA0000-0x00000000*/ private float DamageFalloffExponent[9437185];
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL DmgEvt;

    1.0000000
    Idx = 0;
    J0x14:

    // End:0xAC [Loop If]
    if(Idx < GeneratedEvents.Length)
    {
        DmgEvt = SeqEvent_TakeDamage(GeneratedEvents[Idx]);
        // End:0x9E
        if(DmgEvt != none)
        {
            DmgEvt.HandleDamage(self, InstigatedBy, DamageType, int(BaseDamage));
        }
        Idx++;
        // [Loop Continue]
        goto J0x14;
    }
    // End:0x146
    if((bDamageAppliesImpulse && DamageType.default.RadialDamageImpulse > float(0)) && int(Role) == int(ROLE_Authority))
    {
        ApplyImpulse(Location - HurtOrigin, DamageType.default.RadialDamageImpulse, Location,, DamageType);
    }
    //return;    
}

auto state Initializing
{
    event Tick()
    {
        local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];

        DisablePrecomputedLighting();
        GotoState('None');
        //return;        
    }
    stop;    
}

defaultproperties
{
    MaxImpulseSpeed=900.0000000
    StaticMeshComponent=none
    // Reference: KynapseObstacleComponent'Default__KActorFromStatic.KynapseObstacle0'
    begin object name=KynapseObstacle0
    end object
    KynapseObstacleComponent=KynapseObstacle0
    LightEnvironment=none
    Components=none
    RemoteRole=ENetRole.ROLE_None
    bNoDelete=false
    bCanStepUpOn=false
    bCallRigidBodyWakeEvents=true
    CollisionComponent=none
}