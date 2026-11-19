class LPAIControllerDongo extends LPAIControllerBaseSnowCrab
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DongoPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeOfLastTaunt;

function OnEnabledAI()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x6F [Loop If]
    if(Idx < DongoPawn.GrabPoints.Length)
    {
        DongoPawn.SetGrabPointDestroyedByIndex(Idx, false);
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    Idx = 0;
    J0x7A:

    // End:0xDE [Loop If]
    if(Idx < DongoPawn.WinchPoints.Length)
    {
        DongoPawn.SetWinchPointDestroyedByIndex(Idx, false);
        ++Idx;
        // [Loop Continue]
        goto J0x7A;
    }
    DongoPawn.SetGrabPointEnabledByIndex(1, true);
    DongoPawn.SetWinchPointEnabledByIndex(0, true);
    super(SPAIController).OnEnabledAI();
    //return;    
}

function OnDisabledAI()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    // End:0xED
    if(!bAllowDamageWhenDisableAI)
    {
        Idx = 0;
        J0x1A:

        // End:0x7E [Loop If]
        if(Idx < DongoPawn.GrabPoints.Length)
        {
            DongoPawn.SetGrabPointDestroyedByIndex(Idx, true);
            ++Idx;
            // [Loop Continue]
            goto J0x1A;
        }
        Idx = 0;
        J0x89:

        // End:0xED [Loop If]
        if(Idx < DongoPawn.WinchPoints.Length)
        {
            DongoPawn.SetWinchPointDestroyedByIndex(Idx, true);
            ++Idx;
            // [Loop Continue]
            goto J0x89;
        }
    }
    super(SPAIController).OnDisabledAI();
    //return;    
}

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    DongoPawn = LPAIPawnDongo(inPawn);
    //return;    
}

function TimeForNextTaunt()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Delay;

    // End:0x17
    if(TimeOfLastTaunt <= float(0))
    {
        return 0.0000000;
    }
    Delay = RandRange(DongoPawn.TuneDataDongo.MinTimeBetweenTaunts.GetValue(), DongoPawn.TuneDataDongo.MaxTimeBetweenTaunts.GetValue());
    return Delay + TimeOfLastTaunt;
    //return ReturnValue;    
}

