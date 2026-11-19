class InventoryManager extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000000*/ private Inventory InventoryChain[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PendingWeapon;
var(*) /*0x35EA0000-0x00000000*/ private @NULL LastAttemptedSwitchToWeapon;
var(*) /*0x35EA0000-0x00000000*/ private bool bMustHoldWeapon;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PendingFire;

event PostBeginPlay()
{
    super.PostBeginPlay();
    Instigator = Pawn(Owner);
    //return;    
}

simulated function GetPendingFireLength()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    return PendingFire.Length;
    //return ReturnValue;    
}

simulated function SetPendingFire()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private int InFiringMode[8388609];

    // End:0x2D
    if(InFiringMode < PendingFire.Length)
    {
        PendingFire[InFiringMode] = 1;
    }
    //return;    
}

simulated function ClearPendingFire()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private int InFiringMode[8388609];

    // End:0x2D
    if(InFiringMode < PendingFire.Length)
    {
        PendingFire[InFiringMode] = 0;
    }
    //return;    
}

final simulated function IsPendingFire()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private int InFiringMode[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bool(PendingFire[InFiringMode]);
    //return ReturnValue;    
}

simulated function ClearAllPendingFire()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private int I;

    I = 0;
    J0x0B:

    // End:0x46 [Loop If]
    if(I < PendingFire.Length)
    {
        PendingFire[I] = 0;
        I++;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

// Export UInventoryManager::execInventoryActors(FFrame&, void* const)
native final iterator function InventoryActors()
{
    local /*0x35EA0000-0x00000000*/ private class BaseClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Inv[25165825];


}

function SetupFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    Instigator = P;
    SetOwner(P);
    //return;    
}

event Destroyed()
{
    DiscardInventory();
    //return;    
}

