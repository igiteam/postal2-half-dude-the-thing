///////////////////////////////////////////////////////////////////////////////
// PlaguePickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
class PlaguePickup extends P2WeaponPickup;

///////////////////////////////////////////////////////////////////////////////
// Copy of Engine.Pickup function
// But now we check to make sure the player isn't starting up, if it's the player
///////////////////////////////////////////////////////////////////////////////
function AnnouncePickup( Pawn Receiver )
{
	if(P2Pawn(Receiver).bPlayer
		&& P2GameInfoSingle(Level.Game) != None)
		//P2GameInfoSingle(Level.Game).WriteCoolness();
		Level.ConsoleCommand("set" @ PlaguePath @ "true");

	Super.AnnouncePickup(Receiver);
}


// Decompiled with UE Explorer.
defaultproperties
{
    AmmoGiveCount=3
    DeadNPCAmmoGiveRange=(Min=1.0000000,Max=3.0000000)
    BounceSound=Sound'MiscSounds.PickupSounds.gun_bounce'
    MPAmmoGiveCount=3
    InventoryType=Class'PlagueWeapon'
    PickupMessage="You picked up the WMD."
    DrawType=8
    StaticMesh=StaticMesh'Patch1_mesh.Weapons.WMD'
    CollisionRadius=60.0000000
}