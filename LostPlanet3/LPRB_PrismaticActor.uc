class LPRB_PrismaticActor extends SPRB_PrismaticActor
    hidecategories(AnimDependency,Navigation);

defaultproperties
{
    // Reference: RB_PrismaticSetup'Default__LPRB_PrismaticActor.MyPrismaticSetup'
    begin object name=MyPrismaticSetup
    end object
    ConstraintSetup=MyPrismaticSetup
    // Reference: RB_ConstraintInstance'Default__LPRB_PrismaticActor.MyConstraintInstance'
    begin object name=MyConstraintInstance
    end object
    ConstraintInstance=MyConstraintInstance
    Components[0]=none
    // Reference: RB_ConstraintDrawComponent'Default__LPRB_PrismaticActor.MyConDrawComponent'
    begin object name=MyConDrawComponent
    end object
    Components[1]=MyConDrawComponent
    Components[2]=none
}