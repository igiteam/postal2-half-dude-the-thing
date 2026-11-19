class LPSM_ForkArmGrabMiss extends SPSM_PlayAnimBase
    config(Game);

function CanOverrideSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private class InMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x19
    if(InMove == Class'LPSM_PlayerVSDrillArmSwingTwoHandBash')
    {
        return false;
    }
    return super(SPSpecialMove).CanOverrideSpecialMove(InMove);
    //return ReturnValue;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x80
    if(((MySPPawn != none) && LPVSPlayerPawn(MySPPawn) != none) && LPVSPlayerPawn(MySPPawn).ForkArmGrabAnimTree != none)
    {
        return LPVSPlayerPawn(MySPPawn).ForkArmGrabAnimTree;
    }
    return super.GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPVSPlayer;

    super.SpecialMoveEnded(PrevMove, NextMove);
    LPVSPlayer = LPVSPlayerPawn(MySPPawn);
    // End:0x67
    if(LPVSPlayer != none)
    {
        LPVSPlayer.SetVSReticleGrabState(false);
    }
    //return;    
}

defaultproperties
{
    PlaybackType=SPSM_PlayAnimType.SPSM_PlayAnimUpperBody
    AnimationTemplateNodeNames=/* Array type was not detected. */
    CanOverrideBaseClasses=/* Array type was not detected. */
    CanBeOverridenByClasses=/* Array type was not detected. */
}