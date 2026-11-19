//=============================================================================
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//=============================================================================
class PhraudHogslop extends AWBystander
	placeable;

///////////////////////////////////////////////////////////////////////////////
// Take damage (pawn call) but also save who attacked me
///////////////////////////////////////////////////////////////////////////////
function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation,
						Vector momentum, class<DamageType> damageType)
{
	local int HealthOld;
	local int Diff;
	local P2PowerupInv MoneysInv;
	local Vector TossMom;
	
	HealthOld = Health;
	Super.TakeDamage(Damage, InstigatedBy, HitLocation, Momentum, DamageType);
	
	Diff = HealthOld - Health;
	if (Diff > 0)
	{
		// Make Phraud drop stacks of money every time he gets hit... because he's made of money
		// it's funny, laugh dammit!
		MoneysInv = Spawn(class'MoneyInv', Self);
		MoneysInv.AddAmount(Diff);
		TossMom = Normal(Momentum);
		TossThisInventory(TossMom, MoneysInv);
	}
}

/*
function Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	log(self@"killed by"@Killer@DamageType@HitLocation@"calling super",'Debug');
	Super.Died(Killer, DamageType, HitLocation);
}
*/

///////////////////////////////////////////////////////////////////////////////
// If I'm used for an errand, delete my seeking rockets when i die
// so that it doesnt mess up anything after (like a cinematic)
///////////////////////////////////////////////////////////////////////////////
function CheckForErrandCompleteOnDeath(Controller Killer)
{
	local LauncherSeekingProjectileTrad rkt;	

	if(bUseForErrands)
	{
		//log("used for errands",'Debug');
		// Phraud always triggers died early
		TriggerEvent(DIED_EARLY_EVENT, self, None);
		foreach AllActors(class'LauncherSeekingProjectileTrad', rkt)
		{
			if(rkt.Dropper == Controller)
				rkt.Destroy();
		}
	}

	Super.CheckForErrandCompleteOnDeath(Killer);
	//log("back from super",'Debug');
}


// Decompiled with UE Explorer.
defaultproperties
{
    TakesSledgeDamage=0.0100000
    TakesMacheteDamage=0.0100000
    TakesScytheDamage=0.0100000
    TakesDervishDamage=0.0100000
    TakesZombieSmashDamage=0.0100000
    HeadSkin=Texture'AW_Characters.Special.Phred'
    HeadMesh=SkeletalMesh'AW_Heads.AW_Fraud'
    bRandomizeHeadScale=false
    BlockMeleeFreq=1.0000000
    RandomizedBoltons=/* Array type was not detected. */
    bStartupRandomization=false
    Psychic=1.0000000
    Champ=0.9000000
    Cajones=1.0000000
    Temper=1.0000000
    Glaucoma=0.7000000
    Twitch=1.0000000
    Compassion=0.0000000
    WarnPeople=0.0000000
    Conscience=0.0000000
    Beg=0.0000000
    PainThreshold=1.0000000
    Reactivity=0.5000000
    Confidence=1.0000000
    Rebel=1.0000000
    Patience=0.5000000
    WillKneel=0.0500000
    WillUseCover=0.1000000
    Talkative=0.2000000
    Stomach=1.0000000
    TalkWhileFighting=0.2500000
    TakesShotgunHeadShot=0.0100000
    TakesRifleHeadShot=0.2000000
    TakesShovelHeadShot=0.1000000
    TakesOnFireDamage=0.2000000
    TakesAnthraxDamage=0.4000000
    TakesShockerDamage=0.1000000
    TakesPistolHeadShot=0.1500000
    TalkBeforeFighting=1.0000000
    WeapChangeDist=500.0000000
    bAdvancedFiring=true
    bHeadCanComeOff=false
    DialogClass=Class'DialogPhraud'
    BaseEquipment=/* Array type was not detected. */
    TakesChemDamage=0.3000000
    HealthMax=1000.0000000
    bPlayerIsEnemy=true
    bPersistent=true
    bCanTeleportWithPlayer=false
    bKeepForMovie=true
    ControllerClass=Class'AWBystanderController'
    ActorID="Phraud"
    Mesh=SkeletalMesh'Characters.Avg_M_LS_Pants'
    Skins[0]=Texture'AW_Characters.Special.Phred_Suit'
}