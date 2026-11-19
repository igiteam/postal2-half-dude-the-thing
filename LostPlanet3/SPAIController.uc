class SPAIController extends SPBaseAIController
    config(AI)
    hidecategories(AnimDependency,Navigation);

const MaxRating = 9999999.9;

enum EAlertStatus
{
    ALS_Relaxed,                    // 0
    ALS_Investigate,                // 1
    ALS_Alert,                      // 2
    ALS_MAX                         // 3
};

enum SPCmdStackClearOption
{
    SPCmdStackClear,                // 0
    SPCmdStackKeep,                 // 1
    SPCmdStackClearOption_MAX       // 2
};

enum SPCmdTurnOption
{
    SPCmdTurn_AlwaysTurn,           // 0
    SPCmdTurn_OnlyTurnIfAnimationNeeded,// 1
    SPCmdTurn_MAX                   // 2
};

struct native LocalEnemyInfo
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bVisible;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bSeenLastFrame;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Pawn;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float InitialVisibleTime;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float LastVisibleTime;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL AsyncVisibleLocation;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float LastFailedPathTime;

    structdefaultproperties
    {
        bVisible=false
        bSeenLastFrame=false
        Pawn=none
        InitialVisibleTime=0.0000000
        LastVisibleTime=0.0000000
        AsyncVisibleLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        LastFailedPathTime=0.0000000
    }
};

struct native TargetInfo
{
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Actor;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Location;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL Rotation;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float LastSeenTime;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float LastDamageTime;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float RecentDamageDone;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float PathNotValidTime;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float LastAttackTime;
    var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float LastAttackCost;

    structdefaultproperties
    {
        Actor=none
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        LastSeenTime=-1.0000000
        LastDamageTime=-1.0000000
        RecentDamageDone=0.0000000
        PathNotValidTime=-1.0000000
        LastAttackTime=-1.0000000
        LastAttackCost=0.0000000
    }
};

