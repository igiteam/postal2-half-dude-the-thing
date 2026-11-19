class LPAICmd_DefenderRamStrikeBase extends LPAICmd_MedFlyerBasicPhysicalStrike within LPAIControllerDefender;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurMoveToPositionCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CmdStatus_RamStrike[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize @NULL PawnsRamedAndHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDonePlayingHit[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDonePlayingMiss[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIdealLineDrawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasRollingLastTick[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeRamMissSpecialMoveStarted[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AngleToSideStepACosAngRange[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefenderLocationLastUpdate[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefenderLocationAtStartOfRam[536870913];

function Pushed()
{
    super.Pushed();
    Class'SPEngine.SPUtil'.static.SetHalfCosAngRange(Outer.DefenderPawn.TuneDataDefender.AngleToSideStepVsDuringRam.GetValue(), AngleToSideStepACosAngRange);
    PawnsRamedAndHit.MaxLifeTimeOfItemInList = Outer.DefenderPawn.TuneDataDefender.DelayBetweenNewRamnHitsAgainstPofAllowed.GetValue();
    PawnsRamedAndHit.MaxLifeTimeOfVsInList = Outer.DefenderPawn.TuneDataDefender.DelayBetweenNewRamnHitsAgainstVsAllowed.GetValue();
    PawnsRamedAndHit.MaxLifeTimeOfShutdownVsInList = Outer.DefenderPawn.TuneDataDefender.DelayBetweenNewRamnHitsAgainstShutdownVsAllowed.GetValue();
    DefenderLocationLastUpdate = Outer.DefenderPawn.Location;
    bIdealLineDrawn = false;
    Class'LPAIUtils'.static.EmptyHitList(PawnsRamedAndHit);
    bDonePlayingHit = false;
    bDonePlayingMiss = false;
    Outer.bFinalRamTargetLocCommitted = false;
    TriggerStrikeEvent();
    Outer.UseSuicideRamAnimations();
    Outer.DefenderPawn.ProcessWingsForStartOfRamStrike();
    //return;    
}

function Popped()
{
    StopProcessDodgeWindowTimer();
    CleanUpEndOfStikeSpecialMove();
    Outer.DefenderPawn.SetMaxSpeedScale(Outer.DefenderPawn.TuneDataDefender.GetNormalMaxSpeedScale(Outer.DefenderPawn));
    Outer.DefenderPawn.AirSpeed = Outer.DefenderPawn.TuneDataBasePawn.GroundSpeed_Tunable.GetValue();
    Class'LPAIUtils'.static.EmptyHitList(PawnsRamedAndHit);
    // End:0x1AA
    if(CmdStatus_RamStrike.IsDodgeWindowOpen())
    {
        CmdStatus_RamStrike.CloseDodgeWindow();
    }
    Outer.DefenderPawn.HandleNotifyPlayerDodgeWindow(18, 1, EnemyForStrike);
    super.Popped();
    Outer.ResetRotationRate();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super(LPAICommand).Resumed(OldCommandName);
    StopHitOnRam();
    //return;    
}

event SPAborted()
{
    super(LPAICmd_Strike).SPAborted();
    Outer.ResetRotationRate();
    //return;    
}

function SetReturnCmdStatus()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnStatus[8388609];

    CmdStatus = ReturnStatus;
    CmdStatus_RamStrike = LPAICmdStatus_FlyRamAndExplodeAttack(ReturnStatus);
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super(LPAICmd_MedFlyerStrikeBase).SetDesiredEnemy(InEnemy);
    CmdStatus_RamStrike.CloseDodgeWindow();
    //return;    
}

event DelegateMovingToRamPointAvoidance()
{
    local /*0x97E50000-0x00000000*/ private @NULL Obstacle[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(Obstacle == EnemyForStrike)
    {
        return false;
    }
    // End:0x59
    if(Outer.IsThisActorTheVsAndInGivenAvoidanceZone(Obstacle, AngleToSideStepACosAngRange, EnemyForStrike))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function MoveStrikeAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x24
    if(Outer.bBonzi)
    {
        return false;
    }
    return super(LPAICmd_Strike).MoveStrikeAbortCondition();
    //return ReturnValue;    
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
    Outer.bFinalRamTargetLocCommitted = true;
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

    return Class'LPSM_DefenderSwoopStingStrike';
    //return ReturnValue;    
}

function StartRamStrike()
{
    Outer.DefenderPawn.bRamAggressiveOnFlag = true;
    Outer.Focus = none;
    StartProcessDodgeWindowTimer();
    StartRamStrikeSpecialMove();
    //return;    
}

function StartRamStrikeSpecialMove()
{
    //return;    
}

function GetSucsussfulRamStrikeHitClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_DefenderRamStrikeHitPof';
    //return ReturnValue;    
}

function StartRamStrikeHit()
{
    local /*0x97E50000-0x00000000*/ private @NULL ctrlToUseAsInstigator;

    // End:0x1C7
    if(Outer.DefenderPawn.Health > 0)
    {
        Outer.DefenderPawn.bInRammingMode = false;
        bDonePlayingHit = true;
        // End:0xB5
        if(EnemyForStrike.Controller == none)
        {
            ctrlToUseAsInstigator = Outer;            
        }
        else
        {
            ctrlToUseAsInstigator = EnemyForStrike.Controller;
        }
        Outer.DefenderPawn.TakeDamage(Outer.DefenderPawn.HealthMax + 1000, ctrlToUseAsInstigator, Outer.DefenderPawn.Location, Normal(Outer.DefenderPawn.Velocity), Class'LPDamageTypeForced');
    }
    CleanUpEndOfStikeSpecialMove();
    Outer.PopCommand(self);
    //return;    
}

function GetMissedRamStrikeClass()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_DefenderRamStrikeMissPof';
    //return ReturnValue;    
}

function SetFocalPointForRamStrikeMissed()
{
    Outer.SetFocalPoint(Outer.Pawn.Location + (Vector(Outer.Pawn.Rotation) * float(5000)), false);
    //return;    
}

function StartRamStrikeMissed()
{
    SetFocalPointForRamStrikeMissed();
    bDonePlayingMiss = false;
    TimeRamMissSpecialMoveStarted = Outer.WorldInfo.TimeSeconds;
    Outer.DefenderPawn.DoSpecialMove(GetMissedRamStrikeClass(), true, false, OnSM_RamStrikeMissEnd);
    //return;    
}

function OnSM_RamStrikeMissEnd()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    bDonePlayingMiss = true;
    //return;    
}

function HasTheHitPawnSucsufullyDodgedOrBlockedStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnRunInto[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL curTargetDodge;

    curTargetDodge = LPSM_PlayerDodgeBase(PawnRunInto.SpecialMoveState.CurSMInstance);
    // End:0x55
    if(curTargetDodge != none)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function CleanUpEndOfStikeSpecialMove()
{
    Outer.DefenderPawn.EndSpecialMove(Class'LPSM_DefenderRamStrikePof');
    //return;    
}

event @NULL TouchWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Touch(Other, OtherComp, HitLocation, HitNormal);
    return true;
    //return ReturnValue;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x28
    if(Other.IsA('LPAIPawnMedFlyer'))
    {
        return;        
    }
    else
    {
        // End:0x110
        if(Other.IsA('LPPlayerPawn'))
        {
            // End:0x10D
            if(Outer.DefenderPawn.TuneDataDefender.bRamHitsOnTouchAgainstPof)
            {
                // End:0x10D
                if(!RanIntoActor(Other, OtherComp, HitLocation, HitNormal))
                {
                    Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
                }
            }            
        }
        else
        {
            // End:0x1F8
            if(Other.IsA('LPBaseVSPlayerPawn'))
            {
                // End:0x1F5
                if(Outer.DefenderPawn.TuneDataDefender.bRamHitsOnTouchAgainstVs)
                {
                    // End:0x1F5
                    if(!RanIntoActor(Other, OtherComp, HitLocation, HitNormal))
                    {
                        Outer.TouchedOtherActorDuringMoveCmd(Other, OtherComp, HitLocation, HitNormal);
                    }
                }                
            }
        }
    }
    //return;    
}

event @NULL BumpWhileMoving()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    Bump(Other, OtherComp, HitNormal);
    return true;
    //return ReturnValue;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    // End:0x28
    if(Other.IsA('LPAIPawnMedFlyer'))
    {
        return;        
    }
    else
    {
        // End:0x99
        if(!RanIntoActor(Other, OtherComp, vect(0.0000000, 0.0000000, 0.0000000), HitNormal))
        {
            Outer.BumpedOtherActorDuringMoveCmd(Other, OtherComp, HitNormal);
        }
    }
    //return;    
}

simulated function @NULL HitWall()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], Wall, WallComp;

    StopHitOnRam();
    //return;    
}

simulated event Landed()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

    StopHitOnRam();
    //return;    
}

