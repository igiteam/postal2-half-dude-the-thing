class LPRB_PulleyJointActor extends SPRB_PulleyJointActor
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: RB_PulleyJointSetup'Default__LPRB_PulleyJointActor.MyPulleyJointSetup'
    begin object name=MyPulleyJointSetup
    end object
    ConstraintSetup=MyPulleyJointSetup
    // Reference: RB_ConstraintInstance'Default__LPRB_PulleyJointActor.MyConstraintInstance'
    begin object name=MyConstraintInstance
    end object
    ConstraintInstance=MyConstraintInstance
    Components[0]=none
    // Reference: RB_ConstraintDrawComponent'Default__LPRB_PulleyJointActor.MyConDrawComponent'
    begin object name=MyConDrawComponent
    end object
    Components[1]=MyConDrawComponent
}