class LPSM_VsLarocheDefaultStandingStun extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWasSawGenEnabledAtStartOfSM;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], VsLarochePawn;

    bWasSawGenEnabledAtStartOfSM = false;
    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.ZeroRotationRate();
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    VsLarochePawn = LPAIPawnVsLaroche(MySPPawn);
    ProccesGrabLocationForStartOfSM(VsLarochePawn);
    // End:0x16F
    if(VsLarochePawn.TuneDataVsLaroche.bPlayerAllowedToDestroySawGenCoreWhenLaRocheStunned)
    {
        // End:0x14D
        if(VsLarochePawn.IsCoreEnabled(5))
        {
            bWasSawGenEnabledAtStartOfSM = true;            
        }
        else
        {
            VsLarochePawn.EnableCoreById(5, true);
        }
    }
    //return;    
}

function ProccesGrabLocationForStartOfSM()
{
    local /*0x97E50000-0x00000000*/ private @NULL VsLarochePawn[8388609];

    // End:0x1EB
    if(VsLarochePawn != none)
    {
        // End:0x53
        if(VsLarochePawn.IsLeftArmGrabPointAbleToBeGrabed())
        {
            VsLarochePawn.SetGrabPointEnabledByIndex(7, true);
        }
        // End:0x97
        if(VsLarochePawn.IsLeftShoulderGrabPointAbleToBeGrabed())
        {
            VsLarochePawn.SetGrabPointEnabledByIndex(8, true);
        }
        // End:0xDB
        if(VsLarochePawn.IsRightShoulderGrabPointAbleToBeGrabed())
        {
            VsLarochePawn.SetGrabPointEnabledByIndex(9, true);
        }
        // End:0x11F
        if(VsLarochePawn.IsCockpitCrossBarForShieldGrabPointAbleToBeGrabed())
        {
            VsLarochePawn.SetGrabPointEnabledByIndex(11, true);
        }
        // End:0x163
        if(VsLarochePawn.IsCockpitCrossBarGrabPointAbleToBeGrabed())
        {
            VsLarochePawn.SetGrabPointEnabledByIndex(12, true);
        }
        // End:0x1A7
        if(VsLarochePawn.IsRightInnerShoulderGrabPointAbleToBeGrabed())
        {
            VsLarochePawn.SetGrabPointEnabledByIndex(6, true);
        }
        // End:0x1EB
        if(VsLarochePawn.IsCockpitGrabPointAbleToBeGrabed())
        {
            VsLarochePawn.SetGrabPointEnabledByIndex(13, true);
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, VsLarochePawn;

    VsLarochePawn = LPAIPawnVsLaroche(MySPPawn);
    ProccesGrabLocationForEndOfSM(VsLarochePawn);
    // End:0x97
    if(VsLarochePawn.TuneDataVsLaroche.bPlayerAllowedToDestroySawGenCoreWhenLaRocheStunned)
    {
        // End:0x97
        if(!bWasSawGenEnabledAtStartOfSM)
        {
            VsLarochePawn.EnableCoreById(5, false);
        }
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.ResetRotationRate();
    //return;    
}

function ProccesGrabLocationForEndOfSM()
{
    local /*0x97E50000-0x00000000*/ private @NULL VsLarochePawn[8388609];

    // End:0xFD
    if(VsLarochePawn != none)
    {
        VsLarochePawn.SetGrabPointEnabledByIndex(7, false);
        VsLarochePawn.SetGrabPointEnabledByIndex(8, false);
        VsLarochePawn.SetGrabPointEnabledByIndex(9, false);
        VsLarochePawn.SetGrabPointEnabledByIndex(11, false);
        VsLarochePawn.SetGrabPointEnabledByIndex(12, false);
        VsLarochePawn.SetGrabPointEnabledByIndex(6, false);
        VsLarochePawn.SetGrabPointEnabledByIndex(13, false);
    }
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}