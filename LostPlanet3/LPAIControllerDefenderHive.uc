class LPAIControllerDefenderHive extends LPAIControllerCarrier
    config(AI)
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DefenderHivePawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTimeLaunchedDefender[536870913];

event Possess()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private bool bVehicleTransition[8388609];

    super.Possess(inPawn, bVehicleTransition);
    DefenderHivePawn = LPAIPawnDefenderHive(inPawn);
    SetUpPawnsProxyInfo();
    //return;    
}

event UnPossess()
{
    super.UnPossess();
    //return;    
}

event Destroyed()
{
    super.Destroyed();
    //return;    
}

function SetUpPawnsProxyInfo()
{
    local /*0x97E50000-0x00000000*/ private @NULL spawnAction;
    local /*0x97E50000-0x00000000*/ private int iter;

    // End:0x328
    if((DefenderHivePawn != none) && DefenderHivePawn.SpawnedFromActorFactory != none)
    {
        spawnAction = LPSeqAct_ActorFactoryEx(DefenderHivePawn.SpawnedFromActorFactory.Outer);
        // End:0x328
        if(spawnAction != none)
        {
            iter = 0;
            J0x95:

            // End:0x328 [Loop If]
            if(iter < spawnAction.SpawnPoints.Length)
            {
                // End:0x31A
                if(LPPawnSpawnLocationMeshProxy_DefHive(spawnAction.SpawnPoints[iter]) != none)
                {
                    DefenderHivePawn.MyProxy = LPPawnSpawnLocationMeshProxy_DefHive(spawnAction.SpawnPoints[iter]);
                    DefenderHivePawn.AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce = DefenderHivePawn.MyProxy.AbsoluteMaxNumberOfLaunchedDefendersAllowedToHaveAliveAtOnce;
                    // End:0x228
                    if(DefenderHivePawn.MyProxy.DelayAfterLastLaunchToAllowAnotherLaunchOverRide > float(0))
                    {
                        DefenderHivePawn.DelayAfterLastLaunchToAllowAnotherLaunch = DefenderHivePawn.MyProxy.DelayAfterLastLaunchToAllowAnotherLaunchOverRide;
                    }
                    // End:0x2A0
                    if(DefenderHivePawn.MyProxy.MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch > float(0))
                    {
                        MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch = DefenderHivePawn.MyProxy.MinDelayBeforeProtectingCellsAfterNormalDefenderLaunch;
                    }
                    // End:0x318
                    if(DefenderHivePawn.MyProxy.MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch > float(0))
                    {
                        MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch = DefenderHivePawn.MyProxy.MaxDelayBeforeProtectingCellsAfterNormalDefenderLaunch;
                    }
                    return;
                }
                ++iter;
                // [Loop Continue]
                goto J0x95;
            }
        }
    }
    //return;    
}

