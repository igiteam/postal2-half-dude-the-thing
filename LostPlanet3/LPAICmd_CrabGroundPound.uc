class LPAICmd_CrabGroundPound extends LPAICmd_CrabBaseStrike within LPAIControllerBaseSnowCrab;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinTauntLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTauntLoopTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWaitingForSpecialMove[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TauntFinishTime[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ClosestEnemy[536870913];

function Pushed()
{
    super.Pushed();
    Outer.bIgnoreStunCommands = true;
    MinTauntLoopTime = 1.0000000;
    MaxTauntLoopTime = 2.5000000;
    Outer.SetWantsNewEnemy(true);
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.MeleeFinished();
    FinishTauntLoopSpecialMove();
    Outer.EnableMouthGlow(false);
    Outer.bIgnoreStunCommands = false;
    Outer.CrabPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.CrabPawn.TurnOffRoarAudioComponent();
    Outer.SetHavedPerformedTauntFlagsForCurrentClawStatus();
    Outer.ResetGroundPoundWaitTimer();
    Outer.Focus = none;
    Outer.CrabPawn.TurnOffRoarAudioComponent();
    //return;    
}

function SetMinTauntLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float TimeToLoop[8388609];

    MinTauntLoopTime = TimeToLoop;
    //return;    
}

function SetMaxTauntLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float TimeToLoop[8388609];

    MaxTauntLoopTime = TimeToLoop;
    //return;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x139
    if(Outer.CrabPawn != none)
    {
        // End:0x139
        if(Outer.CrabPawn.MyCoreData.Length >= HitCoreIndex)
        {
            // End:0x139
            if(Outer.CrabPawn.MyCoreData[HitCoreIndex].CoreID == 7)
            {
                // End:0xDF
                if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
                {
                    return HandleGrenadeInMouth();
                }
                Outer.StartAdditiveMouthBulletHitAnimation(2.5000000);
                Outer.CrabPawn.TurnOffRoarAudioComponent();
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function FinishTauntLoopSpecialMove()
{
    Outer.CrabPawn.EndSpecialMove(Class'LPSM_SnowCrabTauntLoop');
    Outer.CrabPawn.TurnOffRoarAudioComponent();
    //return;    
}

function GetTauntLoopTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], TimeToLoop;

    TimeToLoop = RandRange(MinTauntLoopTime, MaxTauntLoopTime);
    return TimeToLoop;
    //return ReturnValue;    
}

function GetGrenadeInMouthStunDuration()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.CrabPawn.TuneDataIceCrab.TauntAttackDurationOfStunAfterGettingGrenadeInMouth.GetValue();
    //return ReturnValue;    
}

event ImpactCombatTargetHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private name ImpactSocketName[8388609];
    local /*0x97E50000-0x00000000*/ private float ImpactRadius[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];

    super(LPAICommand).ImpactCombatTargetHitSomethingNew(HitActor, ImpactLocation, ImpactSocketName, ImpactRadius, DamageTypeToApplied);
    //return;    
}

function SpecialMoveDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    //return;    
}

function HandleGrenadeInMouth()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

function OnTauntLoopDone()
{
    //return;    
}

state GroundPoundGrenadeInMouth
{Begin:

    Outer.CrabPawn.SetCurrentlyNotValidTargetForGrenadeAssist();
    Outer.EnableMouthGlow(false);
    Outer.CrabPawn.TurnOffRoarAudioComponent();
    Outer.CmdCrabTakeGrenadeInMouth(GetGrenadeInMouthStunDuration(), Class'LPSM_SnowCrabTauntSwallow', Class'LPSM_SnowCrabTauntGrenadeInMouthToStun', Class'LPSM_SnowCrabGrenadeInMouthStun', 0);
    Outer.Sleep(0.0100000);
    Outer.PopCommand(self);
    stop;                    
}

state GroundPoundAttack
{
    function SpecialMoveDone()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        bWaitingForSpecialMove = false;
        //return;        
    }
