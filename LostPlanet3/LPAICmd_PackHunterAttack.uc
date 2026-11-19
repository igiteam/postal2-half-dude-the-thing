class LPAICmd_PackHunterAttack extends LPAICmd_LeychAttack within LPAIControllerPackHunter
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurHitReactionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bGettingKnockedOutOfAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlowingIn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastPlayerMeleeHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTimeBetweenPlayerMeleeHitReactions[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastDamageTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfConsecutiveKnockbacksLeft[536870913];

function Pushed()
{
    super.Pushed();
    bGettingKnockedOutOfAttack = false;
    bPlowingIn = false;
    //return;    
}

function Popped()
{
    UseAnimationNormal();
    StopProcessWidthdrawFromFightMonitorTimer();
    AbortAnyRunningChildCommand();
    Outer.EnableAnnounceHeadGlow(false);
    Outer.EnableAnnounceTailGlow(false);
    Outer.PHPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.LockStrikeAccess(false);
    Outer.EnablePHDefaultHitReaction(true);
    // End:0x14D
    if(Outer.bBeSuperAggressive)
    {
        SoloAggressiveIndicatorValue = 0.0000000;
        StopProcessSoloAggressiveIndicatorTimer();
        Outer.EnableAnnounceHeadGlow(false);
        Outer.EnableAnnounceTailGlow(false);
    }
    // End:0x171
    if(Outer.PHPawn != none)
    {
    }
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetResSurroundMultiLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609];

    ResSurroundMultiLocation = ResourceForFormation;
    //return;    
}

function SetBeSuperAggressive()
{
    local /*0x97E50000-0x00000000*/ private bool bAggressive[8388609];

    Outer.bBeSuperAggressive = bAggressive;
    // End:0xB6
    if(Outer.bBeSuperAggressive && Outer.PHPawn.TuneDataPackHunter.bUseSoloAggressivePulse)
    {
        SoloAggressiveIndicatorValue = 0.0000000;
        StartProcessSoloAggressiveIndicatorTimer();        
    }
    else
    {
        StopProcessSoloAggressiveIndicatorTimer();
    }
    //return;    
}

protected function AbortAnyRunningChildCommand()
{
    super.AbortAnyRunningChildCommand();
    //return;    
}

function ShouldTurnToFaceBeforeAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTurnToFaceTargetCommandNeeded(EnemyForAttack, Outer.PHPawn.TuneDataPackHunter.MinAngleNeededForTurnToFaceCommandBeforeAnnounce);
    //return ReturnValue;    
}

function ShouldTurnToFaceFocusBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTurnToFaceTargetCommandNeeded(EnemyForAttack, Outer.PHPawn.TuneDataPackHunter.MinAngleNeededForTurnToFaceCommandBeforeAnnounce);
    //return ReturnValue;    
}

function IfNeededChoosePreMoveInStrikeToAttempt()
{
    UseAnimationAggressive();
    //return;    
}

function HandlePreAnnounceFocusSetting()
{
    Outer.Focus = none;
    //return;    
}

function HandlePreAnnounceTurnToFaceEnemyFocusSetting()
{
    Outer.Focus = Outer.MyLPEnemy;
    //return;    
}

function HandlePostAnnounceTurnToFaceEnemyFocusSetting()
{
    Outer.Focus = none;
    //return;    
}

function HandlePostAnnouncePremovementLockingOfStrikeAccess()
{
    Outer.LockStrikeAccess(false);
    //return;    
}

function HandleStartOfMoveCloserToTargetSubState()
{
    Outer.EnablePHDefaultHitReaction(false);
    Outer.LockStrikeAccess(false);
    // End:0xF4
    if(!Outer.bBeSuperAggressive && !Outer.PHPawn.TuneDataPackHunter.bUseSoloAggressivePulse)
    {
        Outer.EnableAnnounceHeadGlow(true);
        Outer.EnableAnnounceTailGlow(true);
    }
    //return;    
}

function HandleStartOfPerformStrikesSubState()
{
    Outer.EnablePHDefaultHitReaction(true);
    //return;    
}

function HandleEffectsForJustForStartOfStrikeCommands()
{
    // End:0xB4
    if(!Outer.bBeSuperAggressive || !Outer.PHPawn.TuneDataPackHunter.bUseSoloAggressivePulse)
    {
        Outer.EnableAnnounceHeadGlow(true);
        Outer.EnableAnnounceTailGlow(true);
    }
    //return;    
}