var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL MySPPawn;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private class DefaultCombatCommand;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private class MeleeCommand;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private editfixedsize @NULL ReactionManager[524289];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private editfixedsize array DefaultReactConditions[524289];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array DefaultReactConditionClasses;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bAllowCombatTransitions;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bDeleteWhenStale;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bIgnoreSquadPosition;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bDisableAI;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bAllowDamageWhenDisableAI;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private bool bUseSquad;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL EngagementTarget;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float TargetAquisitionTime;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array TargetList;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array SmartActorList;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL ForcedWeapon;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private byte AlertStatus;
var(__NotifyAccessLostDelegate__Delegate) /*0x05090000-0x00000000*/ private float StaleTimeout[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private editfixedsize array LocalEnemyList;
var(__NotifyAccessLostDelegate__Delegate) /*0x05090000-0x00000000*/ private float EnemyDamageMemoryTime[65537];
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float LastReceivedDamage;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float RecentDamageDone;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private float AI_NearMissDistance;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000000*/ private @NULL MyGuid;
var(__NotifyAccessLostDelegate__Delegate) /*0x03A30000-0x00000400*/ private export @NULL AIObjectiveManager[524289];

// Export USPAIController::execIgnoreNotifies(FFrame&, void* const)
native function IgnoreNotifies()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIController::execSeePlayer(FFrame&, void* const)
native event SeePlayer()
{
    local /*0x03A30000-0x00000000*/ private @NULL Seen[8388609];


}

// Export USPAIController::execSeeMonster(FFrame&, void* const)
native event SeeMonster()
{
    local /*0x03A30000-0x00000000*/ private @NULL Seen[8388609];


}

// Export USPAIController::execNotifyDidSomethingInteresting(FFrame&, void* const)
native final function NotifyDidSomethingInteresting()
{
    local /*0x03A30000-0x00000000*/ private float TimeOfInterestingThing[9437185];

    -1.0000000            
}

// Export USPAIController::execIsDestinationInsideAiMesh(FFrame&, void* const)
native function IsDestinationInsideAiMesh()
{
    local /*0x03A30000-0x00000000*/ private @NULL InDestination[25296897];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIController::execIsSPCommandOnStack(FFrame&, void* const)
native function IsSPCommandOnStack()
{
    local /*0x03A30000-0x00000000*/ private @NULL InCommand[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIController::execAddSmartActor(FFrame&, void* const)
native function AddSmartActor()
{
    local /*0x03A30000-0x00000000*/ private @NULL SmartActor[8388609];


}

// Export USPAIController::execRemoveSmartActor(FFrame&, void* const)
native function RemoveSmartActor()
{
    local /*0x03A30000-0x00000000*/ private @NULL SmartActor[8388609];


}

// Export USPAIController::execSmartActorIndex(FFrame&, void* const)
protected native function SmartActorIndex()
{
    local /*0x03A30000-0x00000000*/ private @NULL SmartActor[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPAIController::execAddMultipleSmartActor(FFrame&, void* const)
native function AddMultipleSmartActor()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array SmartActor[25296897];


}

// Export USPAIController::execRemoveMultipleSmartActor(FFrame&, void* const)
native function RemoveMultipleSmartActor()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array SmartActor[25296897];


}

// Export USPAIController::execGetTargetIndex(FFrame&, void* const)
native final function GetTargetIndex()
{
    local /*0x03A30000-0x00000000*/ private @NULL SearchActor[8388609];
    local /*0x03A30000-0x00000000*/ private int ReturnValue[92274689];


}

// Export USPAIController::execCanSeeByPoints(FFrame&, void* const)
native function CanSeeByPoints()
{
    local /*0x03A30000-0x00000000*/ private @NULL ViewLocation[8388609], TestLocation, ViewRotation;
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIController::execCanBeMyEnemy(FFrame&, void* const)
native event CanBeMyEnemy()
{
    local /*0x03A30000-0x00000000*/ private @NULL PotentialEnemy[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIController::execSetEnemy(FFrame&, void* const)
native function SetEnemy()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewEnemy[8388609];


}

// Export USPAIController::execSetWantsNewEnemy(FFrame&, void* const)
native function SetWantsNewEnemy()
{
    local /*0x03A30000-0x00000000*/ private bool bInWantsNewEnemy[8388609];


}

// Export USPAIController::execShowDebugMessage(FFrame&, void* const)
native final function ShowDebugMessage()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize string msg[8388609];
    local /*0x03A30000-0x00000000*/ private float ZOffset[9437185], Duration;
    local /*0x03A30000-0x00000000*/ private byte Red[9437185], Green, Blue;

    0.0000000
    0.0000000
    0
    0
    0                                
}

function SelectEnemy()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event Possess()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewPawn[8388609];
    local /*0x03A30000-0x00000000*/ private bool bVehicleTransition[8388609];

    super(Controller).Possess(NewPawn, bVehicleTransition);
    // End:0x106
    if(Pawn != none)
    {
        MySPPawn = SPAIPawn(NewPawn);
        // End:0x95
        if(!bVehicleTransition)
        {
            ReactionManager.Wipe();
            ReactionManager.Initialize();
        }
        // End:0xD4
        if((PlayerReplicationInfo != none) && PlayerReplicationInfo.Team == none)
        {
            SetDefaultTeam();
        }
        // End:0x106
        if((Squad == none) && bUseSquad)
        {
            SetSquadName('Alpha');
        }
    }
    //return;    
}

event SetTeam()
{
    local /*0x03A30000-0x00000000*/ private int inTeamIdx[8388609];

    super(AIController).SetTeam(inTeamIdx);
    // End:0x56
    if(((Squad == none) && bUseSquad) && Pawn != none)
    {
        SetSquadName('Alpha');
    }
    //return;    
}

function CleanUpForBeingPutBackIntoPoolOnDeath()
{
    local /*0x03A30000-0x00000000*/ private int iter;

    iter = 0;
    J0x0B:

    // End:0x83 [Loop If]
    if(iter < MySPPawn.GibStatusList.Length)
    {
        MySPPawn.GibStatusList[iter].TheGib = none;
        ++iter;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

function SetDefaultTeam()
{
    SetTeam(1);
    //return;    
}

function NotifyCommandPushed()
{
    local /*0x03A30000-0x00000000*/ private @NULL PushedCommand[8388609], SPP;

    // End:0x92
    if(!bDisableAI)
    {
        SPP = SPPawn(Pawn);
        // End:0x92
        if((SPP != none) && SPP.CurrentPlayAnimSeqAction.bIsExecutingAction)
        {
            SPP.StopExecutingPlayAnimSeqAction(true);
        }
    }
    //return;    
}

function ResourceAccessValid()
{
    local /*0x03A30000-0x00000000*/ private @NULL Access[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return (Access != none) && !Access.IsDestroyed();
    //return ReturnValue;    
}

function NotifyStartOfSpecialMove()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewMove[8388609], SPAICMD;

    super.NotifyStartOfSpecialMove(NewMove);
    SPAICMD = SPAICommand(CommandList);
    // End:0x66
    if(SPAICMD != none)
    {
        SPAICMD.NotifyStartOfSpecialMove(NewMove);
    }
    //return;    
}

function NotifyEndOfSpecialMove()
{
    local /*0x03A30000-0x00000000*/ private @NULL LastMove[8388609], SPAICMD;

    super.NotifyEndOfSpecialMove(LastMove);
    SPAICMD = SPAICommand(CommandList);
    // End:0x66
    if(SPAICMD != none)
    {
        SPAICMD.NotifyEndOfSpecialMove(LastMove);
    }
    //return;    
}

function SPAIControllerCreateCheckpointRecord()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize @NULL AICRecord[25165825], PawnRecord, SPPawnToSave, OccupiedVehicle;

    AICRecord.SavedGuid = MyGuid;
    AICRecord.TeamIndex = GetTeamNum();
    AICRecord.bAllowCombatTransitions = bAllowCombatTransitions;
    AICRecord.bAllowDamageWhenDisableAI = bAllowDamageWhenDisableAI;
    AICRecord.bDisableAI = bDisableAI;
    SPPawnToSave = SPPawn(Pawn);
    // End:0x14C
    if(SPPawnToSave == none)
    {
        OccupiedVehicle = Vehicle(Pawn);
        // End:0x14C
        if(OccupiedVehicle != none)
        {
            SPPawnToSave = SPPawn(OccupiedVehicle.Driver);
        }
    }
    // End:0x245
    if(SPPawnToSave != none)
    {
        Class'SPEngine.SPPawn'.static.SPCreatePawnCheckpointRecord(PawnRecord, SPPawnToSave, self);
        // End:0x245
        if(OccupiedVehicle != none)
        {
            PawnRecord.PawnPathName = PathName(OccupiedVehicle);
            PawnRecord.Location = OccupiedVehicle.Location;
            PawnRecord.Rotation = OccupiedVehicle.Rotation;
        }
    }
    //return;    
}

function SPAIControllerApplyCheckpointRecord()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize @NULL AICRecord[25296897], PawnRecord, ReturnValue, RestoredPawn, Veh;

    MyGuid = AICRecord.SavedGuid;
    bAllowCombatTransitions = AICRecord.bAllowCombatTransitions;
    bAllowDamageWhenDisableAI = AICRecord.bAllowDamageWhenDisableAI;
    // End:0xB3
    if(Pawn != none)
    {
        Pawn.LifeSpan = 0.1000000;
        UnPossess();
    }
    WorldInfo.Game.ChangeTeam(self, int(AICRecord.TeamIndex), false);
    RestoredPawn = SPPawn(Class'SPEngine.SPPawn'.static.SPApplyPawnCheckpointRecord(PawnRecord, none, true, self, true));
    // End:0x39A
    if(RestoredPawn != none)
    {
        GotoState('Auto');
        // End:0x2E0
        if(PawnRecord.PawnPathName != "")
        {
            Veh = Vehicle(FindObject(PawnRecord.PawnPathName, Class'Engine.Vehicle'));
            // End:0x2E0
            if(Veh != none)
            {
                RestoredPawn.SetCollision(false, false);
                RestoredPawn.bCollideWorld = false;
                RestoredPawn.SetBase(none);
                RestoredPawn.SetPhysics(0);
                Veh.SetLocation(PawnRecord.Location);
                Veh.SetRotation(PawnRecord.Rotation);
                Veh.TryToDrive(Pawn);
            }
        }
        // End:0x356
        if(PawnRecord.BasePathName != "")
        {
            Pawn.SetBase(Actor(FindObject(PawnRecord.BasePathName, Class'Engine.Actor')));
        }
        // End:0x36F
        if(MySPPawn != none)
        {
            SelectWeapon();
        }
        // End:0x39A
        if(AICRecord.bDisableAI)
        {
            ForceDisableAI();
        }
    }
    return RestoredPawn;
    //return ReturnValue;    
}

event HandleAnimNotifyMeleeStrikeBegin()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array GroupClass[8388609];
    local /*0x03A30000-0x00000000*/ private byte MomentumHint[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL myCommand;

    myCommand = SPAICommand(GetActiveCommand());
    // End:0x5D
    if(myCommand != none)
    {
        myCommand.HandleAnimNotifyMeleeStrikeBegin(GroupClass, MomentumHint);
    }
    //return;    
}

event HandleAnimNotifyMeleeStrikeEnd()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize array GroupClass[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL myCommand;

    myCommand = SPAICommand(GetActiveCommand());
    // End:0x54
    if(myCommand != none)
    {
        myCommand.HandleAnimNotifyMeleeStrikeEnd(GroupClass);
    }
    //return;    
}

function ClearLatentActionClassExcept()
{
    local /*0x03A30000-0x00000000*/ private @NULL ForActor[8388609];
    local /*0x03A30000-0x00000000*/ private class actionClass[8388609], ExceptionClass;
    local /*0x03A30000-0x00000000*/ private bool bAbort[9437185];

    // End:0x13
    if(ForActor == none)
    {
        return;
    }
    // End:0x71
    if((ExceptionClass == none) || !ClassIsChildOf(actionClass, ExceptionClass))
    {
        ForActor.ClearLatentAction(actionClass, bAbort);
    }
    //return;    
}

function ClearHandledLatentActions()
{
    local /*0x03A30000-0x00000000*/ private class ExceptionClass[9437185];
    local /*0x03A30000-0x00000000*/ private @NULL SPP;

    ClearLatentActionClassExcept(self, Class'Engine.SeqAct_AIMoveToActor', ExceptionClass);
    SPP = SPPawn(Pawn);
    // End:0x87
    if((SPP != none) && !ClassIsChildOf(ExceptionClass, Class'SPEngine.SPSeqAct_PlayAnim'))
    {
        SPP.StopExecutingPlayAnimSeqAction(true);
    }
    //return;    
}

function AbortLatentAction()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609];

    ClearThisLatentAction(inAction, true);
    //return;    
}

function ClearThisLatentAction()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609];
    local /*0x03A30000-0x00000000*/ private bool bAborted[9437185];
    local /*0x03A30000-0x00000000*/ private int I;

    false
    I = 0;
    J0x10:

    // End:0xD8 [Loop If]
    if(I < LatentActions.Length)
    {
        // End:0x5B
        if(LatentActions[I] == none)
        {
            LatentActions.Remove(I--, 1);                        
        }
        else
        {
            // End:0xCA
            if(LatentActions[I] == inAction)
            {
                // End:0xB3
                if(bAborted)
                {
                    LatentActions[I].AbortFor(self);
                }
                LatentActions.Remove(I--, 1);                
            }
        }
        I++;
        // [Loop Continue]
        goto J0x10;
    }
    //return;    
}

