class SPCameraTransitionCutParam extends SPCameraTransitionParam
    editinlinenew
    collapsecategories
    hidecategories(Object);

function MakeBlend()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609], ReturnValue;

    return Class'SPCameraBlendCut'.static.Create(Owner);
    //return ReturnValue;    
}

defaultproperties
{
    CameraTransitionName="Camera Cut"
}