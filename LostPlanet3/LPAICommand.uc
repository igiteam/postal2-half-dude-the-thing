class LPAICommand extends SPKyAICommand within LPAIController
    abstract;

enum eAiAttackType
{
    eAiAttackType_None,             // 0
    eAiAttackType_LongRangeLobAttack,// 1
    eAiAttackType_MedRangeLobAttack,// 2
    eAiAttackType_ShortRangeLobAttack,// 3
    eAiAttackType_LongRangeDirectFireAttack,// 4
    eAiAttackType_MedRangeDirectFireAttack,// 5
    eAiAttackType_ShortRangeDirectFireAttack,// 6
    eAiAttackType_LongRangeBurstFireAttack,// 7
    eAiAttackType_MedRangeBurstFireAttack,// 8
    eAiAttackType_ShortRangeBurstireAttack,// 9
    eAiAttackType_LongRangeConstFireAttack,// 10
    eAiAttackType_MedRangeConstFireAttack,// 11
    eAiAttackType_ShortRangeConstFireAttack,// 12
    eAiAttackType_FullPhysicalAttack,// 13
    eAiAttackType_ReactionPhysicalAttack,// 14
    eAiAttackType_StrugglePhysicalAttack,// 15
    eAiAttackType_DashAttack,       // 16
    eAiAttackType_ReactionClawSwipe,// 17
    eAiAttackType_DirectAttack,     // 18
    eAiAttackType_Feint,            // 19
    eAiAttackType_Maul,             // 20
    eAiAttackType_Ram,              // 21
    eAiAttackType_TailSwipeAttack,  // 22
    eAiAttackType_TailThrust,       // 23
    eAiAttackType_MAX               // 24
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CmdStatus[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PreviousFocus[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyController[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsInInterruptibleSection[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bInterruptible[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeSlotsDisabled[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRangedSlotsDisabled[536870913];

// Export ULPAICommand::execIsAnotherNonInterruptibleCommandActive(FFrame&, void* const)
native final function IsAnotherNonInterruptibleCommandActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAICommand::execIsInterruptible(FFrame&, void* const)
native final function IsInterruptible()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAICommand::execGetCurrentStateName(FFrame&, void* const)
native function GetCurrentStateName()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];


}

// Export ULPAICommand::execIsVitalSuitAtLocation(FFrame&, void* const)
native function IsVitalSuitAtLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[25296897];
    local /*0x97E50000-0x00000000*/ private float Radius[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Requester[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPAICommand::execLosTestForPawn(FFrame&, void* const)
protected native static function LosTestForPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL From[8388609], To;
    local /*0x97E50000-0x00000000*/ private float Radius[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array IgnoreActors[26345473], IgnoreActorsClasses;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    0.0000000                                    
}

// Export ULPAICommand::execLosTestForActor(FFrame&, void* const)
private native static final function LosTestForActor()
{
    local /*0x97E50000-0x00000000*/ private int TraceFlags[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL From[8388609], To;
    local /*0x97E50000-0x00000000*/ private float Radius[9437185];
    local /*0x97E50000-0x00000000*/ private editfixedsize array IgnoreActors[26345473], IgnoreActorsClasses;
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    0.0000000                                        
}

function LPAICmd_Status()
{
    local /*0x97E50000-0x00000000*/ private byte NewStatus[8388609];

    // End:0x62
    if((CmdStatus != none) && int(CmdStatus.Cmd_Error) < int(1))
    {
        CmdStatus.Cmd_Error = NewStatus;
    }
    //return;    
}

function LPAICmd_Status_HasFailed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(CmdStatus != none)
    {
        return int(CmdStatus.Cmd_Error) == int(1);        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

event LosTestForActorFilter()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return HitActor != none;
    //return ReturnValue;    
}

event LPCommandTick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    //return;    
}

function Pushed()
{
    super(SPAICommand).Pushed();
    PreviousFocus = Outer.Focus;
    MyController = Outer;
    MyPawn = MyController.myAIPawn;
    bIsInInterruptibleSection = true;
    // End:0xA9
    if(bInterruptible == false)
    {
        Outer.PauseThinkTimer(true);
    }
    GotoState('StateCmdActive');
    //return;    
}

function Popped()
{
    local /*0x97E50000-0x00000000*/ private bool IsObjectiveCommand;

    IsObjectiveCommand = MySPAIObjective != none;
    super(SPAICommand).Popped();
    // End:0x82
    if(Outer.myAIPawn.Health > 0)
    {
        Outer.PawnLookAtActor(PreviousFocus);
    }
    // End:0xFC
    if(!IsAnotherNonInterruptibleCommandActive())
    {
        bIsInInterruptibleSection = true;
        // End:0xF9
        if(Outer.myAIPawn.Health > 0)
        {
            Outer.PauseThinkTimer(false);            
        }        
    }
    // End:0x114
    if(IsObjectiveCommand)
    {
        DealWith_NeedsToPossiblyChangeEnemiesBecauseOfPawnChangeOnEndOfCommittedBehavior_Crap();
    }
    //return;    
}

event GetHumanReadableName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return string(Name);
    //return ReturnValue;    
}

final function SetInterruptible()
{
    local /*0x97E50000-0x00000000*/ private bool bCanInterrupt[8388609], bEndingCommand;

    false
    // End:0xCD
    if(bInterruptible)
    {
        // End:0x6B
        if(bCanInterrupt != bIsInInterruptibleSection)
        {
            bIsInInterruptibleSection = bCanInterrupt;
            Outer.PauseThinkTimer(!bCanInterrupt);
        }
        // End:0xCD
        if((bCanInterrupt && Outer.bNeedsToPossiblyChangeEnemiesBecauseOfPawnChangeOnEndOfCommittedBehavior) && !bEndingCommand)
        {
            Outer.PopCommand(self);
        }
    }
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super(GameAICommand).Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super(GameAICommand).Resumed(OldCommandName);
    DealWith_NeedsToPossiblyChangeEnemiesBecauseOfPawnChangeOnEndOfCommittedBehavior_Crap(OldCommandName);
    //return;    
}

function DealWith_NeedsToPossiblyChangeEnemiesBecauseOfPawnChangeOnEndOfCommittedBehavior_Crap()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[9437185];

    'None'
    // End:0xAB
    if(Outer.bNeedsToPossiblyChangeEnemiesBecauseOfPawnChangeOnEndOfCommittedBehavior)
    {
        // End:0xAB
        if(bInterruptible)
        {
            // End:0xA8
            if(bIsInInterruptibleSection)
            {
                Outer.ReleaseAdHocSquadMgrAccess();
                Outer.RemoveThisTargetAndForceObjectiveUpdate(Outer.MyLPEnemy);                
            }            
        }
    }
    //return;    
}

static function InitCommand()
{
    local /*0x97E50000-0x00000000*/ private @NULL AI[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(GameAICommand).InitCommand(AI);
    //return ReturnValue;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    CmdStatus = ReturnStatus;
    // End:0x41
    if(CmdStatus != none)
    {
        CmdStatus.SetDefaults();
    }
    //return;    
}

function GetCommand()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPAICommand(ChildCommand);
    //return ReturnValue;    
}

function OverrideDamageReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL DM[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x47
    if((ChildCommand != none) && LPAICommand(ChildCommand).OverrideDamageReaction(DM))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsKynapseReady()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4D
    if(Outer.Kynapse_BotHasBeenCreated() && Outer.myAIPawn != none)
    {
        return true;        
    }
    else
    {
        return false;
    }
    //return ReturnValue;    
}

function NotifyCurrentTakeDamageWillShutdownVsOpponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL VsGoingToShutdown[8388609];
    local /*0x97E50000-0x00000000*/ private float NewDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myChildCommand;

    myChildCommand = LPAICommand(ChildCommand);
    // End:0x5C
    if(myChildCommand != none)
    {
        myChildCommand.NotifyCurrentTakeDamageWillShutdownVsOpponent(VsGoingToShutdown, NewDamage);
    }
    //return;    
}

function DrawAttackArcs()
{
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, myChildCommand;

    myChildCommand = LPAICommand(ChildCommand);
    // End:0x6E
    if(myChildCommand != none)
    {
        myChildCommand.Touch(Other, OtherComp, HitLocation, HitNormal);
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal, myChildCommand;

    myChildCommand = LPAICommand(ChildCommand);
    // End:0x65
    if(myChildCommand != none)
    {
        myChildCommand.Bump(Other, OtherComp, HitNormal);
    }
    //return;    
}

simulated event Landed()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor, myChildCommand;

    myChildCommand = LPAICommand(ChildCommand);
    // End:0x5C
    if(myChildCommand != none)
    {
        myChildCommand.Landed(HitNormal, FloorActor);
    }
    //return;    
}

simulated function @NULL HitWall()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp, myChildCommand;

    myChildCommand = LPAICommand(ChildCommand);
    // End:0x65
    if(myChildCommand != none)
    {
        myChildCommand.HitWall(HitNormal, Wall, WallComp);
    }
    //return;    
}

simulated event @NULL RigidBodyCollision()
{
    local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
    local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myChildCommand;

    myChildCommand = LPAICommand(ChildCommand);
    // End:0x6E
    if(myChildCommand != none)
    {
        myChildCommand.RigidBodyCollision(HitComponent, OtherComponent, RigidCollisionData, ContactIndex);
    }
    //return;    
}

event NotifyStrikeAccessAvailable()
{
    local /*0x97E50000-0x00000000*/ private @NULL LastUser[8388609];

    //return;    
}

event HandleAnimNotifyDamageSmartActor()
{
    //return;    
}

event HandleAnimNotifyDamageSmartActorRanged()
{
    //return;    
}

function NotifyFormationLocationBecomingInvalid()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocBecomingInvalid[8388609];

    //return;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CanFollowerBeGivingThisTypeOfAttack()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bcanBeGiving;
    local /*0x97E50000-0x00000000*/ private @NULL myChildCommand;

    bcanBeGiving = true;
    myChildCommand = LPAICommand(ChildCommand);
    // End:0x6A
    if(myChildCommand != none)
    {
        bcanBeGiving = myChildCommand.CanFollowerBeGivingThisTypeOfAttack(TypeOfAttack);
    }
    return bcanBeGiving;
    //return ReturnValue;    
}

function OnEngagementAttackOptionPurged()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];

    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event NotifyOfSpecialMoveAnimtionComplete()
{
    local /*0x97E50000-0x00000000*/ private class SM_TypeAnimDoneFor[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    //return;    
}

function NotifyPlayerStartMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x41
    if(ChildCommand != none)
    {
        return LPAICommand(ChildCommand).NotifyPlayerStartMelee(PlayerPawn);
    }
    return false;
    //return ReturnValue;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4A
    if(ChildCommand != none)
    {
        return LPAICommand(ChildCommand).NotifyPlayerMeleeHit(PlayerPawn, ImpactLocation);
    }
    return false;
    //return ReturnValue;    
}

function NotifyPreActiveDefenseSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL CombatWindow[25296897], Activator;

