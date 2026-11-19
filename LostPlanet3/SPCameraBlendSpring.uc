class SPCameraBlendSpring extends SPCameraBlend;

var(__Filter1__Delegate) /*0x05560000-0x00000000*/ private float SpringK[65537];
var(__Filter1__Delegate) /*0x05560000-0x00000000*/ private float DampK[65537];
var(__Filter1__Delegate) /*0x05560000-0x00000000*/ private float Mass[65537];
var(__Filter1__Delegate) /*0x043A0000-0x00000000*/ private float Elapsed;

static function CreateSpring()
{
    local /*0x043A0000-0x00000000*/ private @NULL Owner[8388609];
    local /*0x043A0000-0x00000000*/ private float spring[8388609], damp, smass;
    local /*0x043A0000-0x00000000*/ private @NULL ReturnValue[92274689], Filter;

    Filter = new (Owner) Class'SPCameraBlendSpring';
    Filter.InitSpring(spring, damp, smass);
    return Filter;
    //return ReturnValue;    
}

simulated function InitSpring()
{
    local /*0x043A0000-0x00000000*/ private float spring[8388609], damp, smass;

    Init();
    SpringK = spring;
    DampK = damp;
    Mass = smass;
    //return;    
}

simulated function Update()
{
    local /*0x043A0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x043A0000-0x00000000*/ private bool ReturnValue[92274689];

    Elapsed = DeltaTime;
    return true;
    //return ReturnValue;    
}

simulated function BlendFloat()
{
    local /*0x043A0000-0x00000000*/ private float A[8388609], B, C, ReturnValue, Force, Velocity;

    Velocity = (B - A) / Elapsed;
    Force = ((C - B) * SpringK) - (Velocity * DampK);
    Velocity += ((Force * Elapsed) / Mass);
    return B + (Velocity * Elapsed);
    //return ReturnValue;    
}

simulated function BlendVector()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue, Force, Velocity;

    Velocity = (B - A) / Elapsed;
    Force = ((C - B) * SpringK) - (Velocity * DampK);
    Velocity += ((Force * Elapsed) / Mass);
    return B + (Velocity * Elapsed);
    //return ReturnValue;    
}

simulated function BlendSpherical()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue, Force, Velocity;

    Velocity = Multiply_SphericalFloat(Subtract_SphericalSpherical(B, A), 1.0000000 / Elapsed);
    Force = Subtract_SphericalSpherical(Multiply_SphericalFloat(Subtract_SphericalSpherical(C, B), SpringK), Multiply_SphericalFloat(Velocity, DampK));
    AddEqual_SphericalSpherical(Velocity, Divide_SphericalFloat(Multiply_SphericalFloat(Force, Elapsed), Mass));
    return Add_SphericalSpherical(B, Multiply_SphericalFloat(Velocity, Elapsed));
    //return ReturnValue;    
}

simulated function BlendRotator()
{
    local /*0x043A0000-0x00000000*/ private @NULL A[8388609], B, C, ReturnValue, Force, Velocity;

    Velocity = Class'SPEngine.SPUtil'.static.UnwindRotator(B - A) * (1.0000000 / Elapsed);
    Force = (Class'SPEngine.SPUtil'.static.UnwindRotator(C - B) * SpringK) - (Velocity * DampK);
    Velocity += ((Force * Elapsed) / Mass);
    return B + (Velocity * Elapsed);
    //return ReturnValue;    
}

simulated function DebugString()
{
    local /*0x043A0000-0x00000000*/ private editfixedsize string ReturnValue[92274689];

    return (((("SpringK:" @ string(SpringK)) @ "DampK:") @ string(DampK)) @ "Mass:") @ string(Mass);
    //return ReturnValue;    
}

defaultproperties
{
    SpringK=35.0000000
    DampK=10.0000000
    Mass=1.0000000
}