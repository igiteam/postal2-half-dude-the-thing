class CameraModifier_CameraShake extends CameraModifier;

struct native CameraShakeInstance
{
    var(*) /*0x35EA0000-0x00000000*/ private @NULL SourceShake;
    var(*) /*0x35EA0000-0x00000000*/ private name SourceShakeName;
    var(*) /*0x35EA0000-0x00000000*/ private float OscillatorTimeRemaining;
    var(*) /*0x35EA0000-0x00000000*/ private bool bBlendingIn;
    var(*) /*0x35EA0000-0x00000000*/ private float CurrentBlendInTime;
    var(*) /*0x35EA0000-0x00000000*/ private bool bBlendingOut;
    var(*) /*0x35EA0000-0x00000000*/ private float CurrentBlendOutTime;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL LocSinOffset;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL RotSinOffset;
    var(*) /*0x35EA0000-0x00000000*/ private float FOVSinOffset;
    var(*) /*0x35EA0000-0x00000000*/ private float Scale;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL AnimInst;
    var(*) /*0x35EA0000-0x00000000*/ private byte PlaySpace;
    var(*) /*0x35EA0000-0x00000000*/ private @NULL UserPlaySpaceMatrix;

    structdefaultproperties
    {
        SourceShake=none
        SourceShakeName="None"
        OscillatorTimeRemaining=0.0000000
        bBlendingIn=false
        CurrentBlendInTime=0.0000000
        bBlendingOut=false
        CurrentBlendOutTime=0.0000000
        LocSinOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        RotSinOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        FOVSinOffset=0.0000000
        Scale=0.0000000
        AnimInst=none
        PlaySpace=ECameraAnimPlaySpace.CAPS_CameraLocal
        UserPlaySpaceMatrix=(XPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),YPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),ZPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),WPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000))
    }
};

var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array ActiveShakes;
var(*) /*0x10C20000-0x00000000*/ private float SplitScreenShakeScale[196609];

protected static function InitializeOffset()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Param[25296897];
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];

    switch(Param.InitialOffset)
    {
        // End:0x3E
        case 0:
            return (FRand() * float(2)) * 3.1415930;
            // End:0x4F
            break;
        // End:0x4C
        case 1:
            return 0.0000000;
            // End:0x4F
            break;
        // End:0xFFFF
        default:
            break;
    }
    return 0.0000000;
    //return ReturnValue;    
}

protected function ReinitShake()
{
    local /*0x35EA0000-0x00000000*/ private int ActiveShakeIdx[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL SourceShake;
    local /*0x35EA0000-0x00000000*/ private float Duration;
    local /*0x35EA0000-0x00000000*/ private bool bRandomStart, bLoop;

    // End:0x36
    if(Class'Engine'.static.IsSplitScreen())
    {
        Scale *= SplitScreenShakeScale;
    }
    ActiveShakes[ActiveShakeIdx].Scale = Scale;
    SourceShake = ActiveShakes[ActiveShakeIdx].SourceShake;
    // End:0x279
    if(SourceShake.OscillationDuration != 0.0000000)
    {
        ActiveShakes[ActiveShakeIdx].OscillatorTimeRemaining = SourceShake.OscillationDuration;
        // End:0x279
        if(ActiveShakes[ActiveShakeIdx].bBlendingOut)
        {
            ActiveShakes[ActiveShakeIdx].bBlendingOut = false;
            ActiveShakes[ActiveShakeIdx].CurrentBlendOutTime = 0.0000000;
            ActiveShakes[ActiveShakeIdx].bBlendingIn = true;
            ActiveShakes[ActiveShakeIdx].CurrentBlendInTime = ActiveShakes[ActiveShakeIdx].SourceShake.OscillationBlendInTime * (1.0000000 - (ActiveShakes[ActiveShakeIdx].CurrentBlendOutTime / ActiveShakes[ActiveShakeIdx].SourceShake.OscillationBlendOutTime));
        }
    }
    // End:0x3E4
    if(SourceShake.Anim != none)
    {
        // End:0x2FF
        if(SourceShake.bRandomAnimSegment)
        {
            bLoop = true;
            bRandomStart = true;
            Duration = SourceShake.RandomAnimSegmentDuration;
        }
        ActiveShakes[ActiveShakeIdx].AnimInst = CameraOwner.PlayCameraAnim(SourceShake.Anim, SourceShake.AnimPlayRate, Scale, SourceShake.AnimBlendInTime, SourceShake.AnimBlendOutTime, bLoop, bRandomStart, Duration, true);
    }
    //return;    
}

protected function InitializeShake()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewShake[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PlaySpace[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL UserPlaySpaceRot[9437185], ReturnValue, Inst;
    local /*0x35EA0000-0x00000000*/ private float Duration;
    local /*0x35EA0000-0x00000000*/ private bool bRandomStart, bLoop;

    Inst.SourceShakeName = NewShake.Name;
    Inst.SourceShake = new (self) NewShake.Class;
    Inst.SourceShake.OscillationDuration = NewShake.OscillationDuration;
    Inst.SourceShake.OscillationBlendInTime = NewShake.OscillationBlendInTime;
    Inst.SourceShake.OscillationBlendOutTime = NewShake.OscillationBlendOutTime;
    Inst.SourceShake.RotOscillation = NewShake.RotOscillation;
    Inst.SourceShake.LocOscillation = NewShake.LocOscillation;
    Inst.SourceShake.FOVOscillation = NewShake.FOVOscillation;
    Inst.SourceShake.Anim = NewShake.Anim;
    Inst.SourceShake.AnimPlayRate = NewShake.AnimPlayRate;
    Inst.SourceShake.AnimBlendInTime = NewShake.AnimBlendInTime;
    Inst.SourceShake.AnimBlendOutTime = NewShake.AnimBlendOutTime;
    Inst.SourceShake.bRandomAnimSegment = NewShake.bRandomAnimSegment;
    Inst.SourceShake.RandomAnimSegmentDuration = NewShake.RandomAnimSegmentDuration;
    Inst.Scale = Scale;
    // End:0x49A
    if(Class'Engine'.static.IsSplitScreen())
    {
        Scale *= SplitScreenShakeScale;
    }
    // End:0x82D
    if(NewShake.OscillationDuration != 0.0000000)
    {
        Inst.RotSinOffset.X = InitializeOffset(NewShake.RotOscillation.Pitch);
        Inst.RotSinOffset.Y = InitializeOffset(NewShake.RotOscillation.Yaw);
        Inst.RotSinOffset.Z = InitializeOffset(NewShake.RotOscillation.Roll);
        Inst.LocSinOffset.X = InitializeOffset(NewShake.LocOscillation.X);
        Inst.LocSinOffset.Y = InitializeOffset(NewShake.LocOscillation.Y);
        Inst.LocSinOffset.Z = InitializeOffset(NewShake.LocOscillation.Z);
        Inst.FOVSinOffset = InitializeOffset(NewShake.FOVOscillation);
        Inst.OscillatorTimeRemaining = NewShake.OscillationDuration;
        // End:0x82D
        if(NewShake.OscillationBlendInTime > 0.0000000)
        {
            Inst.bBlendingIn = true;
            Inst.CurrentBlendInTime = 0.0000000;
        }
    }
    // End:0xA3B
    if(NewShake.Anim != none)
    {
        // End:0x8B3
        if(NewShake.bRandomAnimSegment)
        {
            bLoop = true;
            bRandomStart = true;
            Duration = NewShake.RandomAnimSegmentDuration;
        }
        // End:0xA3B
        if(Scale > 0.0000000)
        {
            Inst.AnimInst = CameraOwner.PlayCameraAnim(NewShake.Anim, NewShake.AnimPlayRate, Scale, NewShake.AnimBlendInTime, NewShake.AnimBlendOutTime, bLoop, bRandomStart, Duration, NewShake.bSingleInstance);
            // End:0xA3B
            if((int(PlaySpace) != int(0)) && Inst.AnimInst != none)
            {
                Inst.AnimInst.SetPlaySpace(PlaySpace, UserPlaySpaceRot);
            }
        }
    }
    Inst.PlaySpace = PlaySpace;
    // End:0xAB8
    if(int(Inst.PlaySpace) == int(2))
    {
        Inst.UserPlaySpaceMatrix = MakeRotationMatrix(UserPlaySpaceRot);
    }
    return Inst;
    //return ReturnValue;    
}

function AddCameraShake()
{
    local /*0x35EA0000-0x00000000*/ private @NULL NewShake[8388609];
    local /*0x35EA0000-0x00000000*/ private float Scale[8388609];
    local /*0x35EA0000-0x00000000*/ private byte PlaySpace[9437185];
    local /*0x35EA0000-0x00000000*/ private @NULL UserPlaySpaceRot[9437185];
    local /*0x35EA0000-0x00000000*/ private int ShakeIdx, NumShakes;

    0    
    // End:0xFD
    if(NewShake != none)
    {
        // End:0xA7
        if(NewShake.bSingleInstance)
        {
            ShakeIdx = ActiveShakes.Find('SourceShakeName', NewShake.Name);            
            // End:0xA7
            if(ShakeIdx != -1)
            {
                ReinitShake(ShakeIdx, Scale);
                return;
            }
        }
        NumShakes = ActiveShakes.Length;
        ActiveShakes[NumShakes] = InitializeShake(NewShake, Scale, PlaySpace, UserPlaySpaceRot);
    }
    //return;    
}

function RemoveCameraShake()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Shake[8388609];
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL AnimInst;

    Idx = ActiveShakes.Find('SourceShakeName', Shake.Name);    
    // End:0xF4
    if(Idx != -1)
    {
        AnimInst = ActiveShakes[Idx].AnimInst;
        // End:0xDF
        if((AnimInst != none) && !AnimInst.bFinished)
        {
            CameraOwner.StopCameraAnim(AnimInst, true);
        }
        ActiveShakes.Remove(Idx, 1);        
    }
    //return;    
}

function RemoveAllCameraShakes()
{
    local /*0x35EA0000-0x00000000*/ private int Idx;
    local /*0x35EA0000-0x00000000*/ private @NULL AnimInst;

    Idx = 0;
    J0x0B:

    // End:0xBF [Loop If]
    if(Idx < ActiveShakes.Length)
    {
        AnimInst = ActiveShakes[Idx].AnimInst;
        // End:0xB1
        if((AnimInst != none) && !AnimInst.bFinished)
        {
            CameraOwner.StopCameraAnim(AnimInst, true);
        }
        ++Idx;
        // [Loop Continue]
        goto J0x0B;
    }
    ActiveShakes.Length = 0;
    //return;    
}

// Export UCameraModifier_CameraShake::execUpdateCameraShake(FFrame&, void* const)
native function UpdateCameraShake()
{
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL Shake[25165825], OutPOV;


}

// Export UCameraModifier_CameraShake::execModifyCamera(FFrame&, void* const)
native function ModifyCamera()
{
    local /*0x35EA0000-0x00000000*/ private @NULL Camera[8388609];
    local /*0x35EA0000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x35EA0000-0x00000000*/ private @NULL OutPOV[25165825];
    local /*0x35EA0000-0x00000000*/ private bool ReturnValue[92274689];


}

defaultproperties
{
    SplitScreenShakeScale=0.5000000
}