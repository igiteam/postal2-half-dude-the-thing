class LPSM_BaseChoreography extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDefaultCameraOnCompletion;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    // End:0x7C
    if(MySPPawn.IsLocallyControlled())
    {
        SPPlayerController(MySPPawn.Controller).PauseFire();
    }
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams;

    ChoreographyParams.AlignmentType = 0;
    ChoreographyParams.MySequence = SeqNode;
    ChoreographyParams.RotationMode = 1;
    ChoreographyParams.OtherTargetMovePercent = 0.0000000;
    ChoreographyParams.BlendTime = 0.5000000;
    ChoreographyParams.OtherTarget = MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor;
    StartPawnChoreography(ChoreographyParams);
    //return;    
}

function StartPawnChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL Params[8388609];

    MySPPawn.StartPawnChoreography(Params);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPPC;

    StopFullBodyAnimation();
    MySPPawn.StopPawnChoreography();
    // End:0xF6
    if(MySPPawn.IsLocallyControlled())
    {
        LPPC = LPPlayerController(MySPPawn.Controller);
        LPPC.UnPauseFire();
        // End:0xF6
        if(bDefaultCameraOnCompletion || bLastPlaybackInterrupted)
        {
            LPPC.ClearAnimatedCamera();
            LPPC.SetDefaultCam();
        }
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bManageRootMotionMode=true
}