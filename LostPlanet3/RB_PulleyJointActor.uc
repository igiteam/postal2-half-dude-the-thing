class RB_PulleyJointActor extends RB_ConstraintActor
    placeable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: RB_PulleyJointSetup'Default__RB_PulleyJointActor.MyPulleyJointSetup'
    begin object name=MyPulleyJointSetup class=Class'RB_PulleyJointSetup'
    end object
    ConstraintSetup=MyPulleyJointSetup
    // Reference: RB_ConstraintInstance'Default__RB_PulleyJointActor.MyConstraintInstance'
    begin object name=MyConstraintInstance
    end object
    ConstraintInstance=MyConstraintInstance
    Components[0]=none
    // Reference: RB_ConstraintDrawComponent'Default__RB_PulleyJointActor.MyConDrawComponent'
    begin object name=MyConDrawComponent
    end object
    Components[1]=MyConDrawComponent
}