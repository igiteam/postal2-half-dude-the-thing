///////////////////////////////////////////////////////////////////////////////
// LauncherPickup
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////
class NukePickup extends P2WeaponPickup;

///////////////////////////////////////////////////////////////////////////////
// Copy of Engine.Pickup function
// But now we check to make sure the player isn't starting up, if it's the player
///////////////////////////////////////////////////////////////////////////////
function AnnouncePickup( Pawn Receiver )
{
	if(P2Pawn(Receiver).bPlayer
		&& P2GameInfoSingle(Level.Game) != None)
		//P2GameInfoSingle(Level.Game).WriteCoolness();
		Level.ConsoleCommand("set" @ RadPath @ "true");

	Super.AnnouncePickup(Receiver);
}


// Decompiled with UE Explorer.
defaultproperties
{
    BounceSound=Sound'MiscSounds.Doors.MetalCrateDoor'
    InventoryType=Class'NukeWeapon'
    RespawnTime=120.0000000
    PickupMessage="You picked up a Mini-Nuke Launcher."
    DrawType=8
    StaticMesh=StaticMesh'stuff.stuff1.Launcher'
    Skins[0]=Texture'AW7Tex.Nuke.nuclear_launcher_256'
    Skins[1]=ConstantColor'ConstantColor6'
    Skins[2]=ConstantColor'ConstantColor6'
    CollisionRadius=60.0000000
    CollisionHeight=20.0000000
}