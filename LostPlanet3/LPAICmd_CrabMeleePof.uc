class LPAICmd_CrabMeleePof extends LPAICmd_CrabMelee within LPAIControllerBaseSnowCrab;

function Pushed()
{
    super.Pushed();
    PossibleStrike = 0;
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
    // End:0x34
    if(int(PossibleStrike) == int(1))
    {
        SetTimeForNextClawStrike();        
    }
    else
    {
        // End:0x68
        if(int(PossibleStrike) == int(2))
        {
            Outer.SetTimeForNextPincerBash(false);
        }
    }
    PossibleStrike = 0;
    // End:0x122
    if(LPPlayerPawn(Outer.MyLPEnemy) != none)
    {
        // End:0x11F
        if(Outer.CrabPawn.HasClawLeftJustBeenDismembered() || Outer.CrabPawn.HasClawRightJustBeenDismembered())
        {
            GotoState('TauntReactive');
        }        
    }
    //return;    
}

function GetMinDistanceAwayToTryChargeAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CrabPawn.TuneDataIceCrab.MinDistanceAwayToTryChargeAttack_Tunable.GetValue();
    //return ReturnValue;    
}

function AttackEnemy()
{
    super(LPAICmd_Melee).AttackEnemy();
    // End:0x4C
    if(int(PossibleStrike) == int(1))
    {
        Outer.CmdCrabClawStrikePof(EnemyForAttack,, 1);        
    }
    else
    {
        // End:0x8B
        if(int(PossibleStrike) == int(2))
        {
            Outer.CmdCrabPincerStrikePof(EnemyForAttack,, 1);
        }
    }
    //return;    
}

function CanDoPincerBash()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x72
    if(Outer.CrabPawn.IsClawLeftAbleToAttack() || Outer.CrabPawn.IsClawRightAbleToAttack())
    {
        return false;
    }
    // End:0x8C
    if(LPAIPawnTurret(EnemyForAttack) != none)
    {
        return false;
    }
    // End:0xCF
    if(Outer.IsInBashZone(EnemyForAttack.Location, false))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CanStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x46
    if(super(LPAICmd_Melee).CanStrike())
    {
        // End:0x2B
        if(CanDoPincerBash())
        {
            PossibleStrike = 2;
            return true;            
        }
        else
        {
            // End:0x46
            if(IsTimeForClawStrike())
            {
                PossibleStrike = 1;
                return true;
            }
        }
    }
    PossibleStrike = 0;
    return false;
    //return ReturnValue;    
}

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x7D
    if(Outer.CrabPawn.IsClawLeftAbleToAttack() || Outer.CrabPawn.IsClawRightAbleToAttack())
    {
        return MinAttackRange;        
    }
    else
    {
        return (Outer.GetCurrentPincerBashReachDistanceAgaintPof() - Outer.MyKynapseRadius) - (Outer.CrabPawn.TuneDataIceCrab.PincerBashReachPofMovementErrorDistance_Tunable.GetValue() + 25.0000000);
    }
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x7D
    if(Outer.CrabPawn.IsClawLeftAbleToAttack() || Outer.CrabPawn.IsClawRightAbleToAttack())
    {
        return MaxAttackRange;        
    }
    else
    {
        return (Outer.GetCurrentPincerBashReachDistanceAgaintPof() - Outer.MyKynapseRadius) - Outer.CrabPawn.TuneDataIceCrab.PincerBashReachPofMovementErrorDistance_Tunable.GetValue();
    }
    //return ReturnValue;    
}

function StartCommandForChargeAttack()
{
    Outer.CmdPerformChargeAttackPof(EnemyForAttack, -1.0000000, Outer.CmdStatus_ChargeAttack, 1);
    //return;    
}

function GetTimeToFlee()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], timeToFlee;

    timeToFlee = RandRange(Outer.CrabPawn.TuneDataIceCrab.MinTimeToFleeWhenDismemberedFromPof.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MaxTimeToFleeWhenDismemberedFromPof.GetValue());
    return timeToFlee;
    //return ReturnValue;    
}

function ShouldFlee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float randDraw;

    // End:0xC3
    if(Outer.CrabPawn.AreClawsBothDismembered())
    {
        randDraw = RandRange(0.0000000, 1.0000000);
        // End:0xC3
        if(randDraw <= Outer.CrabPawn.TuneDataIceCrab.ChanceToFleeWhenDismemberedFromPof.GetValue())
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
}

function GetMinSeperationFromEnemyToTryWithdraw()
{
    local /*0x97E50000-0x00000000*/ private bool bDismembered[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x71
    if(!bDismembered)
    {
        return Outer.CrabPawn.TuneDataIceCrab.MinSeperationFromEnemyToTryWithdrawPof.GetValue();        
    }
    else
    {
        return Outer.CrabPawn.TuneDataIceCrab.MinDismemberedSeperationFromEnemyToTryWithdrawPof.GetValue();
    }
    //return ReturnValue;    
}

function GetChanceToTryWithdrawAndCharge()
{
    local /*0x97E50000-0x00000000*/ private bool bDismembered[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x71
    if(!bDismembered)
    {
        return Outer.CrabPawn.TuneDataIceCrab.ChanceToTryWithdrawAndChargePof.GetValue();        
    }
    else
    {
        return Outer.CrabPawn.TuneDataIceCrab.ChanceToTryDismemberedWithdrawAndChargePof.GetValue();
    }
    //return ReturnValue;    
}

function GetChanceToTauntAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CrabPawn.TuneDataIceCrab.ChanceToTryTauntAttackPof.GetValue();
    //return ReturnValue;    
}

event HandleDismemberment()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int CoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    GotoState('TauntReactive');
    return false;
    //return ReturnValue;    
}

function OptionalResetTimersAtStart()
{
    // End:0x38
    if(!Class'SPEngine.SPUtil'.static.IsSinglePlayerGame())
    {
        ResetAttackWaitTimer(0.0000000, 0.0000000);
    }
    //return;    
}

defaultproperties
{
    MinAttackRange=70.0000000
    MaxAttackRange=80.0000000
}