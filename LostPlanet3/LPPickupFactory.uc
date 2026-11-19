class LPPickupFactory extends SPPickupFactory
    abstract
    nativereplication
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Display,Collision);

var(0.25_Pct) /*0x81B40000-0x00000000*/ private bool bRequiresUserInteraction[65537];

function GiveTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], IM, LPP;

    // End:0x1E
    if(bHidden || bPickupHidden)
    {
        return;
    }
    // End:0xDB
    if(bRequiresUserInteraction)
    {
        IM = LPInventoryManager(P.InvManager);
        LPP = LPPlayerPawn(P);
        // End:0xD8
        if((LPP != none) && IM != none)
        {
            LPP.ClientNotifyProximityToInteractivePickup(self.InventoryType, self, GetHUDPromptItemName());
        }        
    }
    else
    {
        super(PickupFactory).GiveTo(P);
    }
    //return;    
}

function GiveToImmediately()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    GiveTo(P);
    //return;    
}

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

simulated function GetHUDPromptItemName()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "";
    //return ReturnValue;    
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
        // End:0x47
        if(SPPawn(P).IsDoingASpecialMove())
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
    // Reference: DynamicLightEnvironmentComponent'Default__LPPickupFactory.PickupLightEnvironment'
    begin object name=PickupLightEnvironment
    end object
    MyLightEnvironment=PickupLightEnvironment
    // Reference: CylinderComponent'Default__LPPickupFactory.CollisionCylinder'
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