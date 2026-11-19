class LPAIControllerBolSepia extends LPAIControllerSepia
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BolSepiaPawn[536870913];

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    BolSepiaPawn = LPAIPawnBolSepia(inPawn);
    //return;    
}

event UnPossess()
{
    super.UnPossess();
    //return;    
}

event Destroyed()
{
    super.Destroyed();
    //return;    
}

function SetAttackResourceNames()
{
    super.SetAttackResourceNames();
    LobStrikeDensityResourceName = 'SepiaLobStrike';
    //return;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerBolSepia.CmdStatus_SepiaAttackD0'
    begin object name=CmdStatus_SepiaAttackD0
    end object
    CmdStatus_SepiaAttack=CmdStatus_SepiaAttackD0
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerBolSepia.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerBolSepia.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerBolSepia.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerBolSepia.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerBolSepia.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerBolSepia.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerBolSepia.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerBolSepia.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}