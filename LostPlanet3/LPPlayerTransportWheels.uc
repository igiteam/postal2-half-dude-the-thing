class LPPlayerTransportWheels extends Actor
    notplaceable
    hidecategories(AnimDependency,Navigation);

struct native TransportWheel
{
    var(0.25_Pct) /*0xCE760000-0x00000000*/ private float WheelRadius[65537];
    var(0.25_Pct) /*0xCE760000-0x00000000*/ private name BoneName[65537];
    var(0.25_Pct) /*0xCE760000-0x00000000*/ private name SkelControlName[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WheelControl;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL WheelRefPoseTM;
    var(0.25_Pct) /*0xCE760000-0x00000000*/ private float FreeSpinningFrictionDecel[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHasContact;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHadContact;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastContactPos;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float NormalizedForceFromMedian;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float RollVel;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastRot;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Location;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL Rotation;
    var(0.25_Pct) /*0xCE760000-0x00000000*/ private float WheelRoll[65537];
    var(0.25_Pct) /*0xCE760000-0x00000000*/ private @NULL WheelRayBaseOffset[65537];
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int FramesSinceLastTrace;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float WheelDispPerFrameAdjust;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ActualWheelDisplacement;
    var(0.25_Pct) /*0xCE760000-0x00000000*/ private int AxleIndex[65537];

    structdefaultproperties
    {
        WheelRadius=0.0000000
        BoneName="None"
        SkelControlName="None"
        WheelControl=none
        WheelRefPoseTM=(XPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),YPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),ZPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000),WPlane=(W=0.0000000,X=0.0000000,Y=0.0000000,Z=0.0000000))
        FreeSpinningFrictionDecel=0.0000000
        bHasContact=false
        bHadContact=false
        LastContactPos=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        NormalizedForceFromMedian=0.0000000
        RollVel=0.0000000
        LastRot=(Pitch=0,Yaw=0,Roll=0)
        Location=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        Rotation=(Pitch=0,Yaw=0,Roll=0)
        WheelRoll=0.0000000
        WheelRayBaseOffset=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        FramesSinceLastTrace=0
        WheelDispPerFrameAdjust=0.0000000
        ActualWheelDisplacement=0.0000000
        AxleIndex=0
    }
};

struct native TransportAxle
{
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array WheelIndexes;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SocketName;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TraceLength;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTraceVariance;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float LastTraceLength;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AxleDisplacement;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AxleDisplacementPerFrameAdjust;
    var(0.25_Pct) /*0x97E50000-0x00000000*/ private int FramesSinceLastTrace;

    structdefaultproperties
    {
        WheelIndexes=none
        SocketName="None"
        TraceLength=0.0000000
        MaxTraceVariance=0.0000000
        LastTraceLength=0.0000000
        AxleDisplacement=0.0000000
        AxleDisplacementPerFrameAdjust=0.0000000
        FramesSinceLastTrace=0
    }
};

var(0.25_Pct) /*0x81C30000-0x00000400*/ private export @NULL Mesh[720897];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TransportBody[536870913];
var(0.25_Pct) /*0x81C30000-0x00000000*/ private @NULL SteeringLookatControl[536936449];
var(0.25_Pct) /*0x81C30000-0x00000000*/ private name SteeringLookatControlName[196609];
var(0.25_Pct) /*0x81C30000-0x00000000*/ private name SteeringPivotBoneName[196609];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastSteeringPivotLoc[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastLocalSteerRot[536870913];
var(0.25_Pct) /*0x81C30000-0x00000000*/ private float SteerInterpSpeed[196609];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EngineAudio_Player_Left[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EngineAudio_Player_LeftCue[131073];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL EngineAudio_Player_Right[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL EngineAudio_Player_RightCue[131073];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SuspensionAudio_Player_FrontRight[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SuspensionAudio_Player_FrontRightCue[131073];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SuspensionAudio_Player_FrontLeft[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SuspensionAudio_Player_FrontLeftCue[131073];
var(0.25_Pct) /*0x81C30000-0x00000000*/ private @NULL SuspensionAudioRandomTimeRange[196609];
var(0.25_Pct) /*0x81C30000-0x00000000*/ private float SuspensionAudioVelocityThreshold[196609];
var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL TransportAudio_NonPlayer[537395201];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TransportAudio_NonPlayerCue[131073];
var(0.25_Pct) /*0x81C30000-0x00000000*/ private editfixedsize array Wheels[65537];
var(0.25_Pct) /*0x81C30000-0x00000000*/ private editfixedsize array Axles[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ActorLocationDisplacement;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int FramesSinceLastConformTrace;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL GroundConformNormal;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float DegreesPerSecondConformSpeed;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ActorPitch;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int WheelTraceInterval;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bForceUpdateWheelsNextTick[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bResetInterpolation[536870913];
var(0.25_Pct) /*0x81C30000-0x00000000*/ private float MinDistFactorForUpdate[65537];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL JiggleAnimControl[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL LastVelocity[536870913];
var(0.25_Pct) /*0x81C30000-0x00000000*/ private float AccelJiggleScalar[196609];
var(0.25_Pct) /*0x81C30000-0x00000000*/ private float JiggleFadeTime[196609];

// Export ULPPlayerTransportWheels::execCacheWheelRefPoseTMs(FFrame&, void* const)
native final simulated function CacheWheelRefPoseTMs();

protected simulated function @NULL CreateAndAttachAudioComponent()
{
    local /*0x97E50000-0x00000000*/ private @NULL Cue[8388609];
    local /*0x97E50000-0x00000000*/ private name SocketName[8388609];
    local /*0x97E50000-0x00000000*/ private bool bPlayImmediately[9437185];
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689], AC;

    AC = CreateAudioComponent(Cue, false, true,,, false);
    // End:0xF2
    if(AC != none)
    {
        AC.bUseOwnerLocation = true;
        Mesh.AttachComponentToSocket(AC, SocketName);
        AC.bAutoDestroy = false;
        AC.bShouldRemainActiveIfDropped = true;
        // End:0xF2
        if(bPlayImmediately)
        {
            AC.Play();
        }
    }
    return AC;
    //return ReturnValue;    
}

protected simulated function TriggerSuspensionSound_FrontRight()
{
    // End:0x48
    if(VSize(Velocity) > SuspensionAudioVelocityThreshold)
    {
        SuspensionAudio_Player_FrontRight = PlayTransportAudioComponent(SuspensionAudio_Player_FrontRight, SuspensionAudio_Player_FrontRightCue, 'SuspensionAudio_FrontRight');
    }
    SetTimer(RandRange(SuspensionAudioRandomTimeRange.X, SuspensionAudioRandomTimeRange.Y), false, 'TriggerSuspensionSound_FrontRight');
    //return;    
}

protected simulated function TriggerSuspensionSound_FrontLeft()
{
    // End:0x48
    if(VSize(Velocity) > SuspensionAudioVelocityThreshold)
    {
        SuspensionAudio_Player_FrontLeft = PlayTransportAudioComponent(SuspensionAudio_Player_FrontLeft, SuspensionAudio_Player_FrontLeftCue, 'SuspensionAudio_FrontLeft');
    }
    SetTimer(RandRange(SuspensionAudioRandomTimeRange.X, SuspensionAudioRandomTimeRange.Y), false, 'TriggerSuspensionSound_FrontLeft');
    //return;    
}

simulated function AttachToTransport()
{
    local /*0x97E50000-0x00000000*/ private @NULL Transport[8388609];

    TransportBody = Transport;
    SetBase(Transport);
    SetRelativeLocation(vect(0.0000000, 0.0000000, 0.0000000));
    SetRelativeRotation(rot(0, 0, 0));
    SetDrawScale(Transport.DrawScale);
    SetDrawScale3D(Transport.DrawScale3D);
    Mesh.SetShadowParent(Transport.StaticMeshComponent);
    Mesh.SetLightEnvironment(Transport.LightEnvironment);
    Mesh.ForcedLodModel = Transport.StaticMeshComponent.ForcedLodModel;
    // End:0x199
    if(Transport.bHidden)
    {
        SetWheelsHidden(true);
    }
    // End:0x1DD
    if(Transport.WheelActor == none)
    {
        Transport.WheelActor = self;
    }
    //return;    
}

protected simulated function @NULL PlayTransportAudioComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL AC[8388609], Cue;
    local /*0x97E50000-0x00000000*/ private name SocketName[8388609];
    local /*0x97E50000-0x00000400*/ private @NULL ReturnValue[92274689];

    // End:0x36
    if(AC == none)
    {
        AC = CreateAndAttachAudioComponent(Cue, SocketName);
    }
    // End:0x64
    if(AC != none)
    {
        AC.Play();
    }
    return AC;
    //return ReturnValue;    
}

protected simulated function @NULL StopAudioComponent()
{
    local /*0x97E50000-0x00000400*/ private @NULL AC[8388609];
    local /*0x97E50000-0x00000000*/ private float FadeOutTime[9437185];

    // End:0x3D
    if(AC != none)
    {
        AC.FadeOut(FadeOutTime, 0.0000000);
    }
    //return;    
}

simulated function SetupAudio()
{
    local /*0x97E50000-0x00000000*/ private bool bDoingPlayerAudio[8388609], bDoingNonPlayerAudio;

    // End:0x10E
    if(bDoingPlayerAudio)
    {
        EngineAudio_Player_Left = PlayTransportAudioComponent(EngineAudio_Player_Left, EngineAudio_Player_LeftCue, 'EngineAudio_Left');
        EngineAudio_Player_Right = PlayTransportAudioComponent(EngineAudio_Player_Right, EngineAudio_Player_RightCue, 'EngineAudio_Right');
        SetTimer(RandRange(SuspensionAudioRandomTimeRange.X, SuspensionAudioRandomTimeRange.Y), false, 'TriggerSuspensionSound_FrontRight');
        SetTimer(RandRange(SuspensionAudioRandomTimeRange.X, SuspensionAudioRandomTimeRange.Y), false, 'TriggerSuspensionSound_FrontLeft');        
    }
    else
    {
        StopAudioComponent(EngineAudio_Player_Left);
        StopAudioComponent(EngineAudio_Player_Right);
        ClearTimer('TriggerSuspensionSound_FrontRight');
        ClearTimer('TriggerSuspensionSound_FrontLeft');
    }
    // End:0x19D
    if(bDoingNonPlayerAudio)
    {
        TransportAudio_NonPlayer = PlayTransportAudioComponent(TransportAudio_NonPlayer, TransportAudio_NonPlayerCue, 'EngineAudio_Center');        
    }
    else
    {
        StopAudioComponent(TransportAudio_NonPlayer);
    }
    //return;    
}

simulated function PostBeginPlay()
{
    local /*0x97E50000-0x00000000*/ private int WheelIndex, AxleIndex;

    super.PostBeginPlay();
    CacheWheelRefPoseTMs();
    WheelIndex = 0;
    J0x1F:

    // End:0xEF [Loop If]
    if(WheelIndex < Wheels.Length)
    {
        Wheels[WheelIndex].WheelControl = SkelControlWheel(Mesh.FindSkelControl(Wheels[WheelIndex].SkelControlName));
        Wheels[WheelIndex].FramesSinceLastTrace = Rand(WheelTraceInterval - 1);
        ++WheelIndex;
        // [Loop Continue]
        goto J0x1F;
    }
    AxleIndex = 0;
    J0xFA:

    // End:0x29B [Loop If]
    if(AxleIndex < Axles.Length)
    {
        WheelIndex = 0;
        J0x11D:

        // End:0x1B7 [Loop If]
        if(WheelIndex < Axles[AxleIndex].WheelIndexes.Length)
        {
            Wheels[Axles[AxleIndex].WheelIndexes[WheelIndex]].AxleIndex = AxleIndex;
            ++WheelIndex;
            // [Loop Continue]
            goto J0x11D;
        }
        // End:0x258
        if(Axles[AxleIndex].TraceLength == float(0))
        {
            Axles[AxleIndex].TraceLength = 1.2000000 * Wheels[Axles[AxleIndex].WheelIndexes[0]].WheelRadius;
        }
        Axles[AxleIndex].FramesSinceLastTrace = Rand(WheelTraceInterval - 1);
        ++AxleIndex;
        // [Loop Continue]
        goto J0xFA;
    }
    //return;    
}

simulated function SetWheelsHidden()
{
    local /*0x97E50000-0x00000000*/ private bool bNewHidden[8388609];

    SetHidden(bNewHidden);
    // End:0x36
    if(bNewHidden)
    {
        bResetInterpolation = true;
        SetCollision(false, false, true);        
    }
    else
    {
        bForceUpdateWheelsNextTick = true;
        SetCollision(default.bCollideActors, default.bBlockActors, default.bIgnoreEncroachers);
    }
    //return;    
}

simulated function GetFloorConformFromWheels()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], FrontAxle, RearAxle, FR, FL, RR,
	    RL, WF1, WF2, WR1, WR2,
	    L1, l2, OutNormal;

    FrontAxle = Axles[0];
    RearAxle = Axles[Axles.Length - 1];
    WF1 = Wheels[FrontAxle.WheelIndexes[0]];
    WF2 = Wheels[FrontAxle.WheelIndexes[FrontAxle.WheelIndexes.Length - 1]];
    WR1 = Wheels[RearAxle.WheelIndexes[0]];
    WR2 = Wheels[RearAxle.WheelIndexes[RearAxle.WheelIndexes.Length - 1]];
    FR = WF1.LastContactPos;
    FL = WF2.LastContactPos;
    RR = WR1.LastContactPos;
    RL = WR2.LastContactPos;
    L1 = FR - RL;
    l2 = FL - RR;
    OutNormal = Normal(L1 Cross l2);
    // End:0x26B
    if(OutNormal.Z < 0.0000000)
    {
        OutNormal = -OutNormal;
    }
    return OutNormal;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: SkeletalMeshComponent'Default__LPPlayerTransportWheels.SkeletalMeshComponent0'
    begin object name=SkeletalMeshComponent0 class=Class'Engine.SkeletalMeshComponent'
    end object
    Mesh=SkeletalMeshComponent0
    SteeringLookatControlName="SteeringPivot"
    SteeringPivotBoneName="b_SteeringPivot"
    SteerInterpSpeed=2.0000000
    SuspensionAudioRandomTimeRange=(X=8.0000000,Y=20.0000000)
    SuspensionAudioVelocityThreshold=-1.0000000
    GroundConformNormal=(X=0.0000000,Y=0.0000000,Z=1.0000000)
    DegreesPerSecondConformSpeed=5.0000000
    WheelTraceInterval=2
    AccelJiggleScalar=0.0150000
    JiggleFadeTime=2.0000000
    Components[0]=SkeletalMeshComponent0
    TickGroup=ETickingGroup.TG_DuringAsyncWork
    bAlwaysRelevant=true
    bHardAttach=true
    bCollideActors=true
    bProjTarget=true
    CollisionComponent=SkeletalMeshComponent0
}