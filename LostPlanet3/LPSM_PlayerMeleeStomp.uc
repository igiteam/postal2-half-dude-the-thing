class LPSM_PlayerMeleeStomp extends LPSM_PlayerMeleeAttack
    config(Game);

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor, PlayerPawn;

    super.PrepSpecialMove(PrevMove, InteractionActor);
    // End:0xA1
    if(int(MySPPawn.Role) == int(ROLE_Authority))
    {
        PlayerPawn = LPPlayerPawn(MySPPawn);
        // End:0xA1
        if(PlayerPawn != none)
        {
            PlayerPawn.SetupMeleeTakedown(LPPlayerPawn(InteractionActor));
        }
    }
    //return;    
}

function SetUpChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], InteractionPawn, PawnLocation, Destination, DestinationRot, ExtractedTrans,
	    ExtractedRot;

    InteractionPawn = LPPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    // End:0x24E
    if(InteractionPawn != none)
    {
        Class'SPEngine.SPUtil'.static.GetAnimationExtractionDeltas(SeqNode.AnimSeq, MySPPawn.Mesh, 0.0000000, SeqNode.AnimSeq.SequenceLength, ExtractedTrans, ExtractedRot);
        PawnLocation = InteractionPawn.Mesh.GetBoneLocation(InteractionPawn.BaseBoneName());
        Destination = Normal(PawnLocation - MySPPawn.Location);
        Destination.Z = 0.0000000;
        DestinationRot = Rotator(Destination);
        Destination = PawnLocation - (Destination * (VSize(ExtractedTrans) + float(150)));
        MySPPawn.RegisterDestinationAndOrientation(SeqNode, Destination, DestinationRot, 0.0000000, 0.5000000, true, false, true);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySPPawn.StopPawnChoreography();
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.StopFullBodyAnim(0.0000000);
    // End:0x12B
    if(MySPPawn.IsLocallyControlled() && LPPlayerController(MySPPawn.Controller) != none)
    {
        LPPlayerController(MySPPawn.Controller).ClearAnimatedCamera();
        LPPlayerController(MySPPawn.Controller).SetDefaultCam();
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}