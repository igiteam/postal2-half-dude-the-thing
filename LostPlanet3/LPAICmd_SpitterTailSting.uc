class LPAICmd_SpitterTailSting extends LPAICmd_SpitterStrike within LPAIControllerSpitter;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSmFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHitEnemy[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLastAttackHitEnemy[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCmdAllowsEndOfEarlyAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseNumberOfSuccessfulHitsToEndAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TailStuckTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeToFreeStuckTail[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int RepeatCount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NextStrikeTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DelayBetweenStrikes[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSeperation_TailSting[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfTimeHitEnemy[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumberOfSuccessfulHitsToEndAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassStingIn[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassStingHold[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassStingOut[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassStingInReactive[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassStingQuickIn[131073];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class LPSMClassStingQuickOut[131073];

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    bSmFinished = false;
    TimeToFreeStuckTail = Outer.WorldInfo.TimeSeconds;
    Outer.SpitterPawn.ResetDamageTracker();
    NumberOfTimeHitEnemy = 0;
    TailStuckTime = GetTailStuckTime();
    AttackSeperation_TailSting = Outer.SpitterPawn.AttackSeperation_TailStingPof;
    bSpinOnTheSpotDuringHunkerDown = Outer.SpitterPawn.TuneDataSpitter.bAllowToSpinOnTheSpotWithoutAnimationDuringHunkerDownBeforeTailSting;
    // End:0x367
    if(bCmdAllowsEndOfEarlyAttack)
    {
        // End:0x2A9
        if(Outer.SpitterPawn.bAggressiveAttackSelection)
        {
            bUseNumberOfSuccessfulHitsToEndAttack = Outer.SpitterPawn.TuneDataSpitter.Aggressive_Overrides.QuickTailSting.bUseNumberOfSuccessfulHitsToEndAttack;
            NumberOfSuccessfulHitsToEndAttack = int(Outer.SpitterPawn.TuneDataSpitter.Aggressive_Overrides.QuickTailSting.NumberOfSuccessfulHitsToEndAttack.GetValue());            
        }
        else
        {
            bUseNumberOfSuccessfulHitsToEndAttack = Outer.SpitterPawn.TuneDataSpitter.bTailStingQuick_UseNumberOfSuccessfulHitsToEndAttack;
            NumberOfSuccessfulHitsToEndAttack = int(Outer.SpitterPawn.TuneDataSpitter.TailStingQuick_NumberOfSuccessfulHitsToEndAttack.GetValue());
        }
    }
    // End:0x382
    if(NumberOfSuccessfulHitsToEndAttack < 1)
    {
        bUseNumberOfSuccessfulHitsToEndAttack = false;
    }
    //return;    
}

function Popped()
{
    SetInterruptible(true, true);
    super.Popped();
    Outer.MeleeFinished();
    Outer.ResetRotationRate();
    // End:0xA0
    if(LPSMClassStingIn != none)
    {
        Outer.SpitterPawn.EndSpecialMove(LPSMClassStingIn);
    }
    // End:0xEC
    if(LPSMClassStingHold != none)
    {
        Outer.SpitterPawn.EndSpecialMove(LPSMClassStingHold);
    }
    // End:0x138
    if(LPSMClassStingOut != none)
    {
        Outer.SpitterPawn.EndSpecialMove(LPSMClassStingOut);
    }
    // End:0x184
    if(LPSMClassStingInReactive != none)
    {
        Outer.SpitterPawn.EndSpecialMove(LPSMClassStingInReactive);
    }
    // End:0x1D0
    if(LPSMClassStingQuickIn != none)
    {
        Outer.SpitterPawn.EndSpecialMove(LPSMClassStingQuickIn);
    }
    // End:0x21C
    if(LPSMClassStingQuickOut != none)
    {
        Outer.SpitterPawn.EndSpecialMove(LPSMClassStingQuickOut);
    }
    Outer.SetCSA(0);
    Outer.SpitterPawn.StopTailAnim();
    Outer.LockStrikeAccess(false);
    //return;    
}

function IsEnemyReachableForTailSting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsEnemyReachable(EnemyForStrike, AttackSeperation_TailSting.Max);
    //return ReturnValue;    
}

function CanContinueTailSting()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (Outer.IsTailIntact() && !Outer.IsTailBurning()) && IsEnemyReachableForTailSting();
    //return ReturnValue;    
}

event GotoStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x23
    if(CanContinueTailSting())
    {
        super(LPAICmd_Strike).GotoStateWithEnemyCheck(StateName);        
    }
    else
    {
        Outer.PopCommand(self);
    }
    //return;    
}

function PushStateWithEnemyCheck()
{
    local /*0x97E50000-0x00000000*/ private name StateName[8388609];

    // End:0x23
    if(CanContinueTailSting())
    {
        super(LPAICmd_Strike).PushStateWithEnemyCheck(StateName);        
    }
    else
    {
        Outer.PopCommand(self);
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x52
    if(Other.IsA('LPBaseVSPlayerPawn') && LPBaseVSPlayerPawn(Other).Controller == none)
    {
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x52
    if(Other.IsA('LPBaseVSPlayerPawn') && LPBaseVSPlayerPawn(Other).Controller == none)
    {
    }
    //return;    
}

function GetTailStuckTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], MinTime, MaxTime, StuckTime;

    // End:0x13
    if(bReactive)
    {
        return 0.0000000;
    }
    StuckTime = 0.0000000;
    // End:0xEA
    if(Outer.SpitterPawn.bAggressiveAttackSelection)
    {
        StuckTime = Outer.SpitterPawn.TuneDataSpitter.Aggressive_Overrides.TailSting.PercentChanceTailGettingStuckInGround.GetValue();        
    }
    else
    {
        StuckTime = Outer.SpitterPawn.TuneDataSpitter.PercentChanceTailGettingStuckInGround.GetValue();
    }
    // End:0x175
    if(StuckTime < float(0))
    {
        StuckTime = 0.0000000;        
    }
    else
    {
        // End:0x196
        if(StuckTime > float(100))
        {
            StuckTime = 100.0000000;
        }
    }
    StuckTime /= float(100);
    // End:0x441
    if(FRand() <= StuckTime)
    {
        // End:0x30B
        if(Outer.SpitterPawn.bAggressiveAttackSelection)
        {
            MinTime = Outer.SpitterPawn.TuneDataSpitter.Aggressive_Overrides.TailSting.MinTimeGettingStuckInGround.GetValue();
            MaxTime = Outer.SpitterPawn.TuneDataSpitter.Aggressive_Overrides.TailSting.MaxTimeGettingStuckInGround.GetValue();            
        }
        else
        {
            MinTime = Outer.SpitterPawn.TuneDataSpitter.MinTimeGettingStuckInGround.GetValue();
            MaxTime = Outer.SpitterPawn.TuneDataSpitter.MaxTimeGettingStuckInGround.GetValue();
        }
        // End:0x41B
        if(MinTime < MaxTime)
        {
            StuckTime = RandRange(MinTime, MaxTime);            
        }
        else
        {
            StuckTime = RandRange(MaxTime, MinTime);
        }
    }
    return StuckTime;
    //return ReturnValue;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897], curTargetDodge;
    local /*0x97E50000-0x00000000*/ private bool bHitEnemyThisTime;

    // End:0x178
    if((EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0x178
        if(Info.Impact.HitActor == EnemyForStrike)
        {
            bHitEnemyThisTime = true;
            curTargetDodge = LPSM_PlayerDodgeBase(EnemyForStrike.SpecialMoveState.CurSMInstance);
            // End:0x13F
            if(curTargetDodge != none)
            {
                // End:0x13F
                if(curTargetDodge.IsA('LPSM_PlayerDodgeSpitterTailRight') || curTargetDodge.IsA('LPSM_PlayerDodgeSpitterTailLeft'))
                {
                    bHitEnemyThisTime = false;
                }
            }
            bLastAttackHitEnemy = bHitEnemyThisTime;
            // End:0x178
            if(!bHitEnemy)
            {
                bHitEnemy = bHitEnemyThisTime;
            }
        }
    }
    //return;    
}

function DelayedMeleeHitSomething()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];

    // End:0x33
    if((EnemyForStrike != none) && EnemyForStrike == inActor)
    {
        ++NumberOfTimeHitEnemy;
    }
    //return;    
}

simulated event NotifyStopPawnChoreography()
{
    Outer.Focus = none;
    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curTargetDodge;

    // End:0x223
    if(Outer.SpitterPawn.bInDodgeWindow)
    {
        curTargetDodge = LPSM_PlayerDodgeBase(EnemyForStrike.SpecialMoveState.CurSMInstance);
        // End:0x223
        if(((LPVSFuturePlayerPawn(Dodger) != none) || curTargetDodge.IsA('LPSM_PlayerDodgeSpitterTailRight')) || curTargetDodge.IsA('LPSM_PlayerDodgeSpitterTailLeft'))
        {
            Outer.SpitterPawn.StopPawnChoreography();
            Outer.Focus = none;
            Outer.SetFocalPoint(Outer.SpitterPawn.Location + (Vector(Outer.SpitterPawn.Rotation) * float(1000)), true);
            Outer.SpitterPawn.EnableLineSweepHitTester(false);
            Outer.IgnoreDelayedMeleeDamageOn(EnemyForStrike);
        }
    }
    //return;    
}

function MoveClose()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return ManeuverForAttack(AttackSeperation_TailSting.Min, AttackSeperation_TailSting.Max, EnemyForStrike);
    //return ReturnValue;    
}

function OnSmFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bSmFinished = true;
    // End:0x81
    if((FinishedSM != none) && (FinishedSM.Class == LPSMClassStingIn) || FinishedSM.Class == LPSMClassStingQuickIn)
    {
        NotifyTailStingInFinished();
    }
    //return;    
}

function StartSmOfClass()
{
    local /*0x97E50000-0x00000000*/ private class SMClass[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0xB3
    if(SMClass != none)
    {
        // End:0x49
        if((SMClass == LPSMClassStingIn) || SMClass == LPSMClassStingQuickIn)
        {
            NotifyTailStingIn();
        }
        bSmFinished = false;
        Outer.SpitterPawn.DoSpecialMove(SMClass, true, false, OnSmFinished, EnemyForStrike);
        return true;        
    }
    else
    {
        bSmFinished = true;
        return false;
    }
    //return ReturnValue;    
}

function IsInPositionForTailSting()
{
    local /*0x97E50000-0x00000000*/ private float Seperation[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


    /* Statement decompilation error: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
        
    */
    /*@Error*/;
}

function NotifyTailStingIn()
{
    // End:0x37
    if(LPBaseVSPlayerPawn(EnemyForStrike) == none)
    {
        Outer.EnableDelayedMeleeDamage();
    }
    //return;    
}

function NotifyTailStingInFinished()
{
    // End:0x37
    if(LPBaseVSPlayerPawn(EnemyForStrike) == none)
    {
        Outer.DoPendingDelayedMeleeDamage();
    }
    //return;    
}

function ShouldTailGetStuck()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bPlayerDodged;

    bPlayerDodged = ((Outer.SpitterPawn.TuneDataSpitter.bAllowStuckIfLastAttackDodged) ? !bLastAttackHitEnemy : !bHitEnemy);
    return ((TailStuckTime > float(0)) && bPlayerDodged) && Outer.CanBeMyEnemy(EnemyForStrike);
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    event HandleDismemberment()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
        local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    // End:0x9D
    if(Outer.CanBeMyEnemy(EnemyForStrike))
    {
        PushStateWithEnemyCheck('AttackTransition');
        // End:0x74
        if(bReactive || WaitTimeBeforeAttack <= float(0))
        {
            GotoStateWithEnemyCheck('TailStingStart');            
        }
        else
        {
            PushStateWithEnemyCheck('DesignerSpecifiedWaiting');
        }
        GotoStateWithEnemyCheck('TailStingStart');        
    }
    else
    {
        Outer.PopCommand(self);
    }
    stop;            
}

state TailStingStart
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        StartMonitiringForReactiveAttack();
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        StopMonitiringForReactiveAttack();
        //return;        
    }

    event HandleDismemberment()
    {
        local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
        local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }
Begin:

    SetInterruptible(false);
    Outer.LockStrikeAccess(true);
    Outer.Focus = EnemyForStrike;
    Outer.EnableRotation(true);
    Outer.CmdTurnToFaceFocus(0);
    Outer.Focus = none;
    Outer.EnableRotation(false);
    // End:0x152
    if(Outer.HaveStrikeAccess() || bReactive)
    {
        Outer.LockStrikeAccess(true);
        PushStateWithEnemyCheck('MoveInRange');
        GotoStateWithEnemyCheck('TailStingIn');        
    }
    else
    {
        Outer.PopCommand(self);
    }
    stop;        
}

state TailStingIn
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function StartSm()
    {
        bSmFinished = false;
        // End:0x2F
        if(bReactive)
        {
            StartSmOfClass(LPSMClassStingInReactive);            
        }
        else
        {
            StartSmOfClass(LPSMClassStingIn);
        }
        //return;        
    }
Begin:

    StartSm();
    J0x0A:

    // End:0x39 [Loop If]
    if(!bSmFinished)
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x0A;
    }
    // End:0xCA
    if(Outer.IsTailIntact())
    {
        // End:0x91
        if((RepeatCount > 0) && LPSMClassStingQuickIn != none)
        {
            GotoStateWithEnemyCheck('TailStingRepeat');            
        }
        else
        {
            // End:0xB4
            if(ShouldTailGetStuck())
            {
                GotoStateWithEnemyCheck('TailStuck');                
            }
            else
            {
                GotoStateWithEnemyCheck('TailStingOut');
            }
        }        
    }
    else
    {
        Outer.PopCommand(self);
    }
    stop;        
}

