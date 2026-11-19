class LPAttackValidity_TimeSinceSpawn extends LPAttackValidity
    editinlinenew
    hidecategories(Object);

var(0.25_Pct) /*0x7C410000-0x00000000*/ private float TimeSinceSpawn[65537];

simulated function IsValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (InController.WorldInfo.TimeSeconds - LPAIControllerAct1Boss(InController).TimeSpawned) >= TimeSinceSpawn;
    //return ReturnValue;    
}

defaultproperties
{
    TimeSinceSpawn=1.0000000
}