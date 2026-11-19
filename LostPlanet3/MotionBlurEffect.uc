class MotionBlurEffect extends PostProcessEffect
    hidecategories(Object);

var(*) /*0x33890000-0x00000000*/ private float MaxVelocity[65537];
var(*) /*0x33890000-0x00000000*/ private float MotionBlurAmount[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool FullMotionBlur;
var(*) /*0x35EA0000-0x00000000*/ private float CameraRotationThreshold;
var(*) /*0x35EA0000-0x00000000*/ private float CameraTranslationThreshold;

defaultproperties
{
    MaxVelocity=1.0000000
    MotionBlurAmount=0.5000000
    FullMotionBlur=true
    CameraRotationThreshold=90.0000000
    CameraTranslationThreshold=10000.0000000
    bShowInEditor=false
}