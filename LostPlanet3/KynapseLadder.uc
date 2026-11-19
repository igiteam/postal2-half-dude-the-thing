class KynapseLadder extends Ladder
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(accidentRatio) /*0x014B0000-0x00000000*/ private editfixedsize array PathdataFamilies[65537];
var(accidentRatio) /*0x014B0000-0x00000400*/ private export @NULL kynapseLadderPOComponent[589825];

defaultproperties
{
    // Reference: KynapseLadderPathObjectComponent'Default__KynapseLadder.KynapseLadder'
    begin object name=KynapseLadder class=Class'KynapseLadderPathObjectComponent'
    end object
    kynapseLadderPOComponent=KynapseLadder
    // Reference: CylinderComponent'Default__KynapseLadder.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=KynapseLadder
    CollisionComponent=CollisionCylinder
}