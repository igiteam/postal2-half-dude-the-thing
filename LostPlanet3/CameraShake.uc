class CameraShake extends Object
    editinlinenew;

enum EInitialOscillatorOffset
{
    EOO_OffsetRandom,               // 0
    EOO_OffsetZero,                 // 1
    EOO_MAX                         // 2
};

struct native FOscillator
{
    var(*) /*0x24520000-0x00000000*/ private float Amplitude[65537];
    var(*) /*0x24520000-0x00000000*/ private float Frequency[65537];
    var(*) /*0x24520000-0x00000000*/ private byte InitialOffset[65537];

    structdefaultproperties
    {
        Amplitude=0.0000000
        Frequency=0.0000000
        InitialOffset=EInitialOscillatorOffset.EOO_OffsetRandom
    }
};

struct native ROscillator
{
    var(*) /*0x424D0000-0x00000000*/ private @NULL Pitch[65537];
    var(*) /*0x424D0000-0x00000000*/ private @NULL Yaw[65537];
    var(*) /*0x424D0000-0x00000000*/ private @NULL Roll[65537];

    structdefaultproperties
    {
        Pitch=(Amplitude=0.0000000,Frequency=0.0000000,InitialOffset=EInitialOscillatorOffset.EOO_OffsetRandom)
        Yaw=(Amplitude=0.0000000,Frequency=0.0000000,InitialOffset=EInitialOscillatorOffset.EOO_OffsetRandom)
        Roll=(Amplitude=0.0000000,Frequency=0.0000000,InitialOffset=EInitialOscillatorOffset.EOO_OffsetRandom)
    }
};

struct native VOscillator
{
    var(*) /*0x502A0000-0x00000000*/ private @NULL X[65537];
    var(*) /*0x502A0000-0x00000000*/ private @NULL Y[65537];
    var(*) /*0x502A0000-0x00000000*/ private @NULL Z[65537];

    structdefaultproperties
    {
        X=(Amplitude=0.0000000,Frequency=0.0000000,InitialOffset=EInitialOscillatorOffset.EOO_OffsetRandom)
        Y=(Amplitude=0.0000000,Frequency=0.0000000,InitialOffset=EInitialOscillatorOffset.EOO_OffsetRandom)
        Z=(Amplitude=0.0000000,Frequency=0.0000000,InitialOffset=EInitialOscillatorOffset.EOO_OffsetRandom)
    }
};

var(*) /*0x10C90000-0x00000000*/ private bool bSingleInstance[65537];
var(*) /*0x030C0000-0x00000000*/ private bool bRandomAnimSegment[65537];
var(*) /*0x38F00000-0x00000000*/ private float OscillationDuration[65537];
var(*) /*0x38F00000-0x00000000*/ private float OscillationBlendInTime[65537];
var(*) /*0x38F00000-0x00000000*/ private float OscillationBlendOutTime[65537];
var(*) /*0x38F00000-0x00000000*/ private @NULL RotOscillation[65537];
var(*) /*0x38F00000-0x00000000*/ private @NULL LocOscillation[65537];
var(*) /*0x38F00000-0x00000000*/ private @NULL FOVOscillation[65537];
var(*) /*0x030C0000-0x00000000*/ private @NULL Anim[65537];
var(*) /*0x030C0000-0x00000000*/ private float AnimPlayRate[65537];
var(*) /*0x030C0000-0x00000000*/ private float AnimScale[65537];
var(*) /*0x030C0000-0x00000000*/ private float AnimBlendInTime[65537];
var(*) /*0x030C0000-0x00000000*/ private float AnimBlendOutTime[65537];
var(*) /*0x030C0000-0x00000000*/ private float RandomAnimSegmentDuration[65537];

simulated function GetRotOscillationMagnitude()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL V;

    V.X = RotOscillation.Pitch.Amplitude;
    V.Y = RotOscillation.Yaw.Amplitude;
    V.Z = RotOscillation.Roll.Amplitude;
    return VSize(V);
    //return ReturnValue;    
}

simulated function GetLocOscillationMagnitude()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];
    local /*0x35EA0000-0x00000000*/ private @NULL V;

    V.X = LocOscillation.X.Amplitude;
    V.Y = LocOscillation.Y.Amplitude;
    V.Z = LocOscillation.Z.Amplitude;
    return VSize(V);
    //return ReturnValue;    
}

defaultproperties
{
    OscillationBlendInTime=0.1000000
    OscillationBlendOutTime=0.2000000
    AnimPlayRate=1.0000000
    AnimScale=1.0000000
    AnimBlendInTime=0.2000000
    AnimBlendOutTime=0.2000000
}