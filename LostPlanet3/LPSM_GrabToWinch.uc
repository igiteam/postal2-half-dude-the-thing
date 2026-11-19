class LPSM_GrabToWinch extends LPSM_ForkArmGrab_Hold
    config(Game);

function EndOfMoveCameraAndPcStateUpdating()
{
    //return;    
}

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL GrabbedPawn, vsPawn, Winch;

    GrabbedPawn = LPAIPawn(FollowerPawn);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    vsPawn.SetVSReticleGrabState(true);
    Winch = LPWeaponVSWinch(MySPPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    bReleaseOnEnd = false;
    MySPPawn.EndCurrentSpecialMove();
    // End:0x17C
    if(GrabbedPawn.ShouldPlayRetractAnimWhenGrabbed())
    {
        GrabbedPawn.TemplateLogicData.GrabPointIndex = vsPawn.TemplateLogicData.GrabPointIndex;
        GrabbedPawn.DoSpecialMove(Class'LPSM_ClawGrabRecoverStruggle', true, true,, vsPawn);        
    }
    else
    {
        GrabbedPawn.DoSpecialMove(Class'LPSM_WinchStruggleBase', true, true,, vsPawn);
    }
    // End:0x1EB
    if(Winch == none)
    {
        vsPawn.StartHoldingPawn(GrabbedPawn, false);        
    }
    else
    {
        Winch.bGrabbedFromClaw = true;
        Winch.GrabbedPawn = GrabbedPawn;
        Winch.GotoState('HoldingPawn');
    }
    //return;    
}

defaultproperties
{
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_GrabToWinch.DefaultGrabCamParamObj'
    begin object name=DefaultGrabCamParamObj
    end object
    DefaultGrabCamParams=DefaultGrabCamParamObj
    // Reference: LPCameraModeAimControlGrabParam'Default__LPSM_GrabToWinch.GrabCamParamObj'
    begin object name=GrabCamParamObj
    end object
    GrabCamParams=GrabCamParamObj
    // Reference: LPCameraTransitionCutParam'Default__LPSM_GrabToWinch.GrabCamTransitionInParamObj'
    begin object name=GrabCamTransitionInParamObj
    end object
    GrabTransitionInParam=GrabCamTransitionInParamObj
}