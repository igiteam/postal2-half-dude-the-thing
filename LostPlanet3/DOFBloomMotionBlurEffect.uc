class DOFBloomMotionBlurEffect extends DOFAndBloomEffect
    hidecategories(Object);

var(*) /*0x33810000-0x00000000*/ private float MaxVelocity[65537];
var(*) /*0x33810000-0x00000000*/ private float MotionBlurAmount[65537];
var(*) /*0x33810000-0x00000000*/ private bool FullMotionBlur[65537];
var(*) /*0x33810000-0x00000000*/ private float CameraRotationThreshold[65537];
var(*) /*0x33810000-0x00000000*/ private float CameraTranslationThreshold[65537];

defaultproperties
{
    MaxVelocity=1.0000000
    MotionBlurAmount=0.5000000
    FullMotionBlur=true
    CameraRotationThreshold=90.0000000
    CameraTranslationThreshold=10000.0000000
    bShowInEditor=false
}