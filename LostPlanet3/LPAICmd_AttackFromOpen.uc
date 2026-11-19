class LPAICmd_AttackFromOpen extends LPAICmd_Attack within LPAIController
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUsingRangedCoverAIsFormation[536870913];

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    StopUsingRangedCoverAIsFormation();
    super.Popped();
    //return;    
}

function @NULL StartUsingRangedCoverAIsFormation()
{
    local /*0x97E50000-0x00000400*/ private @NULL ResManPlayer;

    // End:0x0F
    if(bUsingRangedCoverAIsFormation)
    {
        return;
    }
    bUsingRangedCoverAIsFormation = false;
    // End:0xA8
    if(Outer.ShouldUseFormations())
    {
        ResManPlayer = LPAIResManPlayer(EnemyForAttack.AIResourceManager);
        // End:0xA8
        if(ResManPlayer != none)
        {
            bUsingRangedCoverAIsFormation = true;
            ResManPlayer.UsingRangedCoverAIsFormation();
        }
    }
    //return;    
}

function @NULL StopUsingRangedCoverAIsFormation()
{
    local /*0x97E50000-0x00000400*/ private @NULL ResManPlayer;

    // End:0x78
    if(bUsingRangedCoverAIsFormation)
    {
        ResManPlayer = LPAIResManPlayer(EnemyForAttack.AIResourceManager);
        // End:0x78
        if(ResManPlayer != none)
        {
            bUsingRangedCoverAIsFormation = false;
            ResManPlayer.StopUsingRangedCoverAIsFormation();
        }
    }
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
    StartUsingRangedCoverAIsFormation();
    GotoState('AttackFromOpen');
    stop;                    
}
