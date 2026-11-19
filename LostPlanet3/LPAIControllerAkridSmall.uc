class LPAIControllerAkridSmall extends LPAIControllerAkrid
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL FactoryAI[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ActorFactoryData;

// Export ULPAIControllerAkridSmall::execGetContentClass(FFrame&, void* const)
protected native function GetContentClass()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string contentClassName[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];


}

// Export ULPAIControllerAkridSmall::execSpawnActor(FFrame&, void* const)
protected native function SpawnActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Factory[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize string PawnClassName[8388609], ControllerClassName;
    local /*0x97E50000-0x00000000*/ private @NULL InPosition[8388609], InRotation;
    local /*0x97E50000-0x00000000*/ private bool bNoCheckCollision[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    false                                
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerAkridSmall.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerAkridSmall.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerAkridSmall.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerAkridSmall.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerAkridSmall.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerAkridSmall.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerAkridSmall.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerAkridSmall.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}