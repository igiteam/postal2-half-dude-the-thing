class LPAIControllerStalker extends LPAIControllerAkridMedium
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StalkerPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CoverExplorer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAimingIsLocked;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableReactiveAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bScriptedCanDoStruggleStrikes;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForcedStruggleMode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForcedBullStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForcedPush[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForcedPushBounce[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForcedPunch[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bMultiplayerMode[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AimingLockedLocation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampReactiveAttack;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampTaunt;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartBurstInaccuracyPctg;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OverwrittenMinCoverSize;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PotentialCoverGoal[536870913];

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    StalkerPawn = LPAIPawnStalker(inPawn);
    // End:0x73
    if(bMultiplayerMode)
    {
        CoverExplorer = Class'LPSurroundCoverExplorerStalker_MP'.static.CreateNewInstance(self);        
    }
    else
    {
        CoverExplorer = Class'LPSurroundCoverExplorerStalker'.static.CreateNewInstance(self);
    }
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

function SetAttackResourceNames()
{
    MeleeResourceName = 'None';
    StrikeResourceName = 'StalkerStrike';
    StruggleResourceName = 'None';
    FeintResourceName = 'None';
    RangedResourceName = 'HumanSoldierFormation';
    FireResourceName = 'StalkerFire';
    //return;    
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

    KismetCmd = LPAICmd_StalkerKismet(CommandList);
    // End:0x6E
    if((KismetCmd != none) && KismetCmd.GetKismetAction() == inAction)
    {
        AbortCommand(KismetCmd);
    }
    //return;    
}

function OnAIStalker()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609], CmdKismet;

    // End:0x7A
    if(inAction.InputLinks[7].bHasImpulse)
    {
        // End:0x64
        if(LPAICmd_StalkerKismet(CommandList) != none)
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
    CmdKismet = LPAICmd_StalkerKismet(CommandList);
    // End:0x124
    if(CmdKismet != none)
    {
        CmdKismet.SetKismetAction(inAction);        
    }
    else
    {
        CmdStalkerKismet(inAction);
    }
    //return;    
}

function OnAIStalkerTuning()
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
    if(inAction.InputLinks[2].bHasImpulse)
    {
        bScriptedCanDoMelee = true;        
    }
    else
    {
        // End:0x114
        if(inAction.InputLinks[3].bHasImpulse)
        {
            bScriptedCanDoMelee = false;
        }
    }
    // End:0x15B
    if(inAction.InputLinks[4].bHasImpulse)
    {
        bScriptedCanDoStruggleStrikes = true;        
    }
    else
    {
        // End:0x19F
        if(inAction.InputLinks[5].bHasImpulse)
        {
            bScriptedCanDoStruggleStrikes = false;
        }
    }
    // End:0x1FF
    if(inAction.InputLinks[6].bHasImpulse)
    {
        OverwrittenMinCoverSize = inAction.MinCoverSize;
    }
    //return;    
}

function NotifyPlayerStartMelee()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerToStalker;
    local /*0x97E50000-0x00000000*/ private float Distance, dotProduct, MinDotProduct;

    // End:0x3B
    if(!StalkerPawn.TuneDataStalker.EnableReactiveStrikeToPlayerMelee)
    {
        return true;
    }
    PlayerToStalker = StalkerPawn.Location - PlayerPawn.Location;
    Distance = VSize(PlayerToStalker);
    // End:0xDB
    if(Distance > StalkerPawn.TuneDataStalker.ReactiveStrikeToPlayerMeleeDistance)
    {
        return true;
    }
    dotProduct = Normal(PlayerToStalker) Dot Vector(PlayerPawn.Rotation);
    MinDotProduct = Cos(StalkerPawn.TuneDataStalker.ReactiveStrikeToPlayerMeleeAngle * 0.0174533);
    // End:0x171
    if(dotProduct < MinDotProduct)
    {
        return true;
    }
    // End:0x1B1
    if(CommandList != none)
    {
        LPAICommand(CommandList).NotifyPlayerStartMelee(PlayerPawn);
    }
    return false;
    //return ReturnValue;    
}

function NotifyPlayerMeleeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerPawn[8388609], ImpactLocation;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x39
    if(StalkerPawn.TuneDataStalker.EnableReactiveStrikeToPlayerMelee)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
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

function EnemySeperation2D()
{
    local /*0x97E50000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], combinedRadius;

    combinedRadius = myAIPawn.CylinderComponent.CollisionRadius + inActor.CylinderComponent.CollisionRadius;
    return VSize2D(myAIPawn.Location - inActor.Location) - combinedRadius;
    //return ReturnValue;    
}

function AICanDoStruggleStrike()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bScriptedCanDoStruggleStrikes)
    {
        return false;
    }
    // End:0x4C
    if(!StalkerPawn.TuneDataStalker.bCanDoBullStrikes)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function AIWantsToMeleeWhenEnemyTooClose()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(!AICanMelee(InEnemy))
    {
        return false;
    }
    // End:0x3D
    if(!HasStrikeTimerExpired(InEnemy, 'StalkerMinTimeNoAttack'))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function AIWantsToMeleeWhenNoCover()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(!AICanMelee(InEnemy))
    {
        return false;
    }
    // End:0x3D
    if(!HasStrikeTimerExpired(InEnemy, 'StalkerMinTimeNoAttack'))
    {
        return false;
    }
    CoverExplorer.CoverTraversal.ClearRatingOverTime(5);
    CoverExplorer.CoverTraversal.ClearRatingOverTime(4);
    return true;
    //return ReturnValue;    
}

event CoverIsExposedToAnEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL TestCover[8388609], TestEnemy;
    local /*0x97E50000-0x00000000*/ private float out_ExposedScale[26214401];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x3B
    if((bMultiplayerMode && TestEnemy != Enemy) && TestEnemy != none)
    {
        return false;
    }
    return super(SPGFCoverAIController).CoverIsExposedToAnEnemy(TestCover, TestEnemy, out_ExposedScale);
    //return ReturnValue;    
}

function AIWantsToAttackFromCover()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!AICanUseCover())
    {
        return false;
    }
    // End:0x40
    if(!CoverExplorer.GetBestCover(PotentialCoverGoal))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function AIWantsReactiveAttack()
{
    local /*0x97E50000-0x00000000*/ private @NULL EnemyForAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(!bEnableReactiveAttack)
    {
        return false;
    }
    // End:0x35
    if(EnemyForAttack.InStruggleMode)
    {
        return false;
    }
    // End:0x82
    if((EnemySeperation2D(EnemyForAttack)) > StalkerPawn.TuneDataStalker.DistanceReactiveStrike)
    {
        return false;
    }
    // End:0xE5
    if((WorldInfo.TimeSeconds - TimeStampReactiveAttack) < StalkerPawn.TuneDataStalker.MinTimeReactiveAttack)
    {
        return false;
    }
    // End:0xFD
    if(IsObstacleInTheWay(EnemyForAttack))
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
    return true;
    //return ReturnValue;    
}