function HandleEffectsForEndOfDamageAssessment()
{
    // End:0xB4
    if(!Outer.bBeSuperAggressive || !Outer.PHPawn.TuneDataPackHunter.bUseSoloAggressivePulse)
    {
        Outer.EnableAnnounceHeadGlow(true);
        Outer.EnableAnnounceTailGlow(true);
    }
    //return;    
}

function GetShortAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterAttackAnnounce';
    //return ReturnValue;    
}

function GetLongAnnounceSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterAttackAnnounceLonger';
    //return ReturnValue;    
}

function HandlePossibilityTookEnoughDamageToCauseBehaviorChange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bonAnimatedPath;

    // End:0x4D
    if((CurMoveToActorCmd != none) && LPAICmd_AnimatedPath(CurMoveToActorCmd.ChildCommand) != none)
    {
        bonAnimatedPath = true;        
    }
    else
    {
        // End:0x9A
        if((MoveToPositionCmd != none) && LPAICmd_AnimatedPath(MoveToPositionCmd.ChildCommand) != none)
        {
            bonAnimatedPath = true;            
        }
        else
        {
            bonAnimatedPath = false;
        }
    }
    // End:0x2E6
    if(((((CurMoveToActorCmd != none) || MoveToPositionCmd != none) || CurStrikeCmd != none) && Outer.PHPawn != none) && !bonAnimatedPath)
    {
        // End:0x2E6
        if(AmountOfDamageReceivedSoFarThisAttack >= AmountOfDamageToCausePlowInThisAttack)
        {
            Outer.PHPawn.GetMovementInteruptionEffectBasedOnCurrentVelocityAndFacing(Outer.PHPawn.LastMovementInteruptionEffectDirection, Outer.PHPawn.LastMovementInteruptionEffectSpeedFactor, false);
            // End:0x29A
            if((int(Outer.PHPawn.LastMovementInteruptionEffectDirection) == int(1)) && int(Outer.PHPawn.LastMovementInteruptionEffectSpeedFactor) > int(1))
            {
                bGettingKnockedOutOfAttack = true;
                // End:0x297
                if(int(Outer.PHPawn.LastMovementInteruptionEffectSpeedFactor) == int(5))
                {
                    bPlowingIn = true;                    
                }                
            }
            else
            {
                bGettingKnockedOutOfAttack = true;
                bGettingKnockedDown = true;
            }
            Outer.CmdStatus_PackHunterRunningAttack.KnockedOutOfStrikeByCoreHit();
        }
    }
    // End:0x4CE
    if((!bonAnimatedPath && !bGettingKnockedOutOfAttack) && (int(Outer.WorldInfo.NetMode) != int(NM_Standalone)) || Outer.bIndoorBehavior)
    {
        // End:0x4CE
        if((ShouldLastDamageContributeTowardsKnockback()) && AmountOfDamageReceivedSoFarThisAttack >= Outer.PHPawn.TuneDataPackHunter.AmountOfDamageToBeginKnockback.GetValue())
        {
            AbortAnyRunningChildCommand();
            Outer.PositionToWithdrawTo = vect(0.0000000, 0.0000000, 0.0000000);
            // End:0x4BE
            if(bPerformingAnnounce)
            {
                // End:0x475
                if(bShouldUseShortAnnounce)
                {
                    Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounce');                    
                }
                else
                {
                    Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounceLonger');
                }
                bPerformingAnnounce = false;
            }
            GotoState('KnockedBack_MP');
            return true;
        }
    }
    // End:0x887
    if((!bonAnimatedPath && AmountOfDamageReceivedSoFarThisAttack >= AmountOfDamageToStopTheAttackThisAttack) && !bGettingKnockedOutOfAttack)
    {
        NumOfAttemptsToFindWithDrawPointThisAttack = 0;
        AbortAnyRunningChildCommand();
        // End:0x5BF
        if(bPerformingAnnounce)
        {
            // End:0x576
            if(bShouldUseShortAnnounce)
            {
                Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounce');                
            }
            else
            {
                Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounceLonger');
            }
            bPerformingAnnounce = false;
        }
        Outer.PositionToWithdrawTo = vect(0.0000000, 0.0000000, 0.0000000);
        Outer.PHPawn.GetMovementInteruptionEffectBasedOnCurrentVelocityAndFacing(Outer.PHPawn.LastMovementInteruptionEffectDirection, Outer.PHPawn.LastMovementInteruptionEffectSpeedFactor, false);
        // End:0x80D
        if((((Outer.WorldInfo.TimeSeconds - Outer.TimeStampFallDown) > Outer.PHPawn.TuneDataPackHunter.MinTimeBetweenFalls) && int(Outer.PHPawn.LastMovementInteruptionEffectDirection) == int(1)) && int(Outer.PHPawn.LastMovementInteruptionEffectSpeedFactor) > int(1))
        {
            bGettingKnockedOutOfAttack = true;
            // End:0x7FC
            if(int(Outer.PHPawn.LastMovementInteruptionEffectSpeedFactor) == int(5))
            {
                bPlowingIn = true;
            }
            GotoState('StopRunInFallDownOrPlowIn');            
        }
        else
        {
            // End:0x880
            if((int(Outer.WorldInfo.NetMode) != int(NM_Standalone)) || Outer.bIndoorBehavior)
            {
                GotoState('KnockedBack_MP');                
            }
            else
            {
                return false;
            }
        }
        return true;        
    }
    else
    {
        // End:0xA26
        if(((Outer.WorldInfo.TimeSeconds - Outer.TimeStampFallDown) > Outer.PHPawn.TuneDataPackHunter.MinTimeBetweenFalls) && (bGettingKnockedOutOfAttack || bPlowingIn) || bGettingKnockedDown)
        {
            // End:0xA23
            if(!bonAnimatedPath)
            {
                AbortAnyRunningChildCommand();
                // End:0xA10
                if(bPerformingAnnounce)
                {
                    // End:0x9C7
                    if(bShouldUseShortAnnounce)
                    {
                        Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounce');                        
                    }
                    else
                    {
                        Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounceLonger');
                    }
                    bPerformingAnnounce = false;
                }
                GotoState('StopRunInFallDownOrPlowIn');
                return true;                
            }            
        }
        else
        {
            // End:0xA7A
            if(!bonAnimatedPath && CurSpecialMoveCmd != none)
            {
                Outer.AbortCommand(CurSpecialMoveCmd);
                CurSpecialMoveCmd = none;
            }
            // End:0xB1D
            if(bPerformingAnnounce)
            {
                // End:0xAD4
                if(bShouldUseShortAnnounce)
                {
                    Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounce');                    
                }
                else
                {
                    Outer.PHPawn.EndSpecialMove(Class'LPSM_PackHunterAttackAnnounceLonger');
                }
                bPerformingAnnounce = false;
            }
        }
    }
    // End:0xB2C
    if(bonAnimatedPath)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetMinZDistanceToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 100.0000000;
    //return ReturnValue;    
}

