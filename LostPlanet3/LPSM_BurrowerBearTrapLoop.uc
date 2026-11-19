class LPSM_BurrowerBearTrapLoop extends LPSM_AIBasePlayFullBodyAnimSeq
    config(Game);

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, BurrowerPawn;

    super.SpecialMoveEnded(PrevMove, NextMove);
    BurrowerPawn = LPAIPawnBurrower(MySPPawn);
    BurrowerPawn.SetLocation(BurrowerPawn.SpecialMoveState.CurSMInfo.InteractionActor.Location);
    // End:0x115
    if(BurrowerPawn.Mesh.HiddenGame)
    {
        BurrowerPawn.Mesh.SetHidden(false);
    }
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL BurrowerPawn;

    BurrowerPawn = LPAIPawnBurrower(MySPPawn);
    // End:0xF2
    if(!BurrowerPawn.Mesh.HiddenGame && LPPawn(BurrowerPawn.SpecialMoveState.CurSMInfo.InteractionActor).InStruggleMode)
    {
        BurrowerPawn.Mesh.SetHidden(true);
    }
    //return;    
}

defaultproperties
{
    bShouldLoop=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}