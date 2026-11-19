//=============================================================================
// AWMilitary
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
//=============================================================================
class AWMilitary extends AWAuthorityFigure
	placeable;

function PreBeginPlay()
	{
	Super.PreBeginPlay();

	// Do this here because we can't use enums in default properties
	ChameleonOnlyHasGender = Gender_Male;
	}

function PostBeginPlay()
	{
	Super.PostBeginPlay();

	Cowardice=0.0;
	}

// Moved to P2Pawn/GameState
/*
///////////////////////////////////////////////////////////////////////////////
// Record pawn dead, if player killed them
///////////////////////////////////////////////////////////////////////////////
function Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	if(P2GameInfoSingle(Level.Game) != None
		&& P2GameInfoSingle(Level.Game).TheGameState != None
		&& Killer != None
		&& Killer.bIsPlayer)
	{
		// Record him dying as military
		AWGameState(P2GameInfoSingle(Level.Game).TheGameState).ArmyKilled++;
	}

	Super.Died(Killer, damageType, HitLocation);
}
*/


// Decompiled with UE Explorer.
defaultproperties
{
    StumpClass=Class'BasePeople.StumpBigGuy'
    LimbClass=Class'BasePeople.LimbBigGuy'
    TakesSledgeDamage=0.0000000
    TakesDervishDamage=0.5000000
    bRandomizeHeadScale=false
    Boltons[0]=(Bone="NODE_Parent",StaticMesh=StaticMesh'Boltons.Swat_Helmet',Skin=Texture'BoltonSkins.Military_Helmet',bAttachToHead=true)
    Boltons[1]=(Bone="MALE01 spine1",StaticMesh=StaticMesh'Boltons.Military_Pack')
    ChameleonSkins=/* Array type was not detected. */
    BlockMeleeFreq=0.9000000
    bNoChamelBoltons=true
    Psychic=0.3000000
    Champ=0.5000000
    Cajones=0.7000000
    Glaucoma=0.6500000
    Rat=1.0000000
    Compassion=0.3000000
    WarnPeople=0.3000000
    Conscience=0.3000000
    Beg=0.0500000
    PainThreshold=0.8000000
    Reactivity=0.5000000
    Rebel=1.0000000
    WillDodge=0.2000000
    WillUseCover=0.2000000
    Stomach=0.9000000
    TakesShotgunHeadShot=0.4000000
    TakesShovelHeadShot=0.6000000
    TakesOnFireDamage=0.6000000
    TakesAnthraxDamage=0.5000000
    TakesShockerDamage=0.4000000
    Fitness=0.7000000
    DialogClass=Class'BasePeople.DialogMaleMilitary'
    BaseEquipment=/* Array type was not detected. */
    ViolenceRankTolerance=0
    TakesChemDamage=0.5000000
    HealthMax=130.0000000
    Gang="Military"
    AttackRange=(Min=256.0000000,Max=4096.0000000)
    ControllerClass=Class'AWMilitaryController'
    ActorID="Soldier"
    Mesh=SkeletalMesh'Characters.Big_M_LS_Pants'
    Skins[0]=Texture'ChameleonSkins.Military.XX__152__Big_M_LS_Pants'
}