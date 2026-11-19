class LPSM_DefenderVsLandOn extends LPSM_DefenderVsBase
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

    vsPawn = LPBaseVSPlayerPawn(DefenderPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0x68
    if(vsPawn == none)
    {
        return;
    }
    DefenderPawn.SetPhysics(4);
    AttackSockets = vsPawn.TuneDataVSPlayerPawn.DefenderAttackSlotSockets[DefenderPawn.LandOnVsAttackSlotSocketIdx];
    vsPawn.Mesh.GetSocketWorldLocationAndRotation(AttackSockets.EndSocketName, SocketLocation, SocketRotation);
    DefenderPawn.RegisterDestinationAndOrientation(SeqNode, SocketLocation, SocketRotation, 0.0000000, SeqNode.AnimSeq.SequenceLength, false, false);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    DefenderPawn.CancelDestinationRegistration();
    super.SpecialMoveEnded(PrevMove, NextMove);
    vsPawn = none;
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SocketLocation, SocketRotation;

    vsPawn.Mesh.GetSocketWorldLocationAndRotation(AttackSockets.EndSocketName, SocketLocation, SocketRotation);
    DefenderPawn.RegisterDestinationInfo.RegistrationLocation = SocketLocation;
    DefenderPawn.RegisterDestinationInfo.RegistrationOrientation = QuatFromRotator(SocketRotation);
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bManageRootMotionMode=true
    AnimationTemplateNodeNames=/* Array type was not detected. */
}