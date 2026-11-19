class LPAICmd_StaticAttackFromOpen extends LPAICmd_Attack within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromOpen[536870913];

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

    // End:0xEC
    if(Outer.CoverIsIn())
    {
        // End:0x89
        if(Outer.CoverActionIsDoing() && !Outer.CanExitCoverFromCoverAction())
        {
            Outer.CoverResetAction();
        }
        J0x89:

        // End:0xCB [Loop If]
        if(Outer.IsTransitioning())
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x89;
        }
        Outer.CoverExit();
    }
    GotoState('Firing');
    stop;        
}

state Firing
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x91
        if(Outer.bDisableAI && int(Outer.MySPPawn.Physics) == int(7))
        {
            Outer.MySPPawn.SetPhysics(1);
        }
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopFiring();
        //return;        
    }

    function StopFiring()
    {
        Outer.AbortCommand(FireFromOpen);
        FireFromOpen = none;
        Outer.ReleaseFireAccess();
        //return;        
    }
Begin:

    Outer.PawnZeroVelocity();
    // End:0x4E
    if(!IsMyEnemyAlive())
    {
        Outer.PopCommand(self);
    }
    Outer.AISetFireTarget(EnemyForAttackActor);
    FireFromOpen = Outer.CmdFireFromOpen();
    Outer.Sleep(0.5000000);
    goto 'Begin';
    stop;            
}
