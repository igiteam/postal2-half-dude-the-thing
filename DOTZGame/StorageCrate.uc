//=============================================================================
// Storage Crate
//
// Just a basic crate filled with supplies that John can smack open.
//
// Gamefan74
// November 13th, 2007
//=============================================================================
class StorageCrate extends DestructEffectsActor;

struct PickupType
{
    var() class<Pickup> PickupClass;
    var() int Quantity;
};
var(Items) array<PickupType> PickupTypes;

function initDynamicDEA()
{
    local int XVel, YVel, ZVel;
    local int i, quant, SpawnLength;
    local Pickup Pickups;

    Super.initDynamicDEA();

    SpawnLength = PickupTypes.Length;

    for (i=0; i<SpawnLength; i++)
    {
        if (PickupTypes[i].PickupClass != None)
            for (quant=0; quant<PickupTypes[i].Quantity; quant++)
            {
                Pickups = Spawn(PickupTypes[i].PickupClass,,, Location);
                Pickups.SetPhysics(PHYS_Falling);
                XVel = Frand() * 500 - 250;
                YVel = Frand() * 500 - 250;
                ZVel = Frand() * 500 - 250;
                Pickups.Velocity.X = XVel;
                Pickups.Velocity.Y = YVel;
                Pickups.Velocity.Z = ZVel;
            }
    }
}


// Decompiled with UE Explorer.
defaultproperties
{
    InitialHealth=20
    DisappearDelay=0.0000000
    DisappearFadeTime=0.0000000
    DisappearFadeSteps=0
    PrePivot=(X=0.0000000,Y=0.0000000,Z=32.0000000)
}