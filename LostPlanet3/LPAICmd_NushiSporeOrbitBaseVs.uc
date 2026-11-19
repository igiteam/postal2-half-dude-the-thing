class LPAICmd_NushiSporeOrbitBaseVs extends LPAICmd_NushiSporeOrbit within LPAIControllerNushiSpore;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EnemyVS;

function Pushed()
{
    Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx = -1;
    super.Pushed();
    //return;    
}

function Popped()
{
    // End:0xEA
    if((Outer.NushiSporePawn != none) && Outer.NushiSporePawn.LandOnVsAttackSlotSocketIdx >= 0)
    {
        EnemyVS.AIResNushiSporeVS.ReleaseSlot(Outer.NushiSporePawn);
        Outer.NushiSporePawn.LandOnVsAttackSlotSocketIdx = -1;
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

function ShouldTryFullPhysicalAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeSinceFindingValidPhysicalAttackOption, howOfftenToRestartSearchingForValidAttackOptions;
    local /*0x97E50000-0x00000000*/ private @NULL targetsLocation;

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
    // End:0x36B
    if(timeSinceFindingValidPhysicalAttackOption > howOfftenToRestartSearchingForValidAttackOptions)
    {
        targetsLocation = EnemyForAttack.Location;
        // End:0x36B
        if(Outer.IsLandOnAttackAsReplacementForFullPhysicalAttackAllowed() && Outer.CanFlyToThisLocation(targetsLocation, Outer.MedFlyerPawn.TuneDataMedFlyer.MaxRangeForMovementNodeToFindForSwoopStingStrike.GetValue()))
        {
            // End:0x36B
            if(EnemyVS.AIResNushiSporeVS.IsThereFreeAttackSlot())
            {
                LastTimeFoundValidEngagementFullPhysicalAttack = Outer.WorldInfo.TimeSeconds;
                return true;
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
    // End:0x1DC
    if(HasAccessToStartAttackFromOrbitSlot())
    {
        AttackSlotIdx = EnemyVS.AIResNushiSporeVS.GetFreeAttackSlot(Outer.DefenderPawn);
        // End:0xD6
        if(AttackSlotIdx != -1)
        {
            Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx = AttackSlotIdx;            
        }
        else
        {
            return false;
        }
        // End:0x11B
        if(MoveToPositionFlyCmd != none)
        {
            Outer.AbortCommand(MoveToPositionFlyCmd);
            MoveToPositionFlyCmd = none;
        }
        // End:0x15E
        if(CurMoveToActorCmd != none)
        {
            Outer.AbortCommand(CurMoveToActorCmd);
            CurMoveToActorCmd = none;
        }
        // End:0x1A1
        if(CurrentAttackCmd != none)
        {
            Outer.AbortCommand(CurrentAttackCmd);
            CurrentAttackCmd = none;
        }
        // End:0x1B8
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

function AttackEnemyFromOrbitSlot()
{
    super(LPAICmd_Orbit).AttackEnemyFromOrbitSlot();
    // End:0x20B
    if(Outer.NushiSporePawn != none)
    {
        Outer.bMeleeFinished = false;
        // End:0x20B
        if(int(TypeOfAttackToldToPerform) == int(21))
        {
            // End:0x143
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
    //return;    
}

function FlyAttackEnemyFromHere()
{
    super(LPAICmd_Orbit).FlyAttackEnemyFromHere();
    // End:0x20B
    if(Outer.NushiSporePawn != none)
    {
        Outer.bMeleeFinished = false;
        // End:0x20B
        if(int(TypeOfAttackToldToPerform) == int(21))
        {
            // End:0x143
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
    //return;    
}

function GetSpecialMoveForLandingOnVs()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    return Class'LPSM_NushiSporeVsLandOn';
    //return ReturnValue;    
}

function GetSpecialMoveForAttachedToVs()
{
    local /*0x97E50000-0x00000000*/ private class ReturnValue[92274689];

    // End:0x46
    if(Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx == 0)
    {
        return Class'LPSM_NushiSporeVSSuckingWhileMovingA';        
    }
    else
    {
        // End:0x8C
        if(Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx == 1)
        {
            return Class'LPSM_NushiSporeVSSuckingWhileMovingB';            
        }
        else
        {
            // End:0xD3
            if(Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx == 2)
            {
                return Class'LPSM_NushiSporeVSSuckingWhileMovingC';                
            }
            else
            {
                return Class'LPSM_NushiSporeVSSucking';
            }
        }
    }
    //return ReturnValue;    
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
        EnemyVS.AIResNushiSporeVS.ReleaseSlot(Outer.NushiSporePawn);
        Outer.NushiSporePawn.LandOnVsAttackSlotSocketIdx = -1;
        //return;        
    }

    event PoppedState()
    {
        Outer.ClearTimer('TimerUpdateDestination', self);
        EnemyVS.AIResNushiSporeVS.ReleaseSlot(Outer.DefenderPawn);
        Outer.NushiSporePawn.LandOnVsAttackSlotSocketIdx = -1;
        super(SPStateObject).PoppedState();
        //return;        
    }

    function ManeuverToVsAttackSlot()
    {
        local /*0x97E50000-0x00000000*/ private float ReachDistance;
        local /*0x97E50000-0x00000000*/ private @NULL SocketLocation, SocketRotation;

        EnemyForAttack.Mesh.GetSocketWorldLocationAndRotation(EnemyVS.AIResNushiSporeVS.AttackSlots[Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx].Sockets.StartSocketName, SocketLocation, SocketRotation);
        Outer.SetTimer(0.4000000, true, 'TimerUpdateDestination', self);
        ReachDistance = 100.0000000;
        MoveToPositionFlyCmd = Outer.CmdMoveToPositionFly(SocketLocation, EnemyForAttack, ReachDistance, Outer.CmdStatus_MoveToPosition, 1, 1);
        MoveToPositionFlyCmd.bZeroVelocityOnFinish = true;
        //return;        
    }

    function TimerUpdateDestination()
    {
        local /*0x97E50000-0x00000000*/ private @NULL SocketLocation, SocketRotation;

        EnemyForAttack.Mesh.GetSocketWorldLocationAndRotation(EnemyVS.AIResNushiSporeVS.AttackSlots[Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx].Sockets.StartSocketName, SocketLocation, SocketRotation);
        MoveToPositionFlyCmd.SetDesiredDestination(SocketLocation);
        //return;        
    }
Begin:

    ManeuverToVsAttackSlot();
    MoveToPositionFlyCmd = none;
    Outer.ClearTimer('TimerUpdateDestination', self);
    SetInterruptible(false);
    Outer.PawnZeroVelocity();
    Outer.CmdSpecialMove(GetSpecialMoveForLandingOnVs(), true, 0.0000000, -1.0000000, 1, EnemyForAttack);
    Outer.NotifyCombatManagerOfAttackCompleted(13, false, false, true);
    Outer.CmdSpecialMove(GetSpecialMoveForAttachedToVs(), true, 0.0000000, -1.0000000);
    stop;                
}
