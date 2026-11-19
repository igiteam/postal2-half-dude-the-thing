class LPAICmd_PhadyrMelee extends LPAICmd_Melee within LPAIControllerPhadyr;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationMeleeAccess;

function Pushed()
{
    super.Pushed();
    StartCheckForMedRangeSlowPreyDownAttackTimer();
    // End:0x84
    if(Outer.PhadyrPawn.TuneDataPhadyr.bCanDoLongRangeLobAttack.GetValue() != float(0))
    {
        StartCheckForLongRangeLobAttackTimer();
    }
    //return;    
}

function Popped()
{
    super.Popped();
    StopCheckForMedRangeSlowPreyDownAttackTimer();
    StopCheckForLongRangeLobAttackTimer();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetDefaultAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.PhadyrPawn.TuneDataPhadyr.DefaultStrikeRange;
    //return ReturnValue;    
}

function GetStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    -1.0000000
    false
    super(LPAICommand).GetStrikeAccess(TheEnemy, RevokeTolerance, bForced);
    Outer.LockStrikeAccess(false);
    //return;    
}

function SetMeleeExtents()
{
    // End:0x89
    if(Outer.ShouldUseMeleeResource())
    {
        EnemyForAttack.AIResourceManager.GetResourceLocationExtents(Outer.MeleeResourceName, MeleePatternCenter, MeleePatternRadius);        
    }
    else
    {
        super.SetMeleeExtents();
    }
    //return;    
}

function ShouldAbortFlee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    GetStrikeAccess(EnemyForAttack);
    return Outer.HaveStrikeAccess() && HasAttackWaitTimerExpired();
    //return ReturnValue;    
}

function ManeuverForAttack()
{
    local /*0x97E50000-0x00000000*/ private float AttackSeperationMin[8388609], AttackSeperationMax;
    local /*0x97E50000-0x00000000*/ private @NULL FocusActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool CheckForStrikeAccess[9437185];
    local /*0x97E50000-0x00000000*/ private float Seperation;
    local /*0x97E50000-0x00000000*/ private @NULL ActorToFace;

    false
    Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
    MovingToActor = true;
    // End:0x315
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2D();
        // End:0x315
        if(Seperation > AttackSeperationMax)
        {
            ActorToFace = none;
            // End:0x142
            if(Seperation < Outer.PhadyrPawn.TuneDataPhadyr.RangeToStartAlwaysFacingTargetWhileMovingToIt.GetValue())
            {
                ActorToFace = EnemyForAttack;                
            }
            else
            {
                Outer.Focus = none;
            }
            MoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, ActorToFace, AttackSeperationMin + float(200), Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfManeuverForAttack);
            // End:0x258
            if(CheckForStrikeAccess)
            {
                MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;                
            }
            else
            {
                MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
            }
            MoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            MoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            MoveToActorCmd.bZeroVelocityOnFinish = false;
            IsManeuvering = true;
        }
    }
    IsManeuvering = false;
    //return;    
}

function LookForAttackOpportunityWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private float Seperation;

    // End:0x156
    if((IsMyEnemyAlive()) && !Outer.bPerformingAttack)
    {
        Seperation = EnemySeperation();
        // End:0x156
        if(Seperation < Outer.PhadyrPawn.TuneDataPhadyr.SeperationToStopMovingToSlotAndJustAttack.GetValue())
        {
            // End:0xF6
            if(MoveToActorCmd != none)
            {
                Outer.AbortCommand(MoveToActorCmd);
                MoveToActorCmd = none;
            }
            // End:0x139
            if(MoveToPositionCmd != none)
            {
                Outer.AbortCommand(MoveToPositionCmd);
                MoveToPositionCmd = none;
            }
            GotoStateWithEnemyCheck('StrikeWithClearence');
            StopLookForAttackOpportunityWhileMovingTimer();
        }
    }
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Outer.HandlePossiblityOfNeedingToTurtle(EnemyForAttack, HitCoreIndex, AmountOfDamage, TypeOfDamage);
    return false;
    //return ReturnValue;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Outer.HandlePossiblityOfNeedingToTurtle(EnemyForAttack, -1, AmountOfDamage, TypeOfDamage);
    return false;
    //return ReturnValue;    
}

