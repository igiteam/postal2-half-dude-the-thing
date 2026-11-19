class LPAICmd_BasicWaitBetweenStrikes extends LPAICmd_Strike within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpecialMovePlaying[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFaceEnemyDuringWait[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSpecialMovePlayingStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float HowLongToWait[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class WaitingSpecialMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurTurnToFaceCmd[536870913];

function Pushed()
{
    super.Pushed();
    bSpecialMovePlaying = false;
    TimeSpecialMovePlayingStarted = 0.0000000;
    HowLongToWait = 0.0000000;
    CurTurnToFaceCmd = none;
    //return;    
}

function Popped()
{
    super.Popped();
    // End:0x60
    if(bSpecialMovePlaying)
    {
        bSpecialMovePlaying = false;
        Outer.myAIPawn.EndSpecialMove(WaitingSpecialMove);
    }
    Outer.ResetRotationRate();
    bSpecialMovePlaying = false;
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    Outer.ResetRotationRate();
    //return;    
}

function SetWaitingSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMove[8388609];

    WaitingSpecialMove = InSpecialMove;
    //return;    
}

function SetHowLongToWait()
{
    local /*0x97E50000-0x00000000*/ private float InHowLong[8388609];

    HowLongToWait = InHowLong;
    //return;    
}

function SetFaceEnemyDuringWait()
{
    local /*0x97E50000-0x00000000*/ private bool InFaceEnemyDuringWait[8388609];

    bFaceEnemyDuringWait = InFaceEnemyDuringWait;
    //return;    
}

function On_LPSM_WaitSM_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;
    local /*0x97E50000-0x00000000*/ private float durationOfAction;

    // End:0xCF
    if(bSpecialMovePlaying)
    {
        durationOfAction = Outer.WorldInfo.TimeSeconds - TimeSpecialMovePlayingStarted;
        // End:0x7B
        if(durationOfAction > HowLongToWait)
        {
            bSpecialMovePlaying = false;            
        }
        else
        {
            Outer.myAIPawn.DoSpecialMove(WaitingSpecialMove, true, true, On_LPSM_WaitSM_Finished);
        }        
    }
    //return;    
}

function ShouldTurnToFaceEnemyDuringWaitBetweenStrikes()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x12
    if(bFaceEnemyDuringWait == false)
    {
        return false;
    }
    // End:0xA5
    if((MyPawn.TransitionComponent != none) && MyPawn.TransitionComponent.NeedsTurnInPlaceToActor(Outer.myAIPawn.EnemySelectedByAttackCommand, true))
    {
        return true;
    }
    return false;
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

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function IsTimeToStopWaiting()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float timeSinceWaitStarted;

        timeSinceWaitStarted = Outer.WorldInfo.TimeSeconds - TimeSpecialMovePlayingStarted;
        // End:0x70
        if(bSpecialMovePlaying && timeSinceWaitStarted < HowLongToWait)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = none;
    bSpecialMovePlaying = true;
    TimeSpecialMovePlayingStarted = Outer.WorldInfo.TimeSeconds;
    Outer.myAIPawn.DoSpecialMove(WaitingSpecialMove, true, true, On_LPSM_WaitSM_Finished);
    J0xBA:

    // End:0x310 [Loop If]
    if(!IsTimeToStopWaiting())
    {
        Outer.PawnZeroVelocity();
        // End:0x1DE
        if((ShouldTurnToFaceEnemyDuringWaitBetweenStrikes()) && Outer.myAIPawn.EnemySelectedByAttackCommand != none)
        {
            Outer.Focus = Outer.myAIPawn.EnemySelectedByAttackCommand;
            CurTurnToFaceCmd = Outer.CmdTurnToFaceFocus(0);
            CurTurnToFaceCmd = none;
            Outer.Focus = none;            
        }
        else
        {
            // End:0x23D
            if(bFaceEnemyDuringWait)
            {
                Outer.Focus = Outer.myAIPawn.EnemySelectedByAttackCommand;
            }
        }
        // End:0x2D0
        if(!Outer.myAIPawn.IsDoingSpecialMove(WaitingSpecialMove))
        {
            Outer.myAIPawn.DoSpecialMove(WaitingSpecialMove, true, true, On_LPSM_WaitSM_Finished);
        }
        Outer.Sleep(0.0100000);
        Outer.Focus = none;
        // [Loop Continue]
        goto J0xBA;
    }
    bSpecialMovePlaying = false;
    Outer.myAIPawn.EndSpecialMove(WaitingSpecialMove);
    Outer.PopCommand(self);
    stop;            
}

defaultproperties
{
    bFaceEnemyDuringWait=true
}