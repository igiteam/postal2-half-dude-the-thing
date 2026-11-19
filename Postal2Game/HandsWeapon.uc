///////////////////////////////////////////////////////////////////////////////
// HandsWeapon
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//
// Hands weapon--that is, no weapon
//
// Hands used to play LookEmpty when you pressed fire to show the player that
// his hands were out and he hand no weapon. That confused people into thinking
// they could do something with their hands, so it was removed.
//
///////////////////////////////////////////////////////////////////////////////

class HandsWeapon extends P2Weapon;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////

// Simple struct to group inventory classes with the items they use
struct SItem
	{
	var Class		ItemClass;
	var PeoplePart	Item;
	};

var array<SItem>		MyItems;			// array of items
var PeoplePart			CurrentItem;		// current item
var Name				CurrentUpAnim;
var Name				CurrentIdleAnim;
var Name				CurrentDownAnim;
var Sound				CurrentDialog;

///////////////////////////////////////////////////////////////////////////////
// Disable hint if we can't use middle finger
///////////////////////////////////////////////////////////////////////////////
function PostBeginPlay()
{
	Super.PostBeginPlay();
	if(UsingOldHands() || !Level.Game.bIsSinglePlayer)
		TurnOffHint();
}

///////////////////////////////////////////////////////////////////////////////
// Mp only can you gesture
///////////////////////////////////////////////////////////////////////////////
function ServerFire()
{
	if(!Level.Game.bIsSinglePlayer)
	{
		P2MocapPawn(Instigator).ServerFollowMe();
		PlayFiring();
		GotoState('NormalFire');
	}
}
function ServerAltFire()
{
	if(!Level.Game.bIsSinglePlayer)
	{
		P2MocapPawn(Instigator).ServerStayHere();

		bAltFiring=true;

		PlayAltFiring();
		GotoState('NormalFire');
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function Fire( float Value )
{
	if(P2MocapPawn(Instigator) != None
		&& Bot(Instigator.Controller) == None
		&& (Level.Game == None
			|| !Level.Game.bIsSinglePlayer))
	{
		ServerFire();
		if ( Role < ROLE_Authority )
		{
			PlayFiring();
			GotoState('ClientFiring');
		}
	}
	else // xPatch: Middle Finger is now shown by "firing" the hands.
	{	
		if (P2Player(Instigator.Controller) != None && !UsingOldHands())
			P2Player(Instigator.Controller).FlipMiddleFinger();
	}
	
	TurnOffHint();
}

function bool UsingOldHands()
{
	return 	(P2GameInfoSingle(Level.Game).InClassicMode() 
				&& P2GameInfoSingle(Level.Game).xManager.bClassicHands);
}

simulated function AltFire( float Value )
{
	if(P2MocapPawn(Instigator) != None
		&& Bot(Instigator.Controller) == None
		&& (Level.Game == None
			|| !Level.Game.bIsSinglePlayer))
	{
		ServerAltFire();
		if ( Role < ROLE_Authority )
		{
			PlayAltFiring();
			GotoState('ClientFiring');
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Play firing animation/sound/etc
///////////////////////////////////////////////////////////////////////////////
simulated function PlayFiring()
{
	if(Level.Game == None
			|| !Level.Game.bIsSinglePlayer)
		PlayAnim('Point', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()), 0.05);
	// Added by Man Chrzan: xPatch 2.0
	// Paradise Lost "Fuck You" feature backport!
	else
		PlayAnim('pl_fuckyou', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()), 0.05);
}
simulated function PlayAltFiring()
{
	if(Level.Game == None
			|| !Level.Game.bIsSinglePlayer)
		PlayAnim('Stay', WeaponSpeedShoot2 + (WeaponSpeedShoot1Rand*FRand()), 0.05);
	// Added by Man Chrzan: xPatch 2.0
	// Paradise Lost "Fuck You" feature backport!
	else
		PlayAnim('pl_fuckyoutwice', WeaponSpeedShoot2 + (WeaponSpeedShoot1Rand*FRand()), 0.05);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function ClientIdleCheckFire()
{
	// STUB this out--no need for continuous fire
}

///////////////////////////////////////////////////////////////////////////////
// Bring up the item, then hold the item, then put it down.
///////////////////////////////////////////////////////////////////////////////
state BringUpItem
	{
	ignores Fire, AltFire, AnimEnd;

Begin:
	PlayBringUpItem();
	FinishAnim();
	Sleep(PlayHoldItem());
	PlayPutDownItem();
	// Let the normal fire state wrap things up (when anim ends)
	GotoState('NormalFire');
	}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
//simulated function name GetPlaySelectAnim()
//{
//	return 'LookEmpty';
//}

///////////////////////////////////////////////////////////////////////////////
// Bring up the item
///////////////////////////////////////////////////////////////////////////////
simulated function PlayBringUpItem()
	{
	PlayAnim(CurrentUpAnim, WeaponSpeedShoot1, 0.05);
	}

///////////////////////////////////////////////////////////////////////////////
// Hold the item
///////////////////////////////////////////////////////////////////////////////
simulated function float PlayHoldItem()
	{
	LoopAnim(CurrentIdleAnim, WeaponSpeedShoot1);
	Instigator.PlayOwnedSound(CurrentDialog);
	return GetSoundDuration(CurrentDialog);
	}

///////////////////////////////////////////////////////////////////////////////
// Put down the item
///////////////////////////////////////////////////////////////////////////////
simulated function PlayPutDownItem()
	{
	PlayAnim(CurrentDownAnim, WeaponSpeedShoot1, 0.05);
	}

///////////////////////////////////////////////////////////////////////////////
// Stub these two out so the hands can't 'fire'
///////////////////////////////////////////////////////////////////////////////
function TraceFire( float Accuracy, float YOffset, float ZOffset );
function ProjectileFire();

///////////////////////////////////////////////////////////////////////////////
// Get the item for the hands to hold (based on specified inventory item)
///////////////////////////////////////////////////////////////////////////////
function PeoplePart GetItem(P2PowerupInv inv)
	{
	local PeoplePart item;
	local StaticMesh ItemMesh;
	local int i;

	// Rather than spawning a new item each time (too slow) we check a list of
	// previously spawned items and see if the necessary item already exists.
	for (i = 0; i < MyItems.Length; i++)
		{
		if (MyItems[i].ItemClass == inv.class)
			{
			item = MyItems[i].Item;
			break;
			}
		}

	// If the item doesn't already exist then spawn it now and add it to the list
	if (item == None)
		{
		if (inv.PickupClass != None)
			{
			ItemMesh = inv.PickupClass.default.StaticMesh;
			if (ItemMesh != None)
				{
				item = spawn(class'PeoplePart');
				if (item != None)
					{
					item.SetStaticMesh(ItemMesh);
					item.SetDrawType(DT_StaticMesh);
					item.SetDrawScale(0.1);

					// Add to list
					i = MyItems.Length;
					MyItems.insert(i, 1);
					MyItems[i].ItemClass = inv.class;
					MyItems[i].Item = item;
					}
				}
			}
		}

	return item;
	}
	
///////////////////////////////////////////////////////////////////////////////
// If there's a current item, unattach it and hide it
///////////////////////////////////////////////////////////////////////////////
function PutAwayItem()
	{
	if (CurrentItem != None)
		{
		DetachFromBone(CurrentItem);
		CurrentItem.bHidden = true;
		CurrentItem = None;
		}
	}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Weapon is up and ready to fire, but not firing.
// extends original, to keep track of shot count
// Uses the same code below it's Begin:, except we use HasAmmoFinished for
// special weapons (like the shocker) that never want to switch, but need
// to recharge eventually.
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Idle
{
	///////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////
	function EndState()
	{
		Super.EndState();
		// Bring them back out when needed to do anything
		bStasis=false;
	}

	///////////////////////////////////////////////////////////////////////////////
	// Reset shot count if you're not still firing
	///////////////////////////////////////////////////////////////////////////////
	function BeginState()
	{
		Super.BeginState();
		// Put hands into stasis.. they don't need to animate
		bStasis=true;
	}
Begin:
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state NormalFire
{
	function Fire(float F) {}
	function AltFire(float F) {} 
	function ServerFire() {}
	function ServerAltFire() {} 
}

state ClientFiring
{
	function Fire(float F) {}
	function AltFire(float F) {} 
	function ServerFire() {}
	function ServerAltFire() {} 
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    bUsesAltFire=true
    bArrestableWeapon=true
    bNoHudReticle=true
    ShakeOffsetTime=0.0000000
    DropWeaponHint1="They've seen your weapon!"
    DropWeaponHint2="Press %KEY_ThrowWeapon% to drop it."
    bBumpStartsFight=false
    CombatRating=0.5000000
    FirstPersonMeshSuffix="pl_fuckyou_arms"
    WeaponsPackageStr="FUArms"
    WeaponSpeedLoad=2.0000000
    WeaponSpeedReload=1.5000000
    WeaponSpeedHolster=5.0000000
    WeaponSpeedShoot1=0.8000000
    WeaponSpeedShoot2=0.8000000
    bCannotBeStolen=true
    AmmoName=Class'HandsAmmoInv'
    bCanThrow=false
    AutoSwitchPriority=0
    ShakeRotMag=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ShakeRotRate=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ShakeRotTime=0.0000000
    ShakeOffsetMag=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    ShakeOffsetRate=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    aimerror=0.0000000
    AIRating=0.0400000
    SelectSound=none
    InventoryGroup=0
    GroupOffset=2
    BobDamping=0.9750000
    AttachmentClass=none
    ItemName="Hands"
    Mesh=SkeletalMesh'FUArms.pl_fuckyou_arms'
    Skins[0]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
}