function NotifyLaunchedPawnDown()
{
    local /*0x97E50000-0x00000000*/ private @NULL DefenderGoingDown[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPawnJustRemovedFromLaunchedList[8388609];

    super.NotifyLaunchedPawnDown(DefenderGoingDown, bPawnJustRemovedFromLaunchedList);
    //return;    
}

function LaunchDefenderFromCell()
{
    local /*0x97E50000-0x00000000*/ private bool bIntendedLaunch[8388609];
    local /*0x97E50000-0x00000000*/ private int IndexOfDefenderToLaunch[8388609], CellToLaunchFrom;
    local /*0x97E50000-0x00000000*/ private float MinDelayBeforeProtecting[8388609], MaxDelayBeforeProtecting;
    local /*0x97E50000-0x00000000*/ private @NULL PawnToLauchAt[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x6E
    if(super.LaunchDefenderFromCell(bIntendedLaunch, IndexOfDefenderToLaunch, CellToLaunchFrom, MinDelayBeforeProtecting, MaxDelayBeforeProtecting, PawnToLauchAt))
    {
        LastTimeLaunchedDefender = WorldInfo.TimeSeconds;
        return true;
    }
    return false;
    //return ReturnValue;    
}

event NotifyOfCoreHit()
{
    local /*0x97E50000-0x00000000*/ private int HitCoreIndex[8388609];
    local /*0x97E50000-0x00000000*/ private float AmountOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private class TypeOfDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL curCommand;
    local /*0x97E50000-0x00000000*/ private bool bcommandSaysItWillHandleThisCoreHit, bgrenadeActualHandled;

    // End:0x26
    if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
    {
        bgrenadeActualHandled = false;        
    }
    else
    {
        bgrenadeActualHandled = true;
    }
    bcommandSaysItWillHandleThisCoreHit = false;
    curCommand = LPAICommand(CommandList);
    J0x5A:

    // End:0x109 [Loop If]
    if(curCommand != none)
    {
        // End:0xD5
        if(curCommand.NotifyOfCoreHit(HitCoreIndex, AmountOfDamage, TypeOfDamage))
        {
            // End:0xC9
            if(TypeOfDamage == Class'LPDamageTypeGrenadeActual')
            {
                bgrenadeActualHandled = true;
            }
            bcommandSaysItWillHandleThisCoreHit = true;
        }
        curCommand = LPAICommand(curCommand.ChildCommand);
        // [Loop Continue]
        goto J0x5A;
    }
    // End:0x20C
    if(!bcommandSaysItWillHandleThisCoreHit && TypeOfDamage == Class'LPDamageTypeGrenadeActual')
    {
        // End:0x20C
        if(DefenderHivePawn.MyCoreData.Length >= HitCoreIndex)
        {
            // End:0x20C
            if(DefenderHivePawn.IsThisCoreAStickGrenadeToCore(DefenderHivePawn.MyCoreData[HitCoreIndex].CoreID))
            {
                bgrenadeActualHandled = true;
                ReactToGrenadeGettingStuckToThisCore(DefenderHivePawn.MyCoreData[HitCoreIndex].CoreID);
            }
        }
    }
    // End:0x27A
    if(!bgrenadeActualHandled)
    {
        curCommand = LPAICommand(CommandList);
        J0x237:

        // End:0x27A [Loop If]
        if(curCommand != none)
        {
            curCommand = LPAICommand(curCommand.ChildCommand);
            // [Loop Continue]
            goto J0x237;
        }
    }
    //return;    
}

function ReactToGrenadeGettingStuckToThisCore()
{
    local /*0x97E50000-0x00000000*/ private int CoreGettingHit[8388609];

    DefenderHivePawn.CurrentCoreGrenadeExplodingAttachedTo = CoreGettingHit;
    SetTimer(DefenderHivePawn.TuneDataDefenderHive.DelayAfterGrenadeGoesIntoCellBeforeStartingExplosion.GetValue(), false, 'StartInternalGrenadeCoreExplosionFromStoredData', self);
    //return;    
}

function StartInternalGrenadeCoreExplosionFromStoredData()
{
    DefenderHivePawn.AttachedGrenadeJustExploded(DefenderHivePawn.CurrentCoreGrenadeExplodingAttachedTo);
    //return;    
}

function NotfiyAllCellsDestoryedAndNeedsToExplosePrimaryCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL PawnKilledLastCell[8388609];

    DefenderHivePawn.TakeDamage(DefenderHivePawn.HealthMax + 10000000, DefenderHivePawn.TakeDamageParams.InstigatedBy, DefenderHivePawn.Location, Normal(DefenderHivePawn.Velocity), Class'LPDamageTypeForced');
    //return;    
}

function CmdLaunchDefendersPof()
{
    local /*0x97E50000-0x00000000*/ private @NULL Enemy2Engage[8388609], CmdStatus;
    local /*0x97E50000-0x00000000*/ private byte CmdOption[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], myCommand;

    CmdStatus_Strike
    0
    // End:0x3B
    if(int(CmdOption) == int(0))
    {
        AbortCommand(CommandList);
    }
    Class'LPAICmd_DefenderHiveLaunchDefenders'.static.InitCommand(self);
    myCommand = LPAICmd_DefenderHiveLaunchDefenders(GetActiveCommand());
    // End:0xD7
    if(myCommand != none)
    {
        myCommand.SetReturnCmdStatus(CmdStatus);
        myCommand.SetDesiredEnemy(Enemy2Engage);
    }
    return myCommand;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPAICmdStatus_MoveToPosition'Default__LPAIControllerDefenderHive.LPAICmdStatus_MoveToPosition0'
    begin object name=LPAICmdStatus_MoveToPosition0
    end object
    CmdStatus_MoveToPosition=LPAICmdStatus_MoveToPosition0
    // Reference: LPAICmdStatus_MoveToActor'Default__LPAIControllerDefenderHive.LPAICmdStatus_MoveToActor0'
    begin object name=LPAICmdStatus_MoveToActor0
    end object
    CmdStatus_MoveToActor=LPAICmdStatus_MoveToActor0
    // Reference: LPAICmdStatus_Stunned'Default__LPAIControllerDefenderHive.LPAICmdStatus_Stunned0'
    begin object name=LPAICmdStatus_Stunned0
    end object
    CmdStatus_Stunned=LPAICmdStatus_Stunned0
    // Reference: LPAICmdStatus_Strike'Default__LPAIControllerDefenderHive.LPAICmdStatus_Strike0'
    begin object name=LPAICmdStatus_Strike0
    end object
    CmdStatus_Strike=LPAICmdStatus_Strike0
    // Reference: LPAICmdStatus_Attack'Default__LPAIControllerDefenderHive.LPAICmdStatus_Attack0'
    begin object name=LPAICmdStatus_Attack0
    end object
    CmdStatus_Attack=LPAICmdStatus_Attack0
    // Reference: LPAdHocSquadMemberData'Default__LPAIControllerDefenderHive.LPAdHocSquadMemberDataD0'
    begin object name=LPAdHocSquadMemberDataD0
    end object
    MyAdHocSquadMemberData=LPAdHocSquadMemberDataD0
    // Reference: SPAIReactionManager'Default__LPAIControllerDefenderHive.ReactionManager0'
    begin object name=ReactionManager0
    end object
    ReactionManager=ReactionManager0
    // Reference: LPAIObjectiveManager'Default__LPAIControllerDefenderHive.LPAIObjectiveManager0'
    begin object name=LPAIObjectiveManager0
    end object
    AIObjectiveManager=LPAIObjectiveManager0
    Components[0]=LPAIObjectiveManager0
}