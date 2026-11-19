class LPAICmd_DefenderRamStrikeVs extends LPAICmd_DefenderRamStrikeBase within LPAIControllerDefender;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAllowedToAttachToVS[536870913];

function Pushed()
{
    bAllowedToAttachToVS = Outer.AmAdHocSquadLeader();
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

    return Class'LPSM_DefenderRamStrikeVs';
    //return ReturnValue;    
}

function GetHeightShiftForTargetForRamStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.DefenderPawn.TuneDataDefender.HeightShiftForTargetForRamStrikeVs.GetValue();
    //return ReturnValue;    
}

function GetMaxTimeForRamStrikeMissSM()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.DefenderPawn.TuneDataDefender.MaxTimeForRamStrikeMissAnimVs;
    //return ReturnValue;    
}

function @NULL RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x26
    if(Other == EnemyForStrike)
    {
        // End:0x26
        if(TryToAttachToVS())
        {
            return true;
        }
    }
    return super.RanIntoActor(Other, OtherComp, HitLocation, HitNormal);
    //return ReturnValue;    
}

function TryToAttachToVS()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsWindowLoc;
    local /*0x97E50000-0x00000000*/ private float distanceToWindshield, maxDistanceToWindshieldForAutoLand;
    local /*0x97E50000-0x00000000*/ private @NULL vsRanInto;
    local /*0x97E50000-0x00000000*/ private int AttackSlotIdx;

    vsRanInto = LPVSPlayerPawn(EnemyForStrike);
    // End:0x286
    if((vsRanInto != none) && bAllowedToAttachToVS)
    {
        // End:0x286
        if(vsRanInto.Mesh.GetSocketWorldLocationAndRotation(Outer.DefenderPawn.TuneDataDefender.SocketOnVsToUseForDistanceForDeathCameraEffects, vsWindowLoc))
        {
            distanceToWindshield = VSize(vsWindowLoc - Outer.DefenderPawn.Location);
            maxDistanceToWindshieldForAutoLand = Outer.DefenderPawn.TuneDataDefender.MaxRangeFromVsWindshieldForAutoLandOnVsRunningInto.GetValue();
            // End:0x286
            if(distanceToWindshield < maxDistanceToWindshieldForAutoLand)
            {
                AttackSlotIdx = vsRanInto.AIResDefenderVS.GetFreeAttackSlot(Outer.DefenderPawn);
                // End:0x286
                if(AttackSlotIdx != -1)
                {
                    Outer.PopCommand(self);
                    Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx = AttackSlotIdx;
                    Outer.CmdAttachToVs(EnemyForStrike, 1);
                    return true;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}
