class LPAICmd_DefenderRamAttackVolley extends LPAICmd_DefenderRamAttackBase within LPAIControllerDefender;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float GeneralTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float InitialAttackTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoneLaunchingFromHiveCell;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWentOutsideHoverPosition;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bEnableLOSChecks;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CurrentHoverPointOffset;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MoveToPositionFlyCmd[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastClearAttackLaneTime;

function Pushed()
{
    LastClearAttackLaneTime = -1.0000000;
    super.Pushed();
    //return;    
}

function Popped()
{
    super.Popped();
    Outer.ReleaseOrbitAccess();
    Outer.ReleaseAdHocSquadMgrAccess();
    Outer.ReleaseStrikeAccess();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    // End:0x6D
    if(Outer.DefenderPawn.Health > 0)
    {
        Outer.DefenderPawn.ZeroMovementVariables();
    }
    super.Resumed(OldCommandName);
    //return;    
}

function StartLaunchFromHive()
{
    bDoneLaunchingFromHiveCell = false;
    GeneralTimer = Outer.WorldInfo.TimeSeconds + 5.0000000;
    Outer.Focus = none;
    Outer.SetFocalPoint(Outer.Pawn.Location + (Vector(Outer.Pawn.Rotation) * float(5000)), false);
    Outer.DefenderPawn.PawnThatLaunchedMe.LaunchedPawnCreateParticleSystem(Outer.DefenderPawn.CellIdLaunchedFrom);
    Outer.DefenderPawn.DoSpecialMove(GetLaunchFromHiveSM(), true, true, On_DefenderLaunchFromHiveCell_Finished);
    //return;    
}

function GetLaunchFromHiveSM()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0xE2
    if(Outer.DefenderPawn != none)
    {
        switch(Outer.DefenderPawn.DefenderHiveLaunchTypeToPerform)
        {
            // End:0x73
            case 0:
                return Class'LPSM_DefenderLaunchFromCarrierCell';
                // End:0xE2
                break;
            // End:0x85
            case 1:
                return Class'LPSM_DefenderLaunchFromCarrierCell';
                // End:0xE2
                break;
            // End:0x97
            case 2:
                return Class'LPSM_DefenderLaunchShortSlow';
                // End:0xE2
                break;
            // End:0xA9
            case 3:
                return Class'LPSM_DefenderLaunchSlightArcUpThenBackDown';
                // End:0xE2
                break;
            // End:0xBB
            case 4:
                return Class'LPSM_DefenderLaunchUpWithTurnToRightAtEnd';
                // End:0xE2
                break;
            // End:0xCD
            case 5:
                return Class'LPSM_DefenderLaunchDownWithSlightTurnToRightAtEnd';
                // End:0xE2
                break;
            // End:0xDF
            case 6:
                return Class'LPSM_DefenderLaunchLongFlatHalfArcToTheRight';
                // End:0xE2
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        return Class'LPSM_DefenderLaunchFromCarrierCell';
        //return ReturnValue;        
    }
}

function On_DefenderLaunchFromHiveCell_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    Outer.Focus = EnemyForAttack;
    bDoneLaunchingFromHiveCell = true;
    //return;    
}

function IsDoneWithLaunch()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(bDoneLaunchingFromHiveCell)
    {
        return true;
    }
    // End:0x52
    if(Outer.WorldInfo.TimeSeconds > GeneralTimer)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function PerformBestStikeBasedOnDistanceToTarget()
{
    super.PerformBestStikeBasedOnDistanceToTarget();
    // End:0x50
    if(LPVSPlayerPawn(EnemyForAttack) != none)
    {
        Outer.CmdRamStrikeVs(EnemyForAttack,, 1);        
    }
    else
    {
        // End:0x96
        if(LPVSFuturePlayerPawn(EnemyForAttack) != none)
        {
            Outer.CmdRamStrikeFvs(EnemyForAttack,, 1);            
        }
        else
        {
            Outer.CmdRamStrikePof(EnemyForAttack,, 1);
        }
    }
    Outer.ReleaseAdHocSquadMgrAccess();
    //return;    
}

function JoinAdHocSquad()
{
    local /*0x97E50000-0x00000000*/ private @NULL AIObj;

    AIObj = LPAIObjectiveAttackDefender(Outer.CurrentObjective);
    // End:0x5F
    if(AIObj != none)
    {
        AIObj.JoinAdHocSquad();
    }
    //return;    
}