function AIWantsToStartAimDownSight()
{
    local /*0x97E50000-0x00000000*/ private @NULL PotentialFireTarget[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function AIAimDownSight()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];

    return;
    //return;    
}

function CoverActionRandom()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChkCover[25165825];
    local /*0x97E50000-0x00000000*/ private byte OutCoverAction[25165825];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL Slot;

    // End:0x130
    if(super(SPGFCoverAIController).CoverActionRandom(ChkCover, OutCoverAction))
    {
        switch(OutCoverAction)
        {
            // End:0x46
            case 6:
                OutCoverAction = 5;
                // End:0x71
                break;
            // End:0x5A
            case 1:
                OutCoverAction = 3;
                // End:0x71
                break;
            // End:0x6E
            case 2:
                OutCoverAction = 4;
                // End:0x71
                break;
            // End:0xFFFF
            default:
                break;
        }
        Slot = ChkCover.Link.Slots[ChkCover.SlotIdx];
        // End:0x12E
        if(int(Slot.CoverType) == int(2))
        {
            switch(OutCoverAction)
            {
                // End:0x117
                case 3:
                    OutCoverAction = 5;
                    // End:0x12E
                    break;
                // End:0x12B
                case 4:
                    OutCoverAction = 5;
                    // End:0x12E
                    break;
                // End:0xFFFF
                default:
                    break;
            }
        }
        else
        {
            return true;
        }/* !MISMATCHING REMOVE, tried If got Type:Else Position:0x12E! */
        return false;
        //return ReturnValue;        
    }/* !MISMATCHING REMOVE, tried Else got Type:If Position:0x000! */
}

function GetCoverExitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL NextDestination[9437185];
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL DirToMainEnemy, MyCoverDir, DirToNextDestination;
    local /*0x97E50000-0x00000000*/ private float DotToMainEnemy, DotEnemyToCover, DotToNextDestination;
    local /*0x97E50000-0x00000000*/ private bool bHasEnemy, bHasDestination;

    vect(0.0000000, 0.0000000, 0.0000000)
    bHasDestination = NextDestination != vect(0.0000000, 0.0000000, 0.0000000);
    // End:0xE2
    if(bHasDestination)
    {
        DirToNextDestination = NextDestination - MyCoverPawn.Location;
        DirToNextDestination = Normal(DirToNextDestination);
        DotToNextDestination = DirToNextDestination Dot MyCoverPawn.AcquiredCoverInfo.PosInfo.Normal;
    }
    // End:0x1E6
    if(((bHasDestination && DotToNextDestination < -0.3000000) && MyCoverPawn.CurrentLink.Slots[MyCoverPawn.CurrentSlotIdx].bCanMantle) && !MyCoverPawn.CurrentLink.Slots[MyCoverPawn.CurrentSlotIdx].bDontAllowMantleAI)
    {
        return Class'LPSM_StalkerMantleOver';
    }
    bHasEnemy = MainEnemy != none;
    // End:0x396
    if(bHasEnemy)
    {
        DirToMainEnemy = MainEnemy.Location - MyCoverPawn.Location;
        DirToMainEnemy = Normal(DirToMainEnemy);
        MyCoverDir = ((MyCoverPawn.bIsMirrored) ? -MyCoverPawn.AcquiredCoverInfo.PosInfo.Tangent : MyCoverPawn.AcquiredCoverInfo.PosInfo.Tangent);
        DotToMainEnemy = DirToMainEnemy Dot MyCoverDir;
        DotEnemyToCover = DirToMainEnemy Dot MyCoverPawn.AcquiredCoverInfo.PosInfo.Normal;
    }
    // End:0x576
    if((bHasDestination && DotToNextDestination < -0.3000000) && !bHasEnemy || DotEnemyToCover < -0.3000000)
    {
        // End:0x4AA
        if(MyCoverPawn.CurrentLink.Slots[MyCoverPawn.CurrentSlotIdx].bCanCoverSlip_Left && (DirToNextDestination Dot MyCoverPawn.AcquiredCoverInfo.PosInfo.Tangent) < float(0))
        {
            return Class'LPSM_StalkerJumpOutCover';
        }
        // End:0x576
        if(MyCoverPawn.CurrentLink.Slots[MyCoverPawn.CurrentSlotIdx].bCanCoverSlip_Right && (DirToNextDestination Dot MyCoverPawn.AcquiredCoverInfo.PosInfo.Tangent) > float(0))
        {
            return Class'LPSM_StalkerJumpOutCover';
        }
    }
    // End:0x5C0
    if(bHasEnemy)
    {
        // End:0x5A3
        if(DotToMainEnemy > 0.5000000)
        {
            return Class'LPSM_StalkerExitNextToCover';            
        }
        else
        {
            // End:0x5C0
            if(DotEnemyToCover < 0.0000000)
            {
                return Class'LPSM_StalkerPushOutOfCover';
            }
        }
    }
    return Class'LPSM_StalkerPullOutOfCover';
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

