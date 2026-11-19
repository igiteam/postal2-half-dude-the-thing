///////////////////////////////////////////////////////////////////////////////
// Postal 2 HUD
//
// 11/02/12 JWB     Added Widescreen fix for Hud.
//                          No longer stretches incorrectly.
//
// 4/29 Kamek - backported game timer stuff from AW7
//
// 10/07/13 JWB     Added Ultra Widescreen support.
//                  Essentially just added UltraWideOffsetX to most SetPOS and some Draw functions.
//                  Gets the job done.
///////////////////////////////////////////////////////////////////////////////
class P2HUD extends FPSHUD;

#exec Texture Import File=Textures\SubBoxCorner.dds NAME=TSubBoxCorner
#exec Texture Import File=Textures\SubBoxTex.dds NAME=TSubBox
///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts, enums...
///////////////////////////////////////////////////////////////////////////////

var P2Player OurPlayer;			// player controller that owns this
var P2Pawn   PawnOwner;			// pawn that owns this (may be viewtarget of owner rather than owner)

var float AspectRatio;			// ratio for height over width for display
var float Scale;				// Scale for rendering the canvas.

var color WhiteColor;			// white for resetting the background
var Color DefaultIconColor;		// Using 255,255,255 seems too bright, make it a little less
var color YellowColor;
var color RedColor;
var color BlueColor;

var float HeartPumpSizeX;
var float HeartPumpSizeY;
var Material HeartIcon;
var Material WantedIcon;		// texture for cops wanting the player (cop radio) texture
var Material WantedBar;			// bar to fill in over above texture
var array<Material> SectionBackground;	// Background texture for various sections
var Texture RadarBackground;
var Texture RadarPlayer;
var Texture RadarNPC;
var Texture RadarGlow;
var Texture RadarTarget[2];
var Texture RadarCopHat;
var Texture RadarGun;
var Texture BlackBox;
var Material TopHurtBar;
var Material SideHurtBar;
var Material SkullHurtBar;
var Material LipstickDecal;
var transient array<Material> TargetPrizes;


//ErikFOV Change: Subtitle system
struct SubLine
{
	var	String	name, Text;
	var bool	Border, bAct, bDel;
	var float	Time;
	var float	pos;
	var Color	TextColor, NameColor;
};

var array<SubLine> Subtitles;
var float SubBoxSize, TimerDelta, SubBoxAlpha;
var int MaxSubtitlesLines, SubLineH, indentL, indentT, BorderH;
var int SubBoxH, SubBoxOldH, SubBoxVel, SubBoxW, SubBoxBottom;
var Texture SubBoxBG, SubBoxBGCorner;

struct AnimProp
{
	var String  Tag;
	var	Name	Type;
	var float	InitTime, Init, End, Duration;
};

var array<AnimProp> AnimProps;
//End

//ErikFOV Change: Nick's HUD fix
const HUD_N_BG_OFFSET_Y = 0.022;
const HUD_N_NUM_ALIGN_X = 1.25;
const HUD_N_HINT_ALIGN_X = 7;
//end

struct HudPos
	{
	var()	float	X;
	var()	float	Y;
	};

var array<HudPos> IconPos;
var array<HudPos> InvTextPos;
var array<HudPos> WeapTextPos;
var array<HudPos> WantedTextPos;
var HudPos FireModePos;
var int WeapIndex;
var int InvIndex;
var int HealthIndex;
var int WantedIndex;

// Display strings for hints (not the localized strings, just vars)
var string InvHint1;
var string InvHint2;
var string InvHint3;
var float InvHintDeathTime;	// Abs game time when hint goes away
var string WeapHint1;
var string WeapHint2;
var string WeapHint3;
var float WeapHintDeathTime;	// Abs game time when hint goes away

// Actual localized text for hints
var localized string RadarHint0;
var localized string RadarHint1;
var localized string RadarHint2;
var localized string RadarHint3;
var localized string RadarHint4;
var localized string RadarHint5;
var localized string RadarHint6;
var localized string RadarKillHint0;
var localized string RadarKillHint1;
var localized string RadarKillHint2;
var localized string RadarStatsHint0;
var localized string RadarStatsHint1;
var localized string RadarStatsHint2;
var localized string RadarStatsHint3;
var localized string RadarStatsHint4;
var localized string RadarDeadHint;
var localized string RadarMouseHint;
var localized string RocketHint1;
var localized string RocketHint2;
var localized string RocketHint3;

const HUD_INVENTORY		= 0;
const HUD_HEALTH		= 1;
const HUD_AMMO			= 2;

var localized string SuicideHintMajor;	// Hint written for commiting suicide
var localized string SuicideHintMinor;
var localized string SuicideHintMajorAlt;

var localized string DeadMessage1;		// What to do after you're dead
var localized string DeadMessage2;
var localized string DeadDemoMessage1;
var localized string DeadDemoMessage2;

var localized string QuittingMessage;
var float LoadingMessageY;
var localized string EasySavingMessage;
var localized string AutoSavingMessage;
var localized string RestartingMessage;
var localized string ForcedSavingMessage;

var localized string FireModeText;

var localized array<string> CantSkipHints;	// Hint text for unskippable cutscenes
var string CantSkipHint;	// Currently drawn can't-skip hint
var float CantSkipTime;		// Time we put up the can't-skip hint

const CANT_SKIP_DRAW_TIME = 5.0;	// Time to display can't-skip hint for
const CANT_SKIP_FADE_TIME = 1.0;	// Time to fadeout the can't-skip hint
const CANT_SKIP_POS_X = 0.5;		// X and Y positions of can't-skip hint, as a function of canvas dimensions
const CANT_SKIP_POS_Y = 0.8;

var String IssuedTo;

var texture RadarCow;
var array<AnimalPawn> RadarAnimalPawns;

// Matinee messages
// WARNING: This struct is also used by at least one ScriptedAction so it
// can't contain any Actor references or the ScriptedAction will crash.
struct S_HudMsg
	{
	var() localized string	Msg;				// Text to display.
	var() int				FontSize;			// Font size to use (0-4)
	var() bool				bPlain;				// If true, draw in plain text
	var() float				X;					// X location to draw (as a percent of screen resolution. 0.0 = farthest left, 1.0 = farthest right)
	var() float				Y;					// Y location to draw (as a percent of screen resolution. 0.0 = top, 1.0 = bottom)
	var() FontInfo.EJustify	JustifyFromX;		// Font Justification to use
	};
var array<S_HudMsg>			HudMsgs;
var float					HudMsgsEndTime;
var S_HudMsg				PopupHudMsg;		// A popup hud message that can be defined by a TriggeredHint

var Material TopSniperBar;		// Similar to hurt bars, these sniper bars show the direction
var Material SideSniperBar;		// of the sniper looking at you
var float SniperBarTime;	// Cummulative time for sniper bars. All bars will use this if they
								// should be shown

// This is the 'expected" canvas width.  At this width everything is displayed
// without shrinking or stretching.  At lower or higher resolutions everything
// is shrunk or stretched so the relative size on screen remains the same.
const EXPECTED_START_RES_WIDTH	= 1024;

// Positions of the centers of each HUD section
const HUD_WANTED_BAR_OFF_X      = 0.16;
const HUD_WANTED_BAR_OFF_Y		= 0.86;//Was .0305
const HUD_WANTED_BAR_SCALE_WIDTH= 0.701;
const HUD_RADAR_X				= 0.88;//0.975;
const HUD_RADAR_Y				= 0.78;//0.96;
const HUD_RADAR_Y_OFFSET		= 0.039;

const INV_HINT_LIFETIME			= 5.0;
const WEAP_HINT_LIFETIME		= 6.0;
const INFINITE_HINT_TIME		= -1.0;

// Numbers for radar
const RADAR_IMAGE_SCALE			= 1.5;
const RADAR_WARMUP_BASE			= 100;
const RADAR_NORMAL_BASE			= 60;
const RADAR_WARMUP_RAND			= 40;
const RADAR_NORMAL_RAND			= 10;
const RADAR_Y_SPEED				= 0.6;
const HUD_START_RADAR_Y			= 1.25;
const BACKGROUND_TARGET_ALPHA	= 100;
const RADAR_TARGET_HINTS		= 0.3;
const RADAR_TARGET_KILL_HINTS	= 0.05;
const RADAR_TARGET_MOUSE_HINT	= 0.9;
const RADAR_TARGET_STATS		= 0.4;
const TARGET_KILL_RADIUS		= 9.0;
const COP_OFFSET_X				= -0.002;
const COP_OFFSET_Y				= -0.01;
const GUN_OFFSET_X				= -0.0055;
const GUN_OFFSET_Y				= 0.0065;
const MP_RADAR_RADIUS			= 88;
const MP_RADAR_SCALE			= 0.016;

// Relative positions of section backgrounds
// 11/02/12 JWB
// X Offset needs to be changable for widescreen
// Declared in HUDSetup
var float HudBackgroundXOffset;	//= -0.065;
const HUD_BACKGROUND_X_OFFSET   = 0.0;
const HUD_BACKGROUND_Y_OFFSET	= -0.061;

// Relative positions of section numbers
const HUD_NUMBERS_OFFSET_X			= +0.005;
const HUD_NUMBERS_MAX_AMMO_OFFSET_X	= +0.025;
const HUD_NUMBERS_OFFSET_Y			= +0.040;
const HUD_NUMBERS_FIRING_MODE_X		= +0.005;
const HUD_NUMBERS_FIRING_MODE_Y		= +0.045;

// Relative positions of armor stuff
const HUD_ARMOR_NUMBERS_OFFSET_X	= +0.050;
const HUD_ARMOR_NUMBERS_OFFSET_Y	= +0.050;
const HUD_ARMOR_ICON_OFFSET_X		= -0.050;
const HUD_ARMOR_ICON_OFFSET_Y		= -0.000;
const HUD_ARMOR_ICON_SCALE			= 0.6;

// Position of "issued to" text
const HUD_ISSUED_TEXT_X			= 0.98;	// right justified
const HUD_ISSUED_TEXT_Y			= 0.93;

// Position of suicide hint text
const HUD_SUICIDE_TEXT_X		= 0.5;	// center justified
const HUD_SUICIDE_TEXT_Y1		= 0.85;
const HUD_SUICIDE_TEXT_Y3		= 0.89;
const HUD_SUICIDE_TEXT_Y2		= 0.93;

// Positions for hints and messages for when dead
const HUD_DEAD_TEXT_Y2			= 0.89;
const DEAD_HINT_X				= 0.5;
const DEAD_HINT_Y				= 0.05;
const DEAD_HINT_Y_INC			= 0.035;

// Alpha darkness (255 would be black) for background behind hint text
const BACKTEXT_ALPHA			= 180;
// Part of darker message background that extends below bottom of text
const BOTTOM_FADE_BUFFER			= 0.01;

// Position of suicide hint text
const HUD_ROCKET_TEXT_X			= 0.5;	// center justified
const HUD_ROCKET_TEXT_Y1		= 0.05;
const HUD_ROCKET_TEXT_Y2		= 0.08;

// Hurt bar values
const HURT_SIDE_X_INC			= 3;
const HURT_SIDE_Y_INC			= 25;
const HURT_TOP_X_INC			= 3;
const HURT_TOP_Y_INC			= 50;
const HURT_BAR_HEALTH_MOD		= 8;
const SKULL_SIZE_RATIO			= 0.2;
const SKULL_ALPHA				= 100;
const LIPSTICK_SIZE_RATIO		= 4.0;
const LIPSTICK_ALPHA			= 51;
const DEFAULT_HURT_ALPHA		= 160;

const SNIPER_BAR_MAX_TIME		= 0.6;	// time it takes sniper bars to warm up
const SNIPER_BAR_INCREASE_SIDE	= 20.0;
const SNIPER_BAR_INCREASE_TOP	= 4.0;
const SNIPER_BAR_ALPHA			= 255;
const SNIPER_SIDE_X_INC			= 12;
const SNIPER_SIDE_Y_INC			= 50;
const SNIPER_TOP_X_INC			= 3;
const SNIPER_TOP_Y_INC			= 65;


const SHOW_DEBUG_LINES			= 0;

const TIME_X = 0.05;
const TIME_Y = 0.93;

//var Texture KillIcon;		// For Kill Count missions, display this with the number
							// to kill
var Texture KillBkgd;		// Background blood splat behind pawn to kill
var HudPos KillPos;			// position on screen for kill count stuff
var HudPos KillOffset;		// offset for extra kill counters
var int LastKillCount;		// Keeps track of last kill count to know to
							// shake hud icon
//var float ShakeKillTime;	// Time to be shaking the kill pawn icon
var Texture BossIcon;		// Shows image of boss your killing

// head injury effects
struct SwirlTexStruct
{
	var bool  bHitMinAlpha;	// Hits min alpha and then turns itself off, if true
	var bool  bInActive;
	var Texture tex;
	var float x;
	var float y;
	var float xoff;
	var float yoff;
	var float scale;
	var float MoveTime;
	var float MoveTimeDilation;
	var float MoveSpeed;
	var float red;
	var float green;
	var float blue;
	var float alpha;
	var float redchange;
	var float greenchange;
	var float bluechange;
	var float alphachange;
	// Highest is 255
	var float redmax;
	var float greenmax;
	var float bluemax;
	var float alphamax;
	// Don't make any mins below 1.0. That should be the lowest
	var float redmin;
	var float greenmin;
	var float bluemin;
	var float alphamin;
};

var byte StartActive;						// whether the start injuries should be shown/moved
var array<SwirlTexStruct> startinjuries;	// for starting head injury effects
var byte WalkActive;						// whether the walk injuries should be shown/moved
var array<SwirlTexStruct> walkinjuries;		// for persistent head injury effects
var byte StopActive;						// whether the stop injuries should be shown/moved
var array<SwirlTexStruct> stopinjuries;		// for stopping head injury effects
var byte GaryActive;						// whether the gary effects should be shown/moved
var array<SwirlTexStruct> garyeffects;		// for your gary head powers

var byte CatnipActive;						// xPatch: Same as above but for catnip
var array<SwirlTexStruct> catnipeffects;		

var float UltraWideOffsetX; // For Ultra Widescreen resolutions. Offset should be enough to get to middle monitor.

// consts
const SIXTEEN_BY_TEN_ASPECT_RATIO = 1.6;

//const SHAKE_KILL_TIME	=	1.5;
const SHAKE_MOD			=	0.01;

const HUD_NUMBERS_KILL_OFFSET_X	= +0.002;
const HUD_NUMBERS_MAX_KILL_OFFSET_X	= +0.030;

const DRAW_JOYSTICK_DEBUG = 0;

// xPatch: Prize Icons Fix
const PRIZE_ICON_SCALE		    = 0.25;

///////////////////////////////////////////////////////////////////////////////
// Head injury functions
///////////////////////////////////////////////////////////////////////////////
function StartHeadInjury()
{
	local int i;

	for(i=0; i<startinjuries.Length; i++)
		startinjuries[i] = default.startinjuries[i];
	StartActive=1;
}
function DoWalkHeadInjury()
{
	local int i;

	for(i=0; i<walkinjuries.Length; i++)
		walkinjuries[i] = default.walkinjuries[i];
	WalkActive=1;
	StopSwirlOnAlpha(startinjuries, true);
}
function StopHeadInjury()
{
	local int i;

	for(i=0; i<stopinjuries.Length; i++)
		stopinjuries[i] = default.stopinjuries[i];
	// stop the others instantly
	StartActive=0;
	WalkActive=0;
	StopActive=1;
	StopSwirlOnAlpha(stopinjuries, true);
}
function DoGaryEffects()
{
	local int i;

	if(GaryActive == 0)
	{
		for(i=0; i<garyeffects.Length; i++)
			garyeffects[i] = default.garyeffects[i];
		GaryActive=1;
	}
}
function StopGaryEffects()
{
	local int i;
	for(i=0; i<garyeffects.Length; i++)
		garyeffects[i] = default.garyeffects[i];
	GaryActive=0;
}


///////////////////////////////////////////////////////////////////////////////
// Have the swirl turn itself off when it hits min alpha
///////////////////////////////////////////////////////////////////////////////
function StopSwirlOnAlpha(out array<SwirlTexStruct> curswirl, bool bClampBottom)
{
	local int i;

	for(i=0; i<curswirl.Length; i++)
	{
		curswirl[i].bHitMinAlpha=true;
		// Make it fade very low
		if(bClampBottom)
			curswirl[i].alphamin=1.0;
	}
}

