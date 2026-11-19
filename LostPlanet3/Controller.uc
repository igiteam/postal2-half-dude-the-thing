class Controller extends Actor
    abstract
    nativereplication
    notplaceable
    hidecategories(AnimDependency,Navigation)
    implements(Interface_NavigationHandle);

const LATENT_MOVETOWARD = 503;

struct native VisiblePortalInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Source;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Destination;

    structdefaultproperties
    {
        Source=none
        Destination=none
    }
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IInterface_NavigationHandle[268566529];
var(*) /*0x35EA0000-0x00000400*/ private travel Pawn Pawn[2097153];
var(*) /*0x35EA0000-0x00000400*/ private travel PlayerReplicationInfo PlayerReplicationInfo[2097153];
var(*) /*0x35EA0000-0x00000000*/ private int PlayerNum[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NextController[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsPlayer;
var(*) /*0x35EA0000-0x00000000*/ private bool bGodMode;
var(*) /*0x35EA0000-0x00000000*/ private bool bSoaking;
var(*) /*0x35EA0000-0x00000000*/ private bool bSlowerZAcquire;
var(*) /*0x35EA0000-0x00000000*/ private bool bNotifyPostLanded;
var(*) /*0x35EA0000-0x00000000*/ private bool bNotifyApex;
var(*) /*0x35EA0000-0x00000000*/ private bool bOverrideSearchStart;
var(*) /*0x35EA0000-0x00000000*/ private bool bAdvancedTactics;
var(*) /*0x35EA0000-0x00000000*/ private bool bCanDoSpecial;
var(*) /*0x35EA0000-0x00000000*/ private bool bAdjusting;
var(*) /*0x35EA0000-0x00000000*/ private bool bPreparingMove;
var(*) /*0x35EA0000-0x00000000*/ private bool bForceStrafe;
var(*) /*0x35EA0000-0x00000000*/ private bool bLOSflag[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bSkipExtraLOSChecks;
var(*) /*0x35EA0000-0x00000000*/ private bool bNotifyFallingHitWall;
var(*) /*0x35EA0000-0x00000000*/ private bool bEarlyOutOfSighTestsForSameType;
var(*) /*0x35EA0000-0x00000000*/ private bool bPreciseDestination;
var(*) /*0x35EA0000-0x00000000*/ private bool bSeeFriendly;
var(*) /*0x35EA0000-0x00000000*/ private bool bUsingPathLanes;
var(*) /*0x35EA0000-0x00000000*/ private byte bFire[262145];
var(*) /*0x35EA0000-0x00000000*/ private byte bAltFire[262145];
var(*) /*0x35EA0000-0x00000000*/ private float MinHitWall;
var(*) /*0x35EA0000-0x00000000*/ private class NavigationHandleClass;
var(*) /*0x35EA0000-0x00000400*/ private @NULL NavigationHandle;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OverrideSearchStart;
var(*) /*0x35EA0000-0x00000000*/ private float MoveTimer;
var(*) /*0x35EA0000-0x00000000*/ private @NULL MoveTarget;
var(*) /*0x35EA0000-0x00000000*/ private @NULL DestinationPosition;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FocalPosition;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Focus;
var(*) /*0x35EA0000-0x00000000*/ private @NULL GoalList[4];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AdjustPosition;
var(*) /*0x35EA0000-0x00000000*/ private @NULL StartSpot;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array RouteCache;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurrentPath;
var(*) /*0x35EA0000-0x00000000*/ private @NULL NextRoutePath;
var(*) /*0x35EA0000-0x00000000*/ private @NULL CurrentPathDir;
var(*) /*0x35EA0000-0x00000000*/ private @NULL RouteGoal;
var(*) /*0x35EA0000-0x00000000*/ private float RouteDist;
var(*) /*0x35EA0000-0x00000000*/ private float LastRouteFind;
var(*) /*0x35EA0000-0x00000000*/ private @NULL PendingMover;
var(*) /*0x35EA0000-0x00000000*/ private @NULL FailedMoveTarget;
var(*) /*0x35EA0000-0x00000000*/ private int MoveFailureCount;
var(*) /*0x35EA0000-0x00000000*/ private float GroundPitchTime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL ShotTarget;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastFailedReach[131073];
var(*) /*0x35EA0000-0x00000000*/ private float FailedReachTime[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL FailedReachLocation[131073];
var(*) /*0x35EA0000-0x00000000*/ private float SightCounter;
var(*) /*0x35EA0000-0x00000000*/ private float SightCounterInterval;
var(*) /*0x35EA0000-0x00000000*/ private float SightCounterVisManager;
var(*) /*0x35EA0000-0x00000000*/ private float InUseNodeCostMultiplier;
var(*) /*0x35EA0000-0x00000000*/ private int HighJumpNodeCostModifier;
var(*) /*0x35EA0000-0x00000000*/ private float MaxMoveTowardPawnTargetTime;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Enemy;
var(*) /*0x35EA0000-0x00000000*/ private float PreciseDestinationSpeed;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array VisiblePortals;
var(*) /*0x35EA0000-0x00000000*/ private float LaneOffset;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OldBasedRotation[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL NavMeshPath_SearchExtent_Modifier;

// Export UController::execIsLocalPlayerController(FFrame&, void* const)
native function IsLocalPlayerController()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UController::execIsLocalController(FFrame&, void* const)
native function IsLocalController()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UController::execRouteCache_Empty(FFrame&, void* const)
native function RouteCache_Empty();

// Export UController::execRouteCache_AddItem(FFrame&, void* const)
native function RouteCache_AddItem()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Nav[8388609];


}

// Export UController::execRouteCache_InsertItem(FFrame&, void* const)
native function RouteCache_InsertItem()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Nav[8388609];
    local /*0x35EA0000-0x00000000*/ private int Idx[9437185];

    0                
}

// Export UController::execRouteCache_RemoveItem(FFrame&, void* const)
native function RouteCache_RemoveItem()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Nav[8388609];


}

// Export UController::execRouteCache_RemoveIndex(FFrame&, void* const)
native function RouteCache_RemoveIndex()
{
    local /*0x35EA0000-0x00000000*/ private int InIndex[8388609], Count;

    1                
}

// Export UController::execSetFocalPoint(FFrame&, void* const)
native final function SetFocalPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL FP[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bOffsetFromBase[9437185];


}

// Export UController::execGetFocalPoint(FFrame&, void* const)
native final function GetFocalPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UController::execSetDestinationPosition(FFrame&, void* const)
native final function SetDestinationPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Dest[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bOffsetFromBase[9437185];


}

// Export UController::execGetDestinationPosition(FFrame&, void* const)
native final function GetDestinationPosition()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UController::execGetPreciseDestinationSpeed(FFrame&, void* const)
native final function GetPreciseDestinationSpeed()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UController::execSetPreciseDestinationSpeed(FFrame&, void* const)
native final function SetPreciseDestinationSpeed()
{
    local /*0x35EA0000-0x00000000*/ private float InSpeed[8388609];


}

// Export UController::execSetAdjustLocation(FFrame&, void* const)
native final function SetAdjustLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewLoc[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAdjust[8388609], bOffsetFromBase;


}

// Export UController::execGetAdjustLocation(FFrame&, void* const)
native final function GetAdjustLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

event NotifyPathChanged()
{
    //return;    
}

simulated event BeginAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];

    Pawn.BeginAnimControl(InInterpGroup);
    //return;    
}

