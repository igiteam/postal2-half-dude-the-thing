class LPAIControllerHumanSoldier extends LPAIControllerHuman
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HumanSoldierPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CoverExplorer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampMelee;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PotentialCoverGoal[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanThrowGrenades;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCanChatter;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bFlankingGuy;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartBurstInaccuracyPctg;

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    HumanSoldierPawn = LPAIPawnHumanSoldier(inPawn);
    CoverExplorer = Class'LPSurroundCoverExplorerHumanSoldier'.static.CreateNewInstance(self);
    //return;    
}

function PawnDied()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super(SPGFCoverAIController).PawnDied(inPawn);
    // End:0x6B
    if(CoverExplorer != none)
    {
        CoverExplorer.Cleanup();
        CoverExplorer.Destroy();
        CoverExplorer = none;
    }
    //return;    
}

function SetDefaultTeam()
{
    SetTeam(0);
    //return;    
}

function SetAttackResourceNames()
{
    MeleeResourceName = 'None';
    StrikeResourceName = 'HumanSoldierStrike';
    StruggleResourceName = 'None';
    FeintResourceName = 'None';
    RangedResourceName = 'HumanSoldierFormation';
    FireResourceName = 'HumanSoldierFire';
    //return;    
}

function NotifyYouKilledPlayer()
{
    MyLPSquad.PlayJimKilledSound(self);
    //return;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPAIController).NotifyPlayerMeleeHit(PlayerPawn, ImpactLocation);
    //return ReturnValue;    
}

function OnAISetDefendZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x6C
    if(inAction.InputLinks[2].bHasImpulse)
    {
        CoverExplorer.CoverTraversal.ClearDefendZones();
    }
    // End:0x134
    if(inAction.InputLinks[0].bHasImpulse)
    {
        CoverExplorer.CoverTraversal.AddDefendZones(inAction.DefendZones, inAction.DefendCovers, inAction.DefendNodes);        
    }
    else
    {
        // End:0x1F9
        if(inAction.InputLinks[0].bHasImpulse)
        {
            CoverExplorer.CoverTraversal.RemoveDefendZones(inAction.DefendZones, inAction.DefendCovers, inAction.DefendNodes);
        }
    }
    CoverExplorer.CoverTraversal.bStayAlwaysInCover = inAction.StayAlwaysInCover;
    //return;    
}

function OnAILatentStopped()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], KismetCmd;

    KismetCmd = LPAICmd_HSKismet(CommandList);
    // End:0x6E
    if((KismetCmd != none) && KismetCmd.GetKismetAction() == inAction)
    {
        AbortCommand(KismetCmd);
    }
    //return;    
}

function OnAIHuman()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], CmdKismet;

    // End:0x7A
    if(inAction.InputLinks[7].bHasImpulse)
    {
        // End:0x64
        if(LPAICmd_HSKismet(CommandList) != none)
        {
            AbortCommand(CommandList);
        }
        ClearThisLatentAction(inAction);
        return;
    }
    // End:0xB4
    if(inAction.InputLinks[5].bHasImpulse)
    {
        return;
    }
    // End:0xCE
    if(!IsAIDisabled())
    {
        ForceDisableAI();
    }
    CmdKismet = LPAICmd_HSKismet(CommandList);
    // End:0x124
    if(CmdKismet != none)
    {
        CmdKismet.SetKismetAction(inAction);        
    }
    else
    {
        CmdHSKismet(inAction);
    }
    //return;    
}

function OnAIHumanTuning()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bScriptedCanUseCover = true;        
    }
    else
    {
        // End:0x89
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bScriptedCanUseCover = false;
        }
    }
    // End:0xD0
    if(inAction.InputLinks[4].bHasImpulse)
    {
        bCanThrowGrenades = true;        
    }
    else
    {
        // End:0x114
        if(inAction.InputLinks[5].bHasImpulse)
        {
            bCanThrowGrenades = false;
        }
    }
    // End:0x15B
    if(inAction.InputLinks[6].bHasImpulse)
    {
        bCanChatter = true;        
    }
    else
    {
        // End:0x19F
        if(inAction.InputLinks[7].bHasImpulse)
        {
            bCanChatter = false;
        }
    }
    // End:0x1E6
    if(inAction.InputLinks[8].bHasImpulse)
    {
        bFlankingGuy = true;        
    }
    else
    {
        // End:0x22A
        if(inAction.InputLinks[9].bHasImpulse)
        {
            bFlankingGuy = false;
        }
    }
    //return;    
}