///////////////////////////////////////////////////////////////////////////////
// Stop all swirl effects
///////////////////////////////////////////////////////////////////////////////
function StopSwirls()
{
	StartActive=0;
	WalkActive=0;
	StopActive=0;
	GaryActive=0;
	CatnipActive=0;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function CycleSwirlColor(out float usec, out float usespeed, float max, float min, float DeltaTime,
						 optional out byte hitmax, optional out byte hitmin)
{
	if(usespeed != 0.0)
	{
		usec += usespeed*DeltaTime;
		if(usec > max
			&& usespeed > 0)
		{
			hitmax = 1;
			usec=max;
			usespeed=-usespeed;
		}
		else if(usec < min
			&& usespeed < 0)
		{
			hitmin = 1;
			usec=min;
			usespeed=-usespeed;
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Move the swirl effects around
///////////////////////////////////////////////////////////////////////////////
function MoveSwirl(out array<SwirlTexStruct> curswirl, out byte IsActive, float DeltaTime)
{
	local int i;
	local byte hitmin, hitmax;

	IsActive=0;
	// Move Swirl effects
	for(i=0; i<curswirl.length; i++)
	{
		if(!curswirl[i].bInActive)
		{
			if(curswirl[i].MoveSpeed != 0.0)
			{
				// Move them
				curswirl[i].MoveTime+=(curswirl[i].MoveTimeDilation*DeltaTime);
				if(curswirl[i].MoveTime > pi)
					curswirl[i].MoveTime-=(2*pi);
				curswirl[i].x = curswirl[i].xoff + curswirl[i].MoveSpeed*cos(curswirl[i].MoveTime);
				curswirl[i].y = curswirl[i].yoff + curswirl[i].MoveSpeed*sin(curswirl[i].MoveTime);
			}
			// Cycle colors
			CycleSwirlColor(curswirl[i].red, curswirl[i].redchange, curswirl[i].redmax, curswirl[i].redmin, DeltaTime);
			CycleSwirlColor(curswirl[i].green, curswirl[i].greenchange, curswirl[i].greenmax, curswirl[i].greenmin, DeltaTime);
			CycleSwirlColor(curswirl[i].blue, curswirl[i].bluechange, curswirl[i].bluemax, curswirl[i].bluemin, DeltaTime);
			hitmin=0;
			CycleSwirlColor(curswirl[i].alpha, curswirl[i].alphachange, curswirl[i].alphamax, curswirl[i].alphamin, DeltaTime, , hitmin);
			// If you hit the min and your supposed to go inactive at that point, set it
			if(hitmin == 1
				&& curswirl[i].bHitMinAlpha)
				curswirl[i].bInActive=true;
			else // Otherwise, you are still active, so mark it
				IsActive=1;
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// PostBeginPlay
///////////////////////////////////////////////////////////////////////////////
simulated function PostBeginPlay() {
    local int i;
    local AnimalPawn Animal;

	Super.PostBeginPlay();

	OurPlayer = P2Player(Owner);

	if (P2GameInfo(Level.Game) != None)
		IssuedTo = P2GameInfo(Level.Game).GetIssuedTo();

	foreach DynamicActors(class'AnimalPawn', Animal) {
	    if (Animal.IsA('CowPawn')) {
 	        RadarAnimalPawns.Insert(RadarAnimalPawns.length, 1);
        	RadarAnimalPawns[RadarAnimalPawns.length-1] = Animal;
 	    }
	}
}

///////////////////////////////////////////////////////////////////////////////
// Show or hide various parts of the HUD
///////////////////////////////////////////////////////////////////////////////
simulated function float GetRadarYOffset()
{
	return (HUD_RADAR_Y + HUD_RADAR_Y_OFFSET);
}
simulated function float GetStartRadarY()
{
	return HUD_START_RADAR_Y;
}

///////////////////////////////////////////////////////////////////////////////
// Tick
///////////////////////////////////////////////////////////////////////////////
function Tick(float DeltaTime)
{
	local int i;
	local float HeartSizeBase;
	local float FadeTime;

	if(OurPlayer == None)
		return;

	// Pump the heart
	OurPlayer.HeartTime+=(OurPlayer.HeartBeatSpeed*DeltaTime);

	// Do funky things to the heart time, if necessary
	OurPlayer.ModifyHeartTime(DeltaTime);

	// calc sizes
	if(OurPlayer.HeartTime > pi)
		OurPlayer.HeartTime-=pi;

	HeartSizeBase = (2*OurPlayer.HeartScale);
	HeartPumpSizeX = HeartSizeBase-sin(OurPlayer.HeartTime)*OurPlayer.HeartScale;
	HeartPumpSizeY = (HeartSizeBase-sin(OurPlayer.HeartTime-pi/4)*OurPlayer.HeartScale)/4;

	// Handle fading 'hurt bars' around your view
	for(i=0; i<ArrayCount(OurPlayer.HurtBarTime); i++)
	{
		if(OurPlayer.HurtBarTime[i] > 0)
		{
			OurPlayer.HurtBarTime[i] -= DeltaTime;
			if(OurPlayer.HurtBarTime[i] < 0)
				OurPlayer.HurtBarTime[i]=0;
		}
	}

	// Handle sniper bars around our view
	OurPlayer.CalcSniperBars(DeltaTime, SNIPER_BAR_MAX_TIME);

	// Handle radar
	if(OurPlayer.RadarState != 0)
	{
		if(OurPlayer.ShowRadarBringingUp())
		{
			if(OurPlayer.RadarBackY > (HUD_RADAR_Y + HUD_RADAR_Y_OFFSET))
			{
				OurPlayer.RadarBackY -= (RADAR_Y_SPEED*DeltaTime);
				if(OurPlayer.RadarBackY < (HUD_RADAR_Y + HUD_RADAR_Y_OFFSET))
					OurPlayer.RadarBackY = (HUD_RADAR_Y + HUD_RADAR_Y_OFFSET);
			}
		}
		else if(OurPlayer.ShowRadarDroppingDown())
		{
			if(OurPlayer.RadarBackY < HUD_START_RADAR_Y)
			{
				OurPlayer.RadarBackY += (RADAR_Y_SPEED*DeltaTime);
			}
		}
	}

	// Kill Count
	// If a pawn in question was just killed, shake icon to show something
	// important just happened.
	for (i = 0; i < OurPlayer.KillJobs.Length; i++)
		if (OurPlayer.KillJobs[i].ShakeKillTime > 0)
		{
			OurPlayer.KillJobs[i].ShakeKillTime-=DeltaTime;
			if(OurPlayer.KillJobs[i].ShakeKillTime < 0)
				OurPlayer.KillJobs[i].ShakeKillTime=0;
		}
	/*
	if(ShakeKillTime > 0)
	{
		ShakeKillTime-=DeltaTime;
		if(ShakeKillTime < 0)
			ShakeKillTime=0;
	}
	*/

	// xPatch: Catnip effects, overrides head injury
	if(CatnipActive != 0) 
		MoveSwirl(catnipeffects, CatnipActive, DeltaTime);
	// End
	if(StartActive != 0)
		MoveSwirl(startinjuries, StartActive, DeltaTime);
	if(WalkActive != 0)
		MoveSwirl(walkinjuries, WalkActive, DeltaTime);
	if(StopActive != 0)
		MoveSwirl(stopinjuries, StopActive, DeltaTime);
	// Have the head injury effects override the gary effects
	if(StartActive == 0
		&& WalkActive == 0
		&& StopActive == 0
		&& GaryActive != 0)
		MoveSwirl(garyeffects, GaryActive, DeltaTime);
}

///////////////////////////////////////////////////////////////////////////////
// Change the hud splats that are the backing for each category like health, weapons, inventory
///////////////////////////////////////////////////////////////////////////////
function ChangeHudSplats(array<Material> NewSplats)
{
	local int i;
	for(i=0; i<SectionBackground.Length; i++)
	{
		if(i<NewSplats.Length)
			SectionBackground[i] = NewSplats[i];
	}
}

///////////////////////////////////////////////////////////////////////////////
//
///////////////////////////////////////////////////////////////////////////////
simulated event PostRender(canvas Canvas)
{
	local bool bStrictIGT;
	local bool bForcedCrosshair;
	
	// If there's an active screen, check to see if it wants the hud
	// If there's a root window running then never show the hud
	if ((OurPlayer.CurrentScreen == None || OurPlayer.CurrentScreen.ShouldDrawHUD()) && !AreAnyRootWindowsRunning())
		{
		if ( !PlayerOwner.bBehindView )
			{
			// Draw your foot in now
			if ( (PawnOwner != None) && (PawnOwner.MyFoot != None) )
				PawnOwner.MyFoot.RenderOverlays(Canvas);
			}

		// Do rest of weapons and hud
		Super.PostRender(Canvas);

		// Give game info a chance to show debug stuff
		if (P2GameInfoSingle(Level.Game) != None)
			P2GameInfoSingle(Level.Game).RenderOverlays(Canvas);
		}

	// Display text saying who this version was issued to
	DrawIssuedToText(Canvas);
	
// xPatch: 
	//Crosshair
	if( OurPlayer != None 
		&& (OurPlayer.bHUDCrosshair || OurPlayer.bForceCrosshair || OurPlayer.ThirdPersonView))
	{
		bForcedCrosshair = (OurPlayer.bForceCrosshair || OurPlayer.bNoCustomCrosshairs);
		DrawCrosshair(Canvas, Scale, bForcedCrosshair);
	}
	// Needed to see what we change in Viewmodel Options
	if(AreAnyRootWindowsRunning() && PawnOwner != None && P2Weapon(PawnOwner.Weapon) != None 
		&& OurPlayer.bForceViewmodel && !OurPlayer.bBehindView)
		P2Weapon(PawnOwner.Weapon).RenderOverlays(Canvas);
// End

	//ErikFOV Change: Subtitle system
	if (OurPlayer.CurrentScreen == None && OurPlayer.bEnableSubtitles && SubBoxSize > 0 && (!bHideHUD || OurPlayer.ViewTarget != OurPlayer.Pawn))
	{
		DrawSubtitles(Canvas);
	}
	//end
	
	// Global conditions for drawing any IGT.
	if (P2GameInfoSingle(Level.Game) != None && !P2GameInfoSingle(Level.Game).bNeverDrawTime)
	{	
		// Draw normal IGT only when the clock is running.
		if (!P2GameInfoSingle(Level.Game).bStrictTime
			&& (OurPlayer.CurrentScreen == None || OurPlayer.CurrentScreen.ShouldDrawHUD())
			&& !AreAnyRootWindowsRunning()
			&& PawnOwner != None
			&& PawnOwner.Health > 0
			&& Level.Pauser == None
			&& P2GameInfoSingle(Level.Game).TheGameState != None
			&& !PlayerOwner.IsInState('PlayerPrepSave')
			)
		{
			DrawTimeOnScreen(Canvas);
		}
		// Draw strict timer always
		else if (P2GameInfoSingle(Level.Game).bStrictTime
			&& P2GameInfoSingle(Level.Game).TheGameState != None
			&& !IsMainMenuRunning())
		{
			DrawTimeOnScreen(Canvas);
		}
		// If time is called, draw the timer regardless.
		else if (P2GameInfoSingle(Level.Game).TheGameState != None
			&& P2GameInfoSingle(Level.Game).TheGameState.TimeStop != vect(0,0,0))
		{
			DrawTimeOnScreen(Canvas);
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function string LZero(int N, int Places)
{
	local string S;
	local int i;

	S = String(N);
	for (i=0; len(S)<Places; i++)
		S = "0" $ S;

	return S;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function DrawTimeOnScreen(Canvas C)
{
	local float Elapsed;
	local int Hours;
	local int Minutes;
	local float HrMin;
	local int Seconds;
	local string FinalOut;
	local float Excess;
	local int Centi;

	if (P2GameInfoSingle(Level.Game) == None
		|| P2GameInfoSingle(Level.Game).TheGameState == None
		|| !P2GameInfoSingle(Level.Game).bDrawTime
		|| !P2GameInfoSingle(Level.Game).bReadyToDrawTime)
		return;

	Elapsed = P2GameInfoSingle(Level.Game).TheGameState.GetTimeElapsed();

	Hours = int(Elapsed/3600);

	Minutes = Int((Elapsed - float(Hours*3600)) / 60);

	Seconds = Int((Elapsed - float(Hours*3600) - float(Minutes*60)));

	Excess = Hours*3600 + Minutes*60 + Seconds;
	Centi = int((Elapsed - Excess) * 100);

//	Minutes = int(Elapsed/60);

//	HrMin = Hours*3600 + Minutes*60;

//	Seconds = int(Elapsed - HrMin);
//	Excess = Elapsed - HrMin - Seconds;
//	Centi = int(Excess * 100);

	FinalOut = LZero(Hours,2) $ ":" $ LZero(Minutes, 2) $ ":" $ LZero(Seconds, 2) $ "." $ LZero(Centi, 2);

	MyFont.TextColor = WhiteColor;
	MyFont.DrawTextEX(C, CanvasWidth, UltraWideOffsetX + TIME_X * CanvasWidth, TIME_Y * CanvasHeight, FinalOut, 1, true, EJ_Left);
	//MyFont.TextColor = RedColor;	
	MyFont.TextColor = MyFont.default.TextColor;	// xPatch: HUD Color Fix
}

///////////////////////////////////////////////////////////////////////////////
// Setup stuff
///////////////////////////////////////////////////////////////////////////////
simulated function HUDSetup(canvas canvas)
{
    local float Nearest16By10, OffsetX, Resize;
	Super.HUDSetup(Canvas);

	if (OurPlayer == None)
		PawnOwner = None;
	else if (OurPlayer.ViewTarget == OurPlayer)
		PawnOwner = P2Pawn(OurPlayer.Pawn);
	else if (OurPlayer.ViewTarget.IsA('Pawn') && Pawn(OurPlayer.ViewTarget).Controller != None)
		PawnOwner = P2Pawn(OurPlayer.ViewTarget);
	else if (OurPlayer.Pawn != None)
		PawnOwner = P2Pawn(OurPlayer.Pawn);
	else
		PawnOwner = None;

    // Zero so it won't add anything if they're not using ultraws.
    UltraWideOffsetX = 0;

	// Setup defaults
	Canvas.Reset();
	Canvas.SpaceX = 0;
	Canvas.bNoSmooth = True;
	Style = ERenderStyle.STY_Translucent;
	Canvas.Style = Style;
	Canvas.DrawColor = WhiteColor;

	AspectRatio = CanvasHeight / CanvasWidth;
	Canvas.Font = MyFont.GetFont(2, false, CanvasWidth );

    // Check if they're in UltraWS
	if(AspectRatio <= 0.59)	// UltraWS+
	{
        Nearest16By10 = OurPlayer.GetSixteenByTenResolution(canvas);
        UltraWideOffsetX = (CanvasWidth - Nearest16By10) /2;
        CanvasWidth = Nearest16By10;// + OffsetX; // Act like 16:10
	}


    //Resize = OurPlayer.GetFourByThreeResolution(canvas);
    HudBackgroundXOffset = -0.065;
	scale = OurPlayer.GetFourByThreeResolution(canvas) / EXPECTED_START_RES_WIDTH;
}

///////////////////////////////////////////////////////////////////////////////
// Display console messages
///////////////////////////////////////////////////////////////////////////////
function DisplayMessages(canvas Canvas)
{
	local int i, j;
	local float X, Y, XL, YL;

	// Clean out old messages
	for (i = 0; i < ArrayCount(TextMessages); i++)
	{
		if ( TextMessages[i] == "" )
			break;
		else if ( MessageLife[i] < Level.TimeSeconds )
		{
			TextMessages[i] = "";
			if (i < ArrayCount(TextMessages)-1)
			{
				for (j = i; j < ArrayCount(TextMessages)-1; j++)
				{
					TextMessages[j] = TextMessages[j+1];
					MessageLife[j] = MessageLife[j+1];
					TextMessageColors[j]=TextMessageColors[j+1];
				}
			}
			TextMessages[ArrayCount(TextMessages)-1] = "";
			break;
		}
	}

	// Draw messages
	Canvas.Style = ERenderStyle.STY_Normal;
	Canvas.Font = MyFont.GetFont(CategoryFormats[0].FontSize, CategoryFormats[0].bPlainFont, CanvasWidth);
	Canvas.bCenter = false;
	for (i = 0; i < ArrayCount(TextMessages); i++)
	{
		if (TextMessages[i] != "")
		{
			// Set the color for each message, in case one is a player typing
			Canvas.DrawColor = TextMessageColors[i];
			Canvas.StrLen(TextMessages[i], XL, YL);
			PositionLocalMessage(Canvas, 0, i, XL, YL, X, Y);
			//ErikFOV Change: fix hud
			//Canvas.SetPos(UltraWideOffsetX + X, Y);
			Canvas.SetPos(X, Y);
			//end
			MyFont.DrawText(Canvas, TextMessages[i], 1.0);
		}
		else
			break;
	}
}

//ErikFOV Change: Subtitle system
function ClearSubtitles()
{
	SubBoxH = 0;
	Subtitles.length = 0;
	SubBoxAlpha = 1;
	SubBoxVel = 0;
}

function DrawSubtitles(canvas Canvas)
{
	local int xT, yT, i, SubBoxDH, SubBL, SubBT, SubAlp, iT, iL, SBW, SLH, BH, FonSize, lineH;
	local float SBProgress, Delta;
	local Color Sh, nSh;
	local array<int> LineCoords;
	local Color SubColor;	// Added by Man Chrzan: xPatch 2.0

	SubAlp = 100;

	Delta = Level.TimeSecondsAlways - TimerDelta;

	if (Delta > 0.01)	TimerDelta = Level.TimeSecondsAlways;
	else Delta = 0;

	if (SubBoxSize != OurPlayer.SubtitlesSize)
	{
		ClearSubtitles();
		SubBoxSize = OurPlayer.SubtitlesSize;
	}

	if (Delta != 0 && Subtitles.length > 0 && SubBoxAlpha < SubAlp)	SubBoxAlpha = FClamp(SubBoxAlpha + (300 * Delta), 1, SubAlp);
			
	if (SubBoxAlpha > 1)
	{
		if (SubBoxSize != 1)
		{
			iL = indentL / SubBoxSize;
			iT = indentT / SubBoxSize;
			SBW = SubBoxW / SubBoxSize;
			SLH = SubLineH / SubBoxSize;
			BH = BorderH / SubBoxSize;
			FonSize = 1000 / SubBoxSize;
		}
		else
		{
			iL = indentL;
			iT = indentT;
			SBW = SubBoxW;
			SLH = SubLineH;
			BH = BorderH;
			FonSize = 1000;
		}

		if (SubBoxH == 0) SubBoxH = iT * 2 + SubLineH;

		ClearOldLines();

		SubBL = (Canvas.SizeX / 2) - (SBW / 2);
		SubBT = Canvas.SizeY - SubBoxBottom - SubBoxH;

		//////////////////// Calc SubBox Height by line amount, borders and indents
		SubBoxDH = iT * 2;
		xT = SubBL + iL;
		

		for (i = 0; i < Subtitles.Length; i++)
		{
			LineCoords.insert(i, 1);
			LineCoords[i] = lineH;
			lineH += Subtitles[i].Pos;

			if (SubBoxH >= SubBoxDH) Subtitles[i].bAct = true;
			SubBoxDH += SLH;
			if (i != Subtitles.Length-1 && Subtitles[i].Border) SubBoxDH += BH;
		}

		yT = Canvas.SizeY - SubBoxBottom - lineH + iT;

		//////////////////// Draw SubBox
		if (Delta != 0 && Subtitles.length == 0 && SubBoxAlpha > 1)
		{
			SubBoxAlpha = FClamp(SubBoxAlpha - (300 * Delta), 1, SubAlp);
		}

		Canvas.Style = ERenderStyle.STY_Alpha;
		Canvas.SetDrawColor(255, 255, 255, SubBoxAlpha);
		Canvas.SetPos(SubBL, SubBT - 16);
		Canvas.DrawTile(SubBoxBGCorner, 16, 16, 0, 0, 16, 16);

		Canvas.SetPos(SubBL + SBW - 16, SubBT - 16);
		Canvas.DrawTile(SubBoxBGCorner, 16, 16, -16, 0, 16, 16);

		Canvas.SetPos(SubBL, SubBT + SubBoxH);
		Canvas.DrawTile(SubBoxBGCorner, 16, 16, 0, -16, 16, 16);

		Canvas.SetPos(SubBL + SBW - 16, SubBT + SubBoxH);
		Canvas.DrawTile(SubBoxBGCorner, 16, 16, -16, -16, 16, 16);

		Canvas.SetPos(SubBL + 16, SubBT + SubBoxH);
		Canvas.DrawTile(SubBoxBG, SBW - 32, 16, 0, 0, 64, 64);

		Canvas.SetPos(SubBL + 16, SubBT - 16);
		Canvas.DrawTile(SubBoxBG, SBW - 32, 16, 0, 0, 64, 64);

		Canvas.SetPos(SubBL, SubBT);
		Canvas.DrawTile(SubBoxBG, SBW, SubBoxH, 0, 0, 64, 64);

		//////////////////// Draw Text
		for (i = 0; i < Subtitles.Length; i++)
		{
			if (Subtitles[i].bAct)
			{
				Sh = MyFont.ShadowColor;
				MyFont.ShadowColor = nSh;
				/*MyFont.TextColor = Subtitles[i].TextColor;
				MyFont.DrawTextEx(Canvas, FonSize, xT, yT + LineCoords[i], Subtitles[i].text, 1, true, EJ_Left);*/
				SubColor = Subtitles[i].TextColor;
				MyFont.DrawTextEx(Canvas, FonSize, xT, yT + LineCoords[i], Subtitles[i].text, 1, true, EJ_Left, SubColor);
				if (Subtitles[i].name != "")
				{
					Subtitles[i].NameColor.A = Subtitles[i].TextColor.A;
					/*MyFont.TextColor = Subtitles[i].NameColor;
					MyFont.DrawTextEx(Canvas, FonSize, xT, yT + LineCoords[i], "" $ Subtitles[i].name $ ": ", 1, true, EJ_Left);*/
					SubColor = Subtitles[i].NameColor;
					MyFont.DrawTextEx(Canvas, FonSize, xT, yT + LineCoords[i], "" $ Subtitles[i].name $ ": ", 1, true, EJ_Left, SubColor);
				}
				/*MyFont.TextColor = RedColor;*/
				MyFont.ShadowColor = Sh;
			}
		}

		//////////////////// Update Text animation
		if (Delta != 0)
		{
			for (i = 0; i < Subtitles.Length; i++)
			{
				if (Subtitles[i].bAct && !Subtitles[i].bDel)
				{
					if (Subtitles[i].Border && Subtitles[i].Pos < SLH + BH)
					{
						Subtitles[i].Pos = FClamp(Subtitles[i].Pos + (200 * Delta), 0, SLH + BH);
					}
					else if (Subtitles[i].Pos < SLH)
					{
						Subtitles[i].Pos = FClamp(Subtitles[i].Pos + (200 * Delta), 0, SLH);
					}

					if (Subtitles[i].TextColor.A < 255)
					{
						Subtitles[i].TextColor.A = FClamp(Subtitles[i].TextColor.A + (500 * Delta), 0, 255);
					}
				}
				else if (Subtitles[i].bDel)
				{
					if (Subtitles[i].TextColor.A > 1)
					{
						Subtitles[i].TextColor.A = FClamp(Subtitles[i].TextColor.A - (500 * Delta), 1, 255);
					}
					else if (Subtitles[i].Pos > 0)
					{
						Subtitles[i].Pos = FClamp(Subtitles[i].Pos - (200 * Delta), 0, Subtitles[i].Pos);
					}
					else
					{
						Subtitles.Remove(i, 1);
					}
				}
			}
		}

		//////////////////// Update SubBox animation
		if (SubBoxOldH != SubBoxDH)	SubBoxVel = 1;

		if (SubBoxVel == 1)
		{
			AddAnimProp("SubBox", 'Smooth in out', SubBoxH, SubBoxDH, 0.5);
			SubBoxVel = 0;
		}
		
		if (GetAnimPropProgress("SubBox", SBProgress)) SubBoxH = SBProgress;
		SubBoxOldH = SubBoxDH;
	}	
}

function AddAnimProp(string PropTag, name AnimType, float Init, float End, float Duration)/// types: Smooth in out, linear
{
	local int i;

	for (i = 0; i < AnimProps.Length; i++)
	{
		if (AnimProps[i].Tag == PropTag)
		{
			AnimProps[i].Type = AnimType;
			AnimProps[i].Init = Init;
			AnimProps[i].End = End;
			AnimProps[i].Duration = Duration;
			AnimProps[i].InitTime = level.TimeSecondsAlways;
			return;
		}
	}

	AnimProps.insert(AnimProps.Length, 1);
	i = AnimProps.Length - 1;
	AnimProps[i].Tag = PropTag;
	AnimProps[i].Type = AnimType;
	AnimProps[i].Init = Init;
	AnimProps[i].End = End;
	AnimProps[i].Duration = Duration;
	AnimProps[i].InitTime = level.TimeSecondsAlways;
}

function bool GetAnimPropProgress(string PropTag, out float Progress)
{
	local int i;
	local float DTime, Result, Speed, Timeleft;

	for (i = 0; i < AnimProps.Length; i++)
	{
		if (AnimProps[i].Tag == PropTag)
		{
			Timeleft = Level.TimeSecondsAlways - AnimProps[i].InitTime;

			if (AnimProps[i].Type == 'Smooth in out')
			{
				if (Timeleft < AnimProps[i].Duration)
				{
					Speed = pi / AnimProps[i].Duration;
					DTime = pi + (Speed*Timeleft);
					Result = AnimProps[i].Init + ((AnimProps[i].End - AnimProps[i].Init)*((cos(DTime) + 1) / 2));
				}
				else
				{
					Result = AnimProps[i].End;
					AnimProps.remove(i, 1);
				}
			}
			else if (AnimProps[i].Type == 'linear')
			{
				if (Timeleft < AnimProps[i].Duration)
				{
					Speed = (AnimProps[i].End - AnimProps[i].Init) / AnimProps[i].Duration;
					DTime = Speed*Timeleft;
					Result = AnimProps[i].Init + DTime;
				}
				else
				{
					Result = AnimProps[i].End;
					AnimProps.remove(i, 1);
				}
			}
			Progress = Result;
			return true;
		}
	}
	return false;
}

function ClearOldLines()
{
	local int i;

	for (i = 0; i < Subtitles.Length; i++)
	{
		if (Subtitles[i].Time < Level.TimeSecondsAlways)
		{
			Subtitles[i].bDel = true;
		}
	}
}

function AddSubtitles(String N, String S, float DisplayTime, Color NameColor, Color TextColor, int Priority, int lang)
{
	local Array<String> TextLines;
	local int i, l, halfLines, shortslength;
	local bool addTime;

	l = Len(S);
	halfLines = MaxSubtitlesLines / 2;
	shortslength = 10;

	if (Priority < 2)
	addTime = true;

	if (Priority > 0 && l < shortslength && Subtitles.Length > MaxSubtitlesLines - 1) //Don't show short subtitle if subbox is full
		Return;

	if (Priority > 1 && l < shortslength && Subtitles.Length > halfLines) //Don't show short subtitle if subbox is half full
		Return;

	if (Priority > 2 && Subtitles.Length > halfLines) //Don't show subtitle if subbox is half full
		Return;

	if (N != "")
		GetStringLines("" $ N $ ": " $ S, MyFont, TextLines, lang);
	else
		GetStringLines(S, MyFont, TextLines, lang);

	for (i = 0; i < TextLines.Length; i++)
	{
		if (i == 0)
			InsertSubtitle(N, TextLines[i], DisplayTime, NameColor, TextColor, addTime);
		else
			InsertSubtitle("", TextLines[i], DisplayTime, NameColor, TextColor, addTime);
	}

	//////////////////// Add border after last Line
	Subtitles[Subtitles.Length - 1].Border = true;
}

function InsertSubtitle(String N, String S, float DisplayTime, Color NameColor, Color TextColor, bool addTime)
{
	local int i;
	local array<SubLine> FullSub;
	local float subtime;

	if (addTime)
	{
		for (i = 0; i < Subtitles.Length; i++)
		{
			if (!Subtitles[i].bDel)
			{
				subtime += 1;
			}
		}
	}

	FullSub = Subtitles;
	FullSub.Insert(Subtitles.Length, 1);
	FullSub[FullSub.Length - 1].name = N;
	FullSub[FullSub.Length - 1].text = S;
	FullSub[FullSub.Length - 1].Time = Level.TimeSecondsAlways + DisplayTime + subtime;
	FullSub[FullSub.Length - 1].TextColor = TextColor;
	FullSub[FullSub.Length - 1].NameColor = NameColor;
	Subtitles = FullSub;

	if (Subtitles.Length > MaxSubtitlesLines)
	{
		for (i = 0; i < Subtitles.Length; i++)
		{
			if (!Subtitles[i].bDel)
			{
				Subtitles[i].bDel = true;
				break;
			}
		}
	}
}

function GetStringLines(String S, FontInfo F, out Array<String> Lines, int lang, optional Int LineSize)
{
	Local String Text, RightText, Result, brChar;
	Local int CharIndex, LineIndex;

	Text = S;
	
	if(LineSize == 0)
	{
		if(lang <= 2 || lang > 3) {LineSize = 75; brChar = " ";}
		else if(lang == 3) {LineSize = 40; brChar = "?";}
	}
	
	while (Text != "")
	{
		Lines.Insert(Lines.Length, 1);
		LineIndex = Lines.Length - 1;

		while (Text != "" && len(Lines[LineIndex]) < LineSize)
		{
			//////////////////// Find space
			CharIndex = InStr(Text, brChar);
			
			/*if(CharIndex == 0) {brChar = "?"; CharIndex = InStr(Text, brChar);}
			if(CharIndex == 0) {brChar = "?"; CharIndex = InStr(Text, brChar);}
			if(CharIndex == 0) {brChar = " ";}*/
			
			//////////////////// Find train of spaces 
			RightText = Right(Text, len(Text) - CharIndex - 1);

			while (RightText != "" && InStr(RightText, brChar) == 0)
			{
				RightText = Right(Text, len(RightText) - 1);
				CharIndex += 1;
			}

			//////////////////// Get end char if spaces not found
			if (CharIndex < 0) CharIndex = len(Text);

			//////////////////// Add found word in current line
			Result = Lines[LineIndex] $ Left(Text, CharIndex + 1);

			//////////////////// Stop iterator if result more of limit and current line is not empty
			if (len(Result) > LineSize && len(Lines[LineIndex]) > 0) break;
		
			//////////////////// Add word in array and set new text for next iteration
			Lines[LineIndex] = Result;
			Text = Right(Text, len(Text) - CharIndex - 1);
		}
	}
	Return;
}
//end

///////////////////////////////////////////////////////////////////////////////
// Draw "skip this scene" message
///////////////////////////////////////////////////////////////////////////////
function DrawSkipMessage(Canvas Canvas)
{
	local float XL, YL, X, Y;
	local float FadeOut;
	local string UseStr;
	
	// Initialize skip hint if we're being sent here for the first time.
	if (CantSkipHint == "")
	{
		// Pull the message from the SceneManager, if it's set.
		CantSkipHint = OurPlayer.GetCurrentSceneManager().CantSkipMessage[Rand(OurPlayer.GetCurrentSceneManager().CantSkipMessage.Length)];
		// If not set, use a preset message
		if (CantSkipHint == "")
			CantSkipHint = CantSkipHints[Rand(CantSkipHints.Length)];
		CantSkipTime = Level.TimeSeconds;
	}
	
	// Message is faded and gone. Kill it.
	if (CantSkipTime + CANT_SKIP_DRAW_TIME + CANT_SKIP_FADE_TIME < Level.TimeSeconds)
	{
		CantSkipHint = "";
		return;
	}
	
	// Fade out message, maybe.
	if (CantSkipTime + CANT_SKIP_DRAW_TIME < Level.TimeSeconds)
		FadeOut = 255.0 * (Level.TimeSeconds - CantSkipTime - CANT_SKIP_DRAW_TIME) / CANT_SKIP_FADE_TIME;
	else
		FadeOut = 0.0;

	//Canvas.Style = ERenderStyle.STY_Translucent;
	//Canvas.SetDrawColor(255,255,255,FadeOut);
	X = UltraWideOffsetX + CANT_SKIP_POS_X * CanvasWidth;
	Y = CANT_SKIP_POS_Y * CanvasHeight;
	MyFont.DrawTextEx(Canvas, CanvasWidth, X, Y, CantSkipHint, 1, false, EJ_Center);
}

///////////////////////////////////////////////////////////////////////////////
// Draw a local message
///////////////////////////////////////////////////////////////////////////////
function DrawLocalMessage(Canvas Canvas, int Category, int CatItem, int i)
{
	local float XL, YL, X, Y;
	local float FadeOut;

	Canvas.bCenter = false;

	if (CategoryFormats[Category].bAlwaysUseColor)
		Canvas.DrawColor = CategoryFormats[Category].Color;
	else
		Canvas.DrawColor = LocalMessages[i].DrawColor;

	if (LocalMessages[i].Message.Default.bFadeMessage)
	{
		Canvas.Style = ERenderStyle.STY_Translucent;
		FadeOut = (LocalMessages[i].EndOfLife - Level.TimeSeconds) / LocalMessages[i].LifeTime;
	}
	else
	{
		Canvas.Style = ERenderStyle.STY_Normal;
		FadeOut = 1.0;
	}

	Canvas.DrawColor = Canvas.DrawColor * FadeOut;
	Canvas.Font = MyFont.GetFont(CategoryFormats[Category].FontSize, CategoryFormats[Category].bPlainFont, CanvasWidth);
	Canvas.StrLen(LocalMessages[i].StringMessage, XL, YL);
	PositionLocalMessage(Canvas, Category, CatItem, XL, YL, X, Y);
	//ErikFOV Change: fix hud
	//Canvas.SetPos(UltraWideOffsetX + X, Y);
	Canvas.SetPos(X, Y);
	//end

	if (!LocalMessages[i].Message.default.bComplexString)
		MyFont.DrawText(Canvas, LocalMessages[i].StringMessage, FadeOut);
	else
		LocalMessages[i].Message.static.RenderComplexMessage(Canvas, XL, YL, LocalMessages[i].StringMessage, LocalMessages[i].Switch, LocalMessages[i].RelatedPRI_1, LocalMessages[i].RelatedPRI_2, LocalMessages[i].OptionalObject);

	LocalMessages[i].bDrawn = true;
}

///////////////////////////////////////////////////////////////////////////////
// Master HUD render function.
///////////////////////////////////////////////////////////////////////////////
simulated function DrawHUD( canvas Canvas )
	{
	local Emitter checkem;
	local SceneManager SM;

	HUDSetup(Canvas);

	// Draw special hud messages regardless of whether hud is hidden
	DrawHudMsgs(Canvas);

	// Just keep showing the hud while saving, saving is quicker now
	if (!bHideHUD /*&& (Level.LevelAction == LEVACT_None)*/)
		{
		// Draw player death stuff if necessary, return indicates whether we should draw other stuff
		if (DrawPlayerDeath(Canvas))
			{
			// Draw player status, return indicates whether we should draw other stuff
			if (DrawPlayerStatus(Canvas))
				{
				// Draw local messages
				DrawLocalMessages(Canvas);

				// Debug lines
				if(SHOW_DEBUG_LINES == 1)
					{
					ForEach AllActors(class'Emitter', checkem)
						checkem.RenderOverlays(Canvas);
					}
				}
			}
		}

	// Draw skip message
	/*
	SM = OurPlayer.GetCurrentSceneManager();
	if (SM != None
		&& !SM.bLetPlayerSkip && !SM.bLetPlayerFastForward
		&& (OurPlayer.bWantsToSkip == 1 || CantSkipHint != ""))
		DrawSkipMessage(Canvas);
		
	if (DRAW_JOYSTICK_DEBUG == 1)
		DrawJoystickDebug(Canvas);
	*/
	}
	
///////////////////////////////////////////////////////////////////////////////
// Draw percentage bar
///////////////////////////////////////////////////////////////////////////////
simulated function DrawPercBarDebug(Canvas Canvas, float ScreenX, float ScreenY, float Width, float Height, float Border, Color Fore, float Perc, optional bool bCenter)
{
	local float InnerWidth;
	local float InnerHeight;

	Canvas.Style = ERenderStyle.STY_Alpha;

	if (bCenter)
		Canvas.SetPos(ScreenX - (Width/2), ScreenY);
	else
		Canvas.SetPos(ScreenX, ScreenY);
	Canvas.SetDrawColor(0,0,0,byte(float(Fore.A)*0.75));
	if (Canvas.DrawColor.A > 0)
		Canvas.DrawRect(Texture'engine.WhiteSquareTexture', Width, Height);

	InnerWidth = Width - 2 * Border;
	InnerHeight = Height - 2 * Border;

	if (bCenter)
		Canvas.SetPos(ScreenX - (InnerWidth/2), ScreenY + Border);
	else
		Canvas.SetPos(ScreenX + Border, ScreenY + Border);
		
	Canvas.DrawColor = Fore;
	if (Canvas.DrawColor.A > 0)
		Canvas.DrawRect(Texture'engine.WhiteSquareTexture', InnerWidth * Perc, InnerHeight);
}

///////////////////////////////////////////////////////////////////////////////
// Joystick debugging info
///////////////////////////////////////////////////////////////////////////////
simulated function DrawJoystickDebug(Canvas Canvas)
{
	local Color SaveColor;
	local Color UseColor;
	
	SaveColor = Canvas.DrawColor;
	UseColor.A = 255;
	UseColor.R = 255;
	UseColor.G = 255;
	UseColor.B = 255;
	
	if (OurPlayer.OldaTurn != 0)
		DrawPercBarDebug(Canvas, 20, 50, Abs(OurPlayer.OldaTurn) / 10, 30, 1, UseColor, Abs(OurPlayer.UseaTurn)/Abs(OurPlayer.OldaTurn));
	if (OurPlayer.OldaLookUp != 0)
		DrawPercBarDebug(Canvas, 20, 90, Abs(OurPlayer.OldaLookUp) / 10, 30, 1, UseColor, Abs(OurPlayer.UseaLookUp)/Abs(OurPlayer.OldaLookUp));
}

///////////////////////////////////////////////////////////////////////////////
// Draw player death stuff if needed and return a flag indicated whether other
// hud elements should be displayed (true means they should be displayed)
///////////////////////////////////////////////////////////////////////////////
simulated function bool DrawPlayerDeath(canvas Canvas)
	{
	local bool bDisplayOtherStuff;

	if (PawnOwner != None)
		{
		// Indicate that other hud stuff should be displayed
		bDisplayOtherStuff = true;
		}
	else
		{
		// Put up messages if the player is dead
		if(OurPlayer.IsDead()
			&& !OurPlayer.bFrozen)
			{
			// Display a message as to how to play again if you're dead. Also
			// give helpful hints here, if you died too quickly
			DrawDeadMessage(canvas);
			}
		}

	return bDisplayOtherStuff;
	}

///////////////////////////////////////////////////////////////////////////////
// Draw your Swirl effects
///////////////////////////////////////////////////////////////////////////////
function DrawSwirl(Canvas UseCanvas, out array<SwirlTexStruct> curswirl)
{
	local int i;

	UseCanvas.Style = ERenderStyle.STY_Alpha;
	for(i=0; i<curswirl.Length; i++)
	{
		if(!curswirl[i].bInActive)
		{
			UseCanvas.SetPos(curswirl[i].x*CanvasWidth,
							curswirl[i].y*CanvasHeight);

			UseCanvas.SetDrawColor(curswirl[i].red,
									curswirl[i].green,
									curswirl[i].blue,
									curswirl[i].alpha);

			UseCanvas.DrawTile(curswirl[i].tex,
				curswirl[i].scale*UseCanvas.SizeX,
				curswirl[i].scale*UseCanvas.SizeY,
				0, 0, curswirl[i].tex.USize, curswirl[i].tex.VSize);
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Draw kill jobs
///////////////////////////////////////////////////////////////////////////////
function DrawKillJobs(Canvas Canvas, float Scale)
{
	local int UseMax, UseCount, idx;
    local float backgroundPosX, backgroundPosY, BarLength, BarHeight;
	local int bPercentageDisplay;
	local float UseScale;
	local float useUltraWideOffsetX;
	local string Str;
	
	//ErikFOV Change: Nick's HUD fix
		useUltraWideOffsetX = 0;
	//end

	// Loop through all kill jobs.
	for (idx = 0; idx < OurPlayer.KillJobs.Length; idx++)
	{
		// Get values for this kill job from the player
		OurPlayer.GetKillJobValues(idx, UseCount, UseMax, bPercentageDisplay);
		
		// Willow bar
		if (OurPlayer.KillJobs[idx].bWillow 
			&& !OurPlayer.ForceOldBossHealthMeter(idx))	// In Classic Game mode we use old one, for nostalgia or something.
		{
			// xPatch: Show HP / MaxHP in Debug Mode
			if (OurPlayer.DebugEnabled())
				Str = "("$UseCount$"/"$UseMax$")";
			
			// Draw percentage bar
			backgroundPosX = CanvasWidth / 2;
			backgroundPosY = (KillPos.Y + HUD_BACKGROUND_Y_OFFSET + KillOffset.Y * idx)*CanvasHeight;			
			BarLength = CanvasWidth / 2.5;
			BarHeight = CanvasHeight / 70.0;
			DrawPercBarDebug(Canvas, backgroundPosX, backgroundPosY, BarLength, BarHeight, 1, RedColor, Float(UseCount)/Float(UseMax), true);
			MyFont.TextColor = WhiteColor;
			MyFont.DrawTextEx(Canvas, CanvasWidth, (backgroundPosX) + (CanvasWidth / 200) - (BarLength / 2), (backgroundPosY) + (BarHeight / 10), OurPlayer.KillJobs[idx].WillowText@Str, 0);
			//MyFont.TextColor = RedColor;
			MyFont.TextColor = MyFont.default.TextColor;	// xPatch: HUD Color Fix
		}
		else
		{		
			// Offset icon based on index count
			backgroundPosX = UltraWideOffsetX + (KillPos.X + HudBackgroundXOffset + KillOffset.X * idx)*CanvasWidth;
			backgroundPosY = (KillPos.Y + HUD_BACKGROUND_Y_OFFSET + KillOffset.Y * idx)*CanvasHeight;

			// Draw background.
			Canvas.Style = ERenderStyle.STY_Masked;
			Canvas.DrawColor = DefaultIconColor;
			Canvas.SetPos(
				backgroundPosX,
				backgroundPosY);
			Canvas.DrawIcon(KillBkgd, Scale);
			
			UseScale = 64.0 / OurPlayer.KillJobs[idx].HUDIcon.VSize;

			// Draw icon of pawn/kill goal
			Canvas.SetPos(
				// If you should shake, add it here.
				(backgroundPosX) + ((KillBkgd.USize*scale) / 4) + (OurPlayer.KillJobs[idx].ShakeKillTime*(FRand() - 0.5)*SHAKE_MOD*CanvasWidth),
				(backgroundPosY) + ((KillBkgd.VSize*scale) / 8) + (OurPlayer.KillJobs[idx].ShakeKillTime*(FRand() - 0.5)*SHAKE_MOD*CanvasHeight));
			Canvas.DrawIcon(OurPlayer.KillJobs[idx].HUDIcon, UseScale*Scale);
			
			if (bPercentageDisplay == 1)
			{
				// draw percentage display
				MyFont.DrawTextEx(Canvas, CanvasWidth,
					(backgroundPosX) + (KillBkgd.USize*scale /1.5) + HUD_NUMBERS_KILL_OFFSET_X,
					(backgroundPosY) + (KillBkgd.VSize*scale /1.5) + HUD_NUMBERS_OFFSET_Y,
					""$Int(100.0 * Float(UseCount) / Float(UseMax))$"%", 2);
			}
			else
			{
				// xPatch: draw just the health amount of the boss (without the Default Max, like it was originally)
				if (OurPlayer.KillJobs[idx].BossPawn != None 
					&& !OurPlayer.DebugEnabled())	// Except for debug mode
					Str = ""$UseCount;
				else
					Str = ""$UseCount$"/"$UseMax;
					
				// draw text showing number and max to reach
				MyFont.DrawTextEx(Canvas, CanvasWidth,
					(backgroundPosX) + (KillBkgd.USize*scale /1.5) + HUD_NUMBERS_KILL_OFFSET_X,
					(backgroundPosY) + (KillBkgd.VSize*scale /1.5) + HUD_NUMBERS_OFFSET_Y,
					Str, 2);

				// okay this is fuckin' silly, why bother with then when I can just add it above
				/*
				MyFont.DrawTextEx(Canvas, CanvasWidth,
					(backgroundPosX) + (KillBkgd.USize*scale /1.1) + HUD_NUMBERS_MAX_KILL_OFFSET_X,
					(backgroundPosY) + (KillBkgd.VSize*scale /1.5) + HUD_NUMBERS_OFFSET_Y,
					"/"$UseMax, 2);
				*/
			}
		}
	}
}
/*
///////////////////////////////////////////////////////////////////////////////
// Draw player info during kill count missions
///////////////////////////////////////////////////////////////////////////////
function DrawKillCount(canvas Canvas, float Scale)
{
	local int UseMax, UseCount;
    local float backgroundPosX, backgroundPosY;

	OurPlayer.GetKillCountVals(UseMax, UseCount);
	// check if newly killed, if so, shake the icon for this time
	if(ShakeKillTime == 0
		&& UseCount > LastKillCount)
	{
		ShakeKillTime = SHAKE_KILL_TIME;
		LastKillCount=UseCount;
	}

	// Draw background
	Canvas.Style = ERenderStyle.STY_Masked;
	Canvas.DrawColor = DefaultIconColor;
	backgroundPosX = UltraWideOffsetX + (KillPos.X + HudBackgroundXOffset)*CanvasWidth;
    backgroundPosY = (KillPos.Y + HUD_BACKGROUND_Y_OFFSET)*CanvasHeight;
	Canvas.SetPos(
		backgroundPosX,
		backgroundPosY);
	Canvas.DrawIcon(KillBkgd, Scale);

	Canvas.SetPos(
		(backgroundPosX) + (KillBkgd.USize*scale) / 4,
		(backgroundPosY) + ((KillBkgd.VSize*scale) / 8) + (ShakeKillTime*(FRand() - 0.5)*SHAKE_MOD*CanvasHeight));
	// Draw icon of pawn you are trying to kill
	Canvas.DrawIcon(KillIcon, Scale);

	// draw text showing number and max to reach
	MyFont.DrawTextEx(Canvas, CanvasWidth,
		(backgroundPosX) + (KillBkgd.USize*scale /1.5) + HUD_NUMBERS_KILL_OFFSET_X,
		(backgroundPosY) + (KillBkgd.VSize*scale /1.5) + HUD_NUMBERS_OFFSET_Y,
		""$UseCount, 2);

	MyFont.DrawTextEx(Canvas, CanvasWidth,
	    (backgroundPosX) + (KillBkgd.USize*scale /1.1) + HUD_NUMBERS_MAX_AMMO_OFFSET_X,
		(backgroundPosY) + (KillBkgd.VSize*scale /1.5) + HUD_NUMBERS_OFFSET_Y,
		"/"$UseMax, 2);
}

///////////////////////////////////////////////////////////////////////////////
// Draw the icon and health of any given boss
///////////////////////////////////////////////////////////////////////////////
function DrawBossHealth(canvas Canvas, float Scale)
{
	local int UseMax, UseCount;
    local float backgroundPosX, backgroundPosY;
	OurPlayer.GetBossVals(UseMax, UseCount);

	if(BossIcon != None)
	{
		// Draw background
		Canvas.Style = ERenderStyle.STY_Masked;
		Canvas.DrawColor = DefaultIconColor;
        backgroundPosX = UltraWideOffsetX + (KillPos.X + HudBackgroundXOffset)*CanvasWidth;
        backgroundPosY = (KillPos.Y + HUD_BACKGROUND_Y_OFFSET)*CanvasHeight;
		Canvas.SetPos(
			backgroundPosX,
			backgroundPosY);
		Canvas.DrawIcon(KillBkgd, Scale);

		Canvas.SetPos(
            (backgroundPosX) + ((KillBkgd.USize*scale) / 1.9) - (BossIcon.USize/2),
		    (backgroundPosY) + ((KillBkgd.VSize*scale) / 3) - (BossIcon.VSize/2));
		// Draw icon of pawn you are trying to kill
		Canvas.DrawIcon(BossIcon, Scale);

		// draw text showing number and max to reach
		MyFont.DrawTextEx(Canvas, CanvasWidth,
			(backgroundPosX) + (KillBkgd.USize*scale /1.5) + HUD_NUMBERS_KILL_OFFSET_X,
		    (backgroundPosY) + (KillBkgd.VSize*scale /1.5) + HUD_NUMBERS_OFFSET_Y,
			""$UseCount, 2);
	}
}
*/
///////////////////////////////////////////////////////////////////////////////
// Draw all the player status stuff and return a flag indicating whether other
// hud elements should be displayed (true means they should be displayed).
//
// ONLY call this if player has already been determined not to be dead!
///////////////////////////////////////////////////////////////////////////////
simulated function bool DrawPlayerStatus(canvas Canvas, optional bool bCriticalInfoOnly)
	{
	local bool bDisplayOtherStuff;
	local P2GameInfo p2g;
	local int viewstate;

	// If we're getting ready to commit suicide, display this helpful hint
	// and don't show any of the other hud stuff
	if(OurPlayer.IsReadyToCommitSuicide())
		DrawSuicideHints(canvas);
	else
		{
		// Make sure there's a pawn
		if(PawnOwner != None
			&& (OurPlayer.ViewTarget != OurPlayer.Pawn || !OurPlayer.bBehindView
			|| OurPlayer.ThirdPersonView))	// xPatch: Allow HUD in 3rd person view.
			{
			p2g = P2GameInfo(Level.Game);

			//if (p2g != None)
			DrawHurtBars(Canvas, Scale);
			DrawSniperBars(Canvas, Scale);

			// Handle drawing the various swirling hud effects
			// usually only from head injury situations.
			if(CatnipActive != 0)	// xPatch: Catnip effects
				DrawSwirl(canvas, catnipeffects);
			if(StartActive != 0)
				DrawSwirl(canvas, startinjuries);
			if(WalkActive != 0)
				DrawSwirl(canvas, walkinjuries);
			if(StopActive != 0)
				DrawSwirl(canvas, stopinjuries);
			// Have the head injury effects override the gary effects
			if(StartActive == 0
				&& WalkActive == 0
				&& StopActive == 0
				&& GaryActive != 0)
				DrawSwirl(canvas, garyeffects);

			if (!bCriticalInfoOnly)
				{
				// If we're focussed on the player, provide his full hud
				if(OurPlayer.ViewTarget == OurPlayer.Pawn)
					{
					viewstate = OurPlayer.HudViewState;

					if (P2GameInfoSingle(Level.Game) != None)
						DrawPlayerWantedStatus(Canvas, Scale);
					if(viewstate > 0)
						DrawHealthAndArmor(Canvas, Scale);
					if (viewstate > 1)
						DrawWeapon(Canvas, Scale);
					if (viewstate > 2)
						DrawInventory(Canvas, Scale);
					if (OurPlayer.KillJobs.Length > 0)
						DrawKillJobs(Canvas, Scale);
					/*
					if(KillIcon != None)
						DrawKillCount(Canvas, Scale);
					else if(BossIcon != None)
						DrawBossHealth(Canvas, Scale);
					*/
					}

				// Put up helpful hints about viewing a rocket as it travels
				// if we're watching the rocket
				if(OurPlayer.IsInState('PlayerWatchRocket'))
					{
					DrawRocketHints(canvas);
					}
				else// Give the radar chance only if we're not driving a rocket
					{
					// Give the radar a chance to draw, it will decide
					// whether or not to draw the full image
					if(OurPlayer.ShowRadarAny())
						DrawRadar(Canvas, Scale);
					}
				}

			// Indicate that other hud stuff should be displayed
			bDisplayOtherStuff = true;
			}
		}

	return bDisplayOtherStuff;
	}

///////////////////////////////////////////////////////////////////////////////
// Draw text indicating who this version was issued to
///////////////////////////////////////////////////////////////////////////////
simulated function DrawIssuedToText(canvas Canvas)
	{
	if (IssuedTo != "")
		{
		MyFont.DrawTextEx(
			Canvas,
			CanvasWidth,
			UltraWideOffsetX + HUD_ISSUED_TEXT_X * CanvasWidth,
			HUD_ISSUED_TEXT_Y * CanvasHeight,
			"Issued to "$IssuedTo,
			0, true, EJ_Right);
		}
	}

///////////////////////////////////////////////////////////////////////////////
// If we're about to commit suicide (we've pressed the suicide key, now the dude
// is just waiting there, ready to kill himself) we should display a hint that
// says to press fire in order to continue.
///////////////////////////////////////////////////////////////////////////////
simulated function DrawSuicideHints(canvas Canvas)
{
	MyFont.DrawTextEx(
		Canvas,
		CanvasWidth,
		UltraWideOffsetX + HUD_SUICIDE_TEXT_X * CanvasWidth,
		HUD_SUICIDE_TEXT_Y1 * CanvasHeight,
		SuicideHintMajor,
		2, false, EJ_Center);
	//if(Level.Game == None
		//|| !Level.Game.bIsSinglePlayer)
	if(false)
		MyFont.DrawTextEx(
			Canvas,
			CanvasWidth,
			UltraWideOffsetX + HUD_SUICIDE_TEXT_X * CanvasWidth,
			HUD_SUICIDE_TEXT_Y3 * CanvasHeight,
			SuicideHintMajorAlt,
			2, false, EJ_Center);
	MyFont.DrawTextEx(
		Canvas,
		CanvasWidth,
		UltraWideOffsetX + HUD_SUICIDE_TEXT_X * CanvasWidth,
		HUD_SUICIDE_TEXT_Y2 * CanvasHeight,
		SuicideHintMinor,
		2, false, EJ_Center);
}

///////////////////////////////////////////////////////////////////////////////
// You died, so tell you how to restart and any hints if you died
// too quickly
///////////////////////////////////////////////////////////////////////////////
simulated function DrawDeadMessage(canvas Canvas)
{
	local float usey;
	local string str1, str2, str3, str4, str5;
	local int usestrcount, i;
	local array<string> strs;

	if(P2GameInfoSingle(Level.Game) != None
		&& Level.IsDemoBuild())
	{
		MyFont.DrawTextEx(
			Canvas,
			CanvasWidth,
			UltraWideOffsetX + HUD_SUICIDE_TEXT_X * CanvasWidth,
			HUD_SUICIDE_TEXT_Y1 * CanvasHeight,
			DeadDemoMessage1,
			2, false, EJ_Center);
		MyFont.DrawTextEx(
			Canvas,
			CanvasWidth,
			UltraWideOffsetX + HUD_SUICIDE_TEXT_X * CanvasWidth,
			HUD_DEAD_TEXT_Y2 * CanvasHeight,
			DeadDemoMessage2,
			2, false, EJ_Center);
	}
	else
	{
		MyFont.DrawTextEx(
			Canvas,
			CanvasWidth,
			UltraWideOffsetX + HUD_SUICIDE_TEXT_X * CanvasWidth,
			HUD_SUICIDE_TEXT_Y1 * CanvasHeight,
			DeadMessage1,
			2, false, EJ_Center);
		MyFont.DrawTextEx(
			Canvas,
			CanvasWidth,
			UltraWideOffsetX + HUD_SUICIDE_TEXT_X * CanvasWidth,
			HUD_DEAD_TEXT_Y2 * CanvasHeight,
			DeadMessage2,
			2, false, EJ_Center);
	}

	// Check to give the player a hint about how to not die so quickly next time.
	if(P2GameInfoSingle(Level.Game) != None
		&& OurPlayer.GetDeathHints(strs))
	{
		//ErikFOV Change: Hud fix
		//canvas.SetPos(UltraWideOffsetX + 0, 0);
		canvas.SetPos(0, 0);
		//end
		canvas.Style = ERenderStyle.STY_Alpha;
		canvas.SetDrawColor(255, 255, 255, BACKTEXT_ALPHA);
		canvas.DrawTile(BlackBox, Canvas.SizeX, Canvas.SizeY*(DEAD_HINT_Y +DEAD_HINT_Y_INC*strs.Length + BOTTOM_FADE_BUFFER),
						0, 0, BlackBox.USize, BlackBox.VSize);

		usey = DEAD_HINT_Y;
		// draw hints
		for(i=0;i<strs.Length;i++)
		{
			//ErikFOV Change: Hud fix
			//MyFont.DrawTextEx(Canvas, UltraWideOffsetX + CanvasWidth, DEAD_HINT_X * CanvasWidth, usey * CanvasHeight, strs[i], 1, false, EJ_Center);
			MyFont.DrawTextEx(Canvas,
			CanvasWidth,
			UltraWideOffsetX + DEAD_HINT_X * CanvasWidth, 
			usey * CanvasHeight,
			strs[i], 
			1, 	false, EJ_Center);
			//end
			usey+= DEAD_HINT_Y_INC;
		}
		/*
		for(i=0;i<usestrcount;i++)
		{
			MyFont.DrawTextEx(Canvas, CanvasWidth, DEAD_HINT_X * CanvasWidth, usey * CanvasHeight,
									str2, 1, false, EJ_Center);
			usey+= DEAD_HINT_Y_INC;
		}
		*/
			/*
		canvas.SetPos(0, 0);
		canvas.Style = GetPlayer().MyHud.ERenderStyle.STY_Alpha;
		canvas.SetDrawColor(255, 255, 255, BACKTEXT_ALPHA);
		canvas.DrawTile(BlackBox, Canvas.SizeX, Canvas.SizeY*(ReminderMsgY + ReminderYInc*5 + BOTTOM_FADE_BUFFER),
						0, 0, BlackBox.USize, BlackBox.VSize);

		usey = ReminderMsgY;
		MyFont.DrawTextEx(Canvas, CanvasWidth, ReminderMsgX * CanvasWidth, usey * CanvasHeight,
								ReminderMessage1, 1, false, EJ_Center);
		usey+= ReminderYInc;
		MyFont.DrawTextEx(Canvas, CanvasWidth, ReminderMsgX * CanvasWidth, usey * CanvasHeight,
								ReminderMessage2, 1, false, EJ_Center);
		usey+= ReminderYInc;
		MyFont.DrawTextEx(Canvas, CanvasWidth, ReminderMsgX * CanvasWidth, usey * CanvasHeight,
								ReminderMessage3, 1, false, EJ_Center);
		usey+= ReminderYInc;
		MyFont.DrawTextEx(Canvas, CanvasWidth, ReminderMsgX * CanvasWidth, usey * CanvasHeight,
								ReminderMessage4, 1, false, EJ_Center);
		usey+= ReminderYInc;
		MyFont.DrawTextEx(Canvas, CanvasWidth, ReminderMsgX * CanvasWidth, usey * CanvasHeight,
								ReminderMessage5, 1, false, EJ_Center);
		MyFont.DrawTextEx(
			Canvas,
			CanvasWidth,
			HUD_SUICIDE_TEXT_X * CanvasWidth,
			HUD_SUICIDE_TEXT_Y2 * CanvasHeight,
			SuicideHintMinor,
			2, false, EJ_Center);
			*/
	}
}

///////////////////////////////////////////////////////////////////////////////
// The view is currently focussed on a flying rocket. Tell the player
// how to stop viewing it and return to normal play.
///////////////////////////////////////////////////////////////////////////////
simulated function DrawRocketHints(canvas Canvas)
{
	local string UseHint;

	MyFont.DrawTextEx(
		Canvas,
		CanvasWidth,
		UltraWideOffsetX + HUD_ROCKET_TEXT_X * CanvasWidth,
		HUD_ROCKET_TEXT_Y1 * CanvasHeight,
		RocketHint1,
		2, true, EJ_Center);
	// Only put up the rocket movement hints when you're watching a rocket
	if(P2Projectile(OurPlayer.ViewTarget) != None)
	{
		if(OurPlayer.RocketHasGas())
			UseHint=RocketHint2;
		else
			UseHint=RocketHint3;

		MyFont.DrawTextEx(
			Canvas,
			CanvasWidth,
			UltraWideOffsetX + HUD_ROCKET_TEXT_X * CanvasWidth,
			HUD_ROCKET_TEXT_Y2 * CanvasHeight,
			UseHint,
			2, true, EJ_Center);
	}
}

///////////////////////////////////////////////////////////////////////////////
// Draw cop radio/wanted section
///////////////////////////////////////////////////////////////////////////////
simulated function DrawPlayerWantedStatus(canvas Canvas, float Scale)
{
	local Texture usetex;
	local float radiopct;
	local float BarH, BarW;
	local String str1, str2;
	local P2Weapon myweap;
    local float backgroundPosX,backgroundPosY;

	if(P2GameInfoSingle(Level.Game).TheGameState != None)
	{

		// Get a number from 0 to 1.0 for how much the cops want the player
		radiopct = P2GameInfoSingle(Level.Game).TheGameState.CopsWantPlayer();

		if(radiopct > 0)
		{
			// Draw background wanted symbol
			Canvas.Style = ERenderStyle.STY_Masked;
			Canvas.DrawColor = DefaultIconColor;
			usetex = Texture(WantedIcon);

		//ErikFOV Change: Nick's HUD fix
			BackgroundPosX = (IconPos[WantedIndex].X*Canvas.ClipX) - (Scale*(usetex.USize / 2));
			BackgroundPosY = (IconPos[WantedIndex].Y*CanvasHeight) - (Scale*(usetex.VSize / 2));
			/*backgroundPosX = UltraWideOffsetX + IconPos[WantedIndex].X*CanvasWidth - Scale*(usetex.USize/2);
            backgroundPosY = IconPos[WantedIndex].Y*CanvasHeight - Scale*(usetex.VSize/2);*/
		//end
			Canvas.SetPos(
				backgroundPosX,
				backgroundPosY);
			Canvas.DrawIcon(usetex, Scale);


			// Draw the bar showing how much he's still wanted
			Canvas.Style = ERenderStyle.STY_Masked;
			usetex = Texture(WantedBar);
			BarH = usetex.VSize;
			BarW = (radiopct*HUD_WANTED_BAR_SCALE_WIDTH*Texture(WantedIcon).USize);

			Canvas.SetPos(
                (backgroundPosX) + ((Texture(WantedIcon).USize*scale) * HUD_WANTED_BAR_OFF_X),
                (backgroundPosY) + ((Texture(WantedIcon).VSize*scale) * HUD_WANTED_BAR_OFF_Y));
			Canvas.DrawTile(usetex,
				Scale*BarW,
				Scale*BarH,
				0, 0, usetex.USize, usetex.VSize);
		}

		myweap = P2Weapon(PawnOwner.Weapon);
		// Hints from cops about dropping your weapon
		if(myweap != None
			&& myweap.GetCopHints(str1, str2))
		{
		//ErikFOV Change: Nick's HUD fix
			if (str1 != "")
				MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
				(IconPos[WantedIndex].Y + WantedTextPos[0].Y) * CanvasHeight, str1, 0, true, EJ_Right);
			if (str2 != "")
				MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
				(IconPos[WantedIndex].Y + WantedTextPos[1].Y) * CanvasHeight, str2, 0, true, EJ_Right);
			/*if (str1 != "")
				MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[WantedIndex].X+WantedTextPos[0].X) * CanvasWidth,
										(IconPos[WantedIndex].Y+WantedTextPos[0].Y) * CanvasHeight, str1, 0, true, EJ_Right);
			if (str2 != "")
				MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[WantedIndex].X+WantedTextPos[1].X) * CanvasWidth,
										(IconPos[WantedIndex].Y+WantedTextPos[1].Y) * CanvasHeight, str2, 0, true, EJ_Right);*/
		//end
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Draw health section
///////////////////////////////////////////////////////////////////////////////
simulated function DrawHealthAndArmor(canvas Canvas, float Scale)
	{
	local Texture usetex;
	local float HeartW, HeartH, backgroundPosX,backgroundPosY;
	local int UseHealth, UseArmor, HealthColor;
	local float UseScale;

	UseHealth = PawnOwner.GetHealthPercent();
	UseArmor = PawnOwner.GetArmorPercent();

	// + 0.010 is what the X needs

	// Draw background
	Canvas.Style = ERenderStyle.STY_Masked;
	Canvas.DrawColor = DefaultIconColor;

	//ErikFOV Change: Nick's HUD fix
		usetex = Texture(SectionBackground[HUD_HEALTH]);
		backgroundPosX = (IconPos[HealthIndex].X*Canvas.ClipX) - (Scale*(usetex.USize / 2));
		backgroundPosY = ((IconPos[HealthIndex].Y + HUD_N_BG_OFFSET_Y)*CanvasHeight) - (Scale*(usetex.VSize / 2));
		/*backgroundPosX = UltraWideOffsetX + (IconPos[HealthIndex].X + (HudBackgroundXOffset))*CanvasWidth;
		backgroundPosY = (IconPos[HealthIndex].Y + HUD_BACKGROUND_Y_OFFSET)*CanvasHeight;*/
	//end

	Canvas.SetPos(
		backgroundPosX,
		backgroundPosY);
	Canvas.DrawIcon(Texture(SectionBackground[HUD_HEALTH]), Scale);

	// Draw the beating heart
	Canvas.Style = ERenderStyle.STY_Masked;
	if(UseHealth > 100)
		HealthColor = 100;
	else
		HealthColor = UseHealth;
	// Make sure the health isn't zero and shouldn't be. If so, make it one.
	if(UseHealth == 0
		&& PawnOwner.Health > 0)
		UseHealth = 1;

	// Make the heart yellow when you're using the catnip, but it still gets redder
	// the more hurt you are.
	if(OurPlayer.CatnipUseTime > 0)
		Canvas.SetDrawColor(155+HealthColor,55+HealthColor*2,0);
	else	// Make it normal-colored, but the more you get hurt, the redder it gets
		Canvas.SetDrawColor(155+HealthColor,55+HealthColor*2,55+HealthColor*2);

	usetex = Texture(HeartIcon);
	UseScale = 64.0 / UseTex.VSize;
	HeartW = usetex.USize + (HeartPumpSizeX*UseScale*usetex.USize - usetex.USize/4);
	HeartH = usetex.VSize + (HeartPumpSizeY*UseScale*usetex.VSize - usetex.VSize/4);
/*
	Canvas.SetPos(
		UltraWideOffsetX + IconPos[HealthIndex].X*CanvasWidth - Scale*(HeartW/2),
		IconPos[HealthIndex].Y*CanvasHeight - Scale*(HeartH/2));
*/
	Canvas.SetPos(
		(backgroundPosX) + ((Texture(SectionBackground[HUD_HEALTH]).USize*scale) / 2) - Scale*(HeartW/2),
		(backgroundPosY) + ((Texture(SectionBackground[HUD_HEALTH]).VSize*scale) / 2.5) - Scale*(HeartH/2));

    Canvas.DrawTile(usetex,
		Scale*HeartW,
		Scale*HeartH,
		0, 0, usetex.USize, usetex.VSize);

	// Draw health in text number form
	/*
	MyFont.DrawTextEx(Canvas, CanvasWidth,
		UltraWideOffsetX + (IconPos[HealthIndex].X + HUD_NUMBERS_OFFSET_X) * CanvasWidth,
		(IconPos[HealthIndex].Y + HUD_NUMBERS_OFFSET_Y) * CanvasHeight,
		""$UseHealth, 2);
    */

		//ErikFOV Change: Nick's HUD fix
			MyFont.DrawTextEx(Canvas, CanvasWidth,
			(backgroundPosX)+((Texture(SectionBackground[HUD_HEALTH]).USize*scale / HUD_N_NUM_ALIGN_X) /*+ HUD_NUMBERS_OFFSET_X*/),
			(backgroundPosY)+((Texture(SectionBackground[HUD_HEALTH]).VSize*scale / 1.5) + HUD_NUMBERS_OFFSET_Y),
			""$UseHealth, 2, , EJ_Right);
			// MyFont.DrawTextEx(Canvas, CanvasWidth,
			//(backgroundPosX) + ((Texture(SectionBackground[HUD_HEALTH]).USize*scale /2.0) /*+ HUD_NUMBERS_OFFSET_X*/),
			//(backgroundPosY) + ((Texture(SectionBackground[HUD_HEALTH]).VSize*scale /1.5) + HUD_NUMBERS_OFFSET_Y),
			//""$UseHealth, 2,,EJ_Center);
		//end

	// Draw armor stuff if it's being used
		if(UseArmor > 0)
			{
			// Draw icon
			Canvas.Style = ERenderStyle.STY_Masked;
			Canvas.DrawColor = DefaultIconColor;

			/*
			Canvas.SetPos(
				UltraWideOffsetX + (IconPos[HealthIndex].X + HUD_ARMOR_ICON_OFFSET_X) * CanvasWidth,
				(IconPos[HealthIndex].Y + HUD_ARMOR_ICON_OFFSET_Y) * CanvasHeight);
            */
            Canvas.SetPos(
				(backgroundPosX) - ((Texture(SectionBackground[HUD_HEALTH]).USize*scale) / 16.0),
		        (backgroundPosY) + ((Texture(SectionBackground[HUD_HEALTH]).VSize*scale) / 2.4));
			UseScale = 64.0 / OurPlayer.HudArmorIcon.VSize;
			Canvas.DrawIcon(OurPlayer.HudArmorIcon, scale * HUD_ARMOR_ICON_SCALE * UseScale);
            /*
			// Draw numbers
			MyFont.DrawTextEx(Canvas, CanvasWidth,
				UltraWideOffsetX + (IconPos[HealthIndex].X + HUD_ARMOR_NUMBERS_OFFSET_X) * CanvasWidth,
				(IconPos[HealthIndex].Y + HUD_ARMOR_NUMBERS_OFFSET_Y) * CanvasHeight,
				""$UseArmor, 1);
			*/
			MyFont.DrawTextEx(Canvas, CanvasWidth,
				(backgroundPosX) - ((Texture(SectionBackground[HUD_HEALTH]).USize*UseScale*scale /16.0 - OurPlayer.HudArmorIcon.USize*UseScale*scale*HUD_ARMOR_ICON_SCALE/2.0) /*+ HUD_ARMOR_NUMBERS_OFFSET_X*/),
		        (backgroundPosY) + ((Texture(SectionBackground[HUD_HEALTH]).VSize*scale /1.4) + HUD_ARMOR_NUMBERS_OFFSET_Y),
				""$UseArmor, 1,,EJ_Center);
			}
	}

///////////////////////////////////////////////////////////////////////////////
// Draw weapon section
///////////////////////////////////////////////////////////////////////////////
simulated function DrawWeapon(canvas Canvas, float Scale)
{
	local Texture usetex;
	local P2Weapon myweap;
	local String str1, str2;
	local float backgroundPosX,backgroundPosY;
	local float UseScale;

	//log(self$" draw weapon, "$PawnOwner.Weapon);
	//if(PawnOwner.Weapon != None)
	//	log(self$" ammo "$P2AmmoInv(PawnOwner.Weapon.AmmoType));
	if(PawnOwner.Weapon != None && P2AmmoInv(PawnOwner.Weapon.AmmoType) != None)
	{
		// Draw background
		Canvas.Style = ERenderStyle.STY_Masked;
		Canvas.DrawColor = DefaultIconColor;

		//ErikFOV Change: Nick's HUD fix
			usetex = Texture(SectionBackground[HUD_AMMO]);
			backgroundPosX = (IconPos[WeapIndex].X*Canvas.ClipX) - (Scale*(usetex.USize / 2));
			backgroundPosY = ((IconPos[WeapIndex].Y + HUD_N_BG_OFFSET_Y)*CanvasHeight) - (Scale*(usetex.VSize / 2));
			/*backgroundPosX = UltraWideOffsetX + (IconPos[WeapIndex].X + HudBackgroundXOffset)*CanvasWidth;
			backgroundPosY = (IconPos[WeapIndex].Y + HUD_BACKGROUND_Y_OFFSET)*CanvasHeight;*/
		//end

		Canvas.SetPos(
			backgroundPosX,
			backgroundPosY);
		Canvas.DrawIcon(Texture(SectionBackground[HUD_AMMO]), Scale);

		// Draw ammo icon
		Canvas.Style = ERenderStyle.STY_Masked;
		Canvas.DrawColor = DefaultIconColor;
		// Use weapon-specific icon if specified.
		if (P2Weapon(PawnOwner.Weapon) != None
			&& P2Weapon(PawnOwner.Weapon).OverrideHUDIcon != None)
			usetex = P2Weapon(PawnOwner.Weapon).OverrideHUDIcon;
		else
			usetex = Texture(PawnOwner.Weapon.AmmoType.Texture);
		if(usetex != None)
		{
			UseScale = 64.0 / UseTex.VSize;
			/*
			Canvas.SetPos(
				UltraWideOffsetX + IconPos[WeapIndex].X*CanvasWidth - Scale*(usetex.USize/2),
				IconPos[WeapIndex].Y*CanvasHeight - Scale*(usetex.VSize/2));
				                (BackgroundPosX) + ((Texture(SectionBackground[HUD_AMMO]).USize*scale) / 1.1),
                (BackgroundPosY) + ((Texture(SectionBackground[HUD_AMMO]).VSize*scale) / 1.5)
			*/
			Canvas.SetPos(
                (BackgroundPosX) + (((Texture(SectionBackground[HUD_AMMO]).USize*scale) / 2) - ((usetex.USize/2)*UseScale*scale)),//((Texture(SectionBackground[HUD_AMMO]).USize*scale) / 1.1),
                (BackgroundPosY) + (((Texture(SectionBackground[HUD_AMMO]).VSize*scale) / 2.5) - ((usetex.VSize/2)*UseScale*scale))
			);
			Canvas.DrawIcon(usetex, UseScale * Scale);

		}

		// Draw ammo count in text number form
		if(P2AmmoInv(PawnOwner.Weapon.AmmoType).bShowAmmoOnHud)
		{
			if (P2AmmoInv(PawnOwner.Weapon.AmmoType).bShowAmmoAsPercent)
				str1 = ""$Int(100.0 * Float(PawnOwner.Weapon.AmmoType.AmmoAmount) / Float(PawnOwner.Weapon.AmmoType.MaxAmmo))$"%";
			// xPatch: Draw ammo & Reload count. 
			else if(P2Weapon(PawnOwner.Weapon) != None && P2Weapon(PawnOwner.Weapon).default.ReloadCount != 0  
					&& !P2Weapon(PawnOwner.Weapon).bHideReloadCount)
		    {
			    str1 = P2Weapon(PawnOwner.Weapon).ReloadCount $ "/" $ (PawnOwner.Weapon.AmmoType.AmmoAmount);
		    }   	
			// End
			else
			{
				str1 = ""$PawnOwner.Weapon.AmmoType.AmmoAmount;
				if (P2AmmoInv(PawnOwner.Weapon.AmmoType).bShowMaxAmmoOnHud)
					str1 = str1 $"/"$PawnOwner.Weapon.AmmoType.MaxAmmo;
			}


			//ErikFOV Change: Nick's HUD fix
				MyFont.DrawTextEx(Canvas, CanvasWidth,
					(backgroundPosX)+((Texture(SectionBackground[HUD_AMMO]).USize*scale / HUD_N_NUM_ALIGN_X) /*+ HUD_NUMBERS_OFFSET_X*/),
					(backgroundPosY)+((Texture(SectionBackground[HUD_AMMO]).VSize*scale / 1.5) + HUD_NUMBERS_OFFSET_Y),
					str1, 2, , EJ_Right);
				//MyFont.DrawTextEx(Canvas, CanvasWidth,
				/*
				UltraWideOffsetX + (IconPos[WeapIndex].X+HUD_NUMBERS_OFFSET_X)*CanvasWidth,
				(IconPos[WeapIndex].Y+HUD_NUMBERS_OFFSET_Y)*CanvasHeight,
				*/
				//   (backgroundPosX) + ((Texture(SectionBackground[HUD_AMMO]).USize*scale /2.0) /*+ HUD_NUMBERS_OFFSET_X*/),
				//    (backgroundPosY) + ((Texture(SectionBackground[HUD_AMMO]).VSize*scale /1.5) + HUD_NUMBERS_OFFSET_Y),
				//	str1, 2,,EJ_Center);
			//end
		}

		myweap = P2Weapon(PawnOwner.Weapon);
		if (myweap != None)
			str1 = myweap.GetFiringMode();
		else
			str1 = "";

		// Draw firing mode anyway


		//ErikFOV Change: Nick's HUD fix
			MyFont.DrawTextEx(Canvas, CanvasWidth,
				(backgroundPosX)+((Texture(SectionBackground[HUD_AMMO]).USize*scale / HUD_N_NUM_ALIGN_X) /*+ HUD_NUMBERS_OFFSET_X*/),
				(backgroundPosY)+((Texture(SectionBackground[HUD_AMMO]).VSize*scale / 2.0) + HUD_NUMBERS_OFFSET_Y),	
				//""$str1, 2, , EJ_Right); 
				""$str1, 1, , EJ_Right);	// xPatch: Smaller FireMode text	
			//MyFont.DrawTextEx(Canvas, CanvasWidth,
			/*
			UltraWideOffsetX + (IconPos[WeapIndex].X+HUD_NUMBERS_OFFSET_X)*CanvasWidth,
			(IconPos[WeapIndex].Y+HUD_NUMBERS_OFFSET_Y)*CanvasHeight,
			*/
			//	(backgroundPosX) + ((Texture(SectionBackground[HUD_AMMO]).USize*scale /2.0) + HUD_NUMBERS_OFFSET_X),
			//	(backgroundPosY) + ((Texture(SectionBackground[HUD_AMMO]).VSize*scale /2.0) + HUD_NUMBERS_OFFSET_Y),
			//	""$str1, 2,,EJ_Center);
		//end

		// Draw text hints
		myweap = P2Weapon(PawnOwner.Weapon);
		if(myweap != None
			&& P2GameInfoSingle(Level.Game) != None
			&& P2GameInfo(Level.Game).AllowInventoryHints())
		{
			// Weapon hints (how to use them)
			if(WeapHintDeathTime > Level.TimeSeconds
				|| WeapHintDeathTime == INFINITE_HINT_TIME)
			{
				//ErikFOV Change: Nick's HUD fix
					usetex = Texture(SectionBackground[HUD_AMMO]);
					if (WeapHint1 != "")
						MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
						(IconPos[WeapIndex].Y + WeapTextPos[0].Y) * CanvasHeight, WeapHint1, 0, true, EJ_Right);
					if (WeapHint2 != "")
						MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
						(IconPos[WeapIndex].Y + WeapTextPos[1].Y) * CanvasHeight, WeapHint2, 0, true, EJ_Right);
					if (WeapHint3 != "")
						MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
						(IconPos[WeapIndex].Y + WeapTextPos[2].Y) * CanvasHeight, WeapHint3, 0, true, EJ_Right);
					/*if (WeapHint1 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[WeapIndex].X+WeapTextPos[0].X) * CanvasWidth,
					(IconPos[WeapIndex].Y+WeapTextPos[0].Y) * CanvasHeight, WeapHint1, 0, true, EJ_Right);
					if (WeapHint2 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[WeapIndex].X+WeapTextPos[1].X) * CanvasWidth,
					(IconPos[WeapIndex].Y+WeapTextPos[1].Y) * CanvasHeight, WeapHint2, 0, true, EJ_Right);
					if (WeapHint3 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[WeapIndex].X+WeapTextPos[2].X) * CanvasWidth,
					(IconPos[WeapIndex].Y+WeapTextPos[2].Y) * CanvasHeight, WeapHint3, 0, true, EJ_Right);*/
				//end
			}
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Draw inventory section
///////////////////////////////////////////////////////////////////////////////
simulated function DrawInventory(canvas Canvas, float Scale)
{
	local Texture usetex;
	local String str;
	local OwnedInv OwnedOne;
	local P2PowerupInv CurrentItem;
	local String str1, str2;
	local float BackgroundPosX, BackgroundPosY, useoff;
	local UseTrigger UseT;
	local float OffsetX, OffsetY, UseScale;

	// Draw background
	Canvas.Style = ERenderStyle.STY_Masked;
	Canvas.DrawColor = DefaultIconColor;

	//ErikFOV Change: Nick's HUD fix
		usetex = Texture(SectionBackground[HUD_INVENTORY]);
		BackgroundPosX = (IconPos[InvIndex].X*Canvas.ClipX) - (Scale*(usetex.USize / 2));
		BackgroundPosY = ((IconPos[InvIndex].Y + HUD_N_BG_OFFSET_Y)*CanvasHeight) - (Scale*(usetex.VSize / 2));
		/*BackgroundPosX = UltraWideOffsetX + (IconPos[InvIndex].X + HudBackgroundXOffset)*CanvasWidth;
		BackgroundPosY = (IconPos[InvIndex].Y + HUD_BACKGROUND_Y_OFFSET)*CanvasHeight;*/
	//end

	Canvas.SetPos(
		BackgroundPosX,
		BackgroundPosY
        );
	Canvas.DrawIcon(Texture(SectionBackground[HUD_INVENTORY]), Scale);
	

	foreach PawnOwner.TouchingActors(class'UseTrigger', UseT)
	{
		if (UseT.bInitiallyActive)
			break;
	}


		// If we're touching a UseTrigger, draw that in place of our item.
		/*foreach PawnOwner.TouchingActors(class'UseTrigger', UseT)
		{
		if (UseT.bInitiallyActive)
		break;
		}	*/
	//end

	CurrentItem = P2PowerupInv(PawnOwner.SelectedItem);
	if(CurrentItem  != None || UseT != None) // fix UseTriggers not showing on an empty inventory
	{
		// Draw inventory icon
		Canvas.Style = ERenderStyle.STY_Masked;
		Canvas.DrawColor = DefaultIconColor;
		// Determine draw scale
		if (UseT != None)
		{
			usetex = UseT.HUDIcon;
			UseScale = 64.0 / UseTex.VSize;
			useoff = -(usetex.USize * UseScale - 64);
		}
		else
		{
			usetex = Texture(CurrentItem.Icon);
			UseScale = 64.0 / UseTex.VSize;
			//useoff = 0;
			useoff = -(usetex.USize * UseScale - 64);
		}
		//UseScale = Scale * UseScale;
		Canvas.SetPos(
		/*
			UltraWideOffsetX + IconPos[InvIndex].X*CanvasWidth - Scale*(usetex.USize/2),
			IconPos[InvIndex].Y*CanvasHeight - Scale*(usetex.VSize/2));
		*/
		(backgroundPosX) + ((Texture(SectionBackground[HUD_INVENTORY]).USize*scale) / 4) + useoff,
		(backgroundPosY) + ((Texture(SectionBackground[HUD_INVENTORY]).VSize*scale) / 8) + CurrentItem.IconOffsetY * usetex.VSize
        );
		Canvas.DrawIcon(usetex, UseScale * Scale);

		// Draw inventory count in text form (only if desired and if more than 1)
		if(UseT == None && CurrentItem.bDisplayAmount && CurrentItem.Amount > 1)
		{
			if(!CurrentItem.bDisplayAsFloat)
				str = ""$(int(CurrentItem.Amount));
			else
				str = ""$CurrentItem.Amount;
			
			/*
				UltraWideOffsetX + (IconPos[InvIndex].X+HUD_NUMBERS_OFFSET_X)*CanvasWidth,
				(IconPos[InvIndex].Y+HUD_NUMBERS_OFFSET_Y)*CanvasHeight,
			*/
			//ErikFOV Change: Nick's HUD fix
				MyFont.DrawTextEx(Canvas, CanvasWidth,
				(backgroundPosX)+((Texture(SectionBackground[HUD_INVENTORY]).USize*scale / HUD_N_NUM_ALIGN_X)),
				(backgroundPosY)+((Texture(SectionBackground[HUD_INVENTORY]).VSize*scale / 1.5) + HUD_NUMBERS_OFFSET_Y),
				str, 2,, EJ_Right);
			//	MyFont.DrawTextEx(Canvas, CanvasWidth,
				 //   (backgroundPosX) + ((Texture(SectionBackground[HUD_INVENTORY]).USize*scale /2.0) /*+ HUD_NUMBERS_OFFSET_X*/),
				//    (backgroundPosY) + ((Texture(SectionBackground[HUD_INVENTORY]).VSize*scale /1.5) + HUD_NUMBERS_OFFSET_Y),
				//	str, 2,,EJ_Center);
			//end
		}
		
		// Draw hints for activating world objects
		if (UseT != None)
		{
			if (UseT.Message != "")
			//ErikFOV Change: Nick's HUD fix
				MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
					(IconPos[InvIndex].Y + InvTextPos[0].Y) * CanvasHeight, UseT.Message, 0, true, EJ_Right);
				//MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[InvIndex].X+InvTextPos[0].X)* CanvasWidth,
						//				(IconPos[InvIndex].Y+InvTextPos[0].Y) * CanvasHeight, UseT.Message, 0, true, EJ_Right);
			//end
		}
		// Always draw cop bribery hints, as this is a new game mechanic and players will miss it if they have hints turned off.
		else if (OurPlayer.GetBriberyHints(str1, str2)
			|| OurPlayer.GetSellItemHints(str1, str2)) {
		//ErikFOV Change: Nick's HUD fix
			usetex = Texture(SectionBackground[HUD_INVENTORY]);
			if (str1 != "")
				MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
				(IconPos[InvIndex].Y + InvTextPos[0].Y) * CanvasHeight, str1, 0, true, EJ_Right);
			if (str2 != "")
				MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
				(IconPos[InvIndex].Y + InvTextPos[1].Y) * CanvasHeight, str2, 0, true, EJ_Right);
			/*if (str1 != "")
				MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[InvIndex].X+InvTextPos[0].X)* CanvasWidth,
										(IconPos[InvIndex].Y+InvTextPos[0].Y) * CanvasHeight, str1, 0, true, EJ_Right);
			if (str2 != "")
				MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[InvIndex].X+InvTextPos[1].X) * CanvasWidth,
										(IconPos[InvIndex].Y+InvTextPos[1].Y) * CanvasHeight, str2, 0, true, EJ_Right);*/
		//end
		}
		// Suppress inventory hints if bribing available
		else if(P2GameInfoSingle(Level.Game) != None
			&& P2GameInfo(Level.Game).AllowInventoryHints())
		{
			// If you're getting mugged, give hints on what to do--override cop hints
			if(OurPlayer.GetMuggerHints(str1, str2))
			{
			//ErikFOV Change: Nick's HUD fix
				usetex = Texture(SectionBackground[HUD_INVENTORY]);
				if (str1 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
					(IconPos[InvIndex].Y + InvTextPos[0].Y) * CanvasHeight, str1, 0, true, EJ_Right);
				if (str2 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
					(IconPos[InvIndex].Y + InvTextPos[1].Y) * CanvasHeight, str2, 0, true, EJ_Right);
				/*if (str1 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[InvIndex].X+InvTextPos[0].X)* CanvasWidth,
											(IconPos[InvIndex].Y+InvTextPos[0].Y) * CanvasHeight, str1, 0, true, EJ_Right);
				if (str2 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[InvIndex].X+InvTextPos[1].X) * CanvasWidth,
											(IconPos[InvIndex].Y+InvTextPos[1].Y) * CanvasHeight, str2, 0, true, EJ_Right);*/
			//end
			}
			// Draw text hints if we allow them and if the timer for them
			// is still good (or if we need to draw them forever)
			else if(InvHintDeathTime > Level.TimeSeconds
					|| InvHintDeathTime == INFINITE_HINT_TIME)
				{
				//CurrentItem.GetHints(PawnOwner, InvHint1, str2, str3);

			//ErikFOV Change: Nick's HUD fix
				usetex = Texture(SectionBackground[HUD_INVENTORY]);
				if (InvHint1 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
					(IconPos[InvIndex].Y + InvTextPos[0].Y) * CanvasHeight, InvHint1, 0, true, EJ_Right);
				if (InvHint2 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
					(IconPos[InvIndex].Y + InvTextPos[1].Y) * CanvasHeight, InvHint2, 0, true, EJ_Right);
				if (InvHint3 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, backgroundPosX + (Scale*(usetex.USize / HUD_N_HINT_ALIGN_X)),
					(IconPos[InvIndex].Y + InvTextPos[2].Y) * CanvasHeight, InvHint3, 0, true, EJ_Right);

				/*if (InvHint1 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[InvIndex].X+InvTextPos[0].X)* CanvasWidth,
										(IconPos[InvIndex].Y+InvTextPos[0].Y) * CanvasHeight, InvHint1, 0, true, EJ_Right);
				if (InvHint2 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[InvIndex].X+InvTextPos[1].X) * CanvasWidth,
										(IconPos[InvIndex].Y+InvTextPos[1].Y) * CanvasHeight, InvHint2, 0, true, EJ_Right);
				if (InvHint3 != "")
					MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (IconPos[InvIndex].X+InvTextPos[2].X) * CanvasWidth,
										(IconPos[InvIndex].Y+InvTextPos[2].Y) * CanvasHeight, InvHint3, 0, true, EJ_Right);*/
			//end
			}
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function CalcRadarDists(bool bIsMP,
								  out vector dir,
								  out float dist)
{
	dir.z=0;
	dist = VSize(dir);
	if(bIsMP)
		dist = dist*MP_RADAR_SCALE;
	else
		dist = dist*OurPlayer.RadarScale;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function RadarFindFishLoc(float dist,
									   float Scale,
									   float pheight,
									   bool bIsMP,
									    out vector dir,
									    out float fishx, out float fishy,
										out float iconsize)
{
	local float ang;

	// Scale heights only if your in MP games
	if(bIsMP)
	{
		if(pheight > 0)
		{
			if(pheight > OurPlayer.RadarMaxZ)
				iconsize = OurPlayer.RadarMaxZ;
			else
				iconsize = pheight;
		}
		else
		{
			if(pheight < -OurPlayer.RadarMaxZ)
				iconsize = -OurPlayer.RadarMaxZ;
			else
				iconsize = pheight;
		}
		iconsize/=2;
		iconsize = (Scale + Scale*(iconsize/OurPlayer.RadarMaxZ));
	}
	else // SP does no scaling like this
		iconsize = Scale;

	dir = Normal(dir);
	if(dir.y != 0)
		ang = atan(dir.x/dir.y);
	if(dir.y < 0)
		ang+=Pi;
	//log(PawnOwner$" dir "$dir$" angle "$ang$" acos "$acos(1.0/dir.x));
	ang = (PawnOwner.Rotation.Yaw*0.0000959) + ang;
	if(ang > 2*Pi)
		ang-=2*Pi;

	fishx = dist*Scale*(cos(ang)) - iconsize*(RadarPlayer.USize/2);
	//ErikFOV Change: Radar flattening bug Fix
	//fishy = -(AspectRatio*dist*Scale*(sin(ang))) - iconsize*(RadarPlayer.VSize/2);
	fishy = -(dist*Scale*(sin(ang))) - iconsize*(RadarPlayer.VSize/2);
	//end
}


///////////////////////////////////////////////////////////////////////////////
// Draw flags for ctf game
///////////////////////////////////////////////////////////////////////////////
simulated function DrawRadarFlags(canvas Canvas, float radarx, float radary)
{
//	STUB
}

///////////////////////////////////////////////////////////////////////////////
// Draw bags for gb game
///////////////////////////////////////////////////////////////////////////////
simulated function DrawRadarBags(canvas Canvas, float radarx, float radary)
{
//	STUB
}

///////////////////////////////////////////////////////////////////////////////
// Draw radar showing other people around you
///////////////////////////////////////////////////////////////////////////////
simulated function DrawRadar(canvas Canvas, float Scale)
{
	local float UseSize, dist, radarx, radary, targetx, targety, RadarTimer;
	local float pheight, iconsize, glowalpha, sy, fishx, fishy;
	local P2Pawn radarp;
	local AnimalPawn radarap;
	local vector radarf;
	local int i;
	local bool bShowMouseHint, bIsMP;
	local vector dir;
	local GameReplicationInfo gri;
	local float UseScale;
	local Texture usetex;

	if(OurPlayer.RadarTargetStats())
	{
		// Dim the background
		Canvas.SetPos(0, 0);
		Canvas.Style = ERenderStyle.STY_Alpha;
		Canvas.SetDrawColor(255, 255, 255, BACKGROUND_TARGET_ALPHA);
		Canvas.DrawTile(BlackBox, Canvas.SizeX, Canvas.SizeY, 0, 0, BlackBox.USize, BlackBox.VSize);
		// Draw stats
		sy = RADAR_TARGET_STATS;
		if(OurPlayer.RadarTargetKills > 0)
			MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarStatsHint1, 2, false, EJ_Center);
		else
			MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarStatsHint0, 2, false, EJ_Center);
		sy+=0.05;
		MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarStatsHint2$OurPlayer.RadarTargetKills, 2, false, EJ_Center);
		if(TargetPrizes.Length > 0)
		{
			sy=0.7;
			// List prizes
			MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarStatsHint3, 2, false, EJ_Center);
		}
		// Draw hint to continue on
		if(OurPlayer.RadarTargetStatsGetInput())
		{
			sy=0.9;
			MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarStatsHint4, 1, false, EJ_Center);
		}
		// draw targetter
		Canvas.DrawColor = RedColor;
		targetx = 0.5; targety = 0.6;
		Canvas.SetPos(UltraWideOffsetX + targetx*CanvasWidth - Scale*(RadarPlayer.USize/2),
						targety*CanvasHeight - Scale*(RadarPlayer.VSize/2));
		Canvas.Style = ERenderStyle.STY_Masked;
		Canvas.DrawIcon(RadarTarget[OurPlayer.GetRadarTargetFrame()], Scale);
		// draw prizes
		targetx = 0.2; targety = 0.8;
		Canvas.DrawColor = WhiteColor;
		for(i=0; i<TargetPrizes.Length; i++)
		{
			Canvas.SetPos(UltraWideOffsetX + targetx*CanvasWidth - Scale*(RadarPlayer.USize/2),
							targety*CanvasHeight - Scale*(RadarPlayer.VSize/2));
							
			// xPatch: Prize Icons Fix
			//Canvas.DrawIcon(Texture(TargetPrizes[i]), Scale);	
			usetex = Texture(TargetPrizes[i]);
			UseScale = 64.0 / usetex.VSize;
			Canvas.DrawIcon(usetex, UseScale * Scale);
			// End
			targetx+=0.1;
		}
	}
	else if(OurPlayer.RadarTargetKilling())
	{
		sy = RADAR_TARGET_KILL_HINTS;
		switch(OurPlayer.RadarTargetKillHint())
		{
			case 0:
				MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarKillHint0, 2, false, EJ_Center);
				bShowMouseHint=true;
				break;
			case 1:
			case 2:	// hold on to this hint a little.
				MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarKillHint1, 2, false, EJ_Center);
				bShowMouseHint=true;
				break;
			case 3:
				MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarKillHint2, 2, false, EJ_Center);
				bShowMouseHint=true;
				break;
			case 4:
				MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarDeadHint, 2, false, EJ_Center);
				break;
		}
		sy = RADAR_TARGET_MOUSE_HINT;
		MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarMouseHint, 1, false, EJ_Center);
		// draw targetter as person dies
		Canvas.DrawColor = RedColor;
		Canvas.SetPos(UltraWideOffsetX + OurPlayer.RadarTargetX*CanvasWidth - Scale*(RadarPlayer.USize/2),
						OurPlayer.RadarTargetY*CanvasHeight - Scale*(RadarPlayer.VSize/2));
		Canvas.Style = ERenderStyle.STY_Masked;
		Canvas.DrawIcon(RadarTarget[OurPlayer.GetRadarTargetFrame()], Scale);
	}
	else
	{
		// When in targetting mode
		if(OurPlayer.RadarTargetReady())
		{
			// xPatch: Hide Weapon Selector
			P2Player(PlayerOwner).HideWeaponSelector();
			
			// Dim the background
			Canvas.SetPos(0, 0);
			Canvas.Style = ERenderStyle.STY_Alpha;
			Canvas.SetDrawColor(255, 255, 255, BACKGROUND_TARGET_ALPHA);
			Canvas.DrawTile(BlackBox, Canvas.SizeX, Canvas.SizeY, 0, 0, BlackBox.USize, BlackBox.VSize);
			// Put up some hints
			sy = RADAR_TARGET_HINTS;
			// Title
			if(OurPlayer.RadarTargetNotStartedYet())
				MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarHint0, 2, false, EJ_Center);
			else
				MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarHint6, 2, false, EJ_Center);
			sy+=0.05;
			// If we're still waiting, tell them how to start
			if(OurPlayer.RadarTargetWaiting())
				MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarHint1, 2, false, EJ_Center);
			sy+=0.1;
			// Timer
			RadarTimer = OurPlayer.GetRadarTargetTimer();
			MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarHint2$RadarTimer, 2, false, EJ_Center);
			sy+=0.05;
			// Gameplay hints
			MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarHint3, 1, false, EJ_Center);
			sy+=0.05;
			MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarHint4, 1, false, EJ_Center);
			sy+=0.05;
			MyFont.DrawTextEx(Canvas, CanvasWidth, UltraWideOffsetX + (0.5 * CanvasWidth), sy * CanvasHeight, RadarHint5, 1, false, EJ_Center);
			targetx = (OurPlayer.RadarTargetX)*CanvasWidth;
			targety = (OurPlayer.RadarTargetY)*CanvasHeight;
		}

		Canvas.Style = ERenderStyle.STY_Normal;
		Canvas.DrawColor = DefaultIconColor;
		UseSize = OurPlayer.RadarSize*Scale;
		// Draw main background image for radar (this part slides into place)
		//ErikFOV Change: Hud Fix
		/*
		Canvas.SetPos(UltraWideOffsetX + HUD_RADAR_X*CanvasWidth - (UseSize*RADAR_IMAGE_SCALE/2),
						OurPlayer.RadarBackY*CanvasHeight - (UseSize*RADAR_IMAGE_SCALE/2));*/
		Canvas.SetPos(Canvas.ClipX - (UseSize*RADAR_IMAGE_SCALE),
						OurPlayer.RadarBackY*CanvasHeight - (UseSize*RADAR_IMAGE_SCALE/2));
		//end						
		Canvas.DrawTile(RadarBackground,
						UseSize*RADAR_IMAGE_SCALE,
						UseSize*RADAR_IMAGE_SCALE,
						0, 0, RadarBackground.USize, RadarBackground.VSize);

		if(Level.Game == None
			|| !Level.Game.bIsSinglePlayer)
			bIsMP=true;

		// See if you should show anything more than just the background
		if(!OurPlayer.ShowRadarBackOnly())
		{
			// Only draw the icons if the radar is completely On.
			if(OurPlayer.ShowRadarFull())
			{
				//ErikFOV Change: Hud Fix
				//radarx=HUD_RADAR_X*CanvasWidth;// - UseSize/2 - Scale*(RadarPlayer.USize/8);
				//radary=HUD_RADAR_Y*CanvasHeight;// - UseSize/2 - Scale*(RadarPlayer.VSize/8);
				radarx=Canvas.ClipX - (UseSize*RADAR_IMAGE_SCALE/2);
				radary=Canvas.ClipY - (UseSize*RADAR_IMAGE_SCALE/2);
				//end


				// Draw all the pawns within radar
				for(i = 0; i<OurPlayer.RadarPawns.Length; i++)
				{
					// convert 3d world coords to around the player in the radar coords
					radarp = OurPlayer.RadarPawns[i];
					if(radarp != None)
					{
						dir = radarp.Location - PawnOwner.Location;
						pheight = dir.z;

						// If you're within the immediate height of the dude, be drawn
						// (or if it's MP, always show others)
						if(abs(pheight) < OurPlayer.RadarMaxZ
							|| OurPlayer.RadarInDoors==0
							|| bIsMP)
						{
							CalcRadarDists(bIsMP, dir, dist);

							// If you're within the appropriate radius from the player, be drawn
							if((bIsMP
									&& dist < MP_RADAR_RADIUS)
								|| dist < OurPlayer.RadarShowRadius)
							{

								RadarFindFishLoc(dist, Scale, pheight, bIsMP, dir, fishx, fishy, iconsize);
								//ErikFOV Change: Hud Fix
								//Canvas.SetPos(UltraWideOffsetX + radarx + fishx, radary + fishy);
								Canvas.SetPos(radarx + fishx, radary + fishy - Scale*(RadarNPC.VSize));
								//end

								// Special colors based on fish attitude
								if(PersonController(radarp.Controller) != None)
								{
									// Violent attackers (or distracted attackers) show up red
									if((PersonController(radarp.Controller).Attacker == PawnOwner
										|| PersonController(radarp.Controller).PlayerAttackedMe == PawnOwner)
										&& radarp.bHasViolentWeapon)
										Canvas.DrawColor = RedColor;
									// Everyone else--scared of dude, or just interested, show up yellow
									else if(PersonController(radarp.Controller).InterestPawn == PawnOwner)
										Canvas.DrawColor = YellowColor;
									// Neutrals show up white (or people interested in other people)
									else
										Canvas.DrawColor = WhiteColor;
								}
								else // default is a white fish
									Canvas.DrawColor = WhiteColor;

								// Draw the fish
								Canvas.DrawIcon(RadarNPC, iconsize);

								Canvas.Style = ERenderStyle.STY_Alpha;
								Canvas.DrawColor = WhiteColor;
								// Draw in a cop hat, if the player has that plug-in and this is
								// an Authority figure.
								if(radarp.bAuthorityFigure)
								{
									if(OurPlayer.bRadarShowCops)
									{
										//ErikFOV Change: Hud Fix
										/*Canvas.SetPos(UltraWideOffsetX + radarx + fishx + COP_OFFSET_X*CanvasWidth,
															radary + fishy + COP_OFFSET_Y*CanvasHeight);*/
										Canvas.SetPos(radarx + fishx + COP_OFFSET_X*CanvasWidth,
										radary + fishy + COP_OFFSET_Y*CanvasHeight - Scale*(RadarCopHat.VSize));
										//end
										
										Canvas.DrawIcon(RadarCopHat, iconsize);
									}
								}
								// Draw a little gun over the fish, if the player has the
								// plug-in to detect hidden weapons
								// Don't draw cops with guns also
								else if(OurPlayer.bRadarShowGuns
									&& radarp.bHasViolentWeapon)
								{
									//ErikFOV Change: Hud Fix
									/*Canvas.SetPos(UltraWideOffsetX + radarx + fishx + GUN_OFFSET_X*CanvasWidth,
												radary + fishy + GUN_OFFSET_Y*CanvasHeight);*/
									Canvas.SetPos(radarx + fishx + GUN_OFFSET_X*CanvasWidth,
									radary + fishy + GUN_OFFSET_Y*CanvasHeight - Scale*(RadarGun.VSize));
									//end
									Canvas.DrawIcon(RadarGun, iconsize);
								}
								Canvas.Style = ERenderStyle.STY_Normal;

								if(OurPlayer.RadarTargetIsOn()
									&& radarp.Health > 0
									&& !radarp.bNoRadarTarget)
								{
									// Targetting is going, so kill people, when it hits them
									if(abs(targetx - fishx) < (TARGET_KILL_RADIUS/AspectRatio)
										&& abs(targety - fishy) < TARGET_KILL_RADIUS)
									{
										OurPlayer.TargetKillsPawn(radarp);
										// If you're killing someone, don't let this go any further
										return;
									}
								}
							}
						}
					}
				}

				// Draw AWCowPawns as well, little shits are hard to find
				/* Stubbed until we can get a non-copyvio cow icon	
				for(i=0;i<RadarAnimalPawns.length;i++) {
					radarap = RadarAnimalPawns[i];

                    if(radarap != none && radarap.Health > 0.0f) {
						dir = radarap.Location - PawnOwner.Location;
						pheight = dir.z;

						// If you're within the immediate height of the dude, be drawn
						// (or if it's MP, always show others)
						if(abs(pheight) < OurPlayer.RadarMaxZ ||
                           OurPlayer.RadarInDoors == 0 || bIsMP) {
							CalcRadarDists(bIsMP, dir, dist);

							// If you're within the appropriate radius from the player, be drawn
							if((bIsMP && dist < MP_RADAR_RADIUS) ||
                                dist < OurPlayer.RadarShowRadius) {

								RadarFindFishLoc(dist, Scale, pheight, bIsMP, dir, fishx, fishy, iconsize);
								Canvas.SetPos(UltraWideOffsetX + radarx + fishx, radary + fishy);
								Canvas.DrawColor = WhiteColor;

								// Draw the fish
								Canvas.DrawIcon(RadarCow, iconsize);
								Canvas.Style = ERenderStyle.STY_Alpha;
								Canvas.DrawColor = WhiteColor;
								Canvas.Style = ERenderStyle.STY_Normal;
							}
						}
					}
					else {
					    RadarAnimalPawns.Remove(i, 1);
					}
				}*/
				// xPatch: Fixed drawing AWCowPawns 
				for(i=0;i<RadarAnimalPawns.length;i++) 
				{
					radarap = RadarAnimalPawns[i];
					if(radarap != None && radarap.Health > 0.0f)
					{
						dir = radarap.Location - PawnOwner.Location;
						pheight = dir.z;

						// If you're within the immediate height of the dude, be drawn
						// (or if it's MP, always show others)
						if(abs(pheight) < OurPlayer.RadarMaxZ
							|| OurPlayer.RadarInDoors==0
							|| bIsMP)
						{
							CalcRadarDists(bIsMP, dir, dist);

							// If you're within the appropriate radius from the player, be drawn
							if((bIsMP && dist < MP_RADAR_RADIUS)
								|| dist < OurPlayer.RadarShowRadius)
							{

								RadarFindFishLoc(dist, Scale, pheight, bIsMP, dir, fishx, fishy, iconsize);
								Canvas.SetPos(radarx + fishx, radary + fishy - Scale*(RadarNPC.VSize));
								Canvas.DrawColor = WhiteColor;

								// Draw the fish
								Canvas.DrawIcon(RadarNPC, iconsize);
								Canvas.Style = ERenderStyle.STY_Normal;
							}
						}
					}
					else 
					    RadarAnimalPawns.Remove(i, 1);
				}

				DrawRadarFlags(Canvas, radarx, radary);

				DrawRadarBags(Canvas, radarx, radary);

				// Draw in targetter
				if(OurPlayer.RadarTargetReady())
				{
					Canvas.DrawColor = RedColor;
					//ErikFOV Change: Hud Fix
					//targetx = (OurPlayer.RadarTargetX) + HUD_RADAR_X;
					//targety = (OurPlayer.RadarTargetY) + HUD_RADAR_Y;
					/*Canvas.SetPos(UltraWideOffsetX + targetx*CanvasWidth - Scale*(RadarPlayer.USize/2),
									targety*CanvasHeight - Scale*(RadarPlayer.VSize/2));*/		
									
					targetx = Scale*(OurPlayer.RadarTargetX * 900);
					targety = Scale*(OurPlayer.RadarTargetY * 900);

					Canvas.SetPos(
					Canvas.ClipX - (Scale*RadarPlayer.USize) - (UseSize*RADAR_IMAGE_SCALE/2) + targetx,
					Canvas.ClipY - (Scale*RadarPlayer.VSize) - (UseSize*RADAR_IMAGE_SCALE/2) + targety);
					//end

					Canvas.Style = ERenderStyle.STY_Masked;

					Canvas.DrawIcon(RadarTarget[OurPlayer.GetRadarTargetFrame()], Scale);
				}
				else
				{
					// Reset color
					Canvas.DrawColor = WhiteColor;
					// Draw center (player boat image)
					//ErikFOV Change: Hud Fix
					/*Canvas.SetPos(UltraWideOffsetX + HUD_RADAR_X*CanvasWidth - Scale*(RadarPlayer.USize/2),// - UseSize/2 - (Texture(HeartIcon).USize*(Scale/8)),
									HUD_RADAR_Y*CanvasHeight - Scale*(RadarPlayer.VSize/2));// - UseSize/2 - (Texture(HeartIcon).VSize*(Scale/8)));*/
					Canvas.SetPos(Canvas.ClipX - (Scale*RadarPlayer.USize/2) - (UseSize*RADAR_IMAGE_SCALE/2),
					HUD_RADAR_Y*CanvasHeight - Scale*(RadarPlayer.VSize/2));
					//end

					Canvas.Style = ERenderStyle.STY_Normal;//ERenderStyle.STY_Translucent;

					Canvas.DrawIcon(RadarPlayer, Scale);
				}
			} // show icons

			Canvas.Style = ERenderStyle.STY_Translucent;
			// Make the glow flicker if it's not fully on yet.
			if(OurPlayer.ShowRadarFlicker())
				glowalpha = RADAR_WARMUP_BASE - Rand(RADAR_WARMUP_RAND);
			else
				glowalpha = RADAR_NORMAL_BASE - Rand(RADAR_NORMAL_RAND) + OurPlayer.PulseGlow;
			Canvas.SetDrawColor(glowalpha, glowalpha, glowalpha);
			//ErikFOV Change: Hud Fix
			/*
			Canvas.SetPos(UltraWideOffsetX + HUD_RADAR_X*CanvasWidth - (UseSize*RADAR_IMAGE_SCALE/2),
							(HUD_RADAR_Y)*CanvasHeight - (UseSize*RADAR_IMAGE_SCALE/2));*/
			Canvas.SetPos(Canvas.ClipX - (UseSize*RADAR_IMAGE_SCALE),
							(HUD_RADAR_Y)*CanvasHeight - (UseSize*RADAR_IMAGE_SCALE/2));
			//end			
			
			Canvas.DrawTile(RadarGlow,
							UseSize*RADAR_IMAGE_SCALE,
							UseSize*RADAR_IMAGE_SCALE,
							0, 0, RadarGlow.USize, RadarGlow.VSize);
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Draw the hurt bars around the edges to show direction of the attacker.
///////////////////////////////////////////////////////////////////////////////
simulated function DrawHurtBars(canvas Canvas, float Scale)
{
	local int i;
	local float HealthRatio;
	local float xpos, ypos, useh, usew, fadeamount;
	local Texture usetex;

	HealthRatio = (1.0 - PawnOwner.Health/PawnOwner.HealthMax);
	if(HealthRatio < 0.0)
		HealthRatio = 0.0;
	else
		HealthRatio = HURT_BAR_HEALTH_MOD*HealthRatio;
	// Handle fading 'hurt bars' around your view
	for(i=0; i<ArrayCount(OurPlayer.HurtBarTime); i++)
	{
		if(OurPlayer.HurtBarTime[i] > 0)
		{
			Canvas.Style = ERenderStyle.STY_Translucent;

			fadeamount = (OurPlayer.HurtBarTime[i])*OurPlayer.HurtBarAlpha;

			Canvas.SetDrawColor(fadeamount,0,0); // shows bars in red
			switch(i)
			{
				case 0:	// top
					usetex = Texture(TopHurtBar);

					usew = usetex.USize*HURT_TOP_Y_INC;
					useh = usetex.VSize*(HURT_TOP_X_INC + HealthRatio);
					xpos = 0.5;
					ypos = 0.0;
				break;
				case 1:	// right
					usetex = Texture(SideHurtBar);

					usew = usetex.USize*(HURT_SIDE_X_INC + HealthRatio);
					useh = usetex.VSize*HURT_SIDE_Y_INC;
					xpos = 1.0;
					ypos = 0.5;
				break;
				case 2:	// down
					usetex = Texture(TopHurtBar);

					usew = usetex.USize*HURT_TOP_Y_INC;
					useh = usetex.VSize*(HURT_TOP_X_INC + HealthRatio);
					xpos = 0.5;
					ypos = 1.0;
				break;
				case 3:	// left
					usetex = Texture(SideHurtBar);

					usew = usetex.USize*(HURT_SIDE_X_INC + HealthRatio);
					useh = usetex.VSize*HURT_SIDE_Y_INC;
					xpos = 0.0;
					ypos = 0.5;
				break;
				case 4:	// SKULL
					fadeamount = (OurPlayer.HurtBarTime[i])*SKULL_ALPHA;
					// less alphaed, but red like hurt bars
					Canvas.SetDrawColor(fadeamount/2,0,0);
						//fadeamount/2,fadeamount/2);
					usetex = Texture(SkullHurtBar);

					usew = usetex.USize*(HealthRatio)*SKULL_SIZE_RATIO;
					useh = usetex.VSize*(HealthRatio)*SKULL_SIZE_RATIO;
					xpos = 0.5;
					ypos = 0.5;
				break;
				case 5: // Lipstick
					fadeamount = (OurPlayer.HurtBarTime[i])*LIPSTICK_ALPHA;
					if (fadeamount < 1)
						fadeamount = 1;
					Canvas.SetDrawColor(255,255,255,fadeamount);
					Canvas.Style=ERenderStyle.STY_Alpha;
					usetex = Texture(LipstickDecal);

					usew = usetex.USize*LIPSTICK_SIZE_RATIO;
					useh = usetex.VSize*LIPSTICK_SIZE_RATIO;
					xpos = 0.5;
					ypos = 0.5;
				break;
			}
			Canvas.SetPos(
				UltraWideOffsetX + xpos*CanvasWidth - Scale*(usew/2),
				ypos*CanvasHeight - Scale*(useh/2));
			Canvas.DrawTile(usetex,
				Scale*usew,
				Scale*useh,
				0, 0, usetex.USize, usetex.VSize);
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Draw the sniper bars around the edges to show direction of the guy
// who has you in his sights (with his sniper rifle)
///////////////////////////////////////////////////////////////////////////////
simulated function DrawSniperBars(canvas Canvas, float Scale)
{
	local int i;
	local float xpos, ypos, useh, usew, fadeamount;
	local Texture usetex;

	// Figure out the direction of the sniper aiming at me
	if(!OurPlayer.bSniperBarsClear
		&& PawnOwner != None)
	{
		// Handle fading 'sniper bars' around your view
		for(i=0; i<ArrayCount(OurPlayer.SniperBarTime); i++)
		{
			if(OurPlayer.SniperBarTime[i] > 0)
			{
				Canvas.Style = ERenderStyle.STY_Alpha;

				fadeamount = ((OurPlayer.SniperBarTime[i]/SNIPER_BAR_MAX_TIME)*SNIPER_BAR_ALPHA);
				if(int(fadeamount) > 0)
				{
					// Alpha the bars in, in order to draw them in black
					Canvas.SetDrawColor(255, 255, 255, fadeamount);
					switch(i)
					{
						case 0:	// top
							usetex = Texture(TopSniperBar);

							usew = usetex.USize*SNIPER_TOP_Y_INC;
							useh = usetex.VSize*(SNIPER_TOP_X_INC + SNIPER_BAR_INCREASE_TOP);
							xpos = 0.5;
							ypos = 0.0;
						break;
						case 1:	// right
							usetex = Texture(SideSniperBar);

							usew = usetex.USize*(SNIPER_SIDE_X_INC + SNIPER_BAR_INCREASE_SIDE);
							useh = usetex.VSize*SNIPER_SIDE_Y_INC;
							xpos = 1.0;
							ypos = 0.5;
						break;
						case 2:	// down
							usetex = Texture(TopSniperBar);

							usew = usetex.USize*SNIPER_TOP_Y_INC;
							useh = usetex.VSize*(SNIPER_TOP_X_INC + SNIPER_BAR_INCREASE_TOP);
							xpos = 0.5;
							ypos = 1.0;
						break;
						case 3:	// left
							usetex = Texture(SideSniperBar);

							usew = usetex.USize*(SNIPER_SIDE_X_INC + SNIPER_BAR_INCREASE_SIDE);
							useh = usetex.VSize*SNIPER_SIDE_Y_INC;
							xpos = 0.0;
							ypos = 0.5;
						break;
					}
					Canvas.SetPos(
						xpos*CanvasWidth - Scale*(usew/2),
						ypos*CanvasHeight - Scale*(useh/2));
					Canvas.DrawTile(usetex,
						Scale*usew,
						Scale*useh,
						0, 0, usetex.USize, usetex.VSize);
				}
			}
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Draw the Level Action
// Called by base class.  return value says whether or not to hide player
// progress messages, which are displayed in the same area of the screen.
///////////////////////////////////////////////////////////////////////////////
function bool DrawLevelAction( canvas C )
	{
	local string BigMessage;
	local float y;

	y = 0.5;
	BigMessage = "";

	if (Level.LevelAction == LEVACT_None )
		{
		// Check if we're paused (note the use of another magical epic number here)
		if ((Level.Pauser != None) && (Level.TimeSeconds > Level.PauseDelay + 0.2))
			{
			// Make sure no screens or root windows are running (somewhat time-consuming
			// but it's okay because if we get here we know the game is already paused)
			if ((OurPlayer.CurrentScreen == None) && !AreAnyRootWindowsRunning())
				{
				// Display paused message
				BigMessage = PausedMessage;
				}
			}
		}
	else if (Level.LevelAction == LEVACT_Loading)
		{
/*	This message was flashing, apparently because it was only drawn on one
	backbuffer.  We'll have to figure out a better way to get this to show
	up.  It wasn't working when done in P2Screen, either, apparently because
	font may not have been valid at that point.
	if (P2GameInfoSingle(Level.Game) != None &&
			P2GameInfoSingle(Level.Game).bQuitting)
			BigMessage = QuittingMessage;
		else
			BigMessage = LoadingMessage;
		y = LoadingMessageY;
*/
		}
// Until we're sure these messages won't flicker
//	else if (Level.LevelAction == LEVACT_Quitting)
//		BigMessage = QuittingMessage;

// Stubbing out saving messages per Jon
//	else if (Level.LevelAction == LEVACT_Saving)
//		BigMessage = SavingMessage;
//	else if (Level.LevelAction == LEVACT_EasySaving)
//		BigMessage = EasySavingMessage;
//	else if (Level.LevelAction == LEVACT_AutoSaving)
//		BigMessage = AutoSavingMessage;
//	else if (Level.LevelAction == LEVACT_ForcedSaving)
//		BigMessage = ForcedSavingMessage;

		// Until we're sure these messages won't flicker
//	else if (Level.LevelAction == LEVACT_Restarting)
//		BigMessage = RestartingMessage;
	else if (Level.LevelAction == LEVACT_Precaching)
		BigMessage = PrecachingMessage;

	if (BigMessage != "")
		{
		// xPatch: Widescreen Fix
		/*MyFont.DrawTextEx(C, CanvasWidth, CanvasWidth/2, CanvasHeight * y, BigMessage, 3, false, EJ_Center);*/
		MyFont.DrawTextEx(C, CanvasWidth, UltraWideOffsetX + 0.5 * CanvasWidth, 0.5  * CanvasHeight, BigMessage, 3, false, EJ_Center);
		// End
		return true;
		}
	return false;
	}

///////////////////////////////////////////////////////////////////////////////
// Check if root window is running
///////////////////////////////////////////////////////////////////////////////
function bool AreAnyRootWindowsRunning()
	{
	local P2RootWindow root;

	root = P2RootWindow(OurPlayer.Player.InteractionMaster.BaseMenu);
	if (root != None)
		return root.IsMenuShowing();
	return false;
	}
	
function bool IsMainMenuRunning()
{
	local P2RootWindow root;

	root = P2RootWindow(OurPlayer.Player.InteractionMaster.BaseMenu);
	if (root != None)
		return root.IsMainMenuShowing();
	return false;
}

///////////////////////////////////////////////////////////////////////////////
// Add hud messages
///////////////////////////////////////////////////////////////////////////////
function AddHudMsgs(array<S_HudMsg> msgs, float Lifetime)
	{
	local int i;

	DeleteHudMsgs();

	// Add new messages
	for (i = 0; i < msgs.Length; i++)
		HudMsgs[i] = msgs[i];

	HudMsgsEndTime = Level.TimeSeconds + Lifetime;
	}

///////////////////////////////////////////////////////////////////////////////
// Delete hud messages
///////////////////////////////////////////////////////////////////////////////
function DeleteHudMsgs()
	{
	if (HudMsgs.Length > 0)
		HudMsgs.remove(0, HudMsgs.Length);
	}

///////////////////////////////////////////////////////////////////////////////
// Draw hud messages
///////////////////////////////////////////////////////////////////////////////
function DrawHudMsgs(Canvas Canvas)
	{
	local int i;
	
	// Draw pop-up hud msg first, if any.
	 if (PopupHudMsg.Msg != "")
		MyFont.DrawTextEx(
			Canvas,
			CanvasWidth,
			UltraWideOffsetX + PopupHudMsg.X * CanvasWidth,
			PopupHudMsg.Y * CanvasHeight,
			PopupHudMsg.Msg,
			PopupHudMsg.FontSize,
			PopupHudMsg.bPlain,
			PopupHudMsg.JustifyFromX);

	if (HudMsgs.Length > 0)
		{
		if (HudMsgsEndTime > Level.TimeSeconds)
			{
			for (i = 0; i < HudMsgs.Length; i++)
				{
				if (HudMsgs[i].Msg != "")
					{
					MyFont.DrawTextEx(
						Canvas,
						CanvasWidth,
						UltraWideOffsetX + HudMsgs[i].X * CanvasWidth,
						HudMsgs[i].Y * CanvasHeight,
						HudMsgs[i].Msg,
						HudMsgs[i].FontSize,
						HudMsgs[i].bPlain,
						HudMsgs[i].JustifyFromX);
					}
				}
			}
		else
			DeleteHudMsgs();
		}
	}

///////////////////////////////////////////////////////////////////////////////
// Each time a new inventory item  comes up, the hints get updatted.
///////////////////////////////////////////////////////////////////////////////
function SetInvHints(string str1, string str2, string str3, byte InfiniteTime)
{
	InvHint1 = str1;
	InvHint2 = str2;
	InvHint3 = str3;
	if(InfiniteTime == 0)
		InvHintDeathTime = Level.TimeSeconds + INV_HINT_LIFETIME;
	else
		InvHintDeathTime = INFINITE_HINT_TIME;
}

///////////////////////////////////////////////////////////////////////////////
// Each time a new weapon item  comes up, the hints get updatted.
///////////////////////////////////////////////////////////////////////////////
function SetWeapHints(string str1, string str2, string str3, byte InfiniteTime)
{
	WeapHint1 = str1;
	WeapHint2 = str2;
	WeapHint3 = str3;
	if(InfiniteTime == 0)
		WeapHintDeathTime = Level.TimeSeconds + WEAP_HINT_LIFETIME;
	else
		WeapHintDeathTime = INFINITE_HINT_TIME;
}

///////////////////////////////////////////////////////////////////////////////
// xPatch: Draw Crosshair in HUD
///////////////////////////////////////////////////////////////////////////////
simulated function DrawCrosshair(canvas Canvas, float Scale, bool bForced)
{
	local float UseScale;
	local bool bDrawCrosshair;
	local texture CrossHair;
	local color ReticleColor;
	local P2Weapon weap;
	
	if(PawnOwner != None)
		weap = P2Weapon(PawnOwner.Weapon);
	bDrawCrosshair = (weap != None && !bHideHUD && (OurPlayer.ViewTarget == OurPlayer.Pawn && (!OurPlayer.bBehindView || OurPlayer.ThirdPersonView)));
	
	// Don't show in menu, cutscenes, lockcamera etc. unless it's (actually) forced.
	if( !OurPlayer.bForceCrosshair && (AreAnyRootWindowsRunning() || !bDrawCrosshair) )
		return;
	
	// Forced Crosshair -- drawn by HUD itself.
	if(bForced)
	{
		// Get color from weapon if it changed (Rocket Launcher charge)
		// so it makes it bright just like the in-weapon DrawCrosshair.
		if(weap != None && weap.ReticleColor != weap.ReticleDefaultColor)
			ReticleColor = weap.ReticleColor; 
		// Return only alpha + white color for old crosshairs.
		if(OurPlayer.ReticleGroup == 0)	
			ReticleColor = OurPlayer.GetReticleColor();
		else
			ReticleColor = OurPlayer.GetReticleColor2();	
			
		CrossHair = OurPlayer.GetReticleTexture();
		UseScale = OurPlayer.ReticleSize;

		// Draw reticle
		Canvas.Style = ERenderStyle.STY_Alpha;
		Canvas.DrawColor = ReticleColor;
		Canvas.SetPos(
			(Canvas.ClipX / 2) - UseScale*(CrossHair.USize/2),
			(Canvas.ClipY / 2) - UseScale*(CrossHair.VSize/2));
		Canvas.DrawIcon(CrossHair, UseScale);
	}
	else
	{
		weap.DrawCrosshair(Canvas);
	}
}

///////////////////////////////////////////////////////////////////////////////
// xPatch: Catnip Effects
///////////////////////////////////////////////////////////////////////////////
function DoCatnipEffects()
{
	local int i;
	
	if(P2GameInfoSingle(Level.Game) != None
		&& P2GameInfoSingle(Level.Game).xManager.bCatnipEffect)
	{
		if(CatnipActive == 0)
		{
			for(i=0; i<catnipeffects.Length; i++)
				catnipeffects[i] = default.catnipeffects[i];
			CatnipActive=1;
		}
	}
}
function StopCatnipEffects(float CatnipUseTime)
{
	local int i;
	
	if(CatnipUseTime <= 0)
	{
		for(i=0; i<catnipeffects.Length; i++)
			catnipeffects[i] = default.catnipeffects[i];
		CatnipActive=0;
	}
	else if(CatnipUseTime == 2.00)
		StopSwirlOnAlpha(catnipeffects, true);
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////


// Decompiled with UE Explorer.
defaultproperties
{
    WhiteColor=(R=255,G=255,B=255,A=255)
    DefaultIconColor=(R=220,G=220,B=220,A=255)
    YellowColor=(R=255,G=255,B=0,A=255)
    RedColor=(R=255,G=0,B=0,A=255)
    BlueColor=(R=0,G=0,B=255,A=255)
    HeartIcon=Texture'nathans.Inventory.heartinv'
    WantedIcon=Texture'HUDPack.Icons.icon_inv_badge'
    WantedBar=Texture'HUDPack.Icons.icon_inv_badge_slider'
    SectionBackground=/* ERROR: System.NullReferenceException */
    RadarBackground=Texture'P2Misc.Fish_Radar.Bass_Sniffer'
    RadarPlayer=Texture'P2Misc.Fish_Radar.boat'
    RadarNPC=Texture'P2Misc.Fish_Radar.Fish'
    RadarGlow=Texture'P2Misc.Fish_Radar.Bass_Sniffer_Lens'
    RadarTarget[0]=Texture'nathans.Chompy.Chompy1'
    RadarTarget[1]=Texture'nathans.Chompy.Chompy2'
    RadarCopHat=Texture'nathans.RadarPlugIns.cophat'
    RadarGun=Texture'nathans.RadarPlugIns.fishgun'
    BlackBox=Texture'nathans.Inventory.blackbox64'
    TopHurtBar=Texture'MPfx.softwhitedotbig'
    SideHurtBar=Texture'MPfx.softwhitedotbig'
    SkullHurtBar=Texture'HUDPack.Icons.YourDead'
    LipstickDecal=Texture'JW_textures.Seasonal.Kiss'
    SubBoxSize=1.0000000
    MaxSubtitlesLines=10
    SubLineH=23
    indentL=20
    indentT=5
    BorderH=10
    SubBoxW=800
    SubBoxBottom=150
    SubBoxBG=Texture'TSubBox'
    SubBoxBGCorner=Texture'TSubBoxCorner'
    IconPos[0]=(X=0.9350000,Y=0.1200000)
    IconPos[1]=(X=0.9350000,Y=0.2700000)
    IconPos[2]=(X=0.9350000,Y=0.4200000)
    IconPos[3]=(X=0.9350000,Y=0.5700000)
    InvTextPos[0]=(X=-0.0550000,Y=-0.0350000)
    InvTextPos[1]=(X=-0.0550000,Y=-0.0100000)
    InvTextPos[2]=(X=-0.0550000,Y=0.0150000)
    WeapTextPos[0]=(X=-0.0550000,Y=0.0150000)
    WeapTextPos[1]=(X=-0.0550000,Y=0.0400000)
    WeapTextPos[2]=(X=-0.0550000,Y=0.0650000)
    WantedTextPos[0]=(X=-0.0550000,Y=-0.0300000)
    WantedTextPos[1]=(X=-0.0550000)
    FireModePos=(X=0.0200000,Y=0.9600000)
    InvIndex=1
    HealthIndex=2
    WantedIndex=3
    RadarHint0="Hey kids! It's Chompy,the Voodoo Fish!"
    RadarHint1="Use %KEY_SPECIAL_MOVEMENT% to start!"
    RadarHint2="TimeLeft: "
    RadarHint3="Steer Chompy towards other fish to gobble them up!"
    RadarHint4="Don't worry about getting hurt..."
    RadarHint5="Chompy's mystical energy will protect you!"
    RadarHint6="Go Chompy,Go!"
    RadarKillHint0="Okay kids... here comes Chompy!"
    RadarKillHint1="Oooh! That's gotta hurt..."
    RadarKillHint2="Just let his dark Voodoo powers do the work..."
    RadarStatsHint0="Chompy's hungry! Eat more next time."
    RadarStatsHint1="Way to go Chompy!"
    RadarStatsHint2="Fish eaten: "
    RadarStatsHint3="Prizes granted:"
    RadarStatsHint4="Use %KEY_SPECIAL_MOVEMENT% to return to normal gameplay."
    RadarDeadHint="Way to go Chompy!"
    RadarMouseHint="Use %KEY_SPECIAL_LOOK% to watch the show."
    RocketHint1="Press %KEY_Jump% to return to the Dude."
    RocketHint2="Press %KEY_SPECIAL_MOVEMENT% to control the rocket,%KEY_InventoryActivate% to detonate."
    RocketHint3="Your rocket is out of gas! Enjoy the ride down."
    SuicideHintMajor="Press %KEY_Fire% to end it all or %KEY_AltFire% to wuss out."
    SuicideHintMinor="Use %KEY_NextWeapon%/%KEY_PrevWeapon% to zoom in and out."
    SuicideHintMajorAlt="Press %KEY_AltFire% to wuss out."
    DeadMessage1="Press %KEY_GameOverRestart% to load"
    DeadMessage2="your most recent game."
    DeadDemoMessage1="Press %KEY_GameOverRestart% to"
    DeadDemoMessage2="return to the Main Menu."
    QuittingMessage="Quitting Game"
    LoadingMessageY=0.8100000
    EasySavingMessage="Easy Saving"
    AutoSavingMessage="Auto Saving"
    RestartingMessage="Restarting"
    ForcedSavingMessage="Saving"
    FireModeText="Firing mode:"
    RadarCow=Texture'P2Misc.Fish_Radar.CowIcon'
    TopSniperBar=Texture'MPfx.softblackdot'
    SideSniperBar=Texture'MPfx.softblackdot'
    KillBkgd=Texture'nathans.Inventory.bloodsplat-1'
    KillPos=(X=0.0650000,Y=0.1200000)
    KillOffset=(Y=0.1500000)
    startinjuries[0]=IntProperty'HolidaySpawnerBase.Timer.GroupToSpawn'
    startinjuries[1]=Class'P2PowerupInv'
    startinjuries[2]=Texture'Zo_Smeg.Special_Brushes.zo_gravel'
    walkinjuries[0]=IntProperty'HolidaySpawnerBase.Timer.GroupToSpawn'
    walkinjuries[1]=Class'P2PowerupInv'
    stopinjuries[0]=IntProperty'HolidaySpawnerBase.Timer.GroupToSpawn'
    stopinjuries[1]=Class'P2PowerupInv'
    garyeffects[0]=IntProperty'HolidaySpawnerBase.Timer.GroupToSpawn'
    garyeffects[1]=Class'P2PowerupInv'
    catnipeffects[0]=(Tex=Texture'Zo_Smeg.Special_Brushes.zo_gravel',xoff=-0.5000000,yoff=-0.5000000,Scale=2.0000000,MoveTimeDilation=0.6000000,MoveSpeed=0.3000000,Green=180.0000000,Alpha=1.0000000,greenchange=2.0000000,bluechange=1.0000000,alphachange=30.0000000,greenmax=180.0000000,bluemax=80.0000000,AlphaMax=50.0000000,greenmin=100.0000000,bluemin=1.0000000,alphamin=20.0000000)
    catnipeffects[1]=(Tex=Texture'Zo_Smeg.Special_Brushes.zo_wash2_opaque',xoff=-0.5000000,yoff=-0.5000000,Scale=2.0000000,MoveTimeDilation=0.7000000,MoveSpeed=-0.1500000,Red=50.0000000,Green=100.0000000,Blue=200.0000000,Alpha=1.0000000,greenchange=1.0000000,bluechange=-4.0000000,alphachange=30.0000000,redmax=100.0000000,greenmax=100.0000000,bluemax=255.0000000,AlphaMax=50.0000000,redmin=50.0000000,greenmin=20.0000000,bluemin=200.0000000,alphamin=20.0000000)
    catnipeffects[2]=(Tex=Texture'Engine.WhiteSquareTexture',xoff=-0.5000000,yoff=-0.5000000,Scale=2.0000000,MoveTimeDilation=0.6000000,MoveSpeed=0.3000000,Green=255.0000000,Alpha=1.0000000,greenchange=7.0000000,alphachange=30.0000000,greenmax=255.0000000,AlphaMax=30.0000000,greenmin=255.0000000,alphamin=20.0000000)
    CategoryFormats[0]=(XP=0.0200000,YP=0.0200000,Stack=2,FontSize=1,bAlwaysUseColor=true,Color=(R=180,G=10,B=10,A=255))
    CategoryFormats[1]=(XP=0.0200000,YP=0.9000000,VAlign=2,FontSize=1)
    CategoryFormats[2]=(XP=0.0200000,YP=0.9500000,VAlign=2)
    CategoryFormats[3]=(XP=0.0200000,YP=0.8500000,VAlign=2)
    CategoryFormats[4]=(XP=0.0200000,YP=0.8000000,VAlign=2)
}