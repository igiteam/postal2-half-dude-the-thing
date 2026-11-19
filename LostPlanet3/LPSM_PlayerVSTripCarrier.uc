class LPSM_PlayerVSTripCarrier extends SPSM_PlayAnimBase
    config(Game);

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPVSPlayerPawn(MySPPawn).VSWinchAnimTree;
    //return ReturnValue;    
}

defaultproperties
{
    BlendInTime=0.1000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
}