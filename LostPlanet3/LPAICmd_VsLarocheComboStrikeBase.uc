class LPAICmd_VsLarocheComboStrikeBase extends LPAICmd_VsLarocheStrikeBase within LPAIControllerVsLaroche;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte WhichComboTypeIsThis[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array CombosStrikes[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array StrikeKnocksOutOfBlock[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentStrikeIndex[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToActorCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];

function Pushed()
{
    CurrentStrikeIndex = 0;
    super.Pushed();
    MoveToActorCmd = none;
    CurTurnToFaceCmd = none;
    //return;    
}

function Popped()
{
    super.Popped();
    CombosStrikes.Length = 0;
    StrikeKnocksOutOfBlock.Length = 0;
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super(LPAICommand).Resumed(OldCommandName);
    // End:0x56
    if((MoveToActorCmd == none) && CurTurnToFaceCmd == none)
    {
        Outer.PopCommand(self);        
    }
    //return;    
}

function GetSMClassForThisVsLarocheStrikeType()
{
    local /*0x97E50000-0x00000000*/ private byte StrikeTypeToLookUp[8388609];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x21
    if(int(StrikeTypeToLookUp) == int(0))
    {
        return Class'LPSM_VsLarocheLeftJabVs';        
    }
    else
    {
        // End:0x42
        if(int(StrikeTypeToLookUp) == int(1))
        {
            return Class'LPSM_VsLarocheLeftJabVs';            
        }
        else
        {
            // End:0x63
            if(int(StrikeTypeToLookUp) == int(2))
            {
                return Class'LPSM_VsLarocheRightJabVs';                
            }
            else
            {
                // End:0x84
                if(int(StrikeTypeToLookUp) == int(3))
                {
                    return Class'LPSM_VsLarocheLeftHookVs';                    
                }
                else
                {
                    // End:0xA5
                    if(int(StrikeTypeToLookUp) == int(4))
                    {
                        return Class'LPSM_VsLarocheRightHookVs';                        
                    }
                    else
                    {
                        // End:0xC6
                        if(int(StrikeTypeToLookUp) == int(5))
                        {
                            return Class'LPSM_VsLarocheSuperSawStrikeVs';                            
                        }
                        else
                        {
                            // End:0xE7
                            if(int(StrikeTypeToLookUp) == int(6))
                            {
                                return Class'LPSM_VsLarocheSuperTaserStrikeVs';                                
                            }
                            else
                            {
                                // End:0x100
                                if(int(StrikeTypeToLookUp) == int(7))
                                {
                                    return none;                                    
                                }
                                else
                                {
                                    // End:0x119
                                    if(int(StrikeTypeToLookUp) == int(8))
                                    {
                                        return none;                                        
                                    }
                                    else
                                    {
                                        // End:0x132
                                        if(int(StrikeTypeToLookUp) == int(9))
                                        {
                                            return none;                                            
                                        }
                                        else
                                        {
                                            // End:0x14B
                                            if(int(StrikeTypeToLookUp) == int(10))
                                            {
                                                return none;                                                
                                            }
                                            else
                                            {
                                                // End:0x164
                                                if(int(StrikeTypeToLookUp) == int(11))
                                                {
                                                    return none;                                                    
                                                }
                                                else
                                                {
                                                    // End:0x17D
                                                    if(int(StrikeTypeToLookUp) == int(12))
                                                    {
                                                        return none;                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x19E
                                                        if(int(StrikeTypeToLookUp) == int(13))
                                                        {
                                                            return Class'LPSM_VsLarocheSawSideComboStart';                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x1D9
                                                            if(int(StrikeTypeToLookUp) == int(14))
                                                            {
                                                                // End:0x1CC
                                                                if(bNeedsToMoveCloserToFinishStriking)
                                                                {
                                                                    return Class'LPSM_VsLarocheSuperSawStrikeVs';                                                                    
                                                                }
                                                                else
                                                                {
                                                                    return Class'LPSM_VsLarocheSawSideComboFinisher';
                                                                }                                                                
                                                            }
                                                            else
                                                            {
                                                                // End:0x1F2
                                                                if(int(StrikeTypeToLookUp) == int(15))
                                                                {
                                                                    return none;                                                                    
                                                                }
                                                                else
                                                                {
                                                                    // End:0x20B
                                                                    if(int(StrikeTypeToLookUp) == int(16))
                                                                    {
                                                                        return none;                                                                        
                                                                    }
                                                                    else
                                                                    {
                                                                        // End:0x224
                                                                        if(int(StrikeTypeToLookUp) == int(17))
                                                                        {
                                                                            return none;                                                                            
                                                                        }
                                                                        else
                                                                        {
                                                                            // End:0x245
                                                                            if(int(StrikeTypeToLookUp) == int(18))
                                                                            {
                                                                                return Class'LPSM_VsLarocheTaserSideComboStart';                                                                                
                                                                            }
                                                                            else
                                                                            {
                                                                                // End:0x280
                                                                                if(int(StrikeTypeToLookUp) == int(19))
                                                                                {
                                                                                    // End:0x273
                                                                                    if(bNeedsToMoveCloserToFinishStriking)
                                                                                    {
                                                                                        return Class'LPSM_VsLarocheSuperTaserStrikeVs';                                                                                        
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        return Class'LPSM_VsLarocheTaserSideComboFinisher';
                                                                                    }                                                                                    
                                                                                }
                                                                                else
                                                                                {
                                                                                    // End:0x299
                                                                                    if(int(StrikeTypeToLookUp) == int(20))
                                                                                    {
                                                                                        return none;                                                                                        
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        // End:0x2B2
                                                                                        if(int(StrikeTypeToLookUp) == int(21))
                                                                                        {
                                                                                            return none;                                                                                            
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // End:0x2CB
                                                                                            if(int(StrikeTypeToLookUp) == int(22))
                                                                                            {
                                                                                                return none;                                                                                                
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                // End:0x2E4
                                                                                                if(int(StrikeTypeToLookUp) == int(23))
                                                                                                {
                                                                                                    return none;                                                                                                    
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    // End:0x2FD
                                                                                                    if(int(StrikeTypeToLookUp) == int(24))
                                                                                                    {
                                                                                                        return none;                                                                                                        
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        // End:0x316
                                                                                                        if(int(StrikeTypeToLookUp) == int(25))
                                                                                                        {
                                                                                                            return none;                                                                                                            
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                            // End:0x337
                                                                                                            if(int(StrikeTypeToLookUp) == int(26))
                                                                                                            {
                                                                                                                return Class'LPSM_VsLarocheSawArmSwingShoulderCharge';                                                                                                                
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                                // End:0x355
                                                                                                                if(int(StrikeTypeToLookUp) == int(27))
                                                                                                                {
                                                                                                                    return Class'LPSM_VsLarocheSawArmSwingTwoHandBash';
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return Class'LPSM_VsLarocheLeftJabVs';
    //return ReturnValue;    
}

function CurrentStrikeKnocksOutOfBlock()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3A
    if(((CurrentStrikeIndex < 0) || CurrentStrikeIndex >= StrikeKnocksOutOfBlock.Length) || bMeleeStrikeFinished)
    {
        return false;
    }
    return StrikeKnocksOutOfBlock[CurrentStrikeIndex];
    //return ReturnValue;    
}

function GetSmForStrike()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x36
    if(CombosStrikes.Length > CurrentStrikeIndex)
    {
        return GetSMClassForThisVsLarocheStrikeType(CombosStrikes[CurrentStrikeIndex]);
    }
    return Class'LPSM_VsLarocheLeftJabVs';
    //return ReturnValue;    
}

function StartMeleeStrikeSM()
{
    local /*0x97E50000-0x00000000*/ private class smForStrike;

    smForStrike = GetSmForStrike();
    // End:0x8B
    if(smForStrike != none)
    {
        bMeleeStrikeFinished = false;
        Outer.VsLarochePawn.DoSpecialMove(smForStrike, true, false, On_VsLarocheStrikeSm_Finished, EnemyForStrike);        
    }
    else
    {
        bMeleeStrikeFinished = true;
    }
    //return;    
}

function On_VsLarocheStrikeSm_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x67
    if(++CurrentStrikeIndex < CombosStrikes.Length)
    {
        // End:0x4C
        if(IsEnemyStillCloseEnoughToStrikeAt())
        {
            bMeleeStrikeFinished = false;
            StartMeleeStrikeSM();
            bNeedsToMoveCloserToFinishStriking = false;            
        }
        else
        {
            bMeleeStrikeFinished = true;
            bNeedsToMoveCloserToFinishStriking = true;
        }        
    }
    else
    {
        bNeedsToMoveCloserToFinishStriking = false;
        bMeleeStrikeFinished = true;
    }
    //return;    
}

function IsEnemyStillCloseEnoughToStrikeAt()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy2D, minSeperationToEnemyRequiredForStrike;

    seperationToEnemy2D = Outer.SeperationToPawn2D(EnemyForStrike);
    minSeperationToEnemyRequiredForStrike = Outer.GetMinSeperationAgainstVsToRequireMoveBeforeStrike(EnemyForStrike);
    // End:0x8E
    if((EnemyForStrike != none) && seperationToEnemy2D > minSeperationToEnemyRequiredForStrike)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

event EnemyForAttackLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return EnemyForStrike.Location;
    //return ReturnValue;    
}

function EnemyZDistance()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Abs(Outer.myAIPawn.Location.Z - EnemyForAttackLocation().Z);
    //return ReturnValue;    
}

function NotifyOfFailedMovementToStrikePoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x43
    if(MoveToActorCmd != none)
    {
        Outer.AbortCommand(MoveToActorCmd);
        MoveToActorCmd = none;
    }
    Outer.PopCommand(self);
    return true;
    //return ReturnValue;    
}

function MoveToEnemyToStrikeAgain()
{
    local /*0x97E50000-0x00000000*/ private float Seperation, minSeperationToRequireMoveBeforeStrike, MinZDistanceToRequireMoveBeforeStrike;

    // End:0x2C2
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2D();
        minSeperationToRequireMoveBeforeStrike = GetMinSeperationToRequireMoveBeforeStrike();
        MinZDistanceToRequireMoveBeforeStrike = GetMinZDistanceToRequireMoveBeforeStrike();
        // End:0x2C2
        if((Seperation > minSeperationToRequireMoveBeforeStrike) || (EnemyZDistance()) >= MinZDistanceToRequireMoveBeforeStrike)
        {
            Outer.Focus = none;
            MoveToActorCmd = Outer.CmdMoveToActorTight(EnemyForStrike, none, minSeperationToRequireMoveBeforeStrike, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfTightManeuverForAttack, false, true);
            MoveToActorCmd.bZeroVelocityOnFinish = ShouldZeroVelocityOnFinishOfMoveToEnemyForStrike();
            // End:0x2BF
            if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
            {
                MoveToActorCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToStrikePoint);
            }            
        }
    }
    //return;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.GetMinSeperationAgainstVsToRequireMoveBeforeStrike(EnemyForStrike);
    //return ReturnValue;    
}

function GetMinZDistanceToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 100000.0000000;
    //return ReturnValue;    
}

function ShouldZeroVelocityOnFinishOfMoveToEnemyForStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldTurnToFaceBeforeMoveCloserToTarget()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x80
    if(EnemyForStrike != none)
    {
        return Outer.IsTurnToFaceTargetCommandNeeded(EnemyForStrike, Outer.VsLarochePawn.TuneDataVsLaroche.MinAngleNeededForTurnToFaceCommandDuringWaitBetweenStrikes);
    }
    return true;
    //return ReturnValue;    
}

function HandleDoneWithMoveToEnemyToStrikeAgainCleanUp()
{
    //return;    
}

state StateCmdActive
{
    ignores PreMoveToEnemyToStrikeAgain, PostMoveToEnemyToStrikeAgain;

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

    event PausedState()
    {
        super.PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super.ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super.PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
Begin:

    StartMeleeStrikeSM();
    J0x0A:

    // End:0x3D [Loop If]
    if(!bMeleeStrikeFinished)
    {
        Outer.Sleep(SleepTimeInSecsDuringStrikeUpdate);
        // [Loop Continue]
        goto J0x0A;
    }
    // End:0x54
    if(bNeedsToMoveCloserToFinishStriking)
    {
        goto 'MoveCloserToStrikeAgain';
    }
    Outer.MeleeFinished();
    Outer.PopCommand(self);
MoveCloserToStrikeAgain:


    // End:0xD9
    if(ShouldTurnToFaceBeforeMoveCloserToTarget())
    {
        CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
        CurTurnToFaceCmd = none;
    }
    PreMoveToEnemyToStrikeAgain();
    MoveToEnemyToStrikeAgain();
    PostMoveToEnemyToStrikeAgain();
    HandleDoneWithMoveToEnemyToStrikeAgainCleanUp();
    StartMeleeStrikeSM();
    goto 'WaitForStrikingToEnd';
    stop;            
}
