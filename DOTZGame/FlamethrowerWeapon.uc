//=============================================================================
// Flamethrower Weapon
// A makeshift flamethrower made from common everday items and an M16 probably
// picked up from a fallen soldier. Due to it's unique damaging and firing
// methods, this weapon has been custom built from the ground up.
// Gamefan74
// October 4th, 2008
//=============================================================================
class FlamethrowerWeapon extends DOTZGunWeapon;

var bool bPrimaryFire;

var float FireVelocity;

var float WindupAnimationRate;
var float WinddownAnimationRate;

var float WindupSoundVolume;
var float WinddownSoundVolume;

var float WindupSoundRadius;
var float WinddownSoundRadius;

var name TorchBone;

var name WindupAnimationName;
var name WinddownAnimationName;

var array<name> PawnBones;

var sound WindupSound;
var sound FireAmbientSound;
var sound WinddownSound;

var class<Emitter> GasEmitterClass;
var class<DEFlameThrowerPrimary> FlameEmitterClass;
var class<Emitter> SparkEmitterClass;
var class<Emitter> TorchEmitterClass;

var class<Fire> PawnFireClass;
var class<Fire> StreamFireClass;
var class<Fire> WallFireClass;

var Emitter GasEmitter;
var DEFlameThrowerPrimary FlameEmitter;
var Emitter SparkEmitter;
var Emitter TorchEmitter;

simulated function Fire(float Value)
{
    ServerFire();
}

simulated function AltFire(float Value)
{
    ServerAltFire();
}

function ServerFire()
{
    bPrimaryFire = true;

    if (AmmoType == None)
        GiveAmmo(Pawn(Owner));

    if (HasAmmo() || bInfiniteAmmo)
        GotoState('WindUp');
}

function ServerAltFire()
{
    bPrimaryFire = false;

    if (AmmoType == None)
        GiveAmmo(Pawn(Owner));

    if (HasAmmo() || bInfiniteAmmo)
        GotoState('WindUp');
}

function SetupFire(Fire FireActor)
{
    FireActor.bFadeWhenBaseDestroyed = false;
    FireActor.bSourceFades = true;
    FireActor.DamagePerSec = 12;
    FireActor.IgnitionTime = 0;
    FireActor.CreateFire();
}

state WindUp
{
    simulated function Fire(float Value);
    simulated function AltFire(float Value);

    simulated function BeginState()
    {
        if (WindupAnimationName != '')
            PlayAnim(WindupAnimationName, WindupAnimationRate);

        if (TorchEmitterClass != None && TorchEmitter == None)
        {
            TorchEmitter = Spawn(TorchEmitterClass,,, GetBoneCoords(TorchBone).Origin);
            AttachToBone(TorchEmitter, TorchBone);
        }

        if (SparkEmitterClass != None && SparkEmitter == None)
            SparkEmitter = Spawn(SparkEmitterClass,,, GetBoneCoords(TorchBone).Origin);

        if (bPrimaryFire)
        {
            if (FlameEmitterClass != None && FlameEmitter == None)
            {
               FlameEmitter = Spawn(FlameEmitterClass,,, GetBoneCoords(TorchBone).Origin);
               FlameEmitter.SetDirection(Rotation);
               AttachToBone(FlameEmitter, TorchBone);

               PlaySound(WindupSound,, WindupSoundVolume,, WindupSoundRadius);
               AmbientSound = WindupSound;
            }
        }
        else
        {
            if (GasEmitterClass != None && GasEmitter == None)
            {
                GasEmitter = Spawn(GasEmitterClass,,, GetBoneCoords(TorchBone).Origin);
                AttachToBone(GasEmitter, TorchBone);
            }
        }
    }

    simulated function AnimEnd(int Channel)
    {
        if (bPrimaryFire)
        {
            if (Instigator.PressingFire())
                GotoState('FireLoop');
            else
                GotoState('WindDown');
        }
        else
        {
            if (Instigator.PressingAltFire())
                GotoState('FireLoop');
            else
                GotoState('WindDown');
        }
    }
}

