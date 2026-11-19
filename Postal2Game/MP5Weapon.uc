class MP5Weapon extends EDWeapon;

var sound cocksound;

// Romoved by Man Chrzan: xPatch 2.0
// Here's our reason for sound stuttering.
// Instead of changing volume in script I've edited sound file.
/*simulated function PlayFiring()
{
	IncrementFlashCount();

	// ED fire sounds are a bit too loud, tone it down here
    if(Level.Game == None || !FPSGameInfo(Level.Game).bIsSinglePlayer)
		PlayOwnedSound(FireSound,SLOT_Interact,0.5,,,WeaponFirePitchStart + (FRand()*WeaponFirePitchRand),false);
	else
		Instigator.PlaySound(FireSound, SLOT_None, 0.5, true, , WeaponFirePitchStart + (FRand()*WeaponFirePitchRand));

    if (FireMode == FM_Auto)
        PlayAnim(LoopFireAnim, WeaponSpeedLoopFire, 0);
    else
        PlayAnim(FireAnims[FireMode], GetFireAnimRate() + (WeaponSpeedShoot1Rand*FRand()), 0.05);
}
*/

///////////////////////////////////////////////////////////////////////////////
// Modify your speed based on your owners body speed
///////////////////////////////////////////////////////////////////////////////
function ChangeSpeed(float NewSpeed)
{
	Super.ChangeSpeed(NewSpeed);
	WeaponSpeedLoopFire = default.WeaponSpeedLoopFire*NewSpeed;
}

///////////////////////////////////////////////////////////////////////////////
// Added by Man Chrzan: xPatch 2.0
// HACK: Fix for some Workshop Weapons that are based on MP5
// Use ThreeStageFire only if it's MP5.
///////////////////////////////////////////////////////////////////////////////
function PostBeginPlay()
{
	if (Class == class'MP5Weapon')
	{
	    bThreeStageFire=True;
	}
}

///////////////////////////////////////////////////////////////////////////////
// xPatch: Cat Silencer
///////////////////////////////////////////////////////////////////////////////
simulated function PlayFiring()
{
	local float UsePitch;
	
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
	
	Super.PlayFiring();
}

function PlayIdleAnim()
{
	Super.PlayIdleAnim();
	
	if( Cat != None && bCatStateControl)
		Cat.PlayAnim(CatIdleAnim);	
	if (P2WeaponAttachment(ThirdPersonActor).CatSilencer3rd != None)
		P2WeaponAttachment(ThirdPersonActor).CatSilencer3rd.PlayAnim(CatIdleAnim);
}

function PlayDownAnim()
{
	Super.PlayDownAnim();
	
	if( Cat != None && bCatStateControl)
		Cat.PlayAnim(CatIdleAnim);
	if (P2WeaponAttachment(ThirdPersonActor).CatSilencer3rd != None)
		P2WeaponAttachment(ThirdPersonActor).CatSilencer3rd.PlayAnim(CatIdleAnim);
}

///////////////////////////////////////////////////////////////////////////////
// Handle these sounds with script notify and allow only for players. 
// This sound can be a little annoying when made by NPCs when the level loads...
///////////////////////////////////////////////////////////////////////////////
function Notify_Cock()
{
	if ( Instigator.IsHumanControlled() )
	{
        Instigator.PlaySound(CockSound, SLOT_None, 1.0, true,,);
	}
}

///////////////////////////////////////////////////////////////////////////////
// Okay since MP5 and Glock now use new ammo class I guess I should do
// something to prevent losing ammo on old saves.
///////////////////////////////////////////////////////////////////////////////
event PostLoadGame()
{
	FixOldAmmo(Class'MP5AmmoInv', AmmoName);
	
	// We might need to fix animations too!
	if (Class == class'MP5Weapon' && !bThreeStageFire)
	{
	    bThreeStageFire=True;
		PlayIdleAnim();
	}
	
	Super.PostLoadGame();
}