function HandlePickupQuery()
{
    local /*0x35EA0000-0x00000000*/ private class ItemClass[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Pickup[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL Inv;

    // End:0x11
    if(InventoryChain == none)
    {
        return true;
    }
    // End:0x68
    foreach InventoryActors(Class'Inventory', Inv)
    {
        // End:0x67
        if(Inv.DenyPickupQuery(ItemClass, Pickup))
        {            
            return false;
        }        
    }    
    return true;
    //return ReturnValue;    
}

simulated event FindInventoryType()
{
    local /*0x35EA0000-0x00000000*/ private class DesiredClass[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bAllowSubclass[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Inv;

    // End:0x67
    foreach InventoryActors(DesiredClass, Inv)
    {
        // End:0x66
        if(bAllowSubclass || Inv.Class == DesiredClass)
        {            
            return Inv;
        }        
    }    
    return none;
    //return ReturnValue;    
}

simulated event CreateInventory()
{
    local /*0x35EA0000-0x00000000*/ private class NewInventoryItemClass[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bDoNotActivate[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Inv;

    // End:0x93
    if(NewInventoryItemClass != none)
    {
        Inv = Spawn(NewInventoryItemClass, Owner);
        // End:0x93
        if(Inv != none)
        {
            // End:0x90
            if(!AddInventory(Inv, bDoNotActivate))
            {
                Inv.Destroy();
                Inv = none;
            }            
        }
    }
    return Inv;
    //return ReturnValue;    
}

simulated function AddInventory()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewItem[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bDoNotActivate[9437185], ReturnValue;
    local /*0x35EA0000-0x00000000*/ private @NULL Item, LastItem;

    // End:0x1CD
    if((NewItem != none) && !NewItem.bDeleteMe)
    {
        // End:0x5B
        if(InventoryChain == none)
        {
            InventoryChain = NewItem;            
        }
        else
        {
            Item = InventoryChain;
            J0x6E:

            // End:0xD4 [Loop If]
            if(Item != none)
            {
                // End:0x96
                if(Item == NewItem)
                {
                    return false;
                }
                LastItem = Item;
                Item = Item.Inventory;
                // [Loop Continue]
                goto J0x6E;
            }
            LastItem.Inventory = NewItem;
        }
        NewItem.SetOwner(Instigator);
        NewItem.Instigator = Instigator;
        NewItem.InvManager = self;
        NewItem.GivenTo(Instigator, bDoNotActivate);
        Instigator.TriggerEventClass(Class'SeqEvent_GetInventory', NewItem);
        return true;
    }
    return false;
    //return ReturnValue;    
}

simulated function RemoveFromInventory()
{
    local /*0x35EA0000-0x00000000*/ private @NULL ItemToRemove[8388609], Item;
    local /*0x35EA0000-0x00000000*/ private bool bFound;

    // End:0x2AB
    if(ItemToRemove != none)
    {
        // End:0x5D
        if(InventoryChain == ItemToRemove)
        {
            bFound = true;
            InventoryChain = ItemToRemove.Inventory;            
        }
        else
        {
            Item = InventoryChain;
            J0x70:

            // End:0x122 [Loop If]
            if(Item != none)
            {
                // End:0xF7
                if(Item.Inventory == ItemToRemove)
                {
                    bFound = true;
                    Item.Inventory = ItemToRemove.Inventory;
                    // [Explicit Break]
                    goto J0x122;
                }
                Item = Item.Inventory;
                // [Loop Continue]
                goto J0x70;
            }
        }
        J0x122:

        // End:0x187
        if(bFound)
        {
            ItemToRemove.ItemRemovedFromInvManager();
            ItemToRemove.SetOwner(none);
            ItemToRemove.Inventory = none;
        }
        // End:0x1D3
        if(ItemToRemove == Instigator.Weapon)
        {
            Instigator.Weapon = none;
        }
        // End:0x2AB
        if((Instigator.Health > 0) && Instigator.Weapon == none)
        {
            // End:0x252
            if((PendingWeapon != none) && PendingWeapon != ItemToRemove)
            {
                ChangedWeapon();                
            }
            else
            {
                // End:0x2AB
                if(Instigator.Controller != none)
                {
                    Instigator.Controller.ClientSwitchToBestWeapon(true);
                }
            }
        }
    }
    //return;    
}

simulated event DiscardInventory()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Inv, TossVelocity;
    local /*0x35EA0000-0x00000000*/ private bool bBelowKillZ;

    bBelowKillZ = (Instigator == none) || Instigator.Location.Z < WorldInfo.KillZ;
    // End:0x1AB
    foreach InventoryActors(Class'Inventory', Inv)
    {
        // End:0x192
        if(Inv.bDropOnDeath && !bBelowKillZ)
        {
            TossVelocity = Vector(Instigator.GetViewRotation());
            TossVelocity = ((TossVelocity * ((Instigator.Velocity Dot TossVelocity) + 500.0000000)) + (250.0000000 * VRand())) + vect(0.0000000, 0.0000000, 250.0000000);
            Inv.DropFrom(Instigator.Location, TossVelocity);
            // End:0x1AA
            continue;
        }
        Inv.Destroy();        
    }    
    Instigator.Weapon = none;
    PendingWeapon = none;
    //return;    
}

function OwnerDied()
{
    Destroy();
    // End:0x47
    if(Instigator.InvManager == self)
    {
        Instigator.InvManager = none;
    }
    //return;    
}

simulated function DrawHUD()
{
    local /*0x35EA0000-0x00000000*/ private @NULL H[8388609];

    //return;    
}

simulated function GetWeaponRatingFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL W[8388609];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689], Rating;

    // End:0x2A
    if(!W.HasAnyAmmo())
    {
        return -1.0000000;
    }
    // End:0x118
    if(!Instigator.IsHumanControlled())
    {
        Rating = W.GetAIRating();
        // End:0x115
        if(((W == Instigator.Weapon) && Instigator.Controller != none) && Instigator.Controller.Enemy != none)
        {
            Rating += 0.2100000;
        }        
    }
    else
    {
        Rating = 1.0000000;
    }
    return Rating;
    //return ReturnValue;    
}

simulated function GetBestWeapon()
{
    local /*0x35EA0000-0x00000000*/ private bool bForceADifferentWeapon[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], W, BestWeapon;
    local /*0x35EA0000-0x00000000*/ private float Rating, BestRating;

    // End:0xF9
    foreach InventoryActors(Class'Weapon', W)
    {
        // End:0xF8
        if(W.HasAnyAmmo())
        {
            // End:0x81
            if(bForceADifferentWeapon && W == Instigator.Weapon)
            {
                continue;                
            }
            Rating = W.GetWeaponRating();
            // End:0xF8
            if((BestWeapon == none) || Rating > BestRating)
            {
                BestWeapon = W;
                BestRating = Rating;
            }
        }        
    }    
    return BestWeapon;
    //return ReturnValue;    
}

simulated function SwitchToBestWeapon()
{
    local /*0x35EA0000-0x00000000*/ private bool bForceADifferentWeapon[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL BestWeapon;

    // End:0xF5
    if((bForceADifferentWeapon || PendingWeapon == none) || AIController(Instigator.Controller) != none)
    {
        BestWeapon = GetBestWeapon(bForceADifferentWeapon);
        // End:0x7D
        if(BestWeapon == none)
        {
            return;
        }
        // End:0xF5
        if(BestWeapon == Instigator.Weapon)
        {
            BestWeapon = none;
            PendingWeapon = none;
            Instigator.Weapon.Activate();
            return;
        }
    }
    Instigator.Controller.StopFiring();
    SetCurrentWeapon(BestWeapon);
    //return;    
}

simulated function PrevWeapon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL CandidateWeapon, StartWeapon, W;

    StartWeapon = Instigator.Weapon;
    // End:0x4A
    if(PendingWeapon != none)
    {
        StartWeapon = PendingWeapon;
    }
    // End:0x97
    foreach InventoryActors(Class'Weapon', W)
    {
        // End:0x83
        if(W == StartWeapon)
        {
            // End:0x97
            break;
        }
        CandidateWeapon = W;        
    }    
    // End:0xDB
    if(CandidateWeapon == none)
    {
        // End:0xDA
        foreach InventoryActors(Class'Weapon', W)
        {
            CandidateWeapon = W;            
        }        
    }
    // End:0x109
    if(CandidateWeapon == Instigator.Weapon)
    {
        return;
    }
    SetCurrentWeapon(CandidateWeapon);
    //return;    
}

simulated function NextWeapon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL StartWeapon, CandidateWeapon, W;
    local /*0x35EA0000-0x00000000*/ private bool bBreakNext;

    StartWeapon = Instigator.Weapon;
    // End:0x4A
    if(PendingWeapon != none)
    {
        StartWeapon = PendingWeapon;
    }
    // End:0xC1
    foreach InventoryActors(Class'Weapon', W)
    {
        // End:0x9D
        if(bBreakNext || StartWeapon == none)
        {
            CandidateWeapon = W;
            // End:0xC1
            break;
        }
        // End:0xC0
        if(W == StartWeapon)
        {
            bBreakNext = true;
        }        
    }    
    // End:0x108
    if(CandidateWeapon == none)
    {
        // End:0x107
        foreach InventoryActors(Class'Weapon', W)
        {
            CandidateWeapon = W;
            // End:0x107
            break;            
        }        
    }
    // End:0x136
    if(CandidateWeapon == Instigator.Weapon)
    {
        return;
    }
    SetCurrentWeapon(CandidateWeapon);
    //return;    
}

reliable client simulated function SetCurrentWeapon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DesiredWeapon[8388609];

    InternalSetCurrentWeapon(DesiredWeapon);
    // End:0x3A
    if(int(Role) < int(ROLE_Authority))
    {
        ServerSetCurrentWeapon(DesiredWeapon);
    }
    //return;    
}

reliable server function ServerSetCurrentWeapon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DesiredWeapon[8388609];

    InternalSetCurrentWeapon(DesiredWeapon);
    //return;    
}

