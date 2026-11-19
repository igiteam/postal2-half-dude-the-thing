///////////////////////////////////////////////////////////////////////////////
// ScissorsWeapon
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Scissors that you throw.
//
///////////////////////////////////////////////////////////////////////////////

class ScissorsWeapon extends P2DualWieldWeapon;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////

var float WeaponSpeedShoot1MP;	// Allow faster shooting in multiplayer.
var float WeaponSpeedShoot2MP;

// Kamek 4-28
const UNREAL_UNITS_PER_MILE = 10874;	// How many UU's in a mile
var vector LastLocation;				// Last location of our pawn

var float EnhancedSpeedMult;

const ENHANCED_MODE_SPEED = 3.000000;
const SONIC_SPEED = 2.0;	// If we change this in the P2CheatManager make sure to change it here too

///////////////////////////////////////////////////////////////////////////////
// Modify your speed based on your owners body speed
///////////////////////////////////////////////////////////////////////////////
function ChangeSpeed(float NewSpeed)
{
	WeaponSpeedLoad = default.WeaponSpeedLoad*NewSpeed;
	WeaponSpeedReload = default.WeaponSpeedReload*NewSpeed;
	WeaponSpeedHolster = default.WeaponSpeedHolster*NewSpeed;
	if (class == class'ScissorsWeapon'
		&& P2GameInfoSingle(Level.Game).VerifySeqTime()
		&& Pawn(Owner).Controller.bIsPlayer)
		NewSpeed *= ENHANCED_MODE_SPEED;
	// If it's a MP game, make them fire faster
	if(Level.Game == none
		|| !Level.Game.bIsSinglePlayer)
	{
		WeaponSpeedShoot1 = WeaponSpeedShoot1MP*NewSpeed;
		WeaponSpeedShoot2 = WeaponSpeedShoot2MP*NewSpeed;
	}
	else
	{
		WeaponSpeedShoot1 = default.WeaponSpeedShoot1*NewSpeed;
		WeaponSpeedShoot2 = default.WeaponSpeedShoot2*NewSpeed;
	}
}

///////////////////////////////////////////////////////////////////////////////
// Throws like a dart.
//
// Only spawn them here in MP because the anim notify can't keep up
// when it plays so fast.
///////////////////////////////////////////////////////////////////////////////
function ProjectileFire()
{
	if(Level.Game == None
		|| !Level.Game.bIsSinglePlayer)
//		|| (Instigator != None
//			&& PersonController(Instigator.Controller) != None))
	{
		SpawnScissors(false);
	}
}

///////////////////////////////////////////////////////////////////////////////
// Play firing animation/sound/etc
// Set here that we want to reload after each throw
///////////////////////////////////////////////////////////////////////////////
simulated function PlayFiring()
{
	Super.PlayFiring();
	bForceReload=true;
}
simulated function PlayAltFiring()
{
	Super.PlayAltFiring();
	bForceReload=true;
}

