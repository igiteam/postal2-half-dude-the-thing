class LPSM_PlayerIssStruggle extends LPSM_LeadStruggleMode
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL KismetEvent;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPPlayerPawn(inPawn).TuneDataStrugglePlayerIss;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private int Idx;

    Idx = 0;
    J0x0B:

    // End:0x93 [Loop If]
    if(Idx < MySPPawn.GeneratedEvents.Length)
    {
        KismetEvent = LPSeqEvent_ISSStruggleMode(MySPPawn.GeneratedEvents[Idx]);
        // End:0x85
        if(KismetEvent != none)
        {
            // [Explicit Break]
            goto J0x93;
        }
        Idx++;
        // [Loop Continue]
        goto J0x0B;
    }
    J0x93:

    super.StartInteraction();
    NotifyKismetStartPhase(CurrentPhaseIdx);
    //return;    
}

function GotoPhase()
{
    local /*0x97E50000-0x00000000*/ private int NextPhaseIdx[8388609];

    super.GotoPhase(NextPhaseIdx);
    NotifyKismetStartPhase(NextPhaseIdx);
    //return;    
}

function NotifyKismetStartPhase()
{
    local /*0x97E50000-0x00000000*/ private int phaseIdx[8388609];
    local /*0x97E50000-0x00000000*/ private editfixedsize array ActivateIndices;

    // End:0x76
    if((phaseIdx != -1) && KismetEvent != none)
    {
        ActivateIndices.AddItem(phaseIdx);        
        KismetEvent.CheckActivate(MySPPawn, FollowerPawn, false, ActivateIndices);
    }
    //return;    
}

simulated function SetUpChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL Leader[8388609], MySeq, Follower, OtherSeq, ChoreoMetaData;

    local /*0x97E50000-0x00000000*/ private byte AlignmentType[8388609];
    local /*0x97E50000-0x00000000*/ private bool bLeaveCollisionOnOther[8388609], bIgnoreCollisionBetweenLeaderAndFollower;
    local /*0x97E50000-0x00000000*/ private float PreferredOtherMovementPercent[9437185];
    local /*0x97E50000-0x00000000*/ private byte ZMatchType[9437185], RotationMode;
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    0
    0
    return super.SetUpChoreography(Leader, MySeq, Follower, OtherSeq, ChoreoMetaData, AlignmentType, false, true, 1.0000000, ZMatchType, RotationMode);
    //return ReturnValue;    
}

defaultproperties
{
    PlayerCtrlStateName="StruggleIssAttack"
    TuneDataClass=Class'LPTuneDataStrugglePlayerIss'
    ApplyDamageClass=Class'LPDamageTypeIssStruggle'
    // Reference: LPCameraModeAimControlAnimatedParam'Default__LPSM_PlayerIssStruggle.StruggleCamParamObj'
    begin object name=StruggleCamParamObj
    end object
    StruggleCamParams=StruggleCamParamObj
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerIssStruggle.StruggleCamTransitionInParamObj'
    begin object name=StruggleCamTransitionInParamObj
    end object
    StruggleTransitionInParam=StruggleCamTransitionInParamObj
    FollowerSpecialMoveClass=Class'LPSM_IssPlayerStruggle'
    bAllowFloorConforming=false
}