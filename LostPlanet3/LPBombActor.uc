class LPBombActor extends LPSkeletalMeshActor
    abstract
    nativereplication
    hidecategories(AnimDependency,Navigation);

const CurrentTimeRefreshRate = 0.5;

enum EBombDeploymentState
{
    EBombDeploymentState_Uninitialized,// 0
    EBombDeploymentState_Disabled,  // 1
    EBombDeploymentState_Ghosted,   // 2
    EBombDeploymentState_Deploying, // 3
    EBombDeploymentState_Deployed,  // 4
    EBombDeploymentState_Disarming, // 5
    EBombDeploymentState_Exploded,  // 6
    EBombDeploymentState_MAX        // 7
};

enum EBombVisibility
{
    EBombVisibility_Disabled,       // 0
    EBombVisibility_Ghosted,        // 1
    EBombVisibility_Visible,        // 2
    EBombVisibility_MAX             // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPBombActor.EBombVisibility VisibilityState[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPBombActor.EBombDeploymentState DeploymentState[2097153];
var(0.25_Pct) /*0x7C540000-0x00000000*/ private bool bEnabled[2162689];
var(0.25_Pct) /*0x7C540000-0x00000000*/ private bool bDisableBombExplosion[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLoneBomber;
var(0.25_Pct) /*0x7C540000-0x00000000*/ private float Radius[65537];
var(0.25_Pct) /*0x7C540000-0x00000000*/ private int BombDeploymentTeamIndex[65537];
var(0.25_Pct) /*0x7C540000-0x00000000*/ private float TimeUntilExplode[65537];
var(0.25_Pct) /*0x7C540000-0x00000000*/ private float TimeToArmBomb[65537];
var(0.25_Pct) /*0x7C540000-0x00000000*/ private float TimeToDisarmBomb[65537];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TransparentMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SeqOpenHold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SeqClosedHold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SeqOpening;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class MyDamageType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BombTuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL BomberPRI;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentTeamIndex[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float CurrentTimeRemaining[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DeltaTime;
var(0.25_Pct) /*0x9AE30000-0x00000400*/ private const export @NULL ObjectiveComponent[589825];

function PlantBomb()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];

    //return;    
}

function DisarmBomb()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];

    //return;    
}

simulated event PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    super(SPSkeletalMeshActor).PostBeginPlay();
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.BombActorList.Find(self);    
    // End:0xA0
    if(iIndex == -1)
    {
        LPMI.BombActorList.AddItem(self);        
    }
    //return;    
}

simulated event Destroyed()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPMI;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    super(SkeletalMeshActor).Destroyed();
    LPMI = LPMapInfo(WorldInfo.GetMapInfo());
    iIndex = LPMI.BombActorList.Find(self);    
    // End:0xA3
    if(iIndex >= 0)
    {
        LPMI.BombActorList.Remove(iIndex, 1);        
    }
    //return;    
}

simulated event GetMasterTuneDataReference()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return BombTuneData;
    //return ReturnValue;    
}

simulated function InitTuneData()
{
    local /*0x97E50000-0x00000000*/ private @NULL TuneData[8388609];

    BombTuneData = LPTuneDataBomb(TuneData);
    super(Actor).InitTuneData(TuneData);
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0xC3
    if(VarName == 'DeploymentState')
    {
        switch(DeploymentState)
        {
            // End:0x2F
            case 0:
            // End:0x45
            case 1:
                GotoState('Disabled');
                // End:0xB6
                break;
            // End:0x5B
            case 2:
                GotoState('Ghosted');
                // End:0xB6
                break;
            // End:0x71
            case 3:
                GotoState('Deploying');
                // End:0xB6
                break;
            // End:0x87
            case 4:
                GotoState('Deployed');
                // End:0xB6
                break;
            // End:0x9D
            case 5:
                GotoState('Disarming');
                // End:0xB6
                break;
            // End:0xB3
            case 6:
                GotoState('Exploded');
                // End:0xB6
                break;
            // End:0xFFFF
            default:
                break;
        }
        NotifyHUDStateChanged();        
    }
    else
    {
        // End:0xF0
        if(VarName == 'VisibilityState')
        {
            SetVisibilityState(VisibilityState);            
        }
        else
        {
            super(SPSkeletalMeshActor).ReplicatedEvent(VarName);
        }
    }
    //return;    
}

