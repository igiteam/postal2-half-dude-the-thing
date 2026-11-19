class MaterialExpression extends Object
    abstract
    hidecategories(Object);

struct ExpressionInput
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL Expression;
    var(*) /*0x35EA0000-0x00000000*/ private int OutputIndex;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string InputName;
    var(*) /*0x35EA0000-0x00000000*/ private int Mask;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskR;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskG;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskB;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskA;
    var(*) /*0x35EA0000-0x00000000*/ private int GCC64_Padding;

    structdefaultproperties
    {
        Expression=none
        OutputIndex=0
        InputName=""
        Mask=0
        MaskR=0
        MaskG=0
        MaskB=0
        MaskA=0
        GCC64_Padding=0
    }
};

struct ExpressionOutput
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string OutputName;
    var(*) /*0x35EA0000-0x00000000*/ private int Mask;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskR;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskG;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskB;
    var(*) /*0x35EA0000-0x00000000*/ private int MaskA;

    structdefaultproperties
    {
        OutputName=""
        Mask=0
        MaskR=0
        MaskG=0
        MaskB=0
        MaskA=0
    }
};

var(*) /*0x35EA0000-0x00000000*/ private transient int EditorX;
var(*) /*0x35EA0000-0x00000000*/ private transient int EditorY;
var(*) /*0x35EA0000-0x00000000*/ private int MaterialExpressionEditorX;
var(*) /*0x35EA0000-0x00000000*/ private int MaterialExpressionEditorY;
var(*) /*0x35EA0000-0x00000000*/ private bool bRealtimePreview;
var(*) /*0x35EA0000-0x00000000*/ private bool bNeedToUpdatePreview[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsParameterExpression;
var(*) /*0x35EA0000-0x00000000*/ private bool bShowOutputNameOnPin;
var(*) /*0x35EA0000-0x00000000*/ private bool bHidePreviewWindow;
var(*) /*0x35EA0000-0x00000000*/ private bool bShowInputs;
var(*) /*0x35EA0000-0x00000000*/ private bool bShowOutputs;
var(*) /*0x35EA0000-0x00000000*/ private bool bUsedByStaticParameterSet;
var(*) /*0x35EA0000-0x00000000*/ private @NULL Material[131073];
var(*) /*0x35EA0000-0x00000000*/ private @NULL Function[131073];
var(*) /*0x30890000-0x00000000*/ private editfixedsize string Desc[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL BorderColor;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MenuCategories;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Outputs;

defaultproperties
{
    bShowInputs=true
    bShowOutputs=true
    Outputs=/* Array type was not detected. */
}