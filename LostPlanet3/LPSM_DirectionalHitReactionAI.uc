class LPSM_DirectionalHitReactionAI extends LPSM_DirectionalHitReaction
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bWantsChoreographyOnVSMelee;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bIsUsingChoreographyOnVSMelee;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    bIsUsingChoreographyOnVSMelee = false;
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x2C
    if(bIsUsingChoreographyOnVSMelee)
    {
        MySPPawn.StopPawnChoreography();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609];

    // End:0x49
    if(DamagedByPawn != none)
    {
        LPPawn(MySPPawn).PublishCombatWindowsFromAnimation(SeqNode, DamagedByPawn);
    }
    super.AnimationStartedPlaying(SeqNode);
    // End:0xBE
    if(bWantsChoreographyOnVSMelee && class<LPDamageTypeVSMelee>(MySPPawn.TakeDamageParams.DamageType) != none)
    {
        StartVSMeleeChoreography(SeqNode);
    }
    //return;    
}

function ShouldReplicate()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function StartVSMeleeChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], VSMeleeReactionChoreographyParams, myAIPawn;

    // End:0x11
    if(DamagedByPawn == none)
    {
        return;
    }
    myAIPawn = LPAIPawn(MySPPawn);
    VSMeleeReactionChoreographyParams.MySequence = SeqNode;
    VSMeleeReactionChoreographyParams.OtherTargetSequence = none;
    VSMeleeReactionChoreographyParams.OtherTarget = DamagedByPawn;
    VSMeleeReactionChoreographyParams.BlendTime = 0.2500000;
    VSMeleeReactionChoreographyParams.AlignmentType = 1;
    VSMeleeReactionChoreographyParams.RotationMode = 2;
    VSMeleeReactionChoreographyParams.ManualYawDeltaFromCenterline = 0;
    VSMeleeReactionChoreographyParams.ManualTargetDeltaFromCenterline = -32768;
    VSMeleeReactionChoreographyParams.bOverrideTranslationOffset = true;
    VSMeleeReactionChoreographyParams.OverridenDesiredTranslationOffset = (MySPPawn.CylinderComponent.CollisionRadius + DamagedByPawn.CylinderComponent.CollisionRadius) + myAIPawn.TuneDataAIPawn.VSMeleeHitReactionSeparationDistance;
    VSMeleeReactionChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
    VSMeleeReactionChoreographyParams.TooFarTranslationTolerance = 10000.0000000;
    OverrideVSMeleeChoreographyParams(VSMeleeReactionChoreographyParams);
    bIsUsingChoreographyOnVSMelee = true;
    MySPPawn.StartPawnChoreography(VSMeleeReactionChoreographyParams);
    //return;    
}

function OverrideVSMeleeChoreographyParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL VSMeleeReactionChoreographyParams[25165825];

    //return;    
}

defaultproperties
{
    bWantsChoreographyOnVSMelee=true
    bManageRootMotionMode=true
}