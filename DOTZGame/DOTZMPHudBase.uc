//-----------------------------------------------------------
//
//-----------------------------------------------------------
class DOTZMPHUDBase extends DOTZHudBase;

//screen locations
var int StatLocation, StatSpace;
var float LeftMargin;
var float LeftMarginPlus;
var float TeamLeftMargin;
var float ClockX, ClockY, ClockInc;

var PlayerController Player;
var int TeamNum;
var int EnemyTeamNum;

var Material ClockMat;

//localized text!
var localized string Mintxt;
var localized string Sectxt;
var localized string Unlimitedtxt;
var localized string TimeExpiredtxt;

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

//function SetTeamColor(int Red, int Green, int Blue){
//   R = Red;
//   G = Green;
//   B = Blue;
//}

/*****************************************************************
 * DropShadowText
 *****************************************************************
 */

function DropShadowText(Canvas C, float X, float Y, string text){

   //draw black
   C.SetPos(X, Y);
   C.SetDrawColor(0,0,0);
   C.DrawText(Text);

   //draw colour text
   C.SetPos(X-2, Y-1);
   C.SetDrawColor(255,255,255);
   C.DrawText(Text);
   //C.SetDrawColor(R,G,B);
}

/**
 */
function drawToHUD( Canvas c, float scaleX, float scaleY ) {
   local int clamp_seconds;

   Player = Level.GetLocalPlayerController();
   //XBOX
   if (Player.IsA('XDotzPlayerController') == true){
      StatLocation = 75 * scaleY;
      StatSpace = 50 * scaleY;
      LeftMargin = 115 * scaleX;
      LeftMarginPlus = LeftMargin + 30;
      TeamLeftMargin = 1000 * scaleX;
      ClockX = 280;
      ClockY = 40;
      ClockInc = ClockX + 20;

   //PC
   } else {
      StatLocation = 50 * scaleY;
      StatSpace = 50 * scaleY;
      LeftMargin = 70 * scaleX;
      LeftMarginPlus = LeftMargin + 50 * scaleX;
      TeamLeftMargin = 1100 * scaleX;
      ClockX = 600 * scaleX;
      ClockY = 30 * scaleY;
      ClockInc = ClockX + 40 * scaleX;

   }

   if (Player.PlayerReplicationInfo.Team != none){
      TeamNum = Player.PlayerReplicationInfo.Team.TeamIndex;

      if (TeamNum == 0) {
         EnemyTeamNum = 1;
      } else if (TeamNum == 1) {
         EnemyTeamNum = 0;
      }
   } else {
      TeamNum = -1;
      EnemyTeamNum = -1;
   }


   //draw the clock and the time here!
   C.SetPos(ClockX ,ClockY);
   C.DrawTile(ClockMat,32*scaleX,32*scaleY,0,0,32,32);

   if (Player.GameReplicationInfo.bMatchHasBegun == true){
      if (Player.GameReplicationInfo.RemainingTime == 1){
        clamp_seconds = Player.GameReplicationInfo.SecondsRemaining;
        if (clamp_seconds < 0)
            clamp_seconds = 0;
        DropShadowText(C,ClockInc, ClockY, string(clamp_seconds));
      }else if (Player.GameReplicationInfo.RemainingTime != -1){
        DropShadowText(C,ClockInc, ClockY, string(Player.GameReplicationInfo.RemainingTime) $ MinTxt);
      } else {
        DropShadowText(C,ClockInc, ClockY, UnlimitedTxt);
      }
   } else {
      DropShadowText(C,ClockInc, ClockY, TimeExpiredTxt);
   }

   // draw the real stuff last...
   super.drawToHUD( c, scaleX, scaleY );

   //relevant MP stats
    C.Font = AdvancedHud(Player.myHUD).GetStandardFontRef();
    C.SetDrawColor(255,255,255);
   //Common to all MP games
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


//===========================================================================
// Default Properties
//===========================================================================

// Decompiled with UE Explorer.
defaultproperties
{
    ClockMat=Texture'DOTZTInterface.HUD.Clock'
    Mintxt="Min."
    Sectxt="Sec."
    Unlimitedtxt="Unlimited"
    TimeExpiredtxt="Complete!"
    // Reference: BBLargeFont'DOTZMPHudBase.SubtitleFnt1'
    begin object name=SubtitleFnt1 class=Class'BBGui.BBLargeFont'
    end object
    SubtitleGuiFont=SubtitleFnt1
    // Reference: BBSmallFont'DOTZMPHudBase.InfoFnt1'
    begin object name=InfoFnt1 class=Class'BBGui.BBSmallFont'
    end object
    InfoGuiFont=InfoFnt1
    // Reference: BBLargeFont'DOTZMPHudBase.BigFnt1'
    begin object name=BigFnt1 class=Class'BBGui.BBLargeFont'
    end object
    BigGuiFont=BigFnt1
    // Reference: BBSmallFont'DOTZMPHudBase.StandardFnt1'
    begin object name=StandardFnt1 class=Class'BBGui.BBSmallFont'
    end object
    StandardGuiFont=StandardFnt1
    // Reference: BBSmallFont'DOTZMPHudBase.SmallFnt1'
    begin object name=SmallFnt1 class=Class'BBGui.BBSmallFont'
    end object
    SmallGuiFont=SmallFnt1
}