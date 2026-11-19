class LPRB_HingeActor extends SPRB_HingeActor
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: RB_HingeSetup'Default__LPRB_HingeActor.MyHingeSetup'
    begin object name=MyHingeSetup
    end object
    ConstraintSetup=MyHingeSetup
    // Reference: RB_ConstraintInstance'Default__LPRB_HingeActor.MyConstraintInstance'
    begin object name=MyConstraintInstance
    end object
    ConstraintInstance=MyConstraintInstance
    Components[0]=none
    // Reference: RB_ConstraintDrawComponent'Default__LPRB_HingeActor.MyConDrawComponent'
    begin object name=MyConDrawComponent
    end object
    Components[1]=MyConDrawComponent
    Components[2]=none
}