class LPAICmd_CoverAIStaticMelee extends LPAICmd_Attack within LPAIController;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MeleeAttackCommand[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
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

function GetMinTimeTimer()
{
    local /*0x97E50000-0x00000000*/ private name ReturnValue[92274689];

    return 'None';
    //return ReturnValue;    
}

state StateCmdActive
{Begin:

    GotoState('WaitingForMelee');
    stop;        
}

state WaitingForMelee
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SPKynapseBotHandle(Outer.myAIPawn.myKynapseHandle).PathFinder_EnableCanPathToQuery(EnemyForAttack);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        SPKynapseBotHandle(Outer.myAIPawn.myKynapseHandle).PathFinder_DisableCanPathToQuery();
        //return;        
    }

    function WantsToMelee()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x2F
        if(!Outer.AICanMelee(EnemyForAttack))
        {
            return false;
        }
        // End:0x68
        if(!Outer.HasStrikeTimerExpired(EnemyForAttack, GetMinTimeTimer()))
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
    J0x00:
    // End:0x2F [Loop If]
    if(!WantsToMelee())
    {
        Outer.Sleep(0.0000000);
        // [Loop Continue]
        goto J0x00;
    }
    GotoState('MeleeAttack');
    stop;            
}

state MeleeAttack
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        GetStrikeAccess(EnemyForAttack);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        StopMelee();
        //return;        
    }

    function StopMelee()
    {
        Outer.AbortCommand(MeleeAttackCommand);
        MeleeAttackCommand = none;
        Outer.ReleaseStrikeAccess();
        Outer.ResetStrikeTimer(EnemyForAttack, GetMinTimeTimer());
        Outer.PawnZeroVelocity();
        //return;        
    }
Begin:

    MeleeAttackCommand = Outer.CmdCoverAIMelee(EnemyForAttack);
    StopMelee();
    GotoState('WaitingForMelee');
    stop;                
}
