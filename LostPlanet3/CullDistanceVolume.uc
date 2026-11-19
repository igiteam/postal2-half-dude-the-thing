class CullDistanceVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display,Advanced,Attachment,Collision,Volume);

struct native CullDistanceSizePair
{
    var(*) /*0x15170000-0x00000000*/ private float Size[65537];
    var(*) /*0x15170000-0x00000000*/ private float CullDistance[65537];

    structdefaultproperties
    {
        Size=0.0000000
        CullDistance=0.0000000
    }
};

var(*) /*0x15180000-0x00000000*/ private editfixedsize array CullDistances[65537];
var(*) /*0x15180000-0x00000000*/ private bool bEnabled[65537];

defaultproperties
{
    CullDistances=/* Array type was not detected. */
    bEnabled=true
    // Reference: BrushComponent'Default__CullDistanceVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bCollideActors=false
    CollisionComponent=BrushComponent0
    SupportedEvents=none
}