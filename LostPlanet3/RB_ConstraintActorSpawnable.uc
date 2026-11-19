class RB_ConstraintActorSpawnable extends RB_ConstraintActor
    notplaceable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: RB_ConstraintSetup'Default__RB_ConstraintActorSpawnable.MyConstraintSetup'
    begin object name=MyConstraintSetup class=Class'RB_ConstraintSetup'
    end object
    ConstraintSetup=MyConstraintSetup
    // Reference: RB_ConstraintInstance'Default__RB_ConstraintActorSpawnable.MyConstraintInstance'
    begin object name=MyConstraintInstance
    end object
    ConstraintInstance=MyConstraintInstance
    Components[0]=none
    // Reference: RB_ConstraintDrawComponent'Default__RB_ConstraintActorSpawnable.MyConDrawComponent'
    begin object name=MyConDrawComponent
    end object
    Components[1]=MyConDrawComponent
    bNoDelete=false
}