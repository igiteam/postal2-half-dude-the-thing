class RB_PrismaticActor extends RB_ConstraintActor
    placeable
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: RB_PrismaticSetup'Default__RB_PrismaticActor.MyPrismaticSetup'
    begin object name=MyPrismaticSetup class=Class'RB_PrismaticSetup'
    end object
    ConstraintSetup=MyPrismaticSetup
    // Reference: RB_ConstraintInstance'Default__RB_PrismaticActor.MyConstraintInstance'
    begin object name=MyConstraintInstance
    end object
    ConstraintInstance=MyConstraintInstance
    Components[0]=none
    // Reference: RB_ConstraintDrawComponent'Default__RB_PrismaticActor.MyConDrawComponent'
    begin object name=MyConDrawComponent
    end object
    Components[1]=MyConDrawComponent
    Components[2]=none
}