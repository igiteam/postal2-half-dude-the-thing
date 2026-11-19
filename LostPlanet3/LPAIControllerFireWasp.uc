class LPAIControllerFireWasp extends LPAIControllerMedFlyer
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireWaspPawn[536870913];

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    FireWaspPawn = LPAIPawnFireWasp(inPawn);
    GrenCurrentlyDealingWith = none;
    //return;    
}

function UseAnimationAggressive()
{
    FireWaspPawn.UseContextSensitiveAnimObject(FireWaspPawn.AggressiveAnimations, -1.0000000);
    //return;    
}

function UseSwoopStingAnimations()
{
    FireWaspPawn.UseContextSensitiveAnimObject(FireWaspPawn.SwoopStingAnimations, -1.0000000);
    //return;    
}

function UseAnimationNormal()
{
    FireWaspPawn.UseContextSensitiveAnimObject(none, -1.0000000);
    //return;    
}

function CmdDirectPhysicalAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[9437185], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[9437185], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    -1.0000000
    -1.0000000    
    CmdStatus_Strike
    0
    // End:0x4E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_FireWaspDirectAttackPoF'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspDirectAttackPoF(GetActiveCommand());
    // End:0x1B6
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

function CmdFireWaspBurstStrike()
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
    Class'LPAICmd_FireWaspRangedBurstStrike'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspRangedBurstStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdBasicRangedAttackPof()
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
    Class'LPAICmd_FireWaspRangedLobAttack'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspRangedLobAttack(GetActiveCommand());
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

function CmdBasicRangedDirectAttackPof()
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
    Class'LPAICmd_FireWaspRangedDirectAttack'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspRangedDirectAttack(GetActiveCommand());
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

function CmdBasicRangedAttackVs()
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
    Class'LPAICmd_FireWaspRangedLobAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspRangedLobAttackVs(GetActiveCommand());
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

function CmdBasicRangedAttackFvs()
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
    Class'LPAICmd_FireWaspRangedLobAttackFvs'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspRangedLobAttackFvs(GetActiveCommand());
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

