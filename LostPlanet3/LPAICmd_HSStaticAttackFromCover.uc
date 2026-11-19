class LPAICmd_HSStaticAttackFromCover extends LPAICmd_Attack within LPAIControllerHumanSoldier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PeekFromCoverCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int DamageReceivedWhileShooting;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bNoShooting[536870913];

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

function SetNoShooting()
{
    local /*0x97E50000-0x00000000*/ private bool bInNoShooting[8388609];

    bNoShooting = bInNoShooting;
    //return;    
}

private final function SelectEnemyAndCoverAction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL CoverAction;

    // End:0x11
    if(!IsMyEnemyAlive())
    {
        return false;
    }
    // End:0xD6
    if((EnemyForAttackActor != none) && Outer.CoverActionForEnemy(Outer.CoverGoal, EnemyForAttackActor, CoverAction))
    {
        Outer.AISetFireTarget(EnemyForAttackActor);
        // End:0xD4
        if(EnemyForAttackActor != none)
        {
            Outer.AISetCoverAction(CoverAction);
        }
        return true;
    }
    return false;
    //return ReturnValue;    
}

state StateCmdActive
{Begin:

    // End:0x35
    if(!Outer.CoverIsIn())
    {
        GotoState('MovingToBestCover');        
    }
    else
    {
        GotoState('InCover');
    }
    stop;                    
}

state MovingToBestCover
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

        StopMoving();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function StopMoving()
    {
        Outer.AbortCommand(MoveToCoverCmd);
        MoveToCoverCmd = none;
        //return;        
    }
Begin:

    // End:0x11A
    if(Outer.CoverExplorer.GetBestCover(Outer.PotentialCoverGoal))
    {
        MoveToCoverCmd = Outer.CmdMoveToCover(Outer.PotentialCoverGoal,,, true);
        J0xA1:

        // End:0x109 [Loop If]
        if(!Outer.CoverIsIn())
        {
            // End:0xE9
            if(!MyPawn.IsDoingASpecialMove())
            {
            }
            Outer.Sleep(0.1000000);
            // [Loop Continue]
            goto J0xA1;
        }
        GotoState('InCover');        
    }
    else
    {
        Outer.PopCommand(self);
    }
    stop;        
}

state InCover
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

        StopFiring();
        StopPeeking();
        Outer.AIClearCoverAction();
        super(SPStateObject).EndState(NextStateName);
        //return;        
    }

    function StopFiring()
    {
        Outer.AbortCommand(FireFromCoverCmd);
        FireFromCoverCmd = none;
        Outer.ReleaseFireAccess();
        //return;        
    }

    function StopPeeking()
    {
        Outer.AbortCommand(PeekFromCoverCmd);
        PeekFromCoverCmd = none;
        //return;        
    }

    event NotifyReceivedDamage()
    {
        local /*0x97E50000-0x00000000*/ private int Damage[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL DamageInstigator[8388609];

        super(SPAICommand).NotifyReceivedDamage(Damage, DamageInstigator);
        DamageReceivedWhileShooting += Damage;
        // End:0x11A
        if(DamageReceivedWhileShooting > Outer.HumanSoldierPawn.TuneDataHumanSoldier.DamageToReactMoving)
        {
            // End:0xD9
            if(bNoShooting && Outer.CoverActionIsDoing())
            {
                Outer.CoverResetAction();                
            }
            else
            {
                // End:0x11A
                if(Outer.WeaponIsFiring())
                {
                    Outer.WeaponStopFiring();
                }
            }
        }
        //return;        
    }
    J0x00:
    // End:0x44 [Loop If]
    if(!Outer.CoverIsIn())
    {
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x00;
    }
    J0x44:

    // End:0xA2 [Loop If]
    if(!SelectEnemyAndCoverAction())
    {
        // End:0x82
        if(!IsMyEnemyAlive())
        {
            Outer.PopCommand(self);
        }
        Outer.Sleep(0.2500000);
        // [Loop Continue]
        goto J0x44;
    }
FireFromCover:


    DamageReceivedWhileShooting = 0;
    // End:0xF3
    if(bNoShooting)
    {
        PeekFromCoverCmd = Outer.CmdPeekFromCover();
        StopPeeking();        
    }
    else
    {
        FireFromCoverCmd = Outer.CmdFireFromCover();
        StopFiring();
    }
    Outer.Sleep(0.2500000);
    goto 'FindCoverAction';
    stop;                
}