function ShouldZeroVelocityOnFinishOfMoveToEnemyForStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function ShouldJumpBackBeforeWithDrawToMeleePoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x78
    if(Outer.WorldInfo.TimeSeconds > (Outer.LastJumpBackTime + Outer.MinTimeBetweenConsecutiveJumpBacks))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function DoesHunterStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function DoesStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (DoesHunterStillNeedToMoveCloserToEnemy()) || Outer.IsObstacleInTheWay(EnemyForAttack);
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    //return;    
}

function GetPauseBetweenStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterShortPauseBetweenDirectAttackStrikes';
    //return ReturnValue;    
}

function NeedToPerformDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function EndOfAttackCleanUp()
{
    UseAnimationNormal();
    //return;    
}

function UseAnimationAggressive()
{
    Outer.PHPawn.UseContextSensitiveAnimObject(Outer.PHPawn.DirectAttackSuperAggressiveAnimations, -1.0000000);
    //return;    
}

function UseAnimationNormal()
{
    Outer.PHPawn.UseContextSensitiveAnimObject(none, -1.0000000);
    //return;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float HitAngle;
    local /*0x97E50000-0x00000000*/ private @NULL CorePhysicalMaterial;

    // End:0x1C8
    if(!IsInState('MeleeHitReaction') && (Outer.WorldInfo.TimeSeconds - LastPlayerMeleeHit) > MinTimeBetweenPlayerMeleeHitReactions)
    {
        HitAngle = Outer.PawnGetHitAngle();
        // End:0x1C8
        if((HitAngle >= 315.0000000) || HitAngle < 45.0000000)
        {
            Outer.PHPawn.EndSpecialMove(none);
            AbortAnyRunningChildCommand();
            GotoState('MeleeHitReaction');
            CorePhysicalMaterial = SPPhysicalMaterial(Outer.PHPawn.DamageStateComponent.BodyParts[0].PhysMat);
            LPPlayerPawn(PlayerPawn).ImpactCombatTargetPlayEffects(Outer.PHPawn, Class'LPDamageTypeMelee', CorePhysicalMaterial);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldLastDamageContributeTowardsKnockback()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DamageDir, Forward;
    local /*0x97E50000-0x00000000*/ private float dotprod, enemySeparation;

    // End:0x4E
    if(Outer.PHPawn.TakeDamageParams.DamageCauser == none)
    {
        return false;
    }
    enemySeparation = ActorSeperation2D(Outer.PHPawn.TakeDamageParams.DamageCauser);
    // End:0x116
    if(enemySeparation > Outer.PHPawn.TuneDataPackHunter.MaxDistanceFromEnemyToPerformKnockback.GetValue())
    {
        return false;
    }
    DamageDir = Normal(Outer.PHPawn.TakeDamageParams.DamageCauser.Location - Outer.PHPawn.Location);
    Forward = Vector(Outer.PHPawn.Rotation);
    dotprod = Forward Dot DamageDir;
    // End:0x222
    if(dotprod < float(0))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function CanProcessWidthdrawFromFightMonitor()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(ResSurroundMultiLocation != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetFormationCenterAndRadius()
{
    local /*0x97E50000-0x00000000*/ private @NULL FormationCenter[25165825];
    local /*0x97E50000-0x00000000*/ private float FormationRadius[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x63
    if(ResSurroundMultiLocation != none)
    {
        FormationCenter = ResSurroundMultiLocation.GetFormationCenter();
        FormationRadius = ResSurroundMultiLocation.GetFormationRadius();
        return true;
    }
    return false;
    //return ReturnValue;    
}

final function StartProcessSoloAggressiveIndicatorTimer()
{
    // End:0x5D
    if(!Outer.bDisableAI && !IsProcessSoloAggressiveIndicatorTimerActive())
    {
        Outer.SetTimer(0.0100000, true, 'ProcessSoloAggressiveIndicatorTimer', self);
    }
    //return;    
}

final function StopProcessSoloAggressiveIndicatorTimer()
{
    Outer.ClearTimer('ProcessSoloAggressiveIndicatorTimer', self);
    //return;    
}

function PauseProcessSoloAggressiveIndicatorTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopProcessSoloAggressiveIndicatorTimer();        
    }
    else
    {
        StartProcessSoloAggressiveIndicatorTimer();
    }
    //return;    
}

final function IsProcessSoloAggressiveIndicatorTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('ProcessSoloAggressiveIndicatorTimer', self);
    //return ReturnValue;    
}

private final function ProcessSoloAggressiveIndicatorTimer()
{
    ProcessSoloAggressiveIndicator();
    //return;    
}

function ProcessSoloAggressiveIndicator()
{
    local /*0x97E50000-0x00000000*/ private float NewValue;

    // End:0x15E
    if(Outer.PHPawn != none)
    {
        NewValue = (1.0000000 + Sin(Outer.PHPawn.TuneDataPackHunter.SoloAggressivePulseFrequency * SoloAggressiveIndicatorValue)) * 0.5000000;
        Outer.PHPawn.HeadGlowFactor = NewValue;
        Outer.PHPawn.TailGlowFactor = NewValue;
        SoloAggressiveIndicatorValue += Outer.PHPawn.TuneDataPackHunter.SoloAggressivePulseRate;
    }
    //return;    
}

function ShouldFaceEnemyBetweenStrikes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

state StateCmdActive
{
    function NotifyPlayerStartMelee()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL CurStaticStrikeCmd;

        CurStaticStrikeCmd = LPAICmd_PackHunterStaticStrikeBase(ChildCommand);
        // End:0xB7
        if(Class'SPEngine.SPUtil'.static.IsInFront(Outer.PHPawn, PlayerPawn) && (CurStaticStrikeCmd == none) || !CurStaticStrikeCmd.bSpecialMovePlaying)
        {
            AbortAnyRunningChildCommand();
            GotoState('MeleeReaction');            
        }
        return true;
        //return ReturnValue;        
    }

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private byte coreHit;

        LastDamageTime = Outer.WorldInfo.TimeSeconds;
        // End:0x65
        if(TypeOfDamage == Class'LPDamageTypeMelee')
        {
            AmountOfDamageReceivedSoFarThisAttack = float(2147483647);
        }
        bGettingKnockedOutOfAttack = false;
        bPlowingIn = false;
        bGettingKnockedDown = false;
        coreHit = 3;
        // End:0x1F6
        if(Outer.PHPawn != none)
        {
            AmountOfDamageReceivedSoFarThisAttack += AmountOfDamage;
            // End:0x199
            if(Outer.PHPawn.MyCoreData.Length >= HitCoreIndex)
            {
                // End:0x199
                if(Outer.PHPawn.MyCoreData[HitCoreIndex].CoreID == 0)
                {
                    // End:0x199
                    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                    {
                        bTookGrenadeInMouth = true;
                        AmountOfDamageReceivedSoFarThisAttack = float(2147483647);
                    }
                }
            }
            // End:0x1F6
            if(HandlePossibilityTookEnoughDamageToCauseBehaviorChange())
            {
                // End:0x1F4
                if((int(coreHit) == int(1)) || int(coreHit) == int(2))
                {
                    Outer.StartAdditiveTailCoreHitAnimation(1.0000000);
                }
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

        AmountOfDamageReceivedSoFarThisAttack += AmountOfDamage;
        LastDamageTime = Outer.WorldInfo.TimeSeconds;
        // End:0x79
        if(TypeOfDamage == Class'LPDamageTypeMelee')
        {
            AmountOfDamageReceivedSoFarThisAttack = float(2147483647);
        }
        return HandlePossibilityTookEnoughDamageToCauseBehaviorChange();
        //return ReturnValue;        
    }

    function GetDelayBetweenStrikeAttempts()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return RandRange(Outer.PHPawn.TuneDataPackHunter.MinDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormation.GetValue(), Outer.PHPawn.TuneDataPackHunter.MaxDelayBetweenStrikeAttemptsWhenDirectAttackFromStaticFormation.GetValue());
        //return ReturnValue;        
    }

    function SetDesiredVelocityOutOfAnnounce()
    {
        local /*0x97E50000-0x00000000*/ private @NULL moveDir;
        local /*0x97E50000-0x00000000*/ private float seperationToEnemy;

        seperationToEnemy = EnemySeperation2D();
        // End:0x1CF
        if(seperationToEnemy > Outer.PHPawn.TuneDataPackHunter.MinSeperationToEnemyToAllowOutOfAnnounceSuperAcceleration)
        {
            moveDir = Normal(Outer.PHPawn.Velocity);
            Outer.PHPawn.DesiredSpeed = Outer.PHPawn.TuneDataPackHunter.DesiredSpeedCommingOutOfTheAnnounce;
            Outer.PHPawn.Velocity = (moveDir * Outer.PHPawn.DesiredSpeed) * Outer.PHPawn.GroundSpeed;            
        }
        //return;        
    }
    stop;    
}

state MeleeReaction
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.LockStrikeAccess(false);
    CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
    CurTurnToFaceCmd = none;
    CurDamageAssessmentCmd = Outer.CmdDamageAssessment(EnemyForAttack, 5.0000000, 5.0000000,, 1);
    CurDamageAssessmentCmd = none;
    GetStrikeAccess(EnemyForAttack,, true);
    // End:0x143
    if(Outer.HaveStrikeAccess())
    {
        // End:0x12D
        if((DoesHunterStillNeedToMoveCloserToEnemy()) || Outer.IsObstacleInTheWay(EnemyForAttack))
        {
            GotoState('StateCmdActive', 'MoveCloserToTarget');            
        }
        else
        {
            GotoState('StateCmdActive', 'PerformStrikes');
        }
    }
    Outer.PopCommand(self);
    stop;                    
}

