//=============================================================================
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//=============================================================================
class AWScaredGary extends AWBystander
	placeable;

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


// Decompiled with UE Explorer.
defaultproperties
{
    StumpClass=Class'People.StumpGary'
    LimbClass=Class'People.LimbGary'
    AW_SPMeshAnim=MeshAnimation'AWGary_Characters.animMini_AW'
    ExtraAnims=/* Array type was not detected. */
    PLAnims=MeshAnimation'Gary_Characters.animMini_PL'
    PLAnims_Fat=MeshAnimation'Gary_Characters.animMini_PL'
    PeeBody=Class'FX.UrineSmallBodyDrip'
    GasBody=Class'FX.GasSmallBodyDrip'
    HeadSkin=Texture'ChamelHeadSkins.Special.Gary'
    HeadMesh=SkeletalMesh'heads.Gary'
    bRandomizeHeadScale=false
    AnimGroupUsed=-1
    CharacterType=4
    CoreMeshAnim=MeshAnimation'Gary_Characters.animMini'
    RandomizedBoltons=/* Array type was not detected. */
    bStartupRandomization=false
    Psychic=0.0000000
    Champ=0.0100000
    Cajones=0.0100000
    Temper=0.0100000
    Glaucoma=0.5000000
    Twitch=3.5000000
    Compassion=0.0000000
    WarnPeople=0.0000000
    Conscience=0.0000000
    Beg=0.0000000
    PainThreshold=0.0100000
    Reactivity=0.5000000
    Confidence=1.0000000
    Rebel=0.0000000
    Patience=0.5000000
    WillDodge=0.5000000
    WillKneel=0.0500000
    WillUseCover=0.9000000
    Talkative=0.2000000
    Stomach=0.2000000
    TalkWhileFighting=0.0100000
    TakesShotgunHeadShot=0.0500000
    TakesShovelHeadShot=0.1500000
    TakesOnFireDamage=0.2500000
    TakesAnthraxDamage=0.2500000
    TakesShockerDamage=0.1000000
    TakesPistolHeadShot=0.2500000
    TakesMachinegunDamage=0.3000000
    TalkBeforeFighting=0.0100000
    TwitchFar=3.5000000
    bHasRef=false
    DialogClass=Class'DialogScaredGary'
    TakesChemDamage=0.1000000
    HEAD_RATIO_OF_FULL_HEIGHT=0.1000000
    HealthMax=250.0000000
    bPlayerIsEnemy=true
    bPersistent=true
    bCanTeleportWithPlayer=false
    bKeepForMovie=true
    ControllerClass=Class'AWScaredGaryController'
    ActorID="Gary"
    Mesh=SkeletalMesh'Gary_Characters.Mini_M_Jacket_Pants'
    Skins[0]=Texture'AW_Characters.Zombie_Skins.BattleDamageGary'
}