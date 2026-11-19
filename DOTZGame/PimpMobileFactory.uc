class PimpMobileFactory extends KVehicleFactory;

event Trigger( Actor Other, Pawn EventInstigator )
{
    local KVehicle CreatedVehicle;

    if(EventInstigator.IsA('KVehicle'))
        return;

    if(VehicleCount >= MaxVehicleCount)
    {
        if(EventInstigator != None)
            //EventInstigator.ReceiveLocalizedMessage(class'Vehicles.BulldogMessage', 2);
        return;
    }

    if(VehicleClass != None)
    {
        CreatedVehicle = spawn(VehicleClass, , , Location, Rotation);
        VehicleCount++;
        CreatedVehicle.ParentFactory = self;
    }
}


// Decompiled with UE Explorer.
defaultproperties
{
    VehicleClass=Class'PimpMobile'
    MaxVehicleCount=1
}