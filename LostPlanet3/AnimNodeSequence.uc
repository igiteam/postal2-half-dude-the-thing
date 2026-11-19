class AnimNodeSequence extends AnimNode
    hidecategories(Object,Object,Object);

enum ERootBoneAxis
{
    RBA_Default,                    // 0
    RBA_Discard,                    // 1
    RBA_Translate,                  // 2
    RBA_MAX                         // 3
};

enum ERootRotationOption
{
    RRO_Default,                    // 0
    RRO_Discard,                    // 1
    RRO_Extract,                    // 2
    RRO_MAX                         // 3
};

var(*) /*0x02E20000-0x00000000*/ private name AnimSeqName[196609];
var(*) /*0x02E20000-0x00000000*/ private float Rate[65537];
var(*) /*0x02E20000-0x00000000*/ private bool bPlaying[65537];
var(*) /*0x02E20000-0x00000000*/ private bool bManualPlayback[65537];
var(*) /*0x02E20000-0x00000000*/ private bool bLooping[65537];
var(*) /*0x02E20000-0x00000000*/ private bool bCauseActorAnimEnd[65537];
var(*) /*0x02E20000-0x00000000*/ private bool bCauseActorAnimPlay[65537];
var(*) /*0x02E20000-0x00000000*/ private bool bZeroRootRotation[65537];
var(*) /*0x02E20000-0x00000000*/ private bool bZeroRootTranslation[65537];
var(*) /*0x02E20000-0x00000000*/ private bool bDisableWarningWhenAnimNotFound[65537];
var(*) /*0x02E20000-0x00000000*/ private bool bNoNotifies[65537];
var(*) /*0x02E20000-0x00000000*/ private bool bForceRefposeWhenNotPlaying[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bIsIssuingNotifies;
var(*) /*0x28960000-0x00000000*/ private bool bForceAlwaysSlave[65537];
var(*) /*0x28960000-0x00000000*/ private bool bSynchronize[196609];
var(*) /*0x28960000-0x00000000*/ private bool bReverseSync[196609];
var(*) /*0x1CE70000-0x00000000*/ private bool bShowTimeLineSlider[65537];
var(*) /*0x10A20000-0x00000000*/ private bool bLoopCameraAnim[65537];
var(*) /*0x10A20000-0x00000000*/ private bool bRandomizeCameraAnimLoopStartTime[65537];
var(*) /*0x35EA0000-0x00000000*/ private bool bAccountForRotatorErrorInExtractedRotation;
var(*) /*0x35EA0000-0x00000000*/ private bool bEditorOnlyAddRefPoseToAdditiveAnimation[131073];
var(*) /*0x35EA0000-0x00000000*/ private bool bCheckForFinishAnimEarly[536870913];
var(*) /*0x35EA0000-0x00000000*/ private bool bBlendingOut[536870913];
var(*) /*0x02E20000-0x00000000*/ private float CurrentTime[196609];
var(*) /*0x35EA0000-0x00000000*/ private float PreviousTime[537001985];
var(*) /*0x35EA0000-0x00000000*/ private float EndTime[537001985];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AnimSeq[537001985];
var(*) /*0x35EA0000-0x00000000*/ private int AnimLinkupIndex[537001985];
var(*) /*0x02E20000-0x00000000*/ private float NotifyWeightThreshold[65537];
var(*) /*0x28960000-0x00000000*/ private name SynchGroupName[196609];
var(*) /*0x28960000-0x00000000*/ private float SynchPosOffset[65537];
var(*) /*0x10A20000-0x00000000*/ private @NULL CameraAnim[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL ActiveCameraAnimInstance[536870913];
var(*) /*0x10A20000-0x00000000*/ private float CameraAnimScale[65537];
var(*) /*0x10A20000-0x00000000*/ private float CameraAnimPlayRate[65537];
var(*) /*0x10A20000-0x00000000*/ private float CameraAnimBlendInTime[65537];
var(*) /*0x10A20000-0x00000000*/ private float CameraAnimBlendOutTime[65537];
var(*) /*0x35EA0000-0x00000000*/ private @NULL AccumulatedExtractedRotation;
var(*) /*0x02E20000-0x00000000*/ private byte RootBoneOption[196611];
var(*) /*0x02E20000-0x00000000*/ private byte RootRotationOption[196611];
var(*) /*0x35EA0000-0x00000000*/ private name LastMissingAnimName[536870913];
var(*) /*0x35EA0000-0x00000000*/ private editfixedsize array MetaDataSkelControlList[537001985];

// Export UAnimNodeSequence::execSetAnim(FFrame&, void* const)
native function SetAnim()
{
    local /*0x35EA0000-0x00000000*/ private name Sequence[8388609];


}

// Export UAnimNodeSequence::execPlayAnim(FFrame&, void* const)
native function PlayAnim()
{
    local /*0x35EA0000-0x00000000*/ private bool bLoop[9437185];
    local /*0x35EA0000-0x00000000*/ private float InRate[9437185], StartTime;

    false
    1.0000000
    0.0000000                    
}

// Export UAnimNodeSequence::execStopAnim(FFrame&, void* const)
native function StopAnim();

// Export UAnimNodeSequence::execReplayAnim(FFrame&, void* const)
native function ReplayAnim();

// Export UAnimNodeSequence::execSetPosition(FFrame&, void* const)
native function SetPosition()
{
    local /*0x35EA0000-0x00000000*/ private float NewTime[8388609];
    local /*0x35EA0000-0x00000000*/ private bool bFireNotifies[8388609];


}

// Export UAnimNodeSequence::execGetNormalizedPosition(FFrame&, void* const)
native function GetNormalizedPosition()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UAnimNodeSequence::execFindGroupRelativePosition(FFrame&, void* const)
native function FindGroupRelativePosition()
{
    local /*0x35EA0000-0x00000000*/ private float GroupRelativePosition[8388609], ReturnValue;


}

// Export UAnimNodeSequence::execFindGroupPosition(FFrame&, void* const)
native function FindGroupPosition()
{
    local /*0x35EA0000-0x00000000*/ private float GroupRelativePosition[8388609], ReturnValue;


}

// Export UAnimNodeSequence::execGetGroupRelativePosition(FFrame&, void* const)
native function GetGroupRelativePosition()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UAnimNodeSequence::execGetGlobalPlayRate(FFrame&, void* const)
native function GetGlobalPlayRate()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UAnimNodeSequence::execGetAnimPlaybackLength(FFrame&, void* const)
native function GetAnimPlaybackLength()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UAnimNodeSequence::execGetTimeLeft(FFrame&, void* const)
native function GetTimeLeft()
{
    local /*0x35EA0000-0x00000000*/ private float ReturnValue[92274689];


}

// Export UAnimNodeSequence::execSetRootBoneAxisOption(FFrame&, void* const)
native final function SetRootBoneAxisOption()
{
    local /*0x35EA0000-0x00000000*/ private byte AxisX[9437185], AxisY, AxisZ;

    0
    0
    0                    
}

// Export UAnimNodeSequence::execSetRootBoneRotationOption(FFrame&, void* const)
native final function SetRootBoneRotationOption()
{
    local /*0x35EA0000-0x00000000*/ private byte AxisX[9437185], AxisY, AxisZ;

    0
    0
    0                    
}

defaultproperties
{
    Rate=1.0000000
    bSynchronize=true
    CameraAnimScale=1.0000000
    CameraAnimPlayRate=1.0000000
    CameraAnimBlendInTime=0.2000000
    CameraAnimBlendOutTime=0.2000000
}