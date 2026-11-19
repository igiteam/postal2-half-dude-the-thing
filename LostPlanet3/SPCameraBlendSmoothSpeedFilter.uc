class SPCameraBlendSmoothSpeedFilter extends SPCameraBlendSpeedFilter;

var(__Filter1__Delegate) /*0x05540000-0x00000000*/ private float LowPassRate[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float LowPassSpeed[536870913];

static function CreateSmoothSpeedFilter()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609];
    local /*0x043A0000-0x00000000*/ private float ARate[8388609], ALPRate;
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], Filter;

    Filter = new (Owner) Class'SPCameraBlendSmoothSpeedFilter';
    Filter.InitRate2(ARate, ALPRate);
    return Filter;
    //return ReturnValue;    
}

simulated function InitRate2()
{
    local /*0x043A0000-0x00000000*/ private float ARate[8388609], ALPRate;

    InitRate(ARate);
    LowPassRate = ALPRate;
    //return;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    super.Update(DeltaTime);
    LowPassSpeed = Class'SPCameraBlend'.static.MixFactor(LowPassRate, DeltaTime);
    return true;
    //return ReturnValue;    
}

simulated function BlendFloat()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, ReturnValue;

    return Class'SPCameraBlend'.static.LerpFloat(B, super.BlendFloat(A, B, C), LowPassSpeed);
    //return ReturnValue;    
}

simulated function BlendVector()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return Class'SPCameraBlend'.static.LerpVector(B, super.BlendVector(A, B, C), LowPassSpeed);
    //return ReturnValue;    
}

simulated function BlendSpherical()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return LerpSpherical(B, super.BlendSpherical(A, B, C), LowPassSpeed);
    //return ReturnValue;    
}

simulated function BlendRotator()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return LerpRotator(B, super.BlendRotator(A, B, C), LowPassSpeed);
    //return ReturnValue;    
}

simulated function DebugString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (((((("Rate:" @ string(Rate)) @ "Speed:") @ string(Speed)) @ "LPRate:") @ string(LowPassRate)) @ "LPSpeed:") @ string(LowPassSpeed);
    //return ReturnValue;    
}

defaultproperties
{
    LowPassRate=5.0000000
}