final function StartCheckForMedRangeSlowPreyDownAttackTimer()
{
    // End:0x5D
    if(!Outer.bDisableAI && !IsCheckForMedRangeSlowPreyDownAttackTimerActive())
    {
        Outer.SetTimer(0.0400000, true, 'CheckForMedRangeSlowPreyDownAttackTimer', self);
    }
    //return;    
}

final function StopCheckForMedRangeSlowPreyDownAttackTimer()
{
    Outer.ClearTimer('CheckForMedRangeSlowPreyDownAttackTimer', self);
    //return;    
}

function PauseCheckForMedRangeSlowPreyDownAttackTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopCheckForMedRangeSlowPreyDownAttackTimer();        
    }
    else
    {
        StartCheckForMedRangeSlowPreyDownAttackTimer();
    }
    //return;    
}

final function IsCheckForMedRangeSlowPreyDownAttackTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('CheckForMedRangeSlowPreyDownAttackTimer', self);
    //return ReturnValue;    
}

private final function CheckForMedRangeSlowPreyDownAttackTimer()
{
    CheckForMedRangeSlowPreyDownAttack();
    //return;    
}

function HasEnoughTimePassedBetweenMedRangeSlowPreyDownAttacks()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x58
    if(Outer.WorldInfo.TimeSeconds > Outer.TimeAllowedNextMedRangeStrike)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsTherLosToTargetForMedRangeSlowPreyDownAttacks()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL locationOfBlockage;
    local /*0x97E50000-0x00000000*/ private editfixedsize array LosIgnoreActor;
    local /*0x97E50000-0x00000000*/ private bool bhasMedRgLos;
    local /*0x97E50000-0x00000000*/ private @NULL projLoc, projDir, projRot;

    Outer.PhadyrPawn.GetProjectileFirePositionAndRotation(projLoc, projDir, projRot);
    Outer.PhadyrPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, -1, -1, Outer.PhadyrPawn.TuneDataPhadyr.HieghtOffTargetPointForEndOfLobFireArc);
    LosIgnoreActor.AddItem(Outer.PhadyrPawn);    
    LosIgnoreActor.AddItem(EnemyForAttack);    
    bhasMedRgLos = Outer.LosTestForAttackLane(projLoc, Outer.PhadyrPawn.GetAimTargetPositionForRangedLobStrike(), Outer.PhadyrPawn.TuneDataPhadyr.RadiusOfCheckForMedRangeSlowPreyDownAttack.GetValue(), Outer.PhadyrPawn.TuneDataPhadyr.RadiusOfCheckForMedRangeSlowPreyDownAttack.GetValue(), locationOfBlockage, LosIgnoreActor);
    return bhasMedRgLos;
    //return ReturnValue;    
}

function CheckForMedRangeSlowPreyDownAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation;

    // End:0x2BD
    if((IsMyEnemyAlive()) && !Outer.bPerformingAttack)
    {
        // End:0x2BD
        if(HasEnoughTimePassedBetweenMedRangeSlowPreyDownAttacks())
        {
            Outer.LastTimeCheckedForMedRangeStrike = Outer.WorldInfo.TimeSeconds;
            Seperation = EnemySeperation();
            // End:0x2BD
            if((Seperation < Outer.PhadyrPawn.TuneDataPhadyr.MaxSeperationForMedRangeSlowPreyDownAttack.GetValue()) && Seperation > Outer.PhadyrPawn.TuneDataPhadyr.MinSeperationForMedRangeSlowPreyDownAttack.GetValue())
            {
                // End:0x2BD
                if(IsTherLosToTargetForMedRangeSlowPreyDownAttacks())
                {
                    Outer.PhadyrPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, -1, 0, Outer.PhadyrPawn.TuneDataPhadyr.HieghtOffTargetPointForEndOfLobFireArc);
                    Outer.CmdMedRangeAttackPof(EnemyForAttack, 1, 1, 200.0000000, 200.0000000, None, None, None, Outer.CmdStatus_PhadyrAttack, 1);
                }
            }
        }
    }
    return;
    //return;    
}

