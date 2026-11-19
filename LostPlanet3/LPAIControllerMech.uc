class LPAIControllerMech extends LPAIController
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MechPawn;

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    MechPawn = LPAIPawnMech(inPawn);
    //return;    
}

final function IsDoingASpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MechPawn != none) && MechPawn.super(LPAIControllerMech).IsDoingASpecialMove();
    //return ReturnValue;    
}

final function IsDoingSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMoveClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MechPawn != none) && MechPawn.super(LPAIControllerMech).IsDoingSpecialMove(SpecialMoveClass);
    //return ReturnValue;    
}

final function IsDoingSpecialMove_OF_Class()
{
    local /*0x97E50000-0x00000000*/ private class ParentSpecialMoveClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (MechPawn != none) && MechPawn.super(LPAIControllerMech).IsDoingSpecialMove_OF_Class(ParentSpecialMoveClass);
    //return ReturnValue;    
}

final function CanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class SpecialMoveClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceCheck[9437185], ReturnValue;

    return (SpecialMoveClass == none) || (MechPawn != none) && MechPawn.super(LPAIControllerMech).CanDoSpecialMove(SpecialMoveClass, bForceCheck);
    //return ReturnValue;    
}

final event DoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class NewSMClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool bForceMove[9437185], bForceRestart;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> SMFinishedDelegate[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL InteractionActor[9437185], NewMoveStruct;

    true            
    // End:0x9A
    if(MechPawn != none)
    {
        NewMoveStruct = MySPPawn.FillSMStructFromParams(NewSMClass, none, bForceRestart, InteractionActor);
        MechPawn.DoSpecialMoveFromStruct(NewMoveStruct, bForceMove, SMFinishedDelegate);
    }
    //return;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerMech.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerMech.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerMech.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerMech.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerMech.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerMech.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerMech.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerMech.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}