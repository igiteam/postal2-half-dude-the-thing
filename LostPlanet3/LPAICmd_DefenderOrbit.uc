class LPAICmd_DefenderOrbit extends LPAICmd_Orbit within LPAIControllerDefender;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL FormationMeleeAccess;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoneLaunchingFromHiveCell;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLaunchingFromHiveCellStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumOfLaunchAnimToPlayed;

// Export ULPAICmd_DefenderOrbit::execProcessLookForAttackOpportunity(FFrame&, void* const)
native function ProcessLookForAttackOpportunity()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

function Pushed()
{
    JoinAdHocSquad();
    bDoneLaunchingFromHiveCell = false;
    TimeLaunchingFromHiveCellStarted = -1.0000000;
    NumOfLaunchAnimToPlayed = 0;
    super.Pushed();
    // End:0xE3
    if((Outer.DefenderPawn.PawnThatLaunchedMe != none) && Outer.DefenderPawn.TargetPawnGivenByLauncher != none)
    {
        Outer.AIObjectiveManager.EnableTicking(false);
    }
    //return;    
}

function Popped()
{
    // End:0xCF
    if(((Outer.DefenderPawn != none) && Outer.DefenderPawn.Health > 0) && Outer.DefenderPawn.PawnThatLaunchedMe != none)
    {
        Outer.AIObjectiveManager.EnableTicking(true);
    }
    Outer.ReleaseOrbitAccess();
    Outer.ReleaseAdHocSquadMgrAccess();
    Outer.ReleaseStrikeAccess();
    super.Popped();
    //return;    
}

function Resumed()
{
    local /*0x97E50000-0x00000000*/ private name OldCommandName[8388609];

    super.Resumed(OldCommandName);
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

function GetMinAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetMaxAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return GetDefaultAttackRange();
    //return ReturnValue;    
}

function GetDefaultAttackRange()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return Outer.DefenderPawn.TuneDataDefender.DefaultStrikeRange;
    //return ReturnValue;    
}

function GetStrikeAccess()
{
    local /*0x97E50000-0x00000000*/ private @NULL TheEnemy[8388609];
    local /*0x97E50000-0x00000000*/ private float RevokeTolerance[9437185];
    local /*0x97E50000-0x00000000*/ private bool bForced[9437185];

    -1.0000000
    false
    super(LPAICommand).GetStrikeAccess(TheEnemy, RevokeTolerance, bForced);
    Outer.LockStrikeAccess(false);
    //return;    
}

function SetOrbitExtents()
{
    // End:0x89
    if(Outer.ShouldUseOrbitResource())
    {
        EnemyForAttack.AIResourceManager.GetResourceLocationExtents(Outer.OrbitResourceName, OrbitPatternCenter, OrbitPatternRadius);        
    }
    else
    {
        super.SetOrbitExtents();
    }
    //return;    
}

function ShouldAbortFlee()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    GetStrikeAccess(EnemyForAttack);
    return Outer.HaveStrikeAccess() && HasAttackWaitTimerExpired();
    //return ReturnValue;    
}

function OnEngagementAttackOptionPurged()
{
    local /*0x97E50000-0x00000000*/ private byte TypeOfAttack[8388609];

    ResetFindRangedFireCounters();
    LastTimeFoundValidEngagementFullPhysicalAttack = -1.0000000;
    LastTimeFoundValidEngagementRamAttack = -1.0000000;
    //return;    
}

