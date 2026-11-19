class FluidSurfaceActor extends Actor
    placeable
    hidecategories(AnimDependency,Navigation)
    classgroup(Fluid)
    autoexpandcategories(FluidSurfaceActor,FluidSurfaceComponent);

var(*) /*0x239F0000-0x00000400*/ private const export @NULL FluidComponent[720897];
var(*) /*0x239F0000-0x00000000*/ private @NULL ProjectileEntryEffect[65537];

simulated event TakeDamage()
{
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    super.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    FluidComponent.ApplyForce(HitLocation, FluidComponent.ForceImpact, FluidComponent.TestRippleRadius, true);
    //return;    
}

simulated event @NULL Touch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super.Touch(Other, OtherComp, HitLocation, HitNormal);
    Other.ApplyFluidSurfaceImpact(self, HitLocation);
    //return;    
}

defaultproperties
{
    // Reference: FluidSurfaceComponent'Default__FluidSurfaceActor.NewFluidComponent'
    begin object name=NewFluidComponent class=Class'FluidSurfaceComponent'
    end object
    FluidComponent=NewFluidComponent
    Components[0]=NewFluidComponent
    bNoDelete=true
    bMovable=false
    bCollideActors=true
    bProjTarget=true
}