function WantsWarningBurst()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL PlayerTarget;

    PlayerTarget = LPPlayerPawn(FireTarget);
    // End:0x2D
    if(PlayerTarget == none)
    {
        return false;
    }
    // End:0x90
    if((WorldInfo.TimeSeconds - TimeSinceIShotToMiss) < StalkerPawn.TuneDataStalker.ShootToMissMinTimeBetween)
    {
        return false;
    }
    // End:0xE4
    if(IsInPlayerLookingDirection(StalkerPawn, PlayerTarget, StalkerPawn.TuneDataStalker.ShootToMissDegreesOutOfView))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

protected function _GetAimLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLoc[8388609];
    local /*0x97E50000-0x00000000*/ private bool bActuallyFiring[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL AimTarget[9437185];
    local /*0x97E50000-0x00000000*/ private byte HintLocationType[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    1
    // End:0x1F
    if(bAimingIsLocked)
    {
        return AimingLockedLocation;
    }
    return super(SPGFCoverAIController)._GetAimLocation(StartLoc, bActuallyFiring, AimTarget, HintLocationType);
    //return ReturnValue;    
}

protected function _GetBestAimLocationForVisibleTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL StartLoc[8388609], TargetPawn, ReturnValue, PlayerTarget, TargetPos;

    // End:0x10F
    if(int(WorldInfo.NetMode) != int(NM_Standalone))
    {
        PlayerTarget = LPPlayerPawn(TargetPawn);
        // End:0x10F
        if(PlayerTarget != none)
        {
            // End:0xE6
            if(PlayerTarget.IsInCover() && PlayerTarget.IsProtectedByCover(Normal(TargetPawn.Location - StartLoc)))
            {
                return PlayerTarget.GetCoverViewPoint();
            }
            return PlayerTarget.GetProjectileTargetPosition(myAIPawn);
        }
    }
    // End:0x152
    if(TargetPawn.Mesh == none)
    {
        return TargetPawn.Location;
    }
    // End:0x275
    if(bWantsWarningBurst)
    {
        // End:0x212
        if(TargetPawn.IsInCover() && int(TargetPawn.CoverType) == int(2))
        {
            return TargetPawn.Location + (vect(0.0000000, 0.0000000, 1.0000000) * StalkerPawn.TuneDataStalker.ShootToMissExtraHeightInMiddleCover);            
        }
        else
        {
            return TargetPawn.Location + (vect(0.0000000, 0.0000000, 1.0000000) * StalkerPawn.TuneDataStalker.ShootToMissExtraHeight);
        }
    }
    // End:0x307
    if(TargetPawn.IsInCover() && TargetPawn.IsProtectedByCover(Normal(TargetPawn.Location - StartLoc)))
    {
        return TargetPawn.GetCoverViewPoint();
    }
    // End:0x348
    if(TargetPawn.IsRolling())
    {
        return TargetPawn.Location;
    }
    // End:0x39D
    if(TargetPawn.Mesh.GetSocketWorldLocationAndRotation('Chest', TargetPos))
    {
        return TargetPos;
    }
    return TargetPawn.Location;
    //return ReturnValue;    
}