final function StartCheckForLongRangeLobAttackTimer()
{
    // End:0x5D
    if(!Outer.bDisableAI && !IsCheckForLongRangeLobAttackTimerActive())
    {
        Outer.SetTimer(0.0400000, true, 'CheckForLongRangeLobAttackTimer', self);
    }
    //return;    
}

final function StopCheckForLongRangeLobAttackTimer()
{
    Outer.ClearTimer('CheckForLongRangeLobAttackTimer', self);
    //return;    
}

function PauseCheckForLongRangeLobAttackTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopCheckForLongRangeLobAttackTimer();        
    }
    else
    {
        StartCheckForLongRangeLobAttackTimer();
    }
    //return;    
}

final function IsCheckForLongRangeLobAttackTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('CheckForLongRangeLobAttackTimer', self);
    //return ReturnValue;    
}

private final function CheckForLongRangeLobAttackTimer()
{
    CheckForLongRangeLobAttack();
    //return;    
}

function HasEnoughTimePassedBetweenLongRangeLobAttacks()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x58
    if(Outer.WorldInfo.TimeSeconds > Outer.TimeAllowedNextLongRangeStrike)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CheckForLongRangeLobAttack()
{
    local /*0x97E50000-0x00000000*/ private float Seperation;
    local /*0x97E50000-0x00000000*/ private int currentZoneIn;

    // End:0x291
    if((IsMyEnemyAlive()) && !Outer.bPerformingAttack)
    {
        // End:0x291
        if(HasEnoughTimePassedBetweenLongRangeLobAttacks())
        {
            Outer.LastTimeCheckedForLongRangeStrike = Outer.WorldInfo.TimeSeconds;
            Seperation = EnemySeperation();
            // End:0x291
            if((Seperation < Outer.PhadyrPawn.GetMaxLongRangeLobStrikeRange()) && Seperation > Outer.PhadyrPawn.GetMinLongRangeLobStrikeRange())
            {
                // End:0x291
                if(Outer.IsThereAClearLobAttackLaneFromCurrentLocation(EnemyForAttack, 0, currentZoneIn))
                {
                    Outer.PhadyrPawn.SetAimInfoForRangedLobStrike(EnemyForAttack.Location, EnemyForAttack, -1, 0, Outer.PhadyrPawn.TuneDataPhadyr.HieghtOffTargetPointForEndOfLobFireArc);
                    Outer.CmdLongRangeBurnLobAttackPof(EnemyForAttack, 1, 1, 200.0000000, 200.0000000, None, None, None, Outer.CmdStatus_PhadyrAttack, 1);
                }
            }
        }
    }
    return;
    //return;    
}

function FleeFromEnemy()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom;
    local /*0x97E50000-0x00000000*/ private @NULL Cmd;
    local /*0x97E50000-0x00000000*/ private float FleeDistance;

    FleeDistance = Outer.PhadyrPawn.TuneDataPhadyr.FleeDistance.GetValue();
    FleeFrom.AddItem(EnemyForAttack);    
    Cmd = Outer.CmdFlee(60.0000000, FleeDistance * float(10), FleeDistance, FleeFrom, 1);
    Cmd.__FleeAbortDelegate__Delegate = ShouldAbortFlee;
    //return;    
}

state StrikeWithClearence
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super.BeginState(PrevStateName);
        Outer.PawnZeroVelocity();
        //return;        
    }
    stop;    
}

state WaitForClearence
{Begin:

    Outer.PawnZeroVelocity();
    J0x1F:

    // End:0x93 [Loop If]
    if(!Outer.HaveStrikeAccess() || !HasAttackWaitTimerExpired())
    {
        FleeFromEnemy();
        Outer.Sleep(0.0010000);
        GetStrikeAccess(EnemyForAttack);
        // [Loop Continue]
        goto J0x1F;
    }
    GotoStateWithEnemyCheck('BeginStrike');
    stop;        
}

defaultproperties
{
    MinAttackRange=100.0000000
    MaxAttackRange=150.0000000
}