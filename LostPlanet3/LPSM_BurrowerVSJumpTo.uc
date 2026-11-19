class LPSM_BurrowerVSJumpTo extends LPSM_BurrowerVS
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL AttackSockets;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL vsPawn;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], SocketLocation, SocketRotation;

    vsPawn = LPVSPlayerPawn(BurrowerPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0x68
    if(vsPawn == none)
    {
        return;
    }
    BurrowerPawn.SetPhysics(4);
    AttackSockets = vsPawn.TuneDataVSPlayerPawn.AttackSlotSockets[BurrowerPawn.AttackSlotSocketIdx];
    vsPawn.Mesh.GetSocketWorldLocationAndRotation(AttackSockets.EndSocketName, SocketLocation, SocketRotation);
    BurrowerPawn.RegisterDestinationAndOrientation(SeqNode, SocketLocation, SocketRotation, 0.0000000, SeqNode.AnimSeq.SequenceLength, false, false);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x89
    if(((BurrowerPawn != none) && !BurrowerPawn.bDeleteMe) && !BurrowerPawn.IsInState('Dying'))
    {
        AttachToVS();
        BurrowerPawn.CancelDestinationRegistration();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    vsPawn = none;
    //return;    
}

function AttachToVS()
{
    BurrowerPawn.SetHardAttach(false);
    BurrowerPawn.SetBase(none);
    BurrowerPawn.SetCollisionType(1);
    BurrowerPawn.SetCollisionType(3);
    BurrowerPawn.SetHardAttach(true);
    BurrowerPawn.SetBase(vsPawn,, vsPawn.Mesh, AttackSockets.EndSocketName);
    BurrowerPawn.bApplyRagdollImpulse = false;
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SocketLocation, SocketRotation;

    vsPawn.Mesh.GetSocketWorldLocationAndRotation(AttackSockets.EndSocketName, SocketLocation, SocketRotation);
    BurrowerPawn.RegisterDestinationInfo.RegistrationLocation = SocketLocation;
    BurrowerPawn.RegisterDestinationInfo.RegistrationOrientation = QuatFromRotator(SocketRotation);
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}