state FireLoop
{
    simulated function Fire(float Value);
    simulated function AltFire(float Value);

    simulated function BeginState()
    {
        if (FireAnimName != '')
            PlayAnim(FireAnimName, SingleFireRate);

        if (bPrimaryFire)
        {
            if (Instigator.PressingFire())
                PrimaryFire();
        }
        else
        {
            if (Instigator.PressingAltFire())
                AlternateFire();
        }
    }

    function Timer()
    {
        if (bPrimaryFire)
        {
            if (Instigator.PressingFire())
                PrimaryFire();
            else
                GotoState('WindDown');
        }
        else
        {
            if (Instigator.PressingAltFire())
                AlternateFire();
            else
                GotoState('WindDown');
        }
    }

    function PrimaryFire()
    {
        local bool bOnFire;
        local int i;
        local vector HitLocation, HitNormal, EndTrace, StartTrace;
        local Actor Other;
        local Fire PawnFire, StreamFire, WallFire;
        local Pawn Victim;

        if (Instigator == None)
            return;

        if (ReloadCount == 0)
        {
            GotoState('WindDown');
            return;
        }

        if (!bInfiniteAmmo)
            ReloadCount--;

        bOnFire = false;
        StartTrace = Instigator.Location;
        StartTrace.Z += Instigator.EyeHeight;
        EndTrace = StartTrace + (vector(Rotation) * TraceDist);
        Other = Trace(HitLocation, HitNormal, EndTrace, StartTrace, true);

        if (Other != None)
        {
            Other.TakeDamage(AdvancedAmmunition(AmmoType).DamageAmount, Instigator, HitLocation, vect(0,0,0), AdvancedAmmunition(AmmoType).MyDamageType);
            Victim = Pawn(Other);

            if (Victim != None)
                foreach Victim.BasedActors(class'Fire', PawnFire)
                    bOnFire = true;

            if (Victim != None && !bOnFire)
            {
                for (i=0; i<PawnBones.length; i++)
                {
                    PawnFire = Spawn(PawnFireClass,,, Victim.GetBoneCoords(PawnBones[i]).Origin);
                    PawnFire.bHardAttach = true;
                    SetupFire(PawnFire);
                    PawnFire.SetBase(Victim);
                }
            }
        }

        if (Other != None && Other.bWorldGeometry)
        {
            WallFire = Spawn(WallFireClass,,, HitLocation);
            SetupFire(WallFire);
            WallFire.CreateFire();
        }
        else
        {
            StreamFire = Spawn(StreamFireClass,,, EndTrace);
            SetupFire(StreamFire);
            StreamFire.SetPhysics(PHYS_Falling);
            StreamFire.Velocity = vector(Rotation) * FireVelocity;
        }

        SetTimer(RapidFireRate, false);
    }

    function AlternateFire()
    {
    }

    function Tick(float DeltaTime)
    {
        if (FlameEmitter != None)
            FlameEmitter.SetDirection(Rotation);
    }

    simulated function AnimEnd(int Channel)
    {
        if (FireAnimName != '')
            PlayAnim(FireAnimName, SingleFireRate);
    }
}

state WindDown
{
    simulated function Fire(float Value);
    simulated function AltFire(float Value);

    simulated function BeginState()
    {
        PlayAnim(WinddownAnimationName, WinddownAnimationRate);

        if (SparkEmitter != None)
        {
            SparkEmitter.Destroy();
            SparkEmitter = None;
        }

        if (GasEmitter != None)
        {
            GasEmitter.Destroy();
            GasEmitter = None;
        }

        if (FlameEmitter != None)
        {
            FlameEmitter.Destroy();
            FlameEmitter = None;
        }

        PlaySound(WinddownSound,, WinddownSoundVolume,, WinddownSoundRadius);
        AmbientSound = None;
    }

    simulated function AnimEnd(int Channel)
    {
        GotoState('Idle');
    }
}


// Decompiled with UE Explorer.
defaultproperties
{
    FireVelocity=1024.0000000
    WindupAnimationRate=1.0000000
    WinddownAnimationRate=1.0000000
    WindupSoundVolume=255.0000000
    WinddownSoundVolume=255.0000000
    WindupSoundRadius=512.0000000
    WinddownSoundRadius=512.0000000
    TorchBone="Dummy_Torch"
    WindupAnimationName="PreFire"
    WinddownAnimationName="DeFire"
    PawnBones[0]="FaceRoot"
    PawnBones[1]="Spine1"
    PawnBones[2]="LForearm"
    PawnBones[3]="RForearm"
    PawnBones[4]="LHand"
    PawnBones[5]="RHand"
    PawnBones[6]="LCalf"
    PawnBones[7]="RCalf"
    PawnBones[8]="LFoot"
    PawnBones[9]="RFoot"
    WindupSound=Sound'DEWeaponsSFX.Guns.FlameThrower_FlameIn'
    FireAmbientSound=Sound'DEWeaponsSFX.Guns.FlameThrower_FlameLoop'
    WinddownSound=Sound'DEWeaponsSFX.Guns.FlameThrower_FlameOut'
    FlameEmitterClass=Class'DEFlameThrowerPrimary'
    SparkEmitterClass=Class'DEFlameThrowerSpark'
    TorchEmitterClass=Class'DEFlameThrowerIgnitor'
    PawnFireClass=Class'DOTZItems.PawnFire'
    StreamFireClass=Class'DOTZItems.SmallMolotovFire'
    WallFireClass=Class'DOTZItems.MedMolotovFire'
    PawnAnimationPackage="DOTZAHumans.3PShotgun"
    FireAnimName="ShotgunFire"
    StandIdleAnimName="ShotgunStandIdle"
    CrouchIdleAnimName="ShotgunCrouchIdle"
    HitAnimName="ShotgunHit"
    WeaponMode=1
    RapidFireRate=0.1000000
    MuzzleFlashEmitterClass=Class'BBParticles.BBPShotgunMuzzleFlash'
    iMinInaccuracy=1.0000000
    AimedOffset=(X=-9.0000000,Y=-3.0000000,Z=-1.0000000)
    OfficialName="Flamethrower"
    AmmoName=Class'FlamethrowerAmmunition'
    PickupAmmoCount=100
    ReloadCount=100
    AutoSwitchPriority=6
    FireOffset=(X=23.0000000,Y=4.0000000,Z=0.0000000)
    TraceDist=512.0000000
    InventoryGroup=6
    PickupClass=Class'FlamethrowerPickup'
    AttachmentClass=Class'FlamethrowerAttachment'
    ItemName="Flamethrower"
    Mesh=SkeletalMesh'DEWeaponsA2.FlameThrower_M'
    SoundRadius=512.0000000
    SoundVolume=255
}