function ForceDisableAI()
{
    local /*0x03A30000-0x00000000*/ private bool bNoClearLatentAction[9437185], ReturnValue;

    // End:0x90
    if(!bDisableAI)
    {
        bDisableAI = true;
        AbortCommand(CommandList);
        Pawn.SetPhysics(7);
        // End:0x64
        if(!bNoClearLatentAction)
        {
            ClearHandledLatentActions();
        }
        ScriptedFocus = none;
        ScriptedMoveTarget = none;
        TriggerDisableAICmd();
        OnDisabledAI();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function SetFocusActor()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewFocus[8388609];

    // End:0x2A
    if(Focus != NewFocus)
    {
        Focus = NewFocus;
    }
    //return;    
}

function OnDisabledAI()
{
    //return;    
}

function TriggerDisableAICmd()
{
    Class'SPAICmd_Base_DisableAI'.static.InitCommand(self);
    //return;    
}

function ForceEnableAI()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x66
    if(bDisableAI)
    {
        bDisableAI = false;
        AbortCommand(CommandList);
        Pawn.SetMovementPhysics();
        GotoState('Auto');
        OnEnabledAI();
        return true;
    }
    return false;
    //return ReturnValue;    
}

function OnEnabledAI()
{
    //return;    
}

function IsValidForAIToggle()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(Pawn == none)
    {
        return false;
    }
    // End:0x81
    if((Pawn.bDeleteMe || Pawn.Health <= 0) || Pawn.Controller == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function OnToggleAI()
{
    local /*0x03A30000-0x00000000*/ private @NULL Action[8388609];
    local /*0x03A30000-0x00000000*/ private bool bEnable;

    // End:0x11
    if(!IsValidForAIToggle())
    {
        return;
    }
    // End:0x57
    if(Action.InputLinks[0].bHasImpulse)
    {
        bEnable = true;        
    }
    else
    {
        // End:0x9D
        if(Action.InputLinks[1].bHasImpulse)
        {
            bEnable = false;            
        }
        else
        {
            // End:0xED
            if(Action.InputLinks[2].bHasImpulse)
            {
                bEnable = bDisableAI;                
            }
            else
            {
                bEnable = !bDisableAI;
            }
        }
    }
    // End:0x14B
    if(Action.InputLinks[3].bHasImpulse)
    {
        bAllowDamageWhenDisableAI = true;        
    }
    else
    {
        // End:0x18F
        if(Action.InputLinks[4].bHasImpulse)
        {
            bAllowDamageWhenDisableAI = false;
        }
    }
    // End:0x1A9
    if(bEnable)
    {
        ForceEnableAI();        
    }
    else
    {
        ForceDisableAI();
    }
    //return;    
}

function IsAIDisabled()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return bDisableAI;
    //return ReturnValue;    
}

