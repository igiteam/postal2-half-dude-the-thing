class PathBlockingVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

defaultproperties
{
    // Reference: BrushComponent'Default__PathBlockingVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bWorldGeometry=true
    bCollideActors=false
    bBlockActors=true
    CollisionComponent=BrushComponent0
}