class LPFluidInfluenceActor extends SPFluidInfluenceActor
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: FluidInfluenceComponent'Default__LPFluidInfluenceActor.NewInfluenceComponent'
    begin object name=NewInfluenceComponent
    end object
    InfluenceComponent=NewInfluenceComponent
    Components[0]=none
    Components[1]=none
    Components[2]=NewInfluenceComponent
}