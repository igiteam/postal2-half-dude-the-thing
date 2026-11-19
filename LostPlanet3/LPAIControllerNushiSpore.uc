class LPAIControllerNushiSpore extends LPAIControllerDefender
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NushiSporePawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NushiSporeCombatManagerAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NushiSporeCombatManagerResourceRef;

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    NushiSporePawn = LPAIPawnNushiSpore(inPawn);
    //return;    
}

event UnPossess()
{
    // End:0x19
    if(NushiSporeCombatManagerResourceRef != none)
    {
        ReleaseCombatManagerAccess();
    }
    super.UnPossess();
    //return;    
}

event Destroyed()
{
    super.Destroyed();
    // End:0x23
    if(NushiSporeCombatManagerResourceRef != none)
    {
        ReleaseCombatManagerAccess();
    }
    //return;    
}

function SetAttackResourceNames()
{
    super.SetAttackResourceNames();
    OrbitResourceName = 'NushiSporeOrbitFormation';
    //return;    
}

function HasCombatManagerEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x50
    if(CanBeMyEnemy(InEnemy))
    {
        // End:0x3C
        if(NushiSporeCombatManagerResourceRef != none)
        {
            return IsNushiSporeCombatManagerAccessForThisEnemy(InEnemy);            
        }
        else
        {
            return HaveOrbitEngagementAccess(InEnemy);
        }
    }
    return false;
    //return ReturnValue;    
}

function ReleaseCombatManagerAccess()
{
    // End:0x73
    if(NushiSporeCombatManagerAccess != none)
    {
        // End:0x3E
        if(NushiSporeCombatManagerResourceRef != none)
        {
            NushiSporeCombatManagerResourceRef.RetractAllOptionsForThisPublisher(self);
        }
        NushiSporeCombatManagerAccess.Destroy();
        NushiSporeCombatManagerAccess = none;
        NushiSporeCombatManagerResourceRef = none;
    }
    //return;    
}

function IsNushiSporeCombatManagerAccessForThisEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x9A
    if(NushiSporeCombatManagerAccess != none)
    {
        // End:0x65
        if(NushiSporeCombatManagerAccess.GetOuterActor() == InEnemy)
        {
            // End:0x62
            if(!NushiSporeCombatManagerAccess.IsDestroyed())
            {
                return true;
            }            
        }
        else
        {
            NushiSporeCombatManagerAccess.Destroy();
            NushiSporeCombatManagerAccess = none;
            NushiSporeCombatManagerResourceRef = none;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetCombatManagerEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0xAB
    if(!HasCombatManagerEngagementAccess(InEnemy))
    {
        NushiSporeCombatManagerAccess = InEnemy.AIResourceManager.GetAccess('NushiSporeCombatManager', myAIPawn);
        // End:0xAB
        if(NushiSporeCombatManagerAccess != none)
        {
            NushiSporeCombatManagerResourceRef = LPAIResNushiSporeFromOrbitSlotEngagement(NushiSporeCombatManagerAccess.GetResource());
        }
    }
    //return;    
}

function GetOrbitEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0x48
    if((NushiSporePawn != none) && NushiSporePawn.PawnThatLaunchedMe != none)
    {
        GetCombatManagerEngagementAccess(InEnemy);
    }
    // End:0x6A
    if(NushiSporeCombatManagerResourceRef == none)
    {
        super.GetOrbitEngagementAccess(InEnemy);
    }
    //return;    
}

function HasCurrentOrbitCombatMgrResourceRef()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(NushiSporeCombatManagerResourceRef != none)
    {
        return true;
    }
    return super.HasCurrentOrbitCombatMgrResourceRef();
    //return ReturnValue;    
}

function IsLandOnAttackAsReplacementForFullPhysicalAttackAllowed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x33
    if(NushiSporeCombatManagerResourceRef != none)
    {
        return NushiSporeCombatManagerResourceRef.IsLandOnAttackAsReplacementForFullPhysicalAttackAllowed();        
    }
    else
    {
        // End:0x63
        if(CurrentOrbitCombatMgrResourceRef != none)
        {
            return CurrentOrbitCombatMgrResourceRef.IsLandOnAttackAsReplacementForFullPhysicalAttackAllowed();
        }
    }
    return false;
    //return ReturnValue;    
}

