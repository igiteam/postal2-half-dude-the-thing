class LPAICmd_Stunned extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DurrationOfStunInSecs[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StunnedStatus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStartedStun;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class StunnedSpecialMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinSecStunnedAfterGrenadeHit;

function SetStunnedDuration()
{
    local /*0x97E50000-0x00000000*/ private float DurrationInSecs[8388609];

    DurrationOfStunInSecs = DurrationInSecs;
    //return;    
}

function SetSunnedSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class NewSpecialMove[8388609];

    StunnedSpecialMove = NewSpecialMove;
    //return;    
}

function SetStunInterruptible()
{
    local /*0x97E50000-0x00000000*/ private bool bIsThisStunInterruptible[8388609];

    SetInterruptible(bIsThisStunInterruptible);
    //return;    
}

function Pushed()
{
    super.Pushed();
    Outer.Focus = none;
    DurrationOfStunInSecs = 1.0000000;
    TimeStartedStun = -1.0000000;
    //return;    
}

function Popped()
{
    super.Popped();
    StunnedStatus.Cmd_Stunned_Status = 2;
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    super.SetReturnCmdStatus(ReturnStatus);
    StunnedStatus = LPAICmdStatus_Stunned(ReturnStatus);
    //return;    
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

    function OverrideDamageReaction()
    {
        local /*0x97E50000-0x00000000*/ private @NULL DM[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float TimeLeftToWakeUp;

        // End:0x14B
        if(class<LPDamageType>(MyPawn.TakeDamageParams.DamageType).default.bCausesExplosiveReactions)
        {
            DM.SetAIReactionDelegate(None);
            DM.SetAdditiveTemplateRoot(MyPawn.ATL_AdditiveHitReaction);
            TimeLeftToWakeUp = DurrationOfStunInSecs - (Outer.WorldInfo.TimeSeconds - TimeStartedStun);
            // End:0x149
            if(TimeLeftToWakeUp < MinSecStunnedAfterGrenadeHit)
            {
                DurrationOfStunInSecs += (MinSecStunnedAfterGrenadeHit - TimeLeftToWakeUp);
            }
            return true;
        }
        return super(LPAICommand).OverrideDamageReaction(DM);
        //return ReturnValue;        
    }

    function StillStunned()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x13
        if(DurrationOfStunInSecs < float(0))
        {
            return true;
        }
        // End:0x61
        if((Outer.WorldInfo.TimeSeconds - TimeStartedStun) > DurrationOfStunInSecs)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Focus = none;
    StunnedStatus.Cmd_Stunned_Status = 1;
    TimeStartedStun = Outer.WorldInfo.TimeSeconds;
    MyPawn.DoSpecialMove(StunnedSpecialMove, true, false);
    J0xAA:

    // End:0xD7 [Loop If]
    if(StillStunned())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xAA;
    }
    MyPawn.EndSpecialMove(StunnedSpecialMove);
    StunnedStatus.Cmd_Stunned_Status = 2;
    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    MinSecStunnedAfterGrenadeHit=2.0000000
}