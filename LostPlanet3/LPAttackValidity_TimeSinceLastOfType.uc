class LPAttackValidity_TimeSinceLastOfType extends LPAttackValidity
    editinlinenew
    hidecategories(Object);

enum EBossAttackType
{
    eatTongue,                      // 0
    eatClaw,                        // 1
    eatBite,                        // 2
    eatLeechSpawn,                  // 3
    eatTaunt,                       // 4
    EBossAttackType_MAX             // 5
};

var(0.25_Pct) /*0x7C400000-0x00000000*/ private float TimeSinceLastOfType[65537];
var(0.25_Pct) /*0x7C400000-0x00000000*/ private byte TypeToCheck[65537];

simulated function IsValid()
{
    local /*0x97E50000-0x00000000*/ private @NULL InController[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(TypeToCheck)
    {
        // End:0x80
        case 0:
            return (InController.WorldInfo.TimeSeconds - LPAIControllerAct1Boss(InController).TimeOfLastTongueAttack) >= TimeSinceLastOfType;
        // End:0xED
        case 1:
            return (InController.WorldInfo.TimeSeconds - LPAIControllerAct1Boss(InController).TimeOfLastClawAttack) >= TimeSinceLastOfType;
        // End:0x15A
        case 2:
            return (InController.WorldInfo.TimeSeconds - LPAIControllerAct1Boss(InController).TimeOfLastBiteAttack) >= TimeSinceLastOfType;
        // End:0x1C7
        case 3:
            return (InController.WorldInfo.TimeSeconds - LPAIControllerAct1Boss(InController).TimeOfLastLeechSpawn) >= TimeSinceLastOfType;
        // End:0x234
        case 4:
            return (InController.WorldInfo.TimeSeconds - LPAIControllerAct1Boss(InController).TimeOfLastTaunt) >= TimeSinceLastOfType;
        // End:0xFFFF
        default:
            //return ReturnValue;
            break;
    }    
}

defaultproperties
{
    TimeSinceLastOfType=1.0000000
}