state TailStingRepeat
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function CanRepeatTailSting()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x6D
        if(((RepeatCount > 1) && Outer.IsTailIntact()) && IsInPositionForTailSting())
        {
            // End:0x6B
            if(bUseNumberOfSuccessfulHitsToEndAttack && NumberOfTimeHitEnemy >= NumberOfSuccessfulHitsToEndAttack)
            {
                return false;
            }
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    // End:0x229
    if(Outer.IsTailIntact() && LPSMClassStingQuickIn != none)
    {
        J0x33:

        // End:0x229 [Loop If]
        if(CanRepeatTailSting())
        {
            bLastAttackHitEnemy = false;
            Outer.EnableRotation(false);
            // End:0x159
            if((DelayBetweenStrikes > float(0)) && LPSMClassStingHold != none)
            {
                NextStrikeTime = DelayBetweenStrikes + (CurTime());
                StartSmOfClass(LPSMClassStingHold);
                J0xC0:

                // End:0x11C [Loop If]
                if((NextStrikeTime > (CurTime())) && Outer.IsTailIntact())
                {
                    Outer.Sleep(0.0000000);
                    // [Loop Continue]
                    goto J0xC0;
                }
                Outer.SpitterPawn.EndSpecialMove(LPSMClassStingHold);
            }
            Outer.ResetHitTests();
            StartSmOfClass(LPSMClassStingQuickOut);
            J0x18B:

            // End:0x1BA [Loop If]
            if(!bSmFinished)
            {
                Outer.Sleep(0.0000000);
                // [Loop Continue]
                goto J0x18B;
            }
            Outer.ResetHitTests();
            StartSmOfClass(LPSMClassStingQuickIn);
            J0x1EC:

            // End:0x21B [Loop If]
            if(!bSmFinished)
            {
                Outer.Sleep(0.0000000);
                // [Loop Continue]
                goto J0x1EC;
            }
            --RepeatCount;
            // [Loop Continue]
            goto J0x33;
        }
    }
    // End:0x284
    if(Outer.IsTailIntact())
    {
        // End:0x26E
        if(ShouldTailGetStuck())
        {
            GotoStateWithEnemyCheck('TailStuck');            
        }
        else
        {
            GotoStateWithEnemyCheck('TailStingOut');
        }        
    }
    else
    {
        Outer.PopCommand(self);
    }
    stop;                
}