protected function _GetAccuracyRotationModifier()
{
    local /*0x97E50000-0x00000000*/ private @NULL Wpn[8388609];
    local /*0x97E50000-0x00000000*/ private float InaccuracyPct[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL StartFireLoc[8388609], AimLoc, ReturnValue, AccRot, AccCone_Min, AccCone_Max,
	    LinePatternPctg, WpnStalker;

    WpnStalker = LPWeaponStalker(Wpn);
    // End:0x7F1
    if(WpnStalker != none)
    {
        WpnStalker.GetAIAccuracyConeAngles(AccCone_Min, AccCone_Max);
        // End:0x276
        if(WpnStalker.bShootingFromHands)
        {
            // End:0xD2
            if(WpnStalker.RemainingBurstFireCount == WpnStalker.StartBurstFireCount)
            {
                StartBurstInaccuracyPctg = InaccuracyPct;
            }
            AccRot.Pitch = int(GetRangeValueByPct(vect2d(AccCone_Min.X, AccCone_Max.X), StartBurstInaccuracyPctg) * 182.0444000);
            AccRot.Yaw = int(GetRangeValueByPct(vect2d(AccCone_Min.Y, AccCone_Max.Y), StartBurstInaccuracyPctg) * 182.0444000);
            LinePatternPctg = WpnStalker.GetLinePatternPctg();
            AccRot.Pitch *= (LinePatternPctg.X - 0.5000000);
            AccRot.Yaw *= (LinePatternPctg.Y - 0.5000000);            
        }
        else
        {
            // End:0x490
            if(WpnStalker.bShootingLinePattern)
            {
                // End:0x2EC
                if(WpnStalker.RemainingBurstFireCount == WpnStalker.StartBurstFireCount)
                {
                    StartBurstInaccuracyPctg = InaccuracyPct;
                }
                AccRot.Pitch = int(GetRangeValueByPct(vect2d(AccCone_Min.X, AccCone_Max.X), StartBurstInaccuracyPctg) * 182.0444000);
                AccRot.Yaw = int(GetRangeValueByPct(vect2d(AccCone_Min.Y, AccCone_Max.Y), StartBurstInaccuracyPctg) * 182.0444000);
                LinePatternPctg = WpnStalker.GetLinePatternPctg();
                AccRot.Pitch *= (LinePatternPctg.X - 0.5000000);
                AccRot.Yaw *= (LinePatternPctg.Y - 0.5000000);                
            }
            else
            {
                // End:0x6AA
                if(WpnStalker.bShootingFromFlaps)
                {
                    // End:0x506
                    if(WpnStalker.RemainingBurstFireCount == WpnStalker.StartBurstFireCount)
                    {
                        StartBurstInaccuracyPctg = InaccuracyPct;
                    }
                    AccRot.Pitch = int(GetRangeValueByPct(vect2d(AccCone_Min.X, AccCone_Max.X), StartBurstInaccuracyPctg) * 182.0444000);
                    AccRot.Yaw = int(GetRangeValueByPct(vect2d(AccCone_Min.Y, AccCone_Max.Y), StartBurstInaccuracyPctg) * 182.0444000);
                    LinePatternPctg = WpnStalker.GetLinePatternPctg();
                    AccRot.Pitch *= (LinePatternPctg.X - 0.5000000);
                    AccRot.Yaw *= (LinePatternPctg.Y - 0.5000000);                    
                }
                else
                {
                    AccRot.Pitch = int(GetRangeValueByPct(vect2d(AccCone_Min.X, AccCone_Max.X), InaccuracyPct) * 182.0444000);
                    AccRot.Yaw = int(GetRangeValueByPct(vect2d(AccCone_Min.Y, AccCone_Max.Y), InaccuracyPct) * 182.0444000);
                    AccRot.Pitch *= (0.5000000 - FRand());
                    AccRot.Yaw *= (0.5000000 - FRand());
                }
            }
        }        
    }
    else
    {
        AccCone_Min = MyCoverPawn.mySPGFTuneDataPawn.BurstFireAccuracyConeMin;
        AccCone_Max = MyCoverPawn.mySPGFTuneDataPawn.BurstFireAccuracyConeMax;
        AccRot.Pitch = int(GetRangeValueByPct(vect2d(AccCone_Min.X, AccCone_Max.X), InaccuracyPct) * 182.0444000);
        AccRot.Yaw = int(GetRangeValueByPct(vect2d(AccCone_Min.Y, AccCone_Max.Y), InaccuracyPct) * 182.0444000);
        AccRot.Pitch *= (0.5000000 - FRand());
        AccRot.Yaw *= (0.5000000 - FRand());
    }
    return AccRot;
    //return ReturnValue;    
}

function BurstLockAim()
{
    local /*0x97E50000-0x00000000*/ private @NULL InAimLockedLocation[8388609];

    bAimingIsLocked = true;
    AimingLockedLocation = InAimLockedLocation;
    //return;    
}

function BurstUnlockAim()
{
    bAimingIsLocked = false;
    //return;    
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
    Class'LPAICmd_StalkerAttackFromOpen'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerAttackFromOpen(GetActiveCommand());
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
    Class'LPAICmd_StalkerStaticAttackFromOpen'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerStaticAttackFromOpen(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemyActor(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStaticMelee()
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
    Class'LPAICmd_StalkerStaticMelee'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerStaticMelee(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemyActor(Enemy2Attack);
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
    // End:0x129
    if(InBursts <= 0)
    {
        InBursts = Class'SPEngine.SPUtil'.static.RandRangeInt(int(myAIPawn.TuneDataAIPawn.MinBurstsToFire.GetValue()), int(myAIPawn.TuneDataAIPawn.MaxBurstsToFire.GetValue() + float(1)));
        InBursts = Max(1, InBursts);
    }
    Class'LPAICmd_StalkerFireFromOpen'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerFireFromOpen(GetActiveCommand());
    // End:0x1C5
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.BurstsToFire = InBursts;
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
    Class'LPAICmd_StalkerStaticAttackFromCover'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerStaticAttackFromCover(GetActiveCommand());
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
    Class'LPAICmd_StalkerAttackFromCover'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerAttackFromCover(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdAmbush()
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
    Class'LPAICmd_StalkerAmbush'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerAmbush(GetActiveCommand());
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
    // End:0x129
    if(InBursts <= 0)
    {
        InBursts = Class'SPEngine.SPUtil'.static.RandRangeInt(int(myAIPawn.TuneDataAIPawn.MinBurstsToFireFromCover.GetValue()), int(myAIPawn.TuneDataAIPawn.MaxBurstsToFireFromCover.GetValue() + float(1)));
        InBursts = Max(1, InBursts);
    }
    Class'LPAICmd_StalkerFireFromCover'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerFireFromCover(GetActiveCommand());
    // End:0x1C5
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
    Class'LPAICmd_StalkerMelee'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerMelee(GetActiveCommand());
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
    Class'LPAICmd_StalkerStaticMelee'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerStaticMelee(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemyActor(Enemy2Attack);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStalkerStrugglePofStrikeBull()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_StalkerStrugglePofStrikeBull'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerStrugglePofStrikeBull(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStalkerStrugglePofStrikeBullLong()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_StalkerStrugglePofStrikeBullLong'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerStrugglePofStrikeBullLong(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStalkerStrikeKnockDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_StalkerStrikeKnockDown'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerStrikeKnockDown(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStalkerStrikeBull()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Strike[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    1
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_StalkerStrikeBull'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerStrikeBull(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Strike);
    }
    return myCommand;
    //return ReturnValue;    
}

function CmdStalkerKismet()
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
    Class'LPAICmd_StalkerKismet'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerKismet(GetActiveCommand());
    // End:0xA2
    if(myCommand != none)
    {
        myCommand.SetKismetAction(InKismetAction);
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
    0.0000000
    // End:0x44
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_StalkerPeekFromCover'.static.InitCommand(self);
    myCommand = LPAICmd_StalkerPeekFromCover(GetActiveCommand());
    // End:0xE0
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetPeekTime(PeekTime);
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    bEnableReactiveAttack=true
    bScriptedCanDoStruggleStrikes=true
    OverwrittenMinCoverSize=-1.0000000
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerStalker.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerStalker.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerStalker.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerStalker.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerStalker.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerStalker.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    lookWhenStartMoving=ELookAtStartMoving.LAS_LookEnemyForShortPaths
    HitReactionCmdClass=Class'LPAICmd_StalkerHitReaction'
    // Reference: SPAIReactionManager'Default__LPAIControllerStalker.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    bAllowDamageWhenDisableAI=true
    bUseSquad=true
    // Reference: LPAIObjectiveManager'Default__LPAIControllerStalker.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}