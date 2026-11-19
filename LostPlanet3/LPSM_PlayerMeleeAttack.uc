class LPSM_PlayerMeleeAttack extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TooFarTranslationTolerance;

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], P;

    P = LPPlayerPawn(MySPPawn);
    // End:0x4A
    if(P != none)
    {
        return P.PlayerMeleeAnimTree;
    }
    return super.GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor;

    // End:0x5F
    if(MySPPawn.IsLocallyControlled())
    {
        SPPlayerController(MySPPawn.Controller).PauseFire();
    }
    super(SPSpecialMoveStateBased).PrepSpecialMove(PrevMove, InteractionActor);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], TheLPPawn, LPPC;

    bIgnorePlayerMoveInput = true;
    super.SpecialMoveStarted(bForced, PrevMove);
    TheLPPawn = LPPawn(MySPPawn);
    // End:0x73
    if(TheLPPawn != none)
    {
        TheLPPawn.NotifyMeleeAnimStarted();
    }
    // End:0xF5
    if(MySPPawn.IsLocallyControlled())
    {
        LPPC = LPPlayerController(MySPPawn.Controller);
        // End:0xF5
        if(LPPC != none)
        {
            LPPC.AllowAimDownSight(false);
        }
    }
    //return;    
}

function NotifyEnablePlayerMovement()
{
    bIgnorePlayerMoveInput = false;
    super(SPSpecialMove).NotifyEnablePlayerMovement();
    //return;    
}

event WantsToStopSMOnNotifyEnablePlayerMovement()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x40
    if(int(MySPPawn.WorldInfo.NetMode) != int(NM_Standalone))
    {
        return true;
    }
    return super(SPSpecialMove).WantsToStopSMOnNotifyEnablePlayerMovement();
    //return ReturnValue;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609];

    super.AnimationStartedPlaying(SeqNode);
    // End:0x44
    if(SeqNode == none)
    {
        MySPPawn.EndCurrentSpecialMove(self);
        return;
    }
    SetUpChoreography(SeqNode);
    //return;    
}

function SetUpChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, InteractionPawn, PlayerPawn, ExtractedTrans, ExtractedRot;

    PlayerPawn = LPPlayerPawn(MySPPawn);
    InteractionPawn = LPPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    // End:0x3FB
    if(InteractionPawn != none)
    {
        Class'SPEngine.SPUtil'.static.GetAnimationExtractionDeltas(SeqNode.AnimSeq, PlayerPawn.Mesh, 0.0000000, SeqNode.AnimSeq.SequenceLength, ExtractedTrans, ExtractedRot);
        ChoreographyParams.AlignmentType = 1;
        ChoreographyParams.ManualYawDeltaFromCenterline = 0;
        ChoreographyParams.ManualTargetDeltaFromCenterline = -32768;
        ChoreographyParams.OverridenDesiredTranslationOffset = VSize(ExtractedTrans) + InteractionPawn.CylinderComponent.CollisionRadius;
        ChoreographyParams.OtherTarget = InteractionPawn;
        ChoreographyParams.MySequence = SeqNode;
        ChoreographyParams.OtherTargetSequence = none;
        ChoreographyParams.BlendTime = PlayerPawn.TuneDataPlayerPawn.MeleeChoreographyBlendTime;
        ChoreographyParams.bMyIgnoreAllBlockActorsDuringMove = false;
        ChoreographyParams.bOtherIgnoreAllBlockActorsDuringMove = false;
        ChoreographyParams.OtherTargetMovePercent = 0.0000000;
        ChoreographyParams.RotationMode = 1;
        ChoreographyParams.bOverrideTranslationOffset = false;
        ChoreographyParams.TooCloseTranslationTolerance = 10000.0000000;
        ChoreographyParams.TooFarTranslationTolerance = TooFarTranslationTolerance;
        ChoreographyParams.AutoShutoffTime = PlayerPawn.TuneDataPlayerPawn.MeleeChoreographyShutoffTime;
        MySPPawn.StartPawnChoreography(ChoreographyParams);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, LPP;

    super.SpecialMoveEnded(PrevMove, NextMove);
    MySPPawn.StopPawnChoreography();
    UnpauseAnims();
    LPP = LPPlayerPawn(MySPPawn);
    // End:0x90
    if(LPP != none)
    {
        LPP.MeleeTakedownActor = none;
    }
    // End:0x11B
    if(MySPPawn.IsLocallyControlled())
    {
        LPP.SavedController.AllowAimDownSight();
        LPP.SavedController.UnPauseFire();
    }
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float PauseDuration, LastFrameTime;

    switch(MessageName)
    {
        // End:0x18A
        case Class'LPSMMTypes'.default.SMM_PlayerMeleeHitPawn:
            // End:0x188
            if(!MySPPawn.Mesh.bPauseAnims)
            {
                PauseDuration = LPPlayerPawn(MySPPawn).TuneDataPlayerPawn.PauseAnimationDurationOnMeleeContact;
                // End:0x188
                if(PauseDuration > float(0))
                {
                    LastFrameTime = MySPPawn.WorldInfo.DeltaSeconds;
                    LastFrameTime = FMin(LastFrameTime, 0.0666000);
                    MySPPawn.Mesh.bPauseAnims = true;
                    MySPPawn.SetTimer(PauseDuration + LastFrameTime, false, 'UnpauseAnims', self);
                }
            }
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function UnpauseAnims()
{
    MySPPawn.ClearTimer('UnpauseAnims', self);
    MySPPawn.Mesh.bPauseAnims = false;
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    BlendInTime=0.1000000
    bManageRootMotionMode=true
    bIgnorePlayerMoveInput=true
}