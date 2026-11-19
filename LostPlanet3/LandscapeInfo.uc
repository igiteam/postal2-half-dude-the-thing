class LandscapeInfo extends Object;

struct native LandscapeAddCollision
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Corners[4];

    structdefaultproperties
    {
        Corners[0]=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Corners[1]=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Corners[2]=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Corners[3]=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    }
};

var(*) /*0x35EA0000-0x00000000*/ private @NULL LandscapeGuid[131073];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} LayerInfoMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL DataInterface[268566529];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} XYtoComponentMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} XYtoCollisionComponentMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL LandscapeProxy[131073];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} XYtoAddCollisionMap[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Proxies[805437441];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SelectedComponents[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SelectedCollisionComponents[268566529];
var(*) /*0x35EA0000-0x00000000*/ private @NULL SelectedRegionComponents[268566529];
var(*) /*0x35EA0000-0x00000000*/ private map{VOID,VOID} SelectedRegion[268566529];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string HeightmapFilePath;
var(*) /*0x35EA0000-0x00000000*/ private bool bIsValid[536870913];
