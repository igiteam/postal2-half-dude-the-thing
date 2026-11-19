class LPAICmd_DongoMeleePof extends LPAICmd_CrabMeleePof within LPAIControllerDongo;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MoveToStrikeEndTime;

function Pushed()
{
    super.Pushed();
    Outer.bIgnoreStunCommands = false;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.bIgnoreStunCommands = false;
    Outer.DongoPawn.SetMaxSpeedScale(Outer.DongoPawn.TuneDataDongo.GetNormalMaxSpeedScale(Outer.DongoPawn));
    Outer.SetChargeCSA(false);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    Outer.SetChargeCSA(false);
    //return;    
}

function ShouldTauntAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5A
    if(int(Outer.LastCombatBehaviorAttempted) != int(4))
    {
        // End:0x5A
        if(HasTauntAttackWaitTimerExpired())
        {
            // End:0x5A
            if(Outer.HasEnoughDamageForTaunt())
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function IsEnemyPositionBlocked()
{
    local /*0x97E50000-0x00000000*/ private float Inradius[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    -1.0000000
    // End:0x4D
    if(!Outer.IsOnNavMesh(EnemyForAttack.Location))
    {
        return true;
    }
    // End:0x91
    if(Inradius <= float(0))
    {
        Inradius = Outer.MyKynapseRadius + MyEnemyRadius;
    }
    return IsPositionBlocked(EnemyForAttack.Location, Inradius);
    //return ReturnValue;    
}

function IsMyPositionBlockedForStartingCharge()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float Radius;

    // End:0x59
    if(!Outer.IsOnNavMesh(Outer.myAIPawn.Location))
    {
        return true;
    }
    Radius = Outer.MyKynapseRadius * 1.5000000;
    // End:0xD3
    if(IsPositionBlocked(Outer.myAIPawn.Location, Radius))
    {
        return true;
    }
    // End:0x12F
    if(!Outer.LineOfSightTo(EnemyForAttack, Outer.myAIPawn.Location, false))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IsPositionBlocked()
{
    local /*0x97E50000-0x00000000*/ private @NULL Position[8388609];
    local /*0x97E50000-0x00000000*/ private float Inradius[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FoundPawns;

    // End:0x18C
    if(Class'LPAIUtils'.static.GetPawnsAtLocation(FoundPawns, Position, Inradius))
    {
        I = 0;
        J0x48:

        // End:0x18C [Loop If]
        if(I < FoundPawns.Length)
        {
            // End:0x17E
            if(((((((FoundPawns[I] != none) && FoundPawns[I] != Outer.myAIPawn) && FoundPawns[I] != EnemyForAttack) && FoundPawns[I].Health > 0) && !FoundPawns[I].IsPendingKill()) && LPBaseVSPlayerPawn(FoundPawns[I]) == none) && LPAIPawnAkridSmall(FoundPawns[I]) == none)
            {
                return true;
            }
            ++I;
            // [Loop Continue]
            goto J0x48;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetMinSeperationFromEnemyToTryWithdraw()
{
    local /*0x97E50000-0x00000000*/ private bool bDismembered[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 5.0000000;
    //return ReturnValue;    
}

function GetChanceToTryWithdrawAndCharge()
{
    local /*0x97E50000-0x00000000*/ private bool Dismembered[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Chance;

    Chance = super.GetChanceToTryWithdrawAndCharge(Dismembered);
    // End:0x41
    if(Chance < float(0))
    {
        Chance = 1.0000000;        
    }
    else
    {
        // End:0x6B
        if(Chance > float(1))
        {
            Chance = Chance / float(100);
        }
    }
    return Chance;
    //return ReturnValue;    
}

function ShouldWithdrawForMassiveAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x49
    if(Outer.NumberOfAttackersFor(EnemyForAttack) < 1)
    {
        // End:0x49
        if(super(LPAICmd_CrabMelee).ShouldWithdrawForMassiveAttack())
        {
            return !IsEnemyPositionBlocked();
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldChargeEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2A
    if(super(LPAICmd_CrabMelee).ShouldChargeEnemy())
    {
        return !(IsEnemyPositionBlocked()) || IsMyPositionBlockedForStartingCharge();
    }
    return false;
    //return ReturnValue;    
}

function MoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(super(LPAICmd_Melee).MoveStrikeAbortCondition())
    {
        return true;
    }
    // End:0x52
    if(Outer.WorldInfo.TimeSeconds > MoveToStrikeEndTime)
    {
        return true;
    }
    // End:0x61
    if(ShouldBlitzAttack())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    -1.0000000
    false
    super(LPAICmd_CrabMelee).GetStrikeAccess(TheEnemy, RevokeTolerance, bForced);
    Outer.LockStrikeAccess(false);
    //return;    
}

function SetStrikeEndTime()
{
    local /*0x97E50000-0x00000000*/ private float Min, Max;

    Min = Outer.DongoPawn.TuneDataDongo.MinMoveToStrikeTime.GetValue();
    Max = Outer.DongoPawn.TuneDataDongo.MaxMoveToStrikeTime.GetValue();
    MoveToStrikeEndTime = Outer.WorldInfo.TimeSeconds + RandRange(Min, Max);
    //return;    
}

event NotifyStrikeAccessAvailable()
{
    local /*0x97E50000-0x00000000*/ private @NULL LastUser[8388609];

    //return;    
}

function CanDoPincerBash()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function OptionalResetTimersAtStart()
{
    //return;    
}

function StartNewCombatBehavior()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bResult;

    // End:0x38
    if(!Outer.HaveMeleeAccess())
    {
        GetMeleeAccess(EnemyForAttack);
    }
    bResult = super(LPAICmd_CrabMelee).StartNewCombatBehavior();
    return bResult;
    //return ReturnValue;    
}

function GetMinDistanceAwayToTryChargeAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Dist;

    Dist = Outer.DongoPawn.TuneDataDongo.MinDistanceAwayToTryChargeAttack_Tunable.GetValue();
    return Dist;
    //return ReturnValue;    
}

function ChanceToFrenzyAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Chance;

    Chance = Outer.DongoPawn.TuneDataDongo.FrenzyProbabilityAsPercentage.GetValue();
    // End:0x89
    if(Chance > float(100))
    {
        Chance = 1.0000000;
    }
    // End:0xAC
    if(Chance < float(0))
    {
        Chance = 0.0000000;        
    }
    else
    {
        Chance = Chance / float(100);
    }
    return Chance;
    //return ReturnValue;    
}

function ShouldFrenzyAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float chanceToAttack, randChoice, EnemyDist;

    // End:0x51
    if(Outer.DongoPawn.TuneDataDongo.bOnlyTauntAttack)
    {
        return true;        
    }
    else
    {
        // End:0xED
        if(Outer.DongoPawn.TuneDataDongo.bOnlyCQBAttack || Outer.DongoPawn.TuneDataDongo.bOnlyWithdrawAndCharge)
        {
            return false;
        }
    }
    EnemyDist = EnemySeperation();
    // End:0x16F
    if(EnemyDist < Outer.DongoPawn.TuneDataDongo.MinFrenzySeparation.GetValue())
    {
        return false;
    }
    // End:0x1DD
    if(EnemyDist > Outer.DongoPawn.TuneDataDongo.MaxFrenzySeparation.GetValue())
    {
        return false;
    }
    // End:0x25E
    if(int(Outer.LastCombatBehaviorAttempted) != int(5))
    {
        // End:0x25E
        if(HasFrenzyAttackWaitTimerExpired())
        {
            chanceToAttack = ChanceToFrenzyAttack();
            randChoice = RandRange(0.0000000, 1.0000000);
            // End:0x25E
            if(randChoice <= chanceToAttack)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

state Stalk
{
    function DongoCanContinueStalk()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x4D
        if((!IsMyEnemyAlive() || Outer.HaveStrikeAccess()) || IsStrikeAccessPossible(EnemyForAttack))
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function ProceeduralStalk_CanContinue()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x18
        if(super.ProceeduralStalk_CanContinue())
        {
            return DongoCanContinueStalk();
        }
        return false;
        //return ReturnValue;        
    }

    function StaticStalk_CanContinue()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x18
        if(super.StaticStalk_CanContinue())
        {
            return DongoCanContinueStalk();
        }
        return false;
        //return ReturnValue;        
    }

    function GetNextSubPosIndex()
    {
        local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL Res;

        // End:0xEA
        if(Outer.HaveMeleeAccess())
        {
            // End:0xEA
            if(Outer.FindOtherChargingDongo(EnemyForAttack) != none)
            {
                Res = LPAIResMultiLocation(Outer.MeleeAccess.GetResource());
                return Res.GetNearestWorldPositionIndex(Outer.myAIPawn.Location);
            }
        }
        return super.GetNextSubPosIndex();
        //return ReturnValue;        
    }

    function PostStalkToNextPosition()
    {
        super.PostStalkToNextPosition();
        // End:0x70
        if(!Outer.HaveStrikeAccess() || IsStrikeAccessPossible(EnemyForAttack))
        {
            Outer.CmdDongoTauntDuringStalk(EnemyForAttack);
        }
        //return;        
    }

    event NotifyStrikeAccessAvailable()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LastUser[8388609];

        // End:0x66
        if((MoveToPositionCmd != none) && LastUser != Outer.DongoPawn)
        {
            Outer.AbortCommand(MoveToPositionCmd);
        }
        //return;        
    }

    function ShouldFaceEnemyWhileMovingToSlot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function ProceeduralStalk_Start()
    {
        super.ProceeduralStalk_Start();
        Outer.DongoPawn.SetMaxSpeedScale(Outer.DongoPawn.TuneDataDongo.GetNormalMaxSpeedScale(Outer.DongoPawn));
        //return;        
    }

    function ProceeduralStalk_Stop()
    {
        super.ProceeduralStalk_Stop();
        Outer.DongoPawn.SetMaxSpeedScale(Outer.DongoPawn.TuneDataDongo.GetNormalMaxSpeedScale(Outer.DongoPawn));
        //return;        
    }

    function StaticStalk_Start()
    {
        super.StaticStalk_Start();
        Outer.DongoPawn.SetMaxSpeedScale(Outer.DongoPawn.TuneDataDongo.GetNormalMaxSpeedScale(Outer.DongoPawn));
        //return;        
    }

    function StaticStalk_Stop()
    {
        super.StaticStalk_Stop();
        Outer.DongoPawn.SetMaxSpeedScale(Outer.DongoPawn.TuneDataDongo.GetNormalMaxSpeedScale(Outer.DongoPawn));
        //return;        
    }
    stop;    
}

state MoveToMeleeSlot
{
    function ShouldFaceEnemyWhileMovingToSlot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
    stop;    
}

state WithdrawForChargeAtEnemy
{
    function CanRestartBehavioursAfterWithdarAndCharge()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }
    stop;    
}

state ContinueStrike
{
    function DongoShouldMoveCloser()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(HasAttackWaitTimerExpired())
        {
            return true;
        }
        // End:0x44
        if((EnemySeperation2D()) > (Outer.MyKynapseRadius * float(3)))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = EnemyForAttack;
    J0x28:

    // End:0x155 [Loop If]
    if(!HasAttackWaitTimerExpired())
    {
        J0x37:

        // End:0x135 [Loop If]
        if(!DongoShouldMoveCloser())
        {
            // End:0xF1
            if(!Outer.HaveStrikeAccess())
            {
                // End:0xC1
                if(!Outer.bDoOnlyForcedDirectAttack)
                {
                    Outer.Sleep(0.0010000);
                    GotoStateWithEnemyCheck('GetMeleeFormationClearence');                    
                }
                else
                {
                    Outer.Sleep(0.0010000);
                    GotoStateWithEnemyCheck('WaitForClearence');
                }
            }
            Outer.CmdTurnToFaceFocus(0);
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x37;
        }
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x28;
    }
    Outer.Sleep(0.0000000);
    SetStrikeEndTime();
    GotoStateWithEnemyCheck('MoveToAttackRangeWithClearence');
    stop;                    
}

state BeginStrike
{Begin:

    ConsiderStartingNewCombatBehavior();
    // End:0x2B
    if(int(NextCombatBehaviorDesired) != int(1))
    {
        StartNewCombatBehavior();        
    }
    else
    {
        SetStrikeEndTime();
        GotoStateWithEnemyCheck('MoveToAttackRangeWithClearence');
    }
    stop;                
}

state StrikeWithClearence
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PrevStateName[8388609];

        super.BeginState(PrevStateName);
        // End:0x4B
        if(!Outer.HaveMeleeAccess())
        {
            GetMeleeAccess(EnemyForAttack);
        }
        Outer.DongoPawn.ZeroMovementVariables();
        //return;        
    }
    stop;    
}

state FrenzyAttack
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        ResetFrenzyAttackWaitTimer();
        SetLastCombatBehaviorAttempted();
        Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        ResetFrenzyAttackWaitTimer();
        SetLastCombatBehaviorAttempted();
        Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
        //return;        
    }
Begin:

    // End:0x4D
    if(Outer.HaveStrikeAccess())
    {
        Outer.CmdDongoFrenzyStrike(EnemyForAttack,, 1);
    }
    Outer.Sleep(0.0000000);
    // End:0xCF
    if(Outer.DongoPawn.TuneDataDongo.bChargeAfterFrenzy)
    {
        NextCombatBehaviorDesired = 2;
        StartNewCombatBehavior();        
    }
    else
    {
        GotoStateWithEnemyCheck('MoveCloserToEnemy');
    }
    stop;        
}

state TauntAttack
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super.PushedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        ResetTauntAttackWaitTimer();
        Outer.ResetDamageNonCore();
        SetInterruptible(true, true);
        Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        ResetTauntAttackWaitTimer();
        Outer.ResetDamageNonCore();
        Outer.myAIPawn.SetMaxSpeedScale(Outer.myAIPawn.TuneDataAIPawn.GetNormalMaxSpeedScale(Outer.myAIPawn));
        //return;        
    }
Begin:

    Outer.ReleaseStrikeAccess();
    SetInterruptible(false);
    Outer.CmdDongoShortTaunt(EnemyForAttack);
    Outer.Sleep(0.0000000);
    GotoStateWithEnemyCheck('StateCmdActive');
    stop;            
}

defaultproperties
{
    StrikeTimerName="DongoStrikeTimer"
    WithdrawChargeTimerName="DongoWithdrawChargeTimer"
    bShouldStalk=true
}