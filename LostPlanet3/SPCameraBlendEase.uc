class SPCameraBlendEase extends SPCameraBlendLinear
    abstract;

var(__Filter1__Delegate) /*0x054C0000-0x00000000*/ private float Exp[65537];

simulated function InitTimedExponent()
{
    local /*0x043A0000-0x00000000*/ private float Seconds[8388609], Exponent;

    InitTimed(Seconds);
    Exp = Exponent;
    //return;    
}

simulated function DebugString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (super.DebugString() @ "Exp:") @ string(Exp);
    //return ReturnValue;    
}

defaultproperties
{
    Exp=2.0000000
}