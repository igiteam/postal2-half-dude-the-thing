class LPSM_PlayerVSWinchWinchPoint extends LPSM_PlayerVSWinchFireBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], VS, NewRotation, Winch, MyPlayerController;

    super.SpecialMoveStarted(bForced, PrevMove);
    VS = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x86
    if(VS != none)
    {
        VS.UpperBodyBlendPerBone.SetBlendTarget(0.0000000, 0.0000000);
    }
    VS.StopUpperBodyAnim(0.0000000);
    StopCustomAnimation();
    Winch = LPWeaponVSWinch(VS.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x352
    if((Winch.SpawnedProjectile != none) && Winch.SpawnedProjectile.AttachedWinchPoint != none)
    {
        NewRotation = Rotator(Winch.SpawnedProjectile.AttachedWinchPoint.Location - MySPPawn.Location);
        // End:0x272
        if(Winch.SpawnedProjectile.AttachedWinchPoint.bAllowVSPitchToTarget)
        {
            VS.SetPitchControllerLock(false);
            VS.SetPitchControllerTarget(NewRotation.Pitch, 0.5000000);            
        }
        else
        {
            VS.SetPitchControllerLock(false);
            VS.SetPitchControllerTarget(0, 0.5000000);
        }
        VS.SetPitchControllerLock(true);
        NewRotation.Pitch = 0;
        MySPPawn.RegisterDestinationAndOrientation(PlayingSeq, MySPPawn.Location, NewRotation, 0.0000000, 0.5000000, true, false);
    }
    MyPlayerController = LPPlayerController(MySPPawn.Controller);
    // End:0x3D3
    if(MyPlayerController != none)
    {
        MyPlayerController.ShowExitVSOptionMessage();
        MyPlayerController.SetVSReticleHelpButton(10, true);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.CancelDestinationRegistration();
    LPPlayerController(MySPPawn.Controller).ClientClearExitVSOptionMessage();
    LPPlayerController(MySPPawn.Controller).SetVSReticleHelpButton(10, false);
    //return;    
}

function SpecialMoveEndedStopAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x52
    if((NextMove == none) || !NextMove.IsA('LPSM_VSPlayerExit'))
    {
        super(SPSM_PlayAnimBase).SpecialMoveEndedStopAnimation(PrevMove, NextMove);
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
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_WinchPointRelease:
            return true;
        // End:0x59
        case Class'LPSMMTypes'.default.SMM_WinchPointZipline:
            return true;
        // End:0x86
        case Class'LPSMMTypes'.default.SMM_ShockStart:
            ShockObject();
            return true;
        // End:0xFFFF
        default:
            return super.ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function ShockObject()
{
    local /*0x97E50000-0x00000000*/ private @NULL Winch, vsPlayerPawn;

    vsPlayerPawn = LPVSPlayerPawn(MySPPawn);
    Winch = LPWeaponVSWinch(vsPlayerPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x101
    if(Winch.IsInState('WinchPointInteracting') && Winch.SpawnedProjectile.AttachedWinchPoint != none)
    {
        Winch.SpawnedProjectile.AttachedWinchPoint.ShockObject();
    }
    vsPlayerPawn.TaserLineCreateParticleSystem();
    //return;    
}

defaultproperties
{
    PlaybackType=SPSM_PlayAnimType.SPSM_PlayAnimFullBody
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}