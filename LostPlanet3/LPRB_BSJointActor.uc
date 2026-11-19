class LPRB_BSJointActor extends SPRB_BSJointActor
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: RB_BSJointSetup'Default__LPRB_BSJointActor.MyBSJointSetup'
    begin object name=MyBSJointSetup
    end object
    ConstraintSetup=MyBSJointSetup
    // Reference: RB_ConstraintInstance'Default__LPRB_BSJointActor.MyConstraintInstance'
    begin object name=MyConstraintInstance
    end object
    ConstraintInstance=MyConstraintInstance
    Components[0]=none
    // Reference: RB_ConstraintDrawComponent'Default__LPRB_BSJointActor.MyConDrawComponent'
    begin object name=MyConDrawComponent
    end object
    Components[1]=MyConDrawComponent
}