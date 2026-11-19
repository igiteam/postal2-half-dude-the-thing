//=============================================================================
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//=============================================================================
class AWGary extends AWBystander
	placeable;

var float DissolveTime;				// Actual time we bubble for when dissolving
var float DissolveRate;				// DissolveRate*DeltaTime is subtracted from the scale each time
									// so have the time this takes be about the same as DissolveTime
var float MinDissolveSize;
var class<ZDissolvePuddle> dissolveclass;
var Sound DissolveSound;			// sound we make as we dissolve
//var Texture RealSkin;				// for some 

const BONE_LCALF			= 'MALE01 l calf';

const WAIT_FOR_DISSOLVE_TIME	=	3.0;
const XY_DISSOLVE_RATIO			=	0.5;

///////////////////////////////////////////////////////////////////////////////
// PawnSpawner sets some things for you
// The spawer can set the skin of the thing spawned. If they set a specific
// skin, then make sure we go through and set all the gender/race attributes
// associated with this specific skin. Reinit the head once we got the new
// skin.
//
// Garys will have crazy skins put on them, but they *don't* want the chameleon
// code to work for them, so grab the skins out, and then None them in the
// spawn so P2MocapPawn doesn't try to use the chameleon code on him.
///////////////////////////////////////////////////////////////////////////////
function InitBySpawner(PawnSpawner initsp)
{
	local Material usebodyskin, useheadskin;

	usebodyskin = initsp.SpawnSkin;
	useheadskin = AWPawnSpawner(initsp).SpawnHeadSkin;
	// Set up skin for body
	if(usebodyskin != None)
		Skins[0]			= usebodyskin;
	// Blank it out so the chameleon won't use it
	initsp.SpawnSkin	= None;
	// Set up skin for head
	if(useheadskin != None)
	{
		MyHead.Skins[0]		= useheadskin;
		HeadSkin			= useheadskin;
	}
	// Blank it out so the chameleon won't use it
	AWPawnSpawner(initsp).SpawnHeadSkin = None;

	Super.InitBySpawner(initsp);

	// Restore textures for next spawned guy to use!
	initsp.SpawnSkin	= usebodyskin;
	AWPawnSpawner(initsp).SpawnHeadSkin = useheadskin;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Dying
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Dying
{
	///////////////////////////////////////////////////////////////////////////////
	// Allow no more interaction
	///////////////////////////////////////////////////////////////////////////////
	function TakeDamage( int Damage, Pawn instigatedBy, Vector hitlocation, 
						Vector momentum, class<DamageType> damageType)
	{
		// Reset time to dissolve each time, if it gets moved significantly
		if(!ClassIsChildOf(damageType, class'BulletDamage')
			&& !ClassIsChildOf(damageType, class'BurnedDamage')
			&& !ClassIsChildOf(damageType, class'OnFireDamage')
			&& TimeTillDissolve > 0)
			SetTimer(TimeTillDissolve, false);

		Super.TakeDamage(Damage, instigatedBy, hitlocation, momentum, damageType);
	}
	///////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////
	function Timer()
	{
		GotoState('PrepForDissolving');
	}
	///////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////
	simulated function BeginState()
	{
		Super.BeginState();
		// reset the timer to do our bidding.. namely, make him dissolve after
		// a time
		if(TimeTillDissolve > 0)
			SetTimer(TimeTillDissolve, false);
	}
}


///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// PrepForDissolving
// Hold him to he doesn't move around for a few seconds first, before
// removing him
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state PrepForDissolving extends Dying
{
	ignores TakeDamage;
	///////////////////////////////////////////////////////////////////////////////
	// Do actual dissolve now
	///////////////////////////////////////////////////////////////////////////////
	function Timer()
	{
		GotoState('Dissolving');
	}
	///////////////////////////////////////////////////////////////////////////////
	// Turn off our collision with players/damage first
	///////////////////////////////////////////////////////////////////////////////
	function BeginState()
	{
		bBlockZeroExtentTraces=false;
		bBlockNonZeroExtentTraces=false;
		SetCollision(false, false, false);
		SetTimer(WAIT_FOR_DISSOLVE_TIME, false);
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Dissolving
// bubble effects play as I 'sink' into the ground
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Dissolving extends Dying
{
	ignores TakeDamage;
	///////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////
	function Tick(float DeltaTime)
	{
		local vector newd;
		newd = DrawScale3D;
		// shrink mostly up and down
		newd.z-=(DeltaTime*DissolveRate);
		// also shrink side to side, but less
		newd.x-=(DeltaTime*DissolveRate*XY_DISSOLVE_RATIO);
		newd.y-=(DeltaTime*DissolveRate*XY_DISSOLVE_RATIO);
		if(newd.z < MinDissolveSize)
			newd.z = MinDissolveSize;
		SetDrawScale3D(newd);
	}
	///////////////////////////////////////////////////////////////////////////////
	// Make him fall out of the world now
	///////////////////////////////////////////////////////////////////////////////
	function Timer()
	{
		GotoState('FallDissolve');
	}
	///////////////////////////////////////////////////////////////////////////////
	///////////////////////////////////////////////////////////////////////////////
	function MakeDissolvePuddle(vector loc)
	{
		local ZDissolvePuddle dissolver;
		local vector endpt, hitlocation, hitnormal;
		local Actor HitActor;

		// Trace down and find the ground first
		endpt = loc;
		endpt.z -= default.CollisionHeight;
		HitActor = Trace(HitLocation, HitNormal, endpt, loc, true);
		if(HitActor != None
			&& HitActor.bStatic)
		{
			loc = HitLocation;
		}
		// Set emitter at neck line
		dissolver = spawn(dissolveclass,self,,loc);
		dissolver.SetTimer(DissolveTime, false);
	}
	///////////////////////////////////////////////////////////////////////////////
	// Turn off our collision with players/damage first
	// Modify sound also
	///////////////////////////////////////////////////////////////////////////////
	function BeginState()
	{
		local coords usecoords;
		// How long we dissolve for
		SetTimer(DissolveTime, false);

		// Setup boiling sound
		AmbientSound=DissolveSound;
		SoundRadius=30;
		TransientSoundRadius=SoundRadius;
		SoundVolume=255;
		TransientSoundVolume=SoundVolume;
		SoundPitch=0.75;

		// Make effects to go with shrinking
		if(dissolveclass != None)
		{
			// Set emitter below neck line
			usecoords = GetBoneCoords(BONE_NECK);
			MakeDissolvePuddle(usecoords.origin);
			// Put one below pelvis too
			usecoords = GetBoneCoords(BONE_PELVIS);
			MakeDissolvePuddle(usecoords.origin);
			// If he's got a right calf, one for there too
			if(BoneArr[RIGHT_LEG] == 1)
			{
				usecoords = GetBoneCoords(BONE_RCALF);
				MakeDissolvePuddle(usecoords.origin);
			}
			// If he's got a left calf, one for there too
			if(BoneArr[LEFT_LEG] == 1)
			{
				usecoords = GetBoneCoords(BONE_LCALF);
				MakeDissolvePuddle(usecoords.origin);
			}
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// FallDissolve
// Sink into the ground
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state FallDissolve extends Dying
{
	ignores TakeDamage;
	///////////////////////////////////////////////////////////////////////////////
	// Delete me now if not already gone
	///////////////////////////////////////////////////////////////////////////////
	function Timer()
	{
		Destroy();
	}
	///////////////////////////////////////////////////////////////////////////////
	// Turn off world collision to make it fall
	///////////////////////////////////////////////////////////////////////////////
	function BeginState()
	{
		SetTimer(1.0, false);
		bCollideWorld=false;
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    DissolveTime=6.0000000
    DissolveRate=0.2000000
    MinDissolveSize=0.3000000
    dissolveclass=Class'AWEffects.ZDissolvePuddle'
    DissolveSound=Sound'LevelSounds.potBoil'
    StumpClass=Class'People.StumpGary'
    LimbClass=Class'People.LimbGary'
    TimeTillDissolve=10.0000000
    AW_SPMeshAnim=MeshAnimation'AWGary_Characters.animMini_AW'
    ExtraAnims=/* Array type was not detected. */
    PLAnims=MeshAnimation'Gary_Characters.animMini_PL'
    PLAnims_Fat=MeshAnimation'Gary_Characters.animMini_PL'
    PeeBody=Class'FX.UrineSmallBodyDrip'
    GasBody=Class'FX.GasSmallBodyDrip'
    HeadClass=Class'AWGaryHead'
    HeadSkin=Texture'AW_Characters.Zombie_Heads.Pygmy_head'
    HeadMesh=SkeletalMesh'heads.Gary'
    bRandomizeHeadScale=false
    AnimGroupUsed=-1
    CharacterType=4
    CoreMeshAnim=MeshAnimation'Gary_Characters.animMini'
    RandomizedBoltons=/* Array type was not detected. */
    bStartupRandomization=false
    Psychic=1.0000000
    Champ=0.9000000
    Cajones=1.0000000
    Temper=1.0000000
    Glaucoma=0.5000000
    Twitch=3.5000000
    Compassion=0.0000000
    WarnPeople=0.0000000
    Conscience=0.0000000
    Beg=0.0000000
    PainThreshold=1.0000000
    Reactivity=0.5000000
    Confidence=1.0000000
    Rebel=0.0000000
    Patience=0.5000000
    WillDodge=0.5000000
    WillKneel=0.0500000
    WillUseCover=0.9000000
    Talkative=0.2000000
    Stomach=1.0000000
    VoicePitch=1.3000000
    TalkWhileFighting=0.5000000
    TakesShotgunHeadShot=0.0500000
    TakesShovelHeadShot=0.1500000
    TakesOnFireDamage=0.2500000
    TakesAnthraxDamage=0.2500000
    TakesShockerDamage=0.1000000
    TakesPistolHeadShot=0.2500000
    TakesMachinegunDamage=0.3000000
    TalkBeforeFighting=1.0000000
    WeapChangeDist=500.0000000
    TwitchFar=3.5000000
    bHasRef=false
    DialogClass=Class'BasePeople.DialogGary'
    BaseEquipment=/* Array type was not detected. */
    TakesChemDamage=0.1000000
    HEAD_RATIO_OF_FULL_HEIGHT=0.1000000
    HealthMax=250.0000000
    bPlayerIsEnemy=true
    bPersistent=true
    bCanTeleportWithPlayer=false
    DamageMult=2.0000000
    bKeepForMovie=true
    ControllerClass=Class'AWBystanderController'
    ActorID="Gary"
    Mesh=SkeletalMesh'Gary_Characters.Mini_M_Jacket_Pants'
    Skins[0]=Texture'AW_Characters.Zombie_Skins.Pygmy_skin'
}