class LPAICmd_PackHunterDirectAttack extends LPAICmd_PackHunterAttack within LPAIControllerPackHunter;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.NotifyCombatManagerOfAttackCompleted(18, !(NumberOfStrikesDoneSoFarThisAttack > 0) || CurStrikeCmd != none, false, false);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    local /*0x97E50000-0x00000000*/ private float rangeToEnemy2D;
    local /*0x97E50000-0x00000000*/ private byte strikeToTry;

    // End:0x2D
    if(Outer.CheckForMultiEnemyAttack(EnemyForAttack))
    {
        return;
    }
    // End:0x90
    if(Outer.WantsToDoStruggleMode(EnemyForAttack))
    {
        CurStrikeCmd = Outer.CmdPackHunterStrugglePofStrike(EnemyForAttack,, 1);
        return;
    }
    rangeToEnemy2D = EnemyRange2D();
    // End:0x259
    if(rangeToEnemy2D <= Outer.PHPawn.TuneDataPackHunter.RangeToTargetForBiteStrike)
    {
        strikeToTry = Outer.GetNoMovementStikeToAttemptOnThisTarget(EnemyForAttack);
        // End:0x1AD
        if(((int(strikeToTry) == int(3)) || int(strikeToTry) == int(5)) || int(strikeToTry) == int(4))
        {
            CurStrikeCmd = Outer.CmdPackHunterShortDistanceBiteStrikePof(EnemyForAttack, strikeToTry,, 1);            
        }
        else
        {
            // End:0x218
            if((int(strikeToTry) == int(10)) || int(strikeToTry) == int(9))
            {
                CurStrikeCmd = Outer.CmdPackHunterLargeTurnClawStrikePof(EnemyForAttack, strikeToTry,, 1);                
            }
            else
            {
                CurStrikeCmd = Outer.CmdPackHunter180TailWhipStrikePof(EnemyForAttack, strikeToTry,, 1);
            }
        }        
    }
    else
    {
        // End:0x2E7
        if(rangeToEnemy2D <= Outer.PHPawn.TuneDataPackHunter.RangeToTargetForMediumClawLungeStrike)
        {
            CurStrikeCmd = Outer.CmdPackHunterMediumClawLungeStrikePof(EnemyForAttack,, 1);            
        }
        else
        {
            CurStrikeCmd = Outer.CmdPackHunterFarClawLungeStrikePof(EnemyForAttack,, 1);
        }
    }
    //return;    
}

function GetMinZDistanceToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.PHPawn.TuneDataPackHunter.MinZDistanceToRequireMoveBeforeStrike;
    //return ReturnValue;    
}

function GetMinSeperationToRequireMoveBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ConvertRangeToSeperation2D(Outer.PHPawn.TuneDataPackHunter.MaxSeperationForDirectPhysicalStrike);
    //return ReturnValue;    
}

function GetSeperationToMoveToBeforeStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return ConvertRangeToSeperation2D(Outer.PHPawn.TuneDataPackHunter.IdealDirectAttackStrikeRange);
    //return ReturnValue;    
}

function DoesHunterStillNeedToMoveCloserToEnemy()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(EnemyForAttack == none)
    {
        return false;
    }
    // End:0x40
    if(!Outer.IsPawnInDirectStrikeZone(EnemyForAttack))
    {
        return true;
    }
    // End:0x5B
    if((EnemyZDistance()) >= (GetMinZDistanceToRequireMoveBeforeStrike()))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x16
    if(int(TypeOfAttack) == int(18))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HandleStartOfDamageAssessmentSubState()
{
    local /*0x97E50000-0x00000000*/ private float inCurrentStateAttackScaler;

    inCurrentStateAttackScaler = 1.1000000;
    // End:0xA6
    if(!Outer.PHPawn.TuneDataPackHunter.bDoOnlyForcedDashAttack)
    {
        Outer.CurrentCombatMgrResourceRef.PublishNewAttackOption(Outer, 18, inCurrentStateAttackScaler);
    }
    //return;    
}

function HandleWaitingBetweenStrikesCommands()
{
    super(LPAICmd_LeychAttack).HandleWaitingBetweenStrikesCommands();
    Outer.LastWaitBetweenStrikeCommands = Outer.WorldInfo.TimeSeconds;
    //return;    
}

function ShouldPerformAnnounce()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x5E
    if((Outer.WorldInfo.TimeSeconds - Outer.LastWaitBetweenStrikeCommands) < float(5))
    {
        return false;
    }
    return super(LPAICmd_LeychAttack).ShouldPerformAnnounce();
    //return ReturnValue;    
}
