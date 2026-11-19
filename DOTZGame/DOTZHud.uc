/**
 * DOTZHud - the player's HUD.  Much of the actual work is delegated to
 *    other objects via AdvancedHud's HudDrawable interface.
 *
 * @version $Revision: 1.8 $
 * @author  Neil Gower (neilg@digitalextremes.com)
 * @date    Dec 2003
 */
class DOTZHud extends DOTZHudBase;

//===========================================================================
// Editable properties
//===========================================================================

// HUD mockup

//===========================================================================
// Internal data
//===========================================================================


//===========================================================================
// Hud Hooks
//===========================================================================

/**
 */
function drawToHUD( Canvas c, float scaleX, float scaleY ) {
    // draw the real stuff last...
    super.drawToHUD( c, scaleX, scaleY );
}

/**
 */
function drawDebugToHUD( Canvas c, float scaleX, float scaleY ) {
    c.SetPos( HEADER_X * scaleX, HEADER_Y * scaleY );
    c.DrawText( "DEBUG HUD" );
}

/**
 */
exec function ShowDebug() {
    local VGSPAIController c;
    super.ShowDebug();
    foreach AllActors( class'VGSPAIController', c ) {
        c.bDebugLogging = bShowDebugInfo;
    }
}


/****************************************************************
 * GetStandardFontRef
 * A hack to propogate some of the fonts out to other components
 ****************************************************************
 */
/*
function Font GetStandardFontRef(){
   return standardFont;
}
*/


//===========================================================================
// Default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    // Reference: BBSmallFont'DOTZHud.SubtitleFnt1'
    begin object name=SubtitleFnt1 class=Class'BBGui.BBSmallFont'
    end object
    SubtitleGuiFont=SubtitleFnt1
    // Reference: BBSmallFont'DOTZHud.InfoFnt1'
    begin object name=InfoFnt1 class=Class'BBGui.BBSmallFont'
    end object
    InfoGuiFont=InfoFnt1
    // Reference: BBLargeFont'DOTZHud.BigFnt1'
    begin object name=BigFnt1 class=Class'BBGui.BBLargeFont'
    end object
    BigGuiFont=BigFnt1
    // Reference: BBSmallFont'DOTZHud.StandardFnt1'
    begin object name=StandardFnt1 class=Class'BBGui.BBSmallFont'
    end object
    StandardGuiFont=StandardFnt1
    // Reference: BBSmallFont'DOTZHud.SmallFnt1'
    begin object name=SmallFnt1 class=Class'BBGui.BBSmallFont'
    end object
    SmallGuiFont=SmallFnt1
}