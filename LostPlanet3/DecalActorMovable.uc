class DecalActorMovable extends DecalActorBase
    placeable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: DecalComponent'Default__DecalActorMovable.NewDecalComponent'
    begin object name=NewDecalComponent
    end object
    Decal=NewDecalComponent
    Components[0]=NewDecalComponent
    Components[1]=none
    Components[2]=none
    bStatic=false
    bNoDelete=true
    bHardAttach=true
    bMovable=true
}