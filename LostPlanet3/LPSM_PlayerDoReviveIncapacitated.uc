class LPSM_PlayerDoReviveIncapacitated extends LPSM_BaseChoreography
    config(Game);

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor, LPP;

    super(SPSpecialMoveStateBased).PrepSpecialMove(PrevMove, InteractionActor);
    LPP = LPPlayerPawn(MySPPawn);
    // End:0x8D
    if(!MySPPawn.IsLocallyControlled())
    {
        LPP.IncapacitatedRevivalTarget = LPPlayerPawn(InteractionActor);
    }
    LPP.StartReviveScreenEffects();
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x2E
    if(MessageName == Class'LPSMMTypes'.default.SMM_MeleeTakedownAllowed)
    {
        return true;
    }
    return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPP;

    LPP = LPPlayerPawn(MySPPawn);
    LPP.StopReviveScreenEffects();
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function StartPawnChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL Params[8388609];

    Params.RotationMode = 2;
    super.StartPawnChoreography(Params);
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowAdditiveHitReaction=true
    bAllowRotationInterpolation=true
}