function CmdReactiveAttackPoF()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2React2[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_FireWaspReactiveAttackPoF'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspReactiveAttackPoF(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2React2);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdReactiveAttackVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2React2[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_FireWaspReactiveAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspReactiveAttackVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2React2);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdReactiveAttackFvs()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2React2[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_FireWaspReactiveAttackFvs'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspReactiveAttackFvs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2React2);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdFireWaspPlasmaStrikePof()
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
    Class'LPAICmd_FireWaspPlasmaStrike'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspPlasmaStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdFireWaspRamAttack()
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
    Class'LPAICmd_FireWaspRamAttack'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspRamAttack(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdFireWaspSwoopStingStrike()
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
    Class'LPAICmd_FireWaspSwoopStingStrike'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspSwoopStingStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdFireWaspReactiveStrikePoF()
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
    Class'LPAICmd_FireWaspReactiveStrikePoF'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspReactiveStrikePoF(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function ForceStruggleModeNow()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private class StruggleModeClass[9437185];

    none
    CmdFireWaspStrugglePofStrike(EnemyForStruggleMode,, 0, StruggleModeClass);
    //return;    
}

function CmdFireWaspStrugglePofStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private class StruggleModeClass[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    none
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_FireWaspStrugglePofStrike'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspStrugglePofStrike(GetActiveCommand());
    // End:0x104
    if(myCommand != none)
    {
        myCommand.SetStruggleModeClass(StruggleModeClass);
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdHitReaction()
{
    local /*0x97E50000-0x00000000*/ private float PostReactionPauseTime[8388609];
    local /*0x97E50000-0x00000000*/ private class HitReactionSpecialMove[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    none
    0
    // End:0x5A
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return super(LPAIController).CmdHitReaction(PostReactionPauseTime, HitReactionSpecialMove, CmdOption);
    }
    return none;
    //return ReturnValue;    
}

function CmdFollowPath()
{
    local /*0x97E50000-0x00000000*/ private @NULL FollowPathData[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand, WaspFollowPathData;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    WaspFollowPathData = LPAIOD_WaspFollowPath(FollowPathData);
    // End:0xA6
    if(WaspFollowPathData == none)
    {
        Class'LPAICmd_FollowPath'.static.InitCommand(self);
        myCommand = LPAICmd_FollowPath(GetActiveCommand());        
    }
    else
    {
        Class'LPAICmd_WaspFollowPath'.static.InitCommand(self);
        myCommand = LPAICmd_WaspFollowPath(GetActiveCommand());
    }
    // End:0x142
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetFollowPathData(FollowPathData);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMortarAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheTarget[8388609], LocationToLaunchFrom, inMortarAttackSetupInfo;
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
    Class'LPAICmd_FireWaspMortarAttack'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspMortarAttack(GetActiveCommand());
    // End:0x1DE
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetTheTarget(TheTarget);
        myCommand.SetLocationToLaunchFrom(LocationToLaunchFrom);
        myCommand.SetMortarAttackSetupInfo(inMortarAttackSetupInfo);
        myCommand.SetProcessLookForAnotherAttackOpportunityDelegate(InProcessLookForAnotherAttackOpportunityDel);
        myCommand.SetProcessLookForAlternateAttackOpportunityDelegate(InProcessLookForAlternateAttackOpportunityDel);
        myCommand.SetIsThereClearRangedAttackLaneDelegate(InIsThereClearRangedAttackLaneDelegate);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMortarAttackDamageAssessment()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Ass[8388609];
    local /*0x97E50000-0x00000000*/ private float InMinTimeOfThisDamageAssessment[8388609], InMaxTimeOfThisDamageAssessment, InMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue, InMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue;
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
    Class'LPAICmd_FireWaspMortarAttackDamageAssessment'.static.InitCommand(self);
    myCommand = LPAICmd_FireWaspMortarAttackDamageAssessment(GetActiveCommand());
    // End:0x19F
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Ass);
        myCommand.SetMinTimeOfThisDamageAssessment(InMinTimeOfThisDamageAssessment);
        myCommand.SetMaxTimeOfThisDamageAssessment(InMaxTimeOfThisDamageAssessment);
        myCommand.SetMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue(InMinRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue);
        myCommand.SetMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue(InMaxRangeFromActorOfInterestToAllowMortarAttackDamageAssessmentToContinue);
        myCommand.SetAssessmentSpecialMove(Class'LPSM_MedFlyerDamageAssessment');
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMoveToActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], LookAt;
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185], b2dDistanceChecks;
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    CmdStatus_MoveToActor
    0
    0
    false
    true
    0
    0.0000000
    // End:0xCB
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return super(LPAIController).CmdMoveToActor(Target, LookAt, reachDist, CmdStatus, CmdOption, StopType, bAllowFiring, b2dDistanceChecks, inLookAtStartMoving, InMaxSpeedScale);
    }
    return CmdMoveToActorFly(Target, LookAt, reachDist, 0.0000000, 0.0000000, CmdStatus, CmdOption, StopType, b2dDistanceChecks);
    //return ReturnValue;    
}

function CmdMoveToPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], LookAt;
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185], b2dDistanceChecks;
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    none
    -1.0000000
    CmdStatus_MoveToPosition
    0
    0
    false
    true
    0
    0.0000000
    // End:0xD0
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return super(LPAIController).CmdMoveToPosition(Target, LookAt, reachDist, CmdStatus, CmdOption, StopType, bAllowFiring, b2dDistanceChecks, inLookAtStartMoving, InMaxSpeedScale);
    }
    return CmdMoveToPositionFly(Target, LookAt, reachDist, CmdStatus, CmdOption, StopType, b2dDistanceChecks);
    //return ReturnValue;    
}

event CanBeMyEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL tInfo;
    local /*0x97E50000-0x00000000*/ private int TargetIndex;

    // End:0x1A
    if(!super(LPAIController).CanBeMyEnemy(PotentialEnemy))
    {
        return false;
    }
    // End:0x45
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return true;
    }
    TargetIndex = GetTargetIndex(PotentialEnemy);
    // End:0x73
    if(TargetIndex < 0)
    {
        return false;
    }
    tInfo = TargetList[TargetIndex];
    // End:0xB6
    if(tInfo.LastSeenTime <= float(0))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_Orbit'Default__LPAIControllerFireWasp.LPAICmdStatus_Orbit0'
    begin object name=LPAICmdStatus_Orbit0
    end object
    CmdStatus_Orbit=LPAICmdStatus_Orbit0
    OrbitCombatMgrResourceName="FireWaspOrbitEngagement"
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerFireWasp.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerFireWasp.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerFireWasp.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerFireWasp.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerFireWasp.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerFireWasp.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerFireWasp.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerFireWasp.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}