state MeleeHitReaction
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.AbortCommand(CurHitReactionCmd);
        CurHitReactionCmd = none;
        LastPlayerMeleeHit = Outer.WorldInfo.TimeSeconds;
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.LockStrikeAccess(false);
    CurHitReactionCmd = Outer.CmdHitReaction(0.0000000,, 1);
    CurHitReactionCmd = none;
    GetStrikeAccess(EnemyForAttack,, true);
    // End:0xFC
    if(Outer.HaveStrikeAccess())
    {
        // End:0xE6
        if((DoesHunterStillNeedToMoveCloserToEnemy()) || Outer.IsObstacleInTheWay(EnemyForAttack))
        {
            GotoState('StateCmdActive', 'MoveCloserToTarget');            
        }
        else
        {
            GotoState('StateCmdActive', 'PerformStrikes');
        }
    }
    Outer.PopCommand(self);
    stop;                
}

state RetreatToMeleePoint
{
    function StartMovingToWithdrawpoint()
    {
        Outer.PHPawn.PlayPackhunterScaredSound();
        super.StartMovingToWithdrawpoint();
        //return;        
    }
    stop;    
}

state KnockedBack_MP
{
    function CheckAbortJumpback()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x43
        if(bTookGrenadeInMouth)
        {
            Outer.AbortCommand(CurJumpBackCmd);
            CurJumpBackCmd = none;
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    event NotifyOfNonCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x11
        if(!ShouldLastDamageContributeTowardsKnockback())
        {
            return false;
        }
        LastDamageTime = Outer.WorldInfo.TimeSeconds;
        AmountOfDamageReceivedSoFarThisAttack += AmountOfDamage;
        CheckAbortJumpback();
        return false;
        //return ReturnValue;        
    }

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x11
        if(!ShouldLastDamageContributeTowardsKnockback())
        {
            return false;
        }
        LastDamageTime = Outer.WorldInfo.TimeSeconds;
        // End:0x13E
        if(Outer.PHPawn != none)
        {
            // End:0x13E
            if(Outer.PHPawn.MyCoreData.Length >= HitCoreIndex)
            {
                // End:0x13E
                if(Outer.PHPawn.MyCoreData[HitCoreIndex].CoreID == 0)
                {
                    // End:0x13E
                    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                    {
                        bTookGrenadeInMouth = true;
                        AmountOfDamage = float(2147483647);
                    }
                }
            }
        }
        AmountOfDamageReceivedSoFarThisAttack += AmountOfDamage;
        CheckAbortJumpback();
        return false;
        //return ReturnValue;        
    }