function HasDefendZones()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CoverExplorer.CoverTraversal.HasDefendZones();
    //return ReturnValue;    
}

function IsInDefendZone()
{
    local /*0x97E50000-0x00000000*/ private @NULL InLocation[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return CoverExplorer.CoverTraversal.IsInDefendZone(InLocation);
    //return ReturnValue;    
}

function WeaponAIAimDelay()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x8F
    if((FireTarget != none) && VSize(FireTarget.Location - myAIPawn.Location) < HumanSoldierPawn.TuneDataHumanSoldier.DistanceTooCloseToMainEnemy)
    {
        return 0.2500000;
    }
    return super(SPGFCoverAIController).WeaponAIAimDelay();
    //return ReturnValue;    
}

function HasReachedMaxSuppresionFireTime()
{
    local /*0x97E50000-0x00000000*/ private @NULL TargetPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerTargetPawn;

    PlayerTargetPawn = LPPlayerPawn(TargetPawn);
    // End:0xC4
    if((PlayerTargetPawn != none) && (WorldInfo.TimeSeconds - PlayerTargetPawn.AIResourceManager.GetLastHadUserTime(FireResourceName)) > HumanSoldierPawn.TuneDataHumanSoldier.MinTimeSomeoneShootThePlayer)
    {
        return false;
    }
    return super(SPGFCoverAIController).HasReachedMaxSuppresionFireTime(TargetPawn);
    //return ReturnValue;    
}

function CheckFireFacingThreshold()
{
    local /*0x97E50000-0x00000000*/ private @NULL InTarget[8388609];
    local /*0x97E50000-0x00000000*/ private float FacingThresholdAdjust[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    0.0000000
    // End:0x4B
    if(LPAimControlHumanSoldier(HumanSoldierPawn.AimController).bSmoothingAim)
    {
        return false;
    }
    return super(SPGFCoverAIController).CheckFireFacingThreshold(InTarget, FacingThresholdAdjust);
    //return ReturnValue;    
}

protected function _GetAccuracyRotationModifier()
{
    local /*0x97E50000-0x00000000*/ private @NULL Wpn[8388609];
    local /*0x97E50000-0x00000000*/ private float InaccuracyPct[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL StartFireLoc[8388609], AimLoc, ReturnValue;

    return super(SPGFCoverAIController)._GetAccuracyRotationModifier(Wpn, InaccuracyPct, StartFireLoc, AimLoc);
    //return ReturnValue;    
}

protected function _GetBestAimLocationForVisibleTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLoc[8388609], TargetPawn, ReturnValue, TargetPos;

    // End:0x43
    if(TargetPawn.Mesh == none)
    {
        return TargetPawn.Location;
    }
    // End:0x84
    if(TargetPawn.IsRolling())
    {
        return TargetPawn.Location;
    }
    // End:0x1F1
    if(TargetPawn.Mesh.GetSocketByName('Chest') != none)
    {
        // End:0x1F1
        if(TargetPawn.Mesh.GetSocketWorldLocationAndRotation('Chest', TargetPos))
        {
            // End:0x195
            if(!TargetPawn.IsInCover())
            {
                // End:0x172
                if(Pawn.FastTrace(TargetPos, StartLoc,, true))
                {
                    return TargetPos;                    
                }
                else
                {
                    return TargetPawn.GetPawnViewLocation();
                }                
            }
            else
            {
                // End:0x1F1
                if(Pawn.FastTrace(TargetPos - (Normal(TargetPos - StartLoc) * DistanceCheckCloseLOF), StartLoc,, true))
                {
                    return TargetPos;
                }
            }
        }
    }
    // End:0x32A
    if(TargetPawn.IsInCover())
    {
        // End:0x2B0
        if(HumanSoldierPawn.IsInCover())
        {
            return SPCoverLink(TargetPawn.CurrentLink).GetClosestSlotViewPoint(TargetPawn.CurrentSlotIdx, FireTargetCoverAction.DestAction);            
        }
        else
        {
            return SPCoverLink(TargetPawn.CurrentLink).GetClosestSlotViewPoint(TargetPawn.CurrentSlotIdx, TargetPawn.CoverAction);
        }
    }
    return TargetPawn.Location;
    //return ReturnValue;    
}

function GetCoverExplorer()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return CoverExplorer;
    //return ReturnValue;    
}

