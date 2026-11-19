class SPCameraBlendCubic extends SPCameraBlendLinear;

static function CreateTimed()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609];
    local /*0x043A0000-0x00000000*/ private float Seconds[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Class'SPCameraBlendTimed'.static.CreateTimedClass(Owner, Class'SPCameraBlendCubic', Seconds);
    //return ReturnValue;    
}

simulated function Interpolation()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689], X;

    X = Progress;
    return FClamp((X * X) * ((3.0000000 - X) - X), 0.0000000, 1.0000000);
    //return ReturnValue;    
}
