class SPDDecal extends DecalActorBase
    hidecategories(AnimDependency,Navigation);

struct native DecalTuneInfo
{
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float Radius;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float Height;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Material;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float LifeSpan;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private int SortOrder;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private bool bForceDynamicRenderElement;

    structdefaultproperties
    {
        Radius=0.0000000
        Height=0.0000000
        Material=none
        LifeSpan=0.0000000
        SortOrder=0
        bForceDynamicRenderElement=false
    }
};

static simulated function CreateInstance()
{
    local /*0x01C00000-0x00000000*/ private @NULL InCreator[8388609], InCreateSpec, InLoc, ReturnValue, NewDecal, Rot,
	    pos;

    pos = InLoc;
    pos.Z += InCreateSpec.Height;
    Rot.Pitch = -16384;
    Rot.Roll = int(RandRange(0.0000000, 32767.0000000));
    Rot.Yaw = 32768;
    NewDecal = InCreator.Spawn(default.Class,,, pos, Rot,, true);
    NewDecal.Init(InCreateSpec);
    return NewDecal;
    //return ReturnValue;    
}

simulated function Init()
{
    local /*0x01C00000-0x00000000*/ private @NULL InCreateSpec[25296897], MITV_Decal;

    Decal.Width = InCreateSpec.Radius * float(2);
    Decal.Height = InCreateSpec.Radius * float(2);
    Decal.SortOrder = InCreateSpec.SortOrder;
    Decal.bForceKeepOriginalSortOrder = true;
    Decal.bForceDynamicRenderElement = InCreateSpec.bForceDynamicRenderElement;
    // End:0x271
    if(InCreateSpec.Material != none)
    {
        // End:0x236
        if(ClassIsChildOf(InCreateSpec.Material.Class, Class'Engine.MaterialInstanceTimeVarying'))
        {
            MITV_Decal = new (self) Class'Engine.MaterialInstanceTimeVarying';
            MITV_Decal.SetParent(InCreateSpec.Material);
            Decal.SetDecalMaterial(MITV_Decal);
            MITV_Decal.SetDuration(InCreateSpec.LifeSpan);            
        }
        else
        {
            Decal.SetDecalMaterial(InCreateSpec.Material);
        }
    }
    LifeSpan = InCreateSpec.LifeSpan;
    //return;    
}

function KillSelf()
{
    Destroy();
    bForceNetUpdate = true;
    //return;    
}

defaultproperties
{
    // Reference: DecalComponent'Default__SPDDecal.NewDecalComponent'
    begin object name=NewDecalComponent
    end object
    Decal=NewDecalComponent
    Components[0]=NewDecalComponent
    Components[1]=none
    Components[2]=none
    Rotation=(Pitch=49152,Yaw=0,Roll=0)
    RemoteRole=ENetRole.ROLE_SimulatedProxy
    bStatic=false
    bMovable=true
}