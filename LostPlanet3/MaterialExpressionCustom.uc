class MaterialExpressionCustom extends MaterialExpression
    collapsecategories
    hidecategories(Object,Object);

enum ECustomMaterialOutputType
{
    CMOT_Float1,                    // 0
    CMOT_Float2,                    // 1
    CMOT_Float3,                    // 2
    CMOT_Float4,                    // 3
    CMOT_MAX                        // 4
};

struct native CustomInput
{
    var(*) /*0x159D0000-0x00000000*/ private editfixedsize string InputName[65537];
    var(*) /*0x35EA0000-0x00000000*/ private noclear editfixedsize @NULL Input;

    structdefaultproperties
    {
        InputName=""
        Input=(Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
    }
};

var(*) /*0x309E0000-0x00000000*/ private editfixedsize editinline string Code[65537];
var(*) /*0x309E0000-0x00000000*/ private byte OutputType[65537];
var(*) /*0x309E0000-0x00000000*/ private editfixedsize string Description[65537];
var(*) /*0x309E0000-0x00000000*/ private editfixedsize array Inputs[65537];

defaultproperties
{
    OutputType=ECustomMaterialOutputType.CMOT_Float3
    Description="Custom"
    Inputs=/* Array type was not detected. */
    MenuCategories=/* Array type was not detected. */
}