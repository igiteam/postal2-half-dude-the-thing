class LPAICmd_TurretRangedAttack extends LPAICmd_Attack within LPAIControllerTurret;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasIdle[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bTurretWarnTargetFinished[536870913];

function Pushed()
{
    super.Pushed();
    bTurretWarnTargetFinished = false;
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

function On_LPSM_TurretWarnTarget_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bTurretWarnTargetFinished = true;
    //return;    
}

state StateCmdActive
{Begin:

    GotoState('Attack');
    stop;        
}

state Attack
{
    ignores BeginState;

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
        //return;        
    }

    function IsTurretWarnTargetFinished()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return bTurretWarnTargetFinished;
        //return ReturnValue;        
    }
Begin:

    Outer.PawnZeroVelocity();
    bWasIdle = Outer.TurretPawn.IsIdle();
    // End:0x102
    if((Outer.FireTarget == none) || Outer.MainEnemy != Outer.FireTarget)
    {
        Outer.AISetFireTarget(Outer.MainEnemy);
    }
    Outer.TurretPawn.SetTurretTrackingMode(3);
    // End:0x1C5
    if(bWasIdle)
    {
        Outer.TurretPawn.DoSpecialMove(Class'LPSM_TurretWarnTarget', true, true, On_LPSM_TurretWarnTarget_Finished);
        J0x196:

        // End:0x1C5 [Loop If]
        if(!IsTurretWarnTargetFinished())
        {
            Outer.Sleep(0.0000000);
            // [Loop Continue]
            goto J0x196;
        }
    }
    FireFromOpen = Outer.CmdFireFromOpen();
    Outer.Sleep(Outer.WeaponFiringCooldownTime(EnemyForAttack) * RandRange(0.8000000, 1.2000000));
    goto 'Begin';
    stop;            
}
