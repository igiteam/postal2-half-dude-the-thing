class NavMeshBoundsVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

defaultproperties
{
    BrushColor=(R=74,G=74,B=74,A=255)
    bColored=true
    // Reference: BrushComponent'Default__NavMeshBoundsVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bCollideActors=false
    CollisionComponent=BrushComponent0
}