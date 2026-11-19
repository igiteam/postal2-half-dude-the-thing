
///////////////////////////////////////////////////////////////////////////////
// ThingFlameChunk.uc
// RTCW-inspired flame chunk simulation for Postal 2 / UE2.
//
// Implements:
// - Initial velocity
// - Friction
// - Flame expansion
// - Collision reflection
// - Blue ignition phase
// - Periodic fire damage
///////////////////////////////////////////////////////////////////////////////

class ThingFlameChunk extends Actor;

var() class<P2Emitter> FlameEffectsClass;
var() class<P2Emitter> BlueFlameEffectsClass;

var P2Emitter FlameFX;

var() float StartSpeed;
var() float Friction;
var() float StartSize;
var() float MaxFlameSize;
var() float MaximumSize;
var() float DamageRadius;
var() float FlameDamage;
var() float FlameLifetime;
var() float BlueFlameLength;

var float FlameAge;
var float CurrentFlameSize;
var float DamageTimer;

var Pawn FlameOwner;
var bool bBluePhase;

simulated function PostBeginPlay()
{
    Super.PostBeginPlay();

    FlameOwner = Instigator;

    StartSpeed = 950.0;
    Friction = 950.0;

    StartSize = 1.0;
    MaxFlameSize = 140.0;
    MaximumSize = 200.0;

    DamageRadius = 24.0;
    FlameDamage = 8.0;

    BlueFlameLength = 230.0;
    FlameLifetime = 1.0;

    CurrentFlameSize = StartSize;

    Velocity = Vector(Rotation) * StartSpeed;

    bCollideWorld = True;
    bProjTarget = True;

    SetCollision(True, False, False);
    SetCollisionSize(4.0, 4.0);

    bBluePhase = True;

    if (BlueFlameEffectsClass != None)
        FlameFX = Spawn(BlueFlameEffectsClass, Self,, Location);
    else if (FlameEffectsClass != None)
        FlameFX = Spawn(FlameEffectsClass, Self,, Location);

    if (FlameFX != None)
        FlameFX.SetBase(Self);

    SetTimer(0.1, True);
}

simulated event Tick(float DeltaTime)
{
    local float CurrentSpeed;
    local float SizeGrowth;

    Super.Tick(DeltaTime);

    FlameAge += DeltaTime;

    if (FlameAge >= FlameLifetime)
    {
        Destroy();
        return;
    }

    // RTCW: subtract friction from flame velocity.
    CurrentSpeed = VSize(Velocity);

    if (CurrentSpeed > 1.0)
    {
        CurrentSpeed -= Friction * DeltaTime;

        if (CurrentSpeed < 0.0)
            CurrentSpeed = 0.0;

        Velocity = Normal(Velocity) * CurrentSpeed;
    }

    // Grow the flame toward its target size.
    if (CurrentFlameSize < MaxFlameSize)
    {
        SizeGrowth = (MaxFlameSize / FlameLifetime) * DeltaTime;

        CurrentFlameSize += SizeGrowth;

        if (CurrentFlameSize > MaximumSize)
            CurrentFlameSize = MaximumSize;
    }

    // Stop moving when the chunk loses its momentum.
    if (VSize(Velocity) < 1.0)
    {
        Velocity = vect(0,0,0);
        SetPhysics(PHYS_None);
    }

    // Switch from blue ignition to the main flame.
    if (bBluePhase && FlameAge >= BlueFlameLength / StartSpeed)
    {
        bBluePhase = False;

        if (FlameFX != None)
            FlameFX.Destroy();

        FlameFX = None;

        if (FlameEffectsClass != None)
        {
            FlameFX = Spawn(
                FlameEffectsClass,
                Self,
                ,
                Location
            );

            if (FlameFX != None)
                FlameFX.SetBase(Self);
        }
    }

    // Existing FlameProjectile uses this emitter size mechanism.
    if (FlameFX != None && FlameFX.Emitters.Length > 0)
        FlameFX.Emitters[0].SizeScale[1].RelativeSize =
            CurrentFlameSize / StartSize;
}

simulated function HitWall(vector HitNormal, actor Wall)
{
    local float DotProduct;
    local float NewSpeed;

    Super.HitWall(HitNormal, Wall);

    // RTCW velocity reflection.
    DotProduct = Normal(Velocity) Dot HitNormal;

    Velocity = Normal(
        Velocity - (1.3 * DotProduct * HitNormal)
    );

    NewSpeed = VSize(Velocity);

    NewSpeed *= 0.5 *
        (0.25 + 0.75 * ((DotProduct + 1.0) * 0.5));

    // RTCW caps post-impact velocity.
    if (NewSpeed > 20.0)
        NewSpeed = 20.0;

    Velocity *= NewSpeed;
}

simulated event Timer()
{
    local Pawn P;

    // RTCW checks flame damage every 100 ms.
    if (FlameOwner == None)
        return;

    foreach VisibleCollidingActors(
        class'Pawn',
        P,
        DamageRadius,
        Location
    )
    {
        if (P == None || P == FlameOwner)
            continue;

        if (FastTrace(P.Location, Location))
        {
            P.TakeDamage(
                FlameDamage,
                FlameOwner,
                Location,
                vect(0,0,0),
                class'BaseFX.FireExplodedDamage'
            );
        }
    }
}

simulated function Destroyed()
{
    if (FlameFX != None)
    {
        FlameFX.Destroy();
        FlameFX = None;
    }

    Super.Destroyed();
}

defaultproperties
{
    Physics=PHYS_Projectile
    bCollideWorld=True
    bProjTarget=True
    DrawType=DT_None
    CollisionRadius=4.0
    CollisionHeight=4.0
}