Begin:

    Outer.Sleep(0.0100000);
    Outer.CrabPawn.TurnOffRoarAudioComponent();
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabGroundPound', true, true, SpecialMoveDone);
    bWaitingForSpecialMove = true;
    J0xAE:

    // End:0xDB [Loop If]
    if(bWaitingForSpecialMove)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xAE;
    }
    Outer.Sleep(0.0100000);
    Outer.PopCommand(self);
    stop;                
}

state GroundPoundAttackWithoutTaunt
{
    function SpecialMoveDone()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        bWaitingForSpecialMove = false;
        //return;        
    }
Begin:

    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntRaise', true, true, SpecialMoveDone);
    bWaitingForSpecialMove = true;
    J0x5D:

    // End:0x8A [Loop If]
    if(bWaitingForSpecialMove)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x5D;
    }
    Outer.Sleep(0.0100000);
    GotoState('GroundPoundAttack');
    stop;            
}

state GroundPoundTaunt
{
    function SpecialMoveDone()
    {
        local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

        bWaitingForSpecialMove = false;
        //return;        
    }

    function HandleGrenadeInMouth()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        FinishTauntLoopSpecialMove();
        GotoState('GroundPoundGrenadeInMouth');
        return true;
        //return ReturnValue;        
    }
Begin:

    Outer.Sleep(0.0100000);
    Outer.EnableMouthGlow(true);
    Outer.CrabPawn.SetCurrentlyValidTargetForGrenadeAssist();
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntRaise', true, true, SpecialMoveDone);
    bWaitingForSpecialMove = true;
    J0xCE:

    // End:0xFB [Loop If]
    if(bWaitingForSpecialMove)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0xCE;
    }
    Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntLoop', true, true);
    TauntFinishTime = Outer.WorldInfo.TimeSeconds + (GetTauntLoopTime());
    J0x185:

    // End:0x1E6 [Loop If]
    if(Outer.WorldInfo.TimeSeconds < TauntFinishTime)
    {
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x185;
    }
    FinishTauntLoopSpecialMove();
    Outer.Sleep(0.0100000);
    // End:0x3AC
    if(Outer.GetNumEnemiesWithinRangeAndAngle(Outer.CrabPawn.TuneDataIceCrab.MaxDistToEnemiesForGroundPound.GetValue() * 1.2000000, Outer.GroundPoundACosHorizAngRange, ClosestEnemy) < 1)
    {
        bWaitingForSpecialMove = true;
        Outer.CrabPawn.DoSpecialMove(Class'LPSM_SnowCrabTauntLower', true, true, SpecialMoveDone);
        Outer.SetWantsNewEnemy(false);
        J0x33F:

        // End:0x36C [Loop If]
        if(bWaitingForSpecialMove)
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x33F;
        }
        Outer.Sleep(0.0100000);
        Outer.PopCommand(self);        
    }
    else
    {
        GotoState('GroundPoundAttack');
    }
    stop;        
}

state StateCmdActive
{
    function ShouldTaunt()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
        local /*0x97E50000-0x00000000*/ private float chanceToTaunt, randChoice;

        chanceToTaunt = Outer.CrabPawn.TuneDataIceCrab.ChanceToTauntBeforeGroundPound.GetValue();
        // End:0x8A
        if(chanceToTaunt > 1.1000000)
        {
            chanceToTaunt /= float(100);
        }
        randChoice = RandRange(0.0000000, 1.0000000);
        // End:0xC1
        if(randChoice > chanceToTaunt)
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }

    function SetFocus()
    {
        // End:0xB9
        if(Outer.GetNumOtherEnemiesWithinRange(Outer.CrabPawn.TuneDataIceCrab.MaxDistToEnemiesForSwipeAttack.GetValue(), none, ClosestEnemy) > 0)
        {
            Outer.Focus = ClosestEnemy;            
        }
        else
        {
            Outer.Focus = Outer.MyLPEnemy;
        }
        //return;        
    }
Begin:

    Outer.Sleep(0.0100000);
    SetFocus();
    // End:0x45
    if(ShouldTaunt())
    {
        GotoState('GroundPoundTaunt');        
    }
    else
    {
        GotoState('GroundPoundAttackWithoutTaunt');
    }
    Outer.Focus = none;
    stop;                    
}

defaultproperties
{
    bInterruptible=false
}