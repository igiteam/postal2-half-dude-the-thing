class WaterVolume extends PhysicsVolume;

var string EntrySoundName, ExitSoundName, EntryActorName;

function PostBeginPlay()
{
	Super.PostBeginPlay();

	if ( EntrySoundName != "" )
		EntrySound = Sound(DynamicLoadObject(EntrySoundName,class'Sound'));
	if ( ExitSoundName != "" )
		ExitSound = Sound(DynamicLoadObject(ExitSoundName,class'Sound'));
	if ( EntryActorName != "" )
		EntryActor = class<Actor>(DynamicLoadObject(EntryActorName,class'Class'));	
}


// Decompiled with UE Explorer.
defaultproperties
{
    EntrySoundName="PlayerSounds.FootstepWater1"
    ExitSoundName="GeneralImpacts.ImpactSplash2"
    FluidFriction=2.4000000
    bWaterVolume=true
    bDistanceFog=true
    DistanceFogColor=(R=32,G=64,B=128,A=64)
    DistanceFogStart=8.0000000
    DistanceFogEnd=2000.0000000
    KExtraLinearDamping=0.8000000
    KExtraAngularDamping=0.1000000
    LocationName="under water"
}