//=============================================================================
// MrDTNadePickup.
//=============================================================================
class MrDKNadePickup extends P2WeaponPickup;

///////////////////////////////////////////////////////////////////////////////
// Copy of Engine.Pickup function
// But now we check to make sure the player isn't starting up, if it's the player
///////////////////////////////////////////////////////////////////////////////
function AnnouncePickup( Pawn Receiver )
{
	if(P2Pawn(Receiver).bPlayer
		&& P2GameInfoSingle(Level.Game) != None)
		//P2GameInfoSingle(Level.Game).WriteCoolness();
		Level.ConsoleCommand("set" @ NutsPath @ "true");

	Super.AnnouncePickup(Receiver);
}


// Decompiled with UE Explorer.
defaultproperties
{
    BounceSound=Sound'WeaponSoundsToo.KGrenade_fall'
    ShortSleeveType=Class'MrDKNadeWeaponSS'
    bNoBotPickup=true
    MaxDesireability=-1.0000000
    InventoryType=Class'MrDKNadeWeapon'
    PickupMessage="You picked up a Krotchy Grenade!"
    DrawType=8
    StaticMesh=StaticMesh'P2R_Meshes_D.Weapons.KrotchyPickup'
    DrawScale=0.1700000
    CollisionRadius=45.0000000
    CollisionHeight=30.0000000
}