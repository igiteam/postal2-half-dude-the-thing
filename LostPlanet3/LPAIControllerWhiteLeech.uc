class LPAIControllerWhiteLeech extends LPAIControllerLeech
    config(AI)
    hidecategories(AnimDependency,Navigation);

function CmdWhiteLeechIdle()
{
    local /*0x97E50000-0x00000000*/ private @NULL InObjective[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    none
    0
    // End:0x33
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    // End:0x81
    if(InObjective != none)
    {
        myCommand = LPAICmd_WhiteLeechIdle(Class'LPAICmd_WhiteLeechIdle'.static.InitObjectiveCommand(self, InObjective));        
    }
    else
    {
        Class'LPAICmd_WhiteLeechIdle'.static.InitCommand(self);
        myCommand = LPAICmd_WhiteLeechIdle(GetActiveCommand());
    }
    // End:0xCD
    if(myCommand != none)
    {
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_LeechAttack'Default__LPAIControllerWhiteLeech.CmdStatus_LeechAttackD0'
    begin object name=CmdStatus_LeechAttackD0
    end object
    CmdStatus_LeechAttack=CmdStatus_LeechAttackD0
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerWhiteLeech.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerWhiteLeech.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerWhiteLeech.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerWhiteLeech.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerWhiteLeech.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerWhiteLeech.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerWhiteLeech.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerWhiteLeech.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}