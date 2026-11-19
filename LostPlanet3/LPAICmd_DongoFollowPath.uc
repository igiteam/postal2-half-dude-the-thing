class LPAICmd_DongoFollowPath extends LPAICmd_FollowPath within LPAIControllerDongo;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DongoFollowPathData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ChargeAttack[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextAllowedChargetAttackTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CachedVS[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bChargeAttackMissed[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTripOnMiss[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastVSAttackSuccessful[536870913];

function SetFollowPathData()
{
    local /*0x97E50000-0x00000000*/ private @NULL Data[8388609];

    super.SetFollowPathData(Data);
    DongoFollowPathData = LPAIOD_DongoFollowPath(Data);
    SetupNextChargeTime();
    //return;    
}

function Pushed()
{
    SetInterruptible(true);
    bStartupAnimationFinished = true;
    bLastVSAttackSuccessful = false;
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.DongoPawn.SetChargeCSA(false);
    ChargeAttack = none;
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super.Paused(NewCommand);
    //return;    
}

function UpdateScriptedAttacker()
{
    local /*0x97E50000-0x00000000*/ private float EstimatedTimeToImpact[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerTarget;

    PlayerTarget = LPBasePlayerPawn(EnemyForAttack);
    // End:0x2D
    if(PlayerTarget == none)
    {
        return;
    }
    PlayerTarget.ScriptedAttacker = Outer.myAIPawn;
    PlayerTarget.ScriptedAttackerTimeOfNextImpact = Outer.WorldInfo.TimeSeconds + EstimatedTimeToImpact;
    //return;    
}

function ClearScriptAttacker()
{
    // End:0x82
    if(EnemyForAttack != none)
    {
        // End:0x82
        if(LPBasePlayerPawn(EnemyForAttack).ScriptedAttacker == Outer.myAIPawn)
        {
            LPBasePlayerPawn(EnemyForAttack).ScriptedAttacker = none;
        }
    }
    //return;    
}

function IsFightingVS()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2B
    if((EnemyForAttack == none) || LPBaseVSPlayerPawn(EnemyForAttack) == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsFightingPlayer()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x22
    if((EnemyForAttack != none) && !IsFightingVS())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AllowedToChargeEnemy()
{
    local /*0x97E50000-0x00000000*/ private int bDueToAccess[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerTarget;
    local /*0x97E50000-0x00000000*/ private float DistToEnemy;

    bDueToAccess = 0;
    // End:0x1C
    if(DongoFollowPathData == none)
    {
        return false;
    }
    // End:0x5F
    if(Outer.WorldInfo.TimeSeconds < NextAllowedChargetAttackTime)
    {
        return false;
    }
    PlayerTarget = LPBasePlayerPawn(EnemyForAttack);
    // End:0x8C
    if(PlayerTarget == none)
    {
        return false;
    }
    // End:0x16C
    if((PlayerTarget.ScriptedAttacker != none) && PlayerTarget.ScriptedAttacker.IsAliveAndWell())
    {
        // End:0x16C
        if(Outer.WorldInfo.TimeSeconds < (PlayerTarget.ScriptedAttackerTimeOfNextImpact + DongoFollowPathData.MinTimeBetweenConsecutiveCharges))
        {
            bDueToAccess = 1;
            return false;
        }
    }
    DistToEnemy = ActorSeperation2D(EnemyForAttack);
    // End:0x1C7
    if(IsFightingVS())
    {
        // End:0x1C4
        if(DistToEnemy < DongoFollowPathData.MinDistanceFromVSToChargeAttack)
        {
            return false;
        }        
    }
    else
    {
        // End:0x1EC
        if(!IsStrikeAccessPossible(EnemyForAttack))
        {
            bDueToAccess = 1;
            return false;
        }
        // End:0x21A
        if(DistToEnemy < DongoFollowPathData.MinDistanceFromPOFToChargeAttack)
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function SetupNextChargeTime()
{
    local /*0x97E50000-0x00000000*/ private float Rand;

    // End:0xA7
    if(DongoFollowPathData != none)
    {
        Rand = RandRange(DongoFollowPathData.MinFollowPathTimeBeforeAttack, DongoFollowPathData.MaxFollowPathTimeBeforeAttack);
        NextAllowedChargetAttackTime = Outer.WorldInfo.TimeSeconds + Rand;
    }
    //return;    
}

function On_LPSM_DongoRollStart_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x57
    if(DongoFollowPathData.bRollingLocomotion)
    {
        Outer.DongoPawn.SetChargeCSA(true);
    }
    bStartupAnimationFinished = true;
    //return;    
}

function DoStartupAnimation()
{
    // End:0xCF
    if((!DongoFollowPathData.bRollingLocomotion || bChargeAttackMissed) || Outer.DongoPawn.IsDoingChargeCSA())
    {
        // End:0xC3
        if(DongoFollowPathData.bRollingLocomotion)
        {
            Outer.DongoPawn.SetChargeCSA(true);
        }
        super.DoStartupAnimation();
        return;
    }
    bStartupAnimationFinished = false;
    SetDesiredEnemy(none);
    Outer.DongoPawn.DoSpecialMove(Class'LPSM_DongoRollStartFast', true, false, On_LPSM_DongoRollStart_Finished, none);
    //return;    
}

function ShouldTripOnPOFMiss()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x4A
    if(DongoFollowPathData.ChanceOfTripAfterChargeAttackMiss > float(1))
    {
        DongoFollowPathData.ChanceOfTripAfterChargeAttackMiss /= float(100);
    }
    // End:0x8F
    if(RandRange(0.0000000, 1.0000000) < DongoFollowPathData.ChanceOfTripAfterChargeAttackMiss)
    {
        bTripOnMiss = true;
        return true;
    }
    bTripOnMiss = false;
    return false;
    //return ReturnValue;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    // End:0x19
    if(InEnemy == EnemyForAttack)
    {
        return;
    }
    super(LPAICmd_Attack).SetDesiredEnemy(InEnemy);
    //return;    
}

function ShouldTurnToFaceDestination()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1B
    if(bLastVSAttackSuccessful)
    {
        bLastVSAttackSuccessful = false;
        return false;
    }
    return !Outer.DongoPawn.IsDoingChargeCSA() || bChargeAttackMissed;
    //return ReturnValue;    
}

function PickDestination()
{
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private @NULL OurMapInfo, DirToTarget, DirToRig;
    local /*0x97E50000-0x00000000*/ private float dotprod;
    local /*0x97E50000-0x00000000*/ private @NULL Current;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ValidPositions;
    local /*0x97E50000-0x00000000*/ private float ClosestDist, Dist;
    local /*0x97E50000-0x00000000*/ private @NULL Closest;

    // End:0x1B
    if(!IsFightingVS())
    {
        super.PickDestination();
        return;
    }
    OurMapInfo = LPMapInfo(Outer.WorldInfo.GetMapInfo());
    I = 0;
    J0x6E:

    // End:0xE9 [Loop If]
    if(I < OurMapInfo.PathTargetPointList.Length)
    {
        OurMapInfo.PathTargetPointList[I].bVisited = false;
        I++;
        // [Loop Continue]
        goto J0x6E;
    }
    Current = DongoFollowPathData.PathStartingPoint;
    DirToRig = Normal(EnemyForAttack.Location - Outer.Pawn.Location);
    J0x170:

    // End:0x290 [Loop If]
    if(Current.bVisited == false)
    {
        DirToTarget = Normal(Current.Location - Outer.Pawn.Location);
        dotprod = DirToTarget Dot DirToRig;
        // End:0x23B
        if(dotprod < 0.5000000)
        {
            ValidPositions.AddItem(Current);            
        }
        Current.bVisited = true;
        Current = LPPathTargetPoint(Current.NextPathTargetPoint);
        // [Loop Continue]
        goto J0x170;
    }
    I = 0;
    J0x29B:

    // End:0x382 [Loop If]
    if(I < ValidPositions.Length)
    {
        Dist = VSizeSq(ValidPositions[I].Location - Outer.Pawn.Location);
        // End:0x374
        if((Closest == none) || Dist < ClosestDist)
        {
            Closest = ValidPositions[I];
            ClosestDist = Dist;
        }
        I++;
        // [Loop Continue]
        goto J0x29B;
    }
    CurrentDestination = Closest;
    // End:0x3AE
    if(CurrentDestination == none)
    {
        super.PickDestination();
    }
    //return;    
}

state AttackBaseState
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL PlayerTarget;

        super(SPStateObject).BeginState(PreviousStateName);
        UpdateScriptedAttacker(4.0000000);
        PlayerTarget = LPBasePlayerPawn(EnemyForAttack);
        PlayerTarget.ScriptedAttacker = Outer.myAIPawn;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
    stop;    
}

state AttackPOF extends AttackBaseState
{
    function SetupAttackTime()
    {
        local /*0x97E50000-0x00000000*/ private float AttackTime;

        AttackTime = RandRange(DongoFollowPathData.MinTimeToAttackPOFOnSuccessfulChargeAttack, DongoFollowPathData.MaxTimeToAttackPOFOnSuccessfulChargeAttack);
        Outer.DelayFollowPathTime = Outer.WorldInfo.TimeSeconds + AttackTime;
        UpdateScriptedAttacker(AttackTime);
        //return;        
    }
Begin:

    bChargeAttackMissed = false;
    ChargeAttack = Outer.CmdPerformChargeAttackPofFollowPath(EnemyForAttack, -1.0000000, ShouldTripOnPOFMiss(),, 1);
    // End:0xBF
    if(ChargeAttack.CmdStatus_ChargeAttackUsing.WasTargetSuccessfullyStruck())
    {
        ChargeAttack = none;
        SetupAttackTime();
        Outer.PopCommand(self);        
    }
    else
    {
        // End:0x12C
        if(!bTripOnMiss && ChargeAttack.CmdStatus_ChargeAttackUsing.WasNothingHitDuringCharge())
        {
            ChargeAttack = none;
            bChargeAttackMissed = true;
            GotoState('StateCmdActive');
        }
    }
    ChargeAttack = none;
    Outer.Sleep(0.0100000);
    Outer.Focus = none;
    GotoState('StateCmdActive');
    stop;        
}

state AttackVS extends AttackBaseState
{
    function PerformChargeAttack()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Cmd;

        ChargeAttack = Outer.CmdPerformChargeAttackVSDirect(EnemyForAttack, -1.0000000,, 1);
        Cmd = LPAICmd_DongoChargeAttackVsDirect(ChargeAttack);
        // End:0xA2
        if(Cmd != none)
        {
            Cmd.PostChargeShakeoffTime = DongoFollowPathData.PostChargeShakeoffTime;
        }
        //return;        
    }
Begin:

    MyPawn.SetMaxSpeedScale(SaveMaxSpeedScale);
    MyPawn.RotationRate = SaveRotationRate;
    bChargeAttackMissed = false;
    PerformChargeAttack();
    // End:0xCF
    if(ChargeAttack.CmdStatus_ChargeAttackUsing.WasTargetSuccessfullyStruck() && EnemyForAttack.Controller != none)
    {
        bLastVSAttackSuccessful = true;
    }
    ChargeAttack = none;
    Outer.Sleep(0.0100000);
    Outer.Focus = none;
    GotoState('StateCmdActive');
    stop;            
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SetupNextChargeTime();
        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        // End:0x43
        if(CurMoveCmd != none)
        {
            Outer.AbortCommand(CurMoveCmd);
            CurMoveCmd = none;
        }
        super.EndState(NextStateName);
        //return;        
    }

    function PickBestTarget()
    {
        local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn;
        local /*0x97E50000-0x00000000*/ private int I;

        // End:0x27
        if(Outer.TargetList.Length == 0)
        {
            return;
        }
        SetDesiredEnemy(LPPawn(Outer.TargetList[0].Actor));
        // End:0x94
        if(Outer.TargetList.Length == 1)
        {
            return;
        }
        I = 0;
        J0x9F:

        // End:0x172 [Loop If]
        if(I < Outer.TargetList.Length)
        {
            PlayerPawn = LPPawn(Outer.TargetList[I].Actor);
            // End:0x164
            if((PlayerPawn != none) && PlayerPawn.Controller != none)
            {
                SetDesiredEnemy(PlayerPawn);
                return;
            }
            I++;
            // [Loop Continue]
            goto J0x9F;
        }
        SetDesiredEnemy(none);
        //return;        
    }

    function TickTargetCheck()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private int bAccessDenied;

        bAccessDenied = 0;
        // End:0x9E
        if(Outer.TargetList.Length > 0)
        {
            PickBestTarget();
            // End:0x65
            if((EnemyForAttack != none) && !AllowedToChargeEnemy(bAccessDenied))
            {
                return;
            }
            // End:0x83
            if(IsFightingPlayer())
            {
                GotoState('AttackPOF');                
            }
            else
            {
                // End:0x9E
                if(IsFightingVS())
                {
                    GotoState('AttackVS');
                }
            }
        }
        //return;        
    }

    function FollowPathTick()
    {
        local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x1A
        if(!super.FollowPathTick(DeltaTime))
        {
            return false;
        }
        // End:0x3A
        if(bStartupAnimationFinished)
        {
            TickTargetCheck(DeltaTime);
        }
        return true;
        //return ReturnValue;        
    }
    stop;    
}
