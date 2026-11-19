class LPAICmd_VsLarocheBerserkAttackVs extends LPAICmd_LeychAttack within LPAIControllerVsLaroche;

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

event SPAborted()
{
    super(LPAICmd_Attack).SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
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

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x30A
    if(Outer.VsLarochePawn != none)
    {
        // End:0xB9
        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(23))
        {
            return ConvertRangeToSeperation2D(Outer.VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartSrightSawingStrikeVs.GetValue());            
        }
        else
        {
            // End:0x14E
            if(int(Outer.CurrentLaRocheStrikeAttempting) == int(24))
            {
                return ConvertRangeToSeperation2D(Outer.VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartSawArmSwingsVs.GetValue());                
            }
            else
            {
                // End:0x1E3
                if(int(Outer.CurrentLaRocheStrikeAttempting) == int(25))
                {
                    return ConvertRangeToSeperation2D(Outer.VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartSawArmSwingsVs.GetValue());                    
                }
                else
                {
                    // End:0x278
                    if(int(Outer.CurrentLaRocheStrikeAttempting) == int(29))
                    {
                        return ConvertRangeToSeperation2D(Outer.VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartGrabingUR.GetValue());                        
                    }
                    else
                    {
                        // End:0x30A
                        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(30))
                        {
                            return ConvertRangeToSeperation2D(Outer.VsLarochePawn.TuneDataVsLaroche.DistanceToMoveToToStartGrabingUR.GetValue());
                        }
                    }
                }
            }
        }
    }
    return 200.0000000;
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if((EnemyForAttack != none) && !Outer.IsPawnInDirectStrikeZone(EnemyForAttack))
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

    // End:0x51
    if(Outer.VsLarochePawn.TuneDataVsLaroche.bForceGrabsOnlyNoFreeAttacks)
    {
        return true;        
    }
    else
    {
        // End:0x9F
        if(Outer.VsLarochePawn.TuneDataVsLaroche.bForceNotAllowedToGrabOnlyFreeAttacks)
        {
            return false;
        }
    }
    // End:0xFD
    if(Outer.VsLarochePawn.LastTimeSuccessfullyGrabOtherPawn < float(0))
    {
        Outer.CurrentLaRocheStruggleModeAttempting = 1;
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
                    if(int(Outer.CurrentLaRocheStrikeAttempting) == int(23))
                    {
                        Outer.CmdVsLarocheStrightSawingStrikeVs(EnemyForAttack,, 1);                        
                    }
                    else
                    {
                        // End:0x240
                        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(24))
                        {
                            Outer.VsLarochePawn.bPerformComboMeleeMoveThisStrike = false;
                            Outer.CmdVsLarocheArmSweepStrikeVs(EnemyForAttack,, 1);                            
                        }
                        else
                        {
                            // End:0x2CD
                            if(int(Outer.CurrentLaRocheStrikeAttempting) == int(25))
                            {
                                Outer.VsLarochePawn.bPerformComboMeleeMoveThisStrike = true;
                                Outer.CmdVsLarocheArmSweepStrikeVs(EnemyForAttack,, 1);                                
                            }
                            else
                            {
                                // End:0x324
                                if(int(Outer.CurrentLaRocheStrikeAttempting) == int(28))
                                {
                                    Outer.CmdVsLarocheEmpProjStrikeVs(EnemyForAttack,, 1);                                    
                                }
                                else
                                {
                                    // End:0x500
                                    if(int(Outer.CurrentLaRocheStrikeAttempting) == int(29))
                                    {
                                        // End:0x3A4
                                        if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(1))
                                        {
                                            Outer.CmdVsLarocheGrabStrikeVsRightForeArm(EnemyForAttack,, 1);                                            
                                        }
                                        else
                                        {
                                            // End:0x3FB
                                            if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(2))
                                            {
                                                Outer.CmdVsLarocheGrabStrikeVsRightWrist(EnemyForAttack,, 1);                                                
                                            }
                                            else
                                            {
                                                // End:0x452
                                                if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(3))
                                                {
                                                    Outer.CmdVsLarocheGrabStrikeVsRightElbow(EnemyForAttack,, 1);                                                    
                                                }
                                                else
                                                {
                                                    // End:0x4A9
                                                    if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(4))
                                                    {
                                                        Outer.CmdVsLarocheGrabStrikeVsRightArmToCutOffTool(EnemyForAttack,, 1);                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x4FD
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
                                        // End:0x6D9
                                        if(int(Outer.CurrentLaRocheStrikeAttempting) == int(30))
                                        {
                                            // End:0x580
                                            if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(1))
                                            {
                                                Outer.CmdVsLarocheGrabStrikeVsRightForeArm(EnemyForAttack,, 1);                                                
                                            }
                                            else
                                            {
                                                // End:0x5D7
                                                if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(2))
                                                {
                                                    Outer.CmdVsLarocheGrabStrikeVsRightWrist(EnemyForAttack,, 1);                                                    
                                                }
                                                else
                                                {
                                                    // End:0x62E
                                                    if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(3))
                                                    {
                                                        Outer.CmdVsLarocheGrabStrikeVsRightElbow(EnemyForAttack,, 1);                                                        
                                                    }
                                                    else
                                                    {
                                                        // End:0x685
                                                        if(int(Outer.CurrentLaRocheStruggleModeAttempting) == int(4))
                                                        {
                                                            Outer.CmdVsLarocheGrabStrikeVsRightArmToCutOffTool(EnemyForAttack,, 1);                                                            
                                                        }
                                                        else
                                                        {
                                                            // End:0x6D9
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
    //return;    
}

function NeedToPerformDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
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
