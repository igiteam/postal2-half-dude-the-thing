class LPStrugglePhaseAnim extends LPStrugglePhase
    abstract;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL tuneDataAnim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CameraAnimInstance;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAnimFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int AnimIndex;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampLoopStart;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeLooping;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float OverwrittenAnimStartTime;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array StruggleLoopSounds[524289];

function InitObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL inSMStruggleMode[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bOk;

    bOk = super.InitObject(inSMStruggleMode);
    tuneDataAnim = LPTuneDataStrugglePhaseAnim(TuneData);
    AnimIndex = -1;
    // End:0x163
    if((int(tuneDataAnim.PlayAnimMode) != int(3)) && int(tuneDataAnim.PlayAnimTarget) == int(0))
    {
        AnimIndex = inSMStruggleMode.AnimationTemplateNodeNames.Find(tuneDataAnim.AnimTemplateName);        
        // End:0x163
        if(AnimIndex == -1)
        {
            AnimIndex = inSMStruggleMode.AnimationTemplateNodeNames.Length;
            inSMStruggleMode.AnimationTemplateNodeNames.AddItem(tuneDataAnim.AnimTemplateName);            
        }
    }
    return bOk;
    //return ReturnValue;    
}

function Start()
{
    local /*0x97E50000-0x00000000*/ private name PrevPhaseName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyAnimNode, OtherAnimNode, PrevAnimPhase, FollowerSpecialMove;
    local /*0x97E50000-0x00000000*/ private int PrevPhaseIndex;
    local /*0x97E50000-0x00000000*/ private float NewReticleTime;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NotifyArray;
    local /*0x97E50000-0x00000000*/ private bool bPlayCameraAnimInNotify;
    local /*0x97E50000-0x00000000*/ private @NULL NotifySound;
    local /*0x97E50000-0x00000000*/ private int I;

    super.Start(PrevPhaseName);
    // End:0xDA0
    if(int(tuneDataAnim.PlayAnimMode) != int(3))
    {
        // End:0x676
        if(int(tuneDataAnim.PlayAnimMode) == int(0))
        {
            // End:0x1FC
            if(tuneDataAnim.bIsLooping)
            {
                SetTimeLooping(RandRange(tuneDataAnim.MinTime, tuneDataAnim.MaxTime));
                TimeStampLoopStart = GetTime();
                smStruggleMode.StartChoreographedAnimationLooped(smStruggleMode.MySPPawn, smStruggleMode.FollowerPawn, AnimIndex, tuneDataAnim.BlendInTime, tuneDataAnim.PlayRate, tuneDataAnim.ChoreoMovementPercent);
                MyAnimNode = smStruggleMode.MySPPawn.PawnChoreographyParams.MySequence;                
            }
            else
            {
                smStruggleMode.StartAnimationChoreography(smStruggleMode.MySPPawn, smStruggleMode.FollowerPawn, AnimIndex, true, AnimFinished, FollowerAnimFinished,, tuneDataAnim.BlendInTime, tuneDataAnim.bLeaderUpperBody, tuneDataAnim.ChoreoMovementPercent, tuneDataAnim.PlayRate);
                MyAnimNode = smStruggleMode.MySPPawn.PawnChoreographyParams.MySequence;
                // End:0x418
                if(OverwrittenAnimStartTime >= 0.0000000)
                {
                    OtherAnimNode = smStruggleMode.MySPPawn.PawnChoreographyParams.OtherTargetSequence;
                    MyAnimNode.SetPosition(OverwrittenAnimStartTime, false);
                    OtherAnimNode.SetPosition(OverwrittenAnimStartTime, false);
                    NewReticleTime = OverwrittenAnimStartTime;                    
                }
                else
                {
                    // End:0x5D6
                    if(tuneDataAnim.AnimStartPctg >= 0.0000000)
                    {
                        OtherAnimNode = smStruggleMode.MySPPawn.PawnChoreographyParams.OtherTargetSequence;
                        MyAnimNode.SetPosition(tuneDataAnim.AnimStartPctg * MyAnimNode.AnimSeq.SequenceLength, false);
                        OtherAnimNode.SetPosition(tuneDataAnim.AnimStartPctg * OtherAnimNode.AnimSeq.SequenceLength, false);
                        NewReticleTime = tuneDataAnim.AnimStartPctg * MyAnimNode.AnimSeq.SequenceLength;                        
                    }
                    else
                    {
                        // End:0x622
                        if(MyAnimNode != none)
                        {
                            NewReticleTime = MyAnimNode.AnimSeq.SequenceLength;
                        }
                    }
                }
                // End:0x673
                if(NewReticleTime > 0.0000000)
                {
                    smStruggleMode.GetLeadersController().UpdateStruggleModeReticle(NewReticleTime);
                }
            }            
        }
        else
        {
            // End:0xA9C
            if(int(tuneDataAnim.PlayAnimMode) == int(1))
            {
                // End:0x774
                if((AnimIndex == -1) && int(tuneDataAnim.PlayAnimTarget) == int(1))
                {
                    FollowerSpecialMove = LPSM_FollowerStruggleMode(smStruggleMode.FollowerSMInstance);
                    AnimIndex = FollowerSpecialMove.FullBodyAnimIndexes[smStruggleMode.GetPhaseIndex(tuneDataAnim.PhaseName)];
                }
                // End:0x87F
                if(tuneDataAnim.bIsLooping)
                {
                    SetTimeLooping(RandRange(tuneDataAnim.MinTime, tuneDataAnim.MaxTime));
                    TimeStampLoopStart = GetTime();
                    smStruggleMode.PlayFullBodyLooped(tuneDataAnim.PlayAnimTarget, AnimIndex, tuneDataAnim.BlendInTime, tuneDataAnim.PlayRate);                    
                }
                else
                {
                    MyAnimNode = smStruggleMode.PlayFullBody(tuneDataAnim.PlayAnimTarget, AnimIndex, true, AnimFinished,, tuneDataAnim.BlendInTime);
                    // End:0x9FC
                    if(tuneDataAnim.AnimStartPctg >= 0.0000000)
                    {
                        MyAnimNode.SetPosition(tuneDataAnim.AnimStartPctg * MyAnimNode.AnimSeq.SequenceLength, false);
                        NewReticleTime = tuneDataAnim.AnimStartPctg * MyAnimNode.AnimSeq.SequenceLength;                        
                    }
                    else
                    {
                        // End:0xA48
                        if(MyAnimNode != none)
                        {
                            NewReticleTime = MyAnimNode.AnimSeq.SequenceLength;
                        }
                    }
                    // End:0xA99
                    if(NewReticleTime > 0.0000000)
                    {
                        smStruggleMode.GetLeadersController().UpdateStruggleModeReticle(NewReticleTime);
                    }
                }                
            }
            else
            {
                // End:0xDA0
                if(int(tuneDataAnim.PlayAnimMode) == int(2))
                {
                    // End:0xB9A
                    if((AnimIndex == -1) && int(tuneDataAnim.PlayAnimTarget) == int(1))
                    {
                        FollowerSpecialMove = LPSM_FollowerStruggleMode(smStruggleMode.FollowerSMInstance);
                        AnimIndex = FollowerSpecialMove.AdditiveAnimIndexes[smStruggleMode.GetPhaseIndex(tuneDataAnim.PhaseName)];
                    }
                    MyAnimNode = smStruggleMode.PlayAdditive(tuneDataAnim.PlayAnimTarget, AnimIndex, tuneDataAnim.PlayRate);
                    // End:0xD03
                    if(tuneDataAnim.AnimStartPctg >= 0.0000000)
                    {
                        MyAnimNode.SetPosition(tuneDataAnim.AnimStartPctg * MyAnimNode.AnimSeq.SequenceLength, false);
                        NewReticleTime = tuneDataAnim.AnimStartPctg * MyAnimNode.AnimSeq.SequenceLength;                        
                    }
                    else
                    {
                        // End:0xD4F
                        if(MyAnimNode != none)
                        {
                            NewReticleTime = MyAnimNode.AnimSeq.SequenceLength;
                        }
                    }
                    // End:0xDA0
                    if(NewReticleTime > 0.0000000)
                    {
                        smStruggleMode.GetLeadersController().UpdateStruggleModeReticle(NewReticleTime);
                    }
                }
            }
        }
    }
    // End:0xEB9
    if((tuneDataAnim.CameraAnim != none) && smStruggleMode.MySPPawn.IsLocallyControlled())
    {
        bPlayCameraAnimInNotify = false;
        // End:0xEA0
        if((MyAnimNode != none) && MyAnimNode.AnimSeq != none)
        {
            MyAnimNode.AnimSeq.GetNotifies(Class'LPAnimNotify_StrugglePlayCameraAnim', NotifyArray);
            // End:0xEA0
            if(NotifyArray.Length > 0)
            {
                bPlayCameraAnimInNotify = true;
            }
        }
        // End:0xEB9
        if(!bPlayCameraAnimInNotify)
        {
            PlayCameraAnim();
        }
    }
    // End:0xF07
    if(tuneDataAnim.SoundEventName == 'None')
    {
        smStruggleMode.ClearSoundLoop();        
    }
    else
    {
        PrevPhaseIndex = smStruggleMode.GetPhaseIndex(PrevPhaseName);
        PrevAnimPhase = none;
        // End:0xF92
        if(PrevPhaseIndex != -1)
        {
            PrevAnimPhase = LPStrugglePhaseAnim(smStruggleMode.StrugglePhases[PrevPhaseIndex]);
        }
        // End:0x1036
        if((PrevAnimPhase == none) || tuneDataAnim.SoundEventName != PrevAnimPhase.tuneDataAnim.SoundEventName)
        {
            smStruggleMode.PlaySoundEvent(tuneDataAnim.SoundEventName);
        }
    }
    // End:0x1183
    if((MyAnimNode != none) && MyAnimNode.AnimSeq != none)
    {
        MyAnimNode.AnimSeq.GetNotifies(Class'LPAnimNotify_Sound', NotifyArray);
        I = 0;
        J0x10BC:

        // End:0x1183 [Loop If]
        if(I < NotifyArray.Length)
        {
            NotifySound = LPAnimNotify_Sound(NotifyArray[I].Notify);
            // End:0x1175
            if((NotifySound != none) && NotifySound.bMarkAsLoopSound)
            {
                StruggleLoopSounds.AddItem(NotifySound.PlaySound(MyAnimNode));                
            }
            ++I;
            // [Loop Continue]
            goto J0x10BC;
        }
    }
    // End:0x1201
    if(tuneDataAnim.OverwriteKnifeSocket != 'None')
    {
        smStruggleMode.PlayerPawn.ShowKnife(tuneDataAnim.OverwriteKnifeSocket);
    }
    // End:0x126E
    if(smStruggleMode.PlayerPawn.DisableCameraCollisionInStruggleMode)
    {
        smStruggleMode.StruggleCamParams.bCollideCamera = false;
    }
    bAnimFinished = false;
    //return;    
}

