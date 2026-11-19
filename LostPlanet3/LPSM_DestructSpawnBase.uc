class LPSM_DestructSpawnBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PawnPhysics;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    PawnPhysics = MySPPawn.Physics;
    SPAIController(MySPPawn.Controller).ForceDisableAI();
    MySPPawn.SetPhysics(4);
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    SPAIController(MySPPawn.Controller).ForceEnableAI();
    MySPPawn.SetPhysics(PawnPhysics);
    //return;    
}

function PickAnimTemplateToReplicate()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ReplicatedAnimSeqs[25165826];

    out_ReplicatedAnimSeqs[0] = GetBestSequenceTemplateByIndex(0);
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    RootMotionMode=ERootMotionMode.RMM_Translate
    bManageRootMotionMode=true
    bDisableCollision=true
}