state TailStuck
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function StartTailStingHold()
    {
        // End:0x38
        if(StartSmOfClass(LPSMClassStingHold))
        {
            TimeToFreeStuckTail = (CurTime()) + TailStuckTime;            
        }
        else
        {
            TimeToFreeStuckTail = -10000.0000000;
        }
        //return;        
    }

    function IsItTimeToUnStuckTail()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x40
        if(((CurTime()) > TimeToFreeStuckTail) || !Outer.IsTailIntact())
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    Outer.ReleaseAllAttackAccess();
    StartTailStingHold();
    J0x29:

    // End:0x58 [Loop If]
    if(!IsItTimeToUnStuckTail())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x29;
    }
    Outer.SpitterPawn.EndSpecialMove(LPSMClassStingHold);
    GotoStateWithEnemyCheck('TailStingOut');
    stop;                
}

state TailStingOut
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        super(SPStateObject).PushedState();
        //return;        
    }

    event PausedState()
    {
        super(SPStateObject).PausedState();
        //return;        
    }

    function ContinuedState()
    {
        super(SPStateObject).ContinuedState();
        //return;        
    }

    event PoppedState()
    {
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.LockStrikeAccess(false);
    // End:0x84
    if(Outer.IsTailIntact())
    {
        StartSmOfClass(LPSMClassStingOut);
        J0x55:

        // End:0x84 [Loop If]
        if(!bSmFinished)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x55;
        }
    }
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    LPSMClassStingIn=Class'LPSM_SpitterAttackTailStingIn'
    LPSMClassStingHold=Class'LPSM_SpitterAttackTailStingHold'
    LPSMClassStingOut=Class'LPSM_SpitterAttackTailStingOut'
    LPSMClassStingInReactive=Class'LPSM_SpitterAttackTailStingInReactive'
    bDoTransitionInToAttack=true
    AttackCSA=eSpitterCSA.eSpitterCSA_Attack
}