function ShouldStillAttackEvenAfterLosingOrbitAccess()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function ShouldTryRamAttack()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float timeSinceFindingValidPhysicalAttackOption, howOfftenToRestartSearchingForValidAttackOptions;
    local /*0x97E50000-0x00000000*/ private editfixedsize array losIgnoreActors, losIgnoreActorsClasses;

    // End:0x30
    if(Outer.bBonzi)
    {
        OnEngagementAttackOptionApproved(21);
        return false;
    }
    // End:0x81
    if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedRamAttack)
    {
        return true;        
    }
    else
    {
        // End:0xD2
        if(Outer.MedFlyerPawn.TuneDataMedFlyer.bNotAllowedToRamAttack)
        {
            return false;            
        }
        else
        {
            // End:0x123
            if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedRangeLobAttack)
            {
                return false;                
            }
            else
            {
                // End:0x174
                if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedRangeLobAttack)
                {
                    return false;                    
                }
                else
                {
                    // End:0x1C5
                    if(Outer.MedFlyerPawn.TuneDataMedFlyer.bDoOnlyForcedFullPhysicalAttack)
                    {
                        return false;                        
                    }
                    else
                    {
                        // End:0x1F5
                        if(Outer.WantsToDoStruggleMode(EnemyForAttack))
                        {
                            return false;                            
                        }
                        else
                        {
                            // End:0x243
                            if(Outer.MedFlyerPawn.TuneDataMedFlyer.bForceFlyerNotToAttack)
                            {
                                return false;
                            }
                        }
                    }
                }
            }
        }
    }
    howOfftenToRestartSearchingForValidAttackOptions = Outer.GetHowOfftenToRestartSearchingForValidAttackOptions();
    timeSinceFindingValidPhysicalAttackOption = Outer.WorldInfo.TimeSeconds - LastTimeFoundValidEngagementRamAttack;
    // End:0x5C2
    if(timeSinceFindingValidPhysicalAttackOption > howOfftenToRestartSearchingForValidAttackOptions)
    {
        Outer.EndOfLastRamStrikeLane = EnemyForAttack.Location;
        Outer.StartOfLastRamStrikeLane = Outer.DefenderPawn.Location;
        losIgnoreActors.AddItem(Outer.DefenderPawn);        
        losIgnoreActors.AddItem(EnemyForAttack);        
        losIgnoreActorsClasses.AddItem(Class'LPAIPawnMedFlyer');        
        Outer.bAbleToPerformRameStrikeAtLastCheck = Outer.LosTestForAttackLane(Outer.StartOfLastRamStrikeLane, Outer.EndOfLastRamStrikeLane, Outer.DefenderPawn.TuneDataDefender.RadiusOfCheckForRamAttackLane.GetValue(), Outer.DefenderPawn.TuneDataDefender.RadiusOfCheckForRamAttackLane.GetValue(), Outer.LocationOfRamStrikeLaneBlockage, losIgnoreActors, losIgnoreActorsClasses, Outer.RamStrikeLaneBlockageImpactInfo);
        // End:0x5BF
        if(Outer.HasCurrentOrbitCombatMgrResourceRef())
        {
            // End:0x5BC
            if(Outer.bAbleToPerformRameStrikeAtLastCheck)
            {
                LastTimeFoundValidEngagementRamAttack = Outer.WorldInfo.TimeSeconds;
                return true;                
            }            
        }        
    }
    return false;
    //return ReturnValue;    
}