simulated event @NULL RigidBodyCollision()
{
    local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], OtherComponent, RigidCollisionData;
    local /*0x97E50000-0x00000000*/ private int ContactIndex[8388609];

    StopHitOnRam();
    //return;    
}

function GetHitPushDuringRam()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitActor[8388609], ReturnValue, hitPush;

    hitPush = HitActor.Location - Outer.DefenderPawn.Location;
    hitPush = Normal(hitPush);
    return hitPush;
    //return ReturnValue;    
}

function @NULL RanIntoActor()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL hitPush, runIntoPawn, HitInfo, HitLoc, HitNorm, StartTrace,
	    EndTrace;

    local /*0x97E50000-0x00000000*/ private float DamageAmount;

    // End:0x40C
    if(Other != none)
    {
        runIntoPawn = LPPawn(Other);
        // End:0x40C
        if(runIntoPawn != none)
        {
            // End:0x54
            if(LPAIPawnMedFlyer(runIntoPawn) != none)
            {
                return true;
            }
            // End:0x40A
            if(true)
            {
                // End:0x405
                if(Class'LPAIUtils'.static.AddPawnHit(runIntoPawn, PawnsRamedAndHit, Outer.WorldInfo.TimeSeconds, true))
                {
                    Class'LPAIUtils'.static.AddPawnHit(runIntoPawn, Outer.PawnsRunIntoWhileMoveing, Outer.WorldInfo.TimeSeconds, true);
                    hitPush = GetHitPushDuringRam(runIntoPawn);
                    // End:0x3D6
                    if(!HasTheHitPawnSucsufullyDodgedOrBlockedStrike(runIntoPawn))
                    {
                        StartTrace = Outer.myAIPawn.Location;
                        EndTrace = Other.Location;
                        Outer.TraceComponent(HitLoc, HitNorm, runIntoPawn.Mesh, EndTrace, StartTrace,, HitInfo, true);
                        CmdStatus_RamStrike.NotifyStruckPawn(runIntoPawn);
                        Outer.AdjustHitPushForUnoccupiedVs(runIntoPawn, hitPush);
                        Outer.PlayCorrectEffectsForRamHit(runIntoPawn);
                        DamageAmount = GetRamStrikeHitDamageForThisTarget(runIntoPawn);
                        // End:0x391
                        if(DamageAmount > float(0))
                        {
                            runIntoPawn.TakeDamage(int(DamageAmount), Outer, Outer.DefenderPawn.Location, hitPush, Class'LPDamageTypeDefenderRam', HitInfo, Outer.DefenderPawn);                            
                        }
                        // End:0x3C9
                        if(CmdStatus_RamStrike.WasTargetSuccessfullyStruck())
                        {
                            IHitMyTarget(runIntoPawn);                            
                        }
                        else
                        {
                            StopHitOnRam();
                        }                        
                    }
                    else
                    {
                        // End:0x405
                        if(CmdStatus_RamStrike.WasBlockingObjectStruck())
                        {
                            StopHitOnRam();                            
                        }
                    }
                }
                return true;                
            }
            else
            {
                return true;
            }
        }
    }
    StopHitOnRam();
    return true;
    //return ReturnValue;    
}

