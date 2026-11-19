class LPInventoryManager extends SPInventoryManager
    hidecategories(AnimDependency,Navigation);

simulated function AddInventory()
{
    local /*0x97E50000-0x00000000*/ private @NULL NewItem[8388609];
    local /*0x97E50000-0x00000000*/ private bool bDoNotActivate[9437185], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL CSA, LPP;

    LPP = LPPawn(Instigator);
    LPP.ReceivedInventoryItem(NewItem);
    CSA = LPContextSensitiveAnimObject(LPP.ContextSensitiveAnimInfo.CurrentCSA);
    // End:0xED
    if(((CSA != none) && !CSA.DoesAllowWeapon(LPP)) && LPInventoryWeaponNone(NewItem) == none)
    {
        bDoNotActivate = true;
    }
    return super.AddInventory(NewItem, bDoNotActivate);
    //return ReturnValue;    
}

simulated event DiscardInventory()
{
    local /*0x97E50000-0x00000000*/ private @NULL MPGame, Inv;

    MPGame = LPGameMP_Base(WorldInfo.Game);
    // End:0xA0
    if((MPGame != none) && MPGame.bEndLevelCleanup)
    {
        // End:0x9C
        foreach InventoryActors(Class'Engine.Inventory', Inv)
        {
            Inv.Destroy();            
        }                
    }
    else
    {
        super(InventoryManager).DiscardInventory();
    }
    //return;    
}

reliable client simulated function SetCurrentWeapon()
{
    local /*0x97E50000-0x00000000*/ private @NULL DesiredWeapon[8388609], CSA, LPP;

    LPP = LPPawn(Instigator);
    CSA = LPContextSensitiveAnimObject(LPP.ContextSensitiveAnimInfo.CurrentCSA);
    // End:0xBA
    if(((CSA != none) && !CSA.DoesAllowWeapon(LPP)) && LPInventoryWeaponNone(DesiredWeapon) == none)
    {
        return;
    }
    super.SetCurrentWeapon(DesiredWeapon);
    //return;    
}

simulated function GetBestWeapon()
{
    local /*0x97E50000-0x00000000*/ private bool bForceADifferentWeapon[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], W, AnyWeapon, CSA;
    local /*0x97E50000-0x00000000*/ private bool bIsNoneWeapon;

    CSA = LPContextSensitiveAnimObject(SPPawn(Instigator).ContextSensitiveAnimInfo.CurrentCSA);
    // End:0x193
    foreach InventoryActors(Class'Engine.Weapon', W)
    {
        bIsNoneWeapon = LPInventoryWeaponNone(W) != none;
        // End:0xF1
        if(bIsNoneWeapon && (CSA != none) && !CSA.DoesAllowWeapon(LPPawn(Instigator)))
        {            
            return W;            
        }
        else
        {
            // End:0x17F
            if((!bIsNoneWeapon && (CSA == none) || CSA.DoesAllowWeapon(LPPawn(Instigator))) && SPWeapon(W).bCanEquip)
            {                
                return W;
            }
        }
        AnyWeapon = W;        
    }    
    return AnyWeapon;
    //return ReturnValue;    
}

simulated function RemoveFromInventory()
{
    local /*0x97E50000-0x00000000*/ private @NULL ItemToRemove[8388609], Item;
    local /*0x97E50000-0x00000000*/ private bool bFound;

    // End:0x1D3
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
    }
    //return;    
}