    //return;    
}

function CanActiveDefense()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function NotifyBearTrapped()
{
    // End:0x37
    if(ChildCommand != none)
    {
        LPAICommand(ChildCommand).NotifyBearTrapped();
    }
    //return;    
}

event NotifyOfDangerousAmountOfDamage()
{
    //return;    
}

event NotifyGettingGrabbed()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event NotifyWinchProjectileFire()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609], WinchProj;

    //return;    
}

event NotifyWinchProjectileRetracting()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];

    //return;    
}

event NotifyVsMeleeSwingStart()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];

    //return;    
}

event NotifyVsMeleeSwingEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL InVsPawn[8388609];

    //return;    
}

function NotifyToMassRetreat()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThingToRetreatFrom[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    //return;    
}

event ImpactCombatTargetHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private name ImpactSocketName[8388609];
    local /*0x97E50000-0x00000000*/ private float ImpactRadius[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];

    //return;    
}

function NotifyTraceDamagePartHitSomething()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private int AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609];

    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];

    //return;    
}

event NotifyThatSpecialDodgeReady()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];

    //return;    
}

event HandleAnimNotifyMeleeStrikeBegin()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array GroupClass[8388609];
    local /*0x97E50000-0x00000000*/ private byte MomentumHint[8388609];

    super(SPAICommand).HandleAnimNotifyMeleeStrikeBegin(GroupClass, MomentumHint);
    //return;    
}

