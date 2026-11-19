class LPAIControllerPhadyr extends LPAIControllerAkridSmall
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PhadyrPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_PhadyrAttack[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPerformingAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCurrentlyAllowedToTurtle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeLaunchedMedRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeCheckedForMedRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeAllowedNextMedRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeLaunchedLongRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeCheckedForLongRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeAllowedNextLongRangeStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentTurtleState[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageToTakeBeforeNextTurtle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AmountOfDamageTakingSinceLastTurtle[536870913];

function SetAttackResourceNames()
{
    MeleeResourceName = 'PhadyrMeleeFormation';
    StrikeResourceName = 'strike';
    //return;    
}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super(LPAIControllerAkrid).Possess(inPawn, bVehicleTransition);
    PhadyrPawn = LPAIPawnPhadyr(inPawn);
    bPerformingAttack = false;
    LastTimeLaunchedMedRangeStrike = -1.0000000;
    LastTimeCheckedForMedRangeStrike = -1.0000000;
    TimeAllowedNextMedRangeStrike = -1.0000000;
    LastTimeLaunchedLongRangeStrike = -1.0000000;
    LastTimeCheckedForLongRangeStrike = -1.0000000;
    TimeAllowedNextLongRangeStrike = -1.0000000;
    ResetTurtleStatusVars();
    bCurrentlyAllowedToTurtle = true;
    // End:0x101
    if(RandRange(0.0000000, 1.0000000) > 0.5000000)
    {
        PhadyrPawn.bUsingLowPosture = true;
        UseAnimationLowPosture();        
    }
    else
    {
        PhadyrPawn.bUsingLowPosture = false;
    }
    //return;    
}

function EnableAnnounceEffects()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(PhadyrPawn != none)
    {
        PhadyrPawn.EnableAnnounceGlow(bEnable);
    }
    //return;    
}

function UseAnimationAggressive()
{
    // End:0x69
    if(!PhadyrPawn.bUsingLowPosture)
    {
        PhadyrPawn.UseContextSensitiveAnimObject(PhadyrPawn.ContinuousAttackSuperAggressiveAnimations, -1.0000000);        
    }
    else
    {
        PhadyrPawn.UseContextSensitiveAnimObject(PhadyrPawn.LowPosContinuousAttackSuperAggressiveAnimations, -1.0000000);
    }
    //return;    
}

function UseAnimationNormal()
{
    // End:0x2F
    if(PhadyrPawn.bUsingLowPosture)
    {
        UseAnimationLowPosture();        
    }
    else
    {
        PhadyrPawn.UseContextSensitiveAnimObject(none, -1.0000000);
    }
    //return;    
}

function UseAnimationLowPosture()
{
    PhadyrPawn.UseContextSensitiveAnimObject(PhadyrPawn.LowPostureAnimations, -1.0000000);
    //return;    
}

function NotifyKnockedOutOfAttackByTakingToMuchDamage()
{
    CmdStatus_PhadyrAttack.KnockedOutOfStrikeByCoreHit();
    //return;    
}

function IsMeleeAttackFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IsPawnInDirectStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy2D;

    seperationToEnemy2D = SeperationToPawn2D(PawnToTest);
    // End:0x79
    if(seperationToEnemy2D < PhadyrPawn.TuneDataPhadyr.MinRangeForAcidSpitStrike.GetValue())
    {
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(PhadyrPawn != none)
    {
        PhadyrPawn.ServerKnockBackMelee(PlayerPawn, ImpactLocation);
    }
    return true;
    //return ReturnValue;    
}

simulated function StartAdditiveStrikeWarningRattleAnimation()
{
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSeqTemplate;

    AnimSeqTemplate = PhadyrPawn.AnimTemplateLogic_StrikeWarningRattle.GetBestSequenceTemplate(self);
    PhadyrPawn.ReplicatePlayAdditiveAnimationSequence(AnimSeqTemplate, None, 0, RateOfAnimation, 0.2000000, 0.0000000, false, false);
    //return;    
}

function HasStruggleModeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawnToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyPawnToCheck != none) && EnemyPawnToCheck.AIResourceManager != none)
    {
        return EnemyPawnToCheck.AIResourceManager.HasTimerExpired('PhadyrStruggleModeTimer');        
    }
    else
    {
        // End:0x8A
        if(EnemyPawnToCheck == none)
        {
            return false;            
        }
        else
        {
            return true;
        }
    }
    return true;
    //return ReturnValue;    
}

function ResetStruggleModeWaitTimer()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawnToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private float MinTime[9437185], MaxTime;

    -1.0000000
    -1.0000000
    // End:0x99
    if((EnemyPawnToCheck != none) && EnemyPawnToCheck.AIResourceManager != none)
    {
        EnemyPawnToCheck.AIResourceManager.ResetTimerRange('PhadyrStruggleModeTimer', MinTime, MaxTime);        
    }
    else
    {
        // End:0xAB
        if(EnemyPawnToCheck == none)
        {            
        }
    }
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;
    local /*0x97E50000-0x00000000*/ private bool bCommandWantsToOverridePawnsBasicHitReation;

    bCommandWantsToOverridePawnsBasicHitReation = false;
    curCommand = LPAICommand(CommandList);
    // End:0x1B0
    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
    {
        J0x3F:

        // End:0xCB [Loop If]
        if(curCommand != none)
        {
            // End:0x97
            if(curCommand.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage))
            {
                bCommandWantsToOverridePawnsBasicHitReation = true;
            }
            curCommand = LPAICommand(curCommand.ChildCommand);
            // [Loop Continue]
            goto J0x3F;
        }
        // End:0x1B0
        if(!bCommandWantsToOverridePawnsBasicHitReation && HitCoreIndex >= 0)
        {
            // End:0x1B0
            if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
            {
                PhadyrPawn.GrenCurrentlyDealingWith = PhadyrPawn.GetGrenadeAkridShouldHaveStuckToThisCore(HitCoreIndex);
                PhadyrPawn.TimeGrenadeGlued = WorldInfo.TimeSeconds;
                DealWithGreandeJustGluedToMe(PhadyrPawn.GrenCurrentlyDealingWith);
                return;
            }
        }
    }
    //return;    
}

