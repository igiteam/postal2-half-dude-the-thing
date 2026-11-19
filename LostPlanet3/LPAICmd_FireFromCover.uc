class LPAICmd_FireFromCover extends LPAICommand within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private int BurstsToFire;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFiringPlayer;

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
        bFiringPlayer = LPPlayerPawn(Outer.FireTarget) != none;
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.WeaponStopFiring();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
    J0x00:
    // End:0x44 [Loop If]
    if(!Outer.CoverIsIn())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x00;
    }
PrepareFire:


    Outer.LastAnimTransitionTime = Outer.WorldInfo.TimeSeconds;
    J0x96:

    // End:0xD8 [Loop If]
    if(Outer.IsTransitioning())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x96;
    }
    // End:0x1BF
    if(Outer.ShouldWaitForTransition(Outer.FireTargetCoverAction.SrcAction))
    {
        Outer.LastAnimTransitionTime = Outer.WorldInfo.TimeSeconds;
        J0x17D:

        // End:0x1BF [Loop If]
        if(Outer.IsTransitioning())
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x17D;
        }
    }
    // End:0x242
    if(Outer.WeaponNeedsReload())
    {
        Outer.WeaponReload();
        J0x200:

        // End:0x242 [Loop If]
        if(Outer.WeaponIsReloading())
        {
            Outer.Sleep(0.1000000);
            // [Loop Continue]
            goto J0x200;
        }
    }
    // End:0x2F4
    if(int(Outer.FireTargetCoverAction.SrcAction) == int(0))
    {
        // End:0x2F1
        if(int(Outer.MyCoverPawn.CoverType) == int(2))
        {
            Outer.MyCoverPawn.ShouldCrouch(true);
        }        
    }
    else
    {
        Outer.AISetPeeking(false);
        Outer.CoverSetAction(Outer.FireTargetCoverAction.SrcAction);
        J0x364:

        // End:0x441 [Loop If]
        if(int(Outer.FireTargetCoverAction.SrcAction) != int(Outer.MyCoverPawn.CoverAction))
        {
            Outer.Sleep(0.0000000);
            Outer.CoverSetAction(Outer.FireTargetCoverAction.SrcAction);
            // [Loop Continue]
            goto J0x364;
        }
        Outer.Sleep(0.0000000);
    }
    Outer.LastAnimTransitionTime = Outer.WorldInfo.TimeSeconds;
    J0x4B0:

    // End:0x4F2 [Loop If]
    if(Outer.IsTransitioning())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x4B0;
    }
FireWeapon:


    // End:0x539
    if(bFiringPlayer)
    {
        Outer.Sleep(Outer.WeaponAIAimDelay());        
    }
    else
    {
        Outer.Sleep(0.2500000);
    }
    Outer.WeaponStartFiring(BurstsToFire);
    // End:0x5E1
    if(Outer.WeaponIsReloading())
    {
        J0x5A0:

        Outer.Sleep(0.0000000);
        // End:0x5A0
        if(!(!Outer.WeaponIsReloading()))
            goto J0x5A0;
    }
    J0x5E1:

    Outer.Sleep(0.0000000);
    // End:0x5E1
    if(!(!Outer.WeaponIsFiring()))
        goto J0x5E1;
    Outer.Sleep(0.0000000);
    // End:0x6A2
    if(!Outer.WeaponIsSwitching())
    {
        // End:0x6A2
        if(Outer.SelectWeapon())
        {
            Outer.Sleep(0.0000000);
        }
    }
    J0x6A2:

    // End:0x6E4 [Loop If]
    if(Outer.WeaponIsSwitching())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x6A2;
    }
    Outer.WeaponStopFiring();
    Outer.Sleep(0.0000000);
ReturnToCover:


    // End:0x764
    if(bFiringPlayer)
    {
        Outer.Sleep(Outer.WeapoAIAfterFiringDelay());
    }
    Outer.CoverResetAction();
    J0x783:

    // End:0x7C5 [Loop If]
    if(Outer.IsTransitioning())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x783;
    }
Finish:


    Outer.PopCommand(self);
    stop;            
}
