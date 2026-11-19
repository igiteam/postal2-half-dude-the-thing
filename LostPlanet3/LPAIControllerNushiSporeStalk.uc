class LPAIControllerNushiSporeStalk extends LPAIControllerDefenderHive
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NushiSporeStalkPawn[536870913];

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    NushiSporeStalkPawn = LPAIPawnNushiSporeStalk(inPawn);
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

function NotifyAnimReadyToLaunchDefenders()
{
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x9F [Loop If]
    if(curCommand != none)
    {
        // End:0x6B
        if(LPAICmd_NushiSporeStalkLaunchSpore(curCommand) != none)
        {
            LPAICmd_NushiSporeStalkLaunchSpore(curCommand).NotifyAnimReadyToLaunchDefenders();
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x90 [Loop If]
    if(curCommand != none)
    {
        curCommand.NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    CmdHitReaction(0.0000000);
    //return;    
}

function CmdLaunchDefendersPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_NushiSporeStalkLaunchSpore'.static.InitCommand(self);
    myCommand = LPAICmd_NushiSporeStalkLaunchSpore(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerNushiSporeStalk.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerNushiSporeStalk.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerNushiSporeStalk.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerNushiSporeStalk.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerNushiSporeStalk.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerNushiSporeStalk.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerNushiSporeStalk.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerNushiSporeStalk.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}