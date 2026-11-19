class CurveEdPresetCurve extends Object
    editinlinenew
    hidecategories(Object);

struct native PresetGeneratedPoint
{
    var(*) /*0x35EA0000-0x00000000*/ private float KeyIn;
    var(*) /*0x35EA0000-0x00000000*/ private float KeyOut;
    var(*) /*0x35EA0000-0x00000000*/ private bool TangentsValid;
    var(*) /*0x35EA0000-0x00000000*/ private float TangentIn;
    var(*) /*0x35EA0000-0x00000000*/ private float TangentOut;
    var(*) /*0x35EA0000-0x00000000*/ private byte IntepMode;

    structdefaultproperties
    {
        KeyIn=0.0000000
        KeyOut=0.0000000
        TangentsValid=false
        TangentIn=0.0000000
        TangentOut=0.0000000
        IntepMode=EInterpCurveMode.CIM_Linear
    }
};

var(*) /*0x15820000-0x00000000*/ private editfixedsize string CurveName;
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Points;
