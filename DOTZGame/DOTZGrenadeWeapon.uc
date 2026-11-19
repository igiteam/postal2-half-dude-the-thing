/**
 * DOTZMediumWeapon - base class for all ranged weapons in DOTZ.
 *
 * @version $Rev: 5372 $
 * @author  Jesse LaChapelle (jesse@digitalextremes.com)
 * @date    May 2004
 */
class DOTZGrenadeWeapon extends RangedWeapon;

simulated function PostNetBeginPlay(){
   super.PostNetBeginPlay();
   if (Level.GetLocalPlayerController().Isa('XdotzController') == false){
       AMMO_CENTER     += 40;
       AMMO_Y          += 40;
   }
}

/**
 * Hack out the aimed mode stuff, do reload instead (but keep the key-bindings
 * as is, so that sniper rifle still works on RMB).
 */
simulated function ToggleAimedMode() {
    ForceReload();
}


/*****************************************************************
 * DrawToHud
 *****************************************************************
 */
simulated function DrawToHud( Canvas c, float scaleX, float scaleY ) {

/*
    if (class'DOTZGameInfoBase'.default.bUseReticule){
        AccuracyIndicator = default.AccuracyIndicator;
    } else {
        AccuracyIndicator = none;
    }
    */
    super.DrawToHud(C,scaleX,scaleY);
}

//===========================================================================
// Default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    bAllowedToAutoSwitch=true
    bWeaponKicks=true
    iMinInaccuracy=0.0500000
    HitSpread=100.0000000
    FireAnim="Fire"
    ReloadAnim="Reload"
    SelectAnim="Select"
    DeselectAnim="DeSelect"
    IdleAnim="Idle"
    AccuracyIndicator=Texture'DOTZTInterface.HUD.Reticule'
    AccyIndicatorSize=128
    AmmoBackWidth=128
    AmmoBackLength=64
    AmmoBackX=1125
    AmmoBackY=875
    TraceFireBone="Weapon"
    MuzzleFlashBone="Flash01"
    BulletEjectBone="Flash02"
    bAltFireDoesntFire=true
    ReloadCount=10
    DisplayFOV=60.0000000
    PlayerViewOffset=(X=20.0000000,Y=4.0000000,Z=-17.0000000)
    BobDamping=2.2000000
}