final function StartProcessDodgeWindowTimer()
{
    // End:0x67
    if(!Outer.bDisableAI && !IsProcessDodgeWindowTimerActive())
    {
        ProcessDodgeWindowTimer();
        Outer.SetTimer(0.0100000, true, 'ProcessDodgeWindowTimer', self);
    }
    //return;    
}

final function StopProcessDodgeWindowTimer()
{
    Outer.ClearTimer('ProcessDodgeWindowTimer', self);
    //return;    
}

function PauseProcessDodgeWindowTimer()
{
    local /*0x97E50000-0x00000000*/ private bool bPause[8388609];

    // End:0x1A
    if(bPause)
    {
        StopProcessDodgeWindowTimer();        
    }
    else
    {
        StartProcessDodgeWindowTimer();
    }
    //return;    
}

final function IsProcessDodgeWindowTimerActive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Outer.IsTimerActive('ProcessDodgeWindowTimer', self);
    //return ReturnValue;    
}

private final function ProcessDodgeWindowTimer()
{
    ProcessDodgeWindow();
    //return;    
}

function ProcessDodgeWindow()
{
    local /*0x97E50000-0x00000000*/ private float seperationFromEnemy;
    local /*0x97E50000-0x00000000*/ private bool bInRangeForSpecialDodge, bInRangeForAnyDodge;

    // End:0x46D
    if(CmdStatus_RamStrike.HasTargetPawn())
    {
        seperationFromEnemy = VSize2D(Outer.myAIPawn.Location - CmdStatus_RamStrike.GetTargetPawn().Location);
        bInRangeForSpecialDodge = (seperationFromEnemy < Outer.DefenderPawn.TuneDataDefender.DistanceAwayToOpenRamDodgeWindowPof.GetValue()) && seperationFromEnemy > Outer.DefenderPawn.TuneDataDefender.DistanceAwayToCloseRamDodgeWindowPof.GetValue();
        bInRangeForAnyDodge = seperationFromEnemy < Outer.DefenderPawn.TuneDataDefender.DistanceAwayToStopRamTrackingOnAnyDodge;
        // End:0x2BD
        if(!CmdStatus_RamStrike.IsDodgeWindowOpen() && bInRangeForSpecialDodge)
        {
            Outer.DefenderPawn.HandleNotifyPlayerDodgeWindow(18, 0, EnemyForStrike);
            CmdStatus_RamStrike.OpenDodgeWindow(Outer.DefenderPawn.TuneDataDefender.RamDodgeMessage);            
        }
        else
        {
            // End:0x35D
            if(CmdStatus_RamStrike.IsDodgeWindowOpen() && !bInRangeForSpecialDodge)
            {
                Outer.DefenderPawn.HandleNotifyPlayerDodgeWindow(18, 1, EnemyForStrike);
                StopProcessDodgeWindowTimer();
                CmdStatus_RamStrike.CloseDodgeWindow();                
            }
            else
            {
                // End:0x42D
                if(bInRangeForAnyDodge)
                {
                    // End:0x42D
                    if(CmdStatus_RamStrike.GetTargetPawn().IsRolling())
                    {
                        Outer.bFinalRamTargetLocCommitted = true;
                        Outer.DefenderPawn.HandleNotifyPlayerDodgeWindow(18, 1, EnemyForStrike);
                        StopProcessDodgeWindowTimer();
                        CmdStatus_RamStrike.CloseDodgeWindow();
                    }
                }
            }
        }
        bWasRollingLastTick = CmdStatus_RamStrike.GetTargetPawn().IsRolling();
    }
    //return;    
}

function GetRamStrikeHitDamageForThisTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689], bonziMinHealthAllowedToLeaveTargetWith, ammountOfDamage;

    bonziMinHealthAllowedToLeaveTargetWith = 0.0000000;
    // End:0x11C
    if(LPVSFuturePlayerPawn(HitPawn) != none)
    {
        ammountOfDamage = Outer.DefenderPawn.TuneDataDefender.RamHitDamageFvs.GetValue();
        // End:0x119
        if(Outer.bBonzi)
        {
            bonziMinHealthAllowedToLeaveTargetWith = Outer.DefenderPawn.TuneDataDefender.BonziRamHitMinHealthAllowedToLeaveTargetWithFvs.GetValue();
        }        
    }
    else
    {
        // End:0x229
        if(LPBaseVSPlayerPawn(HitPawn) != none)
        {
            ammountOfDamage = Outer.DefenderPawn.TuneDataDefender.RamHitDamageVS.GetValue();
            // End:0x226
            if(Outer.bBonzi)
            {
                bonziMinHealthAllowedToLeaveTargetWith = Outer.DefenderPawn.TuneDataDefender.BonziRamHitMinHealthAllowedToLeaveTargetWithVS.GetValue();
            }            
        }
        else
        {
            ammountOfDamage = Outer.DefenderPawn.TuneDataDefender.RamHitDamagePoF.GetValue();
            // End:0x31B
            if(Outer.bBonzi)
            {
                bonziMinHealthAllowedToLeaveTargetWith = Outer.DefenderPawn.TuneDataDefender.BonziRamHitMinHealthAllowedToLeaveTargetWithPoF.GetValue();
            }
        }
    }
    // End:0x390
    if((float(HitPawn.Health) - ammountOfDamage) < bonziMinHealthAllowedToLeaveTargetWith)
    {
        ammountOfDamage = float(Max(int(float(HitPawn.Health) - bonziMinHealthAllowedToLeaveTargetWith), 0));
    }
    return ammountOfDamage;
    //return ReturnValue;    
}