function HasCleanLaneToTarget()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array losIgnoreActors, losIgnoreActorsClasses;
    local /*0x97E50000-0x00000000*/ private bool bIsClear;

    losIgnoreActors.AddItem(Outer.DefenderPawn);    
    losIgnoreActors.AddItem(EnemyForAttack);    
    losIgnoreActorsClasses.AddItem(Class'LPAIPawnMedFlyer');    
    bIsClear = Outer.LosTestForAttackLane(Outer.DefenderPawn.Location, EnemyForAttack.Location, Outer.DefenderPawn.TuneDataDefender.RadiusOfCheckForRamAttackLane.GetValue(), Outer.DefenderPawn.TuneDataDefender.RadiusOfCheckForRamAttackLane.GetValue(), Outer.LocationOfRamStrikeLaneBlockage, losIgnoreActors, losIgnoreActorsClasses, Outer.RamStrikeLaneBlockageImpactInfo);
    // End:0x286
    if(!bIsClear && VSize(Outer.LocationOfRamStrikeLaneBlockage - EnemyForAttack.Location) < Outer.DefenderPawn.TuneDataDefender.DistanceToIgnoreRamStrikeBlockingCollision)
    {
        bIsClear = true;
    }
    // End:0x2D0
    if(bIsClear)
    {
        LastClearAttackLaneTime = Outer.WorldInfo.TimeSeconds;
    }
    return bIsClear;
    //return ReturnValue;    
}

function IsMyTurnToAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL Leader;

    // End:0x43
    if(Outer.WorldInfo.TimeSeconds < InitialAttackTimer)
    {
        return false;
    }
    // End:0x131
    if(Outer.AmAdHocSquadLeader())
    {
        // End:0x99
        if(Outer.TimeSinceLastSeenEnemy(EnemyForAttack) > 1.0000000)
        {
            return false;
        }
        // End:0xD9
        if(!Outer.HaveStrikeAccess() && !IsStrikeAccessPossible(EnemyForAttack))
        {
            return false;
        }
        // End:0xF9
        if(bEnableLOSChecks && !HasCleanLaneToTarget())
        {
            return false;
        }
        GetStrikeAccess(EnemyForAttack);
        return Outer.HaveStrikeAccess();        
    }
    else
    {
        Leader = Outer.GetAdHocSquadLeader();
        // End:0x263
        if(Leader != none)
        {
            // End:0x243
            if(Outer.DefenderPawn.PawnThatLaunchedMe == none)
            {
                // End:0x243
                if(Outer.DefenderPawn.DistanceBetweenCollisionCylinders(Leader.Pawn) > Outer.DefenderPawn.TuneDataDefender.MaxDistanceFromLeaderForAttackWithOutCarrier)
                {
                    return false;
                }
            }
            return Leader.HaveStrikeAccess();
        }
    }
    return false;
    //return ReturnValue;    
}

function InitHoverPosition()
{
    // End:0x153
    if(Outer.DefenderPawn.HoverPositionInfo.SocketName != 'None')
    {
        CurrentHoverPointOffset.X = RandRange(-1.0000000, 1.0000000);
        CurrentHoverPointOffset.Y = RandRange(-1.0000000, 1.0000000);
        CurrentHoverPointOffset.Z = RandRange(-1.0000000, 1.0000000);
        CurrentHoverPointOffset = Normal(CurrentHoverPointOffset) * RandRange(0.0000000, Outer.DefenderPawn.HoverPositionInfo.HoverRadius);
    }
    //return;    
}

function UpdateHoverPosition()
{
    local /*0x97E50000-0x00000000*/ private bool bAllowNoCarrierHover[9437185];

    true
    // End:0xF1
    if(((Outer.DefenderPawn.PawnThatLaunchedMe != none) && Outer.DefenderPawn.PawnThatLaunchedMe.Health > 0) && Outer.DefenderPawn.HoverPositionInfo.SocketName != 'None')
    {
        UpdateHoverWithCarrier();        
    }
    else
    {
        // End:0x108
        if(bAllowNoCarrierHover)
        {
            UpdateHoverNoCarrier();
        }
    }
    //return;    
}

