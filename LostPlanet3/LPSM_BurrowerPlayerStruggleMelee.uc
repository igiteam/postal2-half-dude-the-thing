class LPSM_BurrowerPlayerStruggleMelee extends LPSM_FollowerStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPAIPawnBurrower(inPawn).TuneDataStruggleMelee;
    super.InitSpecialMove(inPawn, InHandle);
    //return;    
}

defaultproperties
{
    TuneDataClass=Class'LPTuneDataStrugglePlayerBurrowerMelee'
}