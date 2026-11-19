class LPAICmd_SpecialMove extends LPAICmd_SpecialMoveBase within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private class SpecialMoveClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PreSMPauseTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PostSMPauseTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceRestart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bClearFocus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxSpecialMoveTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSpecialMoveStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL InteractionActor;

function Pushed()
{
    super.Pushed();
    PostSMPauseTime = default.PostSMPauseTime;
    PreSMPauseTime = default.PreSMPauseTime;
    MaxSpecialMoveTime = default.MaxSpecialMoveTime;
    TimeSpecialMoveStarted = -1.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    //return;    
}

function SetSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InSpecialMoveClass[8388609];

    SpecialMoveClass = InSpecialMoveClass;
    //return;    
}

function SetPreSMPauseTime()
{
    local /*0x97E50000-0x00000000*/ private float inTime[8388609];

    PreSMPauseTime = inTime;
    //return;    
}

function SetPostSMPauseTime()
{
    local /*0x97E50000-0x00000000*/ private float inTime[8388609];

    PostSMPauseTime = inTime;
    //return;    
}

function SetMaxSpecialMoveTime()
{
    local /*0x97E50000-0x00000000*/ private float inTime[8388609];

    MaxSpecialMoveTime = inTime;
    //return;    
}

function SetForceRestart()
{
    local /*0x97E50000-0x00000000*/ private bool InForce[8388609];

    bForceRestart = InForce;
    //return;    
}

function SetInteractionActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL InInteractionActor[8388609];

    InteractionActor = InInteractionActor;
    //return;    
}

function OnSpecialMoveFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    // End:0x1D
    if(NextSM == none)
    {
        GotoState('Pause');
    }
    //return;    
}

state StateCmdActive
{Begin:

    // End:0x24
    if(PreSMPauseTime > 0.0000000)
    {
        GotoState('PrePause');        
    }
    else
    {
        GotoState('PlayingSM');
    }
    stop;        
}

state PlayingSM
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function HasMaxSpecialMoveTimePassedAndMovedNeedForceStop()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float TimePassed;

        TimePassed = Outer.WorldInfo.TimeSeconds - TimeSpecialMoveStarted;
        // End:0x89
        if(TimePassed > MaxSpecialMoveTime)
        {
            MyPawn.EndSpecialMove(SpecialMoveClass);
            return true;
        }
        return false;
        //return ReturnValue;        
    }
Begin:

    // End:0xAE
    if(Outer.myAIPawn.myKynapseHandle != none)
    {
        J0x39:

        // End:0xAE [Loop If]
        if(SPKynapseBotHandle(Outer.myAIPawn.myKynapseHandle).IsAnimatedPathInProgress())
        {
            Outer.Sleep(0.1000000);
            // [Loop Continue]
            goto J0x39;
        }
    }
    // End:0xDA
    if(bClearFocus)
    {
        Outer.PawnDontLook();
    }
    TimeSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    MyPawn.DoSpecialMove(SpecialMoveClass, true, bForceRestart, self.OnSpecialMoveFinished, InteractionActor);
    // End:0x1D1
    if(MaxSpecialMoveTime > float(0))
    {
        J0x182:

        // End:0x1B1 [Loop If]
        if(!HasMaxSpecialMoveTimePassedAndMovedNeedForceStop())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x182;
        }
        Outer.PopCommand(self);
    }
    stop;            
}

state PrePause
{Begin:

    // End:0x3D
    if(PreSMPauseTime > 0.0000000)
    {
        Outer.CmdPause(PreSMPauseTime, 1);
    }
    GotoState('PlayingSM');
    stop;                    
}

state Pause
{Begin:

    // End:0x3D
    if(PostSMPauseTime > 0.0000000)
    {
        Outer.CmdPause(PostSMPauseTime, 1);
    }
    Outer.PopCommand(self);
    stop;            
}

defaultproperties
{
    bForceRestart=true
    bClearFocus=true
    MaxSpecialMoveTime=-1.0000000
}