function IsCoverSafe()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cover[8388609];
    local /*0x97E50000-0x00000000*/ private byte outInvalidReason[26214401], outWorstRatingFactor;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int CoverIdx;

    CoverIdx = CoverExplorer.GetCoverIdx(Cover);
    // End:0x55
    if(CoverIdx == -1)
    {
        outInvalidReason = 9;
        return false;
    }
    // End:0x9A
    if(CoverExplorer.Covers[CoverIdx].Rating > float(0))
    {
        return true;
    }
    outInvalidReason = CoverExplorer.Covers[CoverIdx].InvalidReason;
    // End:0x109
    if((int(outInvalidReason) <= int(0)) || int(outInvalidReason) >= int(12))
    {
    }
    // End:0x14F
    if(int(outInvalidReason) == int(8))
    {
        outWorstRatingFactor = CoverExplorer.GetMinRatingFactor(CoverIdx);
    }
    return false;
    //return ReturnValue;    
}

function CanExitCoverFromCoverAction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GetCoverExitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL NextDestination[9437185];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL MyCoverDir, DirToMainEnemy, DirToNextDestination;
    local /*0x97E50000-0x00000000*/ private float DistanceToMainEnemy, DegreesEnemyToCover, DegreesEnemyToMe, DegreesDestinationToCover, DegreesDestinationToMe;

    local /*0x97E50000-0x00000000*/ private bool bHasEnemy, bHasDestination;

    vect(0.0000000, 0.0000000, 0.0000000)
    bHasDestination = NextDestination != vect(0.0000000, 0.0000000, 0.0000000);
    // End:0x1DA
    if(bHasDestination)
    {
        MyCoverDir = ((MyCoverPawn.bIsMirrored) ? -MyCoverPawn.AcquiredCoverInfo.PosInfo.Tangent : MyCoverPawn.AcquiredCoverInfo.PosInfo.Tangent);
        DirToNextDestination = NextDestination - MyCoverPawn.Location;
        DirToNextDestination = Normal(DirToNextDestination);
        DegreesDestinationToCover = Acos(DirToNextDestination Dot MyCoverPawn.AcquiredCoverInfo.PosInfo.Normal) * 57.2957800;
        DegreesDestinationToMe = Acos(DirToNextDestination Dot MyCoverDir) * 57.2957800;
    }
    // End:0x2E0
    if(((bHasDestination && Abs(DegreesDestinationToCover) > 145.0000000) && MyCoverPawn.CurrentLink.Slots[MyCoverPawn.CurrentSlotIdx].bCanMantle) && !MyCoverPawn.CurrentLink.Slots[MyCoverPawn.CurrentSlotIdx].bDontAllowMantleAI)
    {
        return Class'SPGameFramework.SPGFSM_MantleOver';
    }
    bHasEnemy = MainEnemy != none;
    // End:0x4C7
    if(bHasEnemy)
    {
        MyCoverDir = ((MyCoverPawn.bIsMirrored) ? -MyCoverPawn.AcquiredCoverInfo.PosInfo.Tangent : MyCoverPawn.AcquiredCoverInfo.PosInfo.Tangent);
        DirToMainEnemy = MainEnemy.Location - MyCoverPawn.Location;
        DistanceToMainEnemy = VSize(DirToMainEnemy);
        DirToMainEnemy = Normal(DirToMainEnemy);
        DegreesEnemyToCover = Acos(DirToMainEnemy Dot MyCoverPawn.AcquiredCoverInfo.PosInfo.Normal) * 57.2957800;
        DegreesEnemyToMe = Acos(DirToMainEnemy Dot MyCoverDir) * 57.2957800;
    }
    // End:0x4F3
    if(bHasEnemy && DegreesEnemyToMe < 45.0000000)
    {
        return Class'SPGameFramework.SPGFSM_SideStepOutOfCover';
    }
    // End:0x51F
    if(bHasDestination && DegreesDestinationToMe < 45.0000000)
    {
        return Class'SPGameFramework.SPGFSM_SideStepOutOfCover';
    }
    // End:0x58E
    if(bHasEnemy)
    {
        // End:0x58E
        if((DistanceToMainEnemy < HumanSoldierPawn.TuneDataHumanSoldier.DistanceTooCloseToMainEnemy) && Abs(DegreesEnemyToCover) > 145.0000000)
        {
            return Class'SPGameFramework.SPGFSM_PushOutOfCover';
        }
    }
    return Class'SPGameFramework.SPGFSM_PullOutOfCover';
    //return ReturnValue;    
}