reliable server function ServerDropAndSwapWeapons()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609], Factory, ClosestFactory;
    local /*0x97E50000-0x00000000*/ private float ClosestDistance;
    local /*0x97E50000-0x00000000*/ private @NULL Pickup, ClosestPickup, CurrentWeapon, IM, W, NextWeapon;

    local /*0x97E50000-0x00000000*/ private class UniqueInvClass, UniqueInv;
    local /*0x97E50000-0x00000000*/ private float Distance;
    local /*0x97E50000-0x00000000*/ private bool bFactoryCloser;
    local /*0x97E50000-0x00000000*/ private @NULL Inv;

    // End:0x11
    if(LPP == none)
    {
        return;
    }
    IM = LPInventoryManager(LPP.InvManager);
    // End:0x53
    if(IM == none)
    {
        return;
    }
    ClosestDistance = 100000.0000000;
    // End:0x86
    if(LPP.IsDoingASpecialMove())
    {
        return;
    }
    // End:0x147
    foreach LPP.TouchingActors(Class'LPWeaponPickupFactory', Factory)
    {
        Distance = VSize(LPP.Location - Factory.Location);
        // End:0x146
        if(Distance < ClosestDistance)
        {
            ClosestFactory = Factory;
            ClosestDistance = Distance;
            bFactoryCloser = true;
        }        
    }    
    // End:0x234
    foreach LPP.TouchingActors(Class'LPDroppedPickup', Pickup)
    {
        // End:0x233
        if(Pickup.CanBePickedUpBy(LPP))
        {
            Distance = VSize(LPP.Location - Pickup.Location);
            // End:0x233
            if(Distance < ClosestDistance)
            {
                ClosestPickup = Pickup;
                ClosestDistance = Distance;
                bFactoryCloser = false;
            }
        }        
    }    
    // End:0x5B9
    if((ClosestFactory != none) && bFactoryCloser)
    {
        UniqueInvClass = class<SPWeapon>(ClosestFactory.InventoryType);
        // End:0x295
        if(UniqueInvClass == none)
        {
            return;
        }
        UniqueInv = UniqueInvClass.default.UniqueSetClass;
        // End:0x30B
        if(UniqueInv != none)
        {
            CurrentWeapon = LPWeapon(IM.FindInventoryType(UniqueInv, true));            
        }
        else
        {
            CurrentWeapon = LPWeapon(LPP.Weapon);
        }
        Inv = IM.FindInventoryType(ClosestFactory.InventoryType, true);
        W = LPWeapon(Inv);
        // End:0x3D9
        if(W != none)
        {
            ClosestFactory.GiveAmmoTo(LPP);
            return;
        }
        // End:0x4C8
        if(!LPP.HasRoomInInventory(class<LPWeapon>(ClosestFactory.InventoryType)))
        {
            // End:0x472
            if(CurrentWeapon.bCanThrow)
            {
                LPP.TossInventory(CurrentWeapon);                
            }
            else
            {
                NextWeapon = LPWeapon(GetNextWeapon(true));
                // End:0x4C8
                if(NextWeapon != none)
                {
                    LPP.TossInventory(NextWeapon);
                }
            }
        }
        // End:0x5B4
        if(ClosestFactory.GiveAmmoTo(LPP))
        {
            W = LPWeapon(IM.FindInventoryType(ClosestFactory.InventoryType, true));
            // End:0x58C
            if((W != none) && !W.bSecondaryWeapon)
            {
                SetCurrentWeapon(W);
            }
            ClosestFactory.PickedUpBy(LPP);
        }
        return;        
    }
    else
    {
        // End:0x92B
        if(ClosestPickup != none)
        {
            UniqueInvClass = class<SPWeapon>(ClosestPickup.InventoryClass);
            // End:0x60A
            if(UniqueInvClass == none)
            {
                return;
            }
            UniqueInv = UniqueInvClass.default.UniqueSetClass;
            // End:0x680
            if(UniqueInv != none)
            {
                CurrentWeapon = LPWeapon(IM.FindInventoryType(UniqueInv, true));                
            }
            else
            {
                CurrentWeapon = LPWeapon(LPP.Weapon);
            }
            Inv = IM.FindInventoryType(ClosestPickup.InventoryClass, true);
            W = LPWeapon(Inv);
            // End:0x74E
            if(W != none)
            {
                ClosestPickup.GivePickUpToWorker(LPP);
                return;
            }
            // End:0x83D
            if(!LPP.HasRoomInInventory(class<LPWeapon>(ClosestPickup.InventoryClass)))
            {
                // End:0x7E7
                if(CurrentWeapon.bCanThrow)
                {
                    LPP.TossInventory(CurrentWeapon);                    
                }
                else
                {
                    NextWeapon = LPWeapon(GetNextWeapon(true));
                    // End:0x83D
                    if(NextWeapon != none)
                    {
                        LPP.TossInventory(NextWeapon);
                    }
                }
            }
            // End:0x929
            if(ClosestPickup.GivePickUpToWorker(LPP))
            {
                W = LPWeapon(IM.FindInventoryType(ClosestPickup.InventoryClass, true));
                // End:0x901
                if((W != none) && !W.bSecondaryWeapon)
                {
                    SetCurrentWeapon(W);
                }
                ClosestPickup.PickedUpBy(LPP);
            }
            return;
        }
    }
    //return;    
}

simulated function NextVSWeapon()
{
    local /*0x97E50000-0x00000000*/ private byte PartSlot[9437185];
    local /*0x97E50000-0x00000000*/ private @NULL StartWeapon, CandidateWeapon, W;
    local /*0x97E50000-0x00000000*/ private bool bBreakNext;
    local /*0x97E50000-0x00000000*/ private @NULL myVS, laVS;

    1
    myVS = LPVSPlayerPawn(Instigator);
    // End:0x5E
    if(myVS == none)
    {
        laVS = LPAIPawnVsLaroche(Instigator);
        // End:0x5E
        if(laVS == none)
        {
            return;
        }
    }
    // End:0x9D
    if(myVS != none)
    {
        // End:0x9A
        if(myVS.IsWeaponSwitchLocked(PartSlot))
        {
            return;
        }        
    }
    else
    {
        // End:0xCA
        if(laVS.IsWeaponSwitchLocked(PartSlot))
        {
            return;
        }
    }
    // End:0x143
    if(int(PartSlot) == int(1))
    {
        // End:0x118
        if(myVS != none)
        {
            StartWeapon = myVS.RightArmPart;            
        }
        else
        {
            StartWeapon = laVS.RightArmPart;
        }        
    }
    else
    {
        // End:0x1B9
        if(int(PartSlot) == int(2))
        {
            // End:0x191
            if(myVS != none)
            {
                StartWeapon = myVS.LeftArmPart;                
            }
            else
            {
                StartWeapon = laVS.LeftArmPart;
            }
        }
    }
    // End:0x260
    foreach InventoryActors(Class'LPVSInventoryParts', W)
    {
        // End:0x23C
        if(bBreakNext || StartWeapon == none)
        {
            // End:0x23C
            if(int(W.PartLocation) == int(PartSlot))
            {
                CandidateWeapon = W;
                // End:0x260
                break;
            }
        }
        // End:0x25F
        if(W == StartWeapon)
        {
            bBreakNext = true;
        }        
    }    
    // End:0x2D7
    if(CandidateWeapon == none)
    {
        // End:0x2D6
        foreach InventoryActors(Class'LPVSInventoryParts', W)
        {
            // End:0x2D5
            if(int(W.PartLocation) == int(PartSlot))
            {
                CandidateWeapon = W;
                // End:0x2D6
                break;
            }            
        }        
    }
    // End:0x2E8
    if(CandidateWeapon == none)
    {
        return;
    }
    // End:0x301
    if(CandidateWeapon == StartWeapon)
    {
        return;
    }
    // End:0x352
    if(myVS != none)
    {
        myVS.LocalSwitchToInventoryPart(1, CandidateWeapon.Class);        
    }
    else
    {
        laVS.LocalSwitchToInventoryPart(1, CandidateWeapon.Class);
    }
    //return;    
}

