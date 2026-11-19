class LPSM_CoverRollRight extends LPSM_PlayerRollRight
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super(LPSM_PlayerRollBase).InitSpecialMove(inPawn, InHandle);
    SetRootMotionScale(1.0000000, 1.0000000, 1.0000000);
    //return;    
}
