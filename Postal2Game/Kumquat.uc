//=============================================================================
// Copyright 2002 Running With Scissors, Inc.  All Rights Reserved.
//=============================================================================
class Kumquat extends Bystander
 	placeable;

// Kamek 5-21
// If they die by grenade head explosion, award the player for juxtaposition
function Died(Controller Killer, class<DamageType> damageType, vector HitLocation)
{
	local P2Player P;
	
	if (damageType == class'ExplodedDamage'
		&& P2Player(Killer) != None
		&& P2Player(Killer).bCommitedSuicide)
	// This may or may not work, Killer might be invalid after the dude commits suicide.
	{
		if(Level.NetMode != NM_DedicatedServer ) P2Player(Killer).GetEntryLevel().EvaluateAchievement(P2Player(Killer),'ReversePsychology');
	}
		
	Super.Died(Killer, DamageType, HitLocation);
}


// Decompiled with UE Explorer.
defaultproperties
{
    HeadSkin=Texture'ChamelHeadSkins.Special.Kumquat'
    HeadMesh=SkeletalMesh'heads.FemSHCropped'
    bRandomizeHeadScale=false
    Boltons=(Bone="NODE_Parent",StaticMesh=StaticMesh'Boltons.Burka_Mask_Sara',bAttachToHead=true)
    bIsHindu=true
    RandomizedBoltons=/* Array type was not detected. */
    TalkWhileFighting=0.0000000
    BaseEquipment=/* Array type was not detected. */
    Gang="Kumquat"
    bIsFemale=true
    ControllerClass=Class'AIPack.KumquatController'
    ActorID="Terrorist"
    Mesh=SkeletalMesh'Characters.Fem_LS_Skirt'
    Skins[0]=Texture'ChameleonSkins.Special.Kumquat'
}