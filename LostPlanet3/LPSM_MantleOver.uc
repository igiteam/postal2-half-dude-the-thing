class LPSM_MantleOver extends SPGFSM_MantleOver
    config(Pawn);

function GetLeaveCoverPlayRate()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    // End:0x1F
    if(LPAIPawnHumanSoldier(GetCoverPawn()) != none)
    {
        return 1.0000000;
    }
    return super(SPGFSM_LeaveCoverBase).GetLeaveCoverPlayRate();
    //return ReturnValue;    
}
