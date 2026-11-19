class LPSM_AIBasePlayFullBodyAnimSeq extends SPSM_PlayAnimBase
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000400*/ private editfixedsize export array LoopNotifySounds[524289];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseManualChoreography;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bManualChoreographyAffectsRotation;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float ManualChoreographySeparationDistance;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function @NULL SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, OtherPlayerPawn, LoopSound;

    OtherPlayerPawn = LPBasePlayerPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    // End:0x97
    if(OtherPlayerPawn != none)
    {
        OtherPlayerPawn.RemoveActiveCombatWindows(LPPawn(MySPPawn));
    }
    // End:0xC3
    if(bUseManualChoreography)
    {
        MySPPawn.StopPawnChoreography();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0x196
    if(int(MySPPawn.Mesh.RootMotionMode) != int(2))
    {
        // End:0x196
        if(bManageRootMotionMode)
        {
            MySPPawn.Mesh.RootMotionMode = 2;
            MySPPawn.Mesh.RootMotionRotationMode = 0;
        }
    }
    // End:0x1F4
    if(!Class'Engine.Engine'.static.GetEngine().bDisableAILogging && MySPPawn.IsInPawnChoreography())
    {
    }
    // End:0x244
    foreach LoopNotifySounds(LoopSound)
    {
        // End:0x243
        if(LoopSound != none)
        {
            LoopSound.FadeOut(0.5000000, 0.0000000);
        }        
    }    
    LoopNotifySounds.Remove(0, LoopNotifySounds.Length);    
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], MyLPPawn, OtherPlayerPawn;
    local /*0x97E50000-0x00000000*/ private int I;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NotifyArray;
    local /*0x97E50000-0x00000000*/ private @NULL NotifySound;

    MyLPPawn = LPPawn(MySPPawn);
    OtherPlayerPawn = LPBasePlayerPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    // End:0xC4
    if((OtherPlayerPawn != none) && MyLPPawn != none)
    {
        MyLPPawn.PublishCombatWindowsFromAnimation(SeqNode, OtherPlayerPawn);
    }
    // End:0x211
    if((SeqNode != none) && SeqNode.AnimSeq != none)
    {
        SeqNode.AnimSeq.GetNotifies(Class'LPAnimNotify_Sound', NotifyArray);
        I = 0;
        J0x14A:

        // End:0x211 [Loop If]
        if(I < NotifyArray.Length)
        {
            NotifySound = LPAnimNotify_Sound(NotifyArray[I].Notify);
            // End:0x203
            if((NotifySound != none) && NotifySound.bMarkAsLoopSound)
            {
                LoopNotifySounds.AddItem(NotifySound.PlaySound(SeqNode));                
            }
            ++I;
            // [Loop Continue]
            goto J0x14A;
        }
    }
    // End:0x231
    if(bUseManualChoreography)
    {
        SetupManualChoreography(SeqNode);
    }
    super.AnimationStartedPlaying(SeqNode);
    //return;    
}

function SetupManualChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], Params;

    Params.MySequence = SeqNode;
    Params.OtherTargetSequence = none;
    Params.OtherTarget = MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor;
    Params.BlendTime = -1.0000000;
    Params.AlignmentType = 1;
    Params.RotationMode = ((bManualChoreographyAffectsRotation) ? 1 : 2);
    Params.ManualYawDeltaFromCenterline = 0;
    Params.ManualTargetDeltaFromCenterline = -32768;
    Params.bOverrideTranslationOffset = true;
    Params.OtherTargetMovePercent = 0.0000000;
    // End:0x26E
    if(LPPawn(Params.OtherTarget) != none)
    {
        Params.OverridenDesiredTranslationOffset = (MySPPawn.CylinderComponent.CollisionRadius + LPPawn(Params.OtherTarget).CylinderComponent.CollisionRadius) + ManualChoreographySeparationDistance;
    }
    Params.TooCloseTranslationTolerance = Params.OverridenDesiredTranslationOffset;
    Params.TooFarTranslationTolerance = 0.0000000;
    OverrideManualChoreographyParams(Params);
    MySPPawn.StartPawnChoreography(Params);
    //return;    
}

function OverrideManualChoreographyParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL InParams[25165825];

    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bManageRootMotionMode=true
}