function AIWantsToAttackFromCover()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private byte InvalidReason, WorstRatingFactor;
    local /*0x97E50000-0x00000000*/ private @NULL CoverEnemy;

    // End:0x11
    if(!AICanUseCover())
    {
        return false;
    }
    CoverEnemy = SPGFCoverPawn(MainEnemy);
    // End:0xDC
    if((CoverEnemy != none) && !CoverEnemy.IsInCover())
    {
        // End:0xDC
        if(VSize(MainEnemy.Location - myAIPawn.Location) < HumanSoldierPawn.TuneDataHumanSoldier.DistanceTooCloseToMainEnemy)
        {
            return false;
        }
    }
    // End:0x282
    if(!CoverExplorer.GetBestCover(PotentialCoverGoal))
    {
        // End:0x214
        if(((CoverIsIn()) && CoverGoal.Link != none) && !IsCoverSafe(CoverGoal, InvalidReason, WorstRatingFactor))
        {
            // End:0x214
            if(((int(InvalidReason) == int(7)) || int(WorstRatingFactor) == int(4)) || int(WorstRatingFactor) == int(5))
            {
                CoverExplorer.CoverTraversal.ClearRatingOverTime(4);
                CoverExplorer.CoverTraversal.ClearRatingOverTime(5);
                return true;
            }
        }
        CoverExplorer.CoverTraversal.ClearRatingOverTime(4);
        CoverExplorer.CoverTraversal.ClearRatingOverTime(5);
        return false;
    }
    return true;
    //return ReturnValue;    
}

function WeaponStartFiring()
{
    local /*0x97E50000-0x00000000*/ private int InBurstsToFire[9437185];

    -1
    // End:0x23
    if(!bAimDownSight)
    {
        AIAimDownSight(true);
    }
    super(SPGFCoverAIController).WeaponStartFiring(InBurstsToFire);
    //return;    
}

function AIWantsToStartAimDownSight()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialFireTarget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float DistanceToTarget;

    // End:0x11
    if(PotentialFireTarget == none)
    {
        return false;
    }
    // End:0x53
    if(HumanSoldierPawn.IsGrenadeClose(HumanSoldierPawn.Location))
    {
        return false;
    }
    // End:0xB6
    if((WorldInfo.TimeSeconds - TimeStampMelee) < HumanSoldierPawn.TuneDataHumanSoldier.MinTimeDontShootAfterMelee)
    {
        return false;
    }
    DistanceToTarget = VSize(PotentialFireTarget.Location - HumanSoldierPawn.Location);
    // End:0x143
    if(DistanceToTarget < HumanSoldierPawn.TuneDataHumanSoldier.ADSDistanceDontShootTarget)
    {
        return false;
    }
    // End:0x167
    if(CoverGoal.Link == none)
    {
        return true;
    }
    // End:0x1AA
    if(DistanceToTarget < HumanSoldierPawn.TuneDataHumanSoldier.ADSDistanceToTargetMin)
    {
        return true;
    }
    // End:0x23C
    if((HumanSoldierPawn.TimeSinceCover() < HumanSoldierPawn.TuneDataHumanSoldier.ADSTimeSinceCover) && !MyLPSquad.IsSomeoneShootingAtMyTarget(self, LPPawn(PotentialFireTarget)))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AIWantsToStopAimDownSight()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialFireTarget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float DistanceToTarget;

    // End:0x42
    if(HumanSoldierPawn.IsGrenadeClose(HumanSoldierPawn.Location))
    {
        return true;
    }
    // End:0x66
    if(CoverGoal.Link == none)
    {
        return false;
    }
    DistanceToTarget = VSize(PotentialFireTarget.Location - HumanSoldierPawn.Location);
    // End:0xF3
    if(DistanceToTarget < HumanSoldierPawn.TuneDataHumanSoldier.ADSDistanceToTargetMax)
    {
        return false;
    }
    // End:0x176
    if((HumanSoldierPawn.TuneDataHumanSoldier.ADSMaxTimeWhileMoving > 0.0000000) && (AITimeSinceStartedADS()) > HumanSoldierPawn.TuneDataHumanSoldier.ADSMaxTimeWhileMoving)
    {
        return true;
    }
    // End:0x207
    if((HumanSoldierPawn.TuneDataHumanSoldier.ADSDamageReactStopAiming > 0.0000000) && DamageReceivedMoving > HumanSoldierPawn.TuneDataHumanSoldier.ADSDamageReactStopAiming)
    {
        DamageReceivedMoving = 0.0000000;
        return true;
    }
    return false;
    //return ReturnValue;    
}

function AIWantsToFireWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialFireTarget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PawnFireTarget;
    local /*0x97E50000-0x00000000*/ private float DistanceToTarget, TimeSinceLastTimeFiring;

    // End:0x11
    if(!bAimDownSight)
    {
        return false;
    }
    TimeSinceLastTimeFiring = WorldInfo.TimeSeconds - TimeStampLastTimeFiring;
    // End:0x67
    if(TimeSinceLastTimeFiring < WeaponFiringCooldownTime(PotentialFireTarget))
    {
        return false;
    }
    // End:0x140
    if(HumanSoldierPawn.MyWeapon.MyGFTuneDataWeapon.bCloseRangeWeapon)
    {
        DistanceToTarget = VSize(PotentialFireTarget.Location - HumanSoldierPawn.Location);
        // End:0x140
        if(DistanceToTarget > HumanSoldierPawn.TuneDataHumanSoldier.ADSDistanceToTargetMax)
        {
            return false;
        }
    }
    PawnFireTarget = LPPawn(PotentialFireTarget);
    // End:0x226
    if(PawnFireTarget != none)
    {
        // End:0x226
        if(IsThereFireAccess(PawnFireTarget))
        {
            DistanceToTarget = VSize(PotentialFireTarget.Location - HumanSoldierPawn.Location);
            // End:0x226
            if(DistanceToTarget > HumanSoldierPawn.TuneDataHumanSoldier.ADSDistanceToTargetMax)
            {
                // End:0x226
                if(!CanHaveFireAccess(PawnFireTarget))
                {
                    return false;
                }
            }
        }
    }
    // End:0x263
    if(!AIHaveLineOfFire(PotentialFireTarget, Pawn.GetWeaponStartTraceLocation()))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function AIWantsToFaceFiringTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    none
    // End:0x31
    if(VSize(MyCoverPawn.Velocity) < 10.0000000)
    {
        return true;
    }
    // End:0x40
    if(bAimDownSight)
    {
        return true;
    }
    return super(SPGFCoverAIController).AIWantsToFaceFiringTarget(inActor);
    //return ReturnValue;    
}

function PullOutGrenade()
{
    HumanSoldierPawn.DoSpecialMove(Class'LPSM_GrenadePrime', true);
    //return;    
}

