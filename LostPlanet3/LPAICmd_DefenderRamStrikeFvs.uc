class LPAICmd_DefenderRamStrikeFvs extends LPAICmd_DefenderRamStrikeBase within LPAIControllerDefender;

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

event MeleeHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL Info[25296897];

    super.MeleeHitSomethingNew(Info);
    //return;    
}

event ImpactCombatTargetHitSomethingNew()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private name ImpactSocketName[8388609];
    local /*0x97E50000-0x00000000*/ private float ImpactRadius[8388609];
    local /*0x97E50000-0x00000000*/ private class DamageTypeToApplied[8388609];

    super.ImpactCombatTargetHitSomethingNew(HitActor, ImpactLocation, ImpactSocketName, ImpactRadius, DamageTypeToApplied);
    //return;    
}

event NotifyThatSpecialDodgeActorDodged()
{
    local /*0x97E50000-0x00000000*/ private @NULL Dodger[8388609];
    local /*0x97E50000-0x00000000*/ private class DodgePerforming[8388609];

    super.NotifyThatSpecialDodgeActorDodged(Dodger, DodgePerforming);
    //return;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
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

    return Class'LPSM_DefenderRamStrikeFvs';
    //return ReturnValue;    
}

function GetHeightShiftForTargetForRamStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.DefenderPawn.TuneDataDefender.HeightShiftForTargetForRamStrikeFvs.GetValue();
    //return ReturnValue;    
}

function GetMaxTimeForRamStrikeMissSM()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.DefenderPawn.TuneDataDefender.MaxTimeForRamStrikeMissAnimFvs;
    //return ReturnValue;    
}
