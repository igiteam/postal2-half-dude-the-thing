class LPSM_PlayerPrepareThermalPostDeployment extends LPSM_BaseChoreography
    config(Game);

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PRI;

    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    PlayBackRate = 1.0000000;
    PRI = LPPRI(inPawn.PlayerReplicationInfo);
    // End:0x97
    if(PRI != none)
    {
        PlayBackRate *= PRI.GetReplicatedPerkDeployRate(18);
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}