class LPAICmd_SepiaMortarAttack extends LPAICmd_MortarAttackBase within LPAIControllerSepia;

function Pushed()
{
    super.Pushed();
    Outer.bPerformingAttack = true;
    // End:0xB1
    if(Outer.SepiaPawn.TuneDataSepia.bTurnOnAttackMouthGlowAtStartOfTheAttack.GetValue() != float(0))
    {
        Outer.EnableSepiaHeadGlowEffects(true);
    }
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.bPerformingAttack = false;
    // End:0xD7
    if((Outer.SepiaPawn != none) && Outer.SepiaPawn.TuneDataSepia.bTurnOnAttackMouthGlowAtStartOfTheAttack.GetValue() != float(0))
    {
        Outer.EnableSepiaHeadGlowEffects(false);
    }
    //return;    
}

function HaveRequiredAccessForForStrikingDuringRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x78
    if(MortarAttackSetupInfo.bUseCombatManager && LPPawn(TheTarget) != none)
    {
        // End:0x73
        if(Outer.DoesSepiaHaveAccessToLobStrike(LPPawn(TheTarget)))
        {
            return true;            
        }
        else
        {
            return false;
        }        
    }
    else
    {
        // End:0xE2
        if(TheTarget != none)
        {
            // End:0xE0
            if((NextTimeToLaunchLobStrike < float(0)) || NextTimeToLaunchLobStrike < Outer.WorldInfo.TimeSeconds)
            {
                return true;                
            }
            else
            {
                return false;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function CanStillPerformRangedStrikeAgainstCurrentTarget()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    ProcessPossibilityTargetAppeared();
    // End:0x19
    if(CanFireLobShotFromTargetLocation())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function PerformBestRangedStikeBasedOnDistanceToTarget()
{
    CurStrikeCmd = Outer.CmdSepiaMedRangeSpitStrikePof(EnemyForAttack,, 1);
    super.PerformBestRangedStikeBasedOnDistanceToTarget();
    //return;    
}

function GetPauseBetweenRangedStrikesSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_SepiaPauseBetweenStrikes';
    //return ReturnValue;    
}

function GetMaxRangeFormRangedFirePointBeforeAllowedToFire()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.SepiaPawn.TuneDataSepia.MaxRangeForLobFirePointBeforeAllowedToFire;
    //return ReturnValue;    
}

function MoveToEnemyForRangedStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float rangeToStrikeLoc, maxRangeFormRangedFirePointBeforeAllowedToFire;

    // End:0x5E1
    if((TheTarget != none) || LocationToLaunchFrom != none)
    {
        // End:0x42
        if((LocationToLaunchFrom == none) && !bFoundValidLobStrikeLocationWhenNonGiven)
        {
            return false;
        }
        // End:0x5DF
        if((LocationToLaunchFrom != none) || bFoundValidLobStrikeLocationWhenNonGiven)
        {
            // End:0xBA
            if(bFoundValidLobStrikeLocationWhenNonGiven)
            {
                rangeToStrikeLoc = VSize(PointToStrikeFrom - Outer.SepiaPawn.Location);                
            }
            else
            {
                rangeToStrikeLoc = VSize(LocationToLaunchFrom.Location - Outer.SepiaPawn.Location);
            }
            maxRangeFormRangedFirePointBeforeAllowedToFire = GetMaxRangeFormRangedFirePointBeforeAllowedToFire();
            // End:0x573
            if(rangeToStrikeLoc > maxRangeFormRangedFirePointBeforeAllowedToFire)
            {
                // End:0x362
                if(bFoundValidLobStrikeLocationWhenNonGiven)
                {
                    MoveToPositionCmd = Outer.CmdMoveToPosition(PointToStrikeFrom, none, maxRangeFormRangedFirePointBeforeAllowedToFire - float(10), Outer.CmdStatus_MoveToPosition, 1, 0, false, true);
                    MoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
                    MoveToPositionCmd.bZeroVelocityOnFinish = true;
                    // End:0x35F
                    if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
                    {
                        MoveToPositionCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToRangedStrikePoint);
                    }                    
                }
                else
                {
                    MoveToActorCmd = Outer.CmdMoveToActor(LocationToLaunchFrom, none, maxRangeFormRangedFirePointBeforeAllowedToFire - float(10), Outer.CmdStatus_MoveToActor, 1, 0, false, true);
                    MoveToActorCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
                    MoveToActorCmd.bZeroVelocityOnFinish = true;
                    // End:0x570
                    if(Outer.myAIPawn.TuneDataAIPawn.bUseMovementProgressMonitorForAllAttackRunInsBeforeStrike)
                    {
                        MoveToActorCmd.SetMovementMonitorParameters(true, Outer.myAIPawn.TuneDataAIPawn.DurationBetweenMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.MinMovementDeltaDuringAttackRunInBeforeStrike, Outer.myAIPawn.TuneDataAIPawn.DelayAfterStartOfAttackRunInBeforeStrikeBeforeMonitorStarts, NotifyOfFailedMovementToRangedStrikePoint);
                    }
                }                
            }
            else
            {
                Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
                Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
            }
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}
