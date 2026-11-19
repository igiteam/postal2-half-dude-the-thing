///////////////////////////////////////////////////////////////////////////////
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
//  Country rednecks. They now run the dogpound in AW.
//
///////////////////////////////////////////////////////////////////////////////
class AWRednecks extends AWBystander
	placeable;


function PreBeginPlay()
	{
	Super.PreBeginPlay();

	// Do this here because we can't use enums in default properties
	ChameleonOnlyHasGender = Gender_Male;
	}


// Decompiled with UE Explorer.
defaultproperties
{
    bAllowRandomGuns=true
    ChameleonSkins=/* Array type was not detected. */
    bDogFriend=true
    RandomizedBoltons=/* Array type was not detected. */
    Cajones=0.8000000
    Glaucoma=0.8000000
    PainThreshold=0.9500000
    Rebel=1.0000000
    Stomach=0.9000000
    Greed=0.8000000
    TalkWhileFighting=0.3000000
    TalkBeforeFighting=0.5000000
    DialogClass=Class'BasePeople.DialogRedneck'
    BaseEquipment=/* Array type was not detected. */
    ViolenceRankTolerance=1
    Gang="Rednecks"
    ControllerClass=Class'AWBystanderController'
    ActorID="Redneck"
    Mesh=SkeletalMesh'Characters.Avg_M_SS_Pants'
    Skins[0]=Texture'ChameleonSkins.Rednecks.XX__154__Avg_M_SS_Pants'
}