class FixedWeapon extends RangedWeapon
   hidedropdown;


simulated function ToggleAimedMode() {
}

simulated function AltFire( float Value ) {
   super.AltFire(Value);
}


// Decompiled with UE Explorer.
defaultproperties
{
    InventoryGroup=0
}