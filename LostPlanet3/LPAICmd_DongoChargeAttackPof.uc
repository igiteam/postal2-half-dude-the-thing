class LPAICmd_DongoChargeAttackPof extends LPAICmd_CrabChargeAttackPof within LPAIControllerDongo;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRollInFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bRollOutFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMovementStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnemyDodgedBeforeMove;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTripOnMiss;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ChargeStartTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PreRampUpFocus;

function GetDodgeWindowType()
{
    local /*0x97E50000-0x00000000*/ private byte ReturnValue[92274689];

    return 19;
    //return ReturnValue;    
}

function SetTripOnMiss()
{
    local /*0x97E50000-0x00000000*/ private bool bInTripOnMiss[8388609];

    bTripOnMiss = bInTripOnMiss;
    //return;    
}

function Pushed()
{
    super.Pushed();
    Outer.DongoPawn.bFirstDodgeWindownOpen = false;
    bMovementStarted = false;
    bEnemyDodgedBeforeMove = false;
    //return;    
}

function Popped()
{
    Outer.ResetRotationRate();
    CloseFirstDodgeWindow();
    super.Popped();
    Outer.DongoPawn.ServerEndSpecialMove(Class'LPSM_DongoRollStart');
    Outer.DongoPawn.ServerEndSpecialMove(Class'LPSM_DongoRollEnd');
    Outer.SetChargeCSA(false);
    Outer.ReleaseStrikeAccess();
    //return;    
}

function EndOfChargeAttack()
{
    Outer.Focus = EnemyForAttack;
    Outer.CmdTurnToFaceFocus(1);
    //return;    
}

event DelegateMovingToChargePointAvoidance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bAvoid;
    local /*0x97E50000-0x00000000*/ private @NULL PawnToTest, kActorObs;

    // End:0x173
    if(Outer.ShouldAviodActorTypeDuringCharge(Obstacle))
    {
        // End:0x9C
        if(Pawn(Obstacle) != none)
        {
            bAvoid = true;
            PawnToTest = Pawn(Obstacle);
            // End:0x8E
            if(PawnToTest == EnemyForAttack)
            {
                bAvoid = false;
            }
            return bAvoid;            
        }
        else
        {
            bAvoid = true;
            kActorObs = LPKActor(Obstacle);
            // End:0x168
            if(kActorObs != none)
            {
                // End:0x168
                if(CylinderComponent(kActorObs.CollisionComponent).CollisionHeight < Outer.CrabPawn.CylinderComponent.CollisionHeight)
                {
                    bAvoid = false;
                }
            }
            return bAvoid;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetHitPushDuringCharge()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ReturnValue;

    return vect(0.0000000, 0.0000000, 0.0000000);
    //return ReturnValue;    
}

function On_LPSM_DongoRollStart_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bRollInFinished = true;
    ChargeStartTime = Outer.DongoPawn.TuneDataDongo.ChargeRampUpTime.GetValue() + Outer.DongoPawn.WorldInfo.TimeSeconds;
    Outer.SetChargeCSA(true);
    //return;    
}

function StartDongoRollStart()
{
    Outer.myAIPawn.SetRadarIconState(2);
    bRollInFinished = false;
    PreRampUpFocus = Outer.Focus;
    Outer.Focus = EnemyForAttack;
    Outer.DongoPawn.DoSpecialMove(Class'LPSM_DongoRollStart', true, false, On_LPSM_DongoRollStart_Finished, none);
    //return;    
}

function GetDistanceBeyondTargetForChargingStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], Min, Max;

    Min = Outer.DongoPawn.TuneDataIceCrab.DongoChargeAttack_DistanceBeyondTargetForCharging_Min.GetValue();
    Max = Outer.DongoPawn.TuneDataIceCrab.DongoChargeAttack_DistanceBeyondTargetForCharging_Max.GetValue();
    return RandRange(Min, Max);
    //return ReturnValue;    
}

function OpenFirstDodgeWindow()
{
    // End:0xB0
    if(!Outer.DongoPawn.bFirstDodgeWindownOpen)
    {
        Outer.DongoPawn.HandleNotifyPlayerDodgeWindow(3, 0, EnemyForAttack);
        Outer.DongoPawn.bFirstDodgeWindownOpen = true;
    }
    //return;    
}

