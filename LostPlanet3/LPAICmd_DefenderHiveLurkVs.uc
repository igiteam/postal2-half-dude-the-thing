class LPAICmd_DefenderHiveLurkVs extends LPAICmd_DefenderHiveLurk within LPAIControllerDefenderHive;

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

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function StartLaunchBehavior()
{
    super(LPAICmd_StationaryLaunchEngagement).StartLaunchBehavior();
    Outer.CmdLaunchDefendersPof(EnemyForAttack,, 1);
    //return;    
}
