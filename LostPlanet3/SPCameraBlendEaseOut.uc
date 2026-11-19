class SPCameraBlendEaseOut extends SPCameraBlendEase;

static function CreateEase()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609];
    local /*0x043A0000-0x00000000*/ private float ATime[8388609], AnExponent;
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], Filter;

    Filter = new (Owner) Class'SPCameraBlendEaseOut';
    Filter.InitTimedExponent(ATime, AnExponent);
    return Filter;
    //return ReturnValue;    
}

simulated function Interpolation()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];

    return FClamp(Progress ** (1.0000000 / Exp), 0.0000000, 1.0000000);
    //return ReturnValue;    
}
