class LPSM_URRestartByPlayerStruggle extends LPSM_FollowerVsStruggleMode
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    TuneData = LPVSPlayerPawn(inPawn).TuneDataStrugglePlayerRestartTheUR;
    super(LPSM_FollowerStruggleMode).InitSpecialMove(inPawn, InHandle);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], StruggleAnimTree;

    StruggleAnimTree = LPBasePlayerPawn(MySPPawn).GetAnimTemplateTreeForStruggleMode();
    // End:0x4B
    if(StruggleAnimTree != none)
    {
        return StruggleAnimTree;
    }
    return super(SPSpecialMove).GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

defaultproperties
{
    TuneDataClass=Class'LPTuneDataStrugglePlayerRestartTheUR'
}