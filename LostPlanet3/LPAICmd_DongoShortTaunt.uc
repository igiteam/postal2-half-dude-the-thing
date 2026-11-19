class LPAICmd_DongoShortTaunt extends LPAICmd_Strike within LPAIControllerDongo;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bShortTauntFinished;

function Pushed()
{
    super.Pushed();
    Outer.bMeleeFinished = false;
    Outer.Focus = none;
    Outer.TimeOfLastTaunt = CurTime();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.Focus = none;
    OnExit();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    OnExit();
    //return;    
}

function OnExit()
{
    SetInterruptible(true, true);
    Outer.MeleeFinished();
    Outer.ResetRotationRate();
    Outer.LockStrikeAccess(false);
    Outer.ResetDamageNonCore();
    Outer.DongoPawn.ServerEndSpecialMove(Class'LPSM_DongoShortTaunt');
    Outer.Focus = none;
    //return;    
}

function On_LPSM_DongoShortTaunt_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bShortTauntFinished = true;
    //return;    
}

function StartDongoShortTaunt()
{
    bShortTauntFinished = false;
    Outer.DongoPawn.DoSpecialMove(Class'LPSM_DongoShortTaunt', true, false, On_LPSM_DongoShortTaunt_Finished, EnemyForStrike);
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        bShortTauntFinished = false;
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

    Outer.PawnZeroVelocity();
    // End:0xF8
    if(Outer.CanBeMyEnemy(EnemyForStrike))
    {
        Outer.Focus = EnemyForStrike;
        Outer.CmdTurnToFaceFocus(1);
        Outer.Sleep(0.0000000);
        SetInterruptible(false);
        StartDongoShortTaunt();
        J0xC9:

        // End:0xF8 [Loop If]
        if(!bShortTauntFinished)
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0xC9;
        }
    }
    Outer.PopCommand(self);
    stop;                
}
