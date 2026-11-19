class LandscapeHeightfieldCollisionComponent extends PrimitiveComponent;

var(*) /*0x35EA0000-0x00000000*/ private @NULL CollisionHeightData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ComponentLayers[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DominantLayerData[268566529];
var(*) /*0x35EA0000-0x00000000*/ private int SectionBaseX[131073];
var(*) /*0x35EA0000-0x00000000*/ private int SectionBaseY[131073];
var(*) /*0x35EA0000-0x00000000*/ private int CollisionSizeQuads;
var(*) /*0x35EA0000-0x00000000*/ private float CollisionScale;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CollisionQuadFlags[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array PhysicalMaterials[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL RBHeightfield[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL CachedBoxSphereBounds[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bIncludeHoles;
var(*) /*0x35EA0000-0x00000000*/ private bool bHeightFieldDataHasHole[536870913];
