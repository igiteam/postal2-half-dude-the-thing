class SpriteComponent extends PrimitiveComponent
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(*) /*0x496A0000-0x00000000*/ private @NULL Sprite[65537];
var(*) /*0x496A0000-0x00000000*/ private bool bIsScreenSizeScaled[65537];
var(*) /*0x496A0000-0x00000000*/ private float ScreenSize[65537];
var(*) /*0x496A0000-0x00000000*/ private float U[65537];
var(*) /*0x496A0000-0x00000000*/ private float UL[65537];
var(*) /*0x496A0000-0x00000000*/ private float V[65537];
var(*) /*0x496A0000-0x00000000*/ private float VL[65537];
var(*) /*0x35EA0000-0x00000000*/ private name SpriteCategoryName;

// Export USpriteComponent::execSetSprite(FFrame&, void* const)
native simulated function SetSprite()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewSprite[8388609];


}

// Export USpriteComponent::execSetUV(FFrame&, void* const)
native simulated function SetUV()
{
    local /*0x35EA0000-0x00000000*/ private int NewU[8388609], NewUL, NewV, NewVL;


}

// Export USpriteComponent::execSetSpriteAndUV(FFrame&, void* const)
native simulated function SetSpriteAndUV()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewSprite[8388609];
    local /*0x35EA0000-0x00000000*/ private int NewU[8388609], NewUL, NewV, NewVL;


}
