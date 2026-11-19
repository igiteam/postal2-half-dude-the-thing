class RB_CylindricalForceActor extends RigidBodyBase
    placeable
    hidecategories(AnimDependency,Navigation);

var(*) /*0x3FE30000-0x00000400*/ private export @NULL RenderComponent[589825];
var(*) /*0x3FE30000-0x00000000*/ private editconst float RadialStrength[65537];
var(*) /*0x3FE30000-0x00000000*/ private editconst float RotationalStrength[65537];
var(*) /*0x3FE30000-0x00000000*/ private editconst float LiftStrength[65537];
var(*) /*0x3FE30000-0x00000000*/ private editconst float LiftFalloffHeight[65537];
var(*) /*0x3FE30000-0x00000000*/ private editconst float EscapeVelocity[65537];
var(*) /*0x3FE30000-0x00000000*/ private editconst float ForceRadius[65537];
var(*) /*0x3FE30000-0x00000000*/ private editconst float ForceTopRadius[65537];
var(*) /*0x3FE30000-0x00000000*/ private editconst float ForceHeight[65537];
var(*) /*0x3FE30000-0x00000000*/ private editconst float HeightOffset[65537];
var(*) /*0x3FE30000-0x00000000*/ private bool bForceActive[2162689];
var(*) /*0x3FE30000-0x00000000*/ private bool bForceApplyToCloth[65537];
var(*) /*0x3FE30000-0x00000000*/ private bool bForceApplyToFluid[65537];
var(*) /*0x3FE30000-0x00000000*/ private bool bForceApplyToRigidBodies[65537];
var(*) /*0x3FE30000-0x00000000*/ private bool bForceApplyToProjectiles[65537];
var(*) /*0x3FE30000-0x00000000*/ private @NULL CollideWithChannels[196609];

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
    SetForcedInitialReplicatedProperty(BoolProperty'RB_CylindricalForceActor.bForceActive', bForceActive == default.bForceActive);
    //return;    
}

defaultproperties
{
    // Reference: DrawCylinderComponent'Default__RB_CylindricalForceActor.DrawCylinder0'
    begin object name=DrawCylinder0 class=Class'DrawCylinderComponent'
    end object
    RenderComponent=DrawCylinder0
    EscapeVelocity=10000.0000000
    ForceRadius=200.0000000
    ForceTopRadius=200.0000000
    ForceHeight=200.0000000
    bForceApplyToCloth=true
    bForceApplyToFluid=true
    bForceApplyToRigidBodies=true
    CollideWithChannels=(Default=true,Nothing=false,Pawn=true,Vehicle=true,Water=true,GameplayPhysics=true,EffectPhysics=true,Untitled1=true,Untitled2=true,Untitled3=true,Untitled4=false,Cloth=true,FluidDrain=true,SoftBody=false,FracturedMeshPart=false,BlockingVolume=false,DeadPawn=false,Clothing=false,ClothingCollision=false,PhatPawnSize1=false,PhatPawnSize2=false,PhatPawnSize3=false)
    Components[0]=DrawCylinder0
    Components[1]=none
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bNoDelete=true
    bAlwaysRelevant=true
    bOnlyDirtyReplication=true
    NetUpdateFrequency=0.1000000
}