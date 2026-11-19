class LPAICmd_CarrierTalonThrustStrike extends LPAICmd_Strike within LPAIControllerCarrier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleePincerFinished[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SleepTimeInSecsDuringAttackUpdate[536870913];

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    bMeleePincerFinished = false;
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.MeleeFinished();
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

    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    SleepTimeInSecsDuringAttackUpdate=0.0100000
}