event PublishNewAttackOptionToCombatManager()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float PublishersDesirabilityOfAttackScaler[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForceChoice[9437185], ReturnValue;

    1.0000000
    false
    // End:0x5A
    if(NushiSporeCombatManagerResourceRef != none)
    {
        return NushiSporeCombatManagerResourceRef.PublishNewAttackOption(self, TypeOfAttack, PublishersDesirabilityOfAttackScaler, bForceChoice);
    }
    return super.PublishNewAttackOptionToCombatManager(TypeOfAttack, PublishersDesirabilityOfAttackScaler, bForceChoice);
    //return ReturnValue;    
}

function NotifyCombatManagerOfAttackCompleted()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFailedToStart[8388609], bAllreadyAssumedCurrentAttackIsDone, bCleanOutAllAttackOptions;

    false
    false
    // End:0xB1
    if(NushiSporeCombatManagerResourceRef != none)
    {
        // End:0x52
        if(bFailedToStart)
        {
            NushiSporeCombatManagerResourceRef.NotifyOfAttackFailedToStart(self, TypeOfAttack);            
        }
        else
        {
            NushiSporeCombatManagerResourceRef.NotifyOfAttackCompleted(self, TypeOfAttack, bAllreadyAssumedCurrentAttackIsDone);
        }
        // End:0xB1
        if(bCleanOutAllAttackOptions)
        {
            NushiSporeCombatManagerResourceRef.CleanOutAllAttackOptions();
        }
    }
    super.NotifyCombatManagerOfAttackCompleted(TypeOfAttack, bAllreadyAssumedCurrentAttackIsDone, bCleanOutAllAttackOptions);
    //return;    
}

function NotifyCombatManagerOfStrikeCompleted()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];

    // End:0x38
    if(NushiSporeCombatManagerResourceRef != none)
    {
        NushiSporeCombatManagerResourceRef.NotifyOfStrikeActionCompleted(self, TypeOfAttack);
    }
    super.NotifyCombatManagerOfStrikeCompleted(TypeOfAttack);
    //return;    
}

function HasEnoughTimeExpiredBetweenStrikes()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfStrike[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(NushiSporeCombatManagerResourceRef != none)
    {
        return NushiSporeCombatManagerResourceRef.HasEnoughTimeExpiredBetweenStrikes(self, TypeOfStrike);
    }
    return super.HasEnoughTimeExpiredBetweenStrikes(TypeOfStrike);
    //return ReturnValue;    
}

function IsFullPhysicalAttackAllowed()
{
    local /*0x97E50000-0x00000000*/ private bool bAssumeCurrentAttackIsDone[9437185], ReturnValue;

    false
    // End:0x3F
    if(NushiSporeCombatManagerResourceRef != none)
    {
        return NushiSporeCombatManagerResourceRef.IsFullPhysicalAttackAllowed(self, bAssumeCurrentAttackIsDone);
    }
    return super.IsFullPhysicalAttackAllowed(bAssumeCurrentAttackIsDone);
    //return ReturnValue;    
}

function CmdRamAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[9437185], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[9437185], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    -1.0000000
    -1.0000000    
    CmdStatus_Strike
    0
    // End:0x4E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_NushiSporeRamAttackPoF'.static.InitCommand(self);
    myCommand = LPAICmd_NushiSporeRamAttackPoF(GetActiveCommand());
    // End:0x1B6
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

state WaitingToLaunch
{
    event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
    J0x00:
    // End:0x0F [Loop If]
    if(true)
    {
        Sleep(0.1000000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;                    
}

defaultproperties
{
    // Reference: LPAICmdStatus_Orbit'Default__LPAIControllerNushiSpore.LPAICmdStatus_Orbit0'
    begin object name=LPAICmdStatus_Orbit0
    end object
    CmdStatus_Orbit=LPAICmdStatus_Orbit0
    OrbitCombatMgrResourceName="NushiSporeOrbitEngagement"
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerNushiSpore.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerNushiSpore.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerNushiSpore.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerNushiSpore.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerNushiSpore.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerNushiSpore.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerNushiSpore.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerNushiSpore.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}