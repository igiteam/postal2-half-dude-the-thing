class RadialBlurComponent extends ActorComponent
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x3F7E0000-0x00000000*/ private @NULL Material[196609];
var(*) /*0x3F7E0000-0x00000000*/ private byte DepthPriorityGroup[196609];
var(*) /*0x3F7E0000-0x00000000*/ private editconst float BlurScale[196609];
var(*) /*0x3F7E0000-0x00000000*/ private editconst float BlurFalloffExponent[196609];
var(*) /*0x3F7E0000-0x00000000*/ private editconst float BlurOpacity[196609];
var(*) /*0x3F7E0000-0x00000000*/ private float MaxCullDistance[196609];
var(*) /*0x3F7E0000-0x00000000*/ private float DistanceFalloffExponent[196609];
var(*) /*0x3F7E0000-0x00000000*/ private bool bRenderAsVelocity[196609];
var(*) /*0x3F7E0000-0x00000000*/ private bool bEnabled[196609];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LocalToWorld[805437441];

// Export URadialBlurComponent::execSetMaterial(FFrame&, void* const)
native function SetMaterial()
{
    local /*0x35EA0000-0x00000000*/ private @NULL InMaterial[8388609];


}

// Export URadialBlurComponent::execSetBlurScale(FFrame&, void* const)
native function SetBlurScale()
{
    local /*0x35EA0000-0x00000000*/ private float InBlurScale[8388609];


}

// Export URadialBlurComponent::execSetBlurFalloffExponent(FFrame&, void* const)
native function SetBlurFalloffExponent()
{
    local /*0x35EA0000-0x00000000*/ private float InBlurFalloffExponent[8388609];


}

// Export URadialBlurComponent::execSetBlurOpacity(FFrame&, void* const)
native function SetBlurOpacity()
{
    local /*0x35EA0000-0x00000000*/ private float InBlurOpacity[8388609];


}

// Export URadialBlurComponent::execSetEnabled(FFrame&, void* const)
native function SetEnabled()
{
    local /*0x35EA0000-0x00000000*/ private bool bInEnabled[8388609];


}

function OnUpdatePropertyBlurScale()
{
    SetBlurScale(BlurScale);
    //return;    
}

function OnUpdatePropertyBlurFalloffExponent()
{
    SetBlurFalloffExponent(BlurFalloffExponent);
    //return;    
}

function OnUpdatePropertyBlurOpacity()
{
    SetBlurOpacity(BlurOpacity);
    //return;    
}
