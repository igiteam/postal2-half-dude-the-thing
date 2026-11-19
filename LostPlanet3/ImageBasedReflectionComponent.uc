class ImageBasedReflectionComponent extends StaticMeshComponent
    editinlinenew
    hidecategories(Object,StaticMeshComponent);

var(*) /*0x29AF0000-0x00000000*/ private bool bEnabled[65537];
var(*) /*0x29AF0000-0x00000000*/ private bool bTwoSided[65537];
var(*) /*0x29AF0000-0x00000000*/ private @NULL ReflectionTexture[65537];
var(*) /*0x29AF0000-0x00000000*/ private editconst @NULL ReflectionColor[65537];

// Export UImageBasedReflectionComponent::execSetEnabled(FFrame&, void* const)
native final function SetEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bSetEnabled[8388609];


}

// Export UImageBasedReflectionComponent::execUpdateImageReflectionParameters(FFrame&, void* const)
native final function UpdateImageReflectionParameters();

function OnUpdatePropertyReflectionColor()
{
    UpdateImageReflectionParameters();
    //return;    
}
