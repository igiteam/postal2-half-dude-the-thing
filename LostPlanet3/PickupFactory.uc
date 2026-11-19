class PickupFactory extends NavigationPoint
    abstract
    nativereplication
    placeable
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force)
    classgroup(Pickups);

var(*) /*0x35EA0000-0x00000000*/ private bool bOnlyReplicateHidden;
var(*) /*0x35EA0000-0x00000000*/ private travel bool bPickupHidden[2097153];
var(*) /*0x35EA0000-0x00000000*/ private bool bPredictRespawns;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsSuperItem;
var(*) /*0x35EA0000-0x00000000*/ private bool bRespawnPaused;
var(*) /*0x35EA0000-0x00000000*/ private travel class InventoryType[2097153];
var(*) /*0x35EA0000-0x00000000*/ private float RespawnEffectTime;
var(*) /*0x35EA0000-0x00000000*/ private float MaxDesireability;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PickupMesh[524289];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ReplacementFactory;
var(*) /*0x35EA0000-0x00000000*/ private @NULL OriginalFactory;

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x3E
    if(VarName == 'bPickupHidden')
    {
        // End:0x31
        if(bPickupHidden)
        {
            SetPickupHidden();            
        }
        else
        {
            SetPickupVisible();
        }        
    }
    else
    {
        // End:0x5F
        if(VarName == 'InventoryType')
        {
            InitializePickup();
        }
    }
    //return;    
}

simulated event PreBeginPlay()
{
    InitializePickup();
    super(Actor).PreBeginPlay();
    //return;    
}

simulated function InitializePickup()
{
    // End:0x11
    if(InventoryType == none)
    {
        return;
    }
    bPredictRespawns = InventoryType.default.bPredictRespawns;
    MaxDesireability = InventoryType.default.MaxDesireability;
    SetPickupMesh();
    bIsSuperItem = InventoryType.default.bDelayedSpawn;
    //return;    
}

simulated event SetInitialState()
{
    bScriptInitialized = true;
    // End:0x2C
    if(InventoryType == none)
    {
        GotoState('Disabled');        
    }
    else
    {
        // End:0x4A
        if(bIsSuperItem)
        {
            GotoState('WaitingForMatch');            
        }
        else
        {
            super(Actor).SetInitialState();
        }
    }
    //return;    
}

simulated function ShutDown()
{
    GotoState('Disabled');
    //return;    
}

simulated function SetPickupMesh()
{
    // End:0xE7
    if(InventoryType.default.PickupFactoryMesh != none)
    {
        // End:0x51
        if(PickupMesh != none)
        {
            DetachComponent(PickupMesh);
            PickupMesh = none;
        }
        PickupMesh = new (self) InventoryType.default.PickupFactoryMesh.Class (InventoryType.default.PickupFactoryMesh);
        AttachComponent(PickupMesh);
        // End:0xDD
        if(bPickupHidden)
        {
            SetPickupHidden();            
        }
        else
        {
            SetPickupVisible();
        }
    }
    //return;    
}

function Reset()
{
    // End:0x1E
    if(bIsSuperItem)
    {
        GotoState('Sleeping');        
    }
    else
    {
        GotoState('Pickup');
    }
    super(Actor).Reset();
    //return;    
}

function CheckForErrors()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL HitActor, HitLocation, HitNormal;

    HitActor = Trace(HitLocation, HitNormal, Location - vect(0.0000000, 0.0000000, 10.0000000), Location, false);
    // End:0x55
    if(HitActor == none)
    {
        return true;
    }
    return super(Actor).CheckForErrors();
    //return ReturnValue;    
}

function SetRespawn()
{
    // End:0x59
    if(((GetRespawnTime()) != float(0)) && WorldInfo.Game.ShouldRespawn(self))
    {
        StartSleeping();        
    }
    else
    {
        GotoState('Disabled');
    }
    //return;    
}

function StartSleeping()
{
    GotoState('Sleeping');
    //return;    
}

event DetourWeight()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private float PathWeight[8388609], ReturnValue;

    return ((ReplacementFactory != none) ? ReplacementFactory.DetourWeight(Other, PathWeight) : 0.0000000);
    //return ReturnValue;    
}

function SpawnCopyFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Recipient[8388609], Inv;

    Inv = Spawn(InventoryType);
    // End:0x83
    if(Inv != none)
    {
        Inv.GiveTo(Recipient);
        Inv.AnnouncePickup(Recipient);
    }
    //return;    
}

function ReadyToPickup()
{
    local /*0x35EA0000-0x00000000*/ private float MaxWait[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function GiveTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    SpawnCopyFor(P);
    PickedUpBy(P);
    //return;    
}

function PickedUpBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    SetRespawn();
    TriggerEventClass(Class'SeqEvent_PickupStatusChange', P, 1);
    // End:0xE1
    if((P.Controller != none) && P.Controller.MoveTarget == self)
    {
        P.SetAnchor(self);
        P.Controller.MoveTimer = -1.0000000;
    }
    //return;    
}