reliable server function ServerPickupClosestItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPP[8388609], Factory, ClosestFactory;
    local /*0x97E50000-0x00000000*/ private float ClosestDistance;
    local /*0x97E50000-0x00000000*/ private @NULL Pickup, ClosestPickup, AmmoPickup, ClosestAmmoPickup, IM;

    local /*0x97E50000-0x00000000*/ private float Distance;
    local /*0x97E50000-0x00000000*/ private bool bFactoryCloser;

    // End:0x11
    if(LPP == none)
    {
        return;
    }
    IM = LPInventoryManager(LPP.InvManager);
    // End:0x53
    if(IM == none)
    {
        return;
    }
    ClosestDistance = 100000.0000000;
    // End:0x86
    if(LPP.IsDoingASpecialMove())
    {
        return;
    }
    // End:0x1BA
    foreach LPP.TouchingActors(Class'LPPickupFactory', Factory)
    {
        // End:0x126
        if(Factory == LPP.InventoryPickupNotification.PickupActor)
        {
            ClosestFactory = Factory;
            ClosestDistance = 0.0000000;
            bFactoryCloser = true;
            // End:0x1BA
            break;
            // End:0x1B9
            continue;
        }
        Distance = VSize(LPP.Location - Factory.Location);
        // End:0x1B9
        if(Distance < ClosestDistance)
        {
            ClosestFactory = Factory;
            ClosestDistance = Distance;
            bFactoryCloser = true;
        }        
    }    
    // End:0x2C1
    foreach LPP.TouchingActors(Class'LPDroppedPickup', Pickup)
    {
        // End:0x2C0
        if((LPDroppedPickupWeapon(Pickup) == none) && Pickup.CanBePickedUpBy(LPP))
        {
            Distance = VSize(LPP.Location - Pickup.Location);
            // End:0x2C0
            if(Distance < ClosestDistance)
            {
                ClosestPickup = Pickup;
                ClosestDistance = Distance;
                bFactoryCloser = false;
            }
        }        
    }    
    // End:0x383
    foreach LPP.TouchingActors(Class'LPAmmoPickupActor', AmmoPickup)
    {
        Distance = VSize(LPP.Location - AmmoPickup.Location);
        // End:0x382
        if(Distance < ClosestDistance)
        {
            ClosestAmmoPickup = AmmoPickup;
            ClosestDistance = Distance;
            bFactoryCloser = false;
        }        
    }    
    // End:0x3CD
    if((ClosestFactory != none) && bFactoryCloser)
    {
        ClosestFactory.GiveToImmediately(LPP);        
    }
    else
    {
        // End:0x432
        if(ClosestPickup != none)
        {
            // End:0x42F
            if(ClosestPickup.GivePickUpToWorker(LPP))
            {
                ClosestPickup.PickedUpBy(LPP);
            }            
        }
        else
        {
            // End:0x469
            if(ClosestAmmoPickup != none)
            {
                ClosestAmmoPickup.PickupAmmo(LPP);
            }
        }
    }
    //return;    
}

simulated function GetNextWeaponToDisplayForCluster()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], StartWeapon, CandidateWeapon;

    StartWeapon = SPWeapon(Instigator.Weapon);
    CandidateWeapon = GetNextWeapon(true);
    // End:0x95
    if((StartWeapon == CandidateWeapon) && PendingWeapon == none)
    {
        CandidateWeapon = SPWeapon(FindInventoryType(Class'LPWeaponPistol', true));
    }
    // End:0xBF
    if(PendingWeapon == CandidateWeapon)
    {
        CandidateWeapon = StartWeapon;
    }
    // End:0xE1
    if(CandidateWeapon == none)
    {
        CandidateWeapon = StartWeapon;
    }
    return CandidateWeapon;
    //return ReturnValue;    
}

defaultproperties
{
    PendingFire=/* Array type was not detected. */
}