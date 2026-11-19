class SPCameraBlendLinear extends SPCameraBlendTimed;

static function CreateTimed()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609];
    local /*0x043A0000-0x00000000*/ private float Seconds[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689];

    return Class'SPCameraBlendTimed'.static.CreateTimedClass(Owner, Class'SPCameraBlendLinear', Seconds);
    //return ReturnValue;    
}

simulated function Interpolation()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];

    return Progress;
    //return ReturnValue;    
}

simulated function ValidateInterpolation()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689], T;

    T = Interpolation();
    return T;
    //return ReturnValue;    
}

simulated function BlendFloat()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, ReturnValue;

    return LerpFloat(A, C, ValidateInterpolation());
    //return ReturnValue;    
}

simulated function BlendVector()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return LerpVector(A, C, ValidateInterpolation());
    //return ReturnValue;    
}

simulated function BlendSpherical()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return LerpSpherical(A, C, ValidateInterpolation());
    //return ReturnValue;    
}

simulated function BlendRotator()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return LerpRotator(A, C, ValidateInterpolation());
    //return ReturnValue;    
}

simulated function DebugString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (super.DebugString() @ "Interpolation:") @ string(Interpolation());
    //return ReturnValue;    
}
