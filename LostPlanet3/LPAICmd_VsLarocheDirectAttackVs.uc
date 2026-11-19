class LPAICmd_VsLarocheDirectAttackVs extends LPAICmd_LeychAttack within LPAIControllerVsLaroche;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWhileMovingRealizedShouldTryEmpPulseProjLaunchStrike;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurSeperateAfterStrikesCmd[536870913];

function Pushed()
{
    super.Pushed();
    bWhileMovingRealizedShouldTryEmpPulseProjLaunchStrike = false;
    CurSeperateAfterStrikesCmd = none;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Attack).SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    // End:0xE1
    if(Outer.bTimeForNextNotifyRightShoulderShieldNotDestroyedYetEventNeedsSetAtNextAttackResume)
    {
        Outer.TimeForNextNotifyRightShoulderShieldNotDestroyedYetEvent = Outer.WorldInfo.TimeSeconds + Outer.VsLarochePawn.GetTimeBetweenFiringDialogForNotifyRightShoulderShieldNotDestroyedYetEvent();
        Outer.bTimeForNextNotifyRightShoulderShieldNotDestroyedYetEventNeedsSetAtNextAttackResume = false;        
    }
    else
    {
        // End:0x1AF
        if(Outer.bTimeForNextNotifyLeftShoulderShieldNotDestroyedYetEventNeedsSetAtNextAttackResume)
        {
            Outer.TimeForNextNotifyLeftShoulderShieldNotDestroyedYetEvent = Outer.WorldInfo.TimeSeconds + Outer.VsLarochePawn.GetTimeBetweenFiringDialogForNotifyLeftShoulderShieldNotDestroyedYetEvent();
            Outer.bTimeForNextNotifyLeftShoulderShieldNotDestroyedYetEventNeedsSetAtNextAttackResume = false;            
        }
        else
        {
            // End:0x27A
            if(Outer.bTimeForNextNotifyLeftHipShieldNotDestroyedYetEventNeedsSetAtNextAttackResume)
            {
                Outer.TimeForNextNotifyLeftHipShieldNotDestroyedYetEvent = Outer.WorldInfo.TimeSeconds + Outer.VsLarochePawn.GetTimeBetweenFiringDialogForNotifyLeftHipShieldNotDestroyedYetEvent();
                Outer.bTimeForNextNotifyLeftHipShieldNotDestroyedYetEventNeedsSetAtNextAttackResume = false;
            }
        }
    }
    // End:0x2A1
    if(!Outer.bPostFirstLaRocheAttackDialogPlayed)
    {        
    }
    else
    {
        // End:0x384
        if(ShouldFireDialogForNotifySawGeneratorNotDestroyedYetEvent())
        {
            Outer.HandleBossFightPhaseEventMessage(EnemyForAttack, 22);
            Outer.bNotifySawGeneratorNotDestroyedYet1DialogPlayed = true;
            Outer.TimeForNextNotifySawGeneratorNotDestroyedYetEvent = Outer.WorldInfo.TimeSeconds + Outer.VsLarochePawn.GetTimeBetweenFiringDialogForNotifySawGeneratorNotDestroyedYetEvent();            
        }
        else
        {
            // End:0x4D9
            if(ShouldFireDialogForNotifyLeftShoulderShieldNotDestroyedYetEvent())
            {
                // End:0x403
                if(!Outer.bNotifyLeftShoulderShieldNotDestroyedYet1DialogPlayed)
                {
                    Outer.HandleBossFightPhaseEventMessage(EnemyForAttack, 4);
                    Outer.bNotifyLeftShoulderShieldNotDestroyedYet1DialogPlayed = true;                    
                }
                else
                {
                    Outer.HandleBossFightPhaseEventMessage(EnemyForAttack, 5);
                    Outer.bNotifyLeftShoulderShieldNotDestroyedYet1DialogPlayed = false;
                }
                Outer.TimeForNextNotifyLeftShoulderShieldNotDestroyedYetEvent = Outer.WorldInfo.TimeSeconds + Outer.VsLarochePawn.GetTimeBetweenFiringDialogForNotifyLeftShoulderShieldNotDestroyedYetEvent();                
            }
            else
            {
                // End:0x5BC
                if(ShouldFireDialogForNotifyCommUnitdNotDestroyedYetEvent())
                {
                    Outer.HandleBossFightPhaseEventMessage(EnemyForAttack, 12);
                    Outer.bNotifyCommUnitNotDestroyedYet1DialogPlayed = true;
                    Outer.TimeForNextNotifyCommUnitNotDestroyedYetEvent = Outer.WorldInfo.TimeSeconds + Outer.VsLarochePawn.GetTimeBetweenFiringDialogForNotifyCommUnitNotDestroyedYetEvent();                    
                }
                else
                {
                    // End:0x70E
                    if(ShouldFireDialogForNotifyLeftHipShieldNotDestroyedYetEvent())
                    {
                        // End:0x63B
                        if(!Outer.bNotifyLeftHipShieldNotDestroyedYet1DialogPlayed)
                        {
                            Outer.HandleBossFightPhaseEventMessage(EnemyForAttack, 27);
                            Outer.bNotifyLeftHipShieldNotDestroyedYet1DialogPlayed = true;                            
                        }
                        else
                        {
                            Outer.HandleBossFightPhaseEventMessage(EnemyForAttack, 28);
                            Outer.bNotifyLeftHipShieldNotDestroyedYet1DialogPlayed = false;
                        }
                        Outer.TimeForNextNotifyLeftHipShieldNotDestroyedYetEvent = Outer.WorldInfo.TimeSeconds + Outer.VsLarochePawn.GetTimeBetweenFiringDialogForNotifyLeftHipShieldNotDestroyedYetEvent();
                    }
                }
            }
        }
    }
    // End:0x78E
    if((int(Outer.GetCurrentLarocheMacroCombatState()) == int(7)) || int(Outer.GetCurrentLarocheMacroCombatState()) == int(8))
    {
        EndOfAttackCleanUp();
        Outer.PopCommand(self);
    }
    //return;    
}

