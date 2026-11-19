class LensFlareComponent extends PrimitiveComponent
    editinlinenew
    hidecategories(Object,Physics,Collision);

struct LensFlareElementInstance
{
};

struct native LensFlareElementMaterials
{
    var(*) /*0x2E590000-0x00000000*/ private editfixedsize array ElementMaterials[65537];

    structdefaultproperties
    {
        ElementMaterials=none
    }
};

var(*) /*0x2E540000-0x00000000*/ private @NULL Template[196609];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PreviewInnerCone[655361];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PreviewOuterCone[655361];
var(*) /*0x35EA0000-0x00000400*/ private export @NULL PreviewRadius[655361];
var(*) /*0x2E540000-0x00000000*/ private bool bAutoActivate[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsActive[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasTranslucency[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasUnlitTranslucency[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasUnlitDistortion[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bUsesSceneColor[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bHasSeparateTranslucency[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bUseTrueConeCalculation[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bVisibleForMobile;
var(*) /*0x35EA0000-0x00000000*/ private float OuterCone[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float InnerCone[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float ConeFudgeFactor[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float Radius[536870913];
var(*) /*0x35EA0000-0x00000000*/ private float MinStrength[536870913];
var(*) /*0x41420000-0x00000000*/ private @NULL SourceColor[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Materials[536870913];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ReleaseResourcesFence[268566529];
var(*) /*0x35EA0000-0x00000000*/ private float NextTraceTime;

// Export ULensFlareComponent::execSetTemplate(FFrame&, void* const)
native final function SetTemplate()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewTemplate[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bForceSet[9437185];

    false                
}

// Export ULensFlareComponent::execSetSourceColor(FFrame&, void* const)
native function SetSourceColor()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InSourceColor[8388609];


}

// Export ULensFlareComponent::execSetIsActive(FFrame&, void* const)
native function SetIsActive()
{
    local /*0x35EA0000-0x00000000*/ private bool bInIsActive[8388609];


}

// Export ULensFlareComponent::execGetMaterial(FFrame&, void* const)
native function GetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private int ElementIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL ReturnValue[92274689];


}

// Export ULensFlareComponent::execSetMaterial(FFrame&, void* const)
native function SetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private int ElementIndex[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Material[8388609];


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
