class DecalActor extends DecalActorBase
    placeable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: DecalComponent'Default__DecalActor.NewDecalComponent'
    begin object name=NewDecalComponent
    end object
    Decal=NewDecalComponent
    Components[0]=NewDecalComponent
    Components[1]=none
    Components[2]=none
}