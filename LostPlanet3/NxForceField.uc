class NxForceField extends Actor
    abstract
    notplaceable
    hidecategories(AnimDependency,Navigation)
    classgroup(Physics);

var(*) /*0x36CF0000-0x00000000*/ private int ExcludeChannel[65537];
var(*) /*0x36CF0000-0x00000000*/ private bool bForceActive[2162689];
var(*) /*0x36CF0000-0x00000000*/ private @NULL CollideWithChannels[196609];
var(*) /*0x36CF0000-0x00000000*/ private byte RBChannel[196609];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ForceField[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ConvexMeshes[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ExclusionShapes[805437441];
var(*) /*0x35EA0000-0x00000000*/ private array ExclusionShapePoses[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL U2NRotation[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int SceneIndex[268566529];

// Export UNxForceField::execDoInitRBPhys(FFrame&, void* const)
native function DoInitRBPhys();

simulated function OnToggle()
{
    local /*0x35EA0000-0x00000000*/ private @NULL inAction[8388609];

    // End:0x46
    if(inAction.InputLinks[0].bHasImpulse)
    {
        bForceActive = true;        
    }
    else
    {
        // End:0x8C
        if(inAction.InputLinks[1].bHasImpulse)
        {
            bForceActive = false;            
        }
        else
        {
            // End:0xDB
            if(inAction.InputLinks[2].bHasImpulse)
            {
                bForceActive = !bForceActive;
            }
        }
    }
    SetForcedInitialReplicatedProperty(BoolProperty'RB_RadialForceActor.bForceActive', bForceActive == default.bForceActive);
    //return;    
}

defaultproperties
{
    bForceActive=true
    CollideWithChannels=(Default=true,Nothing=false,Pawn=true,Vehicle=true,Water=true,GameplayPhysics=true,EffectPhysics=true,Untitled1=true,Untitled2=true,Untitled3=true,Untitled4=false,Cloth=true,FluidDrain=true,SoftBody=true,FracturedMeshPart=false,BlockingVolume=false,DeadPawn=false,Clothing=false,ClothingCollision=false,PhatPawnSize1=false,PhatPawnSize2=false,PhatPawnSize3=false)
    RBChannel=ERBCollisionChannel.RBCC_Nothing
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=0.1000000
}