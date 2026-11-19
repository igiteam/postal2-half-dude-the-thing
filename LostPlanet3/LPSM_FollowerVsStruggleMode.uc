class LPSM_FollowerVsStruggleMode extends LPSM_FollowerStruggleMode
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VsPlayerLeaderPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PawnVsLaroche;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneDataStruggleVsPlayerBase;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    VsPlayerLeaderPawn = LPVSPlayerPawn(LeaderPawn);
    PawnVsLaroche = LPAIPawnVsLaroche(MySPPawn);
    TuneDataStruggleVsPlayerBase = LPTuneDataStruggleVsPlayerBase(TuneData);
    // End:0x132
    if(((PawnVsLaroche != none) && TuneDataStruggleVsPlayerBase != none) && TuneDataStruggleVsPlayerBase.CoreTagForFlagForDestroyOnAnimNotify != none)
    {
        PawnVsLaroche.TurnOnCoreFlagsForDestroyOnAnimNotify(TuneDataStruggleVsPlayerBase.CoreTagForFlagForDestroyOnAnimNotify, TuneDataStruggleVsPlayerBase.bFlagCoreGibForDestroyOnAnimNotify, TuneDataStruggleVsPlayerBase.bFlagCoreDamageActionForDestroyOnAnimNotify);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    VsPlayerLeaderPawn = none;
    MySPPawn.bBlockActors = true;
    // End:0x1A8
    if(((PawnVsLaroche != none) && TuneDataStruggleVsPlayerBase != none) && TuneDataStruggleVsPlayerBase.CoreTagForFlagForDestroyOnAnimNotify != none)
    {
        PawnVsLaroche.TurnOffCoreFlagsForDestroyOnAnimNotify(TuneDataStruggleVsPlayerBase.CoreTagForFlagForDestroyOnAnimNotify, TuneDataStruggleVsPlayerBase.bFlagCoreGibForDestroyOnAnimNotify, TuneDataStruggleVsPlayerBase.bFlagCoreDamageActionForDestroyOnAnimNotify);
        PawnVsLaroche.CurrentStruggleModeCoreTagForFlagForDestroyOnAnimNotify = TuneDataStruggleVsPlayerBase.CoreTagForFlagForDestroyOnAnimNotify;
        PawnVsLaroche.bCurrentStruggleModeFlagCoreGibForDestroyOnAnimNotify = TuneDataStruggleVsPlayerBase.bFlagCoreGibForDestroyOnAnimNotify;
        PawnVsLaroche.bCurrentStruggleModeFlagCoreDamageActionForDestroyOnAnimNotify = TuneDataStruggleVsPlayerBase.bFlagCoreDamageActionForDestroyOnAnimNotify;
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super.Tick(DeltaTime);
    // End:0xC4
    if(TimeStampPlayerDead > 0.0000000)
    {
        // End:0xC4
        if((MySPPawn.WorldInfo.TimeSeconds - TimeStampPlayerDead) >= MaxTimeAfterDead)
        {
            // End:0xA4
            if(VsPlayerLeaderPawn != none)
            {
                VsPlayerLeaderPawn.OnPlayRagDollDeath();                
            }
            else
            {
                MySPPawn.EndCurrentSpecialMove(self);
            }
        }
    }
    //return;    
}

defaultproperties
{
    bCollideWorld=true
}