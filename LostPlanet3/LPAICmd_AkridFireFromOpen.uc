class LPAICmd_AkridFireFromOpen extends LPAICommand within LPAIControllerAkrid;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    GotoState('None');
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

state StateCmdActive
{Begin:

    GotoState('Firing');
    stop;        
}

state Firing
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

        Outer.WeaponStopFiring();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.PawnLookAtActor(Outer.FireTarget);
    Outer.Sleep(Outer.MyAkridPawn.TuneDataAkrid.GetBurstFireAIAimDelay());
    Outer.BurstStart();
    J0xBD:

    Outer.Sleep(0.2500000);
    // End:0xBD
    if(!(!Outer.BurstIsFiring()))
        goto J0xBD;
    Outer.BurstStop();
    Outer.Sleep(0.2500000);
    Outer.PopCommand(self);
    stop;        
}