function UpdateHoverWithCarrier()
{
    local /*0x97E50000-0x00000000*/ private @NULL BaseLocation, DesiredLocation, DeltaToBase, DirToDesired;

    // End:0x532
    if(((Outer.DefenderPawn.PawnThatLaunchedMe != none) && Outer.DefenderPawn.PawnThatLaunchedMe.Health > 0) && Outer.DefenderPawn.HoverPositionInfo.SocketName != 'None')
    {
        // End:0x532
        if(Outer.DefenderPawn.PawnThatLaunchedMe.Mesh.GetSocketWorldLocationAndRotation(Outer.DefenderPawn.HoverPositionInfo.SocketName, BaseLocation))
        {
            DeltaToBase = BaseLocation - Outer.DefenderPawn.Location;
            // End:0x34D
            if(VSizeSq(DeltaToBase) < (Outer.DefenderPawn.HoverPositionInfo.HoverRadius * Outer.DefenderPawn.HoverPositionInfo.HoverRadius))
            {
                // End:0x34B
                if(bWentOutsideHoverPosition)
                {
                    bWentOutsideHoverPosition = false;
                    Outer.DefenderPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
                    Outer.DefenderPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
                    Outer.DefenderPawn.DesiredSpeed = 0.0000000;
                }
                return;
            }
            bWentOutsideHoverPosition = true;
            DesiredLocation = CurrentHoverPointOffset >> Outer.DefenderPawn.PawnThatLaunchedMe.Rotation;
            DesiredLocation += BaseLocation;
            DirToDesired = Normal(DesiredLocation - Outer.DefenderPawn.Location);
            Outer.DefenderPawn.DesiredSpeed = 1.0000000;
            Outer.DefenderPawn.Velocity = DirToDesired * Outer.DefenderPawn.AirSpeed;
            Outer.DefenderPawn.Acceleration = DirToDesired * Outer.DefenderPawn.AccelRate;
        }
    }
    //return;    
}

function StartIdle()
{
    // End:0x93
    if(!Outer.DefenderPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_MedFlyerStalkTightAtOrbitPoint'))
    {
        Outer.DefenderPawn.DoSpecialMove(Class'LPSM_MedFlyerStalkTightAtOrbitPoint', true, false, None, none);
    }
    //return;    
}

function StopIdle()
{
    Outer.DefenderPawn.EndSpecialMove(Class'LPSM_MedFlyerStalkTightAtOrbitPoint');
    //return;    
}

function UpdateHoverNoCarrier()
{
    local /*0x97E50000-0x00000000*/ private @NULL ResourceLocation;
    local /*0x97E50000-0x00000000*/ private float ReachDistance;
    local /*0x97E50000-0x00000000*/ private @NULL OrbitSlotPosition;

    Outer.CmdStatus_MoveToPosition.Cmd_Move_Error = 0;
    Outer.CmdStatus_MoveToPosition.Cmd_Error = 0;
    // End:0xAF
    if(MoveToPositionFlyCmd != none)
    {
        Outer.AbortCommand(MoveToPositionFlyCmd);
        MoveToPositionFlyCmd = none;
    }
    // End:0xFD
    if(!Outer.HaveOrbitAccess())
    {
        Outer.GetOrbitAccess(EnemyForAttack);
    }
    // End:0x123
    if(Outer.OrbitAccess == none)
    {
        return;
    }
    ResourceLocation = SPAIResFlyLocation(Outer.OrbitAccess.GetResource());
    // End:0x309
    if(ResourceLocation != none)
    {
        ReachDistance = ResourceLocation.ReachDistance();
        OrbitSlotPosition = ResourceLocation.GetWorldPosition();
        // End:0x309
        if(VSize(Outer.DefenderPawn.Location - OrbitSlotPosition) > (ReachDistance * 1.5000000))
        {
            StopIdle();
            MoveToPositionFlyCmd = Outer.CmdMoveToPositionFly(OrbitSlotPosition, EnemyForAttack, ReachDistance, Outer.CmdStatus_MoveToPosition, 1);
            Outer.Focus = EnemyForAttack;
            MoveToPositionFlyCmd.__MoveAbortDelegate__Delegate = MoveToHoverAbortCondition;
            MoveToPositionFlyCmd.bZeroVelocityOnFinish = false;
        }
    }
    //return;    
}

function MoveToHoverAbortCondition()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return IsMyTurnToAttack();
    //return ReturnValue;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal, myChildCommand;

    // End:0x56
    if(Other == EnemyForAttack)
    {
        // End:0x56
        if(Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx != -1)
        {
            return;
        }
    }
    // End:0x103
    if(!Outer.DefenderPawn.bInRammingMode && Other == EnemyForAttack)
    {
        HandleRunningIntoCurrentEnemy(Other, OtherComp, Outer.DefenderPawn.Location, HitNormal);        
    }
    else
    {
        myChildCommand = LPAICommand(ChildCommand);
        // End:0x168
        if(myChildCommand != none)
        {
            myChildCommand.Bump(Other, OtherComp, HitNormal);
        }
    }
    //return;    
}

function @NULL HandleRunningIntoCurrentEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, vsWindowLoc;

    local /*0x97E50000-0x00000000*/ private float distanceToWindshield, maxDistanceToWindshieldForAutoLand;
    local /*0x97E50000-0x00000000*/ private @NULL vsRanInto, newVelToDefender;

    vsRanInto = LPVSPlayerPawn(Other);
    // End:0x2BE
    if(vsRanInto != none)
    {
        // End:0x18D
        if(vsRanInto.Mesh.GetSocketWorldLocationAndRotation(Outer.DefenderPawn.TuneDataDefender.SocketOnVsToUseForDistanceForDeathCameraEffects, vsWindowLoc))
        {
            distanceToWindshield = VSize(vsWindowLoc - Outer.DefenderPawn.Location);
            maxDistanceToWindshieldForAutoLand = Outer.DefenderPawn.TuneDataDefender.MaxRangeFromVsWindshieldForAutoLandOnVsRunningInto.GetValue();
            // End:0x18D
            if(distanceToWindshield < maxDistanceToWindshieldForAutoLand)
            {
                // End:0x18D
                if(TryAttachToRig())
                {
                    return;
                }
            }
        }
        newVelToDefender = Normal(Outer.DefenderPawn.Location - Other.Location);
        newVelToDefender.Z = 0.0000000;
        newVelToDefender = newVelToDefender * Outer.DefenderPawn.TuneDataDefender.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit.GetValue();
        Outer.DefenderPawn.SetExternalVelocity(newVelToDefender);
    }
    //return;    
}

function TryAttachToRig()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL EnemyVS;
    local /*0x97E50000-0x00000000*/ private int AttackSlotIdx;

    EnemyVS = LPVSPlayerPawn(EnemyForAttack);
    // End:0x104
    if(EnemyVS != none)
    {
        AttackSlotIdx = EnemyVS.AIResDefenderVS.GetFreeAttackSlot(Outer.DefenderPawn);
        // End:0x104
        if(AttackSlotIdx != -1)
        {
            Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx = AttackSlotIdx;
            Outer.CmdAttachToVs(EnemyForAttack, 1);
            return true;
        }
    }
    return false;
    //return ReturnValue;    
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

    function GetInitialAttackDelay()
    {
        local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

        return RandRange(Outer.DefenderPawn.TuneDataDefender.DelayBeforeFirstRamAttack, Outer.DefenderPawn.TuneDataDefender.DelayBeforeFirstRamAttack + 0.2000000);
        //return ReturnValue;        
    }
Begin:

    Outer.DefenderPawn.bCollideWorld = true;
    Outer.DefenderPawn.SetCollision(true, true);
    InitHoverPosition();
    // End:0xE0
    if(Outer.DefenderPawn.bNeedsLaunchedFromCarrierCell)
    {
        StartLaunchFromHive();
        J0xB1:

        // End:0xE0 [Loop If]
        if(!IsDoneWithLaunch())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0xB1;
        }
    }
    Outer.Focus = EnemyForAttack;
    StartIdle();
    Outer.DefenderPawn.CheckStartDieDoT();
    JoinAdHocSquad();
    InitialAttackTimer = Outer.WorldInfo.TimeSeconds + (GetInitialAttackDelay());
    J0x199:

    // End:0x1DD [Loop If]
    if(!IsMyTurnToAttack())
    {
        UpdateHoverPosition();
        StartIdle();
        Outer.Sleep(0.1000000);
        // [Loop Continue]
        goto J0x199;
    }
    TimeStartedAnnounce = Outer.WorldInfo.TimeSeconds;
    bPerformingAnnounce = true;
    Outer.EnableAnnounceEffects(true);
    Outer.myAIPawn.SetRadarIconState(2);
    StartAnnounceSpecialMove();
    J0x286:

    // End:0x2C0 [Loop If]
    if(!IsAnnounceFinished())
    {
        UpdateHoverPosition(false);
        Outer.Sleep(0.0100000);
        // [Loop Continue]
        goto J0x286;
    }
    PerformBestStikeBasedOnDistanceToTarget();
    Outer.PopCommand(self);
    stop;        
}

defaultproperties
{
    bInterruptible=true
}