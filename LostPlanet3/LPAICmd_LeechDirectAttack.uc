class LPAICmd_LeechDirectAttack extends LPAICmd_LeychAttack within LPAIControllerLeech;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ReleaseAttackAccess();
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Attack).SPAborted();
    Outer.ReleaseAttackAccess();
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

function ShouldPerformSnapTurnBeforeMovingToDamageAssessmentAfterStrikes()
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

function GetCanNotStrikeAfterMoveToEnemyAndGoingToDamageAssessmentSnapTurnSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x41
    if(Outer.LeechPawn.IsInverted())
    {
        return Class'LPSM_LeechTurnLeft180Inverted';
    }
    return Class'LPSM_LeechTurnLeft180';
    //return ReturnValue;    
}

function GetGoingToDamageAssessmentSnapTurnSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x41
    if(Outer.LeechPawn.IsInverted())
    {
        return Class'LPSM_LeechTurnLeft180Inverted';
    }
    return Class'LPSM_LeechTurnLeft180';
    //return ReturnValue;    
}

function HaveRequiredAccessForForStrikingDuringAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.DoesLeechHaveAccessToStrike(EnemyForAttack);
    //return ReturnValue;    
}

function ShouldTurnToFaceFocusBeforeDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function MaxRandomLagJumpBack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.LeechPawn.TuneDataLeech.JumpBackMaxRandomLag;
    //return ReturnValue;    
}

function HasStrikeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        return EnemyForAttack.AIResourceManager.HasTimerExpired('LeechStrikeTimer');        
    }
    else
    {
        // End:0x8A
        if(EnemyForAttack == none)
        {
            return false;            
        }
        else
        {
            return true;
        }
    }
    //return ReturnValue;    
}

function ResetStrikeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x99
    if((EnemyForAttack != none) && EnemyForAttack.AIResourceManager != none)
    {
        EnemyForAttack.AIResourceManager.ResetTimerRange('LeechStrikeTimer', MinTime, MaxTime);        
    }
    else
    {
        // End:0xAB
        if(EnemyForAttack == none)
        {            
        }
    }
    //return;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x2C6
    if(Outer.LeechPawn != none)
    {
        // End:0xBC
        if(Outer.LeechPawn.TuneDataLeech.bDoOnlyForcedStruggle)
        {
            return Outer.myAIPawn.TuneDataAIPawn.MaxSeperationForDirectPhysicalStrike;            
        }
        else
        {
            // End:0x176
            if((EnemyForAttack.Health < Outer.MaxEnemyHitPointsToStartStruggle) && Outer.HasStruggleModeWaitTimerExpired(EnemyForAttack))
            {
                return Outer.myAIPawn.TuneDataAIPawn.MaxSeperationForDirectPhysicalStrike;                
            }
            else
            {
                // End:0x27D
                if(Outer.bAllowUseOfInvertedAttackBehavior)
                {
                    // End:0x227
                    if(!Outer.LeechPawn.IsInverted())
                    {
                        return ConvertRangeToSeperation2D(Outer.LeechPawn.TuneDataLeech.MaxRangeForFlippingTailStrike);                        
                    }
                    else
                    {
                        return ConvertRangeToSeperation2D(Outer.LeechPawn.TuneDataLeech.MaxRangeForInvertedJumpBiteStrike);
                    }                    
                }
                else
                {
                    return Outer.myAIPawn.TuneDataAIPawn.MaxSeperationForDirectPhysicalStrike;
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

function DoesInversionStateAllowStruggleMode()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x87
    if(Outer.LeechPawn.IsInverted())
    {
        // End:0x85
        if(Outer.LeechPawn.TuneDataLeech.bAllowedToGoToStruggleModeWhenInverted)
        {
            return true;
        }
        return false;
    }
    return true;
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    // End:0x23D
    if(Outer.LeechPawn != none)
    {
        // End:0xB6
        if(Outer.WantsToDoStruggleMode(EnemyForAttack) && DoesInversionStateAllowStruggleMode())
        {
            Outer.GetStruggleAccess(EnemyForAttack);
            Outer.CmdLeechStrugglePofStrike(EnemyForAttack,, 1);            
        }
        else
        {
            // End:0x16D
            if(Outer.bAllowUseOfInvertedAttackBehavior)
            {
                // End:0x13F
                if(!Outer.LeechPawn.IsInverted())
                {
                    Outer.CmdLeechFlipTailStrikePof(EnemyForAttack,, 1);                    
                }
                else
                {
                    Outer.CmdLeechInvertedJumpBiteStrikePof(EnemyForAttack,, 1);
                }                
            }
            else
            {
                // End:0x212
                if(RandRange(0.0000000, 1.0000000) < Outer.LeechPawn.TuneDataLeech.ChanceToPerformBiteStrike.GetValue())
                {
                    Outer.CmdLeechJumpBiteStrikePof(EnemyForAttack,, 1);                    
                }
                else
                {
                    Outer.CmdLeechSchnallStrikePof(EnemyForAttack,, 1);
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

    return Class'LPSM_LeechPauseBetweenStrikes';
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

    event NotifyOfCoreHit()
    {
        local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
        //return ReturnValue;        
    }
    stop;    
}