private final simulated function InternalSetCurrentWeapon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DesiredWeapon[8388609], PrevWeapon;

    PrevWeapon = Instigator.Weapon;
    // End:0xCB
    if(((PrevWeapon != none) && DesiredWeapon == PrevWeapon) && !PrevWeapon.IsInState('WeaponPuttingDown'))
    {
        // End:0xCB
        if(!DesiredWeapon.IsInState('Inactive') && !DesiredWeapon.IsInState('PendingClientWeaponSet'))
        {
            return;
        }
    }
    SetPendingWeapon(DesiredWeapon);
    // End:0x177
    if((((PrevWeapon != none) && PrevWeapon != DesiredWeapon) && !PrevWeapon.bDeleteMe) && !PrevWeapon.IsInState('Inactive'))
    {
        PrevWeapon.TryPutDown();        
    }
    else
    {
        ChangedWeapon();
    }
    //return;    
}

simulated function SetPendingWeapon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL DesiredWeapon[8388609];

    PendingWeapon = DesiredWeapon;
    //return;    
}

simulated function CancelWeaponChange()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x46
    if((PendingWeapon == none) && bMustHoldWeapon)
    {
        PendingWeapon = Instigator.Weapon;
    }
    return false;
    //return ReturnValue;    
}

simulated function ClearPendingWeapon()
{
    // End:0x3D
    if(PendingWeapon != none)
    {
        PendingWeapon.GotoState('Inactive');
        PendingWeapon = none;
    }
    //return;    
}

