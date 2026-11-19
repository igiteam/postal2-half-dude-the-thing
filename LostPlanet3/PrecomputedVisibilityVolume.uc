class PrecomputedVisibilityVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display,Collision,Brush,Attachment,Physics,Volume);

defaultproperties
{
    BrushColor=(R=25,G=255,B=25,A=255)
    bColored=true
    // Reference: BrushComponent'Default__PrecomputedVisibilityVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bCollideActors=false
    CollisionComponent=BrushComponent0
}