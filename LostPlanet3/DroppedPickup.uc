class DroppedPickup extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x35EA0000-0x00000000*/ private @NULL Inventory;
var(*) /*0x35EA0000-0x00000000*/ private travel class<Inventory> InventoryClass[2097153];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PickupCache;
var(*) /*0x35EA0000-0x00000000*/ private travel bool bFadeOut[2097153];

// Export UDroppedPickup::execAddToNavigation(FFrame&, void* const)
native final function AddToNavigation();

// Export UDroppedPickup::execRemoveFromNavigation(FFrame&, void* const)
native final function RemoveFromNavigation();

event Destroyed()
{
    // End:0x27
    if(Inventory != none)
    {
        Inventory.Destroy();
    }
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x35EA0000-0x00000000*/ private name VarName[8388609];

    // End:0x6A
    if(VarName == 'InventoryClass')
    {
        SetPickupMesh(InventoryClass.default.DroppedPickupMesh);
        SetPickupParticles(InventoryClass.default.DroppedPickupParticles);        
    }
    else
    {
        // End:0x92
        if(VarName == 'bFadeOut')
        {
            GotoState('FadeOut');            
        }
        else
        {
            super.ReplicatedEvent(VarName);
        }
    }
    //return;    
}

function Reset()
{
    Destroy();
    //return;    
}

simulated event @NULL SetPickupMesh()
{
    local /*0x35EA0000-0x00000400*/ private @NULL PickupMesh[8388609], Comp;

    // End:0x82
    if((PickupMesh != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        Comp = new (self) PickupMesh.Class (PickupMesh);
        AttachComponent(Comp);
    }
    //return;    
}

simulated event @NULL SetPickupParticles()
{
    local /*0x35EA0000-0x00000400*/ private @NULL PickupParticles[8388609], Comp;

    // End:0xA3
    if((PickupParticles != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        Comp = new (self) PickupParticles.Class (PickupParticles);
        AttachComponent(Comp);
        Comp.SetActive(true);
    }
    //return;    
}

event EncroachedBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    Destroy();
    //return;    
}

function DetourWeight()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
    local /*0x35EA0000-0x00000000*/ private float PathWeight[8388609], ReturnValue;

    return Inventory.DetourWeight(Other, PathWeight);
    //return ReturnValue;    
}

event Landed()
{
    local /*0x35EA0000-0x00000000*/ private @NULL HitNormal[8388609], FloorActor;

    bForceNetUpdate = true;
    bNetDirty = true;
    NetUpdateFrequency = 3.0000000;
    AddToNavigation();
    //return;    
}

function GiveTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    // End:0x6A
    if(Inventory != none)
    {
        Inventory.AnnouncePickup(P);
        Inventory.GiveTo(P);
        Inventory = none;
    }
    PickedUpBy(P);
    //return;    
}

function PickedUpBy()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];

    Destroy();
    //return;    
}

function RecheckValidTouch()
{
    //return;    
}

auto state Pickup
{
    function ValidTouch()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];
        local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

        // End:0x83
        if(((Other == none) || !Other.bCanPickupInventory) || (Other.DrivenVehicle == none) && Other.Controller == none)
        {
            return false;
        }
        // End:0xD8
        if(((int(Physics) == int(2)) && Other == Instigator) && Velocity.Z > float(0))
        {
            return false;
        }
        // End:0x11E
        if(!FastTrace(Other.Location, Location))
        {
            SetTimer(0.5000000, false, 'RecheckValidTouch');
            return false;
        }
        // End:0x18E
        if(Inventory != none)
        {
            // End:0x18E
            if(WorldInfo.Game.PickupQuery(Other, Inventory.Class, self))
            {
                return true;
            }
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

    event Timer()
    {
        GotoState('FadeOut');
        //return;        
    }

    function CheckTouching()
    {
        local /*0x35EA0000-0x00000000*/ private @NULL P;

        // End:0x43
        foreach TouchingActors(Class'Pawn', P)
        {
            Touch(P, none, Location, vect(0.0000000, 0.0000000, 1.0000000));            
        }        
        //return;        
    }

    event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        AddToNavigation();
        // End:0x31
        if(LifeSpan > 0.0000000)
        {
            SetTimer(LifeSpan - float(1), false);
        }
        //return;        
    }

    event EndState()
    {
        local /*0x35EA0000-0x00000000*/ private name NextStateName[8388609];

        RemoveFromNavigation();
        //return;        
    }
Begin:

    CheckTouching();
    stop;        
}

state FadeOut extends Pickup
{
    simulated event BeginState()
    {
        local /*0x35EA0000-0x00000000*/ private name PreviousStateName[8388609];

        bFadeOut = true;
        RotationRate.Yaw = 60000;
        SetPhysics(5);
        LifeSpan = 1.0000000;
        //return;        
    }
    stop;    
}

defaultproperties
{
    Components[0]=none
    // Reference: CylinderComponent'Default__DroppedPickup.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'CylinderComponent'
    end object
    Components[1]=CollisionCylinder
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bIgnoreRigidBodyPawns=true
    bOrientOnSlope=true
    bUpdateSimulatedPosition=true
    bOnlyDirtyReplication=true
    bShouldBaseAtStartup=true
    bCollideActors=true
    bCollideWorld=true
    NetUpdateFrequency=8.0000000
    NetPriority=1.4000000
    LifeSpan=16.0000000
    CollisionComponent=CollisionCylinder
    RotationRate=(Pitch=0,Yaw=5000,Roll=0)
}