class MaterialExpressionFunctionInput extends MaterialExpression
    hidecategories(Object,Object);

enum EFunctionInputType
{
    FunctionInput_Scalar,           // 0
    FunctionInput_Vector2,          // 1
    FunctionInput_Vector3,          // 2
    FunctionInput_Vector4,          // 3
    FunctionInput_Texture2D,        // 4
    FunctionInput_TextureCube,      // 5
    FunctionInput_StaticBool,       // 6
    FunctionInput_MAX               // 7
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Preview;
var(*) /*0x30B80000-0x00000000*/ private editfixedsize string InputName[65537];
var(*) /*0x30B80000-0x00000000*/ private editfixedsize string Description[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Id[131073];
var(*) /*0x30B80000-0x00000000*/ private byte InputType[65537];
var(*) /*0x30B80000-0x00000000*/ private @NULL PreviewValue[65537];
var(*) /*0x30B80000-0x00000000*/ private bool bUsePreviewValueAsDefault[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bCompilingFunctionPreview[536870913];
var(*) /*0x30B80000-0x00000000*/ private int SortPriority[65537];

defaultproperties
{
    InputName="In"
    InputType=EFunctionInputType.FunctionInput_Vector3
    bCompilingFunctionPreview=true
    BorderColor=(R=185,G=255,B=172,A=0)
    MenuCategories=/* Array type was not detected. */
}