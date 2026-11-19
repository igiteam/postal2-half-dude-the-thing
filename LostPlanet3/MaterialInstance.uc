class MaterialInstance extends MaterialInterface
    abstract;

var(*) /*0x310B0000-0x00000000*/ private @NULL PhysMaterial[65537];
var(*) /*0x310B0000-0x00000000*/ private @NULL Parent[196609];
var(*) /*0x3C4B0000-0x00000000*/ private @NULL PhysMaterialMask[65537];
var(*) /*0x3C4B0000-0x00000000*/ private int PhysMaterialMaskUVChannel[65537];
var(*) /*0x3C4B0000-0x00000000*/ private @NULL BlackPhysicalMaterial[65537];
var(*) /*0x3C4B0000-0x00000000*/ private @NULL WhitePhysicalMaterial[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasStaticPermutationResource;
var(*) /*0x35EA0000-0x00000000*/ private bool bStaticPermutationDirty[805306369];
var(*) /*0x35EA0000-0x00000000*/ private bool ReentrantFlag[268566529];
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedsMaterialFlattening[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL StaticParameters[268566530];
var(*) /*0x35EA0000-0x00000000*/ private @NULL StaticPermutationResources[268566530];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Resources[268566531];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array ReferencedTextures[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ReferencedTextureGuids[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ParentLightingGuid[131073];

// Export UMaterialInstance::execSetParent(FFrame&, void* const)
native function SetParent()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewParent[8388609];


}

// Export UMaterialInstance::execSetVectorParameterValue(FFrame&, void* const)
native function SetVectorParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Value[25296897];


}

// Export UMaterialInstance::execSetScalarParameterValue(FFrame&, void* const)
native function SetScalarParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private float Value[8388609];


}

// Export UMaterialInstance::execSetScalarCurveParameterValue(FFrame&, void* const)
native function SetScalarCurveParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Value[25296897];


}

// Export UMaterialInstance::execSetTextureParameterValue(FFrame&, void* const)
native function SetTextureParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Value[8388609];


}

// Export UMaterialInstance::execGetTextureParameterValue(FFrame&, void* const)
native function GetTextureParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Value[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

// Export UMaterialInstance::execSetFontParameterValue(FFrame&, void* const)
native function SetFontParameterValue()
{
    local /*0x35EA0000-0x00000000*/ private name ParameterName[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL FontValue[8388609];
    local /*0x35EA0000-0x00000000*/ private int FontPage[8388609];


}

// Export UMaterialInstance::execClearParameterValues(FFrame&, void* const)
native function ClearParameterValues();

// Export UMaterialInstance::execIsInMapOrTransientPackage(FFrame&, void* const)
native function IsInMapOrTransientPackage()
{
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

defaultproperties
{
    PhysMaterialMaskUVChannel=-1
}