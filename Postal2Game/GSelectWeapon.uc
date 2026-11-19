class GSelectWeapon extends EDWeapon;

var float FiringWaitTime;
var bool bCanFireAgain;		// If you're the player and this is set to true, then you
							// shoot again if even you're still in NormalFire
var sound SlideBackSound, SlideSnapSound;

///////////////////////////////////////////////////////////////////////////////
// Added by Man Chrzan: Change for xPatch Options
///////////////////////////////////////////////////////////////////////////////
simulated function ToggleFireMode()
{
	local byte GlockMode;
	
	if(P2GameInfoSingle(Level.Game).xManager != None)
		GlockMode = P2GameInfoSingle(Level.Game).xManager.iGlockMode;
	else
		GlockMode = 2;
	
	TurnOffHint();
	
	// in multiplayer always use Semi and Auto (Burst doesn't work correctly)
	if (Level.Game == None || !FPSGameInfo(Level.Game).bIsSinglePlayer)
		Super.ToggleFireMode(); 		
	else
	{
		switch (FireMode)
		{
			case FM_Semi:   
				if(GlockMode == 1) // Semi and Auto
					FireMode = FM_Auto;
				else
					FireMode = FM_Burst;
				break;

			case FM_Burst:   
				if(GlockMode == 0)	// Semi and Burst
					FireMode = FM_Semi;  
				else
					FireMode = FM_Auto; 
				 break;

			case FM_Auto:    
				FireMode = FM_Semi;
				break;
		}					 
	}
}

///////////////////////////////////////////////////////////////////////////////
// Fire the weapon
///////////////////////////////////////////////////////////////////////////////
simulated function PlayFiring()
{
	local float UsePitch;
	
	if(PlayerController(Instigator.Controller) != None
		&& FireMode == FM_Semi )
		bCanFireAgain=false;
		
	// Reduce the cat ammo if we're using one
	if(CatOnGun == 1)
	{
		CatAmmoLeft--;
		
		// Switch to special sound
		FireSound=CatFireSound;
		// Pitch higher with each consecutive shot
		UsePitch = WeaponFirePitchStart + (CAT_PITCH_INCREASE*(StartShotsWithCat - CatAmmoLeft));
		
		if (CatAmmoLeft==0
			|| !AmmoType.HasAmmo())
		{
			// Remove our cat and shoot him off, unless we have a cheat set to
			// keep shooting them off
			if(RepeatCatGun == 0)
				{
					SwapCatOff();
					ShootOffCat();
					CatOnGun=0;
				}
			else // Cheat
				{
					CatAmmoLeft=1;
					ShootOffCat();
				}
		}
	}
	else
	{
		// Use normal firing sound
		FireSound=Default.FireSound;
		UsePitch = WeaponFirePitchStart + (FRand()*WeaponFirePitchRand);
	}
	
	if(PersonPawn(Instigator) != None 
		&& !PersonPawn(Instigator).bPlayer
		&& PersonPawn(Instigator).bAdvancedFiring)
		FireMode = FM_Burst;
	
	Super.PlayFiring();
}

/*
function ServerFire()
{
	// Don't allow holding LMB to fire in Burst unless it's in Dual Wielding.
	if (FireMode == FM_Burst && !bDualWielding && LeftWeapon != none)
		Instigator.Controller.bFire = 0;
	
	Super.ServerFire();
}
*/

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// NormalFire
// If we're in here, and it's the player and he presses fire before the fire
// anim is done and *after* the FIRING_WAIT_TIME sleep is over, then we
// let him fire again.
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state NormalFire
{
	ignores AltFire;

	///////////////////////////////////////////////////////////////////////////////
	// Same as global
	///////////////////////////////////////////////////////////////////////////////
	simulated function Fire( float Value )
	{
		if(bCanFireAgain && FireMode==FM_Semi)
		{
			global.Fire(0);
			// Animation-canceling makes our accuracy worse
			if(TraceAccuracySemi < TraceAccuracyAuto)
				TraceAccuracySemi = (TraceAccuracySemi + 0.05);
		}
	}
	function ServerFire()
	{
		if(bCanFireAgain && FireMode==FM_Semi)
		{
			global.ServerFire();
			// Animation-canceling makes our accuracy worse
			if(TraceAccuracySemi < TraceAccuracyAuto)
				TraceAccuracySemi = (TraceAccuracySemi + 0.05);
		}
	}
	function AnimEnd(int Channel)
	{
		Super.AnimEnd(Channel);
		TraceAccuracySemi=default.TraceAccuracySemi;
	}
	simulated function EndState()
	{
		Super.EndState();
	}
Begin:
	Sleep(FiringWaitTime);
	bCanFireAgain=true;
}

///////////////////////////////////////////////////////////////////////////////
// NPCs with bAdvancedFiring set to True will use Burst fire. 
///////////////////////////////////////////////////////////////////////////////
function PostBeginPlay()
{
	Super.PostBeginPlay();

	if(PersonPawn(Instigator) != None 
		&& !PersonPawn(Instigator).bPlayer
		&& PersonPawn(Instigator).bAdvancedFiring)
		FireMode = FM_Burst;
}

///////////////////////////////////////////////////////////////////////////////
// Pre-update Glock used skinflash notify to fire for some reason.
// Added it back for compability with mods that still might be using it.
///////////////////////////////////////////////////////////////////////////////
function Notify_skinflash_start()
{
	Notify_Fire();
	AmbientGlow = 400;
}

function Notify_Fire()
{
	Super.Notify_Fire();
	Notify_SpawnShell();
}

