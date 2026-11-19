class MeshComponent extends PrimitiveComponent
    abstract
    noexport;

var(*) /*0x41420000-0x00000000*/ private editfixedsize array Materials[196609];

// Export UMeshComponent::execGetMaterial(FFrame&, void* const)
native function GetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private int ElementIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export UMeshComponent::execSetMaterial(FFrame&, void* const)
native function SetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private int ElementIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Material[8388609];


}

// Export UMeshComponent::execGetNumElements(FFrame&, void* const)
native function GetNumElements()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export UMeshComponent::execClearMaterialOverrides(FFrame&, void* const)
native function ClearMaterialOverrides();

// Export UMeshComponent::execPrestreamTextures(FFrame&, void* const)
native final function PrestreamTextures()
{
    local /*0x35EA0000-0x00000000*/ private float Seconds[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bPrioritizeCharacterTextures[8388609];
    local /*0x35EA0000-0x00000000*/ private int CinematicTextureGroups[9437185];

    0                    
}

function CreateAndSetMaterialInstanceConstant()
{
    local /*0x35EA0000-0x00000000*/ private int ElementIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Instance;

    Instance = new (self) Class'MaterialInstanceConstant';
    Instance.SetParent(GetMaterial(ElementIndex));
    SetMaterial(ElementIndex, Instance);
    return Instance;
    //return ReturnValue;    
}

function CreateAndSetMaterialInstanceTimeVarying()
{
    local /*0x35EA0000-0x00000000*/ private int ElementIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689], Instance;

    Instance = new (self) Class'MaterialInstanceTimeVarying';
    Instance.SetParent(GetMaterial(ElementIndex));
    SetMaterial(ElementIndex, Instance);
    return Instance;
    //return ReturnValue;    
}
