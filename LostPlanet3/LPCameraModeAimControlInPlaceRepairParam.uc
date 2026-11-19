class LPCameraModeAimControlInPlaceRepairParam extends LPCameraModeAimControlShoulderParam
    config(Camera)
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(0.25_Pct) /*0x7C680000-0x00000000*/ private int ConstrainYawDelta[1073807361];
var(0.25_Pct) /*0x7C680000-0x00000000*/ private int ConstrainPitchDelta[1073807361];

defaultproperties
{
    ConstrainYawDelta=1000
    ConstrainPitchDelta=1000
    LocalOffset=(X=-135.0000000,Y=52.0000000,Z=-3.0000000)
    CameraModeClass=Class'LPCameraModeAimControlInPlaceRepair'
    DesiredFOV=70.0000000
}