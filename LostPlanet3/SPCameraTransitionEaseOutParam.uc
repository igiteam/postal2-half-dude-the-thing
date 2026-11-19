class SPCameraTransitionEaseOutParam extends SPCameraTransitionEaseParam
    abstract
    editinlinenew
    collapsecategories
    hidecategories(Object);

function MakeBlend()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609], ReturnValue;

    return Class'SPCameraBlendEaseOut'.static.CreateEase(Owner, Duration, Exponent);
    //return ReturnValue;    
}

defaultproperties
{
    CameraTransitionName="Ease-OUT Interpolation: Camera smoothly accelerates, but does not decelerate into the target.  Ease amount controlled by BlendExponent."
}