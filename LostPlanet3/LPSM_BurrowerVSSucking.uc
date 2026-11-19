class LPSM_BurrowerVSSucking extends LPSM_BurrowerVS
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private export @NULL SoundComponentLoop[524289];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    PlaySoundEvent('BurrowerSuckingTEng');
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    ClearSoundLoop();
    //return;    
}

function PlaySoundEvent()
{
    local /*0x97E50000-0x00000000*/ private name SoundEventName[8388609];

    // End:0x19
    if(SoundComponentLoop != none)
    {
        ClearSoundLoop();
    }
    SoundComponentLoop = MySPPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocallyEx(SoundEventName, 'None', MySPPawn, none, none, SoundComponentLoop);
    //return;    
}

function ClearSoundLoop()
{
    // End:0x43
    if(SoundComponentLoop != none)
    {
        SoundComponentLoop.FadeOut(0.5000000, 0.0000000);
        SoundComponentLoop = none;
    }
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}