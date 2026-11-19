class Landscape extends LandscapeProxy
    notplaceable
    hidecategories(AnimDependency,Navigation,Attachment,Physics,Debug,LandscapeProxy);

enum ELandscapeSetupErrors
{
    LSE_None,                       // 0
    LSE_NoLandscapeInfo,            // 1
    LSE_CollsionXY,                 // 2
    LSE_NoLayerInfo,                // 3
    LSE_MAX                         // 4
};

struct native LandscapeLayerInfo
{
    var(*) /*0x2DA90000-0x00000000*/ private name LayerName[65537];
    var(*) /*0x2DA90000-0x00000000*/ private float Hardness[65537];
    var(*) /*0x35EA0000-0x00000000*/ private bool bNoWeightBlend;
    var(*) /*0x2DA90000-0x00000000*/ private @NULL PhysMaterial[65537];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ThumbnailMIC;
    var(*) /*0x35EA0000-0x00000000*/ private bool bSelected[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private int DebugColorChannel[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string LayerSourceFile[536870913];

    structdefaultproperties
    {
        LayerName="None"
        Hardness=0.0000000
        bNoWeightBlend=false
        PhysMaterial=none
        ThumbnailMIC=none
        bSelected=false
        DebugColorChannel=0
        LayerSourceFile=""
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array LayerNames;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize transient array LayerInfos;

defaultproperties
{
    bIsProxy=false
    bLockLocation=false
}