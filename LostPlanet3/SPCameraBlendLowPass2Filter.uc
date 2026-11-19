class SPCameraBlendLowPass2Filter extends SPCameraBlendLowPassFilter;

static function CreateLowPassFilter()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609];
    local /*0x043A0000-0x00000000*/ private float ARate[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], Filter;

    Filter = new (Owner) Class'SPCameraBlendLowPass2Filter';
    Filter.InitRate(ARate);
    return Filter;
    //return ReturnValue;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return super.Update(DeltaTime);
    //return ReturnValue;    
}

simulated function BlendFloat()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, ReturnValue;

    return ((B + B) - A) + ((((A - B) * 2.0000000) + ((C - A) * Speed)) * Speed);
    //return ReturnValue;    
}

simulated function BlendVector()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return ((B + B) - A) + ((((A - B) * 2.0000000) + ((C - A) * Speed)) * Speed);
    //return ReturnValue;    
}

simulated function BlendSpherical()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue, ba;

    ba = Subtract_SphericalSpherical(B, A);
    return Add_SphericalSpherical(Add_SphericalSpherical(B, ba), Multiply_SphericalFloat(Subtract_SphericalSpherical(Multiply_SphericalFloat(Subtract_SphericalSpherical(C, A), Speed), Multiply_SphericalFloat(ba, 2.0000000)), Speed));
    //return ReturnValue;    
}

simulated function BlendRotator()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue, ba;

    ba = Class'SPEngine.SPUtil'.static.UnwindRotator(B - A);
    return (B + ba) + (((Class'SPEngine.SPUtil'.static.UnwindRotator(C - A) * Speed) - (ba * 2.0000000)) * Speed);
    //return ReturnValue;    
}

simulated function DebugString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (("Rate:" @ string(Rate)) @ "Speed:") @ string(Speed);
    //return ReturnValue;    
}
