class LPAICmd_AlphaPackHunterDirectAttack extends LPAICmd_PackHunterDirectAttack within LPAIControllerAlphaPackHunter;

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
    local /*0x97E50000-0x00000000*/ private float randPickForBiteOr180Tail;

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
    // End:0x235
    if(rangeToEnemy2D <= Outer.PHPawn.TuneDataPackHunter.RangeToTargetForBiteStrike)
    {
        strikeToTry = Outer.GetNoMovementStikeToAttemptOnThisTarget(EnemyForAttack);
        // End:0x1F4
        if(int(strikeToTry) == int(3))
        {
            randPickForBiteOr180Tail = RandRange(0.0000000, 1.0000000);
            // End:0x1F4
            if(randPickForBiteOr180Tail > Outer.PHPawn.TuneDataPackHunter.PercentChanceOfTailWhipAttackInsteadOfBiteForTheAlpha)
            {
                CurStrikeCmd = Outer.CmdPackHunterShortDistanceBiteStrikePof(EnemyForAttack, strikeToTry,, 1);
                return;
            }
        }
        CurStrikeCmd = Outer.CmdPackHunter180TailWhipStrikePof(EnemyForAttack, strikeToTry,, 1);        
    }
    else
    {
        // End:0x2C3
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
