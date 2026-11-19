class LPAICmd_CarrierAttackViaAttackVolume extends LPAICmd_AttackViaAttackVolume within LPAIControllerCarrier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CarrierAttackVolumeToUse[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfTimesPlayedTheBackUpCycleToGetOutOfThisAttackVol[536870913];

function Pushed()
{
    NumOfTimesPlayedTheBackUpCycleToGetOutOfThisAttackVol = 0;
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function OnExit()
{
    super.OnExit();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function On_LPSM_MoveBackToLoiterPosition_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.CarrierPawn.bMoveBackToLoiterPositionFinished = true;
    //return;    
}

function IsMoveBackToLoiterPositionFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float deltaSinceStartedBackUp;

    // End:0x39
    if(Outer.CarrierPawn.bMoveBackToLoiterPositionFinished)
    {
        return true;
    }
    deltaSinceStartedBackUp = Outer.WorldInfo.TimeSeconds - Outer.CarrierPawn.TimeStartedMoveBackToLoiterPosition;
    // End:0xEE
    if(deltaSinceStartedBackUp > Outer.CarrierPawn.MaxTimeToSpendInBackUpSpecialMove)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ExitBecauseEnemyDead()
{
    LPAICmd_Attack_Status(0);
    Outer.PopCommand(self);
    //return;    
}

state SetupAttackVolume
{
    event EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x51
        if(AttackInfo.AttackVolume != none)
        {
            CarrierAttackVolumeToUse = LPAttackVolumeCarrier(AttackInfo.AttackVolume);
        }
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
    stop;    
}

state MoveToAttackPosition
{
    function MoveToAttackVolume()
    {
        local /*0x97E50000-0x00000000*/ private float MaxSeperation, Seperation;
        local /*0x97E50000-0x00000000*/ private bool bUseMoveToActor;
        local /*0x97E50000-0x00000000*/ private @NULL ActorToFace;

        bUseMoveToActor = true;
        ActorToFace = none;
        bMoveAborted = false;
        Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        // End:0x623
        if((HaveAccessToAttackVolume()) && CarrierAttackVolumeToUse.ActorToUseAsEntryLocation != none)
        {
            // End:0x51A
            if(bUseMoveToActor)
            {
                MaxSeperation = Outer.myAIPawn.TuneDataAIPawn.DefaultSeperationRequiredForMovingToAttackVolumesAttackLocation;
                Seperation = VSize2D(Outer.myAIPawn.Location - CarrierAttackVolumeToUse.ActorToUseAsEntryLocation.Location);
                // End:0x4AB
                if(Seperation > MaxSeperation)
                {
                    // End:0x26B
                    if(AttackInfo.bDoNotFaceEnemyWhileMoving)
                    {
                        ActorToFace = CarrierAttackVolumeToUse.ActorToUseAsEntryLocation;                        
                    }
                    else
                    {
                        ActorToFace = EnemyForAttack;
                    }
                    MoveToCmd = Outer.CmdMoveToActorTight(CarrierAttackVolumeToUse.ActorToUseAsEntryLocation, ActorToFace, MaxSeperation, Outer.CmdStatus_MoveToActor, 1);
                    LPAICmd_MoveToActorTight(MoveToCmd).OverridePawnRadius(Outer.myAIPawn.TuneDataAIPawn.DefaultSeperationRequiredForMovingToAttackVolumesAttackLocation);
                    MoveToCmd.SetMovementZDiffAllowanceFactor(Outer.myAIPawn.TuneDataAIPawn.DefaultMovementZDiffAllowanceFactor.GetValue());
                    MoveToCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
                    MoveToCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToPointAvoidance;
                    MoveToCmd.bZeroVelocityOnFinish = true;
                    MoveToCmd.SetMovementMonitorParameters(true, 2.0000000, 200.0000000, 2.0000000, NotifyOfFailedMovement);                    
                }
                else
                {
                    Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 2;
                    Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 2;
                }                
            }
            else
            {
                MoveToCmd = Outer.CmdMoveToPosition(AttackInfo.GoToActor.Location, EnemyForAttack, 100.0000000, Outer.CmdStatus_MoveToPosition, 1);
                Outer.Focus = EnemyForAttack;
                MoveToCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
                MoveToCmd.bZeroVelocityOnFinish = true;
            }            
        }
        else
        {
            Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 3;
            Outer.CmdStatus_MoveToActor.Cmd_Error = 1;
            Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 3;
            Outer.CmdStatus_MoveToPosition.Cmd_Error = 1;
        }
        //return;        
    }

    function MoveInToAttackVolume()
    {
        local /*0x97E50000-0x00000000*/ private float MaxSeperation, Seperation;
        local /*0x97E50000-0x00000000*/ private bool bUseMoveToActor;
        local /*0x97E50000-0x00000000*/ private @NULL ActorToFace;

        bUseMoveToActor = true;
        ActorToFace = none;
        bMoveAborted = false;
        Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToActor.Cmd_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
        Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
        // End:0x5F7
        if(HaveAccessToAttackVolume())
        {
            // End:0x4EE
            if(bUseMoveToActor)
            {
                MaxSeperation = Outer.myAIPawn.TuneDataAIPawn.DefaultSeperationRequiredForMovingToAttackVolumesAttackLocation;
                Seperation = VSize2D(Outer.myAIPawn.Location - AttackInfo.GoToActor.Location);
                // End:0x47F
                if(Seperation > MaxSeperation)
                {
                    // End:0x241
                    if(AttackInfo.bDoNotFaceEnemyWhileMoving)
                    {
                        ActorToFace = AttackInfo.GoToActor;                        
                    }
                    else
                    {
                        ActorToFace = EnemyForAttack;
                    }
                    MoveToCmd = Outer.CmdMoveToActorTight(AttackInfo.GoToActor, ActorToFace, MaxSeperation, Outer.CmdStatus_MoveToActor, 1);
                    LPAICmd_MoveToActorTight(MoveToCmd).OverridePawnRadius(Outer.myAIPawn.TuneDataAIPawn.DefaultSeperationRequiredForMovingToAttackVolumesAttackLocation);
                    MoveToCmd.SetMovementZDiffAllowanceFactor(Outer.myAIPawn.TuneDataAIPawn.DefaultMovementZDiffAllowanceFactor.GetValue());
                    MoveToCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
                    MoveToCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToPointAvoidance;
                    MoveToCmd.bZeroVelocityOnFinish = true;
                    MoveToCmd.SetMovementMonitorParameters(true, 2.0000000, 200.0000000, 2.0000000, NotifyOfFailedMovement);                    
                }
                else
                {
                    Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 2;
                    Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 2;
                }                
            }
            else
            {
                MoveToCmd = Outer.CmdMoveToPosition(AttackInfo.GoToActor.Location, EnemyForAttack, 100.0000000, Outer.CmdStatus_MoveToPosition, 1);
                Outer.Focus = EnemyForAttack;
                MoveToCmd.__MoveAbortDelegate__Delegate = MoveAbortCondition;
                MoveToCmd.bZeroVelocityOnFinish = true;
            }            
        }
        else
        {
            Outer.CmdStatus_MoveToActor.Cmd_Move_Error = 3;
            Outer.CmdStatus_MoveToActor.Cmd_Error = 1;
            Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 3;
            Outer.CmdStatus_MoveToPosition.Cmd_Error = 1;
        }
        //return;        
    }
Begin:

    // End:0x1C
    if(!IsMyEnemyAlive())
    {
        ExitBecauseEnemyDead();        
    }
    else
    {
        // End:0x41
        if(!IsAttackVolumeValid())
        {
            GotoStateWithEnemyCheck('SetupAttackVolume');            
        }
        else
        {
            // End:0x66
            if(!HaveAccessToAttackVolume())
            {
                GotoStateWithEnemyCheck('GetAttackClearence');                
            }
            else
            {
                MoveToAttackVolume();
                Outer.Sleep(0.0100000);
                J0x8D:

                // End:0xBA [Loop If]
                if(IsMoveInProgress())
                {
                    Outer.Sleep(0.0100000);
                    // [Loop Continue]
                    goto J0x8D;
                }
                // End:0xD1
                if(HasMoveFailed())
                {
                    ExitWithFaliure();
                }
                Outer.Focus = AttackInfo.GoToActor;
                CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
                CurTurnToFaceCmd = none;
                Outer.Focus = none;
                MoveInToAttackVolume();
                CurrentFacing = Vector(Outer.Rotation);
                DesiredFacing = Vector(AttackInfo.GoToActor.Rotation);
                // End:0x3FD
                if((CurrentFacing Dot DesiredFacing) < 0.9960000)
                {
                    Outer.myAIPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
                    Outer.myAIPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
                    Outer.Kynapse_ActivateBot(false);
                    Outer.Focus = none;
                    Outer.SetFocalPoint((DesiredFacing * float(100)) + Outer.myAIPawn.Location);
                    bAbortRotation = false;
                    Outer.SetTimer(10.0000000, false, 'AbortRotation', self);
                    // End:0x3FD
                    if(Outer.myAIPawn.RotationRate.Yaw > 0)
                    {
                        J0x39A:

                        Outer.Sleep(0.0000000);
                        // End:0x39A
                        if(!(Outer.myAIPawn.ReachedDesiredRotation() || bAbortRotation))
                            goto J0x39A;
                    }
                }
                // End:0x70E
                if(!AttackInfo.GoToActor.bBlockActors)
                {
                    Outer.myAIPawn.ZeroMovementVariables();
                    Outer.Focus = none;
                    Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
                    PreInterpPos = Outer.myAIPawn.Location;
                    PreInterpRot = Outer.myAIPawn.Rotation;
                    FinalInterpPos = AttackInfo.GoToActor.Location;
                    FinalInterpPos.Z = Outer.myAIPawn.Location.Z;
                    FinalInterpRot = AttackInfo.GoToActor.Rotation;
                    FinalInterpRot.Roll = 0;
                    InterpStartTime = CurTime();
                    InterpEndTime = InterpStartTime + InterpTime;
                    bInterpolating = true;
                    Outer.EnableRotation(false);
                    J0x684:

                    // End:0x6B1 [Loop If]
                    if(bInterpolating)
                    {
                        Outer.Sleep(0.0000000);
                        // [Loop Continue]
                        goto J0x684;
                    }
                    Outer.EnableRotation(true);
                    FinalPawnPos = Outer.myAIPawn.Location;
                }
                Outer.ClearTimer('AbortRotation');
                GotoStateWithEnemyCheck('StartStriking');
            }
        }
    }
    stop;        
}

state StartStriking
{
    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }

    function GotoEndOfStrikingState()
    {
        GotoState('BackOutOfAttackVol');
        //return;        
    }
Begin:

    bAnimPlaying = false;
    // End:0x25
    if(!IsMyEnemyAlive())
    {
        GotoEndOfStrikingState();
    }
StartStrikeAnim:


    StartAnimation();
    J0x2F:

    // End:0x5C [Loop If]
    if(bAnimPlaying)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x2F;
    }
    Outer.SetWantsNewEnemy(true);
    DelayTime = GetDelayBeforeNextAttack();
    bDelay = true;
    Outer.SetTimer(DelayTime, false, 'DelayExpired', self);
    J0xC8:

    // End:0x10E [Loop If]
    if(bDelay)
    {
        // End:0xEE
        if(!IsMyEnemyAlive())
        {
            GotoEndOfStrikingState();
        }
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0xC8;
    }
    // End:0x128
    if(IsMyEnemyAlive())
    {
        goto 'StartStrikeAnim';        
    }
    else
    {
        GotoEndOfStrikingState();
    }
    stop;        
}

