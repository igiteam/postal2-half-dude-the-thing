class InterpCurveEdSetup extends Object;

struct native CurveEdEntry
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CurveObject;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL NotifyObjectChanged;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL CurveColor;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string CurveName;
    var(*) /*0x35EA0000-0x00000000*/ private int bHideCurve;
    var(*) /*0x35EA0000-0x00000000*/ private int bColorCurve;
    var(*) /*0x35EA0000-0x00000000*/ private int bFloatingPointColorCurve;
    var(*) /*0x35EA0000-0x00000000*/ private int bClamp;
    var(*) /*0x35EA0000-0x00000000*/ private float ClampLow;
    var(*) /*0x35EA0000-0x00000000*/ private float ClampHigh;

    structdefaultproperties
    {
        CurveObject=none
        NotifyObjectChanged=none
        CurveColor=(R=0,G=0,B=0,A=0)
        CurveName=""
        bHideCurve=0
        bColorCurve=0
        bFloatingPointColorCurve=0
        bClamp=0
        ClampLow=0.0000000
        ClampHigh=0.0000000
    }
};

struct native CurveEdTab
{
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize string TabName;
    var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Curves;
    var(*) /*0x35EA0000-0x00000000*/ private float ViewStartInput;
    var(*) /*0x35EA0000-0x00000000*/ private float ViewEndInput;
    var(*) /*0x35EA0000-0x00000000*/ private float ViewStartOutput;
    var(*) /*0x35EA0000-0x00000000*/ private float ViewEndOutput;

    structdefaultproperties
    {
        TabName=""
        Curves=none
        ViewStartInput=0.0000000
        ViewEndInput=0.0000000
        ViewStartOutput=0.0000000
        ViewEndOutput=0.0000000
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array Tabs;
var(*) /*0x35EA0000-0x00000000*/ private int ActiveTab;

defaultproperties
{
    Tabs=/* Array type was not detected. */
}