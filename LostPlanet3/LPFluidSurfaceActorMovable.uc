class LPFluidSurfaceActorMovable extends SPFluidSurfaceActorMovable
    hidecategories(AnimDependency,Navigation)
    autoexpandcategories(FluidSurfaceActor,FluidSurfaceComponent);

defaultproperties
{
    // Reference: FluidSurfaceComponent'Default__LPFluidSurfaceActorMovable.NewFluidComponent'
    begin object name=NewFluidComponent
    end object
    FluidComponent=NewFluidComponent
    Components[0]=NewFluidComponent
}