///////////////////////////////////////////////////////////////////////////////
// CopClothesPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Stack of clothes pickup for dude to wear 
// that's a cop uniform
//
///////////////////////////////////////////////////////////////////////////////

class CopClothesPickup extends ClothesPickup
placeable;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    Price=20
    bBreaksWindows=false
    InventoryType=Class'CopClothesInv'
    PickupMessage="You picked up a Police Uniform."
    StaticMesh=StaticMesh'stuff.stuff1.CopUniform'
}