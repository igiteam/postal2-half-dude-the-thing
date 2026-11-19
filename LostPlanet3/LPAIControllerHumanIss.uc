class LPAIControllerHumanIss extends LPAIControllerHumanNPC
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HumanIssPawn;

function ForceStruggleModeNow()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private class StruggleModeClass[9437185];

    none
    CmdHumanIssStrugglePofStrike(EnemyForStruggleMode,, 0, StruggleModeClass);
    //return;    
}

function CmdHumanIssStrugglePofStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private class StruggleModeClass[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    none
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_IssStrugglePofStrike'.static.InitCommand(self);
    myCommand = LPAICmd_IssStrugglePofStrike(GetActiveCommand());
    // End:0x104
    if(myCommand != none)
    {
        myCommand.SetStruggleModeClass(StruggleModeClass);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerHumanIss.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerHumanIss.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerHumanIss.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerHumanIss.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerHumanIss.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerHumanIss.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerHumanIss.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerHumanIss.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}