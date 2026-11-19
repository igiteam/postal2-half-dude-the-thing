//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DOTZFixedWeapon extends FixedWeapon
   hidedropdown;

simulated function PostNetBeginPlay(){
   super.PostNetBeginPlay();
   if (Level.GetLocalPlayerController().Isa('XdotzController') == false){
       AMMO_CENTER     += 40;
       AMMO_Y          += 40;
   }
}


// Decompiled with UE Explorer.
defaultproperties
{
    iMinInaccuracy=0.0500000
    HitSpread=100.0000000
    FireAnim="Fire"
    ReloadAnim="Reload"
    SelectAnim="Select"
    DeselectAnim="DeSelect"
    IdleAnim="Idle"
    AccyIndicatorSize=128
    MuzzleFlashBone="Flash01"
}