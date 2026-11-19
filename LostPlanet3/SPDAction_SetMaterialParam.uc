class SPDAction_SetMaterialParam extends SPDAction_Latent
    editinlinenew
    collapsecategories
    hidecategories(Object);

struct native SPDMaterialSwap
{
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Original;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Instance;

    structdefaultproperties
    {
        Original=none
        Instance=none
    }
};

struct native SPDAction_SetMaterialParamData
{
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float CurrentAlpha;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private float totalElapsedTime;
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000400*/ private export @NULL StateComponent[524289];
    var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private @NULL Swap[8];

    structdefaultproperties
    {
        CurrentAlpha=0.0000000
        totalElapsedTime=0.0000000
        StateComponent=none
        Swap[0]=(Original=none,Instance=none)
        Swap[1]=(Original=none,Instance=none)
        Swap[2]=(Original=none,Instance=none)
        Swap[3]=(Original=none,Instance=none)
        Swap[4]=(Original=none,Instance=none)
        Swap[5]=(Original=none,Instance=none)
        Swap[6]=(Original=none,Instance=none)
        Swap[7]=(Original=none,Instance=none)
    }
};

var(__OnDestroyed__Delegate) /*0x028A0000-0x00000000*/ private name ParamName[65537];
var(__OnDestroyed__Delegate) /*0x028A0000-0x00000000*/ private float StartValue[65537];
var(__OnDestroyed__Delegate) /*0x028A0000-0x00000000*/ private float EndValue[65537];
var(__OnDestroyed__Delegate) /*0x02670000-0x00000000*/ private float TimeInSeconds[65537];
var(__OnDestroyed__Delegate) /*0x01C00000-0x00000000*/ private export @NULL Data;

// Export USPDAction_SetMaterialParam::execPushDataNative(FFrame&, void* const)
native function PushDataNative()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609];


}

// Export USPDAction_SetMaterialParam::execPopDataNative(FFrame&, void* const)
native function PopDataNative()
{
    local /*0x01C00000-0x00000000*/ private @NULL manager[8388609];


}

function UpdateMaterialInstance()
{
    local /*0x01C00000-0x00000000*/ private int Idx;

    // End:0x7B
    if(Data.StateComponent != none)
    {
        Data.StateComponent.SetMaterialParamter(ParamName, Data.CurrentAlpha);
        return;
    }
    Idx = 0;
    J0x86:

    // End:0x19C [Loop If]
    if(Idx < 8)
    {
        // End:0xD8
        if(Data.Swap[Idx].Original == none)
        {
            // [Explicit Break]
            goto J0x19C;
        }
        // End:0x11A
        if(Data.Swap[Idx].Instance == none)
        {
            // [Explicit Break]
            goto J0x19C;
        }
        Data.Swap[Idx].Instance.SetScalarParameterValue(ParamName, Data.CurrentAlpha);
        Idx++;
        // [Loop Continue]
        goto J0x86;
    }
    J0x19C:

    //return;    
}

function array CleanupMaterialInstance()
{
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609];
    local /*0x01C00000-0x00000000*/ private int Idx;
    local /*0x01C00000-0x00000400*/ private @NULL StaticMesh, SkeletalMesh;
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;

    // End:0x42
    if(Data.StateComponent != none)
    {
        Data.StateComponent = none;
        return;
    }
    Actor.GetComponentsOfClass(Class'Engine.StaticMeshComponent', ComponentArray);
    // End:0xA1
    if(ComponentArray.Length > 0)
    {
        StaticMesh = StaticMeshComponent(ComponentArray[0]);
    }
    Actor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
    // End:0x100
    if(ComponentArray.Length > 0)
    {
        SkeletalMesh = SkeletalMeshComponent(ComponentArray[0]);
    }
    Idx = 0;
    J0x10B:

    // End:0x2E0 [Loop If]
    if(Idx < 8)
    {
        // End:0x15D
        if(Data.Swap[Idx].Original == none)
        {
            // [Explicit Break]
            goto J0x2E0;
        }
        // End:0x19F
        if(Data.Swap[Idx].Instance == none)
        {
            // [Explicit Break]
            goto J0x2E0;
        }
        // End:0x212
        if(StaticMesh != none)
        {
            StaticMesh.SetMaterial(Idx, Data.Swap[Idx].Original);            
        }
        else
        {
            // End:0x282
            if(SkeletalMesh != none)
            {
                SkeletalMesh.SetMaterial(Idx, Data.Swap[Idx].Original);
            }
        }
        Data.Swap[Idx].Instance.SetParent(none);
        Idx++;
        // [Loop Continue]
        goto J0x10B;
    }
    J0x2E0:

    Idx = 0;
    J0x2EB:

    // End:0x37F [Loop If]
    if(Idx < 8)
    {
        Data.Swap[Idx].Original = none;
        Data.Swap[Idx].Instance = none;
        Idx++;
        // [Loop Continue]
        goto J0x2EB;
    }
    //return;    
}

