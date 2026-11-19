class LPAICmd_DongoChargeAttackVsDirect extends LPAICmd_DongoChargeAttackVs within LPAIControllerDongo;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PostChargeShakeoffTime;

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

function EndOfChargeAttack()
{
    Outer.Focus = none;
    //return;    
}

function GetDurationOfChargingShakeOff()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return PostChargeShakeoffTime;
    //return ReturnValue;    
}

function StartDongoRollEnd()
{
    bRollOutFinished = true;
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
        // End:0x6B
        if((EnemyForAttack != none) && EnemyForAttack.Controller != none)
        {
            Outer.myAIPawn.SetRadarIconState(2);
        }
        Outer.Focus = none;
        //return;        
    }
    stop;    
}

defaultproperties
{
    PostChargeShakeoffTime=0.2000000
}