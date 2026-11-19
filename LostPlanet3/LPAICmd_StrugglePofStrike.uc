class LPAICmd_StrugglePofStrike extends LPAICmd_Strike within LPAIController
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpecialMovePlaying;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bStruggleModeStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bResetStruggleTimers;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class StruggleModeClass;

function Pushed()
{
    super.Pushed();
    Outer.NotifyCombatManagerToRetractAllOptionsForThisPublisher();
    Outer.bMeleeFinished = false;
    bSpecialMovePlaying = false;
    bStruggleModeStarted = false;
    //return;    
}

function Popped()
{
    // End:0x77
    if(bSpecialMovePlaying && float(Outer.MySPPawn.Health) > 0.0000000)
    {
        EnemyForStrike.EndSpecialMove(GetStruggleSpecialMoveClass());
    }
    bSpecialMovePlaying = false;
    SetInterruptible(true, true);
    Outer.MeleeFinished();
    // End:0x11C
    if(bResetStruggleTimers)
    {
        Outer.ResetStruggleModeWaitTimer(EnemyForStrike);
        // End:0x11C
        if(bStruggleModeStarted)
        {
            Outer.ResetStruggleModeGlobalTimer(EnemyForStrike);
        }
    }
    super.Popped();
    //return;    
}

event SPAborted()
{
    Outer.ReleaseAllAttackAccess();
    super.SPAborted();
    //return;    
}

function OnFollowerSpecialMoveFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bSpecialMovePlaying = false;
    Outer.PopCommand(self);
    //return;    
}

function OnLeaderSpecialMoveFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM, FollowerSpecialMove;

    FollowerSpecialMove = SPSM_FollowerPawnBase(Outer.myAIPawn.GetCurrentSpecialMoveInstance());
    // End:0x96
    if(FollowerSpecialMove != none)
    {
        FollowerSpecialMove.SMFinishedDelegate = self.OnFollowerSpecialMoveFinished;        
    }
    else
    {
        bSpecialMovePlaying = false;
        Outer.PopCommand(self);
    }
    //return;    
}

function SetStruggleModeClass()
{
    local /*0x97E50000-0x00000000*/ private class InStruggleModeClass[8388609];

    StruggleModeClass = InStruggleModeClass;
    //return;    
}

function GetStruggleSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

function CanDoStruggle()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bEnemyIsCinematic;

    // End:0x11
    if(!IsInStrikeRange())
    {
        return false;
    }
    // End:0x22
    if(!HaveStruggleStrikeAccess())
    {
        return false;
    }
    // End:0x95
    if(!Outer.HasStrikeTimerExpired(EnemyForStrike, Outer.StruggleTimerName) && !Outer.IsStruggleModeForced())
    {
        return false;
    }
    // End:0x13D
    if(((EnemyForStrike.IsDoingASpecialMove() && !EnemyForStrike.IsDoingSpecialMove_OF_Class(Class'LPSM_GrenadePrime')) && !EnemyForStrike.IsDoingSpecialMove_OF_Class(Class'LPSM_PlayerMeleeAttack')) && !Outer.IsStruggleModeForced())
    {
        return false;
    }
    bEnemyIsCinematic = (EnemyForStrike.Controller != none) && LPPlayerController(EnemyForStrike.Controller).bCinematicMode == true;
    // End:0x1F6
    if(bEnemyIsCinematic || Outer.myAIPawn.bIsUnderMatineeControl)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function IsInStrikeRange()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function HaveStruggleStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.HaveStrikeAccess() || Outer.IsStruggleModeForced();
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

    // End:0x2F
    if(!CanDoStruggle())
    {
        Outer.PopCommand(self);
    }
    SetInterruptible(false);
    Outer.Focus = none;
    Outer.SetFocalPoint(vect(0.0000000, 0.0000000, 0.0000000));
    Outer.PawnZeroVelocity();
    // End:0xCA
    if(StruggleModeClass == none)
    {
        StruggleModeClass = GetStruggleSpecialMoveClass();
    }
    EnemyForStrike.ServerDoSpecialMove(StruggleModeClass, true, false, self.OnLeaderSpecialMoveFinished, Outer.myAIPawn);
    bSpecialMovePlaying = true;
    bStruggleModeStarted = true;
    J0x148:

    // End:0x16C [Loop If]
    if(true)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x148;
    }
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    bResetStruggleTimers=true
    bInterruptible=false
}