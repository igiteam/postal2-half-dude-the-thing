///////////////////////////////////////////////////////////////////////////////
// DogTreatPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// A doggie treat
// 
///////////////////////////////////////////////////////////////////////////////

class DogTreatPickup extends OwnedPickup;

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bEdible=true
    DesireMarkerClass=Class'Postal2Game.OtherFoodMarker'
    BounceSound=Sound'MiscSounds.PickupSounds.BookDropping'
    InventoryType=Class'DogTreatInv'
    PickupMessage="You picked up a Doggie Treat."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.DogTreat'
}