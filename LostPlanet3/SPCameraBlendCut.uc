class SPCameraBlendCut extends SPCameraBlend;

static function Create()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609], ReturnValue, Filter;

    Filter = new (Owner) Class'SPCameraBlendCut';
    Filter.Init();
    return Filter;
    //return ReturnValue;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

simulated function BlendFloat()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, ReturnValue;

    return C;
    //return ReturnValue;    
}

simulated function BlendVector()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return C;
    //return ReturnValue;    
}

simulated function BlendSpherical()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return C;
    //return ReturnValue;    
}

simulated function BlendRotator()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return C;
    //return ReturnValue;    
}
