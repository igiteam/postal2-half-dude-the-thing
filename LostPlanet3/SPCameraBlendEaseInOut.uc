class SPCameraBlendEaseInOut extends SPCameraBlendEase;

static function CreateEase()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609];
    local /*0x043A0000-0x00000000*/ private float ATime[8388609], AnExponent;
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], Filter;

    Filter = new (Owner) Class'SPCameraBlendEaseInOut';
    Filter.InitTimedExponent(ATime, AnExponent);
    return Filter;
    //return ReturnValue;    
}

simulated function Interpolation()
{
    local /*0x043A0000-0x00000000*/ private float ReturnValue[92274689];

    return FClamp(((Progress < 0.5000000) ? 0.5000000 * ((2.0000000 * Progress) ** Exp) : 1.0000000 - (0.5000000 * ((2.0000000 * (1.0000000 - Progress)) ** Exp))), 0.0000000, 1.0000000);
    //return ReturnValue;    
}
