class LPAIControllerKingCrab extends LPAIControllerBaseSnowCrab
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL KingCrabPawn[536870913];

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    KingCrabPawn = LPAIPawnKingCrab(inPawn);
    //return;    
}

function DesireNonDismemberedTaunt()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ReactToGrenadeGettingStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreGettingHit[8388609];

    CmdCrabTakeGrenadeInMouth(CrabPawn.TuneDataIceCrab.TauntAttackDurationOfStunAfterGettingGrenadeInMouth.GetValue(), Class'LPSM_SnowCrabTauntSwallow', Class'LPSM_KingCrabRightClawHoldToStun', Class'LPSM_SnowCrabGrenadeInMouthStun', 0);
    //return;    
}

function NotifyUberStrikeKillTheVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL vsKilling;

    vsKilling = LPBaseVSPlayerPawn(MyLPEnemy);
    // End:0x4A
    if(vsKilling != none)
    {
        vsKilling.ForceShutdownAndPlayerEjection();
    }
    //return;    
}

function IsKingCrab()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerKingCrab.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerKingCrab.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerKingCrab.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerKingCrab.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerKingCrab.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerKingCrab.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerKingCrab.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerKingCrab.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}