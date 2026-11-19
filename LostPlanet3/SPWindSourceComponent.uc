class SPWindSourceComponent extends ActorComponent
    editinlinenew
    collapsecategories
    dontsortcategories(All)
    hidecategories(Object);

struct native SPWindSourceInfo
{
    var(*) /*0x35EA0000-0x00000000*/ private int AttachIndex[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LocalToWorld[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL WorldDirection[805437441];
    var(*) /*0x35EA0000-0x00000000*/ private float WorldRadius[805437441];
    var(*) /*0x49920000-0x00000000*/ private editconst @NULL Position[65537];
    var(*) /*0x49920000-0x00000000*/ private editconst @NULL Direction[65537];
    var(*) /*0x49920000-0x00000000*/ private editconst float Speed[65537];
    var(*) /*0x49920000-0x00000000*/ private editconst float OuterRadiusScale[65537];
    var(*) /*0x49920000-0x00000000*/ private editconst float InnerRadiusScale[65537];

    structdefaultproperties
    {
        Position=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Direction=(X=1.0000000,Y=0.0000000,Z=0.0000000)
        Speed=1.0000000
        OuterRadiusScale=1.0000000
        InnerRadiusScale=0.5000000
    }
};

var(*) /*0x49900000-0x00000000*/ private editconst @NULL WindSource[65537];
