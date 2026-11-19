class Brush extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation,Object,Movement,Display);

enum ECsgOper
{
    CSG_Active,                     // 0
    CSG_Add,                        // 1
    CSG_Subtract,                   // 2
    CSG_Intersect,                  // 3
    CSG_Deintersect,                // 4
    CSG_MAX                         // 5
};

struct native export GeomSelection
{
    var(*) /*0x35EA0000-0x00000000*/ private int Type;
    var(*) /*0x35EA0000-0x00000000*/ private int Index;
    var(*) /*0x35EA0000-0x00000000*/ private int SelectionIndex;

    structdefaultproperties
    {
        Type=0
        Index=0
        SelectionIndex=0
    }
};

var(*) /*0x0D7A0000-0x00000000*/ private byte CsgOper[65537];
var(*) /*0x0D7A0000-0x00000000*/ private @NULL BrushColor[65537];
var(*) /*0x35EA0000-0x00000000*/ private int PolyFlags;
var(*) /*0x0D7A0000-0x00000000*/ private bool bColored[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bSolidWhenSelected;
var(*) /*0x35EA0000-0x00000000*/ private bool bPlaceableFromClassBrowser;
var(*) /*0x35EA0000-0x00000000*/ private bool bUseTransformRotation;
var(*) /*0x0D7A0000-0x00000000*/ private bool bAlwaysShowPolys[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Brush[655361];
var(*) /*0x35EA0000-0x00000400*/ private const export @NULL BrushComponent[655361];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array SavedSelections;

defaultproperties
{
    // Reference: BrushComponent'Default__Brush.BrushComponent0'
    begin object name=BrushComponent0 class=Class'BrushComponent'
    end object
    BrushComponent=BrushComponent0
    Components[0]=BrushComponent0
    bStatic=true
    bHidden=true
    bNoDelete=true
    bEdShouldSnap=true
    CollisionComponent=BrushComponent0
}