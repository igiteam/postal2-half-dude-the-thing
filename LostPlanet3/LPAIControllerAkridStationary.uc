class LPAIControllerAkridStationary extends LPAIControllerAkrid
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AkridStationaryPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentPubSubCombatManagerResourceRef;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int TotalNumberOfPossibileLobFireLocationsPerEvolution[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LobFireLocationToStrikeAt[536870913];

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];
    local /*0x97E50000-0x00000000*/ private int iter;
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL newLocData;
    local /*0x97E50000-0x00000000*/ private int maxNumberOfAltArcs;

    super.Possess(inPawn, bVehicleTransition);
    AkridStationaryPawn = LPAIPawnAkridStationary(inPawn);
    TotalNumberOfPossibileLobFireLocationsPerEvolution = int(AkridStationaryPawn.TuneDataAkridStationary.NumOfLobStrikeLocationsToLookForAtEachRange * float(AkridStationaryPawn.TuneDataAkridStationary.RangedLobStrikeInfoByTier.Length));
    iter = 0;
    J0xBB:

    // End:0x10B [Loop If]
    if(iter < TotalNumberOfPossibileLobFireLocationsPerEvolution)
    {
        AkridStationaryPawn.LobStrikeLocValidationInfoList.AddItem(newLocData);        
        ++iter;
        // [Loop Continue]
        goto J0xBB;
    }
    maxNumberOfAltArcs = 0;
    iter = 0;
    J0x121:

    // End:0x22B [Loop If]
    if(iter < AkridStationaryPawn.TuneDataAkridStationary.RangedLobStrikeInfoByZone.Length)
    {
        // End:0x21D
        if(maxNumberOfAltArcs < AkridStationaryPawn.TuneDataAkridStationary.RangedLobStrikeInfoByZone[iter].AltDesiredZPercentOfLobList.Length)
        {
            maxNumberOfAltArcs = AkridStationaryPawn.TuneDataAkridStationary.RangedLobStrikeInfoByZone[iter].AltDesiredZPercentOfLobList.Length;
        }
        ++iter;
        // [Loop Continue]
        goto J0x121;
    }
    iter = 0;
    J0x236:

    // End:0x286 [Loop If]
    if(iter < maxNumberOfAltArcs)
    {
        AkridStationaryPawn.LobStrikeLocValidationInfoList.AddItem(newLocData);        
        ++iter;
        // [Loop Continue]
        goto J0x236;
    }
    //return;    
}

event UnPossess()
{
    // End:0x3A
    if(CurrentPubSubCombatManagerResourceRef != none)
    {
        CurrentPubSubCombatManagerResourceRef.RetractAllOptionsForThisPublisher(self);
        CurrentPubSubCombatManagerResourceRef = none;
    }
    super(LPAIController).UnPossess();
    //return;    
}

event Destroyed()
{
    // End:0x3A
    if(CurrentPubSubCombatManagerResourceRef != none)
    {
        CurrentPubSubCombatManagerResourceRef.RetractAllOptionsForThisPublisher(self);
        CurrentPubSubCombatManagerResourceRef = none;
    }
    //return;    
}

function HasFixedPlacementAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CanBeMyEnemy(InEnemy);
    //return ReturnValue;    
}

function HasCombatManagerEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetCombatManagerEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    //return;    
}

function ReleaseCombatManagerAccess()
{
    // End:0x1A
    if(CurrentPubSubCombatManagerResourceRef != none)
    {
        CurrentPubSubCombatManagerResourceRef = none;
    }
    //return;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;
    local /*0x97E50000-0x00000000*/ private bool attackShouldStart;

    curCommand = LPAICommand(CommandList);
    attackShouldStart = false;
    J0x28:

    // End:0xA5 [Loop If]
    if(curCommand != none)
    {
        // End:0x71
        if(curCommand.OnEngagementAttackOptionApproved(TypeOfAttack))
        {
            attackShouldStart = true;
            // [Explicit Break]
            goto J0xA5;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x28;
    }
    J0xA5:

    return attackShouldStart;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerAkridStationary.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerAkridStationary.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerAkridStationary.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerAkridStationary.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerAkridStationary.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerAkridStationary.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerAkridStationary.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerAkridStationary.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}