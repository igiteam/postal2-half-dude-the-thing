class BoxLauncherProjectile extends P2Projectile;
///////////////////////////////////////////////////////////////////////////////
var bool bMadeContact;
var sound BounceSound;
var P2MoCapPawn HitPawn;
var Texture UseSkin;
var BoxLauncherWeapon Launcher;
///////////////////////////////////////////////////////////////////////////////
function SetupShot()
{
        Velocity = GetThrownVelocity(Instigator, Rotation, 0.6);
        RandSpin(StartSpinMag);
}
///////////////////////////////////////////////////////////////////////////////
function TakeDamage(int Dam, Pawn instigatedBy, Vector hitlocation, Vector momentum, class<DamageType> damageType)
{
	Velocity += (Momentum / Mass);
}
///////////////////////////////////////////////////////////////////////////////
function BounceOffSomething(vector HitNormal, actor Wall)
{
        Velocity = Velocity - (FRand() + 2) * HitNormal * (Velocity Dot HitNormal) + (Frand() - 0.5) * (Velocity Cross HitNormal);
	SetRotation(rotator(Velocity));
	PlaySound(BounceSound,SLOT_Misc,,,TransientSoundRadius,GetRandPitch());
}
///////////////////////////////////////////////////////////////////////////////
function DoDamage(Actor Other, Pawn Instigator, vector HitLocation, vector HitNormal)
{
	if(P2MoCapPawn(Other) != None && Pawn(Other).Health > 0)
               Other.TakeDamage(Damage, Instigator, HitLocation, 2 * MomentumTransfer * HitNormal, class'SmashDamage');
	else
	       Other.TakeDamage(Damage, Instigator, HitLocation, MomentumTransfer * HitNormal, class'KickingDamage');
}
///////////////////////////////////////////////////////////////////////////////
simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	if(Other != Instigator && Other != self)
	{
		if(Window(Other) != None)
			Other.Bump(self);
		else
		{
		        if(Other.bStatic)
                                BounceOffSomething(-Normal(Velocity), Other);
		        else
			{
				if(P2MoCapPawn(Other) != None && (HitPawn == None || P2MoCapPawn(Other) != HitPawn) )
				{
					bMadeContact = true;
                    Launcher.MadeContact();
				        Other.AttachToBone(self, 'MALE01 pelvis');
					SetRelativeLocation(vect(0,0,0));
					HitPawn = P2MoCapPawn(Other);
					Skins[0] = UseSkin;
				}

			        DoDamage(Other, Instigator, HitLocation, Normal(Velocity));
			}
		}
	}
}
///////////////////////////////////////////////////////////////////////////////
simulated function HitWall(vector HitNormal, actor Wall)
{
       if(Wall == None)
               return;

       BounceOffSomething(HitNormal, Wall);
       Wall.TakeDamage(10, instigator, Location, -MomentumTransfer * HitNormal, class'SmashDamage');
}
///////////////////////////////////////////////////////////////////////////////
function Tick(float DeltaTime)
{
       Super.Tick(DeltaTime);
       if ((HitPawn != None && HitPawn.bChunkedUp) || (bMadeContact && HitPawn == none))
           Destroy();
}
///////////////////////////////////////////////////////////////////////////////

// Decompiled with UE Explorer.
defaultproperties
{
    BounceSound=Sound'AW7Sounds.MiscWeapons.Boingy'
    UseSkin=Texture'Timb.Misc.invisible_timb'
    DetonateTime=5.0000000
    MinSpeedForBounce=1.0000000
    VelDampen=0.9500000
    RotDampen=0.9500000
    StartSpinMag=5000.0000000
    Health=50
    speed=750.0000000
    MaxSpeed=1500.0000000
    Damage=3000.0000000
    MomentumTransfer=200000.0000000
    DrawType=8
    LifeSpan=15.0000000
    Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
    StaticMesh=StaticMesh'AW7Mesh.AMN.Box'
    AmbientGlow=96
    SoundRadius=14.0000000
    SoundVolume=255
    SoundPitch=100
    CollisionRadius=20.0000000
    CollisionHeight=20.0000000
    bBounce=true
    bFixedRotationDir=true
    RotationRate=(Pitch=0,Yaw=50000,Roll=0)
    ForceType=1
    ForceRadius=100.0000000
    ForceScale=4.0000000
}