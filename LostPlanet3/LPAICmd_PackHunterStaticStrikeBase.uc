class LPAICmd_PackHunterStaticStrikeBase extends LPAICmd_PackHunterStrikeBase within LPAIControllerPackHunter
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
    Outer.EnablePHDefaultHitReaction(false);
    //return;    
}

function Popped()
{
    Outer.EnablePHDefaultHitReaction(true);
    // End:0xB9
    if(Outer.PHPawn != none)
    {
        Outer.PHPawn.HandleNotifyPlayerDodgeWindow(10, 1, EnemyForStrike);
        Outer.PHPawn.StopPawnChoreography();
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
        if((Info.Impact.HitActor == EnemyForStrike) && Outer.PHPawn != none)
        {
            Outer.PHPawn.StopPawnChoreographyReplicated();
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
        if((HitActor == EnemyForStrike) && Outer.PHPawn != none)
        {
            Outer.PHPawn.StopPawnChoreographyReplicated();
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
    if(Outer.PHPawn != none)
    {
        Outer.PHPawn.StopPawnChoreographyReplicated();
        Outer.Focus = none;
        Outer.SetFocalPoint(Outer.Pawn.Location + (Vector(Outer.Pawn.Rotation) * Outer.PHPawn.TuneDataPackHunter.DistanceAwayToSetFocalPointAfterMeleeStrike), true);
    }
    //return;    
}

function On_LPSM_PackHunterStaticStrike_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bSpecialMovePlaying = false;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_PackHunterLungeClawAttackMed';
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
    Outer.PHPawn.DoSpecialMove(GetStaticStrikeSpecialMoveClass(), true, true, On_LPSM_PackHunterStaticStrike_Finished, EnemyForStrike);
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