simulated function ChangedWeapon()
{
    local /*0x35EA0000-0x00000000*/ private @NULL OldWeapon;

    OldWeapon = Instigator.Weapon;
    // End:0x87
    if((PendingWeapon == none) && bMustHoldWeapon)
    {
        // End:0x87
        if(OldWeapon != none)
        {
            OldWeapon.Activate();
            PendingWeapon = OldWeapon;
        }
    }
    Instigator.Weapon = PendingWeapon;
    Instigator.PlayWeaponSwitch(OldWeapon, PendingWeapon);
    // End:0x18B
    if(PendingWeapon != none)
    {
        PendingWeapon.Instigator = Instigator;
        // End:0x161
        if(WorldInfo.Game != none)
        {
            Instigator.MakeNoise(0.1000000, 'ChangedWeapon');
        }
        PendingWeapon.Activate();
        PendingWeapon = none;
    }
    // End:0x20A
    if(Instigator.Controller != none)
    {
        Instigator.Controller.NotifyChangedWeapon(OldWeapon, Instigator.Weapon);
    }
    //return;    
}

simulated function ClientWeaponSet()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewWeapon[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bOptionalSet[8388609], bDoNotActivate;
    local /*0x35EA0000-0x00000000*/ private @NULL OldWeapon;

    // End:0x2C8
    if(!bDoNotActivate)
    {
        OldWeapon = Instigator.Weapon;
        // End:0xA7
        if(((OldWeapon == none) || OldWeapon.bDeleteMe) || OldWeapon.IsInState('Inactive'))
        {
            SetCurrentWeapon(NewWeapon);
            return;
        }
        // End:0xFB
        if(OldWeapon == NewWeapon)
        {
            // End:0xF9
            if(NewWeapon.IsInState('PendingClientWeaponSet'))
            {
                SetCurrentWeapon(NewWeapon);                
            }
            return;
        }
        // End:0x1A6
        if(bOptionalSet)
        {
            // End:0x1A6
            if(OldWeapon.DenyClientWeaponSet() || Instigator.IsHumanControlled() && PlayerController(Instigator.Controller).bNeverSwitchOnPickup)
            {
                LastAttemptedSwitchToWeapon = NewWeapon;
                return;
            }
        }
        // End:0x2C8
        if(((PendingWeapon == none) || !PendingWeapon.HasAnyAmmo()) || PendingWeapon.GetWeaponRating() < NewWeapon.GetWeaponRating())
        {
            // End:0x2C8
            if(!Instigator.Weapon.HasAnyAmmo() || Instigator.Weapon.GetWeaponRating() < NewWeapon.GetWeaponRating())
            {
                SetCurrentWeapon(NewWeapon);
                return;
            }
        }
    }
    NewWeapon.GotoState('Inactive');
    //return;    
}

simulated function UpdateController()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Item, Weap;

    Item = InventoryChain;
    J0x13:

    // End:0x97 [Loop If]
    if(Item != none)
    {
        Weap = Weapon(Item);
        // End:0x6C
        if(Weap != none)
        {
            Weap.CacheAIController();
        }
        Item = Item.Inventory;
        // [Loop Continue]
        goto J0x13;
    }
    //return;    
}

defaultproperties
{
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bHidden=true
    bOnlyRelevantToOwner=true
    bReplicateInstigator=true
    bReplicateMovement=false
    bOnlyDirtyReplication=true
    NetPriority=1.4000000
}