simulated event SetAnimPosition()
{
    local /*0x35EA0000-0x00000000*/ private name SlotName[8388609];
    local /*0x35EA0000-0x00000000*/ private int ChannelIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private name InAnimSeqName[8388609];
    local /*0x35EA0000-0x00000000*/ private float InPosition[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFireNotifies[8388609], bLooping, bEnableRootMotion;

    Pawn.SetAnimPosition(SlotName, ChannelIndex, InAnimSeqName, InPosition, bFireNotifies, bLooping, bEnableRootMotion);
    //return;    
}

simulated event FinishAnimControl()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InInterpGroup[8388609];

    Pawn.FinishAnimControl(InInterpGroup);
    //return;    
}

event PlayActorFaceFXAnim()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AnimSet[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize string GroupName[8388609], SeqName;
    local /*0x35EA0000-0x00000000*/ private @NULL SoundCueToPlay[8388609], AkEventToPlay, AkCBInfo;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return Pawn.PlayActorFaceFXAnim(AnimSet, GroupName, SeqName, SoundCueToPlay, AkEventToPlay, AkCBInfo);
    //return ReturnValue;    
}

event StopActorFaceFXAnim()
{
    Pawn.StopActorFaceFXAnim();
    //return;    
}

event SetMorphWeight()
{
    local /*0x35EA0000-0x00000000*/ private name MorphNodeName[8388609];
    local /*0x35EA0000-0x00000000*/ private float MorphWeight[8388609];

    Pawn.SetMorphWeight(MorphNodeName, MorphWeight);
    //return;    
}

