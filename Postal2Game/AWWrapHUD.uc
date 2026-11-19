///////////////////////////////////////////////////////////////////////////////
// AW Wrap Postal 2 HUD
///////////////////////////////////////////////////////////////////////////////
class AWWrapHUD extends AchievementHUD;


///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts, enums...
///////////////////////////////////////////////////////////////////////////////
var Texture GaryHeadTex;


const HUD_GARY_NUMBERS_OFFSET_X	= +0.040;
const HUD_GARY_NUMBERS_OFFSET_Y	= -0.020;
const HUD_GARY_ICON_OFFSET_X	= +0.045;
const HUD_GARY_ICON_OFFSET_Y	= -0.060;
const HUD_GARY_ICON_SCALE		= 0.6;

///////////////////////////////////////////////////////////////////////////////
// Draw health section or heads
///////////////////////////////////////////////////////////////////////////////
simulated function DrawHealthAndArmor(canvas Canvas, float Scale)
{
	local Texture usetex;
	local int UseHeads;

	Super.DrawHealthAndArmor(Canvas, Scale);

	if(AWDude(PawnOwner) != None && AWDude(PawnOwner).GaryHeads > 0)
	{
		UseHeads = AWDude(PawnOwner).GaryHeads;

		// Draw icon
		Canvas.Style = ERenderStyle.STY_Masked;
		Canvas.DrawColor = DefaultIconColor;
		Canvas.SetPos(
			(IconPos[HealthIndex].X + HUD_GARY_ICON_OFFSET_X) * CanvasWidth,
			(IconPos[HealthIndex].Y + HUD_GARY_ICON_OFFSET_Y) * CanvasHeight);

		Canvas.DrawIcon(GaryHeadTex, Scale * HUD_GARY_ICON_SCALE);

		// Draw numbers
		MyFont.DrawTextEx(Canvas, CanvasWidth, 
			(IconPos[HealthIndex].X + HUD_GARY_NUMBERS_OFFSET_X) * CanvasWidth,
			(IconPos[HealthIndex].Y + HUD_GARY_NUMBERS_OFFSET_Y) * CanvasHeight,
			""$UseHeads, 1);
	}
}

///////////////////////////////////////////////////////////////////////////////
// Added by Man Chrzan: xPatch 2.0
// Draw left middle finger for petition 
///////////////////////////////////////////////////////////////////////////////
simulated event PostRender( canvas Canvas )
{
	// If there's an active screen, check to see if it wants the hud
	// If there's a root window running then never show the hud
	if ((OurPlayer.CurrentScreen == None || OurPlayer.CurrentScreen.ShouldDrawHUD()) && !AreAnyRootWindowsRunning())
	{
		if ( !PlayerOwner.bBehindView )
		{
			// Draw left middle finger	
			if ( (AWPostalDude(PawnOwner) != None) && (AWPostalDude(PawnOwner).LeftHandBird != None) )
				AWPostalDude(PawnOwner).LeftHandBird.RenderOverlays(Canvas);	
		}
	}

	// Super needs to be called after LeftHandBird so it (left hand) won't cover subtitles.
	Super.PostRender(Canvas);
}


///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////


// Decompiled with UE Explorer.
defaultproperties
{
    GaryHeadTex=Texture'AW_Textures.Gary_Icon'
    walkinjuries=/* Array type was not detected. */
}