class LPInfiniteAmmoPickupFactory extends LPCustomizablePickupFactory
    abstract
    hidecategories(AnimDependency,Navigation,Lighting,LightColor,Force,Display);

function PickedUpItem()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    super.PickedUpItem(P);
    LPPlayerPawn(P).ReplenishDefaultAmmo();
    //return;    
}

function GiveTo()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609], LPP;

    LPP = LPPlayerPawn(P);
    // End:0x56
    if(!HasRoomForAmmo(LPP))
    {
        LPP.ClientNotifyAmmoFull();        
    }
    else
    {
        super(LPPickupFactory).GiveTo(P);
    }
    //return;    
}

function GiveToImmediately()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];

    // End:0x32
    if(HasRoomForAmmo(LPPlayerPawn(P)))
    {
        super.GiveToImmediately(P);
    }
    //return;    
}

simulated function HasRoomForAmmo()
{
    local /*0x97E50000-0x00000000*/ private @NULL P[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPP;

    LPP = LPPlayerPawn(P);
    // End:0x52
    if((LPP != none) && LPP.ReplenishDefaultAmmo(true))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

auto state Pickup
{
    ignores RecheckValidTouch;

    simulated function ValidTouch()
    {
        local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
        local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

        return super.ValidTouch(Other);
        //return ReturnValue;        
    }
    J0x00:
    // End:0x19 [Loop If]
    if(true)
    {
        CheckTouching();
        Sleep(0.5000000);
        // [Loop Continue]
        goto J0x00;
    }
    stop;            
}

defaultproperties
{
    // Reference: LPLocTextSelector'Default__LPInfiniteAmmoPickupFactory.TxtSelectorName'
    begin object name=TxtSelectorName
    end object
    PickupName=TxtSelectorName
    bDisableOnPickUp=false
    PickUpSpecialMoveClass=Class'LPSM_PlayerPickUpAmmoInfinite'
    // Reference: StaticMeshComponent'Default__LPInfiniteAmmoPickupFactory.StaticMeshComponent0'
    begin object name=StaticMeshComponent0
    end object
    FXMesh=StaticMeshComponent0
    // Reference: ParticleSystemComponent'Default__LPInfiniteAmmoPickupFactory.PSC0'
    begin object name=PSC0
    end object
    FXParticles=PSC0
    // Reference: DynamicLightEnvironmentComponent'Default__LPInfiniteAmmoPickupFactory.PickupLightEnvironment'
    begin object name=PickupLightEnvironment
    end object
    MyLightEnvironment=PickupLightEnvironment
    // Reference: CylinderComponent'Default__LPInfiniteAmmoPickupFactory.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=none
    Components[1]=none
    Components[2]=none
    Components[3]=CollisionCylinder
    Components[4]=none
    Components[5]=PickupLightEnvironment
    Components[6]=StaticMeshComponent0
    Components[7]=PSC0
    CollisionComponent=CollisionCylinder
}