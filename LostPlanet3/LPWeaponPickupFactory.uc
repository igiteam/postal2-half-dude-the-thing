class LPWeaponPickupFactory extends SPWeaponPickupFactory
    abstract
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force);

simulated function CanBePickedUpBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(LPBaseVSPlayerPawn(P) != none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function GiveTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], IM;
    local /*0x97E50000-0x00000000*/ private class Weapon;
    local /*0x97E50000-0x00000000*/ private @NULL W, LPP;
    local /*0x97E50000-0x00000000*/ private bool bGive;

    bGive = true;
    IM = LPInventoryManager(P.InvManager);
    W = IM.FindInventoryType(self.InventoryType, true);
    Weapon = class<LPWeapon>(self.InventoryType);
    LPP = LPPlayerPawn(P);
    // End:0x226
    if(((((LPP != none) && Weapon != none) && Weapon.default.bRequiresInputForNewPickup) && IM != none) && !LPP.HasRoomInInventory(class<LPWeapon>(Weapon.default.UniqueSetClass)) || LPP.HasUniqueSetClass(Weapon.default.UniqueSetClass))
    {
        // End:0x21A
        if(W == none)
        {
            // End:0x1D3
            if(LPP == none)
            {
                bGive = true;                
            }
            else
            {
                LPP.ClientNotifyProximityToInteractiveWeaponPickup(self.InventoryType, self, "");
                bGive = false;
            }            
        }
        else
        {
            bGive = true;
        }
    }
    // End:0x2E8
    if(((((int(WorldInfo.NetMode) == int(NM_Standalone)) && bGive) && W == none) && Weapon != none) && Weapon.default.bRequiresInputForNewPickup)
    {
        LPP.ClientNotifyProximityToInteractiveWeaponPickup(self.InventoryType, self, "");
        bGive = false;
    }
    // End:0x308
    if(bGive)
    {
        super.GiveTo(P);
    }
    //return;    
}

auto state Pickup
{
    simulated function CanBePickedUpBy()
    {
        local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x1A
        if(LPBaseVSPlayerPawn(P) != none)
        {
            return false;
        }
        // End:0x61
        if((LPPlayerPawn(P) != none) && LPPlayerPawn(P).IsDoingASpecialMove())
        {
            return false;
        }
        return true;
        //return ReturnValue;        
    }
    stop;    
}

defaultproperties
{
    MaxAmmoToGive=120
    // Reference: DynamicLightEnvironmentComponent'Default__LPWeaponPickupFactory.PickupLightEnvironment'
    begin object name=PickupLightEnvironment
    end object
    MyLightEnvironment=PickupLightEnvironment
    // Reference: CylinderComponent'Default__LPWeaponPickupFactory.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=PickupLightEnvironment
    CollisionComponent=CollisionCylinder
}