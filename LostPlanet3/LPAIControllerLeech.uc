class LPAIControllerLeech extends LPAIControllerAkridSmall
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LeechPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL CmdStatus_LeechAttack[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private bool bAllowUseOfInvertedAttackBehavior[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StrikeDensityAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name StrikeDensityResourceName[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name AttackResourceName[536870913];

event NumberOfAttackersFor()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x82
    if(PotentialEnemy != none)
    {
        // End:0x82
        if((PotentialEnemy != none) && PotentialEnemy.AIResourceManager != none)
        {
            return PotentialEnemy.AIResourceManager.NumUsers(AttackResourceName);
        }
    }
    return 0;
    //return ReturnValue;    
}

function SetAttackResourceNames()
{
    MeleeResourceName = 'LeechMelee';
    StrikeResourceName = 'LeechStrike';
    StruggleResourceName = 'Struggle';
    //return;    
}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super(LPAIControllerAkrid).Possess(inPawn, bVehicleTransition);
    LeechPawn = LPAIPawnLeech(inPawn);
    bAllowUseOfInvertedAttackBehavior = LeechPawn.TuneDataLeech.bUseInvertedAttackBehavior;
    StrikeDensityResourceName = 'LeechStrike';
    //return;    
}

function NotifyPlayerStartMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerToLeech;
    local /*0x97E50000-0x00000000*/ private float Distance, dotProduct;

    PlayerToLeech = LeechPawn.Location - PlayerPawn.Location;
    Distance = VSize(PlayerToLeech);
    // End:0xA0
    if(Distance > LeechPawn.TuneDataLeech.JumpBackDistanceToPlayer)
    {
        return true;
    }
    dotProduct = Normal(PlayerToLeech) Dot Vector(PlayerPawn.Rotation);
    // End:0x11A
    if(dotProduct < LeechPawn.TuneDataLeech.JumpBackDotProductToPlayer)
    {
        return true;
    }
    // End:0x18E
    if(LeechPawn.TuneDataLeech.OnlyJumpBackAfterFirstHit && !LeechPawn.TuneDataLeech.bHitAtLeastOnceByMelee)
    {
        return true;
    }
    // End:0x1CE
    if(CommandList != none)
    {
        LPAICommand(CommandList).NotifyPlayerStartMelee(PlayerPawn);
    }
    return true;
    //return ReturnValue;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4A
    if(CommandList != none)
    {
        return LPAICommand(CommandList).NotifyPlayerMeleeHit(PlayerPawn, ImpactLocation);
    }
    return true;
    //return ReturnValue;    
}

function EnableAnnounceEffects()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    // End:0x38
    if(LeechPawn != none)
    {
        LeechPawn.EnableAnnounceGlow(bEnable);
    }
    //return;    
}

function UseAnimationInverted()
{
    LeechPawn.UseContextSensitiveAnimObject(LeechPawn.InvertedMovementAnimations, 0.0000000);
    //return;    
}

function UseAnimationNormal()
{
    LeechPawn.UseContextSensitiveAnimObject(none, 0.0000000);
    //return;    
}

function NotifyKnockedOutOfAttackByTakingToMuchDamage()
{
    CmdStatus_LeechAttack.KnockedOutOfStrikeByCoreHit();
    //return;    
}

function ReleaseStrikeAccessForFailedAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL strikeDensityRes;

    // End:0x78
    if(StrikeDensityAccess != none)
    {
        strikeDensityRes = LPAIResLeechStrike(StrikeDensityAccess.GetResource());
        // End:0x78
        if(strikeDensityRes != none)
        {
            strikeDensityRes.NotifyOfFailedStrike(LeechPawn);
        }
    }
    ReleaseStrikeAccess();
    //return;    
}

function ReleaseStrikeAccessForNeedingToReattemptMoveInToStrike()
{
    ReleaseStrikeAccessForFailedAttack();
    //return;    
}

function DoesLeechHaveAccessToStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    GetStrikeDensityAccess(TheEnemy);
    // End:0x23
    if(HaveStrikeDensityAccess())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HaveStrikeDensityAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsValidResourceAccessForEnemy(StrikeDensityAccess);
    //return ReturnValue;    
}

function GetStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0xB8
    if((((ShouldUseStrikeResource()) && !HaveStrikeAccess()) && TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        StrikeAccess = TheEnemy.AIResourceManager.GetAccess(StrikeResourceName, myAIPawn, RevokeTolerance);
    }
    //return;    
}

function ReleaseStrikeAccess()
{
    ReleaseStrikeDensityAccess();
    //return;    
}

function ReleaseStrikeDensityAccess()
{
    // End:0x39
    if(StrikeDensityAccess != none)
    {
        StrikeDensityAccess.Destroy();
        StrikeDensityAccess = none;
    }
    //return;    
}

function GetStrikeDensityAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0xA9
    if((!HaveStrikeDensityAccess() && TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        StrikeDensityAccess = TheEnemy.AIResourceManager.GetAccess(StrikeDensityResourceName, myAIPawn, RevokeTolerance);
    }
    //return;    
}

function ReleaseAttackAccess()
{
    // End:0x39
    if(AttackAccess != none)
    {
        AttackAccess.Destroy();
        AttackAccess = none;
    }
    //return;    
}

function GetAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];

    -1.0000000
    // End:0xA9
    if((!HaveAttackAccess() && TheEnemy != none) && TheEnemy.AIResourceManager != none)
    {
        AttackAccess = TheEnemy.AIResourceManager.GetAccess(AttackResourceName, myAIPawn, RevokeTolerance);
    }
    //return;    
}

function HaveAttackAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsValidResourceAccessForEnemy(AttackAccess);
    //return ReturnValue;    
}

