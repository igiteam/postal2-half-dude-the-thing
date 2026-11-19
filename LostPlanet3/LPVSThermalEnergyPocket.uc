class LPVSThermalEnergyPocket extends LPThermalEnergyPocketActor
    notplaceable
    hidecategories(AnimDependency,Navigation);

struct ProjImpactDamageData
{
    var(0.25_Pct) /*0xA7490000-0x00000000*/ private class ProjectileType[65537];
    var(0.25_Pct) /*0xA7490000-0x00000400*/ private editfixedsize @NULL DamageToApply[589825];
    var(0.25_Pct) /*0xA7490000-0x00000000*/ private class DamageTypeToApply[65537];

    structdefaultproperties
    {
        ProjectileType=none
        DamageToApply=none
        DamageTypeToApply=none
    }
};

var(0.25_Pct) /*0x26A10000-0x00000000*/ private editfixedsize array ProjectileDamage[65537];
var(0.25_Pct) /*0x8ADF0000-0x00000400*/ private export @NULL Mesh[589825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DrillSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PistonSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LWheelSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RWheelSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL RotorSkelControl;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MotorTimer;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DrillMotor;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDrillEnabled;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;
var(0.25_Pct) /*0x8ADF0000-0x00000400*/ private export @NULL DrillParticles[589825];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL DrillParticlesComp[524289];

simulated event @NULL PostInitAnimTree()
{
    local /*0x97E50000-0x00000400*/ private @NULL SkelComp[8388609];

    super(Actor).PostInitAnimTree(SkelComp);
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    CylinderComponent(CollisionComponent).SetCylinderSize(Radius, 50.0000000);
    HidePlatform();
    DrillSkelControl = SkelControlSingleBone(Mesh.FindSkelControl('DrillControl'));
    PistonSkelControl = SkelControlSingleBone(Mesh.FindSkelControl('PistonControl'));
    LWheelSkelControl = SkelControlSingleBone(Mesh.FindSkelControl('LWheelControl'));
    RWheelSkelControl = SkelControlSingleBone(Mesh.FindSkelControl('RWheelControl'));
    RotorSkelControl = SkelControlSingleBone(Mesh.FindSkelControl('RotorControl'));
    //return;    
}

simulated event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(Actor).Tick(DeltaTime);
    // End:0x5D
    if(vsPawn == none)
    {
        // End:0x5C
        foreach WorldInfo.AllPawns(Class'LPVSPlayerPawn', vsPawn)
        {
            // End:0x5C
            break;            
        }        
    }
    // End:0x2F3
    if((DrillSkelControl != none) && ((vsPawn != none) && vsPawn.bIsPlatformMode) && !vsPawn.bIsPlatformModeFinished)
    {
        // End:0xE8
        if(!bEnabled)
        {
            SetCollision(true, true);
            bDrillEnabled = true;
        }
        // End:0x101
        if(DrillParticlesComp == none)
        {
            PlayParticles();
        }
        // End:0x131
        if(DrillParticlesComp != none)
        {
            DrillParticlesComp.SetActive(true);
        }
        MotorTimer += (DeltaTime * 2.0000000);
        DrillMotor = (Sin(MotorTimer) * 0.5000000) + 0.5000000;
        DrillSkelControl.SetSkelControlStrength(1.0000000, 0.0000000);
        DrillSkelControl.BoneRotation.Pitch = 65535 - (int(MotorTimer * float(15000)) & 65535);
        RotorSkelControl.SetSkelControlStrength(1.0000000, 0.0000000);
        RotorSkelControl.BoneRotation.Pitch = 65535 - (int(MotorTimer * float(15000)) & 65535);
        PistonSkelControl.SetSkelControlStrength(DrillMotor, 0.0000000);
        LWheelSkelControl.SetSkelControlStrength(DrillMotor, 0.0000000);
        RWheelSkelControl.SetSkelControlStrength(DrillMotor, 0.0000000);        
    }
    else
    {
        // End:0x323
        if(DrillParticlesComp != none)
        {
            DrillParticlesComp.SetActive(false);
        }
        bDrillEnabled = false;
    }
    //return;    
}

