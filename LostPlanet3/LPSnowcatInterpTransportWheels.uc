class LPSnowcatInterpTransportWheels extends LPPlayerTransportWheels
    notplaceable
    hidecategories(AnimDependency,Navigation);

enum eDrillStatus
{
    eDrillStatus_Uninitialized,     // 0
    eDrillStatus_Disabled,          // 1
    eDrillStatus_Idle,              // 2
    eDrillStatus_Drilling,          // 3
    eDrillStatus_Restore,           // 4
    eDrillStatus_MAX                // 5
};

struct native EncroachingDestructibles
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Actor;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PartSystem;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PartCue;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HitLocation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HitNormal;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private export @NULL HitInfo;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PhyMat;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class DamageType;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int iUniqueID;

    structdefaultproperties
    {
        Actor=none
        PartSystem=none
        PartCue=none
        HitLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        HitNormal=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        HitInfo=(Material=none,PhysMaterial=none,Item=0,LevelIndex=0,BoneName="None",HitComponent=none)
        PhyMat=none
        DamageType=none
        iUniqueID=0
    }
};

struct native FeelerEntry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SocketName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name BoneName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Extent;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private class Damage;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float Length;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name ParticleSocket;

    structdefaultproperties
    {
        SocketName="None"
        BoneName="None"
        Extent=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Damage=none
        Length=0.0000000
        ParticleSocket="None"
    }
};

