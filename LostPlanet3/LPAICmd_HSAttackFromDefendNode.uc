class LPAICmd_HSAttackFromDefendNode extends LPAICmd_Attack within LPAIControllerHumanSoldier;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefendNode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FireFromOpen[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float FiringCooldownTime[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.ReleaseRangedAccess();
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

    Outer.SetAttackResourceNames();
    GotoState('MovingToDefendNode');
    stop;            
}

state MovingToDefendNode
{
    function ManeuverToDefendNode()
    {
        local /*0x97E50000-0x00000000*/ private float CurrentDistance, ReachDistance;

        DefendNode = Outer.CoverExplorer.CoverTraversal.FindBestDefendNode();
        // End:0x84
        if(DefendNode == none)
        {
            Outer.PopCommand(self);
            return;
        }
        CurrentDistance = VSize(DefendNode.Location - MyPawn.Location);
        ReachDistance = 10.0000000;
        // End:0xF6
        if(CurrentDistance <= ReachDistance)
        {
            return;
        }
        Outer.PawnLookAtActor(EnemyForAttack);
        MoveToPositionCmd = Outer.CmdMoveToPosition(DefendNode.Location, EnemyForAttack, ReachDistance, Outer.CmdStatus_MoveToPosition, 1, 1, true);
        //return;        
    }
Begin:

    ManeuverToDefendNode();
    GotoState('FiringFromDefendNode');
    stop;                
}

state FiringFromDefendNode
{
    ignores BeginState;

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.CoverExplorer.CoverTraversal.ReleaseDefendNode();
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
    FiringCooldownTime = Outer.WeaponFiringCooldownTime(EnemyForAttack);
    J0x51:

    // End:0x12B [Loop If]
    if((Outer.WorldInfo.TimeSeconds - Outer.TimeStampLastTimeFiring) < FiringCooldownTime)
    {
        Outer.Sleep(FiringCooldownTime - (Outer.WorldInfo.TimeSeconds - Outer.TimeStampLastTimeFiring));
        // [Loop Continue]
        goto J0x51;
    }
    // End:0x1CC
    if(Outer.IsThereFireAccess(EnemyForAttack))
    {
        J0x156:

        // End:0x1A3 [Loop If]
        if(!Outer.CanHaveFireAccess(EnemyForAttack))
        {
            Outer.Sleep(0.5000000);
            // [Loop Continue]
            goto J0x156;
        }
        Outer.GetFireAccess(EnemyForAttack, false);
    }
    Outer.AISetFireTarget(EnemyForAttack);
    FireFromOpen = Outer.CmdFireFromOpen();
    GotoState('MovingToDefendNode');
    stop;        
}