function IHitMyTarget()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitPawn[8388609];

    // End:0x43
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
        CurMoveToPositionCmd = none;
    }
    StartRamStrikeHit();
    //return;    
}

function StopHitOnRam()
{
    CmdStatus_RamStrike.NotifyStruckBlockingObject();
    // End:0x62
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
        CurMoveToPositionCmd = none;
    }
    StartRamStrikeHit();
    //return;    
}

function GetHeightShiftForTargetForRamStrike()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.DefenderPawn.TuneDataDefender.HeightShiftForTargetForRamStrikePof.GetValue();
    //return ReturnValue;    
}

function MoveThroughEnemyForStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL ramTargetLoc, targetsHeightOffset;
    local /*0x97E50000-0x00000000*/ private float ramSpeed, estimatedTimeOfRamRun;

    ramTargetLoc = EnemyForStrike.Location;
    Outer.HeightShiftForTargetForRamStrike = GetHeightShiftForTargetForRamStrike();
    ramTargetLoc.Z += Outer.HeightShiftForTargetForRamStrike;
    targetsHeightOffset = ramTargetLoc;
    ramTargetLoc = ramTargetLoc - Outer.DefenderPawn.Location;
    Outer.DistanceBeyondTargetForRamStrike = Outer.DefenderPawn.TuneDataDefender.DistanceBeyondTargetForRamStrikePof.GetValue();
    ramTargetLoc = Normal(ramTargetLoc) * Outer.DistanceBeyondTargetForRamStrike;
    ramTargetLoc = ramTargetLoc + targetsHeightOffset;
    CmdStatus_RamStrike.EndOfRamPointChosen = ramTargetLoc;
    Outer.DefenderPawn.bInRammingMode = true;
    Outer.TotalRamStrikeFlyDistanceEstimate = VSize(ramTargetLoc - Outer.DefenderPawn.Location);
    Outer.RamMaxSpeedScale = Outer.DefenderPawn.TuneDataDefender.RamMaxSpeedScale.GetValue();
    ramSpeed = Outer.DefenderPawn.AirSpeed * Outer.RamMaxSpeedScale;
    // End:0x396
    if(ramSpeed > float(0))
    {
        estimatedTimeOfRamRun = Outer.TotalRamStrikeFlyDistanceEstimate / ramSpeed;        
    }
    else
    {
        estimatedTimeOfRamRun = Outer.DefenderPawn.TuneDataDefender.DefaultEstimatedTimeOfRamRun;
    }
    Outer.DefenderPawn.TimeToEndRamNoMatterWhat = (Outer.WorldInfo.TimeSeconds + estimatedTimeOfRamRun) + Outer.DefenderPawn.TuneDataDefender.SmallAmountOfExtraTimeToAddToTheRamRun;
    Outer.DefenderPawn.Velocity = ramTargetLoc - Outer.DefenderPawn.Location;
    Outer.DefenderPawn.Velocity = Normal(Outer.DefenderPawn.Velocity) * ramSpeed;
    Outer.AccelerationRateForRam = Outer.DefenderPawn.TuneDataDefender.AccelerationRate_Tunable.GetValue();
    MyPawn.DesiredSpeed = ramSpeed;
    MyPawn.SetMaxSpeedScale(Outer.RamMaxSpeedScale);
    MyPawn.Acceleration = Normal(Outer.DefenderPawn.Velocity) * Outer.AccelerationRateForRam;
    CmdStatus_RamStrike.StartingRamStrike(EnemyForStrike, ramTargetLoc);
    DefenderLocationLastUpdate = Outer.DefenderPawn.Location;
    DefenderLocationAtStartOfRam = Outer.DefenderPawn.Location;
    Outer.bRamStrikeIntentionMissChanceMade = false;
    //return;    
}