event HandleAnimNotifyMeleeStrikeEnd()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array GroupClass[8388609];

    super(SPAICommand).HandleAnimNotifyMeleeStrikeEnd(GroupClass);
    //return;    
}

simulated event NotifyStopPawnChoreography()
{
    //return;    
}

event SPAborted()
{
    // End:0x2E
    if(MySPAIObjective != none)
    {
        MySPAIObjective.OnCommandAborted();
    }
    //return;    
}

event Stunned()
{
    //return;    
}

event CoreDestroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];

    //return;    
}

event HandleDismemberment()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function NotfiyEnemyChangedPawns()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnSwitchingFrom[8388609], PawnSwitchingTo;

    //return;    
}

function GetMeleeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0x1A6
    if(!bMeleeSlotsDisabled)
    {
        // End:0x1A3
        if(Outer.ShouldUseMeleeResource() && !Outer.HaveMeleeAccess())
        {
            // End:0x1A3
            if(((TheEnemy != none) && TheEnemy.AIResourceManager != none) && TheEnemy.AIResourceManager.IsUsable(Outer.MeleeResourceName, Outer.myAIPawn))
            {
                Outer.MeleeAccess = TheEnemy.AIResourceManager.GetAccess(Outer.MeleeResourceName, Outer.myAIPawn, RevokeTolerance);
            }
        }        
    }
    else
    {
        Outer.ReleaseMeleeAccess();
        Outer.MeleeAccess = none;
    }
    Outer.bMeleePointMoved = false;
    //return;    
}

function DisableMeleeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bDisable[8388609];

    // End:0x5A
    if(bDisable != bMeleeSlotsDisabled)
    {
        // End:0x45
        if(bDisable)
        {
            Outer.ReleaseMeleeAccess();
        }
        bMeleeSlotsDisabled = bDisable;
    }
    //return;    
}

function IsThereRangedAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x88
    if((TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        return TheEnemy.AIResourceManager.HasResource(Outer.RangedResourceName);
    }
    return false;
    //return ReturnValue;    
}

function GetRangedAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0x1A5
    if((!bRangedSlotsDisabled && Outer.ShouldUseRangedResource()) && !Outer.HaveRangedAccess())
    {
        // End:0x1A5
        if(((TheEnemy != none) && TheEnemy.AIResourceManager != none) && TheEnemy.AIResourceManager.IsUsable(Outer.RangedResourceName, Outer.myAIPawn))
        {
            Outer.RangedAccess = TheEnemy.AIResourceManager.GetAccess(Outer.RangedResourceName, Outer.myAIPawn, RevokeTolerance);
        }
    }
    Outer.bRangedPointMoved = false;
    //return;    
}

function DisableRangedAccess()
{
    local /*0x97E50000-0x00000000*/ private bool bDisable[8388609];

    // End:0x5A
    if(bDisable != bRangedSlotsDisabled)
    {
        // End:0x45
        if(bDisable)
        {
            Outer.ReleaseRangedAccess();
        }
        bRangedSlotsDisabled = bDisable;
    }
    //return;    
}

function GetStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    -1.0000000    
    // End:0x12B
    if(((Outer.ShouldUseStrikeResource() && !Outer.HaveStrikeAccess()) && TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        Outer.StrikeAccess = TheEnemy.AIResourceManager.GetAccess(Outer.StrikeResourceName, Outer.myAIPawn, RevokeTolerance, bForced);
    }
    //return;    
}

function IsStrikeAccessPossible()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Res;

    // End:0x26
    if(!Outer.ShouldUseStrikeResource())
    {
        return true;
    }
    // End:0x4A
    if(Outer.HaveStrikeAccess())
    {
        return false;
    }
    // End:0x81
    if((TheEnemy == none) || TheEnemy.AIResourceManager == none)
    {
        return true;
    }
    Res = TheEnemy.AIResourceManager.GetResource(Outer.StrikeResourceName);
    // End:0xEE
    if(Res == none)
    {
        return true;
    }
    return Res.IsAccessPossible(Outer.myAIPawn);
    //return ReturnValue;    
}

function RequestStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    GetStrikeAccess(TheEnemy);
    return Outer.HaveStrikeAccess();
    //return ReturnValue;    
}

function GetFeintAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0x121
    if(((Outer.ShouldUseFeintResource() && !Outer.HaveFeintAccess()) && TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        Outer.StrikeAccess = TheEnemy.AIResourceManager.GetAccess(Outer.FeintResourceName, Outer.myAIPawn, RevokeTolerance);
    }
    //return;    
}

function IsAnyChildEngagedInCommittedBehavior()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;
    local /*0x97E50000-0x00000000*/ private bool bengagedInCommittedBehavior;

    bengagedInCommittedBehavior = false;
    curCommand = LPAICommand(ChildCommand);
    J0x28:

    // End:0x9B [Loop If]
    if(curCommand != none)
    {
        // End:0x67
        if(!curCommand.IsInterruptible())
        {
            bengagedInCommittedBehavior = true;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x28;
    }
    return bengagedInCommittedBehavior;
    //return ReturnValue;    
}

protected function TriggerStrikeEvent()
{
    Outer.myAIPawn.TriggerEventClass(Class'LPSeqEvent_AIMeleeStrike', Outer.myAIPawn);
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609];

    //return;    
}

function CurTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return MyPawn.WorldInfo.TimeSeconds;
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super(SPStateObject).BeginState(PreviousState);
        // End:0x43
        if(CmdStatus != none)
        {
            CmdStatus.Cmd_Error = 0;
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    bIsInInterruptibleSection=true
    bInterruptible=true
}