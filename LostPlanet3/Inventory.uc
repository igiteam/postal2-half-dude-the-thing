class Inventory extends Actor
    abstract
    nativereplication
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000000*/ private Inventory Inventory[2097153];
var(*) /*0x35EA0000-0x00000000*/ private InventoryManager InvManager[2097153];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string ItemName;
var(*) /*0x35EA0000-0x00000000*/ private bool bDropOnDeath;
var(*) /*0x35EA0000-0x00000000*/ private bool bDelayedSpawn;
var(*) /*0x35EA0000-0x00000000*/ private bool bPredictRespawns;
var(*) /*0x2C390000-0x00000000*/ private float RespawnTime[65537];
var(*) /*0x35EA0000-0x00000000*/ private float MaxDesireability;
var(*) /*0x2C390000-0x00000000*/ private editfixedsize string PickupMessage;
var(*) /*0x2C390000-0x00000000*/ private @NULL PickupSound[65537];
var(*) /*0x2C390000-0x00000000*/ private editfixedsize string PickupForce[65537];
var(*) /*0x35EA0000-0x00000000*/ private class DroppedPickupClass;
var(*) /*0x35EA0000-0x00000400*/ private export @NULL DroppedPickupMesh[524289];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PickupFactoryMesh[524289];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL DroppedPickupParticles[524289];

simulated function GetHumanReadableName()
{
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return default.ItemName;
    //return ReturnValue;    
}

event Destroyed()
{
    // End:0x85
    if((Pawn(Owner) != none) && Pawn(Owner).InvManager != none)
    {
        Pawn(Owner).InvManager.RemoveFromInventory(self);
    }
    //return;    
}

static function BotDesireability()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PickupHolder[8388609], P, C;
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL AlreadyHas;
    local /*0x35EA0000-0x00000000*/ private float desire;

    desire = default.MaxDesireability;
    // End:0x6D
    if(default.RespawnTime < float(10))
    {
        AlreadyHas = P.FindInventoryType(default.Class);
        // End:0x6D
        if(AlreadyHas != none)
        {
            return -1.0000000;
        }
    }
    return desire;
    //return ReturnValue;    
}

static function DetourWeight()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private float PathWeight[8388609], ReturnValue;

    return 0.0000000;
    //return ReturnValue;    
}

function GiveTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    // End:0x6B
    if((Other != none) && Other.InvManager != none)
    {
        Other.InvManager.AddInventory(self);
    }
    //return;    
}

function AnnouncePickup()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    Other.HandlePickup(self);
    // End:0x5C
    if(PickupSound != none)
    {
        Other.PlaySound(PickupSound);
    }
    //return;    
}

function GivenTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL thisPawn[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bDoNotActivate[9437185];

    Instigator = thisPawn;
    ClientGivenTo(thisPawn, bDoNotActivate);
    //return;    
}

reliable client simulated function ClientGivenTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewOwner[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bDoNotActivate[8388609];

    SetOwner(NewOwner);
    Instigator = NewOwner;
    // End:0x89
    if((NewOwner != none) && NewOwner.Controller != none)
    {
        NewOwner.Controller.NotifyAddInventory(self);
    }
    //return;    
}

function ItemRemovedFromInvManager()
{
    //return;    
}

function DenyPickupQuery()
{
    local /*0x35EA0000-0x00000000*/ private class ItemClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Pickup[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(ItemClass == Class)
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function DropFrom()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StartLocation[8388609], StartVelocity, P;

    // End:0x6A
    if((Instigator != none) && Instigator.InvManager != none)
    {
        Instigator.InvManager.RemoveFromInventory(self);
    }
    // End:0x8F
    if((DroppedPickupClass == none) || DroppedPickupMesh == none)
    {
        Destroy();
        return;
    }
    P = Spawn(DroppedPickupClass,,, StartLocation);
    // End:0xCF
    if(P == none)
    {
        Destroy();
        return;
    }
    P.SetPhysics(2);
    P.Inventory = self;
    P.InventoryClass = Class;
    P.Velocity = StartVelocity;
    P.Instigator = Instigator;
    P.SetPickupMesh(DroppedPickupMesh);
    P.SetPickupParticles(DroppedPickupParticles);
    P.bKillDuringLevelTransition = true;
    // End:0x22C
    if(Instigator != none)
    {
        Instigator.AddToActorFactorySpawnedList(P);        
    }
    Instigator = none;
    GotoState('None');
    //return;    
}

static function GetLocalString()
{
    local /*0x35EA0000-0x00000000*/ private int Switch[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL RelatedPRI_1[9437185], RelatedPRI_2;
    local /*0x35EA0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return default.PickupMessage;
    //return ReturnValue;    
}

defaultproperties
{
    MaxDesireability=0.1000000
    PickupMessage="Snagged an item."
    DroppedPickupClass=Class'DroppedPickup'
    Components[0]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bHidden=true
    bOnlyRelevantToOwner=true
    bReplicateMovement=false
    bOnlyDirtyReplication=true
    NetPriority=1.4000000
}