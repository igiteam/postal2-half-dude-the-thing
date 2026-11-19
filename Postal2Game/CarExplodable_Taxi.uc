class CarExplodable_Taxi extends KActorExplodable;

///////////////////////////////////////////////////////////////////////////////
// VARS
///////////////////////////////////////////////////////////////////////////////
var bool bCanHurtAgain;		// Gets reset if he's hurt something recently
var class<DamageType> SmashingDamage;


//const COLLIDE_DAMAGE_SCALE = 0.1;
const HURT_AGAIN_TIME	= 0.5;
const MIN_HURT_SPEED = 50;


///////////////////////////////////////////////////////////////////////////////
// This is so things don't grind into other things as they move
///////////////////////////////////////////////////////////////////////////////
function Timer()
{
	bCanHurtAgain=true;
}

///////////////////////////////////////////////////////////////////////////////
// Check to hurt this pawn if we we're going fast enough
///////////////////////////////////////////////////////////////////////////////
function CollideWithPawn(FPSPawn Other)
{
	local float usemag;

	usemag = VSize(Velocity);

	if(bCanHurtAgain
		&& usemag > MIN_HURT_SPEED
		&& !Other.bPlayer)
	{
		Other.TakeDamage(
				Other.Health,
				None, 
				Other.Location - Other.CollisionHeight* Normal(Velocity),
				Velocity*Mass,
				SmashingDamage);
		bCanHurtAgain=false;
		SetTimer(HURT_AGAIN_TIME, false);
	}
}

///////////////////////////////////////////////////////////////////////////////
// Hurt NPC's when you hit them (not the player)
///////////////////////////////////////////////////////////////////////////////
event bool EncroachingOn( actor Other )
{
	if(FPSPawn(Other) != None)
		CollideWithPawn(FPSPawn(Other));
	return false;
}

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
// Broken
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
state Broken
{
	///////////////////////////////////////////////////////////////////////////////
	// If we have a mesh, then also throw in a trailing fire effect
	///////////////////////////////////////////////////////////////////////////////
	function BeginState()
	{
		local TrailingFireEmitter tfe;
		// Swap the mesh to the broken mesh if you have one
		if(BrokenStaticMesh != None)
		{
			SetDrawType(DT_StaticMesh);
			SetStaticMesh(BrokenStaticMesh);
			if(DamageSkin != None)
			{
				if(Skins.Length < 1)
					Skins.Insert(Skins.Length, 1);
				Skins[0]=DamageSkin;
			}
			tfe = spawn(class'TrailingFireEmitter',,,Location);
			tfe.SetBase(self);
		}
		else	// If we don't have a broken mesh, they don't want to
				// see it anymore, so just destroy it
			Destroy();
	}
}


// Decompiled with UE Explorer.
defaultproperties
{
    bCanHurtAgain=true
    SmashingDamage=Class'BaseFX.SmashDamage'
    DamageThreshold=4.0000000
    Health=24.0000000
    BrokenStaticMesh=StaticMesh'P2R_Meshes_D.cars.Taxi_New_Sploded'
    ExplosionMag=100000.0000000
    DamageFilter=Class'BaseFX.BludgeonDamage'
    bBlockFilter=true
    DamageSkin=Texture'P2R_Tex_D.cars.taxi_d_burnt'
    bBulletsMoveMe=false
    WoofConversion=0.0040000
    ImpactSounds=/* Array type was not detected. */
    StaticMesh=StaticMesh'P2R_Meshes_D.cars.Taxi_New'
    Mass=200.0000000
    KParams=KarmaParams'FX.KarmaParams0'
}