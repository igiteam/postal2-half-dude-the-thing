class LPSVehicle extends SPSVehicle
    config(Game)
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: RB_StayUprightSetup'Default__LPSVehicle.MyStayUprightSetup'
    begin object name=MyStayUprightSetup
    end object
    StayUprightConstraintSetup=MyStayUprightSetup
    // Reference: RB_ConstraintInstance'Default__LPSVehicle.MyStayUprightConstraintInstance'
    begin object name=MyStayUprightConstraintInstance
    end object
    StayUprightConstraintInstance=MyStayUprightConstraintInstance
    // Reference: SkeletalMeshComponent'Default__LPSVehicle.SVehicleMesh'
    begin object name=SVehicleMesh
    end object
    Mesh=SVehicleMesh
    // Reference: CylinderComponent'Default__LPSVehicle.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=SVehicleMesh
    CollisionComponent=SVehicleMesh
}