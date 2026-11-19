class LPSM_ForkArmGrabVictim_HoldFIXED extends LPSM_ForkArmGrabVictim_Hold
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super(LPSM_ForkArmGrabVictim_Base).SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}