function ThrowGrenade()
{
    // End:0x91
    if((HumanSoldierPawn.GetGrenade() != none) && HumanSoldierPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_GrenadePrime'))
    {
        HumanSoldierPawn.BroadcastSMMessage(Class'LPSMMTypes'.default.SMM_GrenadeReleased, self);
    }
    //return;    
}

function HSGrenadeReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL AICmdFlee;
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFromActors;
    local /*0x97E50000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x7B [Loop If]
    if(I < HumanSoldierPawn.GrenadesClose.Length)
    {
        FleeFromActors.AddItem(HumanSoldierPawn.GrenadesClose[I]);        
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    FleeFromActors.AddItem(MainEnemy);    
    AICmdFlee = CmdFlee(5.0000000,, HumanSoldierPawn.TuneDataHumanSoldier.DistanceToGrenadeDangerous, FleeFromActors, 0, true);
    AICmdFlee.SetInterruptible(false);
    //return;    
}

function CmdRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HSRangedAttack'.static.InitCommand(self);
    myCommand = LPAICmd_HSRangedAttack(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStaticRangedAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HSStaticRangedAttack'.static.InitCommand(self);
    myCommand = LPAICmd_HSStaticRangedAttack(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStaticAttackFromOpen()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HSStaticAttackFromOpen'.static.InitCommand(self);
    myCommand = LPAICmd_HSStaticAttackFromOpen(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemyActor(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdAttackFromOpen()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HSAttackFromOpen'.static.InitCommand(self);
    myCommand = LPAICmd_HSAttackFromOpen(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdAttackFromDefendNode()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HSAttackFromDefendNode'.static.InitCommand(self);
    myCommand = LPAICmd_HSAttackFromDefendNode(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStaticAttackFromCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool bNoShooting[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    false
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HSStaticAttackFromCover'.static.InitCommand(self);
    myCommand = LPAICmd_HSStaticAttackFromCover(GetActiveCommand());
    // End:0x105
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemyActor(Enemy2Attack);
        myCommand.SetNoShooting(bNoShooting);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdAttackFromCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HSAttackFromCover'.static.InitCommand(self);
    myCommand = LPAICmd_HSAttackFromCover(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdFireFromCover()
{
    local /*0x97E50000-0x00000000*/ private int InBursts[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    CmdStatus_Attack
    1
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    // End:0x10D
    if(InBursts <= 0)
    {
        InBursts = int(RandRange(myAIPawn.TuneDataAIPawn.MinBurstsToFireFromCover.GetValue(), myAIPawn.TuneDataAIPawn.MaxBurstsToFireFromCover.GetValue()));
        InBursts = Max(1, InBursts);
    }
    Class'LPAICmd_HSFireFromCover'.static.InitCommand(self);
    myCommand = LPAICmd_HSFireFromCover(GetActiveCommand());
    // End:0x1A9
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.BurstsToFire = InBursts;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdCoverAIMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HSMelee'.static.InitCommand(self);
    myCommand = LPAICmd_HSMelee(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStaticCoverAIMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Attack[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HSStaticMelee'.static.InitCommand(self);
    myCommand = LPAICmd_HSStaticMelee(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemyActor(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdPeekFromCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private float PeekTime[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Attack
    1
    6.0000000
    // End:0x44
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HSPeekFromCover'.static.InitCommand(self);
    myCommand = LPAICmd_HSPeekFromCover(GetActiveCommand());
    // End:0xE0
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetPeekTime(PeekTime);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdFireFromOpen()
{
    local /*0x97E50000-0x00000000*/ private int InBursts[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    CmdStatus_Attack
    1
    // End:0x40
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    // End:0x10D
    if(InBursts <= 0)
    {
        InBursts = int(RandRange(myAIPawn.TuneDataAIPawn.MinBurstsToFire.GetValue(), myAIPawn.TuneDataAIPawn.MaxBurstsToFire.GetValue()));
        InBursts = Max(1, InBursts);
    }
    Class'LPAICmd_HSFireFromOpen'.static.InitCommand(self);
    myCommand = LPAICmd_FireFromOpen(GetActiveCommand());
    // End:0x1A9
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.BurstsToFire = InBursts;
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdHSKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetAction[8388609];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    0
    // End:0x2E
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_HSKismet'.static.InitCommand(self);
    myCommand = LPAICmd_HSKismet(GetActiveCommand());
    // End:0xA2
    if(myCommand != none)
    {
        myCommand.SetKismetAction(InKismetAction);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdMoveToCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL InCoverInfo[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185];
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    CmdStatus_MoveToPosition
    1
    false
    0
    0.0000000
    // End:0xAA
    if(int(inLookAtStartMoving) == int(0))
    {
        // End:0x6C
        if(HumanSoldierPawn.IsInCover())
        {
            inLookAtStartMoving = 3;            
        }
        else
        {
            // End:0x9E
            if(bAimDownSight || (AITimeSinceFinishedADS()) < 0.5000000)
            {
                inLookAtStartMoving = 4;                
            }
            else
            {
                inLookAtStartMoving = 3;
            }
        }
    }
    return super(LPAIController).CmdMoveToCover(InCoverInfo, CmdStatus, CmdOption, bAllowFiring, inLookAtStartMoving, InMaxSpeedScale);
    //return ReturnValue;    
}

function CmdMoveToPosition()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], LookAt;
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185], b2dDistanceChecks;
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    none
    -1.0000000
    CmdStatus_MoveToPosition
    0
    0
    false
    true
    0
    0.0000000
    // End:0x60
    if(int(inLookAtStartMoving) == int(0))
    {
        inLookAtStartMoving = 2;
    }
    return super(LPAIController).CmdMoveToPosition(Target, LookAt, reachDist, CmdStatus, CmdOption, StopType, bAllowFiring, b2dDistanceChecks, inLookAtStartMoving, InMaxSpeedScale);
    //return ReturnValue;    
}

function CmdMoveToActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Target[8388609], LookAt;
    local /*0x97E50000-0x00000000*/ private float reachDist[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185], b2dDistanceChecks;
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    -1.0000000
    CmdStatus_MoveToActor
    0
    0
    false
    true
    0
    0.0000000
    // End:0x5B
    if(int(inLookAtStartMoving) == int(0))
    {
        inLookAtStartMoving = 3;
    }
    return super(LPAIController).CmdMoveToActor(Target, LookAt, reachDist, CmdStatus, CmdOption, StopType, bAllowFiring, b2dDistanceChecks, inLookAtStartMoving, InMaxSpeedScale);
    //return ReturnValue;    
}

function CmdMoveToActorKismet()
{
    local /*0x97E50000-0x00000000*/ private @NULL InKismetAction[8388609], Target, LookAt;
    local /*0x97E50000-0x00000000*/ private bool bInterruptible[8388609], WalkToDestination, FaceTargetActorRotationOnArrival;
    local /*0x97E50000-0x00000000*/ private @NULL CmdStatus[9437185];
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185], StopType;
    local /*0x97E50000-0x00000000*/ private bool bAllowFiring[9437185];
    local /*0x97E50000-0x00000000*/ private byte inLookAtStartMoving[9437185];
    local /*0x97E50000-0x00000000*/ private float InMaxSpeedScale[9437185], ReachDistance, InDistanceStartLooking;
    local /*0x97E50000-0x00000000*/ private bool bEnablePlayerSeparation[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    CmdStatus_MoveToActor
    0
    0
    false
    0
    0.0000000
    0.0000000
    0.0000000
    false
    // End:0x66
    if(int(inLookAtStartMoving) == int(0))
    {
        inLookAtStartMoving = 3;
    }
    return super(LPAIController).CmdMoveToActorKismet(InKismetAction, Target, LookAt, bInterruptible, WalkToDestination, FaceTargetActorRotationOnArrival, CmdStatus, CmdOption, StopType, bAllowFiring, inLookAtStartMoving, InMaxSpeedScale, ReachDistance, InDistanceStartLooking, bEnablePlayerSeparation);
    //return ReturnValue;    
}

defaultproperties
{
    bCanThrowGrenades=true
    bCanChatter=true
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerHumanSoldier.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerHumanSoldier.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerHumanSoldier.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerHumanSoldier.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerHumanSoldier.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    bConsumeAmmoWhileMoving=false
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerHumanSoldier.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    lookWhenStartMoving=ELookAtStartMoving.LAS_LookEnemyWhenADSFiring
    // Reference: SPAIReactionManager'Default__LPAIControllerHumanSoldier.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    bAllowDamageWhenDisableAI=true
    bUseSquad=true
    // Reference: LPAIObjectiveManager'Default__LPAIControllerHumanSoldier.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    AILogFilter=/* Array type was not detected. */
    Components[0]=LPAIObjectiveManager0
}