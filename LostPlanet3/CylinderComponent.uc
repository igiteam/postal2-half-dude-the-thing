class CylinderComponent extends PrimitiveComponent
    editinlinenew
    collapsecategories
    noexport;

var(*) /*0x15B60000-0x00000000*/ private float CollisionHeight[720897];
var(*) /*0x15B60000-0x00000000*/ private float CollisionRadius[720897];
var(*) /*0x15B60000-0x00000000*/ private @NULL CylinderColor[196609];
var(*) /*0x35EA0000-0x00000000*/ private bool bDrawBoundingBox[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bDrawNonColliding[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bAlwaysRenderIfSelected[131073];

// Export UCylinderComponent::execSetCylinderSize(FFrame&, void* const)
native final function SetCylinderSize()
{
    local /*0x35EA0000-0x00000000*/ private float NewRadius[8388609], NewHeight;


}