function NotifyPlayKismetAnim()
{
    local /*0x03A30000-0x00000000*/ private @NULL Action[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x29
    if(CommandList != none)
    {
        // End:0x29
        if(SPAICmd_Base_DisableAI(CommandList) != none)
        {
            return false;
        }
    }
    // End:0xCF
    if(int(Action.bEnableAI) != int(2))
    {
        // End:0x88
        if(int(Action.bEnableAI) == int(1))
        {
            ForceEnableAI();            
        }
        else
        {
            // End:0xCF
            if(int(Action.bEnableAI) == int(0))
            {
                ForceDisableAI(true);
                ClearHandledLatentActions(Class'SPEngine.SPSeqAct_PlayAnim');
            }
        }
    }
    return true;
    //return ReturnValue;    
}

function NotifyFinishKismetAnim()
{
    local /*0x03A30000-0x00000000*/ private @NULL Action[8388609];

    // End:0xA6
    if(int(Action.bEnableAI) != int(2))
    {
        // End:0x5F
        if(int(Action.bEnableAI) == int(1))
        {
            ForceEnableAI();            
        }
        else
        {
            // End:0xA6
            if(int(Action.bEnableAI) == int(0))
            {
                ForceDisableAI(true);
                ClearHandledLatentActions(Class'SPEngine.SPSeqAct_PlayAnim');
            }
        }
    }
    //return;    
}

function NotifyDialogueManagerAnim()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x29
    if(CommandList != none)
    {
        // End:0x29
        if(SPAICmd_Base_DisableAI(CommandList) != none)
        {
            return false;
        }
    }
    return true;
    //return ReturnValue;    
}

function NotifyFinishDialogueManagerAnim()
{
    //return;    
}

