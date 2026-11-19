class LPSM_VsLaRocheWinchedStun extends LPSM_VsLarocheDefaultStandingStun
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.ZeroMovementVariables();
    //return;    
}

function ProccesGrabLocationForStartOfSM()
{
    local /*0x97E50000-0x00000000*/ private @NULL VsLarochePawn[8388609];

    //return;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    return MySPPawn.HitReactLogicAnimTree;
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySPPawn.ZeroMovementVariables();
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function ProccesGrabLocationForEndOfSM()
{
    local /*0x97E50000-0x00000000*/ private @NULL VsLarochePawn[8388609];

    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}