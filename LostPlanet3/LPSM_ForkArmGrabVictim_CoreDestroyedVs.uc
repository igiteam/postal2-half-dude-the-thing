class LPSM_ForkArmGrabVictim_CoreDestroyedVs extends LPSM_ForkArmGrabVictim_CoreDestroyed
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnVsLaroche;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(LPSM_ForkArmGrabVictim_Base).SpecialMoveStarted(bForced, PrevMove);
    PawnVsLaroche = LPAIPawnVsLaroche(MySPPawn);
    // End:0xE9
    if((PawnVsLaroche != none) && PawnVsLaroche.CurrentStruggleModeCoreTagForFlagForDestroyOnAnimNotify != none)
    {
        PawnVsLaroche.TurnOnCoreFlagsForDestroyOnAnimNotify(PawnVsLaroche.CurrentStruggleModeCoreTagForFlagForDestroyOnAnimNotify, PawnVsLaroche.bCurrentStruggleModeFlagCoreGibForDestroyOnAnimNotify, PawnVsLaroche.bCurrentStruggleModeFlagCoreDamageActionForDestroyOnAnimNotify);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, oldLeaderPawn;

    oldLeaderPawn = LeaderPawn;
    // End:0x125
    if((PawnVsLaroche != none) && PawnVsLaroche.CurrentStruggleModeCoreTagForFlagForDestroyOnAnimNotify != none)
    {
        PawnVsLaroche.TurnOffCoreFlagsForDestroyOnAnimNotify(PawnVsLaroche.CurrentStruggleModeCoreTagForFlagForDestroyOnAnimNotify, PawnVsLaroche.bCurrentStruggleModeFlagCoreGibForDestroyOnAnimNotify, PawnVsLaroche.bCurrentStruggleModeFlagCoreDamageActionForDestroyOnAnimNotify);
        PawnVsLaroche.CurrentStruggleModeCoreTagForFlagForDestroyOnAnimNotify = none;
        PawnVsLaroche.bCurrentStruggleModeFlagCoreGibForDestroyOnAnimNotify = false;
        PawnVsLaroche.bCurrentStruggleModeFlagCoreDamageActionForDestroyOnAnimNotify = false;
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x1B3
    if(PawnVsLaroche != none)
    {
        // End:0x1B3
        if(PawnVsLaroche.MyVsLarocheController != none)
        {
            PawnVsLaroche.MyVsLarocheController.NotifyJustReleasedFromGrapple(self, oldLeaderPawn, false);
        }
    }
    //return;    
}