function IsValidForMatineeAnimControl()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x11
    if(Pawn == none)
    {
        return false;
    }
    // End:0x81
    if((Pawn.bDeleteMe || Pawn.Health <= 0) || Pawn.Controller == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function NotifyBeginMatineeAnimControl()
{
    // End:0x11
    if(!IsValidForMatineeAnimControl())
    {
        return;
    }
    AbortCommand(CommandList);
    GotoState('MatineeAnimControl');
    TriggerMatineeAnimControlAICmd();
    //return;    
}

function TriggerMatineeAnimControlAICmd()
{
    Class'SPAICmd_MatineeAnimControl'.static.InitCommand(self);
    //return;    
}

function NotifyFinishMatineeAnimControl()
{
    SPAICommand(CommandList).NotifyFinishMatineeAnimControl();
    AbortCommand(CommandList);
    GotoState('Auto');
    // End:0x6E
    if(bDisableAI)
    {
        bDisableAI = false;
        ForceDisableAI();
    }
    //return;    
}

// Export USPAIController::execProcessStimulus(FFrame&, void* const)
native function ProcessStimulus()
{
    local /*0x03A30000-0x00000000*/ private @NULL E[8388609];
    local /*0x03A30000-0x00000000*/ private byte Type[8388609];
    local /*0x03A30000-0x00000000*/ private name EventName[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIController::execGetLookDir(FFrame&, void* const)
native function GetLookDir()
{
    local /*0x03A30000-0x00000000*/ private @NULL LookDir[25165825];


}

event NotifyEnemyHeard()
{
    local /*0x03A30000-0x00000000*/ private @NULL HeardEnemy[8388609];
    local /*0x03A30000-0x00000000*/ private name NoiseType[8388609];

    //return;    
}

event NotifyEnemySeen()
{
    local /*0x03A30000-0x00000000*/ private @NULL SeenEnemy[8388609];

    AddTarget(SeenEnemy);
    //return;    
}

event NotifyEnemyBecameVisible()
{
    local /*0x03A30000-0x00000000*/ private @NULL VisibleEnemy[8388609];
    local /*0x03A30000-0x00000000*/ private float TimeSinceLastVisible[8388609];

    //return;    
}

event NotifyLostEnemyVisibility()
{
    local /*0x03A30000-0x00000000*/ private @NULL LostEnemy[8388609];

    //return;    
}

event NoticedEnemy()
{
    local /*0x03A30000-0x00000000*/ private @NULL NewEnemy[8388609];

    // End:0x19
    if(Enemy == none)
    {
        SelectTarget();
    }
    ReactionManager.NudgeChannel(NewEnemy, 'NoticedEnemy');
    //return;    
}

function NotifyTakeHit()
{
    local /*0x03A30000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation;
    local /*0x03A30000-0x00000000*/ private int Damage[8388609];
    local /*0x03A30000-0x00000000*/ private class DamageType[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL Momentum[8388609], myCommand;

    super(Controller).NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum);
    ReactionManager.IncomingDamage(((InstigatedBy != none) ? InstigatedBy.Pawn : none), true, DamageType);
    ReceivedDamage(Damage, DamageType, ((InstigatedBy != none) ? SPPawn(InstigatedBy.Pawn) : none));
    myCommand = SPAICommand(CommandList);
    // End:0x160
    if(myCommand != none)
    {
        myCommand.NotifyTakeHit(InstigatedBy, HitLocation, Damage, DamageType, Momentum);
    }
    //return;    
}

function CheckNearMiss()
{
    local /*0x03A30000-0x00000000*/ private @NULL shooter[8388609], Weap, Impact;
    local /*0x03A30000-0x00000000*/ private class inDamageType[8388609];
    local /*0x03A30000-0x00000000*/ private float NearMissDist;
    local /*0x03A30000-0x00000000*/ private @NULL ClosestPoint;

    // End:0x0F
    if(IgnoreNotifies())
    {
        return;
    }
    // End:0x3B
    if(Impact.HitActor == MySPPawn)
    {
        return;
    }
    NearMissDist = PointDistToSegment(MySPPawn.Location, Impact.StartTrace, Impact.HitLocation, ClosestPoint);
    // End:0xC7
    if(NearMissDist > AI_NearMissDistance)
    {
        return;
    }
    MySPPawn.RegisterNearHitMiss(Impact, inDamageType);
    ReactionManager.IncomingDamage(shooter, false, inDamageType);
    ReceivedDamage(int(Weap.GetFireModeDamage(ClosestPoint) * 0.2500000), inDamageType, shooter);
    //return;    
}

function AIResetMemoryDamage()
{
    RecentDamageDone = 0.0000000;
    //return;    
}

function ReceivedDamage()
{
    local /*0x03A30000-0x00000000*/ private int Damage[8388609];
    local /*0x03A30000-0x00000000*/ private class DamageType[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL DamageInstigator[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private @NULL myCommand;
    local /*0x03A30000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x17A [Loop If]
    if(I < TargetList.Length)
    {
        // End:0x16C
        if((DamageInstigator != none) && TargetList[I].Actor == DamageInstigator)
        {
            // End:0xF2
            if((TargetList[I].LastDamageTime + EnemyDamageMemoryTime) > WorldInfo.TimeSeconds)
            {
                TargetList[I].RecentDamageDone += float(Damage);                
            }
            else
            {
                TargetList[I].RecentDamageDone = float(Damage);
            }
            TargetList[I].LastDamageTime = WorldInfo.TimeSeconds;
            // [Explicit Break]
            goto J0x17A;
        }
        ++I;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x17A:

    // End:0x1CA
    if((LastReceivedDamage + EnemyDamageMemoryTime) > WorldInfo.TimeSeconds)
    {
        RecentDamageDone += float(Damage);        
    }
    else
    {
        RecentDamageDone = float(Damage);
    }
    LastReceivedDamage = WorldInfo.TimeSeconds;
    ProcessStimulus(DamageInstigator, 2, GetFuncName());
    myCommand = SPAICommand(CommandList);
    // End:0x282
    if(myCommand != none)
    {
        myCommand.NotifyReceivedDamage(Damage, DamageInstigator);
    }
    return false;
    //return ReturnValue;    
}

// Export USPAIController::execIsFriendlyPawn(FFrame&, void* const)
native final function IsFriendlyPawn()
{
    local /*0x03A30000-0x00000000*/ private @NULL TestPlayer[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export USPAIController::execIsFriendly(FFrame&, void* const)
native function IsFriendly()
{
    local /*0x03A30000-0x00000000*/ private @NULL TestPlayer[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];


}

function IsTooLongSinceEnemySeen()
{
    local /*0x03A30000-0x00000000*/ private @NULL EnemyPawn[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return (MySPPawn.mySPAITuneDataPawn.EnemyTooLongNoSeeTime.GetValue() > float(0)) && TimeSinceLastSeenEnemy(EnemyPawn) > MySPPawn.mySPAITuneDataPawn.EnemyTooLongNoSeeTime.GetValue();
    //return ReturnValue;    
}

final function TimeSinceLastSeenEnemy()
{
    local /*0x03A30000-0x00000000*/ private @NULL EnemyPawn[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int EnemyIdx;

    EnemyIdx = LocalEnemyList.Find('Pawn', EnemyPawn);    
    // End:0xAF
    if(EnemyIdx >= 0)
    {
        // End:0x68
        if(LocalEnemyList[EnemyIdx].bVisible)
        {
            return 0.0000000;
        }
        return WorldInfo.TimeSeconds - LocalEnemyList[EnemyIdx].LastVisibleTime;
    }
    return 100000.0000000;
    //return ReturnValue;    
}

final function FailedPathToEnemyRecently()
{
    local /*0x03A30000-0x00000000*/ private @NULL TestEnemy[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int EnemyIdx;

    EnemyIdx = LocalEnemyList.Find('Pawn', TestEnemy);    
    // End:0x8C
    if((EnemyIdx >= 0) && (WorldInfo.TimeSeconds - LocalEnemyList[EnemyIdx].LastFailedPathTime) <= 5.0000000)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

final function GetEnemyVisibleDuration()
{
    local /*0x03A30000-0x00000000*/ private @NULL EnemyPawn[8388609];
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int EnemyIdx;

    EnemyIdx = LocalEnemyList.Find('Pawn', EnemyPawn);    
    // End:0x87
    if(EnemyIdx >= 0)
    {
        return LocalEnemyList[EnemyIdx].LastVisibleTime - LocalEnemyList[EnemyIdx].InitialVisibleTime;
    }
    return 0.0000000;
    //return ReturnValue;    
}

final function IsEnemySeenLastFrame()
{
    local /*0x03A30000-0x00000000*/ private @NULL EnemyPawn[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int EnemyIdx;

    EnemyIdx = LocalEnemyList.Find('Pawn', EnemyPawn);    
    // End:0x60
    if(EnemyIdx >= 0)
    {
        return LocalEnemyList[EnemyIdx].bSeenLastFrame;
    }
    return false;
    //return ReturnValue;    
}

final function IsEnemyVisible()
{
    local /*0x03A30000-0x00000000*/ private @NULL EnemyPawn[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int EnemyIdx;

    EnemyIdx = LocalEnemyList.Find('Pawn', EnemyPawn);    
    // End:0x60
    if(EnemyIdx >= 0)
    {
        return LocalEnemyList[EnemyIdx].bVisible;
    }
    return false;
    //return ReturnValue;    
}

function CheckValidRangeToEnemy()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function IsTarget()
{
    local /*0x03A30000-0x00000000*/ private @NULL Target[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return TargetList.Find('Actor', Target) != ;    
    //return ReturnValue;    
}

event AddTarget()
{
    local /*0x03A30000-0x00000000*/ private @NULL TargetToAdd[8388609], NewTargetInfo, NewLocalEnemyInfo, PawnToAdd;
    local /*0x03A30000-0x00000000*/ private int Idx;
    local /*0x03A30000-0x00000000*/ private bool bNewTarget;

    Idx = TargetList.Find('Actor', TargetToAdd);    
    // End:0x7D
    if(Idx == -1)
    {
        bNewTarget = true;
        SetTargetInfoFromActor(NewTargetInfo, TargetToAdd);
        TargetList.AddItem(NewTargetInfo);                
    }
    else
    {
        NewTargetInfo = TargetList[Idx];
        SetTargetInfoFromActor(NewTargetInfo, TargetToAdd);
        TargetList[Idx] = NewTargetInfo;
    }
    PawnToAdd = Pawn(TargetToAdd);
    // End:0x176
    if(PawnToAdd != none)
    {
        Idx = LocalEnemyList.Find('Pawn', PawnToAdd);        
        // End:0x176
        if(Idx == -1)
        {
            NewLocalEnemyInfo.Pawn = PawnToAdd;
            LocalEnemyList.AddItem(NewLocalEnemyInfo);            
        }
    }
    // End:0x1C6
    if(bNewTarget && AIObjectiveManager != none)
    {
        AIObjectiveManager.NotifyTargetAdded(TargetToAdd, GetCurrentObjective());
    }
    //return;    
}

function RemoveTarget()
{
    local /*0x03A30000-0x00000000*/ private @NULL ActorToRemove[8388609];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private int Idx;
    local /*0x03A30000-0x00000000*/ private @NULL PawnToRemove;

    Idx = TargetList.Find('Actor', ActorToRemove);    
    // End:0x51
    if(Idx != -1)
    {
        TargetList.Remove(Idx, 1);        
    }
    PawnToRemove = Pawn(ActorToRemove);
    // End:0xCD
    if(PawnToRemove != none)
    {
        Idx = LocalEnemyList.Find('Pawn', PawnToRemove);        
        // End:0xCD
        if(Idx != -1)
        {
            LocalEnemyList.Remove(Idx, 1);            
        }
    }
    return false;
    //return ReturnValue;    
}

function RemoveEnemy()
{
    local /*0x03A30000-0x00000000*/ private @NULL inActor[8388609];

    RemoveTarget(inActor);
    SetEnemy(none);
    EngagementTarget = none;
    //return;    
}

function SelectTarget()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private @NULL enemyController, OldTarget;
    local /*0x03A30000-0x00000000*/ private bool bResult;
    local /*0x03A30000-0x00000000*/ private int EnemyIndex, I;

    // End:0x40
    if((CommandList != none) && !SPAICommand(CommandList).ShouldSelectTarget())
    {
        return false;
    }
    OldTarget = EngagementTarget;
    // End:0x20D
    if(TargetList.Length > 0)
    {
        EnemyIndex = Rand(TargetList.Length);
        EngagementTarget = TargetList[EnemyIndex].Actor;
        // End:0x1A3
        if(!CanBeMyEnemy(EngagementTarget) && TargetList.Length > 1)
        {
            EngagementTarget = none;
            I = 0;
            J0xE9:

            // End:0x1A3 [Loop If]
            if(I < TargetList.Length)
            {
                ++EnemyIndex;
                // End:0x12F
                if(EnemyIndex >= TargetList.Length)
                {
                    EnemyIndex = 0;
                }
                // End:0x195
                if(CanBeMyEnemy(TargetList[EnemyIndex].Actor))
                {
                    EngagementTarget = TargetList[EnemyIndex].Actor;
                    // [Explicit Break]
                    goto J0x1A3;
                }
                ++I;
                // [Loop Continue]
                goto J0xE9;
            }
        }
        J0x1A3:

        enemyController = SPAIController(EngagementTarget);
        // End:0x1F6
        if(enemyController != none)
        {
            EngagementTarget = enemyController.Pawn;
        }
        bResult = EngagementTarget != none;
    }
    // End:0x259
    if(!bResult)
    {
        // End:0x24B
        if(SelectEnemy())
        {
            EngagementTarget = Enemy;
            bResult = true;            
        }
        else
        {
            EngagementTarget = none;
        }        
    }
    else
    {
        SetEnemy(Pawn(EngagementTarget));
    }
    // End:0x2B4
    if(OldTarget != EngagementTarget)
    {
        TargetAquisitionTime = WorldInfo.TimeSeconds;
    }
    ShotTarget = Pawn(EngagementTarget);
    return bResult;
    //return ReturnValue;    
}

function OnAISetFocusEnemy()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609], actorToReallyUse;

    // End:0x162
    if(inAction != none)
    {
        // End:0xC9
        if((Controller(inAction.ActorToTarget) != none) && Controller(inAction.ActorToTarget).Pawn != none)
        {
            actorToReallyUse = Controller(inAction.ActorToTarget).Pawn;            
        }
        else
        {
            actorToReallyUse = inAction.ActorToTarget;
        }
        Focus = actorToReallyUse;
        SetFocalPoint(actorToReallyUse.Location, true);
        // End:0x162
        if(inAction.bForceEnemy)
        {
            AddTarget(actorToReallyUse);
        }
    }
    //return;    
}

function SetTargetInfoFromActor()
{
    local /*0x03A30000-0x00000000*/ private @NULL TI[25165825], Actor;

    TI.Actor = Actor;
    // End:0x8C
    if(Actor == none)
    {
        TI.Location = vect(0.0000000, 0.0000000, 0.0000000);
        TI.Rotation = rot(0, 0, 0);        
    }
    else
    {
        TI.Location = Actor.Location;
        TI.Rotation = Actor.Rotation;
    }
    TI.LastSeenTime = WorldInfo.TimeSeconds;
    //return;    
}

final function HasValidEnemy()
{
    local /*0x03A30000-0x00000000*/ private @NULL TestEnemy[9437185];
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x23
    if(TestEnemy == none)
    {
        TestEnemy = Enemy;
    }
    // End:0x64
    if((TestEnemy == none) || !TestEnemy.IsValidEnemyTargetFor(PlayerReplicationInfo, true))
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function WantsNewEnemy()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SelectWeapon()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private @NULL W;

    // End:0x37
    if((Pawn == none) || Pawn.InvManager == none)
    {
        return false;
    }
    // End:0x48
    if(!bAllowCombatTransitions)
    {
        return false;
    }
    // End:0x99
    if(ForcedWeapon == none)
    {
        W = Pawn.InvManager.GetBestWeapon();        
    }
    else
    {
        W = ForcedWeapon;
    }
    // End:0x121
    if(W != Pawn.Weapon)
    {
        StopFiring();
        Pawn.InvManager.SetCurrentWeapon(W);
        return true;
    }
    return false;
    //return ReturnValue;    
}

function GetMinDistanceToAnyPlayer()
{
    local /*0x03A30000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private @NULL PC;
    local /*0x03A30000-0x00000000*/ private float MinRange, CurRange;

    MinRange = -1.0000000;
    // End:0x24
    if(Pawn == none)
    {
        return -1.0000000;
    }
    // End:0x12C
    foreach WorldInfo.AllControllers(Class'Engine.PlayerController', PC)
    {
        // End:0x12B
        if((PC != none) && PC.ViewTarget != none)
        {
            CurRange = VSizeSq(PC.ViewTarget.Location - Pawn.Location);
            // End:0x12B
            if((CurRange < MinRange) || MinRange < 0.0000000)
            {
                MinRange = CurRange;
            }
        }        
    }    
    return Sqrt(MinRange);
    //return ReturnValue;    
}

function ConditionalDeleteWhenStale()
{
    // End:0x1C
    if(Pawn == none)
    {
        CleanupBoringDude();        
    }
    else
    {
        // End:0x93
        if((WorldInfo.TimeSeconds - Pawn.LastRenderTime) < StaleTimeout)
        {
            NotifyDidSomethingInteresting(Pawn.LastRenderTime);            
        }
        else
        {
            // End:0xC4
            if((GetMinDistanceToAnyPlayer()) > 2048.0000000)
            {
                // End:0xC1
                if(!NotifyStale())
                {
                    NotifyDidSomethingInteresting();
                }                
            }
            else
            {
                NotifyDidSomethingInteresting(WorldInfo.TimeSeconds - (StaleTimeout * 0.5000000));
            }
        }
    }
    //return;    
}

function ShouldPrintStaleWarning()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function CleanupBoringDude()
{
    local /*0x03A30000-0x00000000*/ private @NULL Vehicle;

    Vehicle = Vehicle(Pawn);
    // End:0x4B
    if(Vehicle != none)
    {
        Vehicle.DriverLeave(true);
    }
    Pawn.Destroy();
    Destroy();
    //return;    
}

function NotifyStale()
{
    local /*0x03A30000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(bDeleteWhenStale)
    {
        CleanupBoringDude();
        return true;
    }
    return false;
    //return ReturnValue;    
}

static function RotateMe()
{
    local /*0x03A30000-0x00000000*/ private @NULL myVector[8388609];
    local /*0x03A30000-0x00000000*/ private float myAngle[8388609];
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];
    local /*0x03A30000-0x00000000*/ private float X1, Y1;

    X1 = myVector.X;
    Y1 = myVector.Y;
    myVector.X = (X1 * Cos((myAngle / float(180)) * 3.1415930)) - (Y1 * Sin((myAngle / float(180)) * 3.1415930));
    myVector.Y = (X1 * Sin((myAngle / float(180)) * 3.1415930)) + (Y1 * Cos((myAngle / float(180)) * 3.1415930));
    return myVector;
    //return ReturnValue;    
}

function GetCurrentObjective()
{
    local /*0x03A30000-0x00000000*/ private @NULL ReturnValue[92274689];

    return none;
    //return ReturnValue;    
}

function OnAddRemoveAIObjective()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609], Action;

    Action = SPSeqAct_AddRemoveAIObjective(inAction);
    // End:0x14D
    if(((AIObjectiveManager != none) && Action != none) && Action.ObjectiveData != none)
    {
        // End:0xD9
        if(Action.InputLinks[0].bHasImpulse)
        {
            AIObjectiveManager.AddAIObjectiveFromKismet(Action.ObjectiveData);            
        }
        else
        {
            // End:0x14D
            if(Action.InputLinks[1].bHasImpulse)
            {
                AIObjectiveManager.RemoveAIObjectiveFromKismet(Action.ObjectiveData);
            }
        }
    }
    //return;    
}

function OnUnloadAddRemoveAIObjective()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609], Action;

    Action = SPSeqAct_AddRemoveAIObjective(inAction);
    // End:0x9F
    if(((AIObjectiveManager != none) && Action != none) && Action.ObjectiveData != none)
    {
        AIObjectiveManager.RemoveAIObjectiveFromKismet(Action.ObjectiveData);
    }
    //return;    
}

function AddAIObjectiveFromKismet()
{
    local /*0x03A30000-0x00000000*/ private @NULL ObjectiveData[8388609];

    // End:0x37
    if(AIObjectiveManager != none)
    {
        AIObjectiveManager.AddAIObjectiveFromKismet(ObjectiveData);
    }
    //return;    
}

function RemoveAIObjectiveFromKismet()
{
    local /*0x03A30000-0x00000000*/ private @NULL ObjectiveData[8388609];

    // End:0x37
    if(AIObjectiveManager != none)
    {
        AIObjectiveManager.RemoveAIObjectiveFromKismet(ObjectiveData);
    }
    //return;    
}

function OnMakeAiAwareOf()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609], Action;
    local /*0x03A30000-0x00000000*/ private int I;
    local /*0x03A30000-0x00000000*/ private @NULL ThePawn, TheController;

    Action = SPSeqAct_MakeAiAwareOf(inAction);
    // End:0x53
    if(Action != none)
    {
        AddMultipleSmartActor(Action.ActorList);
    }
    I = 0;
    J0x5E:

    // End:0x16B [Loop If]
    if(I < Action.ActorList.Length)
    {
        TheController = Controller(Action.ActorList[I]);
        // End:0x100
        if(TheController != none)
        {
            ThePawn = TheController.Pawn;            
        }
        else
        {
            ThePawn = Pawn(Action.ActorList[I]);
        }
        // End:0x15D
        if(ThePawn != none)
        {
            SeePlayer(ThePawn);
        }
        ++I;
        // [Loop Continue]
        goto J0x5E;
    }
    //return;    
}

function OnMakeAiUnAwareOf()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609], Action;

    Action = SPSeqAct_MakeAiUnAwareOf(inAction);
    // End:0x53
    if(Action != none)
    {
        RemoveMultipleSmartActor(Action.ActorList);
    }
    //return;    
}

function OnUnloadMakeAiAwareOf()
{
    local /*0x03A30000-0x00000000*/ private @NULL inAction[8388609], Action;

    Action = SPSeqAct_MakeAiAwareOf(inAction);
    // End:0x53
    if(Action != none)
    {
        RemoveMultipleSmartActor(Action.ActorList);
    }
    //return;    
}

private final function SPDebugAILog()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize string LogText[142606337];
    local /*0x03A30000-0x00000000*/ private name LogCategory[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForce[9437185];

    //return;    
}

event AILog_Internal()
{
    local /*0x03A30000-0x00000000*/ private editfixedsize string LogText[142606337];
    local /*0x03A30000-0x00000000*/ private name LogCategory[9437185];
    local /*0x03A30000-0x00000000*/ private bool bForce[9437185];

    super(GameAIController).AILog_Internal(LogText, LogCategory, bForce);
    SPDebugAILog(LogText, LogCategory, bForce);
    //return;    
}

state MatineeAnimControl
{
    event BeginState()
    {
        local /*0x03A30000-0x00000000*/ private name PreviousStateName[8388609];

        super.BeginState(PreviousStateName);
        //return;        
    }

    function CleanUpState()
    {
        super.CleanUpState();
        // End:0x6D
        if(Pawn != none)
        {
            // End:0x6D
            if(!IsAIDisabled() && Pawn.Health > 0)
            {
                Pawn.SetMovementPhysics();
            }
        }
        //return;        
    }
    J0x00:
    // End:0x0F [Loop If]
    if(true)
    {
        Sleep(0.3000000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;                    
}

defaultproperties
{
    // Reference: SPAIReactionManager'Default__SPAIController.ReactionManager0'
    begin object name=ReactionManager0 class=Class'SPAIReactionManager'
    end object
    ReactionManager=ReactionManager0
    DefaultReactConditionClasses=/* Array type was not detected. */
    bAllowCombatTransitions=true
    EnemyDamageMemoryTime=10.0000000
    AI_NearMissDistance=200.0000000
    bUseVisibilityManager=true
}