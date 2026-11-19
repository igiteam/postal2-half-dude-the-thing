class LPSM_PlayerVSClawArmGrabbedPawn extends LPSM_PlayerVSWinchArmGrabbedPawn
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    vsPawn.EnableUpperBodyCameraBypass(false);
    super.SpecialMoveEnded(PrevMove, NextMove);
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

function PlayGrabAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL PlayingAnim;
    local /*0x97E50000-0x00000000*/ private float TimeToEnd;

    // End:0xBF
    if(vsPawn.GrabbedPawn.ShouldPlayRetractAnimWhenGrabbed())
    {
        PlayingAnim = MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), PlayEndOfRecoverAnim,, 1.0000000, 0.0000000, 0.0000000, false, true);
        TimeToEnd = PlayingAnim.GetAnimPlaybackLength();        
    }
    else
    {
        MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
        EndOfMoveCameraAndPcStateUpdating();
        TimeToEnd = 0.5000000;
        MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(2),,, 1.0000000, 0.1000000, 0.1000000, true, true);
    }
    vsPawn.ForkArmSkelControl.SetSkelControlStrength(0.0000000, TimeToEnd);
    bIsHolding = true;
    TurnOnVSReticleHelpButtons(true);
    //return;    
}

function PlayEndOfRecoverAnim()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x0F
    if(bInterrupted)
    {
        return;
    }
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    EndOfMoveCameraAndPcStateUpdating();
    vsPawn.GrabbedPawn.DoSpecialMove(Class'LPSM_WinchStruggleBase', true, true,, vsPawn);
    vsPawn.EnableUpperBodyCameraBypass(true);
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(2),,, 1.0000000, 0.1000000, 0.1000000, true, true);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_AllowMunitionsLockerAccess:
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerVSClawArmGrabbedPawn.ToDefaultCamTransitionParamObj'
    begin object name=ToDefaultCamTransitionParamObj
    end object
    ToDefaultCamTransitionParam=ToDefaultCamTransitionParamObj
}