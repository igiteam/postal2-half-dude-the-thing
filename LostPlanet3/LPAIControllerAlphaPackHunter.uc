class LPAIControllerAlphaPackHunter extends LPAIControllerPackHunter
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL APHPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Last360TailSwipeAttackTime;

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    APHPawn = LPAIPawnAlphaPackHunter(inPawn);
    //return;    
}

event UnPossess()
{
    super.UnPossess();
    //return;    
}

event Destroyed()
{
    super.Destroyed();
    //return;    
}

simulated function IsUsingAlphaPackHunterRamCSA()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return APHPawn.ContextSensitiveAnimInfo.CurrentCSA == APHPawn.AlphaPackHunterRamCSA;
    //return ReturnValue;    
}

simulated function EnableAlphaPackHunterRamCSA()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x61
    if(bEnable)
    {
        // End:0x5E
        if(!IsUsingAlphaPackHunterRamCSA())
        {
            APHPawn.UseContextSensitiveAnimObject(APHPawn.AlphaPackHunterRamCSA, -1.0000000);
        }        
    }
    else
    {
        // End:0x93
        if(IsUsingAlphaPackHunterRamCSA())
        {
            APHPawn.UseContextSensitiveAnimObject(none, -1.0000000);
        }
    }
    //return;    
}

function HaveMultipleEnemiesWithinRange()
{
    local /*0x97E50000-0x00000000*/ private float Range[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609], ClosestEnemy;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x42
    if(PHPawn.TuneDataPackHunter.bForce360TailSwipe)
    {
        EnemyForAttack = none;
    }
    // End:0x70
    if((GetNumOtherEnemiesWithinRange(Range, EnemyForAttack, ClosestEnemy)) > 0)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ShouldDo360TailWhip()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private float R;
    local /*0x97E50000-0x00000000*/ private @NULL ClosestEnemy;

    // End:0x9E
    if((WorldInfo.TimeSeconds < (Last360TailSwipeAttackTime + PHPawn.TuneDataPackHunter.MinTimeBetween360TailSwipes)) && !PHPawn.TuneDataPackHunter.bForce360TailSwipe)
    {
        return none;
    }
    // End:0x150
    if(HaveMultipleEnemiesWithinRange(PHPawn.TuneDataPackHunter.RangeToTargetFor360TailSwipe, EnemyForAttack, ClosestEnemy))
    {
        R = FRand();
        // End:0x150
        if(R <= PHPawn.TuneDataPackHunter.ChanceToDo360TailSwipe)
        {
            return LPPawn(ClosestEnemy);
        }
    }
    return none;
    //return ReturnValue;    
}

function CheckForMultiEnemyAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL tailWhipTarget;

    tailWhipTarget = ShouldDo360TailWhip(EnemyForAttack);
    // End:0x6C
    if(tailWhipTarget != none)
    {
        Last360TailSwipeAttackTime = WorldInfo.TimeSeconds;
        CmdPackHunter360TailSwipePof(tailWhipTarget,, 1);
        return true;
    }
    return false;
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;

    curCommand = LPAICommand(CommandList);
    // End:0x187
    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
    {
        J0x33:

        // End:0xB3 [Loop If]
        if(curCommand != none)
        {
            // End:0x7F
            if(curCommand.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage))
            {
            }
            curCommand = LPAICommand(curCommand.ChildCommand);
            // [Loop Continue]
            goto J0x33;
        }
        // End:0x187
        if(HitCoreIndex >= 0)
        {
            // End:0x187
            if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
            {
                APHPawn.GrenCurrentlyDealingWith = PHPawn.GetGrenadeAkridShouldHaveStuckToThisCore(HitCoreIndex);
                APHPawn.TimeGrenadeGlued = WorldInfo.TimeSeconds;
                DealWithGreandeJustGluedToMe(APHPawn.GrenCurrentlyDealingWith);
                return;
            }
        }
    }
    super.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage);
    //return;    
}

function SpitGrenadeBackOutTimer()
{
    SpitGrenadeBackOut(APHPawn.GrenCurrentlyDealingWith);
    //return;    
}

function NotifyFromAnimToSpitGrenadeBackOutNow()
{
    SpitGrenadeBackOut(APHPawn.GrenCurrentlyDealingWith);
    //return;    
}

function CmdPackHunterShortDistanceBiteStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private byte DirectionToStrike[8388609];
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
    Class'LPAICmd_AlphaPackHunterBiteStrike'.static.InitCommand(self);
    myCommand = LPAICmd_AlphaPackHunterBiteStrike(GetActiveCommand());
    // End:0xFF
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetStrikeDirection(DirectionToStrike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterMediumClawLungeStrikePof()
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
    Class'LPAICmd_AlphaPackHunterLungeMedRamStrike'.static.InitCommand(self);
    myCommand = LPAICmd_AlphaPackHunterLungeMedRamStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterFarClawLungeStrikePof()
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
    Class'LPAICmd_AlphaPackHunterLungeFarClawStrike'.static.InitCommand(self);
    myCommand = LPAICmd_AlphaPackHunterLungeFarClawStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformDirectAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_PackHunterAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_AlphaPackHunterDirectAttack'.static.InitCommand(self);
    myCommand = LPAICmd_AlphaPackHunterDirectAttack(GetActiveCommand());
    // End:0x1A3
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundMultiLocation(ResourceForFormation);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformDashAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus, PreCalcedDashToPoint;
    local /*0x97E50000-0x00000000*/ private bool bForceDashStrikeToTheRightOfTheTarget[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_PackHunterAttack
    vect(0.0000000, 0.0000000, 0.0000000)
    false
    0
    // End:0x51
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_AlphaPackHunterDashAttack'.static.InitCommand(self);
    myCommand = LPAICmd_AlphaPackHunterDashAttack(GetActiveCommand());
    // End:0x20A
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
        myCommand.SetMinNumberOfStrikesToAttemptPerAttack(MinNumOfStrikeAttempts);
        myCommand.SetMaxNumberOfStrikesToAttemptPerAttack(MaxNumOfStrikeAttempts);
        myCommand.SetMinAmountOfDamageRequiredToStopAttack(int(MinAmountOfDamageToStopAttack));
        myCommand.SetMaxAmountOfDamageRequiredToStopAttack(int(MaxAmountOfDamageToStopAttack));
        myCommand.SetResSurroundMultiLocation(ResourceForFormation);
        myCommand.SetPreCalcedDashToPoint(PreCalcedDashToPoint);
        myCommand.SetForceDashStrikeToTheRightOfTheTarget(bForceDashStrikeToTheRightOfTheTarget);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterDashStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float ValAmountOfDamageReceivedThisDash[25165825], AmountOfDamageToCausePlowInThisDash;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185], PreCalcedDashToPoint;
    local /*0x97E50000-0x00000000*/ private bool bForceDashStrikeToTheRightOfTheTarget[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_PackHunterRunningAttack
    vect(0.0000000, 0.0000000, 0.0000000)
    false
    0
    // End:0x51
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_AlphaPackHunterDashStrike'.static.InitCommand(self);
    myCommand = LPAICmd_AlphaPackHunterDashStrike(GetActiveCommand());
    // End:0x18E
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetPreCalcedDashToPoint(PreCalcedDashToPoint);
        myCommand.SetForceDashStrikeToTheRightOfTheTarget(bForceDashStrikeToTheRightOfTheTarget);
        myCommand.SetOutValAmountOfDamageReceivedThisDash(ValAmountOfDamageReceivedThisDash);
        myCommand.SetAmountOfDamageToCausePlowInThisDash(AmountOfDamageToCausePlowInThisDash);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunterPlowIn()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyThatCausedPlowIn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bGrenadeInMouth[8388609], bMovingFastEnoughForPlowInAfterFall, bMovingSoSlowGettingKnockedBack;
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
    Class'LPAICmd_AlphaPackHunterPlowIn'.static.InitCommand(self);
    myCommand = LPAICmd_AlphaPackHunterPlowIn(GetActiveCommand());
    // End:0x152
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(EnemyThatCausedPlowIn);
        myCommand.SetIfPlowingInBecauseOfGrenadeInMouth(bGrenadeInMouth);
        myCommand.SetIfMovingFastEnoughForPlowInAfterFall(bMovingFastEnoughForPlowInAfterFall);
        myCommand.SetIfMovingMovingSoSlowGettingKnockedBack(bMovingSoSlowGettingKnockedBack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdJumpBack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyJumpingAwayFrom[8388609];
    local /*0x97E50000-0x00000000*/ private bool bGrenadeInMouth[8388609];
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
    Class'LPAICmd_AlphaPackHunterJumpBack'.static.InitCommand(self);
    myCommand = LPAICmd_AlphaPackHunterJumpBack(GetActiveCommand());
    // End:0x100
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(EnemyJumpingAwayFrom);
        myCommand.SetIfJumpingBackBecauseOfGrenadeInMouth(bGrenadeInMouth);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPackHunter360TailSwipePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL MainEnemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_PackHunter360TailSwipe'.static.InitCommand(self);
    myCommand = LPAICmd_PackHunter360TailSwipe(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(MainEnemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerAlphaPackHunter.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_PackHunterAttack=LPAICmdStatus_Attack0
    // Reference: LPAICmdStatus_PackHunterRunningAttack'Default__LPAIControllerAlphaPackHunter.CmdStatus_PackHunterRunningAttackD0'
    begin object name=CmdStatus_PackHunterRunningAttackD0
    end object
    CmdStatus_PackHunterRunningAttack=CmdStatus_PackHunterRunningAttackD0
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerAlphaPackHunter.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerAlphaPackHunter.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerAlphaPackHunter.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerAlphaPackHunter.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerAlphaPackHunter.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerAlphaPackHunter.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerAlphaPackHunter.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}