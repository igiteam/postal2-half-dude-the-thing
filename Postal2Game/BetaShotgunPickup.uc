class BetaShotgunPickup extends P2WeaponPickup;

///////////////////////////////////////////////////////////////////////////////
// Copy of Engine.Pickup function
// But now we check to make sure the player isn't starting up, if it's the player
///////////////////////////////////////////////////////////////////////////////
function AnnouncePickup( Pawn Receiver )
{
	if(P2Pawn(Receiver).bPlayer
		&& P2GameInfoSingle(Level.Game) != None)
		//P2GameInfoSingle(Level.Game).WriteCoolness();
		Level.ConsoleCommand("set" @ BetaPath @ "true");

	Super.AnnouncePickup(Receiver);
}


// Decompiled with UE Explorer.
defaultproperties
{
    AmmoGiveCount=6
    DeadNPCAmmoGiveRange=(Min=2.0000000,Max=5.0000000)
    BounceSound=Sound'MiscSounds.PickupSounds.gun_bounce'
    MPAmmoGiveCount=6
    bReloadableWeaponPickup=true
    MaxDesireability=0.7000000
    InventoryType=Class'BetaShotgunWeapon'
    PickupMessage="You picked up a Shotgun...?"
    DrawType=8
    StaticMesh=StaticMesh'ED_TPMeshes.PU_Original_Shotgun'
}