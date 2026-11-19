class LPAICmd_DongoChargeAttack_MP extends LPAICmd_DongoChargeAttackPof within LPAIControllerDongo;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL NextTarget[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

state StateCmdActive
{
    function ShouldRepeatChargeAttack()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private int numPotentialAdditionalChargeAttackVictims;
        local /*0x97E50000-0x00000000*/ private @NULL ClosestActor;

        // End:0x24
        if(CmdStatus_ChargeAttackUsing.WasTheChargeInteruptedBecauseOfExplosion())
        {
            return false;
        }
        // End:0x48
        if(CmdStatus_ChargeAttackUsing.WasActiveDefenseStruck())
        {
            return false;
        }
        // End:0x6C
        if(CmdStatus_ChargeAttackUsing.WasBlockingObjectStruck())
        {
            return false;
        }
        numPotentialAdditionalChargeAttackVictims = Outer.GetNumEnemiesWithinRangeAndAngle(Outer.CrabPawn.TuneDataIceCrab.DongoChargeAttackDistToLookForAdditionalEnemies.GetValue(), Outer.DongoChargeAttackACosHorizAngToLookForAdditionalEnemies, ClosestActor, EnemyForAttack, true);
        // End:0x153
        if(numPotentialAdditionalChargeAttackVictims > 0)
        {
            NextTarget = LPPawn(ClosestActor);
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function FinishCurrentEnemyCharge()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL CurMoveToPositionCmd;

        // End:0x29E
        if(IsMyEnemyAlive())
        {
            CurMoveToPositionCmd = Outer.CmdMoveToPosition(EnemyForAttack.Location,, -1.0000000, Outer.CmdStatus_MoveToPosition, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfChargeRunIn);
            CurMoveToPositionCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToChargePointAvoidance;
            CurMoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
            CurMoveToPositionCmd.bZeroVelocityOnFinish = false;
            CurMoveToPositionCmd.SetMovementMonitorParameters(true, Outer.DongoPawn.TuneDataIceCrab.DurationBetweenMovementDeltaDuringChargeRunIn_Tunable.GetValue(), Outer.DongoPawn.TuneDataIceCrab.MinMovementDeltaDuringChargeRunIn_Tunable.GetValue(), Outer.DongoPawn.TuneDataIceCrab.DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable.GetValue(), NotifyOfFailedMovementToChargePoint);
            StartOfRunInSetUp();
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function MoveToEnemyForChargingStrike()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float Seperation, minDistaceToStartStrike;

        minDistaceToStartStrike = Outer.GetMinDistanceAwayToStartChargingStrike(EnemyForAttack);
        // End:0x352
        if(IsMyEnemyAlive())
        {
            Seperation = EnemySeperation2D();
            // End:0x352
            if(Seperation > minDistaceToStartStrike)
            {
                CurMoveToActorCmd = Outer.CmdMoveToActor(EnemyForAttack, EnemyForAttack, minDistaceToStartStrike, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfChargeRunIn);
                CurMoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
                CurMoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
                CurMoveToActorCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToChargePointAvoidance;
                CurMoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
                CurMoveToActorCmd.bZeroVelocityOnFinish = false;
                CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.CrabPawn.TuneDataIceCrab.DurationBetweenMovementDeltaDuringChargeRunIn_Tunable.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MinMovementDeltaDuringChargeRunIn_Tunable.GetValue(), Outer.CrabPawn.TuneDataIceCrab.DelayAfterStartOfChargeRunIneforeMonitorStarts_Tunable.GetValue(), NotifyOfFailedMovementToChargePoint);
                StartOfRunInSetUp();
                return true;
            }
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    SetInterruptible(false);
    Outer.SetWantsNewEnemy(false);
    CmdStatus_ChargeAttackUsing.StartingChargeRunIn(EnemyForAttack);
    FaceEnemyForChargingStrike();
    Outer.Sleep(0.0000000);
    PrepareForChargingStrike();
    J0x85:

    // End:0xB4 [Loop If]
    if(!IsPreparedForChargingStrike())
    {
        Outer.Sleep(0.0010000);
        // [Loop Continue]
        goto J0x85;
    }
RepeatAttack:


    Outer.CrabPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataIceCrab.ChargingMaxSpeedScale_Tunable.GetValue());
    // End:0x1C3
    if(MoveToEnemyForChargingStrike())
    {
        // End:0x1B6
        if(ShouldRepeatChargeAttack())
        {
            FinishCurrentEnemyCharge();
            BeforeEnterStrikeCleanUp();
            // End:0x1B3
            if(NextTarget.IsAliveAndWell())
            {
                SetDesiredEnemy(NextTarget);
                goto 'RepeatAttack';
            }            
        }
        else
        {
            BeforeEnterStrikeCleanUp();
        }        
    }
    else
    {
        BeforeEnterStrikeCleanUp();
    }
    // End:0x3BF
    if(CmdStatus_ChargeAttackUsing.WasTheChargeInteruptedBecauseOfExplosion() || StartChargingStrike())
    {
        CurStrikeCmd = none;
        Outer.Focus = none;
        Outer.CrabPawn.SetMaxSpeedScale(Outer.CrabPawn.TuneDataIceCrab.GetNormalMaxSpeedScale(Outer.CrabPawn));
        // End:0x2FD
        if(CmdStatus_ChargeAttackUsing.WasTheChargeInteruptedBecauseOfExplosion())
        {
            PushState('PostChargingTripAndStunned');            
        }
        else
        {
            // End:0x336
            if(CmdStatus_ChargeAttackUsing.WasNothingHitDuringCharge())
            {
                PushState('PostChargingTripAndStunned');                
            }
            else
            {
                // End:0x36F
                if(CmdStatus_ChargeAttackUsing.WasActiveDefenseStruck())
                {
                    PushState('PostChargingKnockBackedAndStunned');                    
                }
                else
                {
                    // End:0x3A8
                    if(CmdStatus_ChargeAttackUsing.WasBlockingObjectStruck())
                    {
                        PushState('PostChargingPassiveBlocked');                        
                    }
                    else
                    {
                        PushState('PostChargingShakeOff');
                    }
                }
            }
        }        
    }
    else
    {
        CmdStatus_ChargeAttackUsing.StartingUberClawStrike();
        MoveToEnemyForUberClawStrike();
    }
    Outer.PopCommand(self);
    stop;                
}

state PostChargingTripAndStunned
{
    function ShouldWantNewEnemy()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x59
        if((EnemySeperation2D()) < Outer.DongoPawn.TuneDataDongo.MaxSeperationForDirectPhysicalStrike)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
    stop;    
}

state PostChargingShakeOff
{
    function ShouldWantNewEnemy()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x59
        if((EnemySeperation2D()) < Outer.DongoPawn.TuneDataDongo.MaxSeperationForDirectPhysicalStrike)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
    stop;    
}