struct native ParticleListEntry
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int iUniqueID;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PartSystem;
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL PartComp[524289];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HitLocation;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HitNormal;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AudioCue;
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL AudioComp[524289];

    structdefaultproperties
    {
        iUniqueID=0
        PartSystem=none
        PartComp=none
        HitLocation=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        HitNormal=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        AudioCue=none
        AudioComp=none
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DrillSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DrillArmSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlowLSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlowRSkelControl;
var(0.25_Pct) /*0x4B000000-0x00000000*/ private float DrillIdleRotationSpeed[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private float DrillGrindRotationSpeed[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private float DrillOscillationSpeed[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private float DrillDeltaSpeed[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private @NULL DrillGrinderPhysicalMaterial[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private @NULL DrillPlowPhysicalMaterial[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private int DamageToPlayerFromDrill[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private int DamageToDestructablesFromDrill[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private int DefaultDamageFromDrill[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private float LowestDrillAngle[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private float HighestDrillAngle[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private float IdleDrillAngle[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DrillArmSkelControlName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name DrillSkelControlName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name PlowLSkelControlName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name PlowRSkelControlName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private travel LPSnowcatInterpTransportWheels.eDrillStatus DrillStatus[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PrevDrillStatus;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillCurrentHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillTargetHeight;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillTargetSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillCurrentSpeed;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DrillSoundLoop[524289];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private @NULL DrillingSoundCue[65537];
var(0.25_Pct) /*0x4B000000-0x00000000*/ private @NULL DrillingStopSoundCue[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array EncroachList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FeelerList;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MatineeSpeedModifier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MatineeSpeedDeltaInc;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MatineeSpeedDeltaDec;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MatineeSpeedDeltaBlockedDec;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float PrevMatineeSpeedModifier;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SnowcatBody;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int iNextUniqueID;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize export array EncroachParticles;

// Export ULPSnowcatInterpTransportWheels::execCheckBumpPrimitive(FFrame&, void* const)
native function @NULL CheckBumpPrimitive()
{
    local /*0x97E50000-0x00000400*/ private @NULL HitComponent[8388609], Position, Extent, OutHitInfo, HitNormal;

    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export ULPSnowcatInterpTransportWheels::execSetBaseNative(FFrame&, void* const)
native simulated function SetBaseNative()
{
    local /*0x97E50000-0x00000000*/ private @NULL InBase[8388609];


}

simulated event PostBeginPlay()
{
    DrillSkelControl = SkelControlSingleBone(Mesh.FindSkelControl(DrillSkelControlName));
    DrillArmSkelControl = SkelControlSingleBone(Mesh.FindSkelControl(DrillArmSkelControlName));
    PlowLSkelControl = SkelControlSingleBone(Mesh.FindSkelControl(PlowLSkelControlName));
    PlowRSkelControl = SkelControlSingleBone(Mesh.FindSkelControl(PlowRSkelControlName));
    DrillCurrentHeight = IdleDrillAngle;
    DrillTargetHeight = DrillCurrentHeight;
    DrillTargetSpeed = DrillIdleRotationSpeed;
    DrillCurrentSpeed = DrillTargetSpeed;
    SetDrillStatus(2);
    EncroachList.Length = 0;
    EncroachParticles.Length = 0;
    MatineeSpeedModifier = 1.0000000;
    PrevMatineeSpeedModifier = 1.0000000;
    iNextUniqueID = 1;
    FindAndAttachPlayerTransport();
    super.PostBeginPlay();
    //return;    
}

simulated function FindAndAttachPlayerTransport()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL myBase;

    // End:0x30
    foreach AllActors(Class'LPInterpActor_PlayerTransport', myBase)
    {
        AttachToTransport(myBase);        
        return true;        
    }    
    return false;
    //return ReturnValue;    
}

simulated function AttachToTransport()
{
    local /*0x97E50000-0x00000000*/ private @NULL Transport[8388609];

    super.AttachToTransport(Transport);
    SnowcatBody = LPSnowcatInterpTransport(TransportBody);
    //return;    
}

simulated event Destroyed()
{
    EncroachList.Length = 0;
    super(Actor).Destroyed();
    //return;    
}

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x2A
    if(VarName == 'DrillStatus')
    {
        SetDrillStatus(DrillStatus);
    }
    super(Actor).ReplicatedEvent(VarName);
    //return;    
}

simulated function @NULL CreateTransportWheelAudioComponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cue[8388609], ReturnValue, AC;

    AC = CreateAudioComponent(Cue, false, true);
    // End:0xD4
    if(AC != none)
    {
        AC.bUseOwnerLocation = true;
        AC.bAllowSpatialization = true;
        AC.bAutoDestroy = false;
        AC.bShouldRemainActiveIfDropped = true;
        AC.Play();
    }
    return AC;
    //return ReturnValue;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int Damage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x5A
    if((HitInfo.PhysMaterial == DrillPlowPhysicalMaterial) || HitInfo.PhysMaterial == DrillGrinderPhysicalMaterial)
    {
        return;
    }
    TransportBody.TakeDamage(Damage, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    //return;    
}

simulated event TakeRadiusDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL InstigatedBy[8388609];
    local /*0x97E50000-0x00000000*/ private float BaseDamage[8388609], DamageRadius;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private float Momentum[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HurtOrigin[8388609];
    local /*0x97E50000-0x00000000*/ private bool bFullDamage[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL DamageCauser[8388609];
    local /*0x97E50000-0x00000000*/ private float DamageFalloffExponent[9437185];

    1.0000000
    TransportBody.TakeRadiusDamage(InstigatedBy, BaseDamage, DamageRadius, DamageType, Momentum, HurtOrigin, bFullDamage, DamageCauser, DamageFalloffExponent);
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609], F;

    // End:0x20
    if(TransportBody == none)
    {
        // End:0x20
        if(!FindAndAttachPlayerTransport())
        {
            return;
        }
    }
    // End:0x5B
    if((Base != TransportBody) && TransportBody != none)
    {
        SetBaseNative(TransportBody);
    }
    // End:0x1D0
    if(DrillSkelControl != none)
    {
        F = float(DrillSkelControl.BoneRotation.Roll);
        F += (DeltaTime * DrillCurrentSpeed);
        J0xC6:

        // End:0xF0 [Loop If]
        if(F >= float(65536))
        {
            F -= float(65536);
            // [Loop Continue]
            goto J0xC6;
        }
        DrillSkelControl.BoneRotation.Roll = int(F);
        // End:0x1D0
        if((PlowLSkelControl != none) && PlowRSkelControl != none)
        {
            PlowLSkelControl.BoneRotation.Pitch = int(F);
            PlowRSkelControl.BoneRotation.Pitch = int(float(65536) - F);
        }
    }
    // End:0x22A
    if(DrillArmSkelControl != none)
    {
        DrillArmSkelControl.BoneRotation.Roll = int((DrillCurrentHeight / 360.0000000) * 65536.0000000);
    }
    // End:0x28D
    if(DrillCurrentSpeed < DrillTargetSpeed)
    {
        DrillCurrentSpeed += (DrillDeltaSpeed * DeltaTime);
        // End:0x28A
        if(DrillCurrentSpeed > DrillTargetSpeed)
        {
            DrillCurrentSpeed = DrillTargetSpeed;
        }        
    }
    else
    {
        // End:0x2ED
        if(DrillCurrentSpeed > DrillTargetSpeed)
        {
            DrillCurrentSpeed -= (DrillDeltaSpeed * DeltaTime);
            // End:0x2ED
            if(DrillCurrentSpeed < DrillTargetSpeed)
            {
                DrillCurrentSpeed = DrillTargetSpeed;
            }
        }
    }
    // End:0x39C
    if(DrillCurrentHeight < DrillTargetHeight)
    {
        DrillCurrentHeight += (DrillOscillationSpeed * DeltaTime);
        // End:0x399
        if(DrillCurrentHeight > DrillTargetHeight)
        {
            // End:0x386
            if(int(DrillStatus) == int(3))
            {
                DrillTargetHeight = ((DrillTargetHeight == LowestDrillAngle) ? HighestDrillAngle : LowestDrillAngle);                
            }
            else
            {
                DrillCurrentHeight = DrillTargetHeight;
            }
        }        
    }
    else
    {
        // End:0x448
        if(DrillCurrentHeight > DrillTargetHeight)
        {
            DrillCurrentHeight -= (DrillOscillationSpeed * DeltaTime);
            // End:0x448
            if(DrillCurrentHeight < DrillTargetHeight)
            {
                // End:0x435
                if(int(DrillStatus) == int(3))
                {
                    DrillTargetHeight = ((DrillTargetHeight == LowestDrillAngle) ? HighestDrillAngle : LowestDrillAngle);                    
                }
                else
                {
                    DrillCurrentHeight = DrillTargetHeight;
                }
            }
        }
    }
    // End:0x480
    if((SnowcatBody != none) && int(DrillStatus) != int(1))
    {
        ProcessEncroachers(DeltaTime);
    }
    // End:0x4F5
    if((SnowcatBody == none) || !SnowcatBody.ShouldBeMoving())
    {
        // End:0x4F2
        if(MatineeSpeedModifier > 0.0000000)
        {
            MatineeSpeedModifier = FClamp(MatineeSpeedModifier - MatineeSpeedDeltaDec, 0.0000000, 1.0000000);
        }        
    }
    else
    {
        // End:0x547
        if((EncroachList.Length == 0) && MatineeSpeedModifier < 1.0000000)
        {
            MatineeSpeedModifier = FClamp(MatineeSpeedModifier + MatineeSpeedDeltaInc, 0.0000000, 1.0000000);            
        }
        else
        {
            // End:0x596
            if((EncroachList.Length > 0) && MatineeSpeedModifier > 0.0000000)
            {
                MatineeSpeedModifier = FClamp(MatineeSpeedModifier - MatineeSpeedDeltaBlockedDec, 0.0000000, 1.0000000);
            }
        }
    }
    // End:0x5DB
    if(PrevMatineeSpeedModifier != MatineeSpeedModifier)
    {
        // End:0x5DB
        if(SnowcatBody != none)
        {
            SnowcatBody.TriggerSpeedModifierEvent();
        }
    }
    PrevMatineeSpeedModifier = MatineeSpeedModifier;
    super(Actor).Tick(DeltaTime);
    //return;    
}

function CheckCollisionAgainstTeeth()
{
    local /*0x97E50000-0x00000000*/ private @NULL Collider[8388609], HitLocation, HitInfo, HitNormal;
    local /*0x97E50000-0x00000000*/ private int iDamage;
    local /*0x97E50000-0x00000000*/ private @NULL DestructObject, socketLoc, SocketLocEnd, SocketRot, NewHitRot, Feeler,
	    TraceCollider, NewHitLoc, Extent;

    local /*0x97E50000-0x00000000*/ private float ColRadius, ColHeight;
    local /*0x97E50000-0x00000000*/ private bool bHit;

    // End:0x11
    if(Collider == none)
    {
        return;
    }
    // End:0x27
    if(int(DrillStatus) == int(1))
    {
        return;
    }
    DestructObject = SPGFDestructibleObject(Collider);
    // End:0x71
    if(LPPawn(Collider) != none)
    {
        iDamage = DamageToPlayerFromDrill;        
    }
    else
    {
        // End:0x96
        if(DestructObject != none)
        {
            iDamage = DamageToDestructablesFromDrill;            
        }
        else
        {
            iDamage = DefaultDamageFromDrill;
        }
    }
    // End:0xDF
    if(DestructObject != none)
    {
        // End:0xDF
        if(EncroachList.Find('Actor', DestructObject) >= )
        {            
            return;
        }
    }
    // End:0x657
    if(iDamage > 0)
    {
        Collider.GetBoundingCylinder(ColRadius, ColHeight);
        Extent.X = ColRadius;
        Extent.Y = ColRadius;
        Extent.Z = ColHeight;
        bHit = CheckBumpPrimitive(Mesh, HitLocation, Extent, HitInfo, HitNormal);
        // End:0x657
        if(!bHit)
        {
            // End:0x3E4
            if((HitInfo.PhysMaterial == DrillPlowPhysicalMaterial) || HitInfo.PhysMaterial == DrillGrinderPhysicalMaterial)
            {
                // End:0x3E0
                foreach FeelerList(Feeler)
                {
                    // End:0x3DF
                    if(Feeler.BoneName == HitInfo.BoneName)
                    {
                        // End:0x3DF
                        if(Mesh.GetSocketWorldLocationAndRotation(Feeler.ParticleSocket, NewHitLoc, NewHitRot))
                        {
                            // End:0x33E
                            if(DestructObject != none)
                            {
                                AddEncroachingDestructible(DestructObject, NewHitLoc, Vector(NewHitRot), HitInfo, Feeler.Damage);
                                goto J0x3E0;                                
                            }
                            else
                            {
                                Collider.TakeDamage(iDamage, ((LPBasePlayerPawn(Collider) != none) ? LPBasePlayerPawn(Collider).Controller : none), NewHitLoc, vect(0.0000000, 0.0000000, 0.0000000), Feeler.Damage,, self);
                                // [Explicit Continue]
                                goto J0x3E0;
                            }
                        }
                    }                    
                }
                J0x3E0:
                                
            }
            else
            {
                // End:0x656
                foreach FeelerList(Feeler)
                {
                    // End:0x655
                    if(Mesh.GetSocketWorldLocationAndRotation(Feeler.SocketName, socketLoc, SocketRot))
                    {
                        SocketLocEnd = socketLoc + (Feeler.Length * Vector(SocketRot));
                        // End:0x654
                        foreach TraceActors(Class'Engine.Actor', TraceCollider, HitLocation, HitNormal, SocketLocEnd, socketLoc, Feeler.Extent, HitInfo)
                        {
                            // End:0x653
                            if(TraceCollider == Collider)
                            {
                                Mesh.GetSocketWorldLocationAndRotation(Feeler.ParticleSocket, NewHitLoc, NewHitRot);
                                // End:0x5B2
                                if(DestructObject != none)
                                {
                                    AddEncroachingDestructible(DestructObject, NewHitLoc, Vector(NewHitRot), HitInfo, Feeler.Damage);
                                    // End:0x654
                                    break;
                                    // End:0x653
                                    continue;
                                }
                                Collider.TakeDamage(iDamage, ((LPBasePlayerPawn(Collider) != none) ? LPBasePlayerPawn(Collider).Controller : none), NewHitLoc, vect(0.0000000, 0.0000000, 0.0000000), Feeler.Damage,, self);
                                // End:0x654
                                break;
                            }                            
                        }                        
                    }                    
                }                
            }
        }
    }
    //return;    
}

event @NULL Bump()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitNormal;

    super(Actor).Bump(Other, OtherComp, HitNormal);
    CheckCollisionAgainstTeeth(Other, Other.Location);
    //return;    
}

event EncroachingOn()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    CheckCollisionAgainstTeeth(Other, Other.Location);
    return super(Actor).EncroachingOn(Other);
    //return ReturnValue;    
}

simulated function SetDrillStatus()
{
    local /*0x97E50000-0x00000000*/ private byte E[8388609];

    // End:0x5C
    if(int(E) == int(4))
    {
        // End:0x33
        if(EncroachParticles.Length > 0)
        {
            E = 3;            
        }
        else
        {
            E = 2;
        }
        // End:0x5C
        if(int(E) == int(DrillStatus))
        {
            return;
        }
    }
    switch(E)
    {
        // End:0x77
        case 0:
            // End:0x20A
            break;
        // End:0x11A
        case 1:
            DrillTargetHeight = IdleDrillAngle;
            DrillTargetSpeed = 0.0000000;
            // End:0xEF
            if(DrillSoundLoop != none)
            {
                DrillSoundLoop.Stop();
                DrillSoundLoop = none;
                PlaySound(DrillingStopSoundCue);
            }
            // End:0x117
            if(int(Role) == int(ROLE_Authority))
            {
                MulticastDeactivateEncroachmentParticles();
                DeactivateEncroachmentParticles();
            }
            // End:0x20A
            break;
        // End:0x1AD
        case ROLE_AutonomousProxy:
            DrillTargetHeight = IdleDrillAngle;
            DrillTargetSpeed = DrillIdleRotationSpeed;
            // End:0x17E
            if(DrillSoundLoop != none)
            {
                DrillSoundLoop.Stop();
                DrillSoundLoop = none;
            }
            // End:0x1AA
            if(int(PrevDrillStatus) == int(3))
            {
                PlaySound(DrillingStopSoundCue);
            }
            // End:0x20A
            break;
        // End:0x207
        case 3:
            DrillTargetHeight = HighestDrillAngle;
            DrillTargetSpeed = DrillGrindRotationSpeed;
            // End:0x204
            if(DrillSoundLoop == none)
            {
                DrillSoundLoop = CreateTransportWheelAudioComponent(DrillingSoundCue);
            }
            // End:0x20A
            break;
        // End:0xFFFF
        default:
            break;
    }
    PrevDrillStatus = DrillStatus;
    DrillStatus = E;
    //return;    
}

function AddEncroachingDestructible()
{
    local /*0x97E50000-0x00000000*/ private @NULL DestructObject[8388609], HitLocation, HitNormal, HitInfo;
    local /*0x97E50000-0x00000000*/ private class DT[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ED, PhysMat, PartInfo, sI;

    ED.Actor = DestructObject;
    ED.DamageType = DT;
    ED.HitLocation = HitLocation;
    ED.HitInfo = HitInfo;
    ED.HitNormal = HitNormal;
    ED.iUniqueID = -1;
    PhysMat = SPPhysicalMaterial(Class'SPEngine.SPPhysicalMaterialProperty'.static.GetTraceHitInfoPhysicalMaterial(HitInfo));
    ED.PhyMat = PhysMat;
    // End:0x384
    if(PhysMat != none)
    {
        PartInfo = PhysMat.GetImpactFX(class<SPDamageType>(DT));
        // End:0x384
        if(PartInfo.ParticleSystem != none)
        {
            ED.PartSystem = PartInfo.ParticleSystem;
            sI = PhysMat.GetImpactSound(class<SPDamageType>(DT));
            // End:0x27C
            if(sI.SoundCue != none)
            {
                ED.PartCue = sI.SoundCue;
            }
            ED.iUniqueID = iNextUniqueID++;
            SpawnDrillingParticles(ED.iUniqueID, ED.PartSystem, HitLocation, HitNormal, ED.PartCue);
            MulticastSpawnDrillingParticles(ED.iUniqueID, ED.PartSystem, HitLocation, HitNormal, ED.PartCue);
        }
    }
    EncroachList.AddItem(ED);    
    // End:0x3BA
    if(int(DrillStatus) != int(1))
    {
        SetDrillStatus(3);
    }
    //return;    
}

function FindEncroachParticleIndexFromUniqueID()
{
    local /*0x97E50000-0x00000000*/ private int iUniqueID[8388609], ReturnValue;
    local /*0x97E50000-0x00000000*/ private @NULL PE;
    local /*0x97E50000-0x00000000*/ private int iIndex;

    // End:0x55
    foreach EncroachParticles(PE, iIndex)
    {
        // End:0x54
        if(PE.iUniqueID == iUniqueID)
        {            
            return iIndex;
        }        
    }    
    return -1;
    //return ReturnValue;    
}

function ProcessEncroachers()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL ED;
    local /*0x97E50000-0x00000000*/ private int Index, iParticleIndex;
    local /*0x97E50000-0x00000000*/ private editfixedsize array ToDelete, ToDeleteParticles;

    // End:0x315
    foreach EncroachList(ED, Index)
    {
        // End:0x2A3
        if((ED.Actor != none) && ED.Actor.IsAlive())
        {
            ED.Actor.TakeDamage(DamageToDestructablesFromDrill, none, ED.HitLocation, vect(0.0000000, 0.0000000, 0.0000000), ED.DamageType, ED.HitInfo, self);
            // End:0x2A3
            if(ED.iUniqueID >= 0)
            {
                iParticleIndex = FindEncroachParticleIndexFromUniqueID(ED.iUniqueID);
                // End:0x2A3
                if(iParticleIndex < 0)
                {
                    SpawnDrillingParticles(ED.iUniqueID, ED.PartSystem, ED.HitLocation, ED.HitNormal, ED.PartCue);
                    MulticastSpawnDrillingParticles(ED.iUniqueID, ED.PartSystem, ED.HitLocation, ED.HitNormal, ED.PartCue);
                }
            }
        }
        // End:0x314
        if((ED.Actor == none) || !ED.Actor.IsAlive())
        {
            ToDelete.AddItem(Index);            
        }        
    }    
    Index = ToDelete.Length - 1;
    J0x32D:

    // End:0x3DC [Loop If]
    if(Index >= 0)
    {
        // End:0x3AF
        if(EncroachList[ToDelete[Index]].iUniqueID >= 0)
        {
            ToDeleteParticles.AddItem(EncroachList[ToDelete[Index]].iUniqueID);            
        }
        EncroachList.Remove(ToDelete[Index], 1);        
        --Index;
        // [Loop Continue]
        goto J0x32D;
    }
    Index = ToDeleteParticles.Length - 1;
    J0x3F3:

    // End:0x44A [Loop If]
    if(Index >= 0)
    {
        MulticastDeactivateEncroachmentParticle(ToDeleteParticles[Index]);
        DeactivateEncroachmentParticle(ToDeleteParticles[Index]);
        --Index;
        // [Loop Continue]
        goto J0x3F3;
    }
    // End:0x47C
    if((EncroachList.Length == 0) && int(DrillStatus) != int(1))
    {
        SetDrillStatus(2);
    }
    //return;    
}

simulated function @NULL GetSkeleton()
{
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689];

    return Mesh;
    //return ReturnValue;    
}

reliable client simulated function MulticastSpawnDrillingParticles()
{
    local /*0x97E50000-0x00000000*/ private int iUniqueID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL partSys[8388609], HitLoc, HitNorm, sndCue;

    SpawnDrillingParticles(iUniqueID, partSys, HitLoc, HitNorm, sndCue);
    //return;    
}

simulated function @NULL SpawnDrillingParticles()
{
    local /*0x97E50000-0x00000000*/ private int iUniqueID[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL partSys[8388609], HitLoc, HitNorm, sndCue, ThePool, Comp,
	    ParticleEntry;

    ParticleEntry.iUniqueID = iUniqueID;
    ParticleEntry.PartSystem = partSys;
    ParticleEntry.HitLocation = HitLoc;
    ParticleEntry.HitNormal = HitNorm;
    ParticleEntry.AudioCue = sndCue;
    ParticleEntry.PartComp = none;
    ParticleEntry.AudioComp = none;
    ThePool = SPEmitterPool(WorldInfo.MyEmitterPool);
    Comp = ThePool.SPSpawnEmitter(partSys, HitLoc, Rotator(HitNorm), self);
    // End:0x1A4
    if(Comp != none)
    {
        Comp.ActivateSystem();
    }
    ParticleEntry.PartComp = Comp;
    // End:0x20E
    if(sndCue != none)
    {
        ParticleEntry.AudioComp = CreateAudioComponent(sndCue, true, true);
    }
    EncroachParticles.AddItem(ParticleEntry);    
    //return;    
}

reliable client simulated function MulticastDeactivateEncroachmentParticles()
{
    DeactivateEncroachmentParticles();
    //return;    
}

simulated function DeactivateEncroachmentParticles()
{
    local /*0x97E50000-0x00000000*/ private int iIndex;

    iIndex = 0;
    J0x0B:

    // End:0x151 [Loop If]
    if(iIndex < EncroachParticles.Length)
    {
        // End:0x8B
        if(EncroachParticles[iIndex].AudioComp != none)
        {
            EncroachParticles[iIndex].AudioComp.Stop();
        }
        EncroachParticles[iIndex].AudioComp = none;
        // End:0x11B
        if(EncroachParticles[iIndex].PartComp != none)
        {
            EncroachParticles[iIndex].PartComp.DeactivateSystem();
        }
        EncroachParticles[iIndex].PartComp = none;
        ++iIndex;
        // [Loop Continue]
        goto J0x0B;
    }
    EncroachParticles.Length = 0;
    //return;    
}

reliable client simulated function MulticastDeactivateEncroachmentParticle()
{
    local /*0x97E50000-0x00000000*/ private int iUniqueID[8388609];

    DeactivateEncroachmentParticle(iUniqueID);
    //return;    
}

simulated function DeactivateEncroachmentParticle()
{
    local /*0x97E50000-0x00000000*/ private int iUniqueID[8388609], iParticleIndex;

    iParticleIndex = 0;
    J0x0B:

    // End:0x19C [Loop If]
    if(iParticleIndex < EncroachParticles.Length)
    {
        // End:0x18E
        if(EncroachParticles[iParticleIndex].iUniqueID == iUniqueID)
        {
            // End:0xBF
            if(EncroachParticles[iParticleIndex].PartComp != none)
            {
                EncroachParticles[iParticleIndex].PartComp.DeactivateSystem();
            }
            EncroachParticles[iParticleIndex].PartComp = none;
            // End:0x14F
            if(EncroachParticles[iParticleIndex].AudioComp != none)
            {
                EncroachParticles[iParticleIndex].AudioComp.Stop();
            }
            EncroachParticles[iParticleIndex].AudioComp = none;
            EncroachParticles.Remove(iParticleIndex, 1);            
            return;
        }
        ++iParticleIndex;
        // [Loop Continue]
        goto J0x0B;
    }
    //return;    
}

defaultproperties
{
    DrillIdleRotationSpeed=65536.0000000
    DrillGrindRotationSpeed=131072.0000000
    DrillOscillationSpeed=15.0000000
    DrillDeltaSpeed=32768.0000000
    DamageToPlayerFromDrill=1000
    DamageToDestructablesFromDrill=15
    DefaultDamageFromDrill=1000
    LowestDrillAngle=15.0000000
    HighestDrillAngle=-2.5000000
    IdleDrillAngle=6.5000000
    FeelerList=/* Array type was not detected. */
    MatineeSpeedModifier=1.0000000
    MatineeSpeedDeltaInc=0.0100000
    MatineeSpeedDeltaDec=0.0100000
    MatineeSpeedDeltaBlockedDec=0.1000000
    iNextUniqueID=1
    // Reference: SkeletalMeshComponent'Default__LPSnowcatInterpTransportWheels.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0
    end object
    Mesh=SkeletalMeshComponent0
    Components[0]=SkeletalMeshComponent0
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bCanStepUpOn=false
    CollisionComponent=SkeletalMeshComponent0
}