class LPAICmd_Act1BossStrikeBase extends LPAICmd_Strike within LPAIControllerAct1Boss
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeHitEnemy;

function GetBestIdleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Enemy2D, Boss2D, Dest;

    Enemy2D = EnemyForStrike.Location;
    Enemy2D.Z = 0.0000000;
    Boss2D = Outer.BossPawn.TetherLoc;
    Boss2D.Z = 0.0000000;
    Dest = Enemy2D + (Normal(Boss2D - Enemy2D) * Outer.BossPawn.TuneDataBoss.DesiredIdleRange.GetValue());
    Dest.Z = Outer.BossPawn.TetherLoc.Z;
    // End:0x379
    if(VSizeSq(Dest - Outer.BossPawn.TetherLoc) > (Outer.BossPawn.TuneDataBoss.MaxTetherRange.GetValue() * Outer.BossPawn.TuneDataBoss.MaxTetherRange.GetValue()))
    {
        Dest = Outer.BossPawn.TetherLoc + (Normal(Dest - Outer.BossPawn.TetherLoc) * Outer.BossPawn.TuneDataBoss.MaxTetherRange.GetValue());
    }
    return Dest;
    //return ReturnValue;    
}

function Pushed()
{
    super.Pushed();
    bMeleeHitEnemy = false;
    Outer.bSpecialMovePlaying = false;
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0xCF
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0xCF
        if((Info.Impact.HitActor == EnemyForStrike) && Outer.BossPawn != none)
        {
            bMeleeHitEnemy = true;
        }
    }
    //return;    
}

event ImpactCombatTargetHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private name ImpactSocketName[8388609];
    local /*0x97E50000-0x00000000*/ private float ImpactRadius[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];

    // End:0x83
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(HitActor) != none)
    {
        // End:0x83
        if((HitActor == EnemyForStrike) && Outer.BossPawn != none)
        {
            bMeleeHitEnemy = true;
        }
    }
    //return;    
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

        super(SPStateObject).EndState(NextStateName);
        //return;        
    }
Begin:

    Outer.PopCommand(self);
    stop;                
}

defaultproperties
{
    bInterruptible=false
}