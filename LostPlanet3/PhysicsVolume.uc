class PhysicsVolume extends Volume
    nativereplication
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

struct CheckpointRecord
{
    var(*) /*0x35EA0000-0x00000000*/ private bool bPainCausing;
    var(*) /*0x35EA0000-0x00000000*/ private bool bActive;

    structdefaultproperties
    {
        bPainCausing=false
        bActive=false
    }
};

var(*) /*0x3C590000-0x00000000*/ private editconst @NULL ZoneVelocity[65537];
var(*) /*0x3C590000-0x00000000*/ private bool bVelocityAffectsWalking[65537];
var(*) /*0x3C590000-0x00000000*/ private bool bPainCausing[65537];
var(*) /*0x3C590000-0x00000000*/ private bool bAIShouldIgnorePain[65537];
var(*) /*0x3C590000-0x00000000*/ private bool bEntryPain[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool BACKUP_bPainCausing;
var(*) /*0x3C590000-0x00000000*/ private bool bDestructive[65537];
var(*) /*0x3C590000-0x00000000*/ private bool bNoInventory[65537];
var(*) /*0x3C590000-0x00000000*/ private bool bMoveProjectiles[65537];
var(*) /*0x3C590000-0x00000000*/ private bool bBounceVelocity[65537];
var(*) /*0x3C590000-0x00000000*/ private bool bNeutralZone[65537];
var(*) /*0x3C590000-0x00000000*/ private bool bCrowdAgentsPlayDeathAnim[65537];
var(*) /*0x3C590000-0x00000000*/ private bool bPhysicsOnContact[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bWaterVolume;
var(*) /*0x3C590000-0x00000000*/ private float GroundFriction[65537];
var(*) /*0x3C590000-0x00000000*/ private float TerminalVelocity[65537];
var(*) /*0x3C590000-0x00000000*/ private float DamagePerSec[65537];
var(*) /*0x3C590000-0x00000000*/ private class DamageType[65537];
var(*) /*0x3C590000-0x00000000*/ private int Priority[65537];
var(*) /*0x3C590000-0x00000000*/ private float FluidFriction[65537];
var(*) /*0x3C590000-0x00000000*/ private float PainInterval[65537];
var(*) /*0x3C590000-0x00000000*/ private float RigidBodyDamping[65537];
var(*) /*0x3C590000-0x00000000*/ private float MaxDampingForce[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL PainTimer;
var(*) /*0x35EA0000-0x00000000*/ private @NULL DamageInstigator;
var(*) /*0x35EA0000-0x00000000*/ private @NULL NextPhysicsVolume[536870913];

// Export UPhysicsVolume::execGetGravityZ(FFrame&, void* const)
native function GetGravityZ()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UPhysicsVolume::execGetZoneVelocityForActor(FFrame&, void* const)
native function GetZoneVelocityForActor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL TheActor[8388609], ReturnValue;


}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    BACKUP_bPainCausing = bPainCausing;
    // End:0x35
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    // End:0x66
    if(bPainCausing)
    {
        PainTimer = Spawn(Class'VolumeTimer', self);
    }
    //return;    
}

function Reset()
{
    bPainCausing = BACKUP_bPainCausing;
    bForceNetUpdate = true;
    //return;    
}

event PhysicsChangedFor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event ActorEnteredVolume()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event ActorLeavingVolume()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event PawnEnteredVolume()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

event PawnLeavingVolume()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    //return;    
}

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x38
    if(!bStatic || int(RemoteRole) > int(ROLE_None))
    {
        super.OnToggle(inAction);
    }
    // End:0x87
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bPainCausing = BACKUP_bPainCausing;        
    }
    else
    {
        // End:0xCD
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bPainCausing = false;            
        }
        else
        {
            // End:0x12B
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bPainCausing = !bPainCausing && BACKUP_bPainCausing;
            }
        }
    }
    //return;    
}

simulated event CollisionChanged()
{
    //return;    
}

function TimerPop()
{
    local /*0x35EA0000-0x00000000*/ private @NULL T[8388609], A;

    // End:0x9D
    if(T == PainTimer)
    {
        // End:0x28
        if(!bPainCausing)
        {
            return;
        }
        // End:0x9C
        foreach TouchingActors(Class'Actor', A)
        {
            // End:0x9B
            if(A.bCanBeDamaged && !A.bStatic)
            {
                CausePainTo(A);
            }            
        }        
    }
    //return;    
}

simulated event @NULL Touch()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    // End:0x63
    if((Other == none) || Other.bStatic)
    {
        return;
    }
    // End:0xD6
    if((bNoInventory && DroppedPickup(Other) != none) && Other.Owner == none)
    {
        Other.LifeSpan = 1.5000000;
        return;
    }
    // End:0x20C
    if(bMoveProjectiles && ZoneVelocity != vect(0.0000000, 0.0000000, 0.0000000))
    {
        // End:0x155
        if(int(Other.Physics) == int(6))
        {
            Other.Velocity += ZoneVelocity;            
        }
        else
        {
            // End:0x20C
            if(((Other.Base == none) && Other.IsA('Emitter')) && int(Other.Physics) == int(0))
            {
                Other.SetPhysics(6);
                Other.Velocity += ZoneVelocity;
            }
        }
    }
    // End:0x2A1
    if(bPainCausing)
    {
        // End:0x25D
        if(Other.bDestroyInPainVolume)
        {
            Other.VolumeBasedDestroy(self);
            return;
        }
        // End:0x2A1
        if(bEntryPain && Other.bCanBeDamaged)
        {
            CausePainTo(Other);
        }
    }
    //return;    
}

function CausePainTo()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Other[8388609];

    // End:0xEA
    if(DamagePerSec > float(0))
    {
        // End:0x60
        if(WorldInfo.bSoftKillZ && int(Other.Physics) != int(1))
        {
            return;
        }
        // End:0x88
        if((DamageType == none) || DamageType == Class'DamageType')
        {
        }
        Other.TakeDamage(int(DamagePerSec * PainInterval), DamageInstigator, Location, vect(0.0000000, 0.0000000, 1.0000000), DamageType,, self);        
    }
    else
    {
        Other.HealDamage(int(-DamagePerSec * PainInterval), DamageInstigator, DamageType);
    }
    //return;    
}

function ModifyPlayer()
{
    local /*0x35EA0000-0x00000000*/ private @NULL PlayerPawn[8388609];

    //return;    
}

function NotifyPawnBecameViewTarget()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609], PC;

    //return;    
}

function OnSetDamageInstigator()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Action[8388609];

    DamageInstigator = Action.GetController(Action.DamageInstigator);
    //return;    
}

function ShouldSaveForCheckpoint()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return bPainCausing != BACKUP_bPainCausing;
    //return ReturnValue;    
}

function CreateCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25165825];

    Record.bPainCausing = bPainCausing;
    //return;    
}

function ApplyCheckpointRecord()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Record[25296897];

    bPainCausing = Record.bPainCausing;
    //return;    
}

defaultproperties
{
    bVelocityAffectsWalking=true
    bEntryPain=true
    GroundFriction=8.0000000
    TerminalVelocity=4000.0000000
    DamageType=Class'DamageType'
    FluidFriction=0.3000000
    PainInterval=1.0000000
    MaxDampingForce=1000000.0000000
    // Reference: BrushComponent'Default__PhysicsVolume.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    bForceAllowKismetModification=true
    NetUpdateFrequency=0.1000000
    CollisionComponent=BrushComponent0
}