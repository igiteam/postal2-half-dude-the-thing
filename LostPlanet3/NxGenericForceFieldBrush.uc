class NxGenericForceFieldBrush extends Volume
    placeable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

enum FFB_ForceFieldCoordinates
{
    FFB_CARTESIAN,                  // 0
    FFB_SPHERICAL,                  // 1
    FFB_CYLINDRICAL,                // 2
    FFB_TOROIDAL,                   // 3
    FFB_MAX                         // 4
};

var(*) /*0x36DB0000-0x00000000*/ private int ExcludeChannel[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL CollideWithChannels[65537];
var(*) /*0x36DB0000-0x00000000*/ private byte RBChannel[196609];
var(*) /*0x36DB0000-0x00000000*/ private byte Coordinates[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL Constant[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL PositionMultiplierX[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL PositionMultiplierY[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL PositionMultiplierZ[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL PositionTarget[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL VelocityMultiplierX[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL VelocityMultiplierY[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL VelocityMultiplierZ[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL VelocityTarget[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL Noise[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL FalloffLinear[65537];
var(*) /*0x36DB0000-0x00000000*/ private @NULL FalloffQuadratic[65537];
var(*) /*0x36DB0000-0x00000000*/ private float TorusRadius[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ForceField[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ConvexMeshes[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ExclusionShapes[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ExclusionShapePoses[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LinearKernel[805437441];

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x43
    if(BrushComponent != none)
    {
        bProjTarget = BrushComponent.BlockZeroExtent;
    }
    //return;    
}

simulated function StopsProjectile()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

defaultproperties
{
    ExcludeChannel=1
    CollideWithChannels=(Default=true,Nothing=false,Pawn=true,Vehicle=true,Water=true,GameplayPhysics=true,EffectPhysics=true,Untitled1=true,Untitled2=true,Untitled3=true,Untitled4=false,Cloth=true,FluidDrain=true,SoftBody=true,FracturedMeshPart=false,BlockingVolume=false,DeadPawn=false,Clothing=false,ClothingCollision=false,PhatPawnSize1=false,PhatPawnSize2=false,PhatPawnSize3=false)
    RBChannel=ERBCollisionChannel.RBCC_Untitled1
    TorusRadius=1.0000000
    BrushColor=(R=100,G=255,B=100,A=255)
    bColored=true
    // Reference: BrushComponent'Default__NxGenericForceFieldBrush.BrushComponent0'
    begin object name=BrushComponent0
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bStatic=false
    bProjTarget=true
    CollisionComponent=BrushComponent0
    SupportedEvents=none
}