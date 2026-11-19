//=============================================================================
// NPC Dude Pawn for DudeVSDude cheat 
//=============================================================================
class PostalDudeNPC extends Bystanders
	placeable;

var() Material PostInjuryHeadSkin;

function PostBeginPlay()
{
	Super.PostBeginPlay();
	
	if (P2GameInfoSingle(Level.Game).IsWeekend())
		MyHead.Skins[1] = PostInjuryHeadSkin;
}


// Decompiled with UE Explorer.
defaultproperties
{
    PostInjuryHeadSkin=Texture'AW_Characters.Special.Dude_AW_Bandage'
    ADJUST_RELATIVE_HEAD_Y=-2.0000000
    HeadClass=Class'BasePeople.AWDudeHead'
    HeadSkin=Texture'AW_Characters.Special.Dude_AW'
    HeadMesh=SkeletalMesh'MoreHeads.AW_Dude'
    bRandomizeHeadScale=false
    bIsTrained=true
    BlockMeleeFreq=1.0000000
    bNoChamelBoltons=true
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
    TakesPistolHeadShot=0.2500000
    DialogClass=Class'BasePeople.DialogDudeNPC'
    BaseEquipment=/* Array type was not detected. */
    ViolenceRankTolerance=0
    TakesChemDamage=0.6000000
    HealthMax=200.0000000
    bPlayerIsEnemy=true
    Gang="DudeClones"
    DamageMult=2.5000000
    FriendDamageThreshold=170.0000000
    ActorID="Dude"
    Mesh=SkeletalMesh'Characters.Avg_Dude'
    Skins[0]=Texture'ChameleonSkins.Special.Dude'
}