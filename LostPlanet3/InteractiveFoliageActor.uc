class InteractiveFoliageActor extends StaticMeshActor
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000400*/ private export @NULL CylinderComponent[524289];
var(*) /*0x35EA0000-0x00000000*/ private @NULL TouchingActorEntryPosition[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FoliageVelocity[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FoliageForce[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FoliagePosition[536870913];
var(*) /*0x23E60000-0x00000000*/ private float FoliageDamageImpulseScale[65537];
var(*) /*0x23E60000-0x00000000*/ private float FoliageTouchImpulseScale[65537];
var(*) /*0x23E60000-0x00000000*/ private float FoliageStiffness[65537];
var(*) /*0x23E60000-0x00000000*/ private float FoliageStiffnessQuadratic[65537];
var(*) /*0x23E60000-0x00000000*/ private float FoliageDamping[65537];
var(*) /*0x23E60000-0x00000000*/ private float MaxDamageImpulse[65537];
var(*) /*0x23E60000-0x00000000*/ private float MaxTouchImpulse[65537];
var(*) /*0x23E60000-0x00000000*/ private float MaxForce[65537];
var(*) /*0x35EA0000-0x00000000*/ private float Mass;

// Export UInteractiveFoliageActor::execTakeDamage(FFrame&, void* const)
native simulated event TakeDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;


}

// Export UInteractiveFoliageActor::execTouch(FFrame&, void* const)
native simulated event @NULL Touch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;


}

defaultproperties
{
    // Reference: CylinderComponent'Default__InteractiveFoliageActor.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'CylinderComponent'
    end object
    CylinderComponent=CollisionCylinder
    FoliageDamageImpulseScale=20.0000000
    FoliageTouchImpulseScale=10.0000000
    FoliageStiffness=10.0000000
    FoliageStiffnessQuadratic=0.3000000
    FoliageDamping=2.0000000
    MaxDamageImpulse=100000.0000000
    MaxTouchImpulse=1000.0000000
    MaxForce=100000.0000000
    Mass=1.0000000
    // Reference: InteractiveFoliageComponent'Default__InteractiveFoliageActor.FoliageMeshComponent0'
    begin object name=FoliageMeshComponent0 class=Class'InteractiveFoliageComponent'
    end object
    StaticMeshComponent=FoliageMeshComponent0
    Components[0]=FoliageMeshComponent0
    Components[1]=CollisionCylinder
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bStatic=false
    bNoDelete=true
    bWorldGeometry=false
    bBlockActors=false
    bProjTarget=true
    CollisionComponent=CollisionCylinder
}