///////////////////////////////////////////////////////////////////////////////
// Handle these sounds with script notify and allow only for players. 
// This sound can be a little annoying when made by NPCs when the level loads...
///////////////////////////////////////////////////////////////////////////////
function Notify_SlideSnap()
{
	if ( Instigator.IsHumanControlled() )
	{
        Instigator.PlaySound(SlideSnapSound, SLOT_None, 1.0, true);
	}
}

function Notify_SlideBack()
{
	if ( Instigator.IsHumanControlled() )
	{
        Instigator.PlaySound(SlideBackSound, SLOT_Pain, 1.0, true);
	}
}

///////////////////////////////////////////////////////////////////////////////
// Little trick to keep the "fake" shell during load animation.
///////////////////////////////////////////////////////////////////////////////
state Active
{
	function BeginState()
	{
		Super.BeginState();
		UnCheckShell();
	}
}

function UnCheckShell()
{
	local int i;
	
	for(i=0; i<Skins.Length; i++)
	{
		if(default.Skins[i] == ShellTex)
			Skins[i] = default.Skins[i];
	}
}

///////////////////////////////////////////////////////////////////////////////
// Okay since MP5 and Glock now use new ammo class I guess I should do
// something to prevent losing ammo on old saves.
///////////////////////////////////////////////////////////////////////////////
event PostLoadGame()
{
	FixOldAmmo(Class'GSelectAmmoInv', AmmoName);
	Super.PostLoadGame();
}


// Decompiled with UE Explorer.
defaultproperties
{
    FiringWaitTime=0.1500000
    bCanFireAgain=true
    SlideBackSound=Sound'EDWeaponSounds.Pistol.Glock_slideback'
    TraceAccuracySemi=0.2500000
    TraceAccuracyBurst=0.4000000
    TraceAccuracyAuto=0.7500000
    bDisplayFireMode=true
    bSwitchesFireMode=true
    WeaponSpeedSwitch=1.5000000
    SelectAnims[0]="load_semi"
    SelectAnims[1]="load_auto"
    SelectAnims[2]="load_auto"
    DeselectAnims[0]="Holster_semi"
    DeselectAnims[1]="Holster_auto"
    DeselectAnims[2]="Holster_auto"
    FireAnims[0]="shoot1_semi"
    FireAnims[1]="shoot1_auto"
    FireAnims[2]="new_shoot_full"
    IdleAnims[0]="Idle_Semi"
    IdleAnims[1]="Idle_auto"
    IdleAnims[2]="Idle_auto"
    ReloadAnims[0]="reload_auto"
    ReloadAnims[1]="reload_auto"
    ReloadAnims[2]="reload_semi"
    SwitchAnims[0]="shoot2_semi2auto"
    SwitchAnims[1]="shoot2_auto2semi"
    SwitchAnims[2]="shoot2_auto2semi"
    StartShotsWithCat=9
    CatFireSound=Sound'WeaponSounds.machinegun_catfire'
    bAttachCat=true
    CatBoneName="Muzzle"
    CatRelativeLocation=(X=0.0000000,Y=-2.0000000,Z=0.0000000)
    CatRelativeRotation=(Pitch=33000,Yaw=0,Roll=-16384)
    bUsesAltFire=true
    ViolenceRank=3
    RecognitionDist=1100.0000000
    holdstyle=1
    switchstyle=1
    firingstyle=1
    MinRange=100.0000000
    ShakeOffsetTime=2.0000000
    bAllowHints=true
    bShowHints=true
    HudHint1="%KEY_AltFire% selects semi-auto,"
    HudHint2="burst, or full-auto."
    CombatRating=2.0000000
    FirstPersonMeshSuffix="ED_Glock_NEW"
    WeaponsPackageStr="ED_Weapons."
    WeaponSpeedShoot1=0.7000000
    AltFireSound=Sound'EDWeaponSounds.Pistol.Glock_fire'
    OverrideHUDIcon=Texture'EDHud.hud_Glock'
    bAllowMiddleFinger=true
    MFClass[0]=Class'FX2.MuzzleFlash_SMG'
    MFClass[2]=Class'FX2.MuzzleFlash01'
    MFBoneName="Muzzle"
    ShellClass=Class'FX2.P2Shell_9mm'
    ShellBoneName="shell02"
    ShellRelativeLocation=(X=12.0000000,Y=0.0000000,Z=-5.0000000)
    ShellSpeedY=350.0000000
    ShellSpeedZ=400.0000000
    ShellTex=Texture'ED_WeaponSkins.Pistol.beretta'
    bCheckShell=true
    AmmoName=Class'NineAmmoInv'
    AutoSwitchPriority=8
    ShakeRotMag=(X=120.0000000,Y=30.0000000,Z=30.0000000)
    ShakeOffsetMag=(X=3.0000000,Y=2.5000000,Z=2.5000000)
    aimerror=0.0000000
    AIRating=0.2000000
    MaxRange=1024.0000000
    FireSound=Sound'EDWeaponSounds.Pistol.Glock_fire'
    FlashOffsetY=-0.0900000
    FlashOffsetX=0.0950000
    MuzzleFlashSize=96.0000000
    MFTexture=Texture'Timb.muzzle_flash.machine_gun_corona'
    MuzzleFlashScale=2.4000000
    MuzzleFlashStyle=1
    InventoryGroup=2
    GroupOffset=2
    PickupClass=Class'GSelectPickup'
    PlayerViewOffset=(X=0.0000000,Y=0.0000000,Z=-8.0000000)
    BobDamping=1.1500000
    AttachmentClass=Class'GSelectAttachment'
    ItemName="Machine Pistol"
    Mesh=SkeletalMesh'ED_Weapons.ED_Glock_NEW'
    Skins[0]=Texture'ED_WeaponSkins.Pistol.glockskin'
    Skins[1]=Texture'ED_WeaponSkins.Pistol.beretta'
    Skins[2]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
    SoundRadius=255.0000000
}