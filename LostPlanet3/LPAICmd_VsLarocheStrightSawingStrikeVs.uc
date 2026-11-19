class LPAICmd_VsLarocheStrightSawingStrikeVs extends LPAICmd_VsLarocheStrightSawingStrike within LPAIControllerVsLaroche;

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

function NotifyTraceDamagePartHitSomething()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private int AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[8388609];
    local /*0x97E50000-0x00000000*/ private float timeSinceStartOfCutEvent;

    // End:0x18C
    if((EnemyForStrike != none) && LPPawn(HitActor) != none)
    {
        // End:0x18C
        if((HitActor == EnemyForStrike) && Outer.VsLarochePawn != none)
        {
            timeSinceStartOfCutEvent = Outer.WorldInfo.TimeSeconds - TimeSawingCutIntoSomething;
            // End:0x18C
            if((TimeSawingCutIntoSomething < 0.0000000) || timeSinceStartOfCutEvent > Outer.VsLarochePawn.TuneDataVsLaroche.TimeDeltaBetweenNewSawCutEvents.GetValue())
            {
                ++Outer.NumOfMeleeHitsLandedOnEnemySinceLastStruggleMode;
                TimeSawingCutIntoSomething = Outer.WorldInfo.TimeSeconds;
            }
        }
    }
    //return;    
}

function StartMeleeStrikeSM()
{
    Outer.VsLarochePawn.DoSpecialMove(Class'LPSM_VsLarocheSawArmSawing', true, false, None);
    //return;    
}

function StopMeleeStrikeSM()
{
    Outer.VsLarochePawn.EndSpecialMove(Class'LPSM_VsLarocheSawArmSawing');
    //return;    
}

function GetMaxSawTimeAginstThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetOfSawing[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.VsLarochePawn.TuneDataVsLaroche.MaxStrightSawingTimePerStrikeVs.GetValue();
    //return ReturnValue;    
}

defaultproperties
{
    bInterruptible=false
}