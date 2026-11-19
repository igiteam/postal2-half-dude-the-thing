//=============================================================================
// InvisiGuard
// Copyright 2004 Running With Scissors, Inc.  All Rights Reserved.
//
// Partially visible military/swat guy
//
//=============================================================================
class InvisiGuard extends AWBystander
	placeable;


// Decompiled with UE Explorer.
defaultproperties
{
    StumpClass=Class'BasePeople.StumpBigGuy'
    LimbClass=Class'BasePeople.LimbBigGuy'
    HeadSkin=Texture'AW_Characters.Special.Elite_Guard_Head1'
    HeadMesh=SkeletalMesh'heads.Masked'
    bRandomizeHeadScale=false
    Boltons=(Bone="NODE_Parent",StaticMesh=StaticMesh'Boltons.Swat_Goggles',bAttachToHead=true)
    BlockMeleeFreq=0.9700000
    RandomizedBoltons=/* Array type was not detected. */
    Psychic=0.4000000
    Champ=0.7000000
    Cajones=0.7000000
    Temper=0.3500000
    Glaucoma=0.4500000
    Rat=1.0000000
    Compassion=0.0000000
    WarnPeople=0.0000000
    Conscience=0.0000000
    Beg=0.0000000
    PainThreshold=1.0000000
    Reactivity=0.7500000
    Rebel=1.0000000
    WillDodge=0.4000000
    WillKneel=0.2000000
    WillUseCover=0.8000000
    Stomach=1.0000000
    Armor=100.0000000
    ArmorMax=100.0000000
    TalkWhileFighting=0.1000000
    TakesShotgunHeadShot=0.2500000
    TakesShovelHeadShot=0.3500000
    TakesOnFireDamage=0.4000000
    TakesAnthraxDamage=0.5000000
    TakesShockerDamage=0.1000000
    TakesPistolHeadShot=0.7500000
    TalkBeforeFighting=0.1000000
    Fitness=0.9000000
    DialogClass=Class'BasePeople.DialogMaleMilitary'
    BaseEquipment=/* Array type was not detected. */
    ViolenceRankTolerance=0
    HealthMax=150.0000000
    Gang="PublisherGuard"
    AttackRange=(Min=512.0000000,Max=4096.0000000)
    ControllerClass=Class'AWMilitaryController'
    ActorID="InvisiGuard"
    Mesh=SkeletalMesh'Characters.Big_M_LS_Pants'
    Skins[0]=Texture'AW_Characters.Special.Elite_Guard_1'
}