class MatineePawn extends Pawn
    config(Game)
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x31220000-0x00000000*/ private @NULL PreviewMesh[65537];

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__MatineePawn.PawnMesh'
    begin object name=PawnMesh class=Class'SkeletalMeshComponent'
    end object
    Mesh=PawnMesh
    // Reference: CylinderComponent'Default__MatineePawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=PawnMesh
    Physics=EPhysics.PHYS_Falling
    CollisionComponent=CollisionCylinder
}