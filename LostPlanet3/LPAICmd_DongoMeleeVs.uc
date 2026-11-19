class LPAICmd_DongoMeleeVs extends LPAICmd_CrabMeleeVs within LPAIControllerDongo;

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

    return false;
    //return ReturnValue;    
}

function IsEnemyPositionBlocked()
{
    local /*0x97E50000-0x00000000*/ private float Inradius[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FoundPawns;

    -1.0000000
    // End:0x4D
    if(Inradius <= float(0))
    {
        Inradius = Outer.MyKynapseRadius + MyEnemyRadius;
    }
    // End:0x1EE
    if(Class'LPAIUtils'.static.GetPawnsAtLocation(FoundPawns, EnemyForAttack.Location, Inradius))
    {
        I = 0;
        J0xAA:

        // End:0x1EE [Loop If]
        if(I < FoundPawns.Length)
        {
            // End:0x1E0
            if(((((((FoundPawns[I] != none) && FoundPawns[I] != Outer.myAIPawn) && FoundPawns[I] != EnemyForAttack) && FoundPawns[I].Health > 0) && !FoundPawns[I].IsPendingKill()) && LPBaseVSPlayerPawn(FoundPawns[I]) == none) && LPAIPawnAkridSmall(FoundPawns[I]) == none)
            {
                return true;
            }
            ++I;
            // [Loop Continue]
            goto J0xAA;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetMinSeperationFromEnemyToTryWithdraw()
{
    local /*0x97E50000-0x00000000*/ private bool bDismembered[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return -1000.0000000;
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

    // End:0x1F
    if(super(LPAICmd_CrabMelee).ShouldChargeEnemy())
    {
        // End:0x1D
        if(IsEnemyPositionBlocked())
        {
            return false;
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldBlitzAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ShouldChargeEnemy();
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
    // End:0x1E
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

function SetCanStrikeBeforeReachingMeleeSlot()
{
    local /*0x97E50000-0x00000000*/ private bool bCan[8388609];

    //return;    
}

function AttackEnemy()
{
    super.AttackEnemy();
    Outer.CmdCrabClawStrikePof(EnemyForAttack,, 1);
    //return;    
}

function CanDoPincerBash()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetMinDistanceAwayToTryChargeAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Dist;

    Dist = Outer.DongoPawn.TuneDataDongo.MinDistanceAwayToTryChargeAttack_Tunable.GetValue();
    // End:0x8C
    if(Dist > float(500))
    {
        Dist = 500.0000000;
    }
    return Dist;
    //return ReturnValue;    
}

function ShouldFrenzyAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

state Stalk
{
    ignores PreStalkToNextPosition;

    function DongoCanContinueStalk()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x14
        if(!IsMyEnemyAlive())
        {
            return false;            
        }
        else
        {
            // End:0x3B
            if(Outer.HaveStrikeAccess())
            {
                return false;                
            }
            else
            {
                GetStrikeAccess(EnemyForAttack);
                // End:0x74
                if(Outer.HaveStrikeAccess())
                {
                    return false;
                }
            }
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
        Outer.CmdDongoTauntDuringStalk(EnemyForAttack);
        //return;        
    }

    function ShouldFaceEnemyWhileMovingToSlot()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return Outer.DongoPawn.Rolling == 0;
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

        return Outer.DongoPawn.Rolling == 0;
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
            Outer.Sleep(0.2500000);
            // [Loop Continue]
            goto J0x37;
        }
        Outer.Sleep(0.0010000);
        // [Loop Continue]
        goto J0x28;
    }
    Outer.Sleep(0.0010000);
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

    Outer.CmdDongoFrenzyStrike(EnemyForAttack,, 1);
    Outer.Sleep(0.0100000);
    GotoStateWithEnemyCheck('MoveCloserToEnemy');
    stop;                    
}

defaultproperties
{
    StrikeTimerName="DongoStrikeTimer"
    WithdrawChargeTimerName="DongoWithdrawChargeTimer"
    bShouldStalk=true
    bCanStrikeBeforeReachingMeleeSlot=false
}