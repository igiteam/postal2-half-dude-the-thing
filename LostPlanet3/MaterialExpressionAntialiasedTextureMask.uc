class MaterialExpressionAntialiasedTextureMask extends MaterialExpressionTextureSampleParameter2D
    collapsecategories
    hidecategories(Object,Object,Object,Object);

enum ETextureColorChannel
{
    TCC_Red,                        // 0
    TCC_Green,                      // 1
    TCC_Blue,                       // 2
    TCC_Alpha,                      // 3
    TCC_MAX                         // 4
};

var(*) /*0x308D0000-0x00000000*/ private float Threshold[65537];
var(*) /*0x308D0000-0x00000000*/ private byte Channel[65537];

defaultproperties
{
    Threshold=0.5000000
    Channel=ETextureColorChannel.TCC_Alpha
    MenuCategories=/* Array type was not detected. */
    Outputs=/* Array type was not detected. */
}