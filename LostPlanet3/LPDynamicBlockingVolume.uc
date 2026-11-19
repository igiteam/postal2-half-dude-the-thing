class LPDynamicBlockingVolume extends SPKyDynamicBlockingVolume
    hidecategories(AnimDependency,Navigation,Object,Display);

var(0.25_Pct) /*0x7E300000-0x00000000*/ private bool bBlockPlayersOnFootOnly[65537];
var(0.25_Pct) /*0x7E300000-0x00000000*/ private bool bBlockPlayersInVitalSuitOnly[65537];

defaultproperties
{
    // Reference: SPKynapseObstacleComponent'Default__LPDynamicBlockingVolume.DefaultSPKynapseObstacleComponent'
    begin object name=DefaultSPKynapseObstacleComponent
    end object
    SPKynapseObstacle=DefaultSPKynapseObstacleComponent
    // Reference: BrushComponent'Default__LPDynamicBlockingVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    Components[1]=DefaultSPKynapseObstacleComponent
    CollisionComponent=BrushComponent0
}