function CloseFirstDodgeWindow()
{
    // End:0xAE
    if(Outer.DongoPawn.bFirstDodgeWindownOpen)
    {
        Outer.DongoPawn.HandleNotifyPlayerDodgeWindow(3, 1, EnemyForAttack);
        Outer.DongoPawn.bFirstDodgeWindownOpen = false;
    }
    //return;    
}

function OpenDodgeWindow()
{
    CloseFirstDodgeWindow();
    super.OpenDodgeWindow();
    //return;    
}

function CloseDodgeWindow()
{
    super.CloseDodgeWindow();
    CloseFirstDodgeWindow();
    //return;    
}

function StopProcessRunInUpdateTimer()
{
    super(LPAICmd_CrabChargeAttack).StopProcessRunInUpdateTimer();
    CloseFirstDodgeWindow();
    //return;    
}

function ProcessDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private float seperationFormMeatBag, distanceToOpenWindow;

    super.ProcessDodgeWindow();
    // End:0x222
    if(((Outer.DongoPawn.TuneDataDongo.bEnableFirstDodgeWindow && EnemyForAttack != none) && !bDodgeWindownHasBeenOpenedAndClosed) && !CmdStatus_ChargeAttackUsing.IsDodgeWindowOpen())
    {
        // End:0x21F
        if(!Outer.DongoPawn.bFirstDodgeWindownOpen)
        {
            seperationFormMeatBag = VSize(Outer.myAIPawn.Location - EnemyForAttack.Location);
            distanceToOpenWindow = Outer.DongoPawn.TuneDataDongo.DistanceAwayToOpenDodgeWindowPof.GetValue() + Outer.DongoPawn.TuneDataDongo.AdditionalDistanceAwayToOpenFirstDodgeWindowPof.GetValue();
            // End:0x21F
            if(seperationFormMeatBag < distanceToOpenWindow)
            {
                OpenFirstDodgeWindow();
            }
        }        
    }
    else
    {
        CloseFirstDodgeWindow();
    }
    //return;    
}

function MoveToEnemyForChargingStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    bMovementStarted = true;
    bPreventOverriddenDamageReaction = false;
    // End:0x2A
    if(bEnemyDodgedBeforeMove)
    {
        return true;        
    }
    else
    {
        return super(LPAICmd_CrabChargeAttack).MoveToEnemyForChargingStrike();
    }
    //return ReturnValue;    
}

function CanOverrideDamageReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return bRollInFinished && super(LPAICmd_CrabChargeAttack).CanOverrideDamageReaction();
    //return ReturnValue;    
}

function ShouldEndChargeAttackOnMiss()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bTripOnMiss)
    {
        return true;
    }
    return super(LPAICmd_CrabChargeAttack).ShouldEndChargeAttackOnMiss();
    //return ReturnValue;    
}

function On_LPSM_DongoRollEnd_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bRollOutFinished = true;
    //return;    
}

function StartDongoRollEnd()
{
    bRollOutFinished = false;
    Outer.DongoPawn.DoSpecialMove(Class'LPSM_DongoRollEnd', true, false, On_LPSM_DongoRollEnd_Finished, none);
    //return;    
}

