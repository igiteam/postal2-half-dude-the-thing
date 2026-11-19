class LPMatineePawn extends SPMatineePawn
    config(Game)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPMatineePawn.PawnMesh'
    begin object name=PawnMesh
    end object
    Mesh=PawnMesh
    // Reference: CylinderComponent'Default__LPMatineePawn.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=CollisionCylinder
    Components[2]=none
    Components[3]=PawnMesh
    CollisionComponent=CollisionCylinder
}