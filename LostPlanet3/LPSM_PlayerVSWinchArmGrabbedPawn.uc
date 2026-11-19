class LPSM_PlayerVSWinchArmGrabbedPawn extends SPSpecialMove
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsHolding;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsReleasingPawn;
var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize @NULL ToDefaultCamTransitionParam[524289];

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    vsPawn.TemplateLogicData.TargetPawn = vsPawn.GrabbedPawn;
    bIsHolding = false;
    bIsReleasingPawn = false;
    PlayGrabAnim();
    //return;    
}

function PlayGrabAnim()
{
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(1), PlayHoldLoop,, 1.0000000, 0.2000000, 0.1000000, false, true);
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
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(1), PlayHoldLoop,, 1.0000000, 0.2000000, 0.1000000, false, true);
    //return;    
}

function PlayHoldLoop()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    // End:0x0F
    if(bInterrupted)
    {
        return;
    }
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(2),,, 1.0000000, 0.1000000, 0.1000000, true, true);
    bIsHolding = true;
    vsPawn.SetTimer(vsPawn.TuneDataVSPlayerPawn.GrabbedPawnKillTimeout, false, 'TimeoutKill', self);
    TurnOnVSReticleHelpButtons(true);
    //return;    
}

function TurnOnVSReticleHelpButtons()
{
    local /*0x97E50000-0x00000000*/ private bool bEnabled[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    LPPC = LPVSPlayerPawn(MySPPawn).GetMyPlayerController();
    // End:0xED
    if(LPPC != none)
    {
        LPPC.SetVSReticleHelpButton(6, bEnabled);
        LPPC.SetVSReticleHelpButton(7, bEnabled);
        LPPC.SetVSReticleHelpButton(2, bEnabled);
        LPPC.SetVSReticleHelpButton(10, bEnabled);
    }
    //return;    
}

function TimeoutKill()
{
    local /*0x97E50000-0x00000000*/ private bool bMustKill[9437185];

    false
    DoVSSpecialMove(Class'LPSM_PlayerVSWinchArmCrush');
    //return;    
}

function PlayReleaseAnim()
{
    vsPawn.ClearTimer('TimeoutKill', self);
    bIsReleasingPawn = true;
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(3), EndSpecialMove,, 1.0000000, 0.2000000, 0.1000000, false, true);
    //return;    
}

function PlayAdditiveHitReaction()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewAnimParams;

    NewAnimParams.SequenceTemplate = GetBestSequenceTemplateByIndex(4);
    NewAnimParams.Rate = 1.0000000;
    NewAnimParams.BlendInTime = 0.1000000;
    NewAnimParams.BlendOutTime = 0.1000000;
    NewAnimParams.bOverride = false;
    MySPPawn.PlayAdditiveAnimationFromParams(NewAnimParams);
    //return;    
}

function HasWinchUpgrade()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL LPVP, Winch;

    LPVP = LPVSPlayerPawn(MySPPawn);
    // End:0x2D
    if(LPVP == none)
    {
        return false;
    }
    Winch = LPWeaponVSWinch(LPVP.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x7A
    if(Winch == none)
    {
        return false;
    }
    return true;
    //return ReturnValue;    
}

function ThrowGrabbedPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL vel;

    // End:0x181
    if(((vsPawn != none) && vsPawn.GrabbedPawn != none) && vsPawn.GrabbedPawn.TuneDataAIPawn.bCanBeThrownByVS)
    {
        vel = Vector(vsPawn.Rotation);
        vel *= vsPawn.TuneDataVSPlayerPawn.WinchThrowPawnVelocity;
        vel.Z = vsPawn.TuneDataVSPlayerPawn.WinchThrowPawnZVelocity;
        vsPawn.GrabbedPawn.DoVSCrushTossAction(vsPawn, vel);
    }
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
        // End:0x46
        case Class'LPSMMTypes'.default.SMM_WinchButtonPressed:
            // End:0x43
            if(!HasWinchUpgrade())
            {
            }
            // End:0x184
            break;
        // End:0x7C
        case Class'LPSMMTypes'.default.SMM_CrushVSGrabbedPawn:
            DoVSSpecialMove(Class'LPSM_PlayerVSWinchArmCrush');
            return true;
        // End:0xC3
        case Class'LPSMMTypes'.default.SMM_ShockStart:
            // End:0xAE
            if(!bIsHolding)
            {
                return false;
            }
            DoVSSpecialMove(Class'LPSM_PlayerVSWinchArmShock');
            return true;
        // End:0xF9
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartStart:
            DoVSSpecialMove(Class'LPSM_PlayerVSWinchDrillKill');
            return true;
        // End:0x126
        case Class'LPSMMTypes'.default.SMM_PawnDiedInClaw:
            PlayReleaseAnim();
            return true;
        // End:0x17E
        case Class'LPSMMTypes'.default.SMM_VSPlayHitReactionAnimation:
            // End:0x17C
            if(LPVSPlayerPawn(MySPPawn).ShouldAllowHitReaction())
            {
                PlayAdditiveHitReaction();
            }
            return true;
        // End:0xFFFF
        default:
            // End:0x184
            break;
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function DoVSSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class NewMove[8388609];

    // End:0x72
    if(MySPPawn.IsLocallyControlled())
    {
        // End:0x72
        if(vsPawn.GrabbedPawn != none)
        {
            vsPawn.DoSpecialMove(NewMove, true);
        }
    }
    //return;    
}

function EndSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    MySPPawn.EndCurrentSpecialMove();
    //return;    
}

function EndOfMoveCameraAndPcStateUpdating()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC;

    LPC = LPPlayerController(MySPPawn.Controller);
    // End:0x11A
    if(LPC != none)
    {
        LPC.EnableGrabPointsDisplay(true);
        // End:0xD0
        if(!LPC.IsInState('Dead') && !LPC.bDebugFreeCamera)
        {
            LPC.GotoState('PlayerWalking');
        }
        // End:0x11A
        if(MySPPawn.IsLocallyControlled())
        {
            LPC.SetDefaultCam(ToDefaultCamTransitionParam);
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    vsPawn.ClearTimer('TimeoutKill', self);
    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0xA6
    if((NextMove == none) || NextMove.Class != Class'LPSM_PlayerVSWinchArmCrush')
    {
        MySPPawn.StopUpperBodyAnim(0.2500000);
    }
    EndOfMoveCameraAndPcStateUpdating();
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    TurnOnVSReticleHelpButtons(false);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPVSPlayerPawn(MySPPawn).VSWinchAnimTree;
    //return ReturnValue;    
}

defaultproperties
{
    // Reference: LPCameraTransitionCubicParam'Default__LPSM_PlayerVSWinchArmGrabbedPawn.ToDefaultCamTransitionParamObj'
    begin object name=ToDefaultCamTransitionParamObj class=Class'LPCameraTransitionCubicParam'
        Duration=0.0100000
        bMaintainSmoothVelocity=false
    end object
    ToDefaultCamTransitionParam=ToDefaultCamTransitionParamObj
    AnimationTemplateNodeNames=/* Array type was not detected. */
}