event SetSkelControlScale()
{
    local /*0x35EA0000-0x00000000*/ private name SkelControlName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];

    Pawn.SetSkelControlScale(SkelControlName, Scale);
    //return;    
}

event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x65
    if(!bDeleteMe && int(WorldInfo.NetMode) != int(NM_Client))
    {
        // End:0x5B
        if(bIsPlayer)
        {
            InitPlayerReplicationInfo();
        }
        InitNavigationHandle();
    }
    SightCounter = SightCounterInterval * FRand();
    //return;    
}

function Reset()
{
    super.Reset();
    Enemy = none;
    StartSpot = none;
    bAdjusting = false;
    bPreparingMove = false;
    MoveTimer = -1.0000000;
    MoveTarget = none;
    CurrentPath = none;
    RouteGoal = none;
    //return;    
}

reliable client simulated function ClientSetLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewLocation[8388609], NewRotation;

    SetRotation(NewRotation);
    // End:0x1B6
    if(Pawn != none)
    {
        // End:0x14F
        if((Rotation.Pitch > Pawn.MaxPitchLimit) && Rotation.Pitch < (65536 - Pawn.MaxPitchLimit))
        {
            // End:0x10D
            if(Rotation.Pitch < 32768)
            {
                NewRotation.Pitch = Pawn.MaxPitchLimit;                
            }
            else
            {
                NewRotation.Pitch = 65536 - Pawn.MaxPitchLimit;
            }
        }
        NewRotation.Roll = 0;
        Pawn.SetRotation(NewRotation);
        Pawn.SetLocation(NewLocation);
    }
    //return;    
}

reliable client simulated function ClientSetRotation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewRotation[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bResetCamera[9437185];

    SetRotation(NewRotation);
    // End:0x87
    if(Pawn != none)
    {
        NewRotation.Pitch = 0;
        NewRotation.Roll = 0;
        Pawn.SetRotation(NewRotation);
    }
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x49
    if(VarName == 'PlayerReplicationInfo')
    {
        // End:0x46
        if(PlayerReplicationInfo != none)
        {
            PlayerReplicationInfo.ClientInitialize(self);
        }        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

function OnPossess()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609], OldPawn, V;

    V = Vehicle(Pawn);
    // End:0x6F
    if(inAction.bTryToLeaveVehicle && V != none)
    {
        V.DriverLeave(true);
    }
    // End:0x1A0
    if(inAction.PawnToPossess != none)
    {
        V = Vehicle(inAction.PawnToPossess);
        // End:0x10F
        if((Pawn != none) && V != none)
        {
            V.TryToDrive(Pawn);            
        }
        else
        {
            OldPawn = Pawn;
            UnPossess();
            Possess(inAction.PawnToPossess, false);
            // End:0x1A0
            if(inAction.bKillOldPawn && OldPawn != none)
            {
                OldPawn.Destroy();
            }
        }
    }
    //return;    
}

event Possess()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bVehicleTransition[8388609];

    // End:0x58
    if(inPawn.Controller != none)
    {
        inPawn.Controller.UnPossess();
    }
    inPawn.PossessedBy(self, bVehicleTransition);
    Pawn = inPawn;
    SetFocalPoint(Pawn.Location + (float(512) * Vector(Pawn.Rotation)), true);
    Restart(bVehicleTransition);
    // End:0x12C
    if(Pawn.Weapon == none)
    {
        ClientSwitchToBestWeapon();
    }
    //return;    
}

event UnPossess()
{
    // End:0x39
    if(Pawn != none)
    {
        Pawn.UnPossessed();
        Pawn = none;
    }
    //return;    
}

