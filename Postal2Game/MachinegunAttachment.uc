///////////////////////////////////////////////////////////////////////////////
// Machinegun attachment for 3rd person
//
// Weapon attachment gets it's ThirdPersonEffects called on all remote
// clients all the time when things are fired. Instead of having PlayOwnedSound
// *also* getting replicated to all remote clients to play the firing sound
// for fast-firing things like guns, I put it into here. It's messier, but
// it saves bandwidth.
///////////////////////////////////////////////////////////////////////////////
class MachinegunAttachment extends P2DualWeaponAttachment;


// Decompiled with UE Explorer.
defaultproperties
{
    MuzzleFlashClass=Class'MachineGunMuzzleFlash'
    MuzzleOffset=(X=68.0000000,Y=-4.0000000,Z=8.0000000)
    WeapClass=Class'MachineGunWeapon'
    FireSound=Sound'WeaponSounds.Machinegun_fire'
    CatOffset=(X=55.0000000,Y=-3.0000000,Z=10.0000000)
    DrawType=8
    RelativeLocation=(X=0.0000000,Y=1.0000000,Z=-0.3000000)
    RelativeRotation=(Pitch=0,Yaw=0,Roll=32768)
    StaticMesh=StaticMesh'TP_Weapons.MachineGun3'
}