function ShouldFireDialogForNotifyLeftShoulderShieldNotDestroyedYetEvent()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xFA
    if(Outer.VsLarochePawn.GetCoreHealth(5) <= float(0))
    {
        // End:0xFA
        if(Outer.VsLarochePawn.GetCoreHealth(9) > float(0))
        {
            // End:0xFA
            if(Outer.TimeForNextNotifyLeftShoulderShieldNotDestroyedYetEvent > float(0))
            {
                // End:0xFA
                if(Outer.WorldInfo.TimeSeconds > Outer.TimeForNextNotifyLeftShoulderShieldNotDestroyedYetEvent)
                {
                    return true;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldFireDialogForNotifyCommUnitdNotDestroyedYetEvent()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xFA
    if(Outer.VsLarochePawn.GetCoreHealth(9) <= float(0))
    {
        // End:0xFA
        if(Outer.VsLarochePawn.GetCoreHealth(3) > float(0))
        {
            // End:0xFA
            if(Outer.TimeForNextNotifyCommUnitNotDestroyedYetEvent > float(0))
            {
                // End:0xFA
                if(Outer.WorldInfo.TimeSeconds > Outer.TimeForNextNotifyCommUnitNotDestroyedYetEvent)
                {
                    return true;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldFireDialogForNotifySawGeneratorNotDestroyedYetEvent()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xBC
    if(Outer.VsLarochePawn.GetCoreHealth(5) > float(0))
    {
        // End:0xBC
        if(Outer.TimeForNextNotifySawGeneratorNotDestroyedYetEvent > float(0))
        {
            // End:0xBC
            if(Outer.WorldInfo.TimeSeconds > Outer.TimeForNextNotifySawGeneratorNotDestroyedYetEvent)
            {
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldFireDialogForNotifyLeftHipShieldNotDestroyedYetEvent()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x176
    if(Outer.VsLarochePawn.GetCoreHealth(9) <= float(0))
    {
        // End:0x176
        if(Outer.VsLarochePawn.GetCoreHealth(3) <= float(0))
        {
            // End:0x176
            if(Outer.VsLarochePawn.GetCoreHealth(5) <= float(0))
            {
                // End:0x176
                if(Outer.VsLarochePawn.GetCoreHealth(13) > float(0))
                {
                    // End:0x176
                    if(Outer.TimeForNextNotifyLeftHipShieldNotDestroyedYetEvent > float(0))
                    {
                        // End:0x176
                        if(Outer.WorldInfo.TimeSeconds > Outer.TimeForNextNotifyLeftHipShieldNotDestroyedYetEvent)
                        {
                            return true;
                        }
                    }
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function HaveRequiredAccessForAnnounceDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function IsValidGrenadeAssistTargetDurringAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldPerformDamageAssessmentIfCanNotStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldPerformSnapTurnBeforeMovingToDamageAssessmentIfCanNotStrikeAfterMoveToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HaveRequiredAccessForForStrikingDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldTurnToFaceFocusBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function HasStrikeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x14
    if(EnemyForAttack == none)
    {
        return false;        
    }
    else
    {
        return true;
    }
    //return ReturnValue;    
}

function ResetStrikeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x24
    if(EnemyForAttack == none)
    {        
    }
    //return;    
}

function MoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4F
    if(Outer.ShouldTryEmpPulseProjLaunchStrike(Outer.GetCurrentLaRocheCombatPhaseStatData()))
    {
        bWhileMovingRealizedShouldTryEmpPulseProjLaunchStrike = true;
        return true;
    }
    return false;
    //return ReturnValue;    
}

function PostMoveToEnemyForStrike()
{
    // End:0x38
    if(bWhileMovingRealizedShouldTryEmpPulseProjLaunchStrike)
    {
        Outer.CmdVsLarocheEmpProjStrikeVs(EnemyForAttack,, 1);
    }
    //return;    
}

function MoveToEnemyForStrike()
{
    local /*0x97E50000-0x00000000*/ private float Seperation, minSeperationToRequireMoveBeforeStrike, MinZDistanceToRequireMoveBeforeStrike;

    // End:0x455
    if(IsMyEnemyAlive())
    {
        Seperation = EnemySeperation2D();
        minSeperationToRequireMoveBeforeStrike = GetMinSeperationToRequireMoveBeforeStrike();
        MinZDistanceToRequireMoveBeforeStrike = GetMinZDistanceToRequireMoveBeforeStrike();
        // End:0x455
        if((Seperation > minSeperationToRequireMoveBeforeStrike) || (EnemyZDistance()) >= MinZDistanceToRequireMoveBeforeStrike)
        {
            // End:0x171
            if(!Outer.bPostFirstLaRocheAttackDialogPlayed)
            {
                Outer.HandleBossFightPhaseEventMessage(EnemyForAttack, 3);
                Outer.bPostFirstLaRocheAttackDialogPlayed = true;
                Outer.TimeForNextNotifyRightShoulderShieldNotDestroyedYetEvent = Outer.WorldInfo.TimeSeconds + Outer.VsLarochePawn.GetTimeBetweenFiringDialogForNotifyRightShoulderShieldNotDestroyedYetEvent();
            }
            Outer.Focus = none;
            CurMoveToActorCmd = Outer.CmdMoveToActorTight(EnemyForAttack, none, minSeperationToRequireMoveBeforeStrike, Outer.CmdStatus_MoveToActor, 1, Outer.myAIPawn.TuneDataAIPawn.StopTypeForEndOfTightManeuverForAttack, false, true);
            CurMoveToActorCmd.SetNotifyOfCoreHitWhileMovingDelegate(NotifyOfCoreHit);
            CurMoveToActorCmd.SetNotifyOfNonCoreHitWhileMovingDelegate(NotifyOfNonCoreHit);
            CurMoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
            bWhileMovingRealizedShouldTryEmpPulseProjLaunchStrike = false;
            CurMoveToActorCmd.bZeroVelocityOnFinish = ShouldZeroVelocityOnFinishOfMoveToEnemyForStrike();
            // End:0x452
            if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
            {
                CurMoveToActorCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToStrikePoint);
            }            
        }
    }
    //return;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.GetMinSeperationAgainstVsToRequireMoveBeforeStrike(EnemyForAttack);
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy2D, minSeperationToEnemyRequiredForStrike;

    seperationToEnemy2D = Outer.SeperationToPawn2D(EnemyForAttack);
    minSeperationToEnemyRequiredForStrike = GetMinSeperationToRequireMoveBeforeStrike();
    // End:0x70
    if((EnemyForAttack != none) && seperationToEnemy2D > minSeperationToEnemyRequiredForStrike)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function IfNeededChoosePreMoveInStrikeToAttempt()
{
    // End:0x31
    if(ShouldPerformGrabbingUrStrike())
    {
        Outer.CurrentLaRocheStrikeAttempting = 29;        
    }
    else
    {
        Outer.CurrentLaRocheStrikeAttempting = ChooseBestNonGrabOrStruggleStrikeBasedOnCurrentCombatConditions();
    }
    //return;    
}

function IfNeededChooseInStrikeLoopPreMoveInStrikeToAttempt()
{
    // End:0x31
    if(ShouldPerformGrabbingUrStrike())
    {
        Outer.CurrentLaRocheStrikeAttempting = 29;        
    }
    else
    {
        Outer.CurrentLaRocheStrikeAttempting = ChooseBestNonGrabOrStruggleStrikeBasedOnCurrentCombatConditions();
    }
    //return;    
}

function ShouldPerformGrabbingUrStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x10D
    if(Outer.VsLarochePawn.TuneDataVsLaroche.bForceGrabsOnlyNoFreeAttacks && int(Outer.VsLarochePawn.TuneDataVsLaroche.ForceThisLaRocheBossFightStruggleMode) != int(0))
    {
        Outer.CurrentLaRocheStruggleModeAttempting = Outer.VsLarochePawn.TuneDataVsLaroche.ForceThisLaRocheBossFightStruggleMode;
        return true;        
    }
    else
    {
        // End:0x15B
        if(Outer.VsLarochePawn.TuneDataVsLaroche.bForceNotAllowedToGrabOnlyFreeAttacks)
        {
            return false;
        }
    }
    // End:0x1FF
    if(Outer.VsLarochePawn.LastTimeSuccessfullyGrabOtherPawn < float(0))
    {
        Outer.CurrentLaRocheStruggleModeAttempting = Outer.VsLarochePawn.TuneDataVsLaroche.StartOfFightLaRocheStruggleModeAttempting;
        return true;
    }
    return Outer.ChooseBestGrabOrStruggleStrikeBasedOnTheseCombatConditions(Outer.GetCurrentLaRocheCombatPhaseStatData());
    //return ReturnValue;    
}

function ChooseBestNonGrabOrStruggleStrikeBasedOnCurrentCombatConditions()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    // End:0x15E
    if(int(Outer.VsLarochePawn.TuneDataVsLaroche.ForceThisLaRocheStrikeType) != int(0))
    {
        // End:0xDF
        if(int(Outer.VsLarochePawn.TuneDataVsLaroche.ForceThisLaRocheStrikeType) == int(25))
        {
            Outer.VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;            
        }
        else
        {
            Outer.VsLarochePawn.bPerformComboMeleeMoveThisStrike = false;
        }
        return Outer.VsLarochePawn.TuneDataVsLaroche.ForceThisLaRocheStrikeType;
    }
    return Outer.ChooseBestNonGrabOrStruggleStrikeBasedOnTheseCombatConditions(Outer.GetCurrentLaRocheCombatPhaseStatData());
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    // End:0x57
    if(int(Outer.CurrentLaRocheStrikeAttempting) == int(1))
    {
        Outer.CmdVsLarocheLeftJabStrikeVs(EnemyForAttack,, 1);        
    }
    else
    {
        // End:0xAE
        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(2))
        {
            Outer.CmdVsLarocheRightJabStrikeVs(EnemyForAttack,, 1);            
        }
        else
        {
            // End:0x105
            if(int(Outer.CurrentLaRocheStrikeAttempting) == int(3))
            {
                Outer.CmdVsLarocheLeftHookStrikeVs(EnemyForAttack,, 1);                
            }
            else
            {
                // End:0x15C
                if(int(Outer.CurrentLaRocheStrikeAttempting) == int(4))
                {
                    Outer.CmdVsLarocheRightHookStrikeVs(EnemyForAttack,, 1);                    
                }
                else
                {
                    // End:0x1B3
                    if(int(Outer.CurrentLaRocheStrikeAttempting) == int(5))
                    {
                        Outer.CmdVsLarocheSuperSawStrikeVs(EnemyForAttack,, 1);                        
                    }
                    else
                    {
                        // End:0x20A
                        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(6))
                        {
                            Outer.CmdVsLarocheSuperTaserStrikeVs(EnemyForAttack,, 1);                            
                        }
                        else
                        {
                            // End:0x261
                            if(int(Outer.CurrentLaRocheStrikeAttempting) == int(13))
                            {
                                Outer.CmdVsLarocheSawSideCombo1Strike(EnemyForAttack,, 1);                                
                            }
                            else
                            {
                                // End:0x2B8
                                if(int(Outer.CurrentLaRocheStrikeAttempting) == int(14))
                                {
                                    Outer.CmdVsLarocheSuperSawStrikeVs(EnemyForAttack,, 1);                                    
                                }
                                else
                                {
                                    // End:0x30F
                                    if(int(Outer.CurrentLaRocheStrikeAttempting) == int(18))
                                    {
                                        Outer.CmdVsLarocheTaserSideCombo1Strike(EnemyForAttack,, 1);                                        
                                    }
                                    else
                                    {
                                        // End:0x366
                                        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(19))
                                        {
                                            Outer.CmdVsLarocheSuperTaserStrikeVs(EnemyForAttack,, 1);                                            
                                        }
                                        else
                                        {
                                            // End:0x3BD
                                            if(int(Outer.CurrentLaRocheStrikeAttempting) == int(23))
                                            {
                                                Outer.CmdVsLarocheStrightSawingStrikeVs(EnemyForAttack,, 1);                                                
                                            }
                                            else
                                            {
                                                // End:0x44A
                                                if(int(Outer.CurrentLaRocheStrikeAttempting) == int(24))
                                                {
                                                    Outer.VsLarochePawn.bPerformComboMeleeMoveThisStrike = false;
                                                    Outer.CmdVsLarocheArmSweepStrikeVs(EnemyForAttack,, 1);                                                    
                                                }
                                                else
                                                {
                                                    // End:0x4D7
                                                    if(int(Outer.CurrentLaRocheStrikeAttempting) == int(25))
                                                    {
                                                        Outer.VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                                        Outer.CmdVsLarocheArmSweepStrikeVs(EnemyForAttack,, 1);                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x52E
                                                        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(23))
                                                        {
                                                            Outer.CmdVsLarocheStrightSawingStrikeVs(EnemyForAttack,, 1);                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x585
                                                            if(int(Outer.CurrentLaRocheStrikeAttempting) == int(7))
                                                            {
                                                                Outer.CmdVsLarocheCombo1Strike(EnemyForAttack,, 1);                                                                
                                                            }
                                                            else
                                                            {
                                                                // End:0x5DC
                                                                if(int(Outer.CurrentLaRocheStrikeAttempting) == int(8))
                                                                {
                                                                    Outer.CmdVsLarocheCombo2Strike(EnemyForAttack,, 1);                                                                    
                                                                }
                                                                else
                                                                {
                                                                    // End:0x633
                                                                    if(int(Outer.CurrentLaRocheStrikeAttempting) == int(9))
                                                                    {
                                                                        Outer.CmdVsLarocheCombo3Strike(EnemyForAttack,, 1);                                                                        
                                                                    }
                                                                    else
                                                                    {
                                                                        // End:0x68A
                                                                        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(10))
                                                                        {
                                                                            Outer.CmdVsLarocheSawSideCombo1Strike(EnemyForAttack,, 1);                                                                            
                                                                        }
                                                                        else
                                                                        {
                                                                            // End:0x6E1
                                                                            if(int(Outer.CurrentLaRocheStrikeAttempting) == int(11))
                                                                            {
                                                                                Outer.CmdVsLarocheSawSideCombo2Strike(EnemyForAttack,, 1);                                                                                
                                                                            }
                                                                            else
                                                                            {
                                                                                // End:0x738
                                                                                if(int(Outer.CurrentLaRocheStrikeAttempting) == int(12))
                                                                                {
                                                                                    Outer.CmdVsLarocheSawSideCombo3Strike(EnemyForAttack,, 1);                                                                                    
                                                                                }
                                                                                else
                                                                                {
                                                                                    // End:0x78F
                                                                                    if(int(Outer.CurrentLaRocheStrikeAttempting) == int(15))
                                                                                    {
                                                                                        Outer.CmdVsLarocheTaserSideCombo1Strike(EnemyForAttack,, 1);                                                                                        
                                                                                    }
                                                                                    else
                                                                                    {
                                                                                        // End:0x7E6
                                                                                        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(16))
                                                                                        {
                                                                                            Outer.CmdVsLarocheTaserSideCombo2Strike(EnemyForAttack,, 1);                                                                                            
                                                                                        }
                                                                                        else
                                                                                        {
                                                                                            // End:0x83D
                                                                                            if(int(Outer.CurrentLaRocheStrikeAttempting) == int(17))
                                                                                            {
                                                                                                Outer.CmdVsLarocheTaserSideCombo3Strike(EnemyForAttack,, 1);                                                                                                
                                                                                            }
                                                                                            else
                                                                                            {
                                                                                                // End:0x894
                                                                                                if(int(Outer.CurrentLaRocheStrikeAttempting) == int(20))
                                                                                                {
                                                                                                    Outer.CmdVsLarocheHulkSmashCombo1Strike(EnemyForAttack,, 1);                                                                                                    
                                                                                                }
                                                                                                else
                                                                                                {
                                                                                                    // End:0x8EB
                                                                                                    if(int(Outer.CurrentLaRocheStrikeAttempting) == int(21))
                                                                                                    {
                                                                                                        Outer.CmdVsLarocheHulkSmashCombo2Strike(EnemyForAttack,, 1);                                                                                                        
                                                                                                    }
                                                                                                    else
                                                                                                    {
                                                                                                        // End:0x942
                                                                                                        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(22))
                                                                                                        {
                                                                                                            Outer.CmdVsLarocheHulkSmashCombo3Strike(EnemyForAttack,, 1);                                                                                                            
                                                                                                        }
                                                                                                        else
                                                                                                        {
                                                                                                            // End:0x999
                                                                                                            if(int(Outer.CurrentLaRocheStrikeAttempting) == int(26))
                                                                                                            {
                                                                                                                Outer.CmdVsLarocheShoulderChargeStrike(EnemyForAttack,, 1);                                                                                                                
                                                                                                            }
                                                                                                            else
                                                                                                            {
                                                                                                                // End:0x9F0
                                                                                                                if(int(Outer.CurrentLaRocheStrikeAttempting) == int(27))
                                                                                                                {
                                                                                                                    Outer.CmdVsLarocheDoubleArmSmashStrike(EnemyForAttack,, 1);                                                                                                                    
                                                                                                                }
                                                                                                                else
                                                                                                                {
                                                                                                                    // End:0xA47
                                                                                                                    if(int(Outer.CurrentLaRocheStrikeAttempting) == int(28))
                                                                                                                    {
                                                                                                                        Outer.CmdVsLarocheEmpProjStrikeVs(EnemyForAttack,, 1);                                                                                                                        
                                                                                                                    }
                                                                                                                    else
                                                                                                                    {
                                                                                                                        // End:0xC23
                                                                                                                        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(29))
                                                                                                                        {
                                                                                                                            // End:0xAC7
                                                                                                                            if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(1))
                                                                                                                            {
                                                                                                                                Outer.CmdVsLarocheGrabStrikeVsRightForeArm(EnemyForAttack,, 1);                                                                                                                                
                                                                                                                            }
                                                                                                                            else
                                                                                                                            {
                                                                                                                                // End:0xB1E
                                                                                                                                if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(2))
                                                                                                                                {
                                                                                                                                    Outer.CmdVsLarocheGrabStrikeVsRightWrist(EnemyForAttack,, 1);                                                                                                                                    
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                    // End:0xB75
                                                                                                                                    if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(3))
                                                                                                                                    {
                                                                                                                                        Outer.CmdVsLarocheGrabStrikeVsRightElbow(EnemyForAttack,, 1);                                                                                                                                        
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                        // End:0xBCC
                                                                                                                                        if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(4))
                                                                                                                                        {
                                                                                                                                            Outer.CmdVsLarocheGrabStrikeVsRightArmToCutOffTool(EnemyForAttack,, 1);                                                                                                                                            
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                            // End:0xC20
                                                                                                                                            if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(5))
                                                                                                                                            {
                                                                                                                                                Outer.CmdVsLarocheGrabStrikeVsRightArm(EnemyForAttack,, 1);
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }                                                                                                                            
                                                                                                                        }
                                                                                                                        else
                                                                                                                        {
                                                                                                                            // End:0xDFC
                                                                                                                            if(int(Outer.CurrentLaRocheStrikeAttempting) == int(30))
                                                                                                                            {
                                                                                                                                // End:0xCA3
                                                                                                                                if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(1))
                                                                                                                                {
                                                                                                                                    Outer.CmdVsLarocheGrabStrikeVsRightForeArm(EnemyForAttack,, 1);                                                                                                                                    
                                                                                                                                }
                                                                                                                                else
                                                                                                                                {
                                                                                                                                    // End:0xCFA
                                                                                                                                    if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(2))
                                                                                                                                    {
                                                                                                                                        Outer.CmdVsLarocheGrabStrikeVsRightWrist(EnemyForAttack,, 1);                                                                                                                                        
                                                                                                                                    }
                                                                                                                                    else
                                                                                                                                    {
                                                                                                                                        // End:0xD51
                                                                                                                                        if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(3))
                                                                                                                                        {
                                                                                                                                            Outer.CmdVsLarocheGrabStrikeVsRightElbow(EnemyForAttack,, 1);                                                                                                                                            
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                            // End:0xDA8
                                                                                                                                            if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(4))
                                                                                                                                            {
                                                                                                                                                Outer.CmdVsLarocheGrabStrikeVsRightArmToCutOffTool(EnemyForAttack,, 1);                                                                                                                                                
                                                                                                                                            }
                                                                                                                                            else
                                                                                                                                            {
                                                                                                                                                // End:0xDFC
                                                                                                                                                if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(5))
                                                                                                                                                {
                                                                                                                                                    Outer.CmdVsLarocheGrabStrikeVsRightArm(EnemyForAttack,, 1);
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
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function NeedToPerformDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3A
    if(Outer.GetCurrentLaRocheCombatPhaseStatData().bAllowedToPerformDamageAssessment)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AbortMoveInForStrikeIfStrikeAccessLost()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetPauseBetweenStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_VsLarochePauseBetweenStrikes';
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    bGettingKnockedDown = false;
    // End:0x53
    if(Outer.VsLarochePawn != none)
    {
        AmountOfDamageReceivedSoFarThisAttack += AmountOfDamage;
        // End:0x53
        if(HandlePossibilityTookEnoughDamageToCauseBehaviorChange())
        {
            return true;
        }
    }
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

function ShouldFaceEnemyWhileMovingToSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

simulated function IsLeftArmGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(LPAICmd_VsLarocheStrikeBase(CurStrikeCmd) != none)
    {
        LPAICmd_VsLarocheStrikeBase(CurStrikeCmd).IsLeftArmGrabPointAbleToBeGrabed();
    }
    return true;
    //return ReturnValue;    
}

simulated function IsLeftShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(LPAICmd_VsLarocheStrikeBase(CurStrikeCmd) != none)
    {
        LPAICmd_VsLarocheStrikeBase(CurStrikeCmd).IsLeftShoulderGrabPointAbleToBeGrabed();
    }
    return true;
    //return ReturnValue;    
}

simulated function IsRightShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(LPAICmd_VsLarocheStrikeBase(CurStrikeCmd) != none)
    {
        LPAICmd_VsLarocheStrikeBase(CurStrikeCmd).IsRightShoulderGrabPointAbleToBeGrabed();
    }
    return true;
    //return ReturnValue;    
}

simulated function IsRightBicepGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(LPAICmd_VsLarocheStrikeBase(CurStrikeCmd) != none)
    {
        LPAICmd_VsLarocheStrikeBase(CurStrikeCmd).IsRightBicepGrabPointAbleToBeGrabed();
    }
    return true;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(LPAICmd_VsLarocheStrikeBase(CurStrikeCmd) != none)
    {
        LPAICmd_VsLarocheStrikeBase(CurStrikeCmd).IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed();
    }
    return true;
    //return ReturnValue;    
}

simulated function IsCockpitCrossBarGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(LPAICmd_VsLarocheStrikeBase(CurStrikeCmd) != none)
    {
        LPAICmd_VsLarocheStrikeBase(CurStrikeCmd).IsCockpitCrossBarGrabPointAbleToBeGrabed();
    }
    return true;
    //return ReturnValue;    
}

simulated function IsRightInnerShoulderGrabPointAbleToBeGrabed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(LPAICmd_VsLarocheStrikeBase(CurStrikeCmd) != none)
    {
        LPAICmd_VsLarocheStrikeBase(CurStrikeCmd).IsCockpitCrossBarGrabPointAbleToBeGrabed();
    }
    return true;
    //return ReturnValue;    
}

function GetDelayBetweenStrikeAttempts()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.GetRandomWaitTimeBetweenStrikesBasedOnLastStrikeForThisCombatPhase(Outer.GetCurrentLaRocheCombatPhaseStatData());
    //return ReturnValue;    
}

function IsLarocheToCloseToJimsVsAndNeedToSeperate()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float sep2d;

    sep2d = EnemySeperation2DTight();
    // End:0x6C
    if(sep2d < Outer.VsLarochePawn.TuneDataVsLaroche.MinSeperationAfterStrikesToTriggerMoveAway)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HandleWaitingBetweenStrikesCommands()
{
    // End:0x13B
    if(!Outer.bDidLastStrikeOfLastComboLand)
    {
        // End:0xF9
        if(IsLarocheToCloseToJimsVsAndNeedToSeperate())
        {
            CurSeperateAfterStrikesCmd = Outer.CmdSeperateAfterStrikes(EnemyForAttack, Outer.VsLarochePawn.TuneDataVsLaroche.MaxDurationOfSeperationOpportunityAfterStrikes, Outer.VsLarochePawn.TuneDataVsLaroche.MinSeperationToBeAwayAfterStrikes,, 1);            
        }
        else
        {
            CurWaitCmd = Outer.CmdWaitBetweenStrikes(GetPauseBetweenStrikesSpecialMoveClass(), GetDelayBetweenStrikeAttempts());
        }        
    }
    //return;    
}

function HandleWaitingBetweenStrikesCommandDoneCleanUp()
{
    CurWaitCmd = none;
    //return;    
}

state StateCmdActive
{DamageAssessment:

    Outer.LockStrikeAccess(false);
    // End:0x11E
    if(NeedToPerformDamageAssessment())
    {
        // End:0x73
        if(ShouldTurnToFaceFocusBeforeDamageAssessment())
        {
            CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
            CurTurnToFaceCmd = none;
        }
        CurDamageAssessmentCmd = Outer.CmdDamageAssessment(EnemyForAttack, 5.0000000, 5.0000000,, 1);
        CurDamageAssessmentCmd = none;
        CurDamageAssessmentCmd = none;
        NumberOfStrikesDoneSoFarThisAttack = 0;
        NumberOfStrikesToDoThisAttack = GetNumberOfStrikesToDoThisAttack();
        // End:0x11E
        if(HaveRequiredAccessForMoveToEnemyForStrikeDuringAttack())
        {
            Outer.EnableAnnounceEffects(true);
            goto 'MoveCloserToTarget';
        }
    }
    goto 'EndCommand';
    stop;                
}