function RevealPlatform()
{
    Mesh.SetHidden(false);
    SetCollision(true, true);
    Mesh.SetTraceBlocking(true, Mesh.BlockNonZeroExtent);
    //return;    
}

function HidePlatform()
{
    Mesh.SetHidden(true);
    SetCollision(true, false);
    Mesh.SetTraceBlocking(false, Mesh.BlockNonZeroExtent);
    //return;    
}

event TakeDamage()
{
    local /*0x97E50000-0x00000000*/ private int DamageAmount[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL EventInstigator[8388609], HitLocation, Momentum;
    local /*0x97E50000-0x00000000*/ private class DamageType[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL HitInfo[9437185], DamageCauser;

    // End:0x13
    if(!bBlockActors)
    {
        return;
    }
    // End:0xC4
    if(vsPawn != none)
    {
        vsPawn.TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
        super(Actor).TakeDamage(0, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);        
    }
    else
    {
        super(Actor).TakeDamage(DamageAmount, EventInstigator, HitLocation, Momentum, DamageType, HitInfo, DamageCauser);
    }
    //return;    
}

event TakeImpactDamage()
{
    local /*0x97E50000-0x00000000*/ private class inSourceClass[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL InPosition[8388609], CheckData;

    // End:0xC5
    foreach ProjectileDamage(CheckData)
    {
        // End:0xC4
        if(ClassIsChildOf(inSourceClass, CheckData.ProjectileType))
        {
            TakeDamage(int(CheckData.DamageToApply.GetValue()), none, InPosition, SPMakeVector(0.0000000, 0.0000000, 0.0000000), CheckData.DamageTypeToApply,, self);            
            return;
        }        
    }    
    //return;    
}

simulated event PlayParticles()
{
    // End:0xA0
    if((DrillParticles != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        DrillParticlesComp = new (self) DrillParticles.Class (DrillParticles);
        Mesh.AttachComponentToSocket(DrillParticlesComp, 'DrillParticles');
    }
    //return;    
}

event @NULL Touch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    super(Actor).Touch(Other, OtherComp, HitLocation, HitNormal);
    // End:0xA8
    if(bEnabled)
    {
        // End:0xA8
        if(LPVSPlayerPawn(Other) != none)
        {
            LPVSPlayerPawn(Other).ServerNotifyOnVSThermalPocket(true, self.Location, self.Rotation);
        }
    }
    //return;    
}

event UnTouch()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609];

    super(Actor).UnTouch(Other);
    // End:0x80
    if(LPVSPlayerPawn(Other) != none)
    {
        LPVSPlayerPawn(Other).ServerNotifyOnVSThermalPocket(false, self.Location, self.Rotation);
    }
    //return;    
}

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPVSThermalEnergyPocket.PlatformMeshObj'
    begin object name=PlatformMeshObj class=Class'Engine.SkeletalMeshComponent'
    end object
    Mesh=PlatformMeshObj
    bInitiallyEnabled=true
    bVSExtractionOnly=true
    Radius=1000.0000000
    // Reference: SPDrawCylinderComponent'Default__LPVSThermalEnergyPocket.DrawCylinder0'
    begin object name=DrawCylinder0
    end object
    DrawCylinder=DrawCylinder0
    Components[0]=DrawCylinder0
    // Reference: CylinderComponent'Default__LPVSThermalEnergyPocket.CollisionCylinder'
    begin object name=CollisionCylinder class=Class'Engine.CylinderComponent'
    end object
    Components[1]=CollisionCylinder
    Components[2]=PlatformMeshObj
    Components[3]=none
    bCollideActors=true
    bBlockActors=true
    bNoEncroachCheck=true
    CollisionComponent=PlatformMeshObj
}