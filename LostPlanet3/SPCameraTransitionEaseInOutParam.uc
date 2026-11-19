class SPCameraTransitionEaseInOutParam extends SPCameraTransitionEaseParam
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object);

function MakeBlend()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609], ReturnValue;

    return Class'SPCameraBlendEaseInOut'.static.CreateEase(Owner, Duration, Exponent);
    //return ReturnValue;    
}

defaultproperties
{
    CameraTransitionName="Ease-INOUT Interpolation: Camera smoothly accelerates and decelerates.  Ease amount controlled by BlendExponent."
}