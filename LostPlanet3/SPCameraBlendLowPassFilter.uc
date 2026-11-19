class SPCameraBlendLowPassFilter extends SPCameraBlend;

var(__Filter1__Delegate) /*0x05520000-0x00000000*/ private float Rate[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float Speed[536870913];

static function CreateLowPassFilter()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609];
    local /*0x043A0000-0x00000000*/ private float ARate[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], Filter;

    Filter = new (Owner) Class'SPCameraBlendLowPassFilter';
    Filter.InitRate(ARate);
    return Filter;
    //return ReturnValue;    
}

simulated function InitRate()
{
    local /*0x043A0000-0x00000000*/ private float ARate[8388609];

    Rate = ARate;
    //return;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    Speed = Class'SPCameraBlend'.static.MixFactor(Rate, DeltaTime);
    return true;
    //return ReturnValue;    
}

simulated function BlendFloat()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, ReturnValue;

    return LerpFloat(B, C, Speed);
    //return ReturnValue;    
}

simulated function BlendVector()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return LerpVector(B, C, Speed);
    //return ReturnValue;    
}

simulated function BlendSpherical()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return LerpSpherical(B, C, Speed);
    //return ReturnValue;    
}

simulated function BlendRotator()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue;

    return LerpRotator(B, C, Speed);
    //return ReturnValue;    
}

simulated function DebugString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (("Rate:" @ string(Rate)) @ "Speed:") @ string(Speed);
    //return ReturnValue;    
}

defaultproperties
{
    Rate=5.0000000
}