function SetFocalPointForHiveLaunch()
{
    Outer.SetFocalPoint(Outer.Pawn.Location + (Vector(Outer.Pawn.Rotation) * float(5000)), false);
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

function StartLaunchFromHive()
{
    bDoneLaunchingFromHiveCell = false;
    TimeLaunchingFromHiveCellStarted = Outer.WorldInfo.TimeSeconds;
    Outer.Focus = none;
    SetFocalPointForHiveLaunch();
    Outer.DefenderPawn.PawnThatLaunchedMe.LaunchedPawnCreateParticleSystem(Outer.DefenderPawn.CellIdLaunchedFrom);
    Outer.DefenderPawn.DoSpecialMove(GetLaunchFromHiveSM(), true, true, On_DefenderLaunchFromHiveCell_Finished);
    //return;    
}

function On_DefenderLaunchFromHiveCell_Finished()
{
    local /*0x97E50000-0x00000000*/ private @NULL FinishedSM[8388609], NextSM;

    ++NumOfLaunchAnimToPlayed;
    // End:0x6F
    if(NumOfLaunchAnimToPlayed < 1)
    {
        Outer.DefenderPawn.DoSpecialMove(GetLaunchFromHiveSM(), true, true, On_DefenderLaunchFromHiveCell_Finished);        
    }
    else
    {
        Outer.Focus = EnemyForAttack;
        bDoneLaunchingFromHiveCell = true;
        // End:0x125
        if(Outer.DefenderPawn.TuneDataDefender.bNoWorldCollisionAtLaunch)
        {
            Outer.DefenderPawn.bCollideWorld = true;
        }
    }
    //return;    
}

function IsDoneWithLaunch()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float durationOfAction;

    // End:0x0F
    if(bDoneLaunchingFromHiveCell)
    {
        return true;
    }
    durationOfAction = Outer.WorldInfo.TimeSeconds - TimeLaunchingFromHiveCellStarted;
    // End:0x6C
    if(durationOfAction > 5.0000000)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function @NULL HandleRunningIntoCurrentEnemy()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, newVelToDefender;

    // End:0x250
    if(Other != none)
    {
        // End:0x26
        if(StaticStalkStarted)
        {
            StopAreaDependentStalk();
        }
        // End:0x5E
        if(CurrentAttackCmd != none)
        {
            Outer.AbortCommand(CurrentAttackCmd);
        }
        newVelToDefender = Normal(Outer.DefenderPawn.Location - Other.Location);
        newVelToDefender.Z = 0.0000000;
        newVelToDefender = newVelToDefender * Outer.DefenderPawn.TuneDataDefender.MomentumFactorToThisTypeOfPawnFromFastVsKnockBackHit.GetValue();
        Outer.DefenderPawn.SetExternalVelocity(newVelToDefender);
        CurrentAttackCmd = none;
        StopPocessLookForAttackOpportunityTimer();
        Outer.NotifyCombatManagerToRetractAllOptionsForThisPublisher();
        Outer.ClosestEnemyFoundForReactiveAttack = EnemyForAttack;
        Outer.LastTimeVsRanIntoMe = Outer.WorldInfo.TimeSeconds;
        GotoStateWithEnemyCheck('FlyerReactionPhysicalAttack');
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, myChildCommand;

    // End:0x58
    if((Other == EnemyForAttack) && Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx != -1)
    {
        return;
    }
    // End:0xCE
    if((LPAICmd_DefenderRamAttackBase(CurrentAttackCmd) == none) && Outer.IsThisAnActorThatCanCauseBehaviorChangeOnBump(Other))
    {
        HandleRunningIntoCurrentEnemy(Other, OtherComp, HitLocation, HitNormal);        
    }
    else
    {
        myChildCommand = LPAICommand(ChildCommand);
        // End:0x13C
        if(myChildCommand != none)
        {
            myChildCommand.Touch(Other, OtherComp, HitLocation, HitNormal);
        }
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal, myChildCommand;

    // End:0x58
    if((Other == EnemyForAttack) && Outer.DefenderPawn.LandOnVsAttackSlotSocketIdx != -1)
    {
        return;
    }
    // End:0xF8
    if((LPAICmd_DefenderRamAttackBase(CurrentAttackCmd) == none) && Outer.IsThisAnActorThatCanCauseBehaviorChangeOnBump(Other))
    {
        HandleRunningIntoCurrentEnemy(Other, OtherComp, Outer.DefenderPawn.Location, HitNormal);        
    }
    else
    {
        myChildCommand = LPAICommand(ChildCommand);
        // End:0x15D
        if(myChildCommand != none)
        {
            myChildCommand.Bump(Other, OtherComp, HitNormal);
        }
    }
    //return;    
}

function FleeFromEnemy()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array FleeFrom;
    local /*0x97E50000-0x00000000*/ private @NULL Cmd;
    local /*0x97E50000-0x00000000*/ private float FleeDistance;

    FleeDistance = Outer.DefenderPawn.TuneDataDefender.FleeDistance.GetValue();
    FleeFrom.AddItem(EnemyForAttack);    
    Cmd = Outer.CmdFlee(60.0000000, FleeDistance * float(10), FleeDistance, FleeFrom, 1);
    Cmd.__FleeAbortDelegate__Delegate = ShouldAbortFlee;
    //return;    
}

state StateCmdActive
{
    function BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousState[8388609];

        super.BeginState(PreviousState);
        //return;        
    }
Begin:

    Outer.SetAttackResourceNames();
    SetOrbitExtents();
    // End:0x99
    if(Outer.DefenderPawn.bNeedsLaunchedFromCarrierCell)
    {
        StartLaunchFromHive();
        J0x6A:

        // End:0x99 [Loop If]
        if(!IsDoneWithLaunch())
        {
            Outer.Sleep(0.0100000);
            // [Loop Continue]
            goto J0x6A;
        }
    }
    Outer.DefenderPawn.CheckStartDieDoT();
    Outer.DefenderPawn.SetCollision(true, true);
    J0xFD:

    // End:0x195 [Loop If]
    if(IsMyEnemyAlive())
    {
        // End:0x184
        if(Outer.AmAdHocSquadLeader())
        {
            // End:0x184
            if(!Outer.HaveOrbitAccess())
            {
                Outer.GetOrbitAccess(EnemyForAttack);
                SetOrbitExtents();
            }
        }
        GotoState('MoveCloserToEnemysOrbit');
        // [Loop Continue]
        goto J0xFD;
    }
    Outer.PopCommand(self);
    stop;            
}

state WaitForOrbitClearence
{Begin:

    Outer.PawnZeroVelocity();
    FleeFromEnemy();
    GotoStateWithEnemyCheck('GetOrbitFormationClearence');
    stop;                
}

defaultproperties
{
    MinAttackRange=100.0000000
    MaxAttackRange=150.0000000
}