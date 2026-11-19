class LPAICmd_FireFromOpen extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int BurstsToFire;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStartedAiming;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    OnExit();
    super.Popped();
    //return;    
}

event SPAborted()
{
    super.SPAborted();
    //return;    
}

function OnExit()
{
    GotoState('None');
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

    // End:0x61
    if(Outer.FireTarget == none)
    {
        Outer.AISetFireTarget(Outer.MainEnemy);
    }
    // End:0xE7
    if((Outer.Focus == none) && Outer.AIWantsToFaceFiringTarget())
    {
        Outer.PawnLookAtActor(Outer.FireTarget);
    }
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

    TimeStampStartedAiming = Outer.WorldInfo.TimeSeconds;
    Outer.Sleep(Outer.WeaponAIAimDelay());
    J0x74:

    // End:0xD7 [Loop If]
    if(!Outer.CheckFireFacingThreshold(Outer.FireTarget))
    {
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x74;
    }
    Outer.WeaponStartFiring(BurstsToFire);
    // End:0x181
    if(Outer.WeaponIsReloading())
    {
        Outer.PawnDontLook();
        J0x140:

        Outer.Sleep(0.2500000);
        // End:0x140
        if(!(!Outer.WeaponIsReloading()))
            goto J0x140;
    }
    J0x181:

    Outer.Sleep(0.2500000);
    // End:0x227
    if((Outer.Focus == none) && Outer.AIWantsToFaceFiringTarget())
    {
        Outer.PawnLookAtActor(Outer.FireTarget);        
    }
    else
    {
        // End:0x310
        if(((Outer.Focus != none) && Outer.myAIPawn.IsAtDesiredRotationYaw(Outer.myAIPawn.DesiredRotation.Yaw)) && !Outer.AIWantsToFaceFiringTarget())
        {
            Outer.PawnDontLook();
        }
    }
    // End:0x181
    if(!(!Outer.WeaponIsFiring()))
        goto J0x181;
    // End:0x375
    if(Outer.WeaponIsReloading())
    {
        Outer.PawnDontLook();
    }
    Outer.Sleep(0.1000000);
    // End:0x3F5
    if(!Outer.WeaponIsSwitching())
    {
        // End:0x3F5
        if(Outer.SelectWeapon())
        {
            Outer.Sleep(0.2500000);
        }
    }
    J0x3F5:

    // End:0x437 [Loop If]
    if(Outer.WeaponIsSwitching())
    {
        Outer.Sleep(0.2500000);
        // [Loop Continue]
        goto J0x3F5;
    }
    // End:0x586
    if(Outer.bAimDownSight && (Outer.WorldInfo.TimeSeconds - TimeStampStartedAiming) < Outer.myAIPawn.TuneDataAIPawn.MinTimeAiming)
    {
        Outer.Sleep(Outer.myAIPawn.TuneDataAIPawn.MinTimeAiming - (Outer.WorldInfo.TimeSeconds - TimeStampStartedAiming));
    }
    Outer.PopCommand(self);
    stop;        
}