function PawnDied()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x35EA0000-0x00000000*/ private int Idx;

    // End:0x19
    if(inPawn != Pawn)
    {
        return;
    }
    TriggerEventClass(Class'SeqEvent_Death', self);
    Idx = 0;
    J0x3B:

    // End:0xA4 [Loop If]
    if(Idx < LatentActions.Length)
    {
        // End:0x96
        if(LatentActions[Idx] != none)
        {
            LatentActions[Idx].AbortFor(self);
        }
        Idx++;
        // [Loop Continue]
        goto J0x3B;
    }
    LatentActions.Length = 0;
    // End:0xFF
    if(Pawn != none)
    {
        SetLocation(Pawn.Location);
        Pawn.UnPossessed();
    }
    Pawn = none;
    // End:0x137
    if(bIsPlayer)
    {
        // End:0x134
        if(!GamePlayEndedState())
        {
            GotoState('Dead');
        }        
    }
    else
    {
        Destroy();
    }
    //return;    
}

event GamePlayEndedState()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event NotifyPostLanded()
{
    //return;    
}

event Destroyed()
{
    // End:0x114
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x7C
        if(bIsPlayer && WorldInfo.Game != none)
        {
            WorldInfo.Game.Logout(self);
        }
        // End:0x114
        if(PlayerReplicationInfo != none)
        {
            // End:0x10A
            if(!PlayerReplicationInfo.bOnlySpectator && PlayerReplicationInfo.Team != none)
            {
                PlayerReplicationInfo.Team.RemoveFromTeam(self);
            }
            CleanupPRI();
        }
    }
    super.Destroyed();
    //return;    
}

function CleanupPRI()
{
    PlayerReplicationInfo.Destroy();
    PlayerReplicationInfo = none;
    //return;    
}

function Restart()
{
    local /*0x35EA0000-0x00000000*/ private bool bVehicleTransition[8388609];

    Pawn.Restart();
    // End:0x39
    if(!bVehicleTransition)
    {
        Enemy = none;
    }
    // End:0xA3
    if((bVehicleTransition == false) && Pawn.InvManager != none)
    {
        Pawn.InvManager.UpdateController();
    }
    //return;    
}

// Export UController::execBeyondFogDistance(FFrame&, void* const)
native final function BeyondFogDistance()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ViewPoint[8388609], OtherPoint;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

function EnemyJustTeleported()
{
    LineOfSightTo(Enemy);
    //return;    
}

function NotifyTakeHit()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InstigatedBy[8388609], HitLocation;
    local /*0x35EA0000-0x00000000*/ private int Damage[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Momentum[8388609];

    //return;    
}

function InitPlayerReplicationInfo()
{
    PlayerReplicationInfo = Spawn(WorldInfo.Game.PlayerReplicationInfoClass, self,, vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, 0));
    // End:0xC8
    if(PlayerReplicationInfo.PlayerName == "")
    {
        PlayerReplicationInfo.PlayerName = Class'GameInfo'.default.DefaultPlayerName;
    }
    //return;    
}

// Export UController::execGetTeamNum(FFrame&, void* const)
native simulated function GetTeamNum()
{
    local /*0x35EA0000-0x00000000*/ private byte ReturnValue[92274689];


}

reliable server function ServerRestartPlayer()
{
    // End:0x44
    if((int(WorldInfo.NetMode) != int(NM_Client)) && Pawn != none)
    {
        ServerGivePawn();
    }
    //return;    
}

function ServerGivePawn()
{
    //return;    
}

function SetCharacter()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string inCharacter[8388609];

    //return;    
}

function GameHasEnded()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EndGameFocus[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bIsWinner[9437185];

    GotoState('RoundEnded');
    //return;    
}

function NotifyKilled()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Killer[8388609], Killed, KilledPawn;
    local /*0x35EA0000-0x00000000*/ private class damageTyp[8388609];

    // End:0x43
    if(Pawn != none)
    {
        Pawn.TriggerEventClass(Class'SeqEvent_SeeDeath', KilledPawn);
    }
    // End:0x65
    if(Enemy == KilledPawn)
    {
        Enemy = none;
    }
    //return;    
}

function NotifyProjLanded()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Proj[8388609];

    // End:0x54
    if((Proj != none) && Pawn != none)
    {
        Pawn.TriggerEventClass(Class'SeqEvent_ProjectileLanded', Proj);
    }
    //return;    
}