function DrawDebug()
{
    local /*0x97E50000-0x00000000*/ private @NULL InHUD[8388609], Start, End;

    // End:0x18F
    if(Outer.DongoPawn.bFirstDodgeWindownOpen)
    {
        Start = Outer.DongoPawn.Location;
        Start.Z += Outer.DongoPawn.CylinderComponent.CollisionHeight;
        End = EnemyForAttack.Location;
        End.Z = Start.Z;
        Outer.DongoPawn.DrawDebugCylinder(Start, End, 100.0000000, 12, 0, 0, 255);
    }
    // End:0x31E
    if(Outer.DongoPawn.bChargeDodgeWindowOpen)
    {
        Start = Outer.DongoPawn.Location;
        Start.Z += Outer.DongoPawn.CylinderComponent.CollisionHeight;
        End = EnemyForAttack.Location;
        End.Z = Start.Z;
        Outer.DongoPawn.DrawDebugCylinder(Start, End, 100.0000000, 12, 255, 0, 0);
    }
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        Outer.myAIPawn.ZeroMovementVariables();
        bEnemyDodgedBeforeMove = false;
        bMovementStarted = false;
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        Outer.ReleaseStrikeAccess();
        //return;        
    }

    function FaceEnemyForChargingStrike()
    {
        Outer.myAIPawn.ZeroMovementVariables();
        // End:0x10A
        if(Outer.IsTurnToFaceTargetCommandNeeded(EnemyForAttack, Outer.CrabPawn.TuneDataIceCrab.MinAngleInDegreesNeededForTurnToFaceCommandBeforeChargeAttack.GetValue()))
        {
            Outer.Focus = EnemyForAttack;
            Outer.CmdTurnToFaceFocus(1,, 1);
        }
        //return;        
    }

    function PrepareForChargingStrike()
    {
        Outer.myAIPawn.ZeroMovementVariables();
        Outer.Focus = none;
        StartDongoRollStart();
        //return;        
    }

    function IsPreparedForChargingStrike()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private @NULL NewRotRate;
        local /*0x97E50000-0x00000000*/ private float YawRate;

        // End:0x340
        if(bRollInFinished)
        {
            // End:0x340
            if(ChargeStartTime < Outer.DongoPawn.WorldInfo.TimeSeconds)
            {
                Outer.Focus = none;
                // End:0x22D
                if(Outer.DongoPawn.BankingData.TuneParams.bEnable)
                {
                    NewRotRate = Outer.DongoPawn.RotationRate;
                    NewRotRate.Yaw = int(Outer.DongoPawn.BankingData.TuneParams.TurnRateDegreesPerSecond * 182.0444000);
                    Outer.DongoPawn.RotationRate = NewRotRate;
                    // End:0x228
                    if(Outer.DongoPawn.BankingData.bDebugRoll)
                    {
                        return false;                        
                    }
                    else
                    {
                        return true;
                    }                    
                }
                else
                {
                    YawRate = Outer.DongoPawn.TuneDataDongo.DongoChargeAttackRotationRate.GetValue();
                    NewRotRate = Outer.DongoPawn.RotationRate;
                    NewRotRate.Yaw = int(YawRate * 182.0444000);
                    Outer.DongoPawn.RotationRate = NewRotRate;
                    return true;
                }
            }
        }
        return false;
        //return ReturnValue;        
    }

    function OverrideDamageReaction()
    {
        local /*0x97E50000-0x00000000*/ private @NULL DM[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x166
        if(CanOverrideDamageReaction())
        {
            // End:0x64
            if(DM.bIsVSMeleeDamage)
            {
                DM.SetAIReactionDelegate(None);
                return true;                
            }
            else
            {
                // End:0x152
                if(class<LPDamageType>(MyPawn.TakeDamageParams.DamageType).default.bCausesExplosiveReactions)
                {
                    Outer.CmdStatus_ChargeAttack.SetChargeInteruptedBecauseOfExplosion();
                    Outer.PopCommand(self.ChildCommand);
                    DM.SetAIReactionDelegate(None);
                    return true;
                }
            }
            return super.OverrideDamageReaction(DM);
        }
        return false;
        //return ReturnValue;        
    }

    event NotifyThatSpecialDodgeActorDodged()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
        local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL curTargetDodge;

        // End:0xAA
        if(!bMovementStarted && Outer.DongoPawn.bChargeDodgeWindowOpen)
        {
            curTargetDodge = LPSM_PlayerDodgeBase(EnemyForAttack.SpecialMoveState.CurSMInstance);
            // End:0xA7
            if(curTargetDodge != none)
            {
                bEnemyDodgedBeforeMove = true;
            }            
        }
        else
        {
            super(LPAICommand).NotifyThatSpecialDodgeActorDodged(Dodger, DodgePerforming);
        }
        //return;        
    }
    stop;    
}

state PostChargingShakeOff
{
    function TransitionOutOfCharge()
    {
        StartDongoRollEnd();
        //return;        
    }

    function FinishedTransitioningOutOfCharge()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x2D
        if(bRollOutFinished)
        {
            Outer.SetChargeCSA(false);
        }
        return bRollOutFinished;
        //return ReturnValue;        
    }

    event NotifyOfDangerousAmountOfDamage()
    {
        Outer.CmdShortFlee(EnemyForAttack);
        //return;        
    }
    stop;    
}

defaultproperties
{
    bTripOnMiss=true
}