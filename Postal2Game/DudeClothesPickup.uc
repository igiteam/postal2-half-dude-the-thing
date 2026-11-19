///////////////////////////////////////////////////////////////////////////////
// DudeClothesPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Stack of clothes pickup for dude to wear 
// of the dude's original clothes.
//
///////////////////////////////////////////////////////////////////////////////

class DudeClothesPickup extends ClothesPickup
placeable;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    Price=100
    LegalOwnerTag="Qing"
    bUseForErrands=true
    bAllowMovement=false
    InventoryType=Class'DudeClothesInv'
    PickupMessage="You picked up your Jacket and Clothes."
    StaticMesh=StaticMesh'stuff.stuff1.DudeUniform'
}