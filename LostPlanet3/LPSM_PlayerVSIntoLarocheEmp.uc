class LPSM_PlayerVSIntoLarocheEmp extends SPSM_PlayAnimBase
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MySPPawn.ZeroMovementVariables();
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return LPVSPlayerPawn(MySPPawn).VSWinchAnimTree;
    //return ReturnValue;    
}

defaultproperties
{
    bManageRootMotionMode=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}