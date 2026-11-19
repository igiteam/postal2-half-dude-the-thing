class LPSM_VSWaitEntryEnd extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyController;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MyController = LPPlayerController(MySPPawn.Controller);
    // End:0x86
    if((MyController != none) && MyController.IsLocalPlayerController())
    {
        MyController.DisableInput(false, true, false);
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x71
    if((MyController != none) && MyController.IsLocalPlayerController())
    {
        MyController.EnableInput(true, true, true);
    }
    //return;    
}

function GetDesiredAnimIndex()
{
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689];

    // End:0x66
    if((int(MySPPawn.WorldInfo.NetMode) != int(NM_Standalone)) && MySPPawn.Controller != none)
    {
        return 1;
    }
    return 0;
    //return ReturnValue;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bOverride=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}