function WarnProjExplode()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Proj[8388609];

    //return;    
}

event RatePickup()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PickupHolder[8388609];
    local /*0x35EA0000-0x00000000*/ private class inPickup[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    //return ReturnValue;    
}

function FireWeaponAt()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inActor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event StopFiring()
{
    bFire = 0;
    // End:0x3A
    if(Pawn != none)
    {
        Pawn.StopFiring();
    }
    //return;    
}

function RoundHasEnded()
{
    local /*0x35EA0000-0x00000000*/ private @NULL EndRoundFocus[9437185];

    GotoState('RoundEnded');
    //return;    
}

function HandlePickup()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Inv[8388609];

    //return;    
}

function GetAdjustedAimFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL W[8388609], StartFireLoc, ReturnValue;

    // End:0x2F
    if(Pawn != none)
    {
        return Pawn.GetBaseAimRotation();
    }
    return Rotation;
    //return ReturnValue;    
}

function InstantWarnTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InTarget[8388609], FiredWeapon, FireDir, P;

    P = Pawn(InTarget);
    // End:0x9C
    if((P != none) && P.Controller != none)
    {
        P.Controller.ReceiveWarning(Pawn, -1.0000000, FireDir);
    }
    //return;    
}

function ReceiveWarning()
{
    local /*0x35EA0000-0x00000000*/ private @NULL shooter[8388609];
    local /*0x35EA0000-0x00000000*/ private float projSpeed[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL FireDir[8388609];

    //return;    
}

function ReceiveProjectileWarning()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Proj[8388609];

    //return;    
}

exec function SwitchToBestWeapon()
{
    local /*0x35EA0000-0x00000000*/ private bool bForceNewWeapon[9437185];

    // End:0x38
    if((Pawn == none) || Pawn.InvManager == none)
    {
        return;
    }
    Pawn.InvManager.SwitchToBestWeapon(bForceNewWeapon);
    //return;    
}

reliable client simulated function ClientSwitchToBestWeapon()
{
    local /*0x35EA0000-0x00000000*/ private bool bForceNewWeapon[9437185];

    SwitchToBestWeapon(bForceNewWeapon);
    //return;    
}

function NotifyChangedWeapon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PrevWeapon[8388609], NewWeapon;

    //return;    
}

// Export UController::execLineOfSightTo(FFrame&, void* const)
native(514) final function LineOfSightTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], chkLocation;
    local /*0x35EA0000-0x00000000*/ private bool bTryAlternateTargetLoc[9437185], ReturnValue;


}

