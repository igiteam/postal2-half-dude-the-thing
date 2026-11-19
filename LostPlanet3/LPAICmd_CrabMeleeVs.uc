class LPAICmd_CrabMeleeVs extends LPAICmd_CrabMelee within LPAIControllerBaseSnowCrab;

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
            Outer.SetTimeForNextPincerBash(true);
        }
    }
    PossibleStrike = 0;
    //return;    
}

function GetMinDistanceAwayToTryChargeAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CrabPawn.TuneDataIceCrab.MinDistanceAwayToTryChargeAttackAgainstVs_Tunable.GetValue();
    //return ReturnValue;    
}

function AttackEnemy()
{
    super(LPAICmd_Melee).AttackEnemy();
    // End:0x4C
    if(int(PossibleStrike) == int(1))
    {
        Outer.CmdCrabClawStrikeVs(EnemyForAttack,, 1);        
    }
    else
    {
        // End:0x8B
        if(int(PossibleStrike) == int(2))
        {
            Outer.CmdCrabPincerStrikeVs(EnemyForAttack,, 1);
        }
    }
    //return;    
}

event NotifyOfNonCoreHit()
{
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x22
    if(ClassIsChildOf(TypeOfDamage, Class'LPDamageTypeVSDrill'))
    {
        ResetTimeForStrike();
    }
    return super(LPAICommand).NotifyOfNonCoreHit(AmountOfDamage, TypeOfDamage);
    //return ReturnValue;    
}

function GetMinTimeBetweenClawAttacks()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CrabPawn.TuneDataIceCrab.MinTimeBetweenAttacksVs.GetValue();
    //return ReturnValue;    
}

function GetMaxTimeBetweenClawAttacks()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CrabPawn.TuneDataIceCrab.MaxTimeBetweenAttacksVs.GetValue();
    //return ReturnValue;    
}

function CanDoPincerBash()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x72
    if(Outer.CrabPawn.IsClawLeftAbleToAttack() || Outer.CrabPawn.IsClawRightAbleToAttack())
    {
        return false;
    }
    // End:0xB5
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
        return (Outer.GetCurrentPincerBashReachDistanceAgaintVs() - Outer.MyKynapseRadius) - (Outer.CrabPawn.TuneDataIceCrab.PincerBashReachVsMovementErrorDistance_Tunable.GetValue() + float(25));
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
        return (Outer.GetCurrentPincerBashReachDistanceAgaintVs() - Outer.MyKynapseRadius) - Outer.CrabPawn.TuneDataIceCrab.PincerBashReachVsMovementErrorDistance_Tunable.GetValue();
    }
    //return ReturnValue;    
}

function StartCommandForChargeAttack()
{
    Outer.CmdPerformChargeAttackVS(EnemyForAttack, -1.0000000, Outer.CmdStatus_ChargeAttack, 1);
    //return;    
}

function GetTimeToFlee()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], timeToFlee;

    timeToFlee = RandRange(Outer.CrabPawn.TuneDataIceCrab.MinTimeToFleeWhenDismemberedFromVs.GetValue(), Outer.CrabPawn.TuneDataIceCrab.MaxTimeToFleeWhenDismemberedFromVs.GetValue());
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
        if(randDraw <= Outer.CrabPawn.TuneDataIceCrab.ChanceToFleeWhenDismemberedFromVs.GetValue())
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
        return Outer.CrabPawn.TuneDataIceCrab.MinSeperationFromEnemyToTryWithdrawVs.GetValue();        
    }
    else
    {
        return Outer.CrabPawn.TuneDataIceCrab.MinDismemberedSeperationFromEnemyToTryWithdrawVs.GetValue();
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
        return Outer.CrabPawn.TuneDataIceCrab.ChanceToTryWithdrawAndChargeVs.GetValue();        
    }
    else
    {
        return Outer.CrabPawn.TuneDataIceCrab.ChanceToTryDismemberedWithdrawAndChargeVs.GetValue();
    }
    //return ReturnValue;    
}

function IsFightingVS()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

defaultproperties
{
    MinAttackRange=70.0000000
    MaxAttackRange=80.0000000
}