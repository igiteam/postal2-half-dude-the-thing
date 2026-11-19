/*****************************************************************
 * SniperWeapon - a rifle with a scope.
 *
 * @version $Rev$
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @author  Jesse LaChapelle (Jesse@digitalextremes.com)
 * @date    Jan 2004
 *****************************************************************
 */
class SniperWeapon extends DOTZGunWeapon
    config(user);



// configurable
var() Texture ScopeTex;
var() float ZoomOutDelay;
var() Array<int> ZoomLevelFOVs;
var() Array<float> MouseSenseLevel;
var() int SwayMag;

// internal
const ZOOM_OUT_TIMER = 371740;
var protected bool bWasAimed;
var protected int currentZoomLevel; // 0 (no zoom) ... N (max zoom)
var protected int reZoomLevel;


simulated function AltFire( float Value ) {
   //ON PC ONLY
   if (Instigator.Controller.IsA('XDotzPlayerController') == false){
      ToggleAimedMode();
   }
   //super.AltFire(Value); does reload
}


/**
 * Cycle through zoom levels instead of on/off toggle...
 */
simulated function ToggleAimedMode() {

    local PlayerController pc;
    pc = Level.GetLocalPlayerController();

    if ( bAiming ) {
        currentZoomLevel = (currentZoomLevel + 1) % (ZoomLevelFOVs.length + 1);
    }
    //re-aiming, set zoom level to whatever it was when we un-zoomed
    else {
        currentZoomLevel = reZoomLevel;
    }

    if ( currentZoomLevel == 0 ){
        pc.SetSensitivityTemp(class'PlayerInput'.default.MouseSensitivity);
        EndAimedMode();
//        EndAimedMode();
    } else {
        pc.SetSensitivityTemp(MouseSenseLevel[currentZoomLevel - 1]);
        StartAimedMode( ZoomLevelFOVs[currentZoomLevel - 1] );
    }

}

/**
 * Draw the scope first when zoomed in, and disable rendering of the gun.
 */
simulated function drawFirstPersonWeapon( canvas c, float scaleX, float scaleY ) {
    local float texScaleX, texScaleY;
    if ( bAiming ) {
        c.setPos( 0,0 );
        texScaleX = c.clipX / scopeTex.uSize;
        texScaleY = c.clipY / scopeTex.vSize;
        c.drawTileScaled( scopeTex, texScaleX, texScaleY );
        bRenderWeaponMesh = false;
    }
    else {
        bRenderWeaponMesh = true;
    }
    super.drawFirstPersonWeapon( c, scaleX, scaleY );
}

/**
 * Start the timer to kick out of the scope view...
 */
simulated function Fire(float Value) {
    //NOTE this would probably be better as a notify on the fire anim...
    if ( bAiming ) SetMultiTimer( ZOOM_OUT_TIMER, ZoomOutDelay, false );
    super.Fire( value );
}

/**
 * Timers...
 */
simulated function MultiTimer( int timerID ) {
    switch ( timerID ) {

    case ZOOM_OUT_TIMER:
        EndAimedMode();
        bWasAimed = true;
        break;

    default:
        super.MultiTimer( timerID );
    }
}

/**
 * End all zooming effects
 */
simulated function PlayReloading() {
                // Log( self @ "PLAYRELOADING"  )    ;
    currentZoomLevel = 0;
    EndAimedMode();
    super.PlayReloading();

}

/**
 * At the end of the fire anim, go back to zoomed mode.
 */
state NormalFire {
    /* HACKED OUT, REQUIRE PLAYER TO MANUALLY RE-ZOOM
    function AnimEnd(int Channel) {
        // from base class...
        Finish();
        CheckAnimating();
        // re-enagage aim...
        if ( bWasAimed && !bAiming && currentZoomLevel > 0 ) {
            StartAimedMode(ZoomLevelFOVs[currentZoomLevel - 1]);
        }
    }
    */
}

/**
 * Make sure we disable aimed mode.
 */
simulated function Weapon WeaponChange( byte F, bool bSilent ) {
    EndAimedMode();
    return super.WeaponChange( f, bSilent );
}

/*****************************************************************
 * StartAimedMode
 * Sniper rifle does sway when zoomed
 *****************************************************************
 */
simulated function StartAimedMode( optional int AimedFOV ) {
    super.StartAimedMode(AimedFOV);
    AccuracyIndicator = none;
    StaticReticule    = none;
    AdvancedPlayerController(Instigator.Controller).StartSway( SWAY_SIDEWAYS,
                                                               SwayMag );
}

/*****************************************************************
 * EndAimedMode
 *****************************************************************
 */
simulated function EndAimedMode() {
    reZoomLevel = 1; //max( 1, currentZoomLevel );
    super.EndAimedMode();
    AccuracyIndicator = default.AccuracyIndicator;
    StaticReticule    = default.StaticReticule;
    AdvancedPlayerController(Instigator.Controller).EndSway();
}



state Reloading{
   simulated function ToggleAimedMode() {
   }
   simulated function StartAimedMode( optional int AimedFOV ) {
   }
}
//NOTE could do the same for Reloading-AnimEnd...


//===========================================================================
// DefaultProperties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ScopeTex=Texture'DOTZTInterface.SniperScope.SniperScope'
    ZoomOutDelay=0.7000000
    ZoomLevelFOVs[0]=30
    ZoomLevelFOVs[1]=20
    ZoomLevelFOVs[2]=10
    MouseSenseLevel[0]=2.5000000
    MouseSenseLevel[1]=1.5000000
    MouseSenseLevel[2]=1.0000000
    SwayMag=4
    reZoomLevel=1
    PawnAnimationPackage="DOTZAHumans.3PSniperRifle"
    FireAnimName="SniperRifleFire"
    StandIdleAnimName="SniperRifleStandIdle"
    CrouchIdleAnimName="SniperRifleCrouchIdle"
    HitAnimName="SniperHit"
    WeaponMode=1
    MuzzleFlashEmitterClass=Class'BBParticles.BBPSniperRifleMuzzleFlash'
    iMinInaccuracy=0.0100000
    HitSpread=0.0000000
    AimedOffset=(X=-9.0000000,Y=-15.5000000,Z=-1.0000000)
    AimedFOV=10
    OfficialName="Sniper Rifle"
    AmmoName=Class'SniperAmmunition'
    PickupAmmoCount=5
    ReloadCount=5
    AutoSwitchPriority=5
    InventoryGroup=5
    PickupClass=Class'SniperPickup'
    AttachmentClass=Class'SniperAttachment'
    ItemName="Sniper Rifle"
    Mesh=SkeletalMesh'DOTZAWeapons.SniperRifle'
}