simulated function SetVisibilityState()
{
    local /*0x97E50000-0x00000000*/ private byte inVisibilityState[8388609];

    VisibilityState = inVisibilityState;
    switch(VisibilityState)
    {
        // End:0xDE
        case 0:
            TransparentMesh.SetHidden(true);
            // End:0x80
            if(TransparentMesh.bAttached)
            {
                DetachComponent(TransparentMesh);
            }
            SkeletalMeshComponent.SetHidden(true);
            // End:0xD5
            if(SkeletalMeshComponent.bAttached)
            {
                DetachComponent(SkeletalMeshComponent);
            }
            SetCollision(false, false);
            // End:0x2C3
            break;
        // End:0x1CF
        case 1:
            TransparentMesh.SetHidden(false);
            // End:0x13A
            if(!TransparentMesh.bAttached)
            {
                AttachComponent(TransparentMesh);
            }
            SkeletalMeshComponent.SetHidden(true);
            // End:0x18F
            if(SkeletalMeshComponent.bAttached)
            {
                DetachComponent(SkeletalMeshComponent);
            }
            // End:0x1C6
            if(!LightEnvironment.bAttached)
            {
                AttachComponent(LightEnvironment);
            }
            SetCollision(true, false);
            // End:0x2C3
            break;
        // End:0x2C0
        case 2:
            TransparentMesh.SetHidden(true);
            // End:0x229
            if(TransparentMesh.bAttached)
            {
                DetachComponent(TransparentMesh);
            }
            SkeletalMeshComponent.SetHidden(false);
            // End:0x280
            if(!SkeletalMeshComponent.bAttached)
            {
                AttachComponent(SkeletalMeshComponent);
            }
            // End:0x2B7
            if(!LightEnvironment.bAttached)
            {
                AttachComponent(LightEnvironment);
            }
            SetCollision(true, false);
            // End:0x2C3
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function SetDeploymentState()
{
    local /*0x97E50000-0x00000000*/ private byte NewState[8388609];

    DeploymentState = NewState;
    NotifyHUDStateChanged();
    //return;    
}

simulated function NotifyHUDStateChanged()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    // End:0x79
    foreach LocalPlayerControllers(Class'LPPlayerController', LPC)
    {
        // End:0x78
        if(LPC.myLPHUD != none)
        {
            LPC.myLPHUD.BombPointChangedState(self);
        }        
    }    
    //return;    
}

function SetTimeRemaining()
{
    local /*0x97E50000-0x00000000*/ private float TimeRemaining[8388609];

    ClearTimer('UpdateTimeRemaining');
    DeltaTime = CurrentTimeRemaining - TimeRemaining;
    CurrentTimeRemaining = TimeRemaining;
    SetTimer(0.5000000, false, 'UpdateTimeRemaining');
    //return;    
}

function UpdateTimeRemaining()
{
    CurrentTimeRemaining = FMax(CurrentTimeRemaining - 0.5000000, 0.0000000);
    // End:0x45
    if(CurrentTimeRemaining > float(0))
    {
        SetTimer(0.5000000, false, 'UpdateTimeRemaining');
    }
    //return;    
}

final function SetForceExplosionTexturesRelevantTimers()
{
    ClearForceExplosionTexturesRelevantTimers();
    SetTimer(FMax(CurrentTimeRemaining - 5.0000000, 0.0000000), false, 'InitialForceExplosionTexturesRelevant');
    //return;    
}

final function ClearForceExplosionTexturesRelevantTimers()
{
    ClearTimer('InitialForceExplosionTexturesRelevant');
    ClearTimer('UpdateForceExplosionTexturesRelevant');
    //return;    
}

private final function InitialForceExplosionTexturesRelevant()
{
    UpdateForceExplosionTexturesRelevant();
    SetTimer(0.5000000, true, 'UpdateForceExplosionTexturesRelevant');
    //return;    
}

private final function UpdateForceExplosionTexturesRelevant()
{
    // End:0xBC
    if((BombTuneData != none) && BombTuneData.ExplosionTemplate != none)
    {
        BombTuneData.ExplosionTemplate.ForceExplosionTexturesRelevant(((SkeletalMeshComponent.PhysMaterialOverride != none) ? SPPhysicalMaterial(SkeletalMeshComponent.PhysMaterialOverride) : none), 1.0000000);
    }
    //return;    
}

simulated function Reset()
{
    ResetBomb();
    //return;    
}

simulated function OnToggle()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bEnabled = true;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bEnabled = false;            
        }
        else
        {
            // End:0xDB
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bEnabled = !bEnabled;
            }
        }
    }
    ResetBomb();
    // End:0x109
    if(bEnabled)
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveBegin', self);
    }
    //return;    
}

