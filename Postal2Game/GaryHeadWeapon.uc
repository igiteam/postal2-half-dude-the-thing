///////////////////////////////////////////////////////////////////////////////
// GaryHeadWeapon
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
///////////////////////////////////////////////////////////////////////////////

class GaryHeadWeapon extends P2Weapon;

///////////////////////////////////////////////////////////////////////////////
// Vars, structs, consts
///////////////////////////////////////////////////////////////////////////////
var class<GaryHeadProjectile> FireProjClass;
var class<GaryHeadProjectile> AltFireProjClass;
var bool bRemoved;

const FIRE_DELAY	=	0.5;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function RemoveMe()
{
	if(!bRemoved)
	{
		// Change by NickP: MP fix
		if(Level.NetMode == NM_Standalone)
		{
		// End
			Instigator.Weapon = None;
			if(P2Player(Instigator.Controller) != None)
				P2Player(Instigator.Controller).SwitchToThisWeapon(P2Pawn(Instigator).HandsClass.default.InventoryGroup, 
							P2Pawn(Instigator).HandsClass.default.GroupOffset, true);	

			Instigator.DeleteInventory(self);
			bRemoved=true;
			Destroy();
		// Change by NickP: MP fix
		}
		else
		{
			if( P2Player(Instigator.Controller) != None )
				P2Player(Instigator.Controller).ClientSwitchToHands(true); 

			bRemoved=true;
			Instigator.DeleteInventory(self);
			SetOwner(Instigator);
			LifeSpan = 1.1;
		}
		// End
	}
}

// Added by Man Chrzan:
// Same as above but we don't switch to hands.
function RemoveMe2()
{
	if(!bRemoved)
	{
		if(Level.NetMode == NM_Standalone)
		{
			Instigator.DeleteInventory(self);
			bRemoved=true;
			Destroy();
		}
		else
		{
			bRemoved=true;
			Instigator.DeleteInventory(self);
			SetOwner(Instigator);
			LifeSpan = 1.1;
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function Fire( float Value )
{
	if(P2MocapPawn(Instigator) != None
		&& Bot(Instigator.Controller) == None)
	{
		ServerFire();
		if ( Role < ROLE_Authority )
		{
			PlayFiring();
			GotoState('ClientFiring');
		}
	}
}
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
simulated function AltFire( float Value )
{
	if(P2MocapPawn(Instigator) != None
		&& Bot(Instigator.Controller) == None)
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
	PlayAnim('Point', WeaponSpeedShoot1 + (WeaponSpeedShoot1Rand*FRand()), 0.05);
}
simulated function PlayAltFiring()
{
	PlayAnim('Point', WeaponSpeedShoot2 + (WeaponSpeedShoot1Rand*FRand()), 0.05);
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function ProjectileFire()
{
}
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function ProjectileAltFire()
{
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
function SpawnHead(bool bSeeking)
{
	local vector HitLocation, HitNormal, StartTrace, EndTrace, X,Y,Z;
	local actor Other;
	local GaryHeadProjectile ghp;
	local P2Player p2p;
	
	if(AmmoType != None
		&& AmmoType.HasAmmo())
	{
		GetAxes(Instigator.GetViewRotation(),X,Y,Z);
		StartTrace = GetFireStart(X,Y,Z); 
		AdjustedAim = Instigator.AdjustAim(AmmoType, StartTrace, 2*AimError);	
		if(bSeeking)
		{
			TurnOffHint();
			ghp = spawn(AltFireProjClass,Instigator,,StartTrace, AdjustedAim);
		}
		else
			ghp = spawn(FireProjClass,Instigator,,StartTrace, AdjustedAim);

		ghp.PrepVelocity(ghp.Speed*vector(AdjustedAim));
		if(GaryHeadHomingProjectile(ghp) != None)
			GaryHeadHomingProjectile(ghp).FindTarget();

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
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state NormalFire
{
Begin:
	Sleep(FIRE_DELAY);
	SpawnHead(bAltFiring);
}

///////////////////////////////////////////////////////////////////////////////
// Default properties
///////////////////////////////////////////////////////////////////////////////


// Decompiled with UE Explorer.
defaultproperties
{
    FireProjClass=Class'GaryHeadBurnProjectile'
    AltFireProjClass=Class'GaryHeadHomingProjectile'
    bUsesAltFire=true
    ViolenceRank=9
    ShakeOffsetTime=0.0000000
    DropWeaponHint1=""
    CombatRating=0.5000000
    FirstPersonMeshSuffix="Nothing"
    WeaponSpeedLoad=2.0000000
    WeaponSpeedReload=1.5000000
    WeaponSpeedHolster=5.0000000
    WeaponSpeedShoot1=0.9500000
    WeaponSpeedShoot2=0.8000000
    AmmoName=Class'GaryHeadAmmoInv'
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
    GroupOffset=5
    BobDamping=0.9750000
    AttachmentClass=none
    ItemName="Gary Heads"
    Mesh=SkeletalMesh'MP_Weapons.MP_LS_Nothing'
    Skins[0]=Texture'MP_FPArms.LS_arms.LS_hands_dude'
}