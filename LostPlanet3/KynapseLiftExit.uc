class KynapseLiftExit extends LiftExit
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(accidentRatio) /*0x01510000-0x00000000*/ private editfixedsize array PathdataFamilies[65537];
var(accidentRatio) /*0x01510000-0x00000400*/ private export @NULL kynapseLiftPOComponent[589825];

defaultproperties
{
    // Reference: KynapseLiftPathObjectComponent'Default__KynapseLiftExit.KynapseLift'
    begin object name=KynapseLift class=Class'KynapseLiftPathObjectComponent'
    end object
    kynapseLiftPOComponent=KynapseLift
    // Reference: CylinderComponent'Default__KynapseLiftExit.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=KynapseLift
    CollisionComponent=CollisionCylinder
}