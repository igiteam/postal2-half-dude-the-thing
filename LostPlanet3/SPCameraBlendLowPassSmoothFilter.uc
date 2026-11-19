class SPCameraBlendLowPassSmoothFilter extends SPCameraBlend;

var(__Filter1__Delegate) /*0x05530000-0x00000000*/ private float Rate[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float Time[536870913];

static function CreateLowPassFilter()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609];
    local /*0x043A0000-0x00000000*/ private float ARate[8388609];
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], Filter;

    Filter = new (Owner) Class'SPCameraBlendLowPassSmoothFilter';
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

    Time = DeltaTime;
    return true;
    //return ReturnValue;    
}

simulated function BlendFloat()
{
    local /*0x043A0000-0x00000000*/ private float ao[8388609], A, B, ReturnValue, av, bv,
	    Q, T, t2, t3;

    // End:0x21
    if(Rate <= Time)
    {
        return B;
    }
    T = Time / Rate;
    av = (A - ao) / T;
    bv = 0.0000000;
    Q = B - A;
    av = ((Q >= 0.0000000) ? FMin(av, Q) : FMax(av, Q));
    t2 = T * T;
    t3 = t2 * T;
    return ((((((2.0000000 * t3) - (3.0000000 * t2)) + 1.0000000) * A) + (((t3 - (2.0000000 * t2)) + T) * av)) + (((-2.0000000 * t3) + (3.0000000 * t2)) * B)) + ((t3 - t2) * bv);
    //return ReturnValue;    
}

simulated function DebugString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (("Rate:" @ string(Rate)) @ "Time:") @ string(Time);
    //return ReturnValue;    
}

defaultproperties
{
    Time=1.0000000
}