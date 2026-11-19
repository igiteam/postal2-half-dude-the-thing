class LPAICmd_AlphaPackHunterDashAttack extends LPAICmd_PackHunterDashAttack within LPAIControllerAlphaPackHunter;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.EnableAlphaPackHunterRamCSA(false);
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Attack).SPAborted();
    Outer.EnableAlphaPackHunterRamCSA(false);
    //return;    
}

function Paused()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewCommand[8388609];

    super(LPAICommand).Paused(NewCommand);
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super(LPAICmd_PackHunterAttack).Resumed(OldCommandName);
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

        super.EndState(NextStateName);
        Outer.EnableAlphaPackHunterRamCSA(false);
        //return;        
    }

    function PreMoveToEnemyForStrike()
    {
        Outer.EnableAlphaPackHunterRamCSA(true);
        //return;        
    }

    function PostMoveToEnemyForStrike()
    {
        Outer.EnableAlphaPackHunterRamCSA(false);
        //return;        
    }
    stop;    
}
