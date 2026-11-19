class RB_RadialForceActor extends RigidBodyBase
    placeable
    hidecategories(AnimDependency,Navigation);

enum ERadialForceType
{
    RFT_Force,                      // 0
    RFT_Impulse,                    // 1
    RFT_MAX                         // 2
};

var(*) /*0x35EA0000-0x00000400*/ private export @NULL RenderComponent[524289];
var(*) /*0x3FF00000-0x00000000*/ private editconst float ForceStrength[65537];
var(*) /*0x3FF00000-0x00000000*/ private editconst float ForceRadius[65537];
var(*) /*0x3FF00000-0x00000000*/ private editconst float SwirlStrength[65537];
var(*) /*0x3FF00000-0x00000000*/ private editconst float SpinTorque[65537];
var(*) /*0x3FF00000-0x00000000*/ private export byte ForceFalloff[589825];
var(*) /*0x3FF00000-0x00000000*/ private byte RadialForceMode[65537];
var(*) /*0x3FF00000-0x00000000*/ private bool bForceActive[2162689];
var(*) /*0x3FF00000-0x00000000*/ private bool bForceApplyToCloth[65537];
var(*) /*0x3FF00000-0x00000000*/ private bool bForceApplyToFluid[65537];
var(*) /*0x3FF00000-0x00000000*/ private bool bForceApplyToRigidBodies[65537];
var(*) /*0x3FF00000-0x00000000*/ private bool bForceApplyToProjectiles[65537];
var(*) /*0x3FF00000-0x00000000*/ private @NULL CollideWithChannels[196609];

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
    // Reference: DrawSphereComponent'Default__RB_RadialForceActor.DrawSphere0'
    begin object name=DrawSphere0 class=Class'DrawSphereComponent'
    end object
    RenderComponent=DrawSphere0
    ForceStrength=10.0000000
    ForceRadius=200.0000000
    bForceApplyToCloth=true
    bForceApplyToFluid=true
    bForceApplyToRigidBodies=true
    CollideWithChannels=(Default=true,Nothing=false,Pawn=true,Vehicle=true,Water=true,GameplayPhysics=true,EffectPhysics=true,Untitled1=true,Untitled2=true,Untitled3=true,Untitled4=true,Cloth=true,FluidDrain=true,SoftBody=false,FracturedMeshPart=false,BlockingVolume=false,DeadPawn=false,Clothing=false,ClothingCollision=false,PhatPawnSize1=false,PhatPawnSize2=false,PhatPawnSize3=false)
    Components[0]=DrawSphere0
    Components[1]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=0.1000000
}