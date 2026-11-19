class LPAICmd_MedFlyerRangedAttackVs extends LPAICmd_MedFlyerBasicRangedAttack within LPAIControllerMedFlyer;

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

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
    //return;    
}

function DoesStillNeedToMoveCloserToEnemyForRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float rangeToStrikeLoc;

    // End:0xC4
    if(IsMyEnemyAlive())
    {
        rangeToStrikeLoc = VSize(Outer.RangedFireLocationToStrikeFrom - Outer.MedFlyerPawn.Location);
        // End:0xC4
        if(rangeToStrikeLoc > Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForLobFirePointBeforeAllowedToFire)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function PerformBestRangedStikeBasedOnDistanceToTarget()
{
    CurStrikeCmd = Outer.CmdMedFlyerBasicLobStrike(EnemyForAttack,, 1);
    //return;    
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
    stop;    
}