function PlanBMoveToEnemysLastLocForStrike()
{
    local /*0x97E50000-0x00000000*/ private @NULL ramTargetLoc;

    ramTargetLoc = EnemyForStrike.Location;
    CmdStatus_RamStrike.EndOfRamPointChosen = ramTargetLoc;
    CurMoveToPositionCmd = Outer.CmdMoveToPositionFly(ramTargetLoc,, 40.0000000, Outer.CmdStatus_MoveToPosition, 1);
    CurMoveToPositionCmd.__MoveAvoidanceDelegate__Delegate = DelegateMovingToRamPointAvoidance;
    CurMoveToPositionCmd.SetNotifyOfTouchWhileMovingDelegate(TouchWhileMoving);
    CurMoveToPositionCmd.SetNotifyOfBumpWhileMovingDelegate(BumpWhileMoving);
    CurMoveToPositionCmd.__MoveAbortDelegate__Delegate = MoveStrikeAbortCondition;
    CurMoveToPositionCmd.bZeroVelocityOnFinish = true;
    CurMoveToPositionCmd.SetMovementMonitorParameters(true, Outer.DefenderPawn.TuneDataDefender.DurationBetweenMovementDeltaDuringRamStrike.GetValue(), Outer.DefenderPawn.TuneDataDefender.MinMovementDeltaDuringRamStrike.GetValue(), Outer.DefenderPawn.TuneDataDefender.DelayAfterStartOfRamStrikeBeforeMonitorStarts.GetValue(), NotifyOfFailedMovementToRamEndPoint);
    DefenderLocationLastUpdate = Outer.DefenderPawn.Location;
    //return;    
}

function NotifyOfFailedMovementToRamEndPoint()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x38
    if(CurMoveToPositionCmd != none)
    {
        Outer.AbortCommand(CurMoveToPositionCmd);
    }
    return true;
    //return ReturnValue;    
}

function DrawAttackArcs()
{
    //return;    
}

function GetMaxTimeForRamStrikeMissSM()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.DefenderPawn.TuneDataDefender.MaxTimeForRamStrikeMissAnimPof;
    //return ReturnValue;    
}

