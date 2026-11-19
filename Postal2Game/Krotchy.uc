//=============================================================================
// Copyright 2001 Running With Scissors, Inc.  All Rights Reserved.
//=============================================================================
class Krotchy extends Bystander
	placeable;

// All we can do is scratch our mega-balls
simulated function name GetAnimIdle()
	{
	return 's_idle_crotch';
	}

function SetupHead()
	{
	Super.SetupHead();
	
	// Krotchy doesn't really want a head, so scale the head way down so it isn't seen
	if (myHead != None)
		myHead.SetDrawScale(0.1);
	}


// Decompiled with UE Explorer.
defaultproperties
{
    TakesSledgeDamage=0.0000000
    TakesMacheteDamage=0.0000000
    TakesScytheDamage=0.0000000
    TakesDervishDamage=0.0000000
    bNoDismemberment=true
    HeadSkin=Texture'ChamelHeadSkins.Male.MBA__013__AvgBrotha'
    HeadMesh=SkeletalMesh'heads.AvgBrotha'
    bRandomizeHeadScale=false
    AnimGroupUsed=-1
    RandomizedBoltons=/* Array type was not detected. */
    bStartupRandomization=false
    Psychic=1.0000000
    Champ=0.9000000
    Cajones=1.0000000
    Temper=1.0000000
    Glaucoma=0.4000000
    Twitch=1.0000000
    Compassion=0.0000000
    WarnPeople=0.0000000
    Conscience=0.0000000
    Beg=0.0000000
    PainThreshold=1.0000000
    Reactivity=0.5000000
    Confidence=1.0000000
    Rebel=0.0000000
    Patience=0.5000000
    WillKneel=0.0500000
    WillUseCover=0.1000000
    Talkative=0.2000000
    Stomach=1.0000000
    TalkWhileFighting=0.4000000
    TakesShotgunHeadShot=0.0000000
    TakesRifleHeadShot=0.0000000
    TakesShovelHeadShot=0.0000000
    TakesOnFireDamage=0.5000000
    TakesAnthraxDamage=0.0000000
    TakesShockerDamage=0.0000000
    TakesPistolHeadShot=0.0000000
    TakesMachinegunDamage=0.0000000
    TalkBeforeFighting=1.0000000
    WeapChangeDist=500.0000000
    bAdvancedFiring=true
    TwitchFar=3.0000000
    bHeadCanComeOff=false
    bHasRef=false
    DialogClass=Class'BasePeople.DialogKrotchy'
    BaseEquipment=/* Array type was not detected. */
    TakesChemDamage=0.0000000
    HealthMax=500.0000000
    bPersistent=true
    bCanTeleportWithPlayer=false
    bFriendWithAuthority=true
    bKeepForMovie=true
    ControllerClass=Class'AIPack.KrotchyController'
    ActorID="Krotchy"
    Mesh=SkeletalMesh'Krotchy_Characters.Krotchy'
    Skins[0]=Texture'ChameleonSkins.Special.Krotchy'
}