class RB_BSJointActor extends RB_ConstraintActor
    placeable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: RB_BSJointSetup'Default__RB_BSJointActor.MyBSJointSetup'
    begin object name=MyBSJointSetup class=Class'RB_BSJointSetup'
    end object
    ConstraintSetup=MyBSJointSetup
    // Reference: RB_ConstraintInstance'Default__RB_BSJointActor.MyConstraintInstance'
    begin object name=MyConstraintInstance
    end object
    ConstraintInstance=MyConstraintInstance
    Components[0]=none
    // Reference: RB_ConstraintDrawComponent'Default__RB_BSJointActor.MyConDrawComponent'
    begin object name=MyConDrawComponent
    end object
    Components[1]=MyConDrawComponent
}