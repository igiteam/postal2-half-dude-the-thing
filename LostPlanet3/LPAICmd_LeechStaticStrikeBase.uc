class LPAICmd_LeechStaticStrikeBase extends LPAICmd_LeechStrikeBase within LPAIControllerLeech
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpecialMovePlaying;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeHitEnemy;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSpecialMovePlayingStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeHitEnemy;

function Pushed()
{
    super.Pushed();
    bMeleeHitEnemy = false;
    bSpecialMovePlaying = false;
    TimeSpecialMovePlayingStarted = 0.0000000;
    //return;    
}

function Popped()
{
    // End:0x99
    if(Outer.LeechPawn != none)
    {
        Outer.LeechPawn.HandleNotifyPlayerDodgeWindow(11, 1, EnemyForStrike);
        Outer.LeechPawn.StopPawnChoreography();
    }
    super.Popped();
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x140
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0x140
        if((Info.Impact.HitActor == EnemyForStrike) && Outer.LeechPawn != none)
        {
            Outer.LeechPawn.StopPawnChoreography();
            bMeleeHitEnemy = true;
            TimeHitEnemy = Outer.WorldInfo.TimeSeconds;
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

    // End:0xF4
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(HitActor) != none)
    {
        // End:0xF4
        if((HitActor == EnemyForStrike) && Outer.LeechPawn != none)
        {
            Outer.LeechPawn.StopPawnChoreography();
            bMeleeHitEnemy = true;
            TimeHitEnemy = Outer.WorldInfo.TimeSeconds;
        }
    }
    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];

    // End:0x14C
    if(Outer.LeechPawn != none)
    {
        Outer.LeechPawn.StopPawnChoreography();
        Outer.Focus = none;
        Outer.SetFocalPoint(Outer.Pawn.Location + (Vector(Outer.Pawn.Rotation) * Outer.LeechPawn.TuneDataLeech.DistanceAwayToSetFocalPointAfterMeleeStrike), true);
    }
    //return;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bPushLeechAway;

    bPushLeechAway = Outer.LeechPawn.TuneDataLeech.bGetKnockedDownOnPlayerMeleeInsteadOfTakingDamage.GetValue() != float(0);
    // End:0x15E
    if(bPushLeechAway)
    {
        Outer.LeechPawn.TuneDataLeech.bHitAtLeastOnceByMelee = true;
        Outer.LeechPawn.ServerKnockDownMelee(PlayerPawn, ImpactLocation);
        LPPlayerPawn(PlayerPawn).ImpactCombatTargetPlayEffects(Outer.LeechPawn, Class'LPDamageTypeMelee');
        return true;
    }
    return false;
    //return ReturnValue;    
}

function On_LPSM_StaticStrike_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bSpecialMovePlaying = false;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_LeechFlyingBiteStrike';
    //return ReturnValue;    
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
    local /*0x97E50000-0x00000000*/ private float maxLengthOfAnimation, timeSinceAnimationStarted;

    timeSinceAnimationStarted = Outer.WorldInfo.TimeSeconds - TimeSpecialMovePlayingStarted;
    maxLengthOfAnimation = GetMaxStrikeAnimationTime();
    // End:0x84
    if(bSpecialMovePlaying && timeSinceAnimationStarted < maxLengthOfAnimation)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function StartStaticStrikeSpecialMove()
{
    bSpecialMovePlaying = true;
    TimeSpecialMovePlayingStarted = Outer.WorldInfo.TimeSeconds;
    Outer.LeechPawn.DoSpecialMove(GetStaticStrikeSpecialMoveClass(), true, true, On_LPSM_StaticStrike_Finished, EnemyForStrike);
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