function CmdTurnToFaceFocus()
{
    local /*0x97E50000-0x00000000*/ private byte TurnOption[8388609];
    local /*0x97E50000-0x00000000*/ private int AllowedYawError[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool bClearFocusOnFinish[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1
    1
    false
    return super(LPAIController).CmdTurnToFaceFocus(0, AllowedYawError, CmdOption, bClearFocusOnFinish);
    //return ReturnValue;    
}

function CmdTurnToFacePosition()
{
    local /*0x97E50000-0x00000000*/ private byte TurnOption[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PointToFace[8519681];
    local /*0x97E50000-0x00000000*/ private int AllowedYawError[9437185];
    local /*0x97E50000-0x00000000*/ private bool bAllowMovingToStationaryTurns[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1
    false
    1
    return super(LPAIController).CmdTurnToFacePosition(0, PointToFace, AllowedYawError, bAllowMovingToStationaryTurns, CmdOption);
    //return ReturnValue;    
}

function CmdPerformChargeAttackPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float reachDist[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    // End:0x87
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        Class'LPAICmd_DongoChargeAttackPof'.static.InitCommand(self);        
    }
    else
    {
        Class'LPAICmd_DongoChargeAttack_MP'.static.InitCommand(self);
    }
    myCommand = LPAICmd_DongoChargeAttackPof(GetActiveCommand());
    // End:0x123
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformChargeAttackPofFollowPath()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float reachDist[8388609];
    local /*0x97E50000-0x00000000*/ private bool bTripOnMiss[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    true
    CmdStatus_ChargeAttack
    0
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DongoChargeAttackPofFromFollowPath'.static.InitCommand(self);
    myCommand = LPAICmd_DongoChargeAttackPofFromFollowPath(GetActiveCommand());
    // End:0x105
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
        myCommand.SetTripOnMiss(bTripOnMiss);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformChargeAttackVS()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float reachDist[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DongoChargeAttackVs'.static.InitCommand(self);
    myCommand = LPAICmd_DongoChargeAttackVs(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformChargeAttackVSDirect()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609];
    local /*0x97E50000-0x00000000*/ private float reachDist[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DongoChargeAttackVsDirect'.static.InitCommand(self);
    myCommand = LPAICmd_DongoChargeAttackVsDirect(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    return none;
    //return ReturnValue;    
}

function CmdPerformChargingStrikePof()
{
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DongoChargingStrikePof'.static.InitCommand(self);
    myCommand = LPAICmd_DongoChargingStrikePof(GetActiveCommand());
    // End:0xED
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(CmdStatus.GetTargetPawn());
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPerformChargingStrikeVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_ChargeAttack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DongoChargingStrikeVs'.static.InitCommand(self);
    myCommand = LPAICmd_DongoChargingStrikeVs(GetActiveCommand());
    // End:0xED
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(CmdStatus.GetTargetPawn());
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDongoFrenzyStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DongoFrenzyStrike'.static.InitCommand(self);
    myCommand = LPAICmd_DongoFrenzyStrike(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(InEnemy);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDongoShortTaunt()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DongoShortTaunt'.static.InitCommand(self);
    myCommand = LPAICmd_DongoShortTaunt(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(InEnemy);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdDongoTauntDuringStalk()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x123
    if((TimeForNextTaunt()) < DongoPawn.WorldInfo.TimeSeconds)
    {
        // End:0x7D
        if(int(CmdOption) == int(0))
        {
            AbortCommand(CommandList);
        }
        Class'LPAICmd_DongoTauntDuringStalk'.static.InitCommand(self);
        myCommand = LPAICmd_DongoTauntDuringStalk(GetActiveCommand());
        // End:0x119
        if(myCommand != none)
        {
            myCommand.SetReturnCmdStatus(CmdStatus);
            myCommand.SetDesiredEnemy(InEnemy);
        }
        return myCommand;
    }
    return none;
    //return ReturnValue;    
}

function CmdFlee()
{
    local /*0x97E50000-0x00000000*/ private float Duration[9437185], MaxFleeDist, DesiredSeperationFromDanger;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool bFinishWhenSafe[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    10.0000000
    10000.0000000
    200.0000000    
    0
    true
    // End:0x4F
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DongoFlee'.static.InitCommand(self);
    myCommand = LPAICmd_DongoFlee(GetActiveCommand());
    // End:0x164
    if(myCommand != none)
    {
        myCommand.Duration = Duration;
        myCommand.SetMaxFleeDistance(MaxFleeDist);
        myCommand.SetDesiredSeperationFromDanger(DesiredSeperationFromDanger);
        myCommand.SetFleeFromActors(FleeFrom);
        myCommand.SetFinishWhenSafe(bFinishWhenSafe);
    }
    return myCommand;
    //return ReturnValue;    
}

function GetEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x34
    if(int(WorldInfo.NetMode) == int(NM_Standalone))
    {
        return super(LPAIController).GetEnemy();
    }
    // End:0x4D
    if(MyLPEnemy != none)
    {
        return MyLPEnemy;
    }
    return super(LPAIController).GetEnemy();
    //return ReturnValue;    
}

function CmdShortFlee()
{
    local /*0x97E50000-0x00000000*/ private @NULL CurEnemy[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCandidate, Cmd;

    0
    // End:0x2C
    if(CurEnemy != none)
    {
        FleeFrom.AddItem(CurEnemy);        
    }
    I = 0;
    J0x37:

    // End:0xD2 [Loop If]
    if(I < TargetList.Length)
    {
        EnemyCandidate = TargetList[I].Actor;
        // End:0xC4
        if((CanBeMyEnemy(EnemyCandidate)) && CurEnemy != EnemyCandidate)
        {
            FleeFrom.AddItem(EnemyCandidate);            
        }
        ++I;
        // [Loop Continue]
        goto J0x37;
    }
    Cmd = LPAICmd_DongoFlee(CmdFlee(5.0000000, 4000.0000000, 2000.0000000, FleeFrom, CmdOption));
    // End:0x141
    if(Cmd != none)
    {
        Cmd.bAllowInterruptionOfFlee = false;
    }
    return Cmd;
    //return ReturnValue;    
}

function CmdThrown()
{
    local /*0x97E50000-0x00000000*/ private @NULL Tosser[8388609], TossVelocity, ReturnValue, myCommand;

    // End:0x17
    if(IsAIDisabled())
    {
        ForceEnableAI();
    }
    AbortCommand(CommandList);
    Class'LPAICmd_DongoThrown'.static.InitCommand(self);
    myCommand = LPAICmd_DongoThrown(GetActiveCommand());
    // End:0xC7
    if(myCommand != none)
    {
        myCommand.SetTosser(Tosser);
        myCommand.SetVelocity(TossVelocity);
    }
    return myCommand;
    //return ReturnValue;    
}

simulated function NotifyCollisionWhileFlying()
{
    local /*0x97E50000-0x00000000*/ private @NULL ThrownCommand;

    super(LPAIController).NotifyCollisionWhileFlying();
    ThrownCommand = LPAICmd_DongoThrown(GetActiveCommand());
    // End:0x55
    if(ThrownCommand != none)
    {
        ThrownCommand.NotifyCollision();
    }
    //return;    
}

function @NULL TouchedOtherActorDuringMoveCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x54
    if(Other.IsA('LPBaseVSPlayerPawn') && LPBaseVSPlayerPawn(Other).Controller != none)
    {
        return;
    }
    // End:0x6E
    if(LPAIPawnAkridLarge(Other) != none)
    {
        return;
    }
    RanIntoActorWhileMoving(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

function @NULL BumpedOtherActorDuringMoveCmd()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x54
    if(Other.IsA('LPBaseVSPlayerPawn') && LPBaseVSPlayerPawn(Other).Controller != none)
    {
        return;
    }
    // End:0x6E
    if(LPAIPawnAkridLarge(Other) != none)
    {
        return;
    }
    RanIntoActorWhileMoving(Other, OtherComp, vect(0.0000000, 0.0000000, 0.0000000), HitNormal);
    //return;    
}

simulated function StartAdditiveClawSlapAnimation()
{
    local /*0x97E50000-0x00000000*/ private bool bSmackOnRight[8388609];
    local /*0x97E50000-0x00000000*/ private float RateOfAnimation[8388609];

    //return;    
}

event DelegateCrabMovingToEngageEnemyAvoidance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bAvoid;
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest;

    bAvoid = true;
    PawnToTest = Pawn(Obstacle);
    // End:0x4B
    if(PawnToTest == MyLPEnemy)
    {
        bAvoid = false;
    }
    return bAvoid;
    //return ReturnValue;    
}

function SetChargeCSA()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    DongoPawn.SetChargeCSA(bEnable);
    //return;    
}

function SetFrenzyCSA()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    DongoPawn.SetFrenzyCSA(bEnable);
    //return;    
}

function SetFleeCSA()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    DongoPawn.SetFleeCSA(bEnable);
    //return;    
}

function SetAttackResourceNames()
{
    MeleeResourceName = 'DongoFormation';
    StrikeResourceName = 'strike';
    FeintResourceName = 'Feint';
    StruggleResourceName = 'Struggle';
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];

    super.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage);
    DongoPawn.AddToDamageTracking(AmountOfDamage, true);
    // End:0x71
    if(DongoPawn.HaveAccumulatedDamageForFlee())
    {
    }
    //return;    
}

function ResetDamageNonCore()
{
    DongoPawn.ResetDamageNonCore();
    //return;    
}

function HasEnoughDamageForTaunt()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return DongoPawn.HasEnoughDamageForTaunt();
    //return ReturnValue;    
}

function IsDoingCharge()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL meleeCmd;

    // End:0x1C
    if((LPFindFirstAICommandOfClassInStack(Class'LPAICmd_CrabChargeAttack')) != none)
    {
        return true;
    }
    meleeCmd = LPAICmd_DongoMeleePof(LPFindFirstAICommandOfClassInStack(Class'LPAICmd_DongoMeleePof'));
    // End:0x79
    if(meleeCmd != none)
    {
        // End:0x79
        if(meleeCmd.IsInState('WithdrawForChargeAtEnemy'))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function FindOtherChargingDongo()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609], ReturnValue, OtherDongoPawn, OtherDongoController;

    // End:0xCB
    if(!HaveStrikeAccess())
    {
        OtherDongoPawn = LPAIPawnDongo(EnemyForAttack.AIResourceManager.GetAUser(StrikeResourceName));
        // End:0xCB
        if(OtherDongoPawn != none)
        {
            OtherDongoController = LPAIControllerDongo(OtherDongoPawn.Controller);
            // End:0xCB
            if(OtherDongoController.IsDoingCharge())
            {
                return OtherDongoPawn;
            }
        }
    }
    return none;
    //return ReturnValue;    
}

function GetStrikeRevokeRatingModificationFactor()
{
    local /*0x97E50000-0x00000000*/ private float Scale[25165825], Constant;

    super(LPAIController).GetStrikeRevokeRatingModificationFactor(Scale, Constant);
    // End:0xAF
    if(((int(WorldInfo.NetMode) == int(NM_Standalone)) && DongoPawn != none) && DongoPawn.HasNotBeenRenderedForTime(3.0000000))
    {
        Constant = 10.0000000 * DongoPawn.TimeSinceLastRendered();
    }
    //return;    
}

function ConstraintMovementInFacingDirection()
{
    local /*0x97E50000-0x00000000*/ private bool bConstraint[8388609];

    // End:0x5C
    if(DongoPawn.BankingData.TuneParams.bEnable)
    {
        super(LPAIController).ConstraintMovementInFacingDirection(bConstraint);
    }
    //return;    
}

function NotifyMoveCmdStartingMove()
{
    DongoPawn.TransitioningIntoMovement = 0;
    super(LPAIController).NotifyMoveCmdStartingMove();
    //return;    
}

function @NULL CanBeDestroyedByChargeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000400*/ private editfixedsize array ComponentArray;
    local /*0x97E50000-0x00000400*/ private @NULL OtherDestructComponent, FSM;

    // End:0x1A
    if(LPAIPawnAkridSmall(Other) != none)
    {
        return true;
    }
    FSM = SPFracturedStaticMeshActor(Other);
    // End:0x89
    if((FSM != none) && FSM.IsFracturedByDamageType(DongoPawn.DamageTypeChargeHit))
    {
        return true;
    }
    Other.GetComponentsOfClass(Class'SPDestructibles.SPActorDestructComponent', ComponentArray);
    // End:0xE8
    if(ComponentArray.Length > 0)
    {
        OtherDestructComponent = SPActorDestructComponent(ComponentArray[0]);
    }
    // End:0x139
    if(OtherDestructComponent != none)
    {
        // End:0x139
        if(OtherDestructComponent.CanDoDamageType(DongoPawn.DamageTypeChargeHit))
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function DestroyByChargeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], HitLocation, HitNormal, FSM;

    FSM = SPFracturedStaticMeshActor(Other);
    // End:0xC9
    if(FSM != none)
    {
        FSM.BreakOffPartsInRadius(HitLocation, DongoPawn.CylinderComponent.CollisionRadius, VSize(DongoPawn.Velocity), true);
        FSM.Explode();        
    }
    else
    {
        Other.TakeDamage(5000000, self, HitLocation, HitNormal, DongoPawn.DamageTypeChargeHit,, DongoPawn);
    }
    //return;    
}

function ShouldAviodActorTypeDuringCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !CanBeDestroyedByChargeHit(Other);
    //return ReturnValue;    
}

function CanBeDestroyedByFrenzyHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CanBeDestroyedByChargeHit(Other);
    //return ReturnValue;    
}

function DestroyByFrenzyHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], HitLocation, HitNormal, FSM;

    FSM = SPFracturedStaticMeshActor(Other);
    // End:0xC9
    if(FSM != none)
    {
        FSM.BreakOffPartsInRadius(HitLocation, DongoPawn.CylinderComponent.CollisionRadius, VSize(DongoPawn.Velocity), true);
        FSM.Explode();        
    }
    else
    {
        Other.TakeDamage(5000000, self, HitLocation, HitNormal, DongoPawn.DamageTypeChargeHit,, DongoPawn);
    }
    //return;    
}

function ShouldAviodActorTypeDuringFrenzy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !CanBeDestroyedByFrenzyHit(Other);
    //return ReturnValue;    
}

simulated function GetChargeStrikeHitDamageForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x1E
    if(LPAIPawnAkridSmall(HitPawn) != none)
    {
        return 1000000.0000000;
    }
    return super.GetChargeStrikeHitDamageForThisTarget(HitPawn);
    //return ReturnValue;    
}

function GetChargeBrushDamageForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;

    // End:0x1E
    if(LPAIPawnAkridSmall(HitPawn) != none)
    {
        return 1000000.0000000;
    }
    vsPawn = LPBaseVSPlayerPawn(HitPawn);
    // End:0x4F
    if(vsPawn != none)
    {
        return 0.0000000;
    }
    return super.GetChargeBrushDamageForThisTarget(HitPawn);
    //return ReturnValue;    
}

function AdjustHitPushForUnoccupiedVs()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest[8388609], hitPush;

    //return;    
}

function CmdFollowPath()
{
    local /*0x97E50000-0x00000000*/ private @NULL FollowPathData[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand, DongoFollowPathData;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    DongoFollowPathData = LPAIOD_DongoFollowPath(FollowPathData);
    // End:0xA6
    if(DongoFollowPathData == none)
    {
        Class'LPAICmd_FollowPath'.static.InitCommand(self);
        myCommand = LPAICmd_FollowPath(GetActiveCommand());        
    }
    else
    {
        Class'LPAICmd_DongoFollowPath'.static.InitCommand(self);
        myCommand = LPAICmd_DongoFollowPath(GetActiveCommand());
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

function IsDongo()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    TimeOfLastTaunt=-1.0000000
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerDongo.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerDongo.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerDongo.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerDongo.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerDongo.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerDongo.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    ArrayOfMeleeGroupClassToTurnOffAtTheEndOffAllStrikes=/* Array type was not detected. */
    HitReactionCmdClass=Class'LPAICmd_HitReaction'
    // Reference: SPAIReactionManager'Default__LPAIControllerDongo.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerDongo.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}