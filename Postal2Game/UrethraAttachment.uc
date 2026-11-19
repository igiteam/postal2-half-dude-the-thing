///////////////////////////////////////////////////////////////////////////////
// Urethra attachment for 3rd person
// A censored bar shows up in thrd person, as a sprite
///////////////////////////////////////////////////////////////////////////////
class UrethraAttachment extends P2WeaponAttachment;

/** Overriden to keep the draw scale persistant */
function InitFor(Inventory I) {
    super.InitFor(I);

    if (UrethraWeapon(I) != none)
        SetDrawScale(UrethraWeapon(I).CensorBarScale);
}


// Decompiled with UE Explorer.
defaultproperties
{
    WeapClass=Class'UrethraWeapon'
    FiringMode="URETHRA1"
    DrawType=1
    Texture=Texture'P2Misc.Icons.Censored'
    DrawScale=0.2000000
}