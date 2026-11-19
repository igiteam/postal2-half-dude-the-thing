class LPAICmd_AkridMediumStrikeBase extends LPAICmd_Strike within LPAIControllerAkridMedium
    abstract;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    // End:0x63
    if(Outer.AkridMediumPawn != none)
    {
        Outer.AkridMediumPawn.CurrentStrikeTargetToIgnoreBlockingBy = none;
    }
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