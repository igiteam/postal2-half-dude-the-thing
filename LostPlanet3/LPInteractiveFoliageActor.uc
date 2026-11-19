class LPInteractiveFoliageActor extends SPInteractiveFoliageActor
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: CylinderComponent'Default__LPInteractiveFoliageActor.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    // Reference: InteractiveFoliageComponent'Default__LPInteractiveFoliageActor.FoliageMeshComponent0'
    begin object name=FoliageMeshComponent0
    end object
    StaticMeshComponent=FoliageMeshComponent0
    Components[0]=FoliageMeshComponent0
    Components[1]=CollisionCylinder
    CollisionComponent=CollisionCylinder
}