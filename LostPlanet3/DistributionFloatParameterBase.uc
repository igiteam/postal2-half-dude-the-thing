class DistributionFloatParameterBase extends DistributionFloatConstant
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

enum DistributionParamMode
{
    DPM_Normal,                     // 0
    DPM_Abs,                        // 1
    DPM_Direct,                     // 2
    DPM_MAX                         // 3
};

var(*) /*0x1D350000-0x00000000*/ private name ParameterName[65537];
var(*) /*0x1D350000-0x00000000*/ private float MinInput[65537];
var(*) /*0x1D350000-0x00000000*/ private float MaxInput[65537];
var(*) /*0x1D350000-0x00000000*/ private float MinOutput[65537];
var(*) /*0x1D350000-0x00000000*/ private float MaxOutput[65537];
var(*) /*0x1D350000-0x00000000*/ private byte ParamMode[65537];

defaultproperties
{
    MaxInput=1.0000000
    MaxOutput=1.0000000
}