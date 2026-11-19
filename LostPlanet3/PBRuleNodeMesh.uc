class PBRuleNodeMesh extends PBRuleNodeBase
    editinlinenew
    collapsecategories
    hidecategories(Object,Object);

struct native BuildingMatOverrides
{
    var(*) /*0x0EF70000-0x00000000*/ private editfixedsize array MaterialOptions[65537];

    structdefaultproperties
    {
        MaterialOptions=none
    }
};

struct native BuildingMeshInfo
{
    var(*) /*0x0EFB0000-0x00000000*/ private @NULL Mesh[65537];
    var(*) /*0x0EFB0000-0x00000000*/ private float DimX[65537];
    var(*) /*0x0EFB0000-0x00000000*/ private float DimZ[65537];
    var(*) /*0x0EFB0000-0x00000000*/ private float Chance[65537];
    var(*) /*0x0EFB0000-0x00000400*/ private export @NULL Translation[589825];
    var(*) /*0x0EFB0000-0x00000400*/ private export @NULL Rotation[589825];
    var(*) /*0x0EFB0000-0x00000000*/ private bool bMeshScaleTranslation[65537];
    var(*) /*0x0EFB0000-0x00000000*/ private bool bOverrideMeshLightMapRes[65537];
    var(*) /*0x0EFB0000-0x00000000*/ private int OverriddenMeshLightMapRes[65537];
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MaterialOverrides;
    var(*) /*0x0EFB0000-0x00000000*/ private editfixedsize array SectionOverrides[65537];

    structdefaultproperties
    {
        Mesh=none
        DimX=512.0000000
        DimZ=512.0000000
        Chance=1.0000000
        Translation=none
        Rotation=none
        bMeshScaleTranslation=false
        bOverrideMeshLightMapRes=false
        OverriddenMeshLightMapRes=32
        MaterialOverrides=none
        SectionOverrides=none
    }
};

var(*) /*0x3B790000-0x00000000*/ private editfixedsize export array BuildingMeshes[65537];
var(*) /*0x3B790000-0x00000000*/ private editfixedsize export @NULL PartialOccludedBuildingMesh[65537];
var(*) /*0x3B790000-0x00000000*/ private bool bDoOcclusionTest[65537];
var(*) /*0x3B790000-0x00000000*/ private bool bBlockAll[65537];

// Export UPBRuleNodeMesh::execPickRandomBuildingMesh(FFrame&, void* const)
native function PickRandomBuildingMesh()
{
    local /*0x35EA0000-0x00000000*/ private int ReturnValue[92274689];


}

defaultproperties
{
    PartialOccludedBuildingMesh=(Mesh=none,DimX=512.0000000,DimZ=512.0000000,Chance=1.0000000,Translation=none,Rotation=none,bMeshScaleTranslation=false,bOverrideMeshLightMapRes=false,OverriddenMeshLightMapRes=32,MaterialOverrides=none,SectionOverrides=none)
    bDoOcclusionTest=true
    NextRules=none
}