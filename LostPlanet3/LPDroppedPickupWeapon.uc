class LPDroppedPickupWeapon extends LPDroppedPickup
    hidecategories(AnimDependency,Navigation);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bLandedOK;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TouchRadius;

simulated function CanBePickedUpBy()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPW;
    local /*0x97E50000-0x00000000*/ private bool bCanPickUp;

    // End:0x11
    if(!bLandedOK)
    {
        return false;
    }
    // End:0x3E
    if(SPPawn(P).IsDoingASpecialMove())
    {
        return false;
    }
    bCanPickUp = super(SPInventoryDroppedPickup).CanBePickedUpBy(P);
    // End:0xE4
    if(bCanPickUp)
    {
        LPW = LPWeapon(Inventory);
        // End:0xE4
        if(LPW != none)
        {
            bCanPickUp = !P.bIsCrouched || LPW.bCanPickUpWhileCrouched;
        }
    }
    return bCanPickUp;
    //return ReturnValue;    
}

event PostBeginPlay()
{
    bLandedOK = false;
    super(Actor).PostBeginPlay();
    //return;    
}

simulated event @NULL Landed()
{
    local /*0x97E50000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor, TouchCylinder, LPP;

    bLandedOK = true;
    super(SPInventoryDroppedPickup).Landed(HitNormal, FloorActor);
    TouchCylinder = CylinderComponent(CollisionComponent);
    TouchCylinder.SetCylinderSize(TouchRadius, TouchCylinder.CollisionHeight);
    // End:0xCD
    foreach TouchingActors(Class'LPPlayerPawn', LPP)
    {
        Touch(LPP, none, Location, vect(0.0000000, 0.0000000, 0.0000000));        
    }    
    //return;    
}

function NotifyPawnOfProximityToInteractivePickup()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    LPPlayerPawn(P).ClientNotifyProximityToInteractiveWeaponPickup(self.InventoryClass, self, "");
    //return;    
}

state FadeOut
{
    ignores BeginState;
    stop;    
}

defaultproperties
{
    TouchRadius=120.0000000
    // Reference: DynamicLightEnvironmentComponent'Default__LPDroppedPickupWeapon.DroppedPickupLightEnvironment'
    begin object name=DroppedPickupLightEnvironment
    end object
    MyLightEnvironment=DroppedPickupLightEnvironment
    bDoNotAddToNavPointOnLand=true
    Components[0]=none
    // Reference: CylinderComponent'Default__LPDroppedPickupWeapon.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    Components[1]=CollisionCylinder
    Components[2]=DroppedPickupLightEnvironment
    bOnlyDirtyReplication=false
    CollisionComponent=CollisionCylinder
}