class LPAICmd_FireWaspRangedBurstStrike extends LPAICmd_MedFlyerStrikeBase within LPAIControllerMedFlyer;

function Pushed()
{
    super.Pushed();
    //return;    
}

function Popped()
{
    Outer.NotifyCombatManagerOfStrikeCompleted(8);
    super.Popped();
    //return;    
}

function GetMaxStrikeAnimationTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return 5.0000000;
    //return ReturnValue;    
}

function IsStrikeAnimationDone()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(Outer.MedFlyerPawn.bPerformingBurstFire)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function StartStaticStrikeSpecialMove()
{
    Outer.MedFlyerPawn.SetAimInfoForBurstFireStrike(EnemyForStrike.Location, EnemyForStrike);
    Outer.MedFlyerPawn.StartOfRangedBurstFire();
    //return;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        super.EndState(NextStateName);
        //return;        
    }
Begin:

    StartStaticStrikeSpecialMove();
    J0x0A:

    // End:0x39 [Loop If]
    if(!IsStrikeAnimationDone())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x0A;
    }
    Outer.PopCommand(self);
    stop;            
}
