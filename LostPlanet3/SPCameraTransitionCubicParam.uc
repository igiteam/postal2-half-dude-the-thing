class SPCameraTransitionCubicParam extends SPCameraTransitionLinearParam
    editinlinenew
    collapsecategories
    hidecategories(Object);

function MakeBlend()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609], ReturnValue;

    return Class'SPCameraBlendCubic'.static.CreateTimed(Owner, Duration);
    //return ReturnValue;    
}

defaultproperties
{
    CameraTransitionName="Cubic Interpolation: Camera has a slight ease in and ease out, but amount of ease cannot be tweaked."
}