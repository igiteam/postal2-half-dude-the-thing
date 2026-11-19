class LPSM_VSPlayerEnterExitBase extends SPSM_FollowerPawnBase
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL SavedRotation;

function ShouldReplicate()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return false;
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    SavedRotation = MySPPawn.Rotation;
    LPBaseVSPlayerPawn(MySPPawn).SetMeshLodForOutsideCockpit();
    //return;    
}

function StartInteraction()
{
    super(SPSM_LeaderFollowerBase).StartInteraction();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySPPawn.bBlockActors = true;
    StopAnimationChoreography(MySPPawn);
    MySPPawn.SetRotation(SavedRotation);
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}