function @NULL Stop()
{
    local /*0x97E50000-0x00000000*/ private name NextPhaseName[8388609];
    local /*0x97E50000-0x00000400*/ private @NULL StruggleLoopSound;

    // End:0x3A
    if(CameraAnimInstance != none)
    {
        CameraAnimInstance.super(CameraAnimInst).Stop();
        CameraAnimInstance = none;
    }
    OverwrittenAnimStartTime = -1.0000000;
    // End:0xDC
    if(tuneDataAnim.OverwriteKnifeSocket != 'None')
    {
        smStruggleMode.PlayerPawn.ShowKnife(smStruggleMode.TuneData.KnifeSocket);
    }
    // End:0x12C
    foreach StruggleLoopSounds(StruggleLoopSound)
    {
        // End:0x12B
        if(StruggleLoopSound != none)
        {
            StruggleLoopSound.FadeOut(0.5000000, 0.0000000);
        }        
    }    
    StruggleLoopSounds.Remove(0, StruggleLoopSounds.Length);    
    // End:0x1B0
    if(smStruggleMode.PlayerPawn.DisableCameraCollisionInStruggleMode)
    {
        smStruggleMode.StruggleCamParams.bCollideCamera = true;
    }
    super.Stop(NextPhaseName);
    //return;    
}

