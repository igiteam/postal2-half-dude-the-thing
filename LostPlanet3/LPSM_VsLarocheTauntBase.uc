class LPSM_VsLarocheTauntBase extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVsLaPawn[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MyVsLaPawn = LPAIPawnVsLaroche(MySPPawn);
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MyVsLaPawn = none;
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}