// Export UController::execCanSee(FFrame&, void* const)
native(533) final function CanSee()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UController::execCanSeeByPoints(FFrame&, void* const)
native function CanSeeByPoints()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ViewLocation[8388609], TestLocation, ViewRotation;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UController::execPickTarget(FFrame&, void* const)
native(531) final function PickTarget()
{
    local /*0x35EA0000-0x00000000*/ private class TargetClass[8388609];
    local /*0x35EA0000-0x00000000*/ private float bestAim[25165825], bestDist;
    local /*0x35EA0000-0x00000000*/ private @NULL FireDir[8388609], projStart;
    local /*0x35EA0000-0x00000000*/ private float MaxRange[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

event HearNoise()
{
    local /*0x35EA0000-0x00000000*/ private float Loudness[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL NoiseMaker[8388609];
    local /*0x35EA0000-0x00000000*/ private name NoiseType[9437185];

    //return;    
}

event SeePlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Seen[8388609];

    //return;    
}

event SeeMonster()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Seen[8388609];

    //return;    
}

event EnemyNotVisible()
{
    //return;    
}

// Export UController::execMoveTo(FFrame&, void* const)
native(500) final latent function MoveTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewDestination[8388609], ViewFocus;
    local /*0x35EA0000-0x00000000*/ private float DestinationOffset[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bShouldWalk[9437185];

    ((Pawn != none) ? Pawn.bIsWalking : false);                        
}

// Export UController::execMoveToDirectNonPathPos(FFrame&, void* const)
native final latent function MoveToDirectNonPathPos()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewDestination[8388609], ViewFocus;
    local /*0x35EA0000-0x00000000*/ private float DestinationOffset[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bShouldWalk[9437185];

    ((Pawn != none) ? Pawn.bIsWalking : false);                        
}

// Export UController::execMoveToward(FFrame&, void* const)
native(502) final latent function MoveToward()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTarget[8388609], ViewFocus;
    local /*0x35EA0000-0x00000000*/ private float DestinationOffset[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bUseStrafing[9437185], bShouldWalk;

    ((Pawn != none) ? Pawn.bIsWalking : false);                            
}

event SetupSpecialPathAbilities()
{
    //return;    
}

// Export UController::execFinishRotation(FFrame&, void* const)
native(508) final latent function FinishRotation();

// Export UController::execFindPathTo(FFrame&, void* const)
native(518) final function FindPathTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL aPoint[8388609];
    local /*0x35EA0000-0x00000000*/ private int MaxPathLength[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bReturnPartial[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UController::execFindPathToward(FFrame&, void* const)
native(517) final function FindPathToward()
{
    local /*0x35EA0000-0x00000000*/ private @NULL anActor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWeightDetours[9437185];
    local /*0x35EA0000-0x00000000*/ private int MaxPathLength[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bReturnPartial[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UController::execFindPathTowardNearest(FFrame&, void* const)
native final function FindPathTowardNearest()
{
    local /*0x35EA0000-0x00000000*/ private class GoalClass[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bWeightDetours[9437185];
    local /*0x35EA0000-0x00000000*/ private int MaxPathLength[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bReturnPartial[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UController::execFindRandomDest(FFrame&, void* const)
native(525) final function FindRandomDest()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UController::execFindPathToIntercept(FFrame&, void* const)
native final function FindPathToIntercept()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609], InRouteGoal;
    local /*0x35EA0000-0x00000000*/ private bool bWeightDetours[9437185];
    local /*0x35EA0000-0x00000000*/ private int MaxPathLength[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bReturnPartial[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UController::execPointReachable(FFrame&, void* const)
native(521) final function PointReachable()
{
    local /*0x35EA0000-0x00000000*/ private @NULL aPoint[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UController::execActorReachable(FFrame&, void* const)
native(520) final function ActorReachable()
{
    local /*0x35EA0000-0x00000000*/ private @NULL anActor[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

event MoveUnreachable()
{
    local /*0x35EA0000-0x00000000*/ private @NULL AttemptedDest[8388609], AttemptedTarget;

    //return;    
}

// Export UController::execPickWallAdjust(FFrame&, void* const)
native(526) final function PickWallAdjust()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UController::execWaitForLanding(FFrame&, void* const)
native(527) final latent function WaitForLanding()
{
    local /*0x35EA0000-0x00000000*/ private float waitDuration[9437185];


}

event LongFall()
{
    //return;    
}

// Export UController::execEndClimbLadder(FFrame&, void* const)
native function EndClimbLadder();

event MayFall()
{
    local /*0x35EA0000-0x00000000*/ private bool bFloor[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL FloorNormal[8388609];

    //return;    
}

event AllowDetourTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL N[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function WaitForMover()
{
    local /*0x35EA0000-0x00000000*/ private @NULL M[8388609];

    PendingMover = M;
    M.bMonitorMover = true;
    bPreparingMove = true;
    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

event MoverFinished()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x90
    if(((Pawn == none) || PendingMover.MyMarker == none) || PendingMover.MyMarker.ProceedWithMove(Pawn))
    {
        PendingMover = none;
        bPreparingMove = false;
        return true;
    }
    return false;
    //return ReturnValue;    
}

function UnderLift()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Lift[8388609];

    //return;    
}

event HandlePathObstruction()
{
    local /*0x35EA0000-0x00000000*/ private @NULL BlockedBy[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated event GetPlayerViewPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_Location[25165825], out_Rotation;

    out_Location = Location;
    out_Rotation = Rotation;
    //return;    
}

simulated event GetActorEyesViewPoint()
{
    local /*0x35EA0000-0x00000000*/ private @NULL out_Location[25165825], out_Rotation;

    // End:0x43
    if(Pawn != none)
    {
        Pawn.GetActorEyesViewPoint(out_Location, out_Rotation);        
    }
    else
    {
        out_Location = Location;
        out_Rotation = Rotation;
    }
    //return;    
}

simulated function IsAimingAt()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ATarget[8388609];
    local /*0x35EA0000-0x00000000*/ private float Epsilon[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Loc, Rot;

    GetPlayerViewPoint(Loc, Rot);
    return (Normal(ATarget.Location - Loc) Dot Vector(Rot)) >= Epsilon;
    //return ReturnValue;    
}

simulated function LandingShake()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event NotifyPhysicsVolumeChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewVolume[8388609];

    //return;    
}

event NotifyHeadVolumeChange()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewVolume[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event NotifyLanded()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event NotifyHitWall()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[8388609], Wall;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event NotifyFallingHitWall()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[8388609], Wall;

    //return;    
}

event NotifyBump()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], HitNormal;
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

event NotifyJumpApex()
{
    //return;    
}

event NotifyMissedJump()
{
    //return;    
}

event ReachedPreciseDestination()
{
    //return;    
}

// Export UController::execInLatentExecution(FFrame&, void* const)
native final function InLatentExecution()
{
    local /*0x35EA0000-0x00000000*/ private int LatentActionNumber[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UController::execStopLatentExecution(FFrame&, void* const)
native final function StopLatentExecution();

simulated function DisplayDebug()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HUD[8388609];
    local /*0x35EA0000-0x00000000*/ private float out_YL[25165825], out_YPos;
    local /*0x35EA0000-0x00000000*/ private @NULL Canvas;

    Canvas = HUD.Canvas;
    // End:0x154
    if(HUD.ShouldDisplayDebug('Replication'))
    {
        // End:0x154
        if(Pawn == none)
        {
            // End:0xB1
            if(PlayerReplicationInfo == none)
            {
                Canvas.DrawText("NO PLAYERREPLICATIONINFO", false);                
            }
            else
            {
                PlayerReplicationInfo.DisplayDebug(HUD, out_YL, out_YPos);
            }
            out_YPos += out_YL;
            Canvas.SetPos(4.0000000, out_YPos);
            super.DisplayDebug(HUD, out_YL, out_YPos);
            return;
        }
    }
    // End:0x2D1
    if(HUD.ShouldDisplayDebug('Controller'))
    {
        Canvas.SetDrawColor(255, 0, 0);
        Canvas.DrawText((("CONTROLLER " $ (GetItemName(string(self)))) $ " Pawn ") $ (GetItemName(string(Pawn))));
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
        Canvas.DrawText(" bPreciseDestination:" @ string(bPreciseDestination));
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
    }
    // End:0x3FA
    if(HUD.ShouldDisplayDebug('AI'))
    {
        // End:0x372
        if(Enemy != none)
        {
            Canvas.DrawText((("     STATE: " $ string(GetStateName())) $ " Enemy ") $ Enemy.GetHumanReadableName(), false);            
        }
        else
        {
            Canvas.DrawText(("     STATE: " $ string(GetStateName())) $ " NO Enemy ", false);
        }
        out_YPos += out_YL;
        Canvas.SetPos(4.0000000, out_YPos);
    }
    //return;    
}

simulated function GetHumanReadableName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    // End:0x31
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.PlayerName;        
    }
    else
    {
        return GetItemName(string(self));
    }
    //return ReturnValue;    
}

function IsDead()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated function OnTeleport()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x5C
    if(Action != none)
    {
        // End:0x49
        if(Pawn != none)
        {
            Pawn.OnTeleport(Action);            
        }
        else
        {
            super.OnTeleport(Action);
        }
    }
    //return;    
}

function OnAttachToActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x3A
    if(Pawn != none)
    {
        Pawn.OnAttachToActor(Action);        
    }
    else
    {
        super.OnAttachToActor(Action);
    }
    //return;    
}

function OnToggleGodMode()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bGodMode = true;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bGodMode = false;            
        }
        else
        {
            bGodMode = !bGodMode;
        }
    }
    //return;    
}

simulated function OnSetPhysics()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x3A
    if(Pawn != none)
    {
        Pawn.OnSetPhysics(Action);        
    }
    else
    {
        super.OnSetPhysics(Action);
    }
    //return;    
}

simulated function OnSetVelocity()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x3A
    if(Pawn != none)
    {
        Pawn.OnSetVelocity(Action);        
    }
    else
    {
        super.OnSetVelocity(Action);
    }
    //return;    
}

simulated function NotifyCoverDisabled()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Link[8388609];
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAdjacentIdx[9437185];

    //return;    
}

simulated event NotifyCoverAdjusted()
{
    //return;    
}

simulated function NotifyCoverClaimViolation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewClaim[8388609], Link;
    local /*0x35EA0000-0x00000000*/ private int SlotIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    //return ReturnValue;    
}

simulated function OnModifyHealth()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x37
    if(Pawn != none)
    {
        Pawn.OnModifyHealth(Action);
    }
    //return;    
}

function NotifyAddInventory()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewItem[8388609];

    //return;    
}

simulated function OnToggleHidden()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    // End:0x37
    if(Pawn != none)
    {
        Pawn.OnToggleHidden(Action);
    }
    //return;    
}

event IsSpectating()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

event IsInCombat()
{
    local /*0x35EA0000-0x00000000*/ private bool bForceCheck[9437185], ReturnValue;

    //return ReturnValue;    
}

event CurrentLevelUnloaded()
{
    //return;    
}

function SendMessage()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Recipient[8388609];
    local /*0x35EA0000-0x00000000*/ private name MessageType[8388609];
    local /*0x35EA0000-0x00000000*/ private float Wait[8388609];
    local /*0x35EA0000-0x00000000*/ private class DamageType[9437185];

    //return;    
}

function ReadyForLift()
{
    //return;    
}

simulated function InitNavigationHandle()
{
    // End:0x27
    if(NavigationHandleClass != none)
    {
        NavigationHandle = new (self) NavigationHandleClass;
    }
    //return;    
}

simulated event InterpolationStarted()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InterpAction[8388609], GroupInst;

    // End:0x40
    if(Pawn != none)
    {
        Pawn.InterpolationStarted(InterpAction, GroupInst);
    }
    super.InterpolationStarted(InterpAction, GroupInst);
    //return;    
}