function SpitGrenadeBackOutTimer()
{
    SpitGrenadeBackOut(PhadyrPawn.GrenCurrentlyDealingWith);
    //return;    
}

event HandlePossiblityOfNeedingToTurtle()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCausingDamage[8388609];
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xBF
    if(((PhadyrPawn.TuneDataPhadyr.bAllowedToTurtle.GetValue() != float(0)) && int(CurrentTurtleState) == int(0)) && bCurrentlyAllowedToTurtle)
    {
        AmountOfDamageTakingSinceLastTurtle += AmountOfDamage;
        // End:0xBF
        if(AmountOfDamageTakingSinceLastTurtle > AmountOfDamageToTakeBeforeNextTurtle)
        {
            CmdTurtle(EnemyCausingDamage, CmdStatus_Strike, 1);
        }
    }
    return false;
    //return ReturnValue;    
}

function ResetTurtleStatusVars()
{
    CurrentTurtleState = 0;
    AmountOfDamageTakingSinceLastTurtle = 0.0000000;
    AmountOfDamageToTakeBeforeNextTurtle = RandRange(PhadyrPawn.TuneDataPhadyr.MinAmountOfDamageToCauseTurtle.GetValue(), PhadyrPawn.TuneDataPhadyr.MaxAmountOfDamageToCauseTurtle.GetValue());
    //return;    
}

function CmdDirectAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_PhadyrAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PhadyrDirectAttack'.static.InitCommand(self);
    myCommand = LPAICmd_PhadyrDirectAttack(GetActiveCommand());
    // End:0x1A3
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdContinuousAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], ResourceForFormation, CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_PhadyrAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PhadyrContinuousAttack'.static.InitCommand(self);
    myCommand = LPAICmd_PhadyrContinuousAttack(GetActiveCommand());
    // End:0xFF
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetResSurroundLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMedRangeAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel, InIsThereClearRangedAttackLaneDelegate;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    None
    CmdStatus_Strike
    0
    // End:0x7A
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PhadyrMedRangeAttack'.static.InitCommand(self);
    myCommand = LPAICmd_PhadyrMedRangeAttack(GetActiveCommand());
    // End:0x232
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
        myCommand.SetIsThereClearRangedAttackLaneDelegate(InIsThereClearRangedAttackLaneDelegate);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPhadyrHeadButtStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PhadyrHeadButtStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PhadyrHeadButtStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPhadyrAcidSpitStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PhadyrAcidSpitStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PhadyrAcidSpitStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPhadyrMedRangeAcidSpitStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PhadyrMedRangeAcidSpitStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PhadyrMedRangeAcidSpitStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdLongRangeBurnLobAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private editfixedsize delegate<@NULL> InProcessLookForAnotherAttackOpportunityDel[9437185], InProcessLookForAlternateAttackOpportunityDel, InIsThereClearRangedAttackLaneDelegate;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    None
    None
    None
    CmdStatus_Strike
    0
    // End:0x7A
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PhadyrLongRangeBurnLobAttack'.static.InitCommand(self);
    myCommand = LPAICmd_PhadyrLongRangeBurnLobAttack(GetActiveCommand());
    // End:0x232
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
        myCommand.SetIsThereClearRangedAttackLaneDelegate(InIsThereClearRangedAttackLaneDelegate);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPhadyrLongRangeBurnLobStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PhadyrLongRangeBurnLobStrike'.static.InitCommand(self);
    myCommand = LPAICmd_PhadyrLongRangeBurnLobStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609];
    local /*0x97E50000-0x00000000*/ private float InMinTimeOfThisDamageAssessment[8388609], InMaxTimeOfThisDamageAssessment;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PhadyrDamageAssessment'.static.InitCommand(self);
    myCommand = LPAICmd_PhadyrDamageAssessment(GetActiveCommand());
    // End:0x14F
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Ass);
        myCommand.SetMinTimeOfThisDamageAssessment(InMinTimeOfThisDamageAssessment);
        myCommand.SetMaxTimeOfThisDamageAssessment(InMaxTimeOfThisDamageAssessment);
        myCommand.SetAssessmentSpecialMove(Class'LPSM_PhadyrDamageAssessment');
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdTurtle()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PhadyrTurtle'.static.InitCommand(self);
    myCommand = LPAICmd_PhadyrTurtle(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Ass);
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_PhadyrAttack'Default__LPAIControllerPhadyr.CmdStatus_PhadyrAttackD0'
    begin object name=CmdStatus_PhadyrAttackD0 class=Class'LPAICmdStatus_PhadyrAttack'
    end object
    CmdStatus_PhadyrAttack=CmdStatus_PhadyrAttackD0
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerPhadyr.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerPhadyr.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerPhadyr.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerPhadyr.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerPhadyr.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    bLookForAttackOpportunityWhileMovingToNonAttackLocations=true
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerPhadyr.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerPhadyr.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerPhadyr.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    bUseVisibilityManagerComplexLOSChecks=true
    Components[0]=LPAIObjectiveManager0
}