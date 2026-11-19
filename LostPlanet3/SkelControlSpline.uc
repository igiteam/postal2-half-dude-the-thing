class SkelControlSpline extends SkelControlBase
    hidecategories(Object,Object);

enum ESplineControlRotMode
{
    SCR_NoChange,                   // 0
    SCR_AlongSpline,                // 1
    SCR_Interpolate,                // 2
    SCR_MAX                         // 3
};

var(*) /*0x49260000-0x00000000*/ private int SplineLength[65537];
var(*) /*0x49260000-0x00000000*/ private byte SplineBoneAxis[65537];
var(*) /*0x49260000-0x00000000*/ private byte BoneRotMode[65537];
var(*) /*0x49260000-0x00000000*/ private bool bInvertSplineBoneAxis[65537];
var(*) /*0x49260000-0x00000000*/ private float EndSplineTension[65537];
var(*) /*0x49260000-0x00000000*/ private float StartSplineTension[65537];

defaultproperties
{
    SplineLength=2
    SplineBoneAxis=EAxis.AXIS_X
    EndSplineTension=10.0000000
    StartSplineTension=10.0000000
}