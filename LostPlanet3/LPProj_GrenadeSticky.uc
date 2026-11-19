class LPProj_GrenadeSticky extends LPProj_Grenade
    config(AI)
    hidecategories(AnimDependency,Navigation);

struct RepAttachInfo
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAttach;
    var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL Other[524289];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HitPos;

    structdefaultproperties
    {
        bAttach=false
        Other=none
        HitPos=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsStickied;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL StickyMesh[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL StickyComponent[524289];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL StickyParticles[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private export travel RepAttachInfo AttachInfo[2097153];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL StickSound;

simulated event ReplicatedEvent()
{
    local /*0x97E50000-0x00000000*/ private name VarName[8388609];

    // End:0x8D
    if(VarName == 'AttachInfo')
    {
        // End:0x8A
        if(AttachInfo.bAttach && Mesh != none)
        {
            AttachTo(AttachInfo.Other, AttachInfo.HitPos);
        }        
    }
    else
    {
        super.ReplicatedEvent(VarName);
    }
    //return;    
}

simulated function GetVisibleLocation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return GetSkeletalMesh().GetBoneLocation('JO_positionTracker');
    //return ReturnValue;    
}

simulated function @NULL DoImpact()
{
    local /*0x97E50000-0x00000000*/ private @NULL Other[8388609], OtherComp, HitLocation, HitNormal;

    // End:0x2B
    if(!bIsStickied)
    {
        AttachTo(OtherComp, HitLocation);
    }
    //return;    
}

simulated function @NULL AttachTo()
{
    local /*0x97E50000-0x00000400*/ private @NULL OtherComponent[8388609], HitLocation, OtherMesh;
    local /*0x97E50000-0x00000000*/ private name NearBone;
    local /*0x97E50000-0x00000000*/ private @NULL BoneLoc, AttachPos, AttachRot;

    bIsStickied = true;
    StopSimulating();
    // End:0x3E
    if(GrenadeTuneData.bAllowDamageFromBullets)
    {
        SetCollision(true, false);
    }
    DisableMeshInPhysX();
    SetLocation(HitLocation);
    // End:0x7B
    if(StickSound != none)
    {
        PlaySound(StickSound);
    }
    // End:0xFA
    if(int(Role) == int(ROLE_Authority))
    {
        AttachInfo.bAttach = true;
        AttachInfo.Other = OtherComponent;
        AttachInfo.HitPos = HitLocation;
    }
    OtherMesh = SkeletalMeshComponent(OtherComponent);
    // End:0x22C
    if(OtherMesh != none)
    {
        NearBone = OtherMesh.FindClosestBone(Location, BoneLoc);
        OtherMesh.TransformToBoneSpace(NearBone, HitLocation, Mesh.Rotation, AttachPos, AttachRot);
        OtherMesh.AttachComponent(Mesh, NearBone, AttachPos, AttachRot);
        StickyMesh = OtherMesh;
        StickyComponent = Mesh;
    }
    //return;    
}

simulated function RemoveSticky()
{
    // End:0x42
    if(StickyMesh != none)
    {
        StickyMesh.DetachComponent(StickyComponent);
        StickyMesh = none;
    }
    //return;    
}

simulated event Destroyed()
{
    RemoveSticky();
    super.Destroyed();
    //return;    
}

simulated event @NULL SpawnParticles()
{
    local /*0x97E50000-0x00000400*/ private @NULL PSC[8388609], CustomParticleComp;

    // End:0xA3
    if((PSC != none) && int(WorldInfo.NetMode) != int(NM_DedicatedServer))
    {
        CustomParticleComp = new (self) PSC.Class (PSC);
        AttachComponent(CustomParticleComp);
        CustomParticleComp.SetActive(true);
    }
    //return;    
}

defaultproperties
{
    // Reference: DynamicLightEnvironmentComponent'Default__LPProj_GrenadeSticky.MyLightEnvironment'
    begin object name=MyLightEnvironment
    end object
    ProjLightEnvironment=MyLightEnvironment
    // Reference: CylinderComponent'Default__LPProj_GrenadeSticky.CollisionCylinder'
    begin object name=CollisionCylinder
    end object
    CylinderComponent=CollisionCylinder
    Components[0]=CollisionCylinder
    Components[1]=MyLightEnvironment
    bBounce=false
    CollisionComponent=CollisionCylinder
}