///////////////////////////////////////////////////////////////////////////////
// Throws ricocheting scissors.
//
// Only spawn them here in MP because the anim notify can't keep up
// when it plays so fast.
///////////////////////////////////////////////////////////////////////////////
function ProjectileAltFire()
{
	if(Level.Game == None
		|| !Level.Game.bIsSinglePlayer)
		SpawnScissors(true);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function PlayReloading()
{
	PlayAnim('Load', WeaponSpeedReload, 0.05);

	P2MocapPawn(Instigator).PlayWeaponSwitch(self);
}

///////////////////////////////////////////////////////////////////////////////
// Called on client's side to make the gun fire
// Check here to throw out danger markers to let people know the gun has gone
// off.
///////////////////////////////////////////////////////////////////////////////
simulated function LocalFire()
{
	local P2Player P;

	bPointing = true;

	// Same as the one in P2Weapon, but we don't do the camera shake here
	// We make it shake when he throws

	if ( Affector != None )
		Affector.FireEffect();
	PlayFiring();
}

///////////////////////////////////////////////////////////////////////////////
// Same as above.. we don't want the shake here
///////////////////////////////////////////////////////////////////////////////
simulated function LocalAltFire()
{
	local PlayerController P;

	bPointing = true;

	// Same as the one in P2Weapon, but we don't do the camera shake here
	// We make it shake when he throws

	if ( Affector != None )
		Affector.FireEffect();
	PlayAltFiring();
}

///////////////////////////////////////////////////////////////////////////////
// Tell ammo to make this scissors type
///////////////////////////////////////////////////////////////////////////////
function SpawnScissors(bool bMakeSpinner)
{
	local vector HitLocation, HitNormal, StartTrace, EndTrace, X,Y,Z;
	local actor Other;
	local ScissorsProjectile sic;
	local P2Player p2p;

	if(AmmoType != None
		&& AmmoType.HasAmmo())
	{
		GetAxes(Instigator.GetViewRotation(),X,Y,Z);
		StartTrace = GetFireStart(X,Y,Z);
		AdjustedAim = Instigator.AdjustAim(AmmoType, StartTrace, 2*AimError);
		if(bMakeSpinner)
		{
			TurnOffHint();
			sic = spawn(class'ScissorsAltProjectile',Instigator,,StartTrace, AdjustedAim);
		}
		else
			sic = spawn(class'ScissorsProjectile',Instigator,,StartTrace, AdjustedAim);
		// Make sure it got made
		if(sic != None)
			P2AmmoInv(AmmoType).UseAmmoForShot();

		// Shake the view when you throw it
		if ( Instigator != None)
		{
			p2p = P2Player(Instigator.Controller);
			if (p2p!=None)
			{
				p2p.ClientShakeView(ShakeRotMag, ShakeRotRate, ShakeRotTime,
							ShakeOffsetMag, ShakeOffsetRate, ShakeOffsetTime);
			}
		}
	}
	// Turn off the thing in his hand as it leaves
	if(ThirdPersonActor != None)
		ThirdPersonActor.bHidden=true;
}

///////////////////////////////////////////////////////////////////////////////
// Throw the scissors like a dart
//
// Because the animation is played much more slowly in SP allow the
// notify to throw the scissors. In MP spawn them at the start
// of the animation
///////////////////////////////////////////////////////////////////////////////
simulated function Notify_ThrowScissors()
	{
	if(Level.Game != None
		&& Level.Game.bIsSinglePlayer)
		{
			SpawnScissors(false);
		}
	}

///////////////////////////////////////////////////////////////////////////////
// Throw the scissors like a bouncing, spinning blade
//
// Because the animation is played much more slowly in SP allow the
// notify to throw the scissors. In MP spawn them at the start
// of the animation
///////////////////////////////////////////////////////////////////////////////
simulated function Notify_AltThrowScissors()
	{
	if(Level.Game != None
		&& Level.Game.bIsSinglePlayer)
		SpawnScissors(true);
	}

/** Subclassed so we restore the original speed in Enhanced mode if dropped */
function DropFrom(vector StartLocation) {
    local bool bEnhancedMode;

    bEnhancedMode = P2GameInfoSingle(Level.Game).VerifySeqTime();	

    if (bEnhancedMode && P2MoCapPawn(Owner) != none && Pawn(Owner).Controller.bIsPlayer)
	{
		if (P2GameInfoSingle(Level.Game).TheGameState.bSonicBoom)
			P2MoCapPawn(Owner).GroundSpeedMult = SONIC_SPEED;
		else
			P2MoCapPawn(Owner).GroundSpeedMult = 1.0;
	}

    super.DropFrom(StartLocation);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Idle
//////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Idle
{
	///////////////////////////////////////////////////////////////////////////////
	// Make sure you're attachment is visible on idle start
	///////////////////////////////////////////////////////////////////////////////
	function BeginState()
	{
		local bool bEnhancedMode;

        bEnhancedMode = P2GameInfoSingle(Level.Game).VerifySeqTime();

        /** Need to do this here just in case the player doesn't put down the
         * scissors while they're still being brought up, which means the
         * enhanced speed stays
         */
    if (bEnhancedMode && P2MoCapPawn(Owner) != none && Pawn(Owner).Controller.bIsPlayer)
	{
		if (P2GameInfoSingle(Level.Game).TheGameState.bSonicBoom)
			P2MoCapPawn(Owner).GroundSpeedMult = SONIC_SPEED * EnhancedSpeedMult;
		else
			P2MoCapPawn(Owner).GroundSpeedMult = EnhancedSpeedMult;
	}

        Super.BeginState();
		if(ThirdPersonActor != None)
			ThirdPersonActor.bHidden=false;

		// Kamek 4-28
		if (PlayerController(Pawn(Owner).Controller) != None)
		{
			LastLocation = Owner.Location;
			SetTimer(1.0, true);
		}
	}

	///////////////////////////////////////////////////////////////////////////////
	// Kamek 4-28
	// Timer - check how far we've traveled and record it for the RWS achievement
	///////////////////////////////////////////////////////////////////////////////
	event Timer()
	{
		local vector NewLocation;
		local float Dist;
		local float MilesTraveled;

		// Find out how far we've moved and record it.
		NewLocation = Owner.Location;
		Dist = VSize(NewLocation - LastLocation);
		MilesTraveled = Dist / UNREAL_UNITS_PER_MILE;
		LastLocation = NewLocation;
		//log(self@Dist@"UU's traveled - miles"@MilesTraveled,'Debug');

		// and let the achievement manager know
		if(Level.NetMode != NM_DedicatedServer ) PlayerController(Pawn(Owner).Controller).GetEntryLevel().GetAchievementManager().UpdateStatFloat(PlayerController(Pawn(Owner).Controller),'RunningWithScissors',MilesTraveled,True);
	}
	function EndState()
	{
		Super.EndState();
		SetTimer(0, false);
	}
}

state Active
{
    /** Subclassed to apply the enhanced mode speed while the scissors are
     * still being brought up
     */
    function BeginState() {
        local bool bEnhancedMode;

        bEnhancedMode = P2GameInfoSingle(Level.Game).VerifySeqTime();

    if (bEnhancedMode && P2MoCapPawn(Owner) != none && Pawn(Owner).Controller.bIsPlayer)
	{
		if (P2GameInfoSingle(Level.Game).TheGameState.bSonicBoom)
			P2MoCapPawn(Owner).GroundSpeedMult = SONIC_SPEED * EnhancedSpeedMult;
		else
			P2MoCapPawn(Owner).GroundSpeedMult = EnhancedSpeedMult;
	}

        super.BeginState();
    }

    /** Subclassed so we restore the speed just in case the weapon is put down
     * while it's still being brought up
     */
    function EndState() {
        local bool bEnhancedMode;

        bEnhancedMode = P2GameInfoSingle(Level.Game).VerifySeqTime();

    if (bEnhancedMode && P2MoCapPawn(Owner) != none && Pawn(Owner).Controller.bIsPlayer)
	{
		if (P2GameInfoSingle(Level.Game).TheGameState.bSonicBoom)
			P2MoCapPawn(Owner).GroundSpeedMult = SONIC_SPEED;
		else
			P2MoCapPawn(Owner).GroundSpeedMult = 1.0;
	}

        super.EndState();
    }
}

state DownWeapon
{
    /** Subclassed so if we do play the PutDown animation, we still take away
     * the enhanced speed
     */
    function BeginState() {
        local bool bEnhancedMode;

        bEnhancedMode = P2GameInfoSingle(Level.Game).VerifySeqTime();

    if (bEnhancedMode && P2MoCapPawn(Owner) != none && Pawn(Owner).Controller.bIsPlayer)
	{
		if (P2GameInfoSingle(Level.Game).TheGameState.bSonicBoom)
			P2MoCapPawn(Owner).GroundSpeedMult = SONIC_SPEED;
		else
			P2MoCapPawn(Owner).GroundSpeedMult = 1.0;
	}

        super.BeginState();
    }
}

// xPatch: Make sure that this gun is not extension!
function bool CanSwapHands()
{
	return (Class == Class'ScissorsWeapon');
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    WeaponSpeedShoot1MP=6.0000000
    WeaponSpeedShoot2MP=5.0000000
    EnhancedSpeedMult=1.5000000
    bUsesAltFire=true
    ViolenceRank=1
    RecognitionDist=300.0000000
    ShotCountMaxForNotify=0
    holdstyle=8
    switchstyle=8
    firingstyle=8
    bThrownByFiring=true
    NoAmmoChangeState="EmptyDownWeapon"
    ShakeOffsetTime=0.0000000
    bAllowHints=true
    bShowHints=true
    HudHint1="%KEY_AltFire% throws"
    HudHint2="ricocheting scissors."
    bBumpStartsFight=false
    CombatRating=1.8000000
    FirstPersonMeshSuffix="Scissors"
    WeaponSpeedLoad=1.2500000
    WeaponSpeedReload=5.0000000
    WeaponSpeedHolster=1.5000000
    WeaponSpeedShoot1Rand=0.0500000
    WeaponSpeedShoot2Rand=0.0500000
    AltFireSound=Sound'WeaponSounds.scissors_fire2'
    bDropInVeteranMode=1
    VeteranModeDropChance=1.0000000
    bAllowMiddleFinger=true
    OldMesh=SkeletalMesh'FP_Weapons.FP_Dude_Scissors'
    AmmoName=Class'ScissorsAmmoInv'
    AutoSwitchPriority=6
    FireOffset=(X=15.0000000,Y=5.0000000,Z=-5.0000000)
    ShakeRotMag=(X=200.0000000,Y=30.0000000,Z=30.0000000)
    ShakeRotRate=(X=3000.0000000,Y=5000.0000000,Z=5000.0000000)
    ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    TraceAccuracy=0.1000000
    aimerror=500.0000000
    MaxRange=1024.0000000
    FireSound=Sound'WeaponSounds.scissors_fire1'
    InventoryGroup=7
    GroupOffset=2
    PickupClass=Class'ScissorsPickup'
    PlayerViewOffset=(X=2.0000000,Y=0.0000000,Z=-13.0000000)
    BobDamping=1.1200000
    AttachmentClass=Class'ScissorsAttachment'
    ItemName="Scissors"
    Mesh=SkeletalMesh'MP_Weapons.MP_LS_Scissors'
    Skins[0]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
}