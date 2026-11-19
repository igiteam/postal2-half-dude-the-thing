class DistributionVectorParameterBase extends DistributionVectorConstant
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object,Object,Object);

var(*) /*0x1D870000-0x00000000*/ private name ParameterName[65537];
var(*) /*0x1D870000-0x00000000*/ private @NULL MinInput[65537];
var(*) /*0x1D870000-0x00000000*/ private @NULL MaxInput[65537];
var(*) /*0x1D870000-0x00000000*/ private @NULL MinOutput[65537];
var(*) /*0x1D870000-0x00000000*/ private @NULL MaxOutput[65537];
var(*) /*0x1D870000-0x00000000*/ private export byte ParamModes[589827];

defaultproperties
{
    MaxInput=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    MaxOutput=(X=1.0000000,Y=1.0000000,Z=1.0000000)
}