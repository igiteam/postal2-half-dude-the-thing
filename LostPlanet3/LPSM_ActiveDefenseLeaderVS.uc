class LPSM_ActiveDefenseLeaderVS extends LPSM_ActiveDefenseLeader
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor;

    super.PrepSpecialMove(PrevMove, InteractionActor);
    vsPawn = LPVSPlayerPawn(MySPPawn);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function StartInteraction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPPC;

    // End:0xD8
    if(vsPawn != none)
    {
        vsPawn.SetPitchControllerTarget(0, 0.2500000);
        vsPawn.SetPitchControllerLock(true);
        vsPawn.StopRightArmPartAction(0, true);
        LPPC = LPPlayerController(vsPawn.Controller);
        // End:0xD8
        if(LPPC != none)
        {
            LPPC.CompletedTutorialMode(2);
        }
    }
    super.StartInteraction();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LarochePawn, drm, LPPC;

    // End:0x249
    if(((FollowerPawn != none) && ClassIsChildOf(FollowerPawn.Class, Class'LPAIPawnVsLaroche')) && !ClassIsChildOf(Class, Class'LPSM_ActiveDefendedByLarocheVS'))
    {
        LarochePawn = LPAIPawnVsLaroche(FollowerPawn);
        drm = LPDamageReactionManagerVsLaroche(LarochePawn.DamageReactionManager);
        // End:0x249
        if(drm != none)
        {
            ++drm.NumPlayerActiveDefenses;
            LPPC = vsPawn.GetLocalPlayerController();
            // End:0x1BD
            if(LPPC.ShouldDisplayTutorialModeText(14) && drm.NumPlayerActiveDefenses >= LarochePawn.TuneDataVsLaroche.NumActiveDefensesWithNoStunBeforeTutorialHitMe)
            {
                drm.NumPlayerActiveDefenses = 0;
                LPPC.SetTutorialMode(14);
            }
            // End:0x249
            if(drm.NumPlayerActiveDefenses >= LarochePawn.TuneDataVsLaroche.NumActiveDefensesWithNoStunBeforeEnableMyAD)
            {
                LarochePawn.MyVsLarocheController.bForceNotAllowedToPerformActiveDefense = false;
            }
        }
    }
    // End:0x278
    if(vsPawn != none)
    {
        vsPawn.SetPitchControllerLock(false);
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
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
        // End:0x34
        case Class'LPSMMTypes'.default.SMM_VSRightArmPartStart:
        // End:0x57
        case Class'LPSMMTypes'.default.SMM_VSRightArmAltActionPressed:
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
    CanOverrideBaseClasses=/* Array type was not detected. */
}