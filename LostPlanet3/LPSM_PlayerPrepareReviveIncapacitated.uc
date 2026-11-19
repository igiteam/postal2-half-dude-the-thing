class LPSM_PlayerPrepareReviveIncapacitated extends LPSM_BaseChoreography
    config(Game);

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor, LPP;

    super(SPSpecialMoveStateBased).PrepSpecialMove(PrevMove, InteractionActor);
    // End:0x8D
    if(!MySPPawn.IsLocallyControlled())
    {
        LPP = LPPlayerPawn(MySPPawn);
        LPP.IncapacitatedRevivalTarget = LPPlayerPawn(InteractionActor);
    }
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
    PlayBackRate=2.0000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
    bAllowRotationInterpolation=true
}