///////////////////////////////////////////////////////////////////////////////
// PaycheckPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Paycheck pickup.
//
//
///////////////////////////////////////////////////////////////////////////////

class PaycheckPickup extends OwnedPickup;


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    Price=150
    LegalOwnerTag="jenny"
    bUseForErrands=true
    bAllowMovement=false
    bBreaksWindows=false
    InventoryType=Class'paycheckinv'
    PickupMessage="You picked up your Paycheck."
    DrawType=8
    StaticMesh=StaticMesh'Timb_mesh.Items.paycheck'
    CollisionRadius=40.0000000
    CollisionHeight=30.0000000
}