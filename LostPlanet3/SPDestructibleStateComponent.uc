class SPDestructibleStateComponent extends ActorComponent
    editinlinenew;

struct native SPDState_MaterialSwap
{
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Original;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Instance;

    structdefaultproperties
    {
        Original=none
        Instance=none
    }
};

var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private editfixedsize array MaterialSwap;

// Export USPDestructibleStateComponent::execGetMyActor(FFrame&, void* const)
native function GetMyActor()
{
    local /*0x01C00000-0x00000000*/ private @NULL ReturnValue[92274689];


}

simulated function @NULL MakeStaticMeshMaterialInstances()
{
    local /*0x01C00000-0x00000400*/ private @NULL StaticMesh[8388609];
    local /*0x01C00000-0x00000000*/ private int Idx;
    local /*0x01C00000-0x00000000*/ private @NULL NewEntry;

    MaterialSwap.Length = 0;
    Idx = 0;
    J0x17:

    // End:0x1AC [Loop If]
    if(true)
    {
        NewEntry.Original = StaticMesh.GetMaterial(Idx);
        // End:0x85
        if(NewEntry.Original == none)
        {
            // [Explicit Break]
            goto J0x1AC;
        }
        NewEntry.Instance = new (none) Class'Engine.MaterialInstanceConstant';
        // End:0xF6
        if(NewEntry.Instance == none)
        {
            NewEntry.Original = none;
            // [Explicit Break]
            goto J0x1AC;            
        }
        else
        {
            NewEntry.Instance.SetParent(NewEntry.Original);
            StaticMesh.SetMaterial(Idx, NewEntry.Instance);
            MaterialSwap.AddItem(NewEntry);            
        }
        ++Idx;
        // [Loop Continue]
        goto J0x17;
    }
    J0x1AC:

    //return;    
}

simulated function @NULL MakeSkeletalMeshMaterialInstances()
{
    local /*0x01C00000-0x00000400*/ private @NULL InSkeletalMesh[8388609];
    local /*0x01C00000-0x00000000*/ private int Idx;
    local /*0x01C00000-0x00000000*/ private @NULL NewEntry;

    MaterialSwap.Length = 0;
    Idx = 0;
    J0x17:

    // End:0x1AC [Loop If]
    if(true)
    {
        NewEntry.Original = InSkeletalMesh.GetMaterial(Idx);
        // End:0x85
        if(NewEntry.Original == none)
        {
            // [Explicit Break]
            goto J0x1AC;
        }
        NewEntry.Instance = new (none) Class'Engine.MaterialInstanceConstant';
        // End:0xF6
        if(NewEntry.Instance == none)
        {
            NewEntry.Original = none;
            // [Explicit Break]
            goto J0x1AC;            
        }
        else
        {
            NewEntry.Instance.SetParent(NewEntry.Original);
            InSkeletalMesh.SetMaterial(Idx, NewEntry.Instance);
            MaterialSwap.AddItem(NewEntry);            
        }
        ++Idx;
        // [Loop Continue]
        goto J0x17;
    }
    J0x1AC:

    //return;    
}

simulated function array CreateMaterialInstances()
{
    local /*0x01C00000-0x00000400*/ private @NULL StaticMesh, SkeletalMesh;
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;
    local /*0x01C00000-0x00000000*/ private @NULL MyActor;

    // End:0x12
    if(MaterialSwap.Length > 0)
    {
        return;
    }
    MyActor = GetMyActor();
    // End:0x37
    if(MyActor == none)
    {
        return;
    }
    MyActor.GetComponentsOfClass(Class'Engine.StaticMeshComponent', ComponentArray);
    // End:0x96
    if(ComponentArray.Length > 0)
    {
        StaticMesh = StaticMeshComponent(ComponentArray[0]);
    }
    // End:0xBB
    if(StaticMesh != none)
    {
        MakeStaticMeshMaterialInstances(StaticMesh);        
    }
    else
    {
        MyActor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
        // End:0x11A
        if(ComponentArray.Length > 0)
        {
            SkeletalMesh = SkeletalMeshComponent(ComponentArray[0]);
        }
        // End:0x13C
        if(SkeletalMesh != none)
        {
            MakeSkeletalMeshMaterialInstances(SkeletalMesh);
        }
    }
    //return;    
}

event array CleanupMaterialInstance()
{
    local /*0x01C00000-0x00000000*/ private int Idx;
    local /*0x01C00000-0x00000400*/ private @NULL StaticMesh, SkeletalMesh;
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;
    local /*0x01C00000-0x00000000*/ private @NULL MyActor;

    MyActor = GetMyActor();
    // End:0x25
    if(MyActor == none)
    {
        return;
    }
    MyActor.GetComponentsOfClass(Class'Engine.StaticMeshComponent', ComponentArray);
    // End:0x84
    if(ComponentArray.Length > 0)
    {
        StaticMesh = StaticMeshComponent(ComponentArray[0]);
    }
    MyActor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
    // End:0xE3
    if(ComponentArray.Length > 0)
    {
        SkeletalMesh = SkeletalMeshComponent(ComponentArray[0]);
    }
    Idx = 0;
    J0xEE:

    // End:0x26C [Loop If]
    if(Idx < MaterialSwap.Length)
    {
        // End:0x135
        if(MaterialSwap[Idx].Original == none)
        {
            // [Explicit Break]
            goto J0x26C;
        }
        // End:0x164
        if(MaterialSwap[Idx].Instance == none)
        {
            // [Explicit Break]
            goto J0x26C;
        }
        // End:0x1C4
        if(StaticMesh != none)
        {
            StaticMesh.SetMaterial(Idx, MaterialSwap[Idx].Original);            
        }
        else
        {
            // End:0x221
            if(SkeletalMesh != none)
            {
                SkeletalMesh.SetMaterial(Idx, MaterialSwap[Idx].Original);
            }
        }
        MaterialSwap[Idx].Instance.SetParent(none);
        Idx++;
        // [Loop Continue]
        goto J0xEE;
    }
    J0x26C:

    MaterialSwap.Length = 0;
    //return;    
}

simulated function SetMaterialParamter()
{
    local /*0x01C00000-0x00000000*/ private name ParamName[8388609];
    local /*0x01C00000-0x00000000*/ private float CurrentAlpha[8388609];
    local /*0x01C00000-0x00000000*/ private int Idx;

    CreateMaterialInstances();
    Idx = 0;
    J0x15:

    // End:0xB5 [Loop If]
    if(Idx < MaterialSwap.Length)
    {
        // End:0xA7
        if(MaterialSwap[Idx].Instance != none)
        {
            MaterialSwap[Idx].Instance.SetScalarParameterValue(ParamName, CurrentAlpha);
        }
        Idx++;
        // [Loop Continue]
        goto J0x15;
    }
    //return;    
}
