//=============================================================================
// RWSStaff.uc
// Copyright 2001 Running With Scissors, Inc.  All Rights Reserved.
//
// Base class for all RWS staff members.
//
//=============================================================================
class AWRWSStaff extends AWBystander
	notplaceable
	Abstract;


// Decompiled with UE Explorer.
defaultproperties
{
    TakesSledgeDamage=0.1000000
    TakesMacheteDamage=0.1000000
    TakesScytheDamage=0.1000000
    TakesZombieSmashDamage=0.3000000
    bAllowRandomGuns=true
    bRandomizeHeadScale=false
    bIsTrained=true
    ChameleonSkins=/* Array type was not detected. */
    bLookForZombies=true
    BlockMeleeFreq=1.0000000
    RandomizedBoltons=/* Array type was not detected. */
    bStartupRandomization=false
    Psychic=0.4000000
    Cajones=1.0000000
    Glaucoma=0.3000000
    PainThreshold=1.0000000
    Rebel=1.0000000
    Stomach=1.0000000
    TakesShotgunHeadShot=0.2500000
    TakesShovelHeadShot=0.3500000
    TakesOnFireDamage=0.4000000
    TakesAnthraxDamage=0.5000000
    TakesShockerDamage=0.3000000
    BaseEquipment=/* Array type was not detected. */
    ViolenceRankTolerance=0
    TakesChemDamage=0.6000000
    HealthMax=200.0000000
    bPlayerIsFriend=true
    Gang="RWSStaff"
    DamageMult=2.5000000
    FriendDamageThreshold=170.0000000
    ControllerClass=Class'AWRWSController'
    ActorID="RWSWorker"
    Mesh=SkeletalMesh'Characters.Avg_M_SS_Shorts'
    Skins[0]=Texture'ChameleonSkins2.rws.XX__204__Avg_M_SS_Shorts'
}