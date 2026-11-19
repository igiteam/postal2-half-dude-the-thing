class Route extends Info
    placeable
    hidecategories(AnimDependency,Navigation,Movement,Collision)
    classgroup(Navigation)
    implements(EditorLinkSelectionInterface);

enum ERouteFillAction
{
    RFA_Overwrite,                  // 0
    RFA_Add,                        // 1
    RFA_Remove,                     // 2
    RFA_Clear,                      // 3
    RFA_MAX                         // 4
};

enum ERouteDirection
{
    ERD_Forward,                    // 0
    ERD_Reverse,                    // 1
    ERD_MAX                         // 2
};

enum ERouteType
{
    ERT_Linear,                     // 0
    ERT_Loop,                       // 1
    ERT_Circle,                     // 2
    ERT_MAX                         // 3
};

var(*) /*0x35EA0000-0x00000080*/ private @NULL VfTable_IEditorLinkSelectionInterface[268566529];
var(*) /*0x427A0000-0x00000000*/ private byte RouteType[65537];
var(*) /*0x427A0000-0x00000000*/ private editfixedsize array RouteList[65537];
var(*) /*0x427A0000-0x00000000*/ private float FudgeFactor[65537];
var(*) /*0x427A0000-0x00000000*/ private int RouteIndexOffset[65537];

// Export URoute::execResolveRouteIndex(FFrame&, void* const)
native final function ResolveRouteIndex()
{
    local /*0x35EA0000-0x00000000*/ private int Idx[8388609];
    local /*0x35EA0000-0x00000000*/ private byte RouteDirection[8388609], out_bComplete, out_bReverse;
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

// Export URoute::execMoveOntoRoutePath(FFrame&, void* const)
native final function MoveOntoRoutePath()
{
    local /*0x35EA0000-0x00000000*/ private @NULL P[8388609];
    local /*0x35EA0000-0x00000000*/ private byte RouteDirection[9437185];
    local /*0x35EA0000-0x00000000*/ private float DistFudgeFactor[9437185];
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];

    0
    1.0000000                    
}

defaultproperties
{
    FudgeFactor=1.0000000
    Components[0]=none
    Components[1]=none
    Components[2]=none
    bStatic=true
}