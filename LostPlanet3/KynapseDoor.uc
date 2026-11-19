class KynapseDoor extends DoorMarker
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

var(accidentRatio) /*0x013C0000-0x00000000*/ private @NULL DoorDir[65537];
var(accidentRatio) /*0x013C0000-0x00000000*/ private editfixedsize array PathdataFamilies[65537];
var(accidentRatio) /*0x013C0000-0x00000400*/ private export @NULL kynapseDoorPOComponent[589825];
var(accidentRatio) /*0x02000000-0x00000400*/ private export @NULL DoorDirArrow[524289];

defaultproperties
{
    // Reference: KynapseDoorPathObjectComponent'Default__KynapseDoor.KynapseDoor'
    begin object name=KynapseDoor class=Class'KynapseDoorPathObjectComponent'
    end object
    kynapseDoorPOComponent=KynapseDoor
    // Reference: CylinderComponent'Default__KynapseDoor.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=KynapseDoor
    Components[6]=none
    CollisionComponent=CollisionCylinder
}