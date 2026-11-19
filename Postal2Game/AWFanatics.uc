///////////////////////////////////////////////////////////////////////////////
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
// Fanatics. One of the groups to end up hating the dude.
//
///////////////////////////////////////////////////////////////////////////////
class AWFanatics extends AWBystander
	placeable;

function PreBeginPlay()
	{
	Super.PreBeginPlay();

	// Do this here because we can't use enums in default properties
	ChameleonOnlyHasGender = Gender_Male;
	}

///////////////////////////////////////////////////////////////////////////////
// Record pawn dead, if player killed them
///////////////////////////////////////////////////////////////////////////////
function Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	// Moved to P2Pawn/GameState
	/*
	if(P2GameInfoSingle(Level.Game) != None
		&& P2GameInfoSingle(Level.Game).TheGameState != None
		&& Killer != None
		&& Killer.bIsPlayer)
	{
		// Record him dying as a fanatic
		AWGameState(P2GameInfoSingle(Level.Game).TheGameState).FanaticsKilled++;
	}
	*/

	// use DudeSuicideDamage now instead of trying to hunt down a possibly-invalid Killer.
	if (damageType == class'DudeSuicideDamage')
	{
		if( Level.NetMode != NM_DedicatedServer ) P2GameInfoSingle(Level.Game).GetPlayer().GetEntryLevel().EvaluateAchievement(P2Player(Killer),'ReversePsychology');
	}

	Super.Died(Killer, damageType, HitLocation);
}


// Decompiled with UE Explorer.
defaultproperties
{
    bPants=true
    bAllowRandomGuns=true
    bIsTrained=true
    ChameleonSkins=/* Array type was not detected. */
    ChamelHeadSkins=/* Array type was not detected. */
    BlockMeleeFreq=0.6000000
    RandomizedBoltons=/* Array type was not detected. */
    Cajones=1.0000000
    Glaucoma=0.7000000
    PainThreshold=1.0000000
    Rebel=1.0000000
    Stomach=0.9000000
    TalkWhileFighting=0.0000000
    TakesShotgunHeadShot=0.4000000
    TakesShovelHeadShot=0.5000000
    TakesOnFireDamage=0.1000000
    TakesAnthraxDamage=0.7000000
    TakesShockerDamage=0.2000000
    TalkBeforeFighting=0.0000000
    DialogClass=Class'BasePeople.DialogHabib'
    BaseEquipment=/* Array type was not detected. */
    ViolenceRankTolerance=1
    HealthMax=80.0000000
    Gang="Fanatics"
    ControllerClass=Class'AWBystanderController'
    ActorID="Terrorist"
    Mesh=SkeletalMesh'Characters.Avg_Dude'
    Skins[0]=Texture'ChameleonSkins.Fanatic.XX__147__Avg_Dude'
}