Begin:

    AbortAnyRunningChildCommand();
    NumOfConsecutiveKnockbacksLeft = int(RandRange(float(int(Outer.PHPawn.TuneDataPackHunter.MinConsecutiveKnockbacks.GetValue())), float(int(Outer.PHPawn.TuneDataPackHunter.MaxConsecutiveKnockbacks.GetValue()))));
Loop:


    Outer.Focus = EnemyForAttack;
    AmountOfDamageReceivedSoFarThisAttack = 0.0000000;
    // End:0x285
    if(Outer.IsThereSpaceToJumpBack())
    {
        CurJumpBackCmd = Outer.CmdJumpBack(EnemyForAttack, bTookGrenadeInMouth,, 1);
        CurJumpBackCmd = none;
        // End:0x1A9
        if(bTookGrenadeInMouth)
        {
            NumOfConsecutiveKnockbacksLeft--;
            goto 'Loop';
        }
        // End:0x285
        if(((NumOfConsecutiveKnockbacksLeft > 0) && AmountOfDamageReceivedSoFarThisAttack > Outer.PHPawn.TuneDataPackHunter.AmountOfDamageToContinueKnockback.GetValue()) && (Outer.WorldInfo.TimeSeconds - LastDamageTime) < 0.5000000)
        {
            NumOfConsecutiveKnockbacksLeft--;
            goto 'Loop';
        }
    }
    Outer.Focus = none;
    AmountOfDamageReceivedSoFarThisAttack = 0.0000000;
    NumOfConsecutiveKnockbacksLeft = 0;
    CurSpecialMoveCmd = none;
    Outer.PopCommand(self);
    stop;        
}

state StopRunInFallDownOrPlowIn
{
    ignores PushedState, PoppedState;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        AmountOfDamageReceivedSoFarThisAttack = 0.0000000;
        Outer.TimeStampFallDown = Outer.WorldInfo.TimeSeconds;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        AmountOfDamageReceivedSoFarThisAttack = 0.0000000;
        //return;        
    }
Begin:

    Outer.CmdPackHunterPlowIn(EnemyForAttack, bTookGrenadeInMouth, bPlowingIn, bGettingKnockedDown,, 1);
    Outer.PopCommand(self);
    stop;            
}

defaultproperties
{
    MinTimeBetweenPlayerMeleeHitReactions=2.0000000
}