function SetTimeLooping()
{
    local /*0x97E50000-0x00000000*/ private float InTimeLooping[8388609];

    TimeLooping = InTimeLooping;
    // End:0x64
    if(TimeLooping > 0.0000000)
    {
        smStruggleMode.GetLeadersController().UpdateStruggleModeReticle(TimeLooping);
    }
    //return;    
}

function PlayCameraAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayerCamera;

    // End:0x11
    if(CameraAnimInstance != none)
    {
        return;
    }
    PlayerCamera = smStruggleMode.GetLeadersController().PlayerCamera;
    // End:0xC1
    if(PlayerCamera != none)
    {
        CameraAnimInstance = PlayerCamera.PlayCameraAnim(tuneDataAnim.CameraAnim, 1.0000000, 1.0000000, 0.2500000, 0.2500000, true, false, 0.0000000, true);
    }
    //return;    
}

function Update()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bFinished;

    bFinished = super.Update(DeltaTime);
    // End:0x2D
    if(bFinished)
    {
        return true;
    }
    // End:0xC5
    if(int(tuneDataAnim.PlayAnimMode) != int(3))
    {
        // End:0xC5
        if((!bAnimFinished && tuneDataAnim.bIsLooping) && TimeLooping > float(0))
        {
            bAnimFinished = (GetTimeSince(TimeStampLoopStart)) >= TimeLooping;
        }
    }
    // End:0xD2
    if(bAnimFinished)
    {
    }
    return bAnimFinished;
    //return ReturnValue;    
}

function AnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x19
    if(!bInterrupted)
    {
        StruggleTakeDamage();
    }
    bAnimFinished = true;
    //return;    
}

function FollowerAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x63
    if((!bInterrupted && !bAnimFinished) && tuneDataAnim.EndFollowerOnAnimFinishes)
    {
        smStruggleMode.EndFollowerSpecialMove();
    }
    //return;    
}

function StrugglePlayCameraAnim()
{
    PlayCameraAnim();
    //return;    
}

defaultproperties
{
    OverwrittenAnimStartTime=-1.0000000
}