// Decompiled with UE Explorer.
defaultproperties
{
    cocksound=Sound'EDWeaponSounds.Weapons.mp5cock'
    TraceAccuracySemi=0.1500000
    TraceAccuracyAuto=0.7500000
    bDisplayFireMode=true
    bSwitchesFireMode=true
    WeaponSpeedPrepFire=6.0000000
    WeaponSpeedLoopFire=1.5000000
    WeaponSpeedEndFire=3.0000000
    WeaponSpeedSwitch=1.7500000
    PrepFireAnim="Shoot1_autoPrep"
    LoopFireAnim="shoot1_auto"
    EndFireAnim="Shoot1_autoend"
    SelectAnims[0]="load_semi"
    SelectAnims[1]="None"
    SelectAnims[2]="load_auto"
    DeselectAnims[0]="Holster_semi"
    DeselectAnims[1]="None"
    DeselectAnims[2]="Holster_auto"
    FireAnims[0]="shoot1_semi"
    FireAnims[1]="None"
    FireAnims[2]="shoot1_auto"
    IdleAnims[0]="Idle_Semi"
    IdleAnims[1]="None"
    IdleAnims[2]="Idle_auto"
    ReloadAnims[0]="reload_semi"
    ReloadAnims[1]="None"
    ReloadAnims[2]="reload_auto"
    SwitchAnims[0]="shoot2_semi2auto"
    SwitchAnims[1]="None"
    SwitchAnims[2]="shoot2_auto2semi"
    FireMode=2
    StartShotsWithCat=9
    CatFireSound=Sound'WeaponSounds.machinegun_catfire'
    bAttachCat=true
    bCatStateControl=true
    CatIdleAnim="idle_mg"
    CatFireAnim="shoot_mg"
    CatBoneName="Muzzle"
    CatRelativeLocation=(X=1.0000000,Y=-3.0000000,Z=-2.0000000)
    CatRelativeRotation=(Pitch=-16384,Yaw=-13384,Roll=0)
    bUsesAltFire=true
    ViolenceRank=3
    RecognitionDist=1100.0000000
    AI_BurstCountExtra=10
    AI_BurstCountMin=6
    AI_BurstTime=0.1200000
    holdstyle=4
    switchstyle=4
    firingstyle=4
    MinRange=100.0000000
    ShakeOffsetTime=2.0000000
    bAllowHints=true
    bShowHints=true
    HudHint1="%KEY_AltFire% selects semi-auto"
    HudHint2="or full-auto."
    CombatRating=2.0000000
    FirstPersonMeshSuffix="ED_MP5_NEW"
    WeaponsPackageStr="ED_Weapons."
    WeaponSpeedShoot2=2.5000000
    AltFireSound=Sound'EDWeaponSounds.Weapons.MP5'
    MFClass[0]=Class'FX2.MuzzleFlash_SMG'
    MFClass[2]=Class'FX2.MuzzleFlash01'
    MFBoneName="Muzzle"
    MFScale=(Min=0.2500000,Max=0.7500000)
    MFSizeRange=(Min=15.0000000,Max=20.0000000)
    MFLifetime=(Min=0.0700000,Max=0.0700000)
    ShellClass=Class'FX2.P2Shell_9mm'
    ShellBoneName="MESH_Shell"
    ShellRelativeLocation=(X=0.0000000,Y=5.0000000,Z=8.0000000)
    ShellSpeedY=350.0000000
    ShellSpeedZ=400.0000000
    ShellTex=Texture'ED_WeaponSkins.Pistol.beretta'
    bCheckShell=true
    AmmoName=Class'NineAmmoInv'
    AutoSwitchPriority=8
    ShakeRotMag=(X=60.0000000,Y=15.0000000,Z=15.0000000)
    ShakeOffsetMag=(X=3.0000000,Y=2.5000000,Z=2.5000000)
    aimerror=0.0000000
    AIRating=0.8000000
    MaxRange=200.0000000
    FireSound=Sound'EDWeaponSounds.Weapons.MP5'
    FlashOffsetY=-0.0900000
    FlashOffsetX=0.0950000
    MuzzleFlashSize=96.0000000
    MFTexture=Texture'Timb.muzzle_flash.machine_gun_corona'
    MuzzleFlashScale=2.4000000
    MuzzleFlashStyle=1
    InventoryGroup=4
    GroupOffset=2
    PickupClass=Class'MP5Pickup'
    PlayerViewOffset=(X=0.0000000,Y=0.3000000,Z=-7.0000000)
    BobDamping=1.1200000
    ThirdPersonRelativeLocation=(X=1.0000000,Y=0.0000000,Z=0.0000000)
    ThirdPersonRelativeRotation=(Pitch=-256,Yaw=0,Roll=0)
    AttachmentClass=Class'MP5Attachment'
    ItemName="Submachine Gun"
    Mesh=SkeletalMesh'ED_Weapons.ED_MP5_NEW'
    Skins[0]=Texture'ED_WeaponSkins.Rifles.MP5skin'
    Skins[1]=Texture'ED_WeaponSkins.Pistol.beretta'
    Skins[2]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
    SoundRadius=255.0000000
    SoundVolume=92
}