class LPAICmd_FireWaspRamAttack extends LPAICmd_MedFlyerDirectAttack within LPAIControllerMedFlyer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForSpecialMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SaveMaxSpeedScale;

function Pushed()
{
    local /*0x97E50000-0x00000000*/ private @NULL FireWasp;

    super.Pushed();
    FireWasp = LPAIPawnFireWasp(MyPawn);
    SaveMaxSpeedScale = FireWasp.ReplicatedMaxSpeedScale;
    FireWasp.SetMaxSpeedScale(FireWasp.TuneDataFireWasp.RamAttackMoveSpeedScale.GetValue());
    FireWasp.bStingerAggressiveOnFlag = true;
    //return;    
}

function Popped()
{
    LPAIControllerMedFlyer(MyController).UseAnimationNormal();
    Outer.EnableAggressiveGlow(false);
    Outer.MedFlyerPawn.SetMaxSpeedScale(SaveMaxSpeedScale);
    Outer.MedFlyerPawn.EnableLineSweepHitTester(false);
    LPAIPawnFireWasp(Outer.MedFlyerPawn).bStingerAggressiveOnFlag = false;
    super.Popped();
    //return;    
}

function SpecialMoveDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function CheckAbortForEnemyCover()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function SpecialMoveDone()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        bWaitingForSpecialMove = false;
        //return;        
    }

    function StartAnnounceSpecialMove()
    {
        Outer.PawnZeroVelocity();
        bWaitingForSpecialMove = true;
        Outer.MedFlyerPawn.DoSpecialMove(Class'LPSM_FireWaspSwoopStingStart', true, true, SpecialMoveDone, none);
        //return;        
    }

    function StartAttackSpecialMove()
    {
        Outer.MedFlyerPawn.EnableLineSweepHitTester(true);
        Outer.PawnZeroVelocity();
        bWaitingForSpecialMove = true;
        Outer.MedFlyerPawn.DoSpecialMove(Class'LPSM_FireWaspSwoopRamStrike', true, true, SpecialMoveDone, EnemyForAttack);
        //return;        
    }

    function MoveInForStrike()
    {
        local /*0x97E50000-0x00000000*/ private float Seperation, minSeperationToRequireMoveBeforeStrike;

        LPAIControllerFireWasp(MyController).UseSwoopStingAnimations();
        Seperation = EnemySeperation();
        minSeperationToRequireMoveBeforeStrike = GetMinSeperationToRequireMoveBeforeStrike();
        // End:0x3A1
        if(Seperation > minSeperationToRequireMoveBeforeStrike)
        {
            Outer.Focus = none;
            CurMoveToActorCmd = Outer.CmdMoveToActorFly(EnemyForAttack, none, Outer.MedFlyerPawn.TuneDataMedFlyer.DistanceFromTargetForBasicStrikeInUU, Outer.MedFlyerPawn.TuneDataMedFlyer.PitchAngleFromTargetForBasicStrikeInDegrees, 50.0000000, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfMoveToStrike);
            // End:0x1F8
            if(AbortMoveInForStrikeIfStrikeAccessLost())
            {
                CurMoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;                
            }
            else
            {
                CurMoveToActorCmd.__MoveAbortDelegate__Delegate = CheckAbortForEnemyCover;
            }
            CurMoveToActorCmd.bZeroVelocityOnFinish = true;
            // End:0x39E
            if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
            {
                CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToStrikePoint);
            }            
        }
        //return;        
    }

    function MoveFailed()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x40
        if(int(CurMoveCmd.MoveToActorStatus.Cmd_Error) == int(1))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function CheckAbortForEnemyCover()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x24
        if(EnemyForAttack.IsUsingCover())
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function MoveStrikeAbortCondition()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x0F
        if(super(LPAICmd_Attack).MoveStrikeAbortCondition())
        {
            return true;
        }
        return CheckAbortForEnemyCover();
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = EnemyForAttack;
    StartAnnounceSpecialMove();
    J0x32:

    // End:0xB3 [Loop If]
    if(bWaitingForSpecialMove)
    {
        Outer.Sleep(0.0100000);
        // End:0xB0
        if(Outer.Focus != EnemyForAttack)
        {
            Outer.Focus = EnemyForAttack;
        }
        // [Loop Continue]
        goto J0x32;
    }
    MoveInForStrike();
    LPAIControllerFireWasp(MyController).UseAnimationNormal();
    Outer.EnableAggressiveGlow(false);
    // End:0x14B
    if(!MoveFailed())
    {
        StartAttackSpecialMove();
        J0x11E:

        // End:0x14B [Loop If]
        if(bWaitingForSpecialMove)
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x11E;
        }
    }
    Outer.PopCommand(self);
    stop;                    
}

defaultproperties
{
    bInterruptible=false
}