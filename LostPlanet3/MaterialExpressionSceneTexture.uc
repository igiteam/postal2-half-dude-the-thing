class MaterialExpressionSceneTexture extends MaterialExpression
    collapsecategories
    hidecategories(Object,Object);

enum ESceneTextureType
{
    SceneTex_Lighting,              // 0
    SceneTex_MAX                    // 1
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Coordinates;
var(*) /*0x30DE0000-0x00000000*/ private byte SceneTextureType[65537];
var(*) /*0x30DE0000-0x00000000*/ private bool ScreenAlign[65537];

defaultproperties
{
    MenuCategories=/* Array type was not detected. */
    Outputs=/* Array type was not detected. */
}