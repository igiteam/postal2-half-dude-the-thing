class RB_HingeActor extends RB_ConstraintActor
    placeable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: RB_HingeSetup'Default__RB_HingeActor.MyHingeSetup'
    begin object name=MyHingeSetup class=Class'RB_HingeSetup'
    end object
    ConstraintSetup=MyHingeSetup
    // Reference: RB_ConstraintInstance'Default__RB_HingeActor.MyConstraintInstance'
    begin object name=MyConstraintInstance
    end object
    ConstraintInstance=MyConstraintInstance
    Components[0]=none
    // Reference: RB_ConstraintDrawComponent'Default__RB_HingeActor.MyConDrawComponent'
    begin object name=MyConDrawComponent
    end object
    Components[1]=MyConDrawComponent
    Components[2]=none
}