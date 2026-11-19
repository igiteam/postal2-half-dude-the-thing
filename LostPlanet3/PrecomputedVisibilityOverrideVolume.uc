class PrecomputedVisibilityOverrideVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display,Collision,Brush,Attachment,Physics,Volume);

var(*) /*0x3DFC0000-0x00000000*/ private editfixedsize array OverrideVisibleActors[65537];
var(*) /*0x3DFC0000-0x00000000*/ private editfixedsize array OverrideInvisibleActors[65537];

defaultproperties
{
    BrushColor=(R=25,G=120,B=90,A=255)
    bColored=true
    // Reference: BrushComponent'Default__PrecomputedVisibilityOverrideVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bCollideActors=false
    CollisionComponent=BrushComponent0
}