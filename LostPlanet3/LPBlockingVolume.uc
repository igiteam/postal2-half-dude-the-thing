class LPBlockingVolume extends SPKyBlockingVolume
    hidecategories(AnimDependency,Navigation,Object,Movement,Display,BlockingVolume);

var(0.25_Pct) /*0x7C510000-0x00000000*/ private bool bBlockPlayersOnFootOnly[65537];
var(0.25_Pct) /*0x7C510000-0x00000000*/ private bool bBlockPlayersInVitalSuitOnly[65537];

defaultproperties
{
    // Reference: BrushComponent'Default__LPBlockingVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    CollisionComponent=BrushComponent0
}