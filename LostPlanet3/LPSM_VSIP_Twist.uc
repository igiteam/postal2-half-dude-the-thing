class LPSM_VSIP_Twist extends LPSM_VSIP_WristTurning_Base
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL IP;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    IP = LPVSInteractionPointTwist(vsPawn.GetVSInteractionPoint());
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function PlayInteractAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return super.PlayInteractAnim();
    //return ReturnValue;    
}

function PlayHoldLoop()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    super.PlayHoldLoop(Node, InUserData, bInterrupted);
    //return;    
}

function PlayReleaseAnim()
{
    super.PlayReleaseAnim();
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function DoOuttroAnimation()
{
    // End:0x38
    if(WristTurnIP.RetractFromFinishedName == 'None')
    {
        DoForkArmReleaseAction();
        return;
    }
    super.DoOuttroAnimation();
    bPlayOuttro = true;
    bIsPlayingInteractAnim = false;
    MySPPawn.AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.2500000);
    TwistLoopSound.SetRTPCValue("RotationSpeed", 0.0000000);
    MySPPawn.PlayFullBodyAnimation(WristTurnIP.RetractFromFinishedName, FinisherDoneCB,, 1.0000000, 0.2000000, 0.1000000, false, true, 2, 2, true);
    // End:0x1A5
    if(LinkedActor != none)
    {
        LinkedActor.SkeletalMeshComponent.PlayAnim(IP.PropFinishedAnimationName);
    }
    // End:0x220
    if(VSIP.Mesh != none)
    {
        VSIP.Mesh.PlayAnim(IP.PropFinishedAnimationName);
    }
    //return;    
}

function EndSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    super.EndSpecialMove(Node, InUserData, bInterrupted);
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LinkedActorRotation;

    super(GameSpecialMove).Tick(DeltaTime);
    // End:0x23
    if(bIsReleasing)
    {        
    }
    else
    {
        // End:0xBC
        if(bIsPlayingInteractAnim)
        {
            vsPawn.ForkArmSkelControl.BoneRotation = RInterpTo(vsPawn.ForkArmSkelControl.BoneRotation, TargetInitialRotation, DeltaTime, 4.0000000);            
        }
        else
        {
            // End:0xCC
            if(bPlayOuttro)
            {                
            }
            else
            {
                UpdateJoystick(DeltaTime);
                vsPawn.ForkArmSkelControl.BoneRotation = RInterpTo(vsPawn.ForkArmSkelControl.BoneRotation, DesiredRotation, DeltaTime, RotationInterpSpeed);
                TwistLoopSound.SetRTPCValue("RotationSpeed", Abs(SoundLevel));
                // End:0x27B
                if(SoundLevel >= float(6))
                {
                    // End:0x27B
                    if(!MySPPawn.AdditiveAnimInfo.AnimNodeSlot.bIsPlayingCustomAnim)
                    {
                        MySPPawn.AdditiveAnimInfo.AnimNodeSlot.PlayCustomAnim(IP.AdditiveRotationShakeAnimationName, 1.0000000, 0.2500000, 0.2500000, true);
                    }
                }
                SoundLevel = FInterpTo(SoundLevel, 0.0000000, DeltaTime, 6.0000000);
                // End:0x318
                if(SoundLevel < float(4))
                {
                    SoundLevel = 0.0000000;
                    MySPPawn.AdditiveAnimInfo.AnimNodeSlot.StopCustomAnim(0.2500000);
                }
                // End:0x51C
                if(vsPawn.ForkArmSkelControl.BoneRotation != DesiredRotation)
                {
                    // End:0x45A
                    if(IP.Mesh != none)
                    {
                        LinkedActorRotation = IP.Mesh.Rotation;
                        LinkedActorRotation.Roll = vsPawn.ForkArmSkelControl.BoneRotation.Roll;
                        IP.Mesh.SetRotation(LinkedActorRotation);
                    }
                    // End:0x51C
                    if(LinkedActor != none)
                    {
                        LinkedActorRotation = LinkedActor.Rotation;
                        LinkedActorRotation.Roll = vsPawn.ForkArmSkelControl.BoneRotation.Roll;
                        LinkedActor.SetRotation(LinkedActorRotation);
                    }
                }
                OldDelta -= MomentumDecay;
                // End:0x55A
                if(OldDelta < InitialMomentum)
                {
                    OldDelta = InitialMomentum;
                }
            }
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: SPTuneDataEventDefSoundBase'Default__LPSM_VSIP_Twist.MaxDistancePlaybackOverrideObj'
    begin object name=MaxDistancePlaybackOverrideObj
    end object
    MaxDistancePlaybackOverride=MaxDistancePlaybackOverrideObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_Twist.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_VSIP_Twist.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_VSIP_Twist.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}