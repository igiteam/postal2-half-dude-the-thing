class FluidSurfaceActorMovable extends FluidSurfaceActor
    placeable
    hidecategories(AnimDependency,Navigation)
    autoexpandcategories(FluidSurfaceActor,FluidSurfaceComponent);

defaultproperties
{
    // Reference: FluidSurfaceComponent'Default__FluidSurfaceActorMovable.NewFluidComponent'
    begin object name=NewFluidComponent
    end object
    FluidComponent=NewFluidComponent
    Components[0]=NewFluidComponent
    Physics=EPhysics.PHYS_Interpolating
    bMovable=true
}