simulated event InterpolationFinished()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InterpAction[8388609];

    // End:0x37
    if(Pawn != none)
    {
        Pawn.InterpolationFinished(InterpAction);
    }
    super.InterpolationFinished(InterpAction);
    //return;    
}

event GeneratePathToActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Goal[8388609];
    local /*0x35EA0000-0x00000000*/ private float WithinDistance[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bAllowPartialPath[9437185], ReturnValue;

    //return ReturnValue;    
}

event GeneratePathToLocation()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Goal[8388609];
    local /*0x35EA0000-0x00000000*/ private float WithinDistance[9437185];
    local /*0x35EA0000-0x00000000*/ private bool bAllowPartialPath[9437185], ReturnValue;

    //return ReturnValue;    
}

state Dead
{
    ignores SeePlayer, HearNoise, KilledBy;

    function IsDead()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function PawnDied()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

        // End:0x33
        if(int(WorldInfo.NetMode) != int(NM_Client))
        {
            ScriptTrace();
        }
        //return;        
    }

    reliable server function ServerRestartPlayer()
    {
        // End:0x2B
        if(int(WorldInfo.NetMode) == int(NM_Client))
        {
            return;
        }
        // End:0x44
        if(Pawn != none)
        {
            UnPossess();
        }
        WorldInfo.Game.RestartPlayer(self);
        //return;        
    }
    stop;    
}

state RoundEnded
{
    ignores SeePlayer, HearNoise, KilledBy, NotifyBump, HitWall, NotifyPhysicsVolumeChange, 
	    NotifyHeadVolumeChange, Falling, TakeDamage, ReceiveWarning;

    function GamePlayEndedState()
    {
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        // End:0x71
        if(Pawn != none)
        {
            Pawn.TurnOff();
            StopFiring();
            // End:0x71
            if(!bIsPlayer)
            {
                Pawn.UnPossessed();
                Pawn = none;
            }
        }
        // End:0x83
        if(!bIsPlayer)
        {
            Destroy();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    bSlowerZAcquire=true
    MinHitWall=-1.0000000
    NavigationHandleClass=Class'NavigationHandle'
    SightCounterInterval=0.2000000
    MaxMoveTowardPawnTargetTime=1.2000000
    bHidden=true
    bOnlyRelevantToOwner=true
    bHiddenEd=true
    RotationRate=(Pitch=30000,Yaw=30000,Roll=2048)
}