function RecheckValidTouch()
{
    //return;    
}

function GetRespawnTime()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    return InventoryType.default.RespawnTime;
    //return ReturnValue;    
}

function RespawnEffect()
{
    //return;    
}

simulated function SetPickupHidden()
{
    bForceNetUpdate = true;
    bPickupHidden = true;
    // End:0x47
    if(PickupMesh != none)
    {
        PickupMesh.SetHidden(true);
    }
    //return;    
}

simulated function SetPickupVisible()
{
    bForceNetUpdate = true;
    bPickupHidden = false;
    // End:0x47
    if(PickupMesh != none)
    {
        PickupMesh.SetHidden(false);
    }
    //return;    
}

event Destroyed()
{
    // End:0x37
    if(OriginalFactory != none)
    {
        OriginalFactory.ReplacementFactory = ReplacementFactory;
    }
    // End:0x6E
    if(ReplacementFactory != none)
    {
        ReplacementFactory.OriginalFactory = OriginalFactory;
    }
    //return;    
}

function DelayRespawn()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

auto state Pickup
{
    event DetourWeight()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
        local /*0x35EA0000-0x00000000*/ private float PathWeight[8388609], ReturnValue;

        return InventoryType.static.DetourWeight(Other, PathWeight);
        //return ReturnValue;        
    }

    function ReadyToPickup()
    {
        local /*0x35EA0000-0x00000000*/ private float MaxWait[8388609];
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return true;
        //return ReturnValue;        
    }

    function ValidTouch()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x3A
        if((Other == none) || !Other.bCanPickupInventory)
        {
            return false;            
        }
        else
        {
            // End:0x76
            if(Other.Controller == none)
            {
                SetTimer(0.2000000, false, 'RecheckValidTouch');
                return false;                
            }
            else
            {
                // End:0xBC
                if(!FastTrace(Other.Location, Location))
                {
                    SetTimer(0.5000000, false, 'RecheckValidTouch');
                    return false;
                }
            }
        }
        // End:0x108
        if(WorldInfo.Game.PickupQuery(Other, InventoryType, self))
        {
            return true;
        }
        return false;
        //return ReturnValue;        
    }

    function RecheckValidTouch()
    {
        CheckTouching();
        //return;        
    }

    event @NULL Touch()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal, P;

        P = Pawn(Other);
        // End:0x56
        if((P != none) && ValidTouch(P))
        {
            GiveTo(P);
        }
        //return;        
    }

    function CheckTouching()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL P;

        // End:0x61
        foreach TouchingActors(Class'Pawn', P)
        {
            Touch(P, none, Location, Normal(Location - P.Location));            
        }        
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        TriggerEventClass(Class'SeqEvent_PickupStatusChange', none, 0);
        //return;        
    }
Begin:

    CheckTouching();
    stop;        
}

state WaitingForMatch
{
    ignores Touch;

    function MatchStarting()
    {
        GotoState('Sleeping');
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        SetPickupHidden();
        //return;        
    }
    stop;    
}

state Sleeping
{
    ignores Touch, StartSleeping;

    function ReadyToPickup()
    {
        local /*0x35EA0000-0x00000000*/ private float MaxWait[8388609];
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return ((bPredictRespawns && !bRespawnPaused) && LatentFloat <= MaxWait) && LatentFloat > 0.0000000;
        //return ReturnValue;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        SetPickupHidden();
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        SetPickupVisible();
        //return;        
    }
Begin:

    bRespawnPaused = true;
    J0x0C:

    // End:0x24 [Loop If]
    if(DelayRespawn())
    {
        Sleep(1.0000000);
        // [Loop Continue]
        goto J0x0C;
    }
    bRespawnPaused = false;
    Sleep((GetRespawnTime()) - RespawnEffectTime);
Respawn:


    RespawnEffect();
    Sleep(RespawnEffectTime);
    GotoState('Pickup');
    stop;                
}

state Disabled
{
    ignores Reset, StartSleeping;

    function ReadyToPickup()
    {
        local /*0x35EA0000-0x00000000*/ private float MaxWait[8388609];
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        return false;
        //return ReturnValue;        
    }

    simulated event SetInitialState()
    {
        bScriptInitialized = true;
        //return;        
    }

    simulated event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        SetPickupHidden();
        SetCollision(false, false);
        //return;        
    }

    simulated event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        SetPickupVisible();
        //return;        
    }
    stop;    
}

defaultproperties
{
    bOnlyReplicateHidden=true
    // Reference: CylinderComponent'Default__PickupFactory.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bStatic=false
    bIgnoreEncroachers=true
    bAlwaysRelevant=true
    bCollideWhenPlacing=false
    bCollideActors=true
    NetUpdateFrequency=1.0000000
    CollisionComponent=CollisionCylinder
    SupportedEvents=/* Array type was not detected. */
}