function IsDoneWithRamStrikeMiss()
{
    local /*0x97E50000-0x00000000*/ private float MaxDurationOfState[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float durationOfAction;

    // End:0x0F
    if(bDonePlayingMiss)
    {
        return true;
    }
    durationOfAction = Outer.WorldInfo.TimeSeconds - TimeRamMissSpecialMoveStarted;
    // End:0x70
    if(durationOfAction > MaxDurationOfState)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function TotalValidMiss()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float distanceFromStartOfRamStrike, percentageOfTotalRamRunMade, percentageOfTotalRamRunToCountAsMiss;

    distanceFromStartOfRamStrike = VSize(Outer.DefenderPawn.Location - DefenderLocationAtStartOfRam);
    // End:0xA6
    if(Outer.TotalRamStrikeFlyDistanceEstimate > float(0))
    {
        percentageOfTotalRamRunMade = distanceFromStartOfRamStrike / Outer.TotalRamStrikeFlyDistanceEstimate;        
    }
    else
    {
        percentageOfTotalRamRunMade = 1.0000000;
    }
    percentageOfTotalRamRunToCountAsMiss = Outer.DefenderPawn.TuneDataDefender.PercentageOfRamStrikeRunNeedToCompleteToCountAsMiss.GetValue();
    // End:0x136
    if(percentageOfTotalRamRunMade >= percentageOfTotalRamRunToCountAsMiss)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

event NotifyAIResourceChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function NotifyFormationLocationBecomingInvalid()
{
    local /*0x97E50000-0x00000000*/ private @NULL LocBecomingInvalid[8388609];

    //return;    
}

function OnEngagementAttackOptionApproved()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function NotifyAIResourceAccessLost()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceAccess[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

state StateCmdActive
{
    event PoppedState()
    {
        Outer.DefenderPawn.SetMaxSpeedScale(Outer.DefenderPawn.TuneDataDefender.GetNormalMaxSpeedScale(Outer.DefenderPawn));
        Outer.DefenderPawn.AirSpeed = Outer.DefenderPawn.AirSpeed * Outer.DefenderPawn.TuneDataDefender.GetNormalMaxSpeedScale(Outer.DefenderPawn);
        CleanUpEndOfStikeSpecialMove();
        StopProcessDodgeWindowTimer();
        super(SPStateObject).PoppedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.DefenderPawn.SetMaxSpeedScale(Outer.DefenderPawn.TuneDataDefender.GetNormalMaxSpeedScale(Outer.DefenderPawn));
        Outer.DefenderPawn.AirSpeed = Outer.DefenderPawn.AirSpeed * Outer.DefenderPawn.TuneDataDefender.GetNormalMaxSpeedScale(Outer.DefenderPawn);
        CleanUpEndOfStikeSpecialMove();
        StopProcessDodgeWindowTimer();
        super.EndState(NextStateName);
        //return;        
    }

    private final function ProcessDodgeWindowTimer()
    {
        ProcessDodgeWindow();
        //return;        
    }
Begin:

    Outer.Focus = none;
    Outer.DefenderPawn.AirSpeed = Outer.DefenderPawn.AirSpeed * Outer.DefenderPawn.TuneDataDefender.RamMaxSpeedScale.GetValue();
    StartRamStrike();
    MoveThroughEnemyForStrike();
    J0xFB:

    // End:0x17A [Loop If]
    if(Outer.DefenderPawn.bInRammingMode)
    {
        Outer.Sleep(0.0100000);
        Outer.UpdateMovingThroughEnenyForRamStrike(EnemyForStrike);
        // [Loop Continue]
        goto J0xFB;
    }
BackFromRamStrikeMove:


    Outer.ZeroRotationRate();
    StartRamStrikeHit();
    Outer.PopCommand(self);
    stop;                    
}

defaultproperties
{
    PawnsRamedAndHit=(PawnsHit=none,MaxLifeTimeOfItemInList=-1.0000000,MaxLifeTimeOfVsInList=-1.0000000,MaxLifeTimeOfShutdownVsInList=-1.0000000)
}