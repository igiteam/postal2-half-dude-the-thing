class LPAICmd_DongoChargeAttackPofFromFollowPath extends LPAICmd_DongoChargeAttackPof within LPAIControllerDongo;

function EndOfChargeAttack()
{
    Outer.Focus = none;
    //return;    
}

state StateCmdActive
{
    ignores FaceEnemyForChargingStrike;

    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL SaveVelocity, SaveAcceleration;

        SaveVelocity = Outer.Pawn.Velocity;
        SaveAcceleration = Outer.Pawn.Acceleration;
        super.BeginState(PreviousState);
        Outer.Pawn.Velocity = SaveVelocity;
        Outer.Pawn.Acceleration = SaveAcceleration;
        //return;        
    }

    function IsPreparedForChargingStrike()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        bRollInFinished = true;
        return super.IsPreparedForChargingStrike();
        //return ReturnValue;        
    }

    function PrepareForChargingStrike()
    {
        Outer.myAIPawn.SetRadarIconState(2);
        Outer.Focus = none;
        //return;        
    }
    stop;    
}