function @NULL MakeStaticMeshMaterialInstances()
{
    local /*0x01C00000-0x00000400*/ private @NULL StaticMesh[8388609];
    local /*0x01C00000-0x00000000*/ private int Idx;

    Idx = 0;
    Idx = 0;
    J0x16:

    // End:0x2C1 [Loop If]
    if(Idx < 8)
    {
        Data.Swap[Idx].Original = StaticMesh.GetMaterial(Idx);
        // End:0x105
        if(Data.Swap[Idx].Original == none)
        {
            Data.Swap[Idx].Instance = none;
            // [Explicit Break]
            goto J0x2C1;
        }
        Data.Swap[Idx].Instance = new (none) Class'Engine.MaterialInstanceConstant';
        // End:0x1CA
        if(Data.Swap[Idx].Instance == none)
        {
            Data.Swap[Idx].Original = none;
            // [Explicit Break]
            goto J0x2C1;
        }
        Data.Swap[Idx].Instance.SetParent(Data.Swap[Idx].Original);
        StaticMesh.SetMaterial(Idx, Data.Swap[Idx].Instance);
        Idx++;
        // [Loop Continue]
        goto J0x16;
    }
    J0x2C1:

    UpdateMaterialInstance();
    //return;    
}

function @NULL MakeSkeletalMeshMaterialInstances()
{
    local /*0x01C00000-0x00000400*/ private @NULL SkeletalMesh[8388609];
    local /*0x01C00000-0x00000000*/ private int Idx;

    Idx = 0;
    Idx = 0;
    J0x16:

    // End:0x2C1 [Loop If]
    if(Idx < 8)
    {
        Data.Swap[Idx].Original = SkeletalMesh.GetMaterial(Idx);
        // End:0x105
        if(Data.Swap[Idx].Original == none)
        {
            Data.Swap[Idx].Instance = none;
            // [Explicit Break]
            goto J0x2C1;
        }
        Data.Swap[Idx].Instance = new (none) Class'Engine.MaterialInstanceConstant';
        // End:0x1CA
        if(Data.Swap[Idx].Instance == none)
        {
            Data.Swap[Idx].Original = none;
            // [Explicit Break]
            goto J0x2C1;
        }
        Data.Swap[Idx].Instance.SetParent(Data.Swap[Idx].Original);
        SkeletalMesh.SetMaterial(Idx, Data.Swap[Idx].Instance);
        Idx++;
        // [Loop Continue]
        goto J0x16;
    }
    J0x2C1:

    UpdateMaterialInstance();
    //return;    
}

event array Enter()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];
    local /*0x01C00000-0x00000400*/ private @NULL StaticMesh, SkeletalMesh;
    local /*0x01C00000-0x00000400*/ private editfixedsize array ComponentArray;

    // End:0x1A
    if(ParamName == 'None')
    {
        return 1;
    }
    // End:0x30
    if(TimeInSeconds < 0.0010000)
    {
        return 1;
    }
    // End:0x4A
    if(StartValue == EndValue)
    {
        return 1;
    }
    Data.totalElapsedTime = 0.0000000;
    Data.CurrentAlpha = StartValue;
    Data.StateComponent = none;
    Actor.GetComponentsOfClass(Class'SPDestructibleStateComponent', ComponentArray);
    // End:0x125
    if(ComponentArray.Length > 0)
    {
        Data.StateComponent = SPDestructibleStateComponent(ComponentArray[0]);
        return 0;
    }
    Actor.GetComponentsOfClass(Class'Engine.StaticMeshComponent', ComponentArray);
    // End:0x184
    if(ComponentArray.Length > 0)
    {
        StaticMesh = StaticMeshComponent(ComponentArray[0]);
    }
    // End:0x1AC
    if(StaticMesh != none)
    {
        MakeStaticMeshMaterialInstances(StaticMesh);
        return 0;        
    }
    else
    {
        Actor.GetComponentsOfClass(Class'Engine.SkeletalMeshComponent', ComponentArray);
        // End:0x20B
        if(ComponentArray.Length > 0)
        {
            SkeletalMesh = SkeletalMeshComponent(ComponentArray[0]);
        }
        // End:0x230
        if(SkeletalMesh != none)
        {
            MakeSkeletalMeshMaterialInstances(SkeletalMesh);
            return 0;
        }
    }
    return 1;
    //return ReturnValue;    
}

event Run()
{
    local /*0x01C00000-0x00000000*/ private float ElapsedTime[8388609];
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;
    local /*0x01C00000-0x00000000*/ private byte ReturnValue[92274689];

    Data.totalElapsedTime += ElapsedTime;
    // End:0x87
    if(Data.totalElapsedTime >= TimeInSeconds)
    {
        Data.CurrentAlpha = EndValue;
        UpdateMaterialInstance();
        return 1;        
    }
    else
    {
        Data.CurrentAlpha = ((Data.totalElapsedTime / TimeInSeconds) * (EndValue - StartValue)) + StartValue;
    }
    UpdateMaterialInstance();
    return 0;
    //return ReturnValue;    
}

event Exit()
{
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;

    Data.CurrentAlpha = EndValue;
    CleanupMaterialInstance(Actor);
    //return;    
}

event Abort()
{
    local /*0x01C00000-0x00000000*/ private @NULL Actor[8388609], manager, DamageInfo;

    Exit(Actor, manager, DamageInfo);
    //return;    
}

defaultproperties
{
    TimeInSeconds=0.5000000
}