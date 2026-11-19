class LPSM_PlayerVSWinchClose extends LPSM_PlayerVSWinchFireBase
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    BlendInTime=0.0800000
    BlendOutTime=-1.0000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
}