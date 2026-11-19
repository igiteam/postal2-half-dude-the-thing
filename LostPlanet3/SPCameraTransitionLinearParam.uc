class SPCameraTransitionLinearParam extends SPCameraTransitionTimedParam
    editinlinenew
    collapsecategories
    hidecategories(Object);

function MakeBlend()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609], ReturnValue;

    return Class'SPCameraBlendLinear'.static.CreateTimed(Owner, Duration);
    //return ReturnValue;    
}

defaultproperties
{
    CameraTransitionName="Simple Linear Interpolation"
}