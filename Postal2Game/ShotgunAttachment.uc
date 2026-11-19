///////////////////////////////////////////////////////////////////////////////
// Shotgun attachment for 3rd person
//
// Weapon attachment gets it's ThirdPersonEffects called on all remote
// clients all the time when things are fired. Instead of having PlayOwnedSound
// *also* getting replicated to all remote clients to play the firing sound
// for fast-firing things like guns, I put it into here. It's messier, but
// it saves bandwidth.
///////////////////////////////////////////////////////////////////////////////
class ShotgunAttachment extends P2WeaponAttachment;


// Decompiled with UE Explorer.
defaultproperties
{
    MuzzleFlashClass=Class'ShotgunMuzzleFlash'
    MuzzleOffset=(X=75.0000000,Y=0.0000000,Z=5.0000000)
    WeapClass=Class'ShotGunWeapon'
    FireSound=Sound'WeaponSounds.shotgun_fire'
    CatOffset=(X=75.0000000,Y=-3.0000000,Z=7.5000000)
    DrawType=8
    RelativeLocation=(X=0.0000000,Y=1.0000000,Z=-0.3000000)
    RelativeRotation=(Pitch=0,Yaw=0,Roll=32768)
    StaticMesh=StaticMesh'TP_Weapons.Shotgun3'
}