function IsMeleeAttackFinished()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HasStruggleModeWaitTimerExpired()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyPawnToCheck[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x76
    if((EnemyPawnToCheck != none) && EnemyPawnToCheck.AIResourceManager != none)
    {
        return EnemyPawnToCheck.AIResourceManager.HasTimerExpired('LeechStruggleModeTimer');        
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
        EnemyPawnToCheck.AIResourceManager.ResetTimerRange('LeechStruggleModeTimer', MinTime, MaxTime);        
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

function IsPawnInDirectStrikeZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float seperationToEnemy2D, seperationNeeded;

    seperationToEnemy2D = SeperationToPawn2D(PawnToTest);
    // End:0x298
    if(LeechPawn != none)
    {
        // End:0xAE
        if(LeechPawn.TuneDataLeech.bDoOnlyForcedStruggle)
        {
            // End:0xA9
            if(seperationToEnemy2D <= myAIPawn.TuneDataAIPawn.MaxSeperationForDirectPhysicalStrike)
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
            // End:0x13D
            if((PawnToTest.Health < MaxEnemyHitPointsToStartStruggle) && HasStruggleModeWaitTimerExpired(PawnToTest))
            {
                // End:0x138
                if(seperationToEnemy2D <= myAIPawn.TuneDataAIPawn.MaxSeperationForDirectPhysicalStrike)
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
                // End:0x250
                if(bAllowUseOfInvertedAttackBehavior)
                {
                    // End:0x1DF
                    if(!LeechPawn.IsInverted())
                    {
                        seperationNeeded = ConvertRangeToSeperation2D(LeechPawn.TuneDataLeech.MaxRangeForFlippingTailStrike, PawnToTest);
                        // End:0x1DA
                        if(seperationToEnemy2D <= seperationNeeded)
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
                        seperationNeeded = ConvertRangeToSeperation2D(LeechPawn.TuneDataLeech.MaxRangeForInvertedJumpBiteStrike, PawnToTest);
                        // End:0x24B
                        if(seperationToEnemy2D <= seperationNeeded)
                        {
                            return true;                            
                        }
                        else
                        {
                            return false;
                        }
                    }                    
                }
                else
                {
                    // End:0x296
                    if(seperationToEnemy2D <= myAIPawn.TuneDataAIPawn.MaxSeperationForDirectPhysicalStrike)
                    {
                        return true;                        
                    }
                    else
                    {
                        return false;
                    }
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function ForceStruggleModeNow()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private class StruggleModeClass[9437185];

    none
    CmdLeechStrugglePofStrike(EnemyForStruggleMode,, 0, StruggleModeClass);
    //return;    
}

function CmdLeechStrugglePofStrike()
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
    Class'LPAICmd_LeechStrugglePofStrike'.static.InitCommand(self);
    myCommand = LPAICmd_LeechStrugglePofStrike(GetActiveCommand());
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

function CmdDirectAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609];
    local /*0x97E50000-0x00000000*/ private int MinNumOfStrikeAttempts[8388609], MaxNumOfStrikeAttempts;
    local /*0x97E50000-0x00000000*/ private float MinAmountOfDamageToStopAttack[8388609], MaxAmountOfDamageToStopAttack;
    local /*0x97E50000-0x00000000*/ private @NULL ResourceForFormation[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_LeechAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_LeechDirectAttack'.static.InitCommand(self);
    myCommand = LPAICmd_LeechDirectAttack(GetActiveCommand());
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

function CmdLeechSchnallStrikePof()
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
    Class'LPAICmd_LeechSchnallStrike'.static.InitCommand(self);
    myCommand = LPAICmd_LeechSchnallStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdLeechJumpBiteStrikePof()
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
    Class'LPAICmd_LeechJumpBiteStrike'.static.InitCommand(self);
    myCommand = LPAICmd_LeechJumpBiteStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdLeechFlipTailStrikePof()
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
    Class'LPAICmd_LeechFlippingTailWhipStrike'.static.InitCommand(self);
    myCommand = LPAICmd_LeechFlippingTailWhipStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdLeechInvertedJumpBiteStrikePof()
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
    Class'LPAICmd_LeechInvertedJumpingBiteStrike'.static.InitCommand(self);
    myCommand = LPAICmd_LeechInvertedJumpingBiteStrike(GetActiveCommand());
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
    Class'LPAICmd_LeechDamageAssessment'.static.InitCommand(self);
    myCommand = LPAICmd_LeechDamageAssessment(GetActiveCommand());
    // End:0x19C
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetActorToCareAboutWhileAssessing(Enemy2Ass);
        myCommand.SetMinTimeOfThisDamageAssessment(InMinTimeOfThisDamageAssessment);
        myCommand.SetMaxTimeOfThisDamageAssessment(InMaxTimeOfThisDamageAssessment);
        // End:0x174
        if(LeechPawn.IsInverted())
        {
            myCommand.SetAssessmentSpecialMove(Class'LPSM_LeechDamageAssessmentInverted');            
        }
        else
        {
            myCommand.SetAssessmentSpecialMove(Class'LPSM_LeechDamageAssessment');
        }
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_LeechAttack'Default__LPAIControllerLeech.CmdStatus_LeechAttackD0'
    begin object name=CmdStatus_LeechAttackD0 class=Class'LPAICmdStatus_LeechAttack'
    end object
    CmdStatus_LeechAttack=CmdStatus_LeechAttackD0
    AttackResourceName="LeechAttack"
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerLeech.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerLeech.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerLeech.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerLeech.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerLeech.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerLeech.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes=/* Array type was not detected. */
    // Reference: SPAIReactionManager'Default__LPAIControllerLeech.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerLeech.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    bUseVisibilityManager=false
    AILogFilter=/* Array type was not detected. */
    Components[0]=LPAIObjectiveManager0
}