class ProcBuildingRuleset extends Object
    hidecategories(Object);

enum EProcBuildingAxis
{
    EPBAxis_X,                      // 0
    EPBAxis_Z,                      // 1
    EPBAxis_MAX                     // 2
};

struct native PBVariationInfo
{
    var(*) /*0x3B860000-0x00000000*/ private name VariationName[65537];
    var(*) /*0x3B860000-0x00000000*/ private bool bMeshOnTopOfFacePoly[65537];

    structdefaultproperties
    {
        VariationName="None"
        bMeshOnTopOfFacePoly=false
    }
};

struct native PBParamSwatch
{
    var(*) /*0x3B6E0000-0x00000000*/ private name SwatchName[65537];
    var(*) /*0x3B6E0000-0x00000000*/ private editfixedsize array Params[65537];

    structdefaultproperties
    {
        SwatchName="None"
        Params=none
    }
};

var(*) /*0x35EA0000-0x00000400*/ private editfixedsize @NULL RootRule[524289];
var(*) /*0x35EA0000-0x00000000*/ private bool bBeingEdited[536870913];
var(*) /*0x2F830000-0x00000000*/ private bool bEnableInteriorTexture[65537];
var(*) /*0x2F830000-0x00000000*/ private bool bLODOnlyRoof[65537];
var(*) /*0x3E7B0000-0x00000000*/ private bool bPickRandomSwatch[65537];
var(*) /*0x422F0000-0x00000000*/ private @NULL DefaultRoofMaterial[65537];
var(*) /*0x23750000-0x00000000*/ private @NULL DefaultFloorMaterial[65537];
var(*) /*0x3E7B0000-0x00000000*/ private @NULL DefaultNonRectWallMaterial[65537];
var(*) /*0x422F0000-0x00000000*/ private float RoofZOffset[65537];
var(*) /*0x422F0000-0x00000000*/ private float NotRoofZOffset[65537];
var(*) /*0x23750000-0x00000000*/ private float FloorZOffset[65537];
var(*) /*0x23750000-0x00000000*/ private float NotFloorZOffset[65537];
var(*) /*0x422F0000-0x00000000*/ private float RoofPolyInset[65537];
var(*) /*0x23750000-0x00000000*/ private float FloorPolyInset[65537];
var(*) /*0x2F830000-0x00000000*/ private float BuildingLODSpecular[65537];
var(*) /*0x422F0000-0x00000000*/ private float RoofEdgeScopeRaise[65537];
var(*) /*0x2F830000-0x00000000*/ private @NULL LODCubemap[65537];
var(*) /*0x2F830000-0x00000000*/ private @NULL InteriorTexture[65537];
var(*) /*0x3E7B0000-0x00000000*/ private editfixedsize array Variations[65537];
var(*) /*0x3E7B0000-0x00000000*/ private editfixedsize array ParamSwatches[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Comments;

defaultproperties
{
    bEnableInteriorTexture=true
    BuildingLODSpecular=2.0000000
}