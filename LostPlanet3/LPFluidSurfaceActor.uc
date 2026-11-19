class LPFluidSurfaceActor extends SPFluidSurfaceActor
    hidecategories(AnimDependency,Navigation)
    autoexpandcategories(FluidSurfaceActor,FluidSurfaceComponent);

defaultproperties
{
    // Reference: FluidSurfaceComponent'Default__LPFluidSurfaceActor.NewFluidComponent'
    begin object name=NewFluidComponent
    end object
    FluidComponent=NewFluidComponent
    Components[0]=NewFluidComponent
}