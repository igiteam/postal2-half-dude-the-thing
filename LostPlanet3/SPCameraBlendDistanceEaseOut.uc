class SPCameraBlendDistanceEaseOut extends SPCameraBlend;

var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float MaxDistance;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float Exp;
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float DeltaTime;

simulated function InitDistanceExponent()
{
    local /*0x043A0000-0x00000000*/ private float D[8388609], E;

    MaxDistance = D;
    Exp = E;
    //return;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float InDeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    DeltaTime = InDeltaTime;
    return true;
    //return ReturnValue;    
}

simulated function GetInterpolation()
{
    local /*0x043A0000-0x00000000*/ private float CurDistance[8388609], ReturnValue, I;

    I = (DeltaTime * CurDistance) / MaxDistance;
    I = I ** (1.0000000 / Exp);
    I = FClamp(I, 0.0000000, 1.0000000);
    return I;
    //return ReturnValue;    
}

simulated function BlendFloat()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, ReturnValue, Delta;

    Delta = Abs(C - B);
    return LerpFloat(B, C, GetInterpolation(Delta));
    //return ReturnValue;    
}

simulated function BlendSpherical()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return super.BlendSpherical(A, B, C);
    //return ReturnValue;    
}

simulated function BlendVector()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue, DeltaVector;

    local /*0x043A0000-0x00000000*/ private float DeltaSize;

    DeltaVector = C - B;
    DeltaSize = VSize(DeltaVector);
    return LerpVector(B, C, GetInterpolation(DeltaSize));
    //return ReturnValue;    
}

simulated function BlendRotator()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue, DeltaRotator;

    local /*0x043A0000-0x00000000*/ private float DeltaSize;

    DeltaRotator = C - B;
    DeltaSize = RSize(DeltaRotator);
    return LerpRotator(B, C, GetInterpolation(DeltaSize));
    //return ReturnValue;    
}
