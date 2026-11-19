class LPAICmd_SentinelStrikeBase extends LPAICmd_Strike within LPAIControllerSentinel
    abstract;

function Pushed()
{
    super.Pushed();
    Outer.bCurrentlyAllowedToTurtle = false;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.bCurrentlyAllowedToTurtle = true;
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super.SetDesiredEnemy(InEnemy);
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

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    bInterruptible=false
}