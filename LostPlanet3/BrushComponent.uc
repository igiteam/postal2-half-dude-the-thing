class BrushComponent extends PrimitiveComponent
    editinlinenew
    collapsecategories
    noexport;

struct KCachedConvexData_Mirror
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array CachedConvexElements;

    structdefaultproperties
    {
        CachedConvexElements=none
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL Brush[131073];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL BrushAggGeom;
var(*) /*0x35EA0000-0x00000100*/ private @NULL BrushPhysDesc[805437441];
var(*) /*0x35EA0000-0x00000100*/ private @NULL CachedPhysBrushData[805437441];
var(*) /*0x35EA0000-0x00000000*/ private int CachedPhysBrushDataVersion[131073];
var(*) /*0x0D7D0000-0x00000000*/ private bool bBlockComplexCollisionTrace[65537];