state BackOutOfAttackVol
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
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    SetInterruptible(false);
    // End:0x150
    if((CarrierAttackVolumeToUse.ActorToFaceWhenExiting != none) && Outer.IsTurnToFaceTargetCommandNeeded(CarrierAttackVolumeToUse.ActorToFaceWhenExiting, Outer.CarrierPawn.TuneDataCarrier.MinAngleInDegreesNeededForTurnToFaceCommandBeforeStartOfBackOutOfAttackVol))
    {
        Outer.Focus = CarrierAttackVolumeToUse.ActorToFaceWhenExiting;
        CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
        CurTurnToFaceCmd = none;
        Outer.Focus = none;
    }
    Outer.CarrierPawn.bMoveBackToLoiterPositionFinished = false;
    Outer.CarrierPawn.TimeStartedMoveBackToLoiterPosition = Outer.WorldInfo.TimeSeconds;
    NumOfTimesPlayedTheBackUpCycleToGetOutOfThisAttackVol = 0;
    J0x1F8:

    // End:0x2A9 [Loop If]
    if(NumOfTimesPlayedTheBackUpCycleToGetOutOfThisAttackVol++ < CarrierAttackVolumeToUse.NumOfTimesToPlayTheBackUpCycleToGetOutOfTheAttackVol)
    {
        Outer.myAIPawn.DoSpecialMove(Class'LPSM_CarrierMoveBackToLoiterPosition', true, true, On_LPSM_MoveBackToLoiterPosition_Finished);
        J0x277:

        // End:0x2A6 [Loop If]
        if(!IsMoveBackToLoiterPositionFinished())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x277;
        }
        // [Loop Continue]
        goto J0x1F8;
    }
    SetInterruptible(true);
    Outer.PopCommand(self);
    stop;            
}
