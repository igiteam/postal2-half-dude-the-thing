class LPSM_NushiSporeVSSucking extends LPSM_NushiSporeVsBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponentLoop[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL HitInfoForVsDamage;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float accumulatedDamage[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    PlaySoundEvent('DefenderSuckingTEng');
    vsPawn = LPBaseVSPlayerPawn(DefenderPawn.Base);
    // End:0x72
    if(vsPawn == none)
    {
        return;
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    vsPawn = none;
    ClearSoundLoop();
    //return;    
}

function PlaySoundEvent()
{
    local /*0x97E50000-0x00000000*/ private name SoundEventName[8388609];

    // End:0x19
    if(SoundComponentLoop != none)
    {
        ClearSoundLoop();
    }
    SoundComponentLoop = MySPPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx(SoundEventName, 'None', MySPPawn, none, none, SoundComponentLoop);
    //return;    
}

function ClearSoundLoop()
{
    // End:0x43
    if(SoundComponentLoop != none)
    {
        SoundComponentLoop.FadeOut(0.5000000, 0.0000000);
        SoundComponentLoop = none;
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    SuckEnergyOutOfVS(DeltaTime);
    HandlePossibleDamageToTheVs(DeltaTime);
    super(SPSM_PlayAnimBase).Tick(DeltaTime);
    //return;    
}

function SuckEnergyOutOfVS()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], energySuckedThisFrame;

    // End:0xA9
    if((DefenderPawn != none) && vsPawn != none)
    {
        energySuckedThisFrame = DefenderPawn.TuneDataDefender.AmountOfTEnergyToSuckOffOfVsPerSec.GetValue() * DeltaTime;
        vsPawn.AddThermalEnergy(-energySuckedThisFrame);
    }
    //return;    
}

event HandlePossibleDamageToTheVs()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], damageToVsPawn;
    local /*0x97E50000-0x00000000*/ private @NULL StartTrace, EndTrace, TraceHitLocation, TraceHitNormal;

    // End:0x379
    if(((DefenderPawn != none) && vsPawn != none) && DefenderPawn.TuneDataDefender.bCauseDamageWhileSuckingOffVs.GetValue() != float(0))
    {
        // End:0x207
        if(HitInfoForVsDamage.BoneName == 'None')
        {
            StartTrace = DefenderPawn.Location + (Vector(DefenderPawn.Rotation) * DefenderPawn.TuneDataDefender.DistanceFromLocToSearchForHitLocWhileSuckingOffVs);
            EndTrace = DefenderPawn.Location - (Vector(DefenderPawn.Rotation) * DefenderPawn.TuneDataDefender.DistanceFromLocToSearchForHitLocWhileSuckingOffVs);
            vsPawn.TraceComponent(TraceHitLocation, TraceHitNormal, vsPawn.Mesh, EndTrace, StartTrace,, HitInfoForVsDamage, true);
        }
        // End:0x379
        if(HitInfoForVsDamage.BoneName != 'None')
        {
            damageToVsPawn = DefenderPawn.TuneDataDefender.DamageToVsPerSecWhileSuckingOffVs.GetValue() * DeltaTime;
            accumulatedDamage += damageToVsPawn;
            // End:0x379
            if(accumulatedDamage >= 1.0000000)
            {
                vsPawn.TakeDamage(int(accumulatedDamage), DefenderPawn.Controller, TraceHitLocation, DefenderPawn.Velocity, DefenderPawn.TuneDataDefender.DamageTypeToVsWhileSuckingOffVs, HitInfoForVsDamage, DefenderPawn);
                accumulatedDamage = 0.0000000;
            }
        }
    }
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}