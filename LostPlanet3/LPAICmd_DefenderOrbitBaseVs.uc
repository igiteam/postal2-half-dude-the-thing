class LPAICmd_DefenderOrbitBaseVs extends LPAICmd_DefenderOrbit within LPAIControllerDefender;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyVS;

function Pushed()
{
    Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx = -1;
    super.Pushed();
    //return;    
}

function Popped()
{
    // End:0x69
    if((Outer.DefenderPawn != none) && Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx >= 0)
    {
        ConditionalAbortAttachToVS();
    }
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
    //return;    
}

function SetDesiredEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL InEnemy[8388609];

    super(LPAICmd_Orbit).SetDesiredEnemy(InEnemy);
    EnemyVS = LPBaseVSPlayerPawn(InEnemy);
    //return;    
}

function CanStillAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x0F
    if(super(LPAICmd_Orbit).CanStillAttack())
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function HasAccessToStartAttackFromOrbitSlot()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function GetStrikeAccessIfRequiredBeforeAttack()
{
    GetStrikeAccess(EnemyForAttack);
    //return;    
}

function PerformReactionToVsBump()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheVs[8388609];

    Outer.CmdReactiveAttackVs(TheVs);
    //return;    
}

function CanMoveStrightToVsLandOnLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheVs[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private editfixedsize array losIgnoreActors, losIgnoreActorsClasses;
    local /*0x97E50000-0x00000000*/ private @NULL vsWindowLoc;

    // End:0x384
    if(((TheVs != none) && TheVs.AIResDefenderVS != none) && TheVs.AIResDefenderVS.AttackSlots.Length > 0)
    {
        // End:0x384
        if(TheVs.Mesh.GetSocketWorldLocationAndRotation(EnemyVS.AIResDefenderVS.AttackSlots[0].Sockets.EndSocketName, vsWindowLoc))
        {
            Outer.StartOfLastLandOnVsLane = Outer.DefenderPawn.Location;
            Outer.EndOfLastLandOnVsLane = vsWindowLoc;
            losIgnoreActors.AddItem(Outer.DefenderPawn);            
            losIgnoreActors.AddItem(EnemyForAttack);            
            losIgnoreActorsClasses.AddItem(Class'LPAIPawnMedFlyer');            
            Outer.bAbleToPerformLandOnVsAtLastCheck = Outer.LosTestForAttackLane(Outer.StartOfLastLandOnVsLane, Outer.EndOfLastLandOnVsLane, Outer.DefenderPawn.TuneDataDefender.RadiusOfCheckForRamAttackLane.GetValue(), Outer.DefenderPawn.TuneDataDefender.RadiusOfCheckForRamAttackLane.GetValue(), Outer.LocationOfLandOnVsLaneBlockage, losIgnoreActors, losIgnoreActorsClasses, Outer.LandOnVsLaneBlockageImpactInfo);
            return Outer.bAbleToPerformLandOnVsAtLastCheck;
        }
    }
    return false;
    //return ReturnValue;    
}

function ShouldTryFullPhysicalAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeSinceFindingValidPhysicalAttackOption, howOfftenToRestartSearchingForValidAttackOptions;

    // End:0x51
    if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedFullPhysicalAttack)
    {
        return true;        
    }
    else
    {
        // End:0x78
        if(Outer.bBonzi)
        {
            return false;            
        }
        else
        {
            // End:0xC9
            if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedRangeLobAttack)
            {
                return false;                
            }
            else
            {
                // End:0x11A
                if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedRamAttack)
                {
                    return false;                    
                }
                else
                {
                    // End:0x14A
                    if(Outer.WantsToDoStruggleMode(EnemyForAttack))
                    {
                        return false;                        
                    }
                    else
                    {
                        // End:0x198
                        if(Outer.MedFlyerPawn.TuneDataMedFlyer.bForceFlyerNotToAttack)
                        {
                            return false;
                        }
                    }
                }
            }
        }
    }
    howOfftenToRestartSearchingForValidAttackOptions = Outer.GetHowOfftenToRestartSearchingForValidAttackOptions();
    timeSinceFindingValidPhysicalAttackOption = Outer.WorldInfo.TimeSeconds - LastTimeFoundValidEngagementFullPhysicalAttack;
    // End:0x2DA
    if(timeSinceFindingValidPhysicalAttackOption > howOfftenToRestartSearchingForValidAttackOptions)
    {
        // End:0x2D7
        if(Outer.IsLandOnAttackAsReplacementForFullPhysicalAttackAllowed())
        {
            // End:0x2D4
            if(EnemyVS.AIResDefenderVS.IsThereFreeAttackSlot())
            {
                // End:0x2D1
                if(CanMoveStrightToVsLandOnLocation(EnemyVS))
                {
                    LastTimeFoundValidEngagementFullPhysicalAttack = Outer.WorldInfo.TimeSeconds;
                    return true;                    
                }                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function OnEngagementAttackOptionFullPhysicalAttackApproved()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private int AttackSlotIdx;

    // End:0x19
    if(!HasAccessToStartAttackFromOrbitSlot())
    {
        GetStrikeAccessIfRequiredBeforeAttack();
    }
    // End:0x1FB
    if(HasAccessToStartAttackFromOrbitSlot())
    {
        AttackSlotIdx = EnemyVS.AIResDefenderVS.GetFreeAttackSlot(Outer.DefenderPawn);
        // End:0xF5
        if(AttackSlotIdx != -1)
        {
            Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx = AttackSlotIdx;
            EnemyVS.NotifyDefenderCountChanged();            
        }
        else
        {
            return false;
        }
        // End:0x13A
        if(MoveToPositionFlyCmd != none)
        {
            Outer.AbortCommand(MoveToPositionFlyCmd);
            MoveToPositionFlyCmd = none;
        }
        // End:0x17D
        if(CurMoveToActorCmd != none)
        {
            Outer.AbortCommand(CurMoveToActorCmd);
            CurMoveToActorCmd = none;
        }
        // End:0x1C0
        if(CurrentAttackCmd != none)
        {
            Outer.AbortCommand(CurrentAttackCmd);
            CurrentAttackCmd = none;
        }
        // End:0x1D7
        if(StaticStalkStarted)
        {
            StopAreaDependentStalk();
        }
        TypeOfAttackToldToPerform = 13;
        GotoStateWithEnemyCheck('AttachToRig');
        return true;        
    }
    return false;
    //return ReturnValue;    
}

function @NULL HandleRunningIntoCurrentEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, vsWindowLoc;

    local /*0x97E50000-0x00000000*/ private float distanceToWindshield, maxDistanceToWindshieldForAutoLand;
    local /*0x97E50000-0x00000000*/ private @NULL vsRanInto;

    vsRanInto = LPVSPlayerPawn(Other);
    // End:0x193
    if(vsRanInto != none)
    {
        // End:0x193
        if(vsRanInto.Mesh.GetSocketWorldLocationAndRotation(Outer.DefenderPawn.TuneDataDefender.SocketOnVsToUseForDistanceForDeathCameraEffects, vsWindowLoc))
        {
            distanceToWindshield = VSize(vsWindowLoc - Outer.DefenderPawn.Location);
            maxDistanceToWindshieldForAutoLand = Outer.DefenderPawn.TuneDataDefender.MaxRangeFromVsWindshieldForAutoLandOnVsRunningInto.GetValue();
            // End:0x193
            if(distanceToWindshield < maxDistanceToWindshieldForAutoLand)
            {
                // End:0x190
                if(OnEngagementAttackOptionFullPhysicalAttackApproved())
                {
                    return;                    
                }                
            }
        }
    }
    super.HandleRunningIntoCurrentEnemy(Other, OtherComp, HitLocation, HitNormal);
    //return;    
}

function AttackEnemyFromOrbitSlot()
{
    super(LPAICmd_Orbit).AttackEnemyFromOrbitSlot();
    // End:0x63B
    if(Outer.DefenderPawn != none)
    {
        Outer.bMeleeFinished = false;
        // End:0x267
        if(int(TypeOfAttackToldToPerform) == int(2))
        {
            CurrentAttackCmd = Outer.CmdBasicRangedAttackVs(EnemyForAttack, int(Outer.DefenderPawn.TuneDataDefender.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.DefenderPawn.TuneDataDefender.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.DefenderPawn.TuneDataDefender.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.DefenderPawn.TuneDataDefender.MaxAmountOfDamageRequiredToStopAttack.GetValue(), None, None, IsThereClearLobAttackLaneFromGivenLoc, Outer.CmdStatus_Strike, 1);            
        }
        else
        {
            // End:0x47F
            if(int(TypeOfAttackToldToPerform) == int(5))
            {
                CurrentAttackCmd = Outer.CmdBasicRangedAttackPof(EnemyForAttack, int(Outer.DefenderPawn.TuneDataDefender.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.DefenderPawn.TuneDataDefender.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.DefenderPawn.TuneDataDefender.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.DefenderPawn.TuneDataDefender.MaxAmountOfDamageRequiredToStopAttack.GetValue(), None, None, IsThereClearLobAttackLaneFromGivenLoc, Outer.CmdStatus_Strike, 1);                
            }
            else
            {
                // End:0x63B
                if(int(TypeOfAttackToldToPerform) == int(21))
                {
                    // End:0x573
                    if(LPVSFuturePlayerPawn(EnemyForAttack) != none)
                    {
                        CurrentAttackCmd = Outer.CmdRamAttackFvs(EnemyForAttack, 1, 1, float(Outer.DefenderPawn.HealthMax + 1), float(Outer.DefenderPawn.HealthMax + 1), none, Outer.CmdStatus_Strike, 1);                        
                    }
                    else
                    {
                        CurrentAttackCmd = Outer.CmdRamAttackVs(EnemyForAttack, 1, 1, float(Outer.DefenderPawn.HealthMax + 1), float(Outer.DefenderPawn.HealthMax + 1), none, Outer.CmdStatus_Strike, 1);
                    }                    
                }
            }
        }
    }
    //return;    
}

function FlyAttackEnemyFromHere()
{
    super(LPAICmd_Orbit).FlyAttackEnemyFromHere();
    // End:0x63B
    if(Outer.DefenderPawn != none)
    {
        Outer.bMeleeFinished = false;
        // End:0x267
        if(int(TypeOfAttackToldToPerform) == int(2))
        {
            CurrentAttackCmd = Outer.CmdBasicRangedAttackPof(EnemyForAttack, int(Outer.DefenderPawn.TuneDataDefender.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.DefenderPawn.TuneDataDefender.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.DefenderPawn.TuneDataDefender.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.DefenderPawn.TuneDataDefender.MaxAmountOfDamageRequiredToStopAttack.GetValue(), None, None, IsThereClearLobAttackLaneFromGivenLoc, Outer.CmdStatus_Strike, 1);            
        }
        else
        {
            // End:0x47F
            if(int(TypeOfAttackToldToPerform) == int(5))
            {
                CurrentAttackCmd = Outer.CmdBasicRangedAttackPof(EnemyForAttack, int(Outer.DefenderPawn.TuneDataDefender.MinNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), int(Outer.DefenderPawn.TuneDataDefender.MaxNumberOfStrikeAttemptsWhenDirectAttack.GetValue()), Outer.DefenderPawn.TuneDataDefender.MinAmountOfDamageRequiredToStopAttack.GetValue(), Outer.DefenderPawn.TuneDataDefender.MaxAmountOfDamageRequiredToStopAttack.GetValue(), None, None, IsThereClearLobAttackLaneFromGivenLoc, Outer.CmdStatus_Strike, 1);                
            }
            else
            {
                // End:0x63B
                if(int(TypeOfAttackToldToPerform) == int(21))
                {
                    // End:0x573
                    if(LPVSFuturePlayerPawn(EnemyForAttack) != none)
                    {
                        CurrentAttackCmd = Outer.CmdRamAttackFvs(EnemyForAttack, 1, 1, float(Outer.DefenderPawn.HealthMax + 1), float(Outer.DefenderPawn.HealthMax + 1), none, Outer.CmdStatus_Strike, 1);                        
                    }
                    else
                    {
                        CurrentAttackCmd = Outer.CmdRamAttackVs(EnemyForAttack, 1, 1, float(Outer.DefenderPawn.HealthMax + 1), float(Outer.DefenderPawn.HealthMax + 1), none, Outer.CmdStatus_Strike, 1);
                    }                    
                }
            }
        }
    }
    //return;    
}

function GetSpecialMoveForLandingOnVs()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_DefenderVsLandOn';
    //return ReturnValue;    
}

function GetSpecialMoveForAttachedToVs()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x46
    if(Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx == 0)
    {
        return Class'LPSM_DefenderVSSuckingWhileMovingA';        
    }
    else
    {
        // End:0x8C
        if(Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx == 1)
        {
            return Class'LPSM_DefenderVSSuckingWhileMovingB';            
        }
        else
        {
            // End:0xD3
            if(Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx == 2)
            {
                return Class'LPSM_DefenderVSSuckingWhileMovingC';                
            }
            else
            {
                return Class'LPSM_DefenderVSSucking';
            }
        }
    }
    //return ReturnValue;    
}

function IsDoingLandingOrAttachedToVSSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class SM;

    SM = GetSpecialMoveForLandingOnVs();
    // End:0x67
    if((SM != none) && Outer.DefenderPawn.IsDoingSpecialMove_OF_Class(SM))
    {
        return true;
    }
    SM = GetSpecialMoveForAttachedToVs();
    // End:0xCE
    if((SM != none) && Outer.DefenderPawn.IsDoingSpecialMove_OF_Class(SM))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function ConditionalAbortAttachToVS()
{
    // End:0x26
    if(Outer.DefenderPawn == none)
    {
        return;
    }
    EnemyVS.AIResDefenderVS.ReleaseSlot(Outer.DefenderPawn);
    Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx = -1;
    // End:0xC2
    if(!IsDoingLandingOrAttachedToVSSpecialMove())
    {
        return;
    }
    // End:0xFB
    if(Outer.DefenderPawn.Health > 0)
    {
    }
    Outer.DefenderPawn.EndCurrentSpecialMove();
    //return;    
}

function ConditionalReleaseVSAttachSlot()
{
    // End:0x61
    if((Outer.DefenderPawn == none) || Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx < 0)
    {
        return;
    }
    // End:0x70
    if(IsDoingLandingOrAttachedToVSSpecialMove())
    {
        return;
    }
    EnemyVS.AIResDefenderVS.ReleaseSlot(Outer.DefenderPawn);
    Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx = -1;
    EnemyVS.NotifyDefenderCountChanged();
    //return;    
}

state AttachToRig
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        StopPocessLookForAttackOpportunityTimer();
        Outer.NotifyCombatManagerToRetractAllOptionsForThisPublisher();
        super(SPStateObject).BeginState(PreviousStateName);
        //return;        
    }

    event PushedState()
    {
        StopPocessLookForAttackOpportunityTimer();
        Outer.NotifyCombatManagerToRetractAllOptionsForThisPublisher();
        super(SPStateObject).PushedState();
        //return;        
    }

    function EndState()
    {
        local /*0x97E50000-0x00000000*/ private name NextStateName[8388609];

        Outer.ClearTimer('TimerUpdateDestination', self);
        ConditionalReleaseVSAttachSlot();
        ScriptTrace();
        //return;        
    }

    event PoppedState()
    {
        Outer.ClearTimer('TimerUpdateDestination', self);
        ConditionalReleaseVSAttachSlot();
        super(SPStateObject).PoppedState();
        //return;        
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

    function CanFollowerBeGivingThisTypeOfAttack()
    {
        local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    function ManeuverToVsAttackSlot()
    {
        local /*0x97E50000-0x00000000*/ private float ReachDistance;
        local /*0x97E50000-0x00000000*/ private @NULL SocketLocation, SocketRotation;

        EnemyForAttack.Mesh.GetSocketWorldLocationAndRotation(EnemyVS.AIResDefenderVS.AttackSlots[Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx].Sockets.StartSocketName, SocketLocation, SocketRotation);
        Outer.SetTimer(0.4000000, true, 'TimerUpdateDestination', self);
        ReachDistance = 100.0000000;
        MoveToPositionFlyCmd = Outer.CmdMoveToPositionFly(SocketLocation, EnemyForAttack, ReachDistance, Outer.CmdStatus_MoveToPosition, 1, 1);
        MoveToPositionFlyCmd.bZeroVelocityOnFinish = true;
        //return;        
    }

    function TimerUpdateDestination()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SocketLocation, SocketRotation;

        EnemyForAttack.Mesh.GetSocketWorldLocationAndRotation(EnemyVS.AIResDefenderVS.AttackSlots[Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx].Sockets.StartSocketName, SocketLocation, SocketRotation);
        MoveToPositionFlyCmd.SetDesiredDestination(SocketLocation);
        //return;        
    }
Begin:

    Outer.ReleaseAdHocSquadMgrAccess();
    ManeuverToVsAttackSlot();
    MoveToPositionFlyCmd = none;
    Outer.ClearTimer('TimerUpdateDestination', self);
    SetInterruptible(false);
    Outer.PawnZeroVelocity();
    Outer.CmdSpecialMove(GetSpecialMoveForLandingOnVs(), true, 0.0000000, -1.0000000, 1, EnemyForAttack);
    Outer.NotifyCombatManagerOfAttackCompleted(13, false, false, true);
    Outer.CmdSpecialMove(GetSpecialMoveForAttachedToVs(), true, 0.0000000, -1.0000000,, EnemyForAttack);
    stop;                    
}
