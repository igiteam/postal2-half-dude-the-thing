class SPAICommand extends SPEngineAICommand within SPAIController;

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL MySPAIObjective[536870913];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL SPAICmdStatus[536870913];

// Export USPAICommand::execNotifyObjectiveCommandPopped(FFrame&, void* const)
native function NotifyObjectiveCommandPopped();

// Export USPAICommand::execNotifyObjectiveCommandAborted(FFrame&, void* const)
native function NotifyObjectiveCommandAborted();

// Export USPAICommand::execSetSPAIObjective(FFrame&, void* const)
native function SetSPAIObjective()
{
    local /*0x03A30000-0x00000000*/ private @NULL InObjective[8388609];


}

function Pushed()
{
    super(GameAICommand).Pushed();
    Outer.NotifyCommandPushed(self);
    //return;    
}

function Popped()
{
    super(GameAICommand).Popped();
    NotifyObjectiveCommandPopped();
    //return;    
}

event SPAborted()
{
    NotifyObjectiveCommandAborted();
    super(GameAICommand).SPAborted();
    //return;    
}

function IsActive()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return GameAIOwner != none;
    //return ReturnValue;    
}

static function InitObjectiveCommand()
{
    local /*0x03A30000-0x00000000*/ private @NULL TheOuter[8388609], InSPObjective, ReturnValue, Cmd;

    // End:0x8D
    if((TheOuter != none) && InSPObjective != none)
    {
        InitCommand(TheOuter);
        Cmd = SPAICommand(TheOuter.GetActiveCommand());
        Cmd.SetSPAIObjective(InSPObjective);
    }
    return Cmd;
    //return ReturnValue;    
}

function NotifyFinishMatineeAnimControl()
{
    local /*0x03A30000-0x00000000*/ private @NULL SPAICMD;

    SPAICMD = SPAICommand(ChildCommand);
    // End:0x4A
    if(SPAICMD != none)
    {
        SPAICMD.NotifyFinishMatineeAnimControl();
    }
    //return;    
}

function NotifyReachedCoverSlot()
{
    local /*0x03A30000-0x00000000*/ private int SlotIdx[8388609], OldSlotIdx;

    //return;    
}

function ShouldSelectTarget()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private @NULL SPAICMD;

    SPAICMD = SPAICommand(ChildCommand);
    // End:0x4B
    if(SPAICMD != none)
    {
        return SPAICMD.ShouldSelectTarget();
    }
    return true;
    //return ReturnValue;    
}

function NotifyStartOfSpecialMove()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewMove[8388609], SPAICMD;

    SPAICMD = SPAICommand(ChildCommand);
    // End:0x53
    if(SPAICMD != none)
    {
        SPAICMD.NotifyStartOfSpecialMove(NewMove);
    }
    //return;    
}

function NotifyEndOfSpecialMove()
{
    local /*0x03A30000-0x00000000*/ private @NULL LastMove[8388609], SPAICMD;

    SPAICMD = SPAICommand(ChildCommand);
    // End:0x53
    if(SPAICMD != none)
    {
        SPAICMD.NotifyEndOfSpecialMove(LastMove);
    }
    //return;    
}

event NotifyAIResourceAccessLost()
{
    local /*0x03A30000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event NotifyAIResourceChanged()
{
    local /*0x03A30000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SetAICmd_Status()
{
    local /*0x03A30000-0x00000000*/ private byte NewStatus[8388609];

    // End:0x62
    if((SPAICmdStatus != none) && int(SPAICmdStatus.Cmd_Error) < int(1))
    {
        SPAICmdStatus.Cmd_Error = NewStatus;
    }
    //return;    
}

event HandleAnimNotifyMeleeStrikeBegin()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array GroupClass[8388609];
    local /*0x03A30000-0x00000000*/ private byte MomentumHint[8388609];

    //return;    
}

event HandleAnimNotifyMeleeStrikeEnd()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array GroupClass[8388609];

    //return;    
}

function NotifyTakeHit()
{
    local /*0x03A30000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation;
    local /*0x03A30000-0x00000000*/ private int Damage[8388609];
    local /*0x03A30000-0x00000000*/ private class DamageType[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL Momentum[8388609], myChildCommand;

    myChildCommand = SPAICommand(ChildCommand);
    // End:0x77
    if(myChildCommand != none)
    {
        myChildCommand.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum);
    }
    //return;    
}

event NotifyReceivedDamage()
{
    local /*0x03A30000-0x00000000*/ private int Damage[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL DamageInstigator[8388609], myChildCommand;

    myChildCommand = SPAICommand(ChildCommand);
    // End:0x5C
    if(myChildCommand != none)
    {
        myChildCommand.NotifyReceivedDamage(Damage, DamageInstigator);
    }
    //return;    
}

state DebugState
{
    function BeginState()
    {
        local /*0x03A30000-0x00000000*/ private name PreviousStateName[8388609];

        //return;        
    }

    function EndState()
    {
        local /*0x03A30000-0x00000000*/ private name NextStateName[8388609];

        //return;        
    }

    function PushedState()
    {
        //return;        
    }

    function PoppedState()
    {
        //return;        
    }

    function ContinuedState()
    {
        //return;        
    }

    function PausedState()
    {
        //return;        
    }
    stop;    
}
