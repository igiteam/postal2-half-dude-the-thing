class LPAICmd_MedFlyerBasicPhysicalStrike extends LPAICmd_MedFlyerStrikeBase within LPAIControllerMedFlyer;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSpecialMovePlaying;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMeleeHitEnemy;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeSpecialMovePlayingStarted;

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
    // End:0x58
    if(Outer.MedFlyerPawn != none)
    {
        Outer.MedFlyerPawn.StopPawnChoreography();
    }
    super.Popped();
    //return;    
}

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    // End:0x103
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(Info.Impact.HitActor) != none)
    {
        // End:0x103
        if((Info.Impact.HitActor == EnemyForStrike) && Outer.MedFlyerPawn != none)
        {
            Outer.MedFlyerPawn.StopPawnChoreography();
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

    // End:0xB7
    if((!bMeleeHitEnemy && EnemyForStrike != none) && LPPawn(HitActor) != none)
    {
        // End:0xB7
        if((HitActor == EnemyForStrike) && Outer.MedFlyerPawn != none)
        {
            Outer.MedFlyerPawn.StopPawnChoreography();
            bMeleeHitEnemy = true;
        }
    }
    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];

    // End:0x14C
    if(Outer.MedFlyerPawn != none)
    {
        Outer.MedFlyerPawn.StopPawnChoreography();
        Outer.Focus = none;
        Outer.SetFocalPoint(Outer.Pawn.Location + (Vector(Outer.Pawn.Rotation) * Outer.MedFlyerPawn.TuneDataMedFlyer.DistanceAwayToSetFocalPointAfterMeleeStrike), true);
    }
    //return;    
}

function On_LPSM_MedFlyerStaticStrike_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bSpecialMovePlaying = false;
    //return;    
}

function GetStaticStrikeSpecialMoveClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_MedFlyerBasicPhysicalStrike';
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
    Outer.MedFlyerPawn.DoSpecialMove(GetStaticStrikeSpecialMoveClass(), true, true, On_LPSM_MedFlyerStaticStrike_Finished, EnemyForStrike);
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

    Outer.Focus = none;
    StartStaticStrikeSpecialMove();
    J0x2A:

    // End:0x59 [Loop If]
    if(!IsStrikeAnimationDone())
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x2A;
    }
    Outer.PopCommand(self);
    stop;            
}
