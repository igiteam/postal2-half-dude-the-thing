class KAsset extends Actor
    nativereplication
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Physics);

var(*) /*0x2D200000-0x00000400*/ private const export @NULL SkeletalMeshComponent[720897];
var(*) /*0x2D200000-0x00000000*/ private bool bDamageAppliesImpulse[65537];
var(*) /*0x2D200000-0x00000000*/ private bool bWakeOnLevelStart[65537];
var(*) /*0x2D200000-0x00000000*/ private bool bBlockPawns[65537];
var(*) /*0x35EA0000-0x00000000*/ private travel SkeletalMesh ReplicatedMesh[538968065];
var(*) /*0x35EA0000-0x00000000*/ private travel PhysicsAsset ReplicatedPhysAsset[538968065];

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x37
    if(bWakeOnLevelStart)
    {
        SkeletalMeshComponent.WakeRigidBody();
    }
    ReplicatedMesh = SkeletalMeshComponent.SkeletalMesh;
    ReplicatedPhysAsset = SkeletalMeshComponent.PhysicsAsset;
    //return;    
}

final function SetMeshAndPhysAsset()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewMesh[8388609], NewPhysAsset;

    SkeletalMeshComponent.SetSkeletalMesh(NewMesh);
    ReplicatedMesh = NewMesh;
    SkeletalMeshComponent.SetPhysicsAsset(NewPhysAsset);
    ReplicatedPhysAsset = NewPhysAsset;
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x43
    if(VarName == 'ReplicatedMesh')
    {
        SkeletalMeshComponent.SetSkeletalMesh(ReplicatedMesh);        
    }
    else
    {
        // End:0x83
        if(VarName == 'ReplicatedPhysAsset')
        {
            SkeletalMeshComponent.SetPhysicsAsset(ReplicatedPhysAsset);
        }
    }
    //return;    
}

simulated event TakeDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser, ApplyImpulse;
    local /*0x35EA0000-0x00000000*/ private float Impulse;

    super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    Impulse = DamageType.default.KDamageImpulse * (GetImpulseScale());
    // End:0x189
    if(bDamageAppliesImpulse && Impulse > float(0))
    {
        // End:0xB6
        if(VSize(Momentum) < 0.0010000)
        {
            return;
        }
        CheckHitInfo(HitInfo, SkeletalMeshComponent, Normal(Momentum), HitLocation);
        ApplyImpulse = Normal(Momentum) * Impulse;
        // End:0x189
        if(HitInfo.HitComponent != none)
        {
            HitInfo.HitComponent.AddImpulse(ApplyImpulse, HitLocation, HitInfo.BoneName);
        }
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
    local /*0x35EA0000-0x00000000*/ private float DamageFalloffExponent[9437185], RadialImpulse;

    1.0000000
    RadialImpulse = DamageType.default.RadialDamageImpulse * (GetRadialImpulseScale());
    // End:0xCE
    if((bDamageAppliesImpulse && RadialImpulse > float(0)) && int(Role) == int(ROLE_Authority))
    {
        CollisionComponent.AddRadialImpulse(HurtOrigin, DamageRadius, RadialImpulse, 1, DamageType.default.bRadialDamageVelChange);
    }
    NotifyDestructComponentOfDamage(int(BaseDamage), InstigatedBy, Location, Momentum * (Location - HurtOrigin), DamageType,, DamageCauser);
    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x57
    if(Action.InputLinks[0].bHasImpulse)
    {
        SkeletalMeshComponent.WakeRigidBody();
    }
    //return;    
}

simulated function OnTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609], destActor;

    destActor = Actor(SeqVar_Object(inAction.VariableLinks[1].LinkedVariables[0]).GetObjectValue());
    // End:0xB7
    if(destActor != none)
    {
        SkeletalMeshComponent.SetRBPosition(destActor.Location);        
    }
    else
    {
        inAction.ScriptLog((("No Destination for" @ string(inAction)) @ "on") @ string(self));
    }
    //return;    
}

function DoKismetAttachment()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Attachment[8388609], Action;

    Attachment.SetBase(self,, SkeletalMeshComponent, Action.BoneName);
    //return;    
}

simulated function GetImpulseScale()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

simulated function GetRadialImpulseScale()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return 1.0000000;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__KAsset.KAssetSkelMeshComponent'
    begin object name=KAssetSkelMeshComponent class=Class'SkeletalMeshComponent'
    end object
    SkeletalMeshComponent=KAssetSkelMeshComponent
    bDamageAppliesImpulse=true
    // Reference: DynamicLightEnvironmentComponent'Default__KAsset.MyLightEnvironment'
    begin object name=MyLightEnvironment class=Class'DynamicLightEnvironmentComponent'
    end object
    Components[0]=MyLightEnvironment
    Components[1]=KAssetSkelMeshComponent
    Physics=EPhysics.PHYS_RigidBody
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    TickGroup=ETickingGroup.TG_PostAsyncWork
    bNoDelete=true
    bAlwaysRelevant=true
    bUpdateSimulatedPosition=true
    bNetInitialRotation=true
    bCollideActors=true
    bBlockActors=true
    bProjTarget=true
    bEdShouldSnap=true
    CollisionComponent=KAssetSkelMeshComponent
    SupportedEvents=/* Array type was not detected. */
}