function OnObjectiveFinish()
{
    local /*0x97E50000-0x00000000*/ private @NULL inAction[8388609];

    //return;    
}

simulated function ResetBomb()
{
    ResetBomber();
    // End:0x28
    if(bEnabled)
    {
        GotoState('Ghosted');        
    }
    else
    {
        GotoState('Disabled');
    }
    //return;    
}

simulated function ResetBomber()
{
    bLoneBomber = false;
    BomberPRI = none;
    CurrentTeamIndex = -1;
    //return;    
}

function AbortBombPlant()
{
    SetTimeRemaining(0.0000000);
    GotoState('Ghosted');
    //return;    
}

function IsAvailable()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function Explode()
{
    //return;    
}

simulated function DoExplosion()
{
    local /*0x97E50000-0x00000000*/ private @NULL P, explosionActor, ExplosionLoc;

    // End:0x1E4
    if(bDisableBombExplosion == false)
    {
        ExplosionLoc = Location;
        explosionActor = Spawn(Class'LPExplosionActor',,, ExplosionLoc + (vect(0.0000000, 0.0000000, 1.0000000) * float(32)), Rotator(vect(0.0000000, 0.0000000, 1.0000000)));
        // End:0x1E4
        if(explosionActor != none)
        {
            explosionActor.TheWeaponThatSpawnedMe = none;
            explosionActor.Instigator = Instigator;
            explosionActor.InstigatorController = ((Instigator == none) ? none : Instigator.Controller);
            explosionActor.bDrawDebug = false;
            explosionActor.ExplosionPhysMaterial = ((SkeletalMeshComponent.PhysMaterialOverride != none) ? SPPhysicalMaterial(SkeletalMeshComponent.PhysMaterialOverride) : none);
            explosionActor.Explode(BombTuneData.ExplosionTemplate);
        }
    }
    // End:0x233
    foreach LocalPlayerControllers(Class'LPPlayerController', P)
    {
        // End:0x232
        if(P != none)
        {
            P.ClearCurrentBombActor(self);
        }        
    }    
    // End:0x2BA
    if(int(Role) == int(ROLE_Authority))
    {
        TriggerEventClass(Class'LPSeqEvent_ObjectiveDestroyed', LPPlayerController(BomberPRI.Owner));
        // End:0x2BA
        if(bLoneBomber)
        {
            BomberPRI.ServerGiveAward('Emblem_LoneWolf');
        }
    }
    //return;    
}

simulated function CanPlantBomb()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function StartPlantBomb()
{
    local /*0x97E50000-0x00000000*/ private @NULL LP[8388609];

    //return;    
}

function SetDeployed()
{
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609];

    SetDeploymentState(4);
    TriggerEventClass(Class'LPSeqEvent_ObjectiveArmed', EventInstigator);
    GotoState('Deployed');
    //return;    
}

simulated function IsDeployed()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function CanDisarmBomb()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function Countdown()
{
    //return;    
}

simulated function GetCountdownTime()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x2C
    if(IsTimerActive('Countdown'))
    {
        return GetRemainingTimeForTimer('Countdown');
    }
    return 0.0000000;
    //return ReturnValue;    
}

function StartDisarm()
{
    local /*0x97E50000-0x00000000*/ private @NULL LP[8388609];

    //return;    
}

function AbortBombDisarm()
{
    //return;    
}

function SetDisarmed()
{
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609];

    //return;    
}

simulated function GetTimeToArmBomb()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return TimeToArmBomb;
    //return ReturnValue;    
}

simulated function GetTimeToDisarmBomb()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return TimeToDisarmBomb;
    //return ReturnValue;    
}

simulated function IsTouching()
{
    local /*0x97E50000-0x00000000*/ private @NULL IsTouchingActor[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL A;

    // End:0x33
    foreach TouchingActors(Class'Engine.Actor', A)
    {
        // End:0x32
        if(A == IsTouchingActor)
        {            
            return true;
        }        
    }    
    return false;
    //return ReturnValue;    
}

function ExternalTriggerEvent()
{
    local /*0x97E50000-0x00000000*/ private class EventClassToTrigger[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(EventInstigator == none)
    {
        EventInstigator = self;
    }
    return TriggerEventClass(EventClassToTrigger, EventInstigator);
    //return ReturnValue;    
}

function GetAnimationLength()
{
    local /*0x97E50000-0x00000000*/ private name AnimName[8388609];
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL AnimSequence;

    // End:0x100
    if((SkeletalMeshComponent != none) && SkeletalMeshComponent.Animations != none)
    {
        AnimSequence = AnimNodeSequence(SkeletalMeshComponent.Animations.FindAnimNode('None'));
        // End:0x100
        if(AnimSequence != none)
        {
            AnimSequence.SetAnim(AnimName);
            AnimSequence.Rate = 1.0000000;
            return AnimSequence.GetAnimPlaybackLength();
        }
    }
    return 0.0000000;
    //return ReturnValue;    
}

state Exploded
{
    ignores EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        SetDeploymentState(6);
        SetVisibilityState(0);
        SkeletalMeshComponent.Animations.StopAnim();
        ClearTimer('Explode');
        ClearForceExplosionTexturesRelevantTimers();
        DoExplosion();
        //return;        
    }
    stop;    
}

state Disabled
{
    ignores EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];

        ClearTimer('Explode');
        ClearForceExplosionTexturesRelevantTimers();
        SetDeploymentState(1);
        SetVisibilityState(0);
        SkeletalMeshComponent.Animations.StopAnim();
        //return;        
    }
    stop;    
}

auto state Ghosted
{
    ignores EndState;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPP, LPPC;

        ClearTimer('Explode');
        ResetBomber();
        // End:0x3D
        if(!bEnabled)
        {
            GotoState('Disabled');
            return;
        }
        SetDeploymentState(2);
        SetVisibilityState(1);
        // End:0x7F
        if(int(Role) == int(ROLE_Authority))
        {
            PlayCustomAnim(true, SeqClosedHold);
        }
        ClearForceExplosionTexturesRelevantTimers();
        // End:0x12B
        foreach TouchingActors(Class'LPPlayerPawn', LPP)
        {
            // End:0x12A
            if(LPP.IsAliveAndWell())
            {
                LPPC = LPPlayerController(LPP.Controller);
                // End:0x12A
                if(CanPlantBomb(LPPC))
                {
                    LPPC.SetBombActor(self);
                }
            }            
        }        
        //return;        
    }

    simulated function StartPlantBomb()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LP[8388609];

        GotoState('StartPlantBombState');
        StartPlantBomb(LP);
        //return;        
    }

    event UnTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPP, LPC;

        // End:0x9F
        if(int(Role) == int(ROLE_Authority))
        {
            LPP = LPPlayerPawn(Other);
            // End:0x9F
            if(LPP != none)
            {
                LPC = LPPlayerController(LPP.Controller);
                // End:0x9F
                if(LPC != none)
                {
                    LPC.ClearCurrentBombActor(self);
                }
            }
        }
        super(Actor).UnTouch(Other);
        //return;        
    }

    event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPP, LPC;

        super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
        // End:0xE7
        if(int(Role) == int(ROLE_Authority))
        {
            LPP = LPPlayerPawn(Other);
            // End:0x6F
            if(LPP == none)
            {
                return;
            }
            LPC = LPPlayerController(LPP.Controller);
            // End:0xB1
            if(LPC == none)
            {
                return;
            }
            // End:0xE7
            if(CanPlantBomb(LPC))
            {
                LPC.SetBombActor(self);
            }
        }
        //return;        
    }

    function IsAvailable()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    simulated function CanPlantBomb()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x61
        if((LPPC.Pawn == none) || !LPPC.Pawn.IsAliveAndWell())
        {
            return false;
        }
        // End:0xA7
        if((BombDeploymentTeamIndex == -1) || int(LPPC.GetTeamNum()) == BombDeploymentTeamIndex)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }
    stop;    
}

state StartPlantBombState
{
    ignores BeginState;

    simulated function StartPlantBomb()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LP[8388609], LPP, LPPC;

        // End:0x11
        if(LP == none)
        {
            return;
        }
        // End:0x92
        foreach TouchingActors(Class'LPPlayerPawn', LPP)
        {
            // End:0x91
            if(LPP != LP)
            {
                LPPC = LPPlayerController(LPP.Controller);
                LPPC.ClearCurrentBombActor(self);
            }            
        }        
        CurrentTeamIndex = int(LP.GetTeamNum());
        BomberPRI = LPPRI(LP.PlayerReplicationInfo);
        //return;        
    }

    simulated function PlantBomb()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LP[8388609];

        GotoState('Deploying');
        //return;        
    }
    stop;    
}

state Deploying
{
    ignores OnAnimEnd;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private float AnimLength, OpenLength, Rate;

        ClearTimer('Explode');
        SetDeploymentState(3);
        SetVisibilityState(2);
        // End:0xBD
        if(int(Role) == int(ROLE_Authority))
        {
            AnimLength = GetAnimationLength(SeqOpening);
            OpenLength = GetTimeToArmBomb(none);
            Rate = AnimLength / OpenLength;
            Rate = 1.0000000;
            PlayCustomAnim(false, SeqOpening,, Rate);
        }
        //return;        
    }
    stop;    
}

state Deployed
{
    ignores EndState, AbortBombPlant, PlantBomb;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private @NULL LPP, LPPC;

        // End:0x2E
        if(PreviousStateName != 'Disarming')
        {
            SetTimer(TimeUntilExplode, false, 'Countdown');
        }
        SetDeploymentState(4);
        SetVisibilityState(2);
        // End:0x145
        if(int(Role) == int(ROLE_Authority))
        {
            PlayCustomAnim(true, SeqOpenHold);
            ClearTimer('Explode');
            // End:0xC8
            if(PreviousStateName != 'Disarming')
            {
                SetTimer(TimeUntilExplode, false, 'Explode');
                SetTimeRemaining(TimeUntilExplode);                
            }
            else
            {
                SetTimer(CurrentTimeRemaining, false, 'Explode');
            }
            bLoneBomber = (BomberPRI != none) && !BomberPRI.CheckForNearbyPlayers(Class'LPAwardManager'.static.GetDefaultAwardParam('Emblem_LoneWolf'), true);
        }
        SetForceExplosionTexturesRelevantTimers();
        // End:0x1F1
        foreach TouchingActors(Class'LPPlayerPawn', LPP)
        {
            // End:0x1F0
            if(LPP.IsAliveAndWell())
            {
                LPPC = LPPlayerController(LPP.Controller);
                // End:0x1F0
                if(CanDisarmBomb(LPPC))
                {
                    LPPC.SetBombActor(self);
                }
            }            
        }        
        //return;        
    }

    simulated function IsDeployed()
    {
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function DisarmBomb()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609];

        GotoState('Disarming');
        //return;        
    }

    event @NULL Touch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, LPP, LPC;

        super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
        // End:0xE7
        if(int(Role) == int(ROLE_Authority))
        {
            LPP = LPPlayerPawn(Other);
            // End:0x6F
            if(LPP == none)
            {
                return;
            }
            LPC = LPPlayerController(LPP.Controller);
            // End:0xB1
            if(LPC == none)
            {
                return;
            }
            // End:0xE7
            if(CanDisarmBomb(LPC))
            {
                LPC.SetBombActor(self);
            }
        }
        //return;        
    }

    event UnTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], LPP, LPC;

        // End:0x9F
        if(int(Role) == int(ROLE_Authority))
        {
            LPP = LPPlayerPawn(Other);
            // End:0x9F
            if(LPP != none)
            {
                LPC = LPPlayerController(LPP.Controller);
                // End:0x9F
                if(LPC != none)
                {
                    LPC.ClearCurrentBombActor(self);
                }
            }
        }
        super(Actor).UnTouch(Other);
        //return;        
    }

    simulated function CanDisarmBomb()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LPPC[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x61
        if((LPPC.Pawn == none) || !LPPC.Pawn.IsAliveAndWell())
        {
            return false;
        }
        // End:0xA7
        if((CurrentTeamIndex != -1) && int(LPPC.GetTeamNum()) == CurrentTeamIndex)
        {
            return false;
        }
        // End:0xED
        if((BombDeploymentTeamIndex == -1) || int(LPPC.GetTeamNum()) != BombDeploymentTeamIndex)
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function Explode()
    {
        GotoState('Exploded');
        //return;        
    }

    function StartDisarm()
    {
        local /*0x97E50000-0x00000000*/ private @NULL LP[8388609], LPPC;

        LPPC = LPPlayerController(LP.Controller);
        // End:0x68
        if((LPPC == none) || !LP.IsAliveAndWell())
        {
            return;
        }
        LPPC.SetBombActor(self);
        GotoState('StartDisarmState');
        //return;        
    }
    stop;    
}

state StartDisarmState
{
    ignores BeginState;
    stop;    
}

state Disarming
{
    ignores EndState, OnAnimEnd;

    simulated event BeginState()
    {
        local /*0x97E50000-0x00000000*/ private name PreviousStateName[8388609];
        local /*0x97E50000-0x00000000*/ private float AnimLength, OpenLength, Rate;

        SetDeploymentState(5);
        SetVisibilityState(2);
        // End:0xAB
        if(int(Role) == int(ROLE_Authority))
        {
            AnimLength = GetAnimationLength(SeqOpening);
            OpenLength = GetTimeToArmBomb(none);
            Rate = AnimLength / OpenLength;
            Rate = 1.0000000;
            PlayCustomAnim(false, SeqOpening,, -Rate);
        }
        //return;        
    }

    function SetDisarmed()
    {
        local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609];

        TriggerEventClass(Class'LPSeqEvent_ObjectiveDisarmed', EventInstigator);
        ClearTimer('Countdown');
        GotoState('Ghosted');
        //return;        
    }

    simulated function AbortBombDisarm()
    {
        SetTimeRemaining(CurrentTimeRemaining + DeltaTime);
        GotoState('Deployed');
        //return;        
    }

    function Explode()
    {
        GotoState('Exploded');
        //return;        
    }
    stop;    
}

defaultproperties
{
    Radius=80.0000000
    BombDeploymentTeamIndex=-1
    TimeUntilExplode=10.0000000
    TimeToArmBomb=5.0000000
    TimeToDisarmBomb=5.0000000
    // Reference: StaticMeshComponent'Default__LPBombActor.TransparentMesh0'
    begin object name=TransparentMesh0 class=Class'Engine.StaticMeshComponent'
    end object
    TransparentMesh=TransparentMesh0
    CurrentTeamIndex=-1
    // Reference: LPObjectiveComponentPlantBomb'Default__LPBombActor.ObjectiveComp'
    begin object name=ObjectiveComp class=Class'LPObjectiveComponentPlantBomb'
    end object
    ObjectiveComponent=ObjectiveComp
    // Reference: SPHeadTrackComponent'Default__LPBombActor.SPHeadTrackComponent0'
    begin object name=SPHeadTrackComponent0
    end object
    HeadTrackComponent=SPHeadTrackComponent0
    // Reference: SkeletalMeshComponent'Default__LPBombActor.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    SkeletalMeshComponent=SkeletalMeshComponent0
    // Reference: DynamicLightEnvironmentComponent'Default__LPBombActor.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    LightEnvironment=MyLightEnvironment
    // Reference: AudioComponent'Default__LPBombActor.FaceAudioComponent'
    begin object name=FaceAudioComponent
    end object
    FacialAudioComp=FaceAudioComponent
    Components[0]=MyLightEnvironment
    Components[1]=SkeletalMeshComponent0
    Components[2]=FaceAudioComponent
    Components[3]=SPHeadTrackComponent0
    // Reference: CylinderComponent'Default__LPBombActor.CollisionCylinder0'
    begin object name=CollisionCylinder0 class=Class'Engine.CylinderComponent'
    end object
    Components[4]=CollisionCylinder0
    Components[5]=TransparentMesh0
    Components[6]=ObjectiveComp
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    CollisionType=ECollisionType.COLLIDE_TouchAllButWeapons
    bAlwaysRelevant=true
    bGameRelevant=true
    bCollideWhenPlacing=true
    bCollideActors=true
    CollisionComponent=CollisionCylinder0
    SupportedEvents=/* Array type was not detected. */
}