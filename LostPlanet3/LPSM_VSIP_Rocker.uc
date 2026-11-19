class LPSM_VSIP_Rocker extends LPSM_VSIP_WristTurning_Base
    config(Game);

enum ENextRotation
{
    enrAny,                         // 0
    enrCW,                          // 1
    enrCCW,                         // 2
    ENextRotation_MAX               // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IP;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte NextRotationType;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CompletedRotations;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x5E
    if(IP == none)
    {
        IP = LPVSInteractionPoint_Rocker(vsPawn.GetVSInteractionPoint());
    }
    NextRotationType = 0;
    CompletedRotations = 0;
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LinkedActorRotation;
    local /*0x97E50000-0x00000000*/ private float objectAngle;

    super(GameSpecialMove).Tick(DeltaTime);
    // End:0xA7
    if(bIsReleasing)
    {
        vsPawn.ForkArmSkelControl.ControlStrength = FInterpTo(vsPawn.ForkArmSkelControl.ControlStrength, 0.0000000, DeltaTime, 4.0000000);        
    }
    else
    {
        // End:0x140
        if(bIsPlayingInteractAnim)
        {
            vsPawn.ForkArmSkelControl.BoneRotation = RInterpTo(vsPawn.ForkArmSkelControl.BoneRotation, TargetInitialRotation, DeltaTime, 2.5000000);            
        }
        else
        {
            // End:0x150
            if(bPlayOuttro)
            {                
            }
            else
            {
                UpdateJoystick(DeltaTime);
                objectAngle = float(((DesiredRotation.Roll * 360) / 65536) - 90);
                // End:0x2D4
                if((objectAngle >= MaxRotationAngle) || objectAngle <= -MaxRotationAngle)
                {
                    // End:0x21D
                    if(int(NextRotationType) == int(0))
                    {
                        CompletedRotations++;
                        // End:0x20E
                        if(objectAngle > float(0))
                        {
                            NextRotationType = 1;                            
                        }
                        else
                        {
                            NextRotationType = 2;
                        }                        
                    }
                    else
                    {
                        // End:0x25E
                        if((objectAngle > float(0)) && int(NextRotationType) == int(2))
                        {
                            CompletedRotations++;
                            NextRotationType = 1;                            
                        }
                        else
                        {
                            // End:0x29C
                            if((objectAngle < float(0)) && int(NextRotationType) == int(1))
                            {
                                CompletedRotations++;
                                NextRotationType = 2;
                            }
                        }
                    }
                    // End:0x2D4
                    if(IP.NumRotationForCompleteMove <= float(CompletedRotations))
                    {
                        DoForkArmReleaseAction();
                    }
                }
                vsPawn.ForkArmSkelControl.BoneRotation = RInterpTo(vsPawn.ForkArmSkelControl.BoneRotation, DesiredRotation, DeltaTime, RotationInterpSpeed);
                TwistLoopSound.SetRTPCValue("RotationSpeed", Abs(SoundLevel));
                // End:0x470
                if(SoundLevel >= float(6))
                {
                    // End:0x470
                    if(!MySPPawn.AdditiveAnimInfo.AnimNodeSlot.bIsPlayingCustomAnim)
                    {
                        MySPPawn.AdditiveAnimInfo.AnimNodeSlot.PlayCustomAnim(IP.AdditiveRotationShakeAnimationName, 1.0000000, 0.2500000, 0.2500000, true);
                    }
                }
                SoundLevel = FInterpTo(SoundLevel, 0.0000000, DeltaTime, 6.0000000);
                // End:0x50D
                if(SoundLevel < float(4))
                {
                    SoundLevel = 0.0000000;
                    MySPPawn.AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.2500000);
                }
                // End:0x60E
                if(IP.Mesh != none)
                {
                    LinkedActorRotation = IP.Mesh.Rotation;
                    LinkedActorRotation.Roll = vsPawn.ForkArmSkelControl.BoneRotation.Roll;
                    IP.Mesh.SetRotation(LinkedActorRotation);
                }
                // End:0x6D0
                if(LinkedActor != none)
                {
                    LinkedActorRotation = LinkedActor.Rotation;
                    LinkedActorRotation.Roll = vsPawn.ForkArmSkelControl.BoneRotation.Roll;
                    LinkedActor.SetRotation(LinkedActorRotation);
                }
                OldDelta -= MomentumDecay;
                // End:0x70E
                if(OldDelta < InitialMomentum)
                {
                    OldDelta = InitialMomentum;
                }
            }
        }
    }
    //return;    
}

function CheckCanReach()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL idealStart;
    local /*0x97E50000-0x00000000*/ private float DistSq;

    idealStart = GetIdealLocation();
    DistSq = VSizeSq2D(MySPPawn.Location - idealStart);
    // End:0x6F
    if(DistSq < float(400 * 400))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    bRegisterToInteractionPoint=false
    // Reference: SPTuneDataEventDefSoundBase'Default__LPSM_VSIP_Rocker.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_Rocker.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_Rocker.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VSIP_Rocker.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}