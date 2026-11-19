class LPAIControllerBurrower extends LPAIControllerAkridSmall
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BurrowerPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStartAsBearTrap;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bObjectiveBearTrapGenerated;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentCombatManagerAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentCombatManagerResourceRef;

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super(LPAIControllerAkrid).Possess(inPawn, bVehicleTransition);
    BurrowerPawn = LPAIPawnBurrower(inPawn);
    //return;    
}

event UnPossess()
{
    // End:0x39
    if(CurrentCombatManagerResourceRef != none)
    {
        CurrentCombatManagerResourceRef.RetractAllOptionsForThisPublisher(self);
        ReleaseCombatEngagementAccess();
    }
    super(LPAIController).UnPossess();
    //return;    
}

event Destroyed()
{
    // End:0x39
    if(CurrentCombatManagerResourceRef != none)
    {
        CurrentCombatManagerResourceRef.RetractAllOptionsForThisPublisher(self);
        ReleaseCombatEngagementAccess();
    }
    super(LPAIController).Destroyed();
    //return;    
}

function SetAttackResourceNames()
{
    MeleeResourceName = 'BurrowerMelee';
    StrikeResourceName = 'BurrowerStrike';
    StruggleResourceName = 'Struggle';
    //return;    
}

function SetAttackVSResourceNames()
{
    MeleeResourceName = 'BurrowerMelee';
    StrikeResourceName = 'BurrowerStrikeVS';
    StruggleResourceName = 'None';
    //return;    
}

event ShouldKynapseDynamicallyAvoid()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x29
    if((PawnIsUnderground()) && LPAIPawnBurrower(Obstacle) == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL MeleePawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float DamageMin, DamageMax, Damage;
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;

    AbortCommand(CommandList);
    PlayerPawn = LPPlayerPawn(MeleePawn);
    BurrowerPawn.ServerKnockDownMelee(PlayerPawn, ImpactLocation);
    PlayerPawn.ImpactCombatTargetPlayEffects(BurrowerPawn, Class'LPDamageTypeMelee');
    DamageMin = PlayerPawn.TuneDataPlayerPawn.MeleeDamageMin.GetValue();
    DamageMax = PlayerPawn.TuneDataPlayerPawn.MeleeDamageMax.GetValue();
    Damage = RandRange(DamageMin, DamageMax) * BurrowerPawn.TuneDataBurrower.PercentageDamagePlayerMelee;
    BurrowerPawn.TakeDamage(int(Damage), PlayerPawn.Controller, ImpactLocation, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypeMelee');
    return true;
    //return ReturnValue;    
}

function NotifyBearTrapped()
{
    local /*0x97E50000-0x00000000*/ private @NULL MainCommand;

    MainCommand = LPAICommand(CommandList);
    MainCommand.NotifyBearTrapped();
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

    // End:0xA2 [Loop If]
    if(curCommand != none)
    {
        // End:0x6E
        if(curCommand.OnEngagementAttackOptionApproved(TypeOfAttack))
        {
            attackShouldStart = true;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x28;
    }
    return attackShouldStart;
    //return ReturnValue;    
}

function GetCurrentAttackDesirabilityScaler()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL possibleEnemy;
    local /*0x97E50000-0x00000000*/ private float attackScaler;

    possibleEnemy = LPPawn(TargetOfAttack);
    attackScaler = 1.0000000;
    // End:0xA5
    if(possibleEnemy != none)
    {
        // End:0x6E
        if(possibleEnemy.InStruggleMode)
        {
            attackScaler = -1.0000000;            
        }
        else
        {
            // End:0x96
            if(IsEnemyInAttackArc(possibleEnemy))
            {
                attackScaler = 10.0000000;                
            }
            else
            {
                attackScaler = 1.0000000;
            }
        }
    }
    return attackScaler;
    //return ReturnValue;    
}

function HaveCombatEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (CanBeMyEnemy(InEnemy)) && IsCurrentCombatEngagementAccessForThisEnemy(InEnemy);
    //return ReturnValue;    
}

function ReleaseCombatEngagementAccess()
{
    // End:0x44
    if(CurrentCombatManagerAccess != none)
    {
        CurrentCombatManagerAccess.Destroy();
        CurrentCombatManagerAccess = none;
        CurrentCombatManagerResourceRef = none;
    }
    //return;    
}

function IsCurrentCombatEngagementAccessForThisEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x9A
    if(CurrentCombatManagerAccess != none)
    {
        // End:0x65
        if(CurrentCombatManagerAccess.GetOuterActor() == InEnemy)
        {
            // End:0x62
            if(!CurrentCombatManagerAccess.IsDestroyed())
            {
                return true;
            }            
        }
        else
        {
            CurrentCombatManagerAccess.Destroy();
            CurrentCombatManagerAccess = none;
            CurrentCombatManagerResourceRef = none;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetCombatEngagementAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0xAB
    if(!HaveCombatEngagementAccess(InEnemy))
    {
        CurrentCombatManagerAccess = InEnemy.AIResourceManager.GetAccess('BurrowerCombatManager', myAIPawn);
        // End:0xAB
        if(CurrentCombatManagerAccess != none)
        {
            CurrentCombatManagerResourceRef = LPAIResBurrowerCombatManager(CurrentCombatManagerAccess.GetResource());
        }
    }
    //return;    
}

function OnEngagementAttackOptionPurged()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    J0x1C:

    // End:0x87 [Loop If]
    if(curCommand != none)
    {
        curCommand.OnEngagementAttackOptionPurged(TypeOfAttack);
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x1C;
    }
    //return;    
}

function SpawnBearTrappedBurrower()
{
    local /*0x97E50000-0x00000000*/ private @NULL SpawnLocation[8388609], ReturnValue, RotOnlyYaw, ActorSpawned;

    RotOnlyYaw = rot(0, 0, 0);
    ActorSpawned = SpawnActor(FactoryAI, "LostPlanetGameContent.LPAIPawnBurrowerContent", "LostPlanetGameContent.LPAIControllerBurrowerBearTrapContent", SpawnLocation, RotOnlyYaw, true);
    return ActorSpawned;
    //return ReturnValue;    
}

function PawnUnderground()
{
    local /*0x97E50000-0x00000000*/ private bool bUnderground[8388609];

    BurrowerPawn.GoUnderground(bUnderground);
    //return;    
}

function PawnIsUnderground()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return BurrowerPawn.IsUnderground();
    //return ReturnValue;    
}

function PawnBearTrap()
{
    local /*0x97E50000-0x00000000*/ private bool bBearTrap[8388609];

    BurrowerPawn.GoBearTrap(bBearTrap);
    //return;    
}

function CmdBurrowerJumpBiteStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_BurrowerJumpBiteStrike'.static.InitCommand(self);
    myCommand = LPAICmd_BurrowerJumpBiteStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBurrowerJump()
{
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    1
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_BurrowerJump'.static.InitCommand(self);
    myCommand = LPAICmd_BurrowerJump(GetActiveCommand());
    return myCommand;
    //return ReturnValue;    
}

function CmdBurrowerStrugglePofStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_BurrowerStrugglePofStrike'.static.InitCommand(self);
    myCommand = LPAICmd_BurrowerStrugglePofStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPActorFactoryAI'Default__LPAIControllerBurrower.DefaultActorFactory'
    begin object name=DefaultActorFactory class=Class'LPActorFactoryAI'
    end object
    FactoryAI=DefaultActorFactory
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerBurrower.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerBurrower.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerBurrower.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerBurrower.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerBurrower.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerBurrower.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes=/* Array type was not detected. */
    // Reference: SPAIReactionManager'Default__LPAIControllerBurrower.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerBurrower.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    bUseVisibilityManager=false
    Components[0]=LPAIObjectiveManager0
}