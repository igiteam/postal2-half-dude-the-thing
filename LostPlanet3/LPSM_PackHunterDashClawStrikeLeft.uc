class LPSM_PackHunterDashClawStrikeLeft extends LPSM_PackHunterMovingStrikeBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super(SPSM_PlayAnimBase).SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SPSMAnimationFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    super(SPSM_PlayAnimBase).SPSMAnimationFinishedCB(Node, InUserData, bInterrupted);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    bDoesThisSmExpectChoreographyToBeStillOnFromPreviousSm=true
    BlendInTime=0.1000000
    BlendOutTime=0.1000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
}