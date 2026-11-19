class SPCameraBlend extends SPBlend
    abstract;

simulated function Init()
{
    //return;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    // DebugMode: 0
    assert(false);
    return false;
    //return ReturnValue;    
}

simulated function BlendFloat()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, ReturnValue;

    // DebugMode: 0
    assert(false);
    return C;
    //return ReturnValue;    
}

simulated function BlendVector()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return SPMakeVector(BlendFloat(A.X, B.X, C.X), BlendFloat(A.Y, B.Y, C.Y), BlendFloat(A.Z, B.Z, C.Z));
    //return ReturnValue;    
}

simulated function BlendSpherical()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    // DebugMode: 0
    assert(false);
    return C;
    //return ReturnValue;    
}

simulated function BlendRotator()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    // DebugMode: 0
    assert(false);
    return C;
    //return ReturnValue;    
}

simulated function GetProgress()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];

    return 0.0000000;
    //return ReturnValue;    
}

simulated function DebugString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return "";
    //return ReturnValue;    
}
