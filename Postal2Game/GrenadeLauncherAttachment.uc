///////////////////////////////////////////////////////////////////////////////
// Pistol attachment for 3rd person
//
// Weapon attachment gets it's ThirdPersonEffects called on all remote
// clients all the time when things are fired. Instead of having PlayOwnedSound
// *also* getting replicated to all remote clients to play the firing sound
// for fast-firing things like guns, I put it into here. It's messier, but
// it saves bandwidth.
///////////////////////////////////////////////////////////////////////////////
class GrenadeLauncherAttachment extends P2WeaponAttachment;


// Decompiled with UE Explorer.
defaultproperties
{
    MuzzleFlashClass=Class'Inventory.PistolMuzzleFlash'
    MuzzleOffset=(X=65.0000000,Y=0.0000000,Z=5.0000000)
    WeapClass=Class'GrenadeLauncherWeapon'
    CatOffset=(X=52.0000000,Y=-2.0000000,Z=11.0000000)
    DrawType=8
    RelativeLocation=(X=0.0000000,Y=1.0000000,Z=0.0000000)
    RelativeRotation=(Pitch=0,Yaw=0,Roll=32768)
    StaticMesh=StaticMesh'ED_TPMeshes.Weapons.TP_M79'
}