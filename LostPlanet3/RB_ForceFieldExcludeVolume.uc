class RB_ForceFieldExcludeVolume extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

var(*) /*0x3FE50000-0x00000000*/ private int ForceFieldChannel[65537];
var(*) /*0x35EA0000-0x00000000*/ private int SceneIndex[268566529];

defaultproperties
{
    ForceFieldChannel=1
    // Reference: BrushComponent'Default__RB_ForceFieldExcludeVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}