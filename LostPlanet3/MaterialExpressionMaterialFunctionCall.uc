class MaterialExpressionMaterialFunctionCall extends MaterialExpression
    hidecategories(Object,Object);

struct native FunctionExpressionInput
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ExpressionInput[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ExpressionInputId;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Input;

    structdefaultproperties
    {
        ExpressionInput=none
        ExpressionInputId=(A=0,B=0,C=0,D=0)
        Input=(Expression=none,OutputIndex=0,InputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0,GCC64_Padding=0)
    }
};

struct native FunctionExpressionOutput
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ExpressionOutput[536870913];
    var(*) /*0x35EA0000-0x00000000*/ private @NULL ExpressionOutputId;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize @NULL Output;

    structdefaultproperties
    {
        ExpressionOutput=none
        ExpressionOutputId=(A=0,B=0,C=0,D=0)
        Output=(OutputName="",Mask=0,MaskR=0,MaskG=0,MaskB=0,MaskA=0)
    }
};

var(*) /*0x30C50000-0x00000000*/ private @NULL MaterialFunction[65537];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FunctionInputs;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array FunctionOutputs;

defaultproperties
{
    bShowOutputNameOnPin=true
    bHidePreviewWindow=true
    BorderColor=(R=0,G=116,B=255,A=0)
    MenuCategories=/* Array type was not detected. */
}