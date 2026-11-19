class LPSM_PlayerPickUpGeneric extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPickedUpItem[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name SoundEventName;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private name FXEventName;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], PlayerCtrl;

    PlayerCtrl = LPPlayerController(MySPPawn.Controller);
    // End:0x63
    if(PlayerCtrl != none)
    {
        PlayerCtrl.GotoState('PlayerBusy');
    }
    bPickedUpItem = false;
    MySPPawn.SetTimer(4.0000000, false, 'MissingNotify', self);
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, PlayerCtrl;

    PlayerCtrl = LPPlayerController(MySPPawn.Controller);
    // End:0x89
    if((PlayerCtrl != none) && !PlayerCtrl.GamePlayEndedState())
    {
        PlayerCtrl.GotoState('PlayerWalking');
    }
    MySPPawn.ClearTimer('MissingNotify', self);
    MySPPawn.StopPawnChoreography();
    // End:0xEA
    if(!bPickedUpItem)
    {
        AnimNotifySpecialMove();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function DoesUseChoreography()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams;

    super.AnimationStartedPlaying(SeqNode);
    // End:0x44
    if(SeqNode == none)
    {
        MySPPawn.EndCurrentSpecialMove(self);
        return;
    }
    // End:0xA1
    if((MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor == none) || !DoesUseChoreography())
    {
        return;
    }
    ChoreographyParams.AlignmentType = 1;
    ChoreographyParams.ManualYawDeltaFromCenterline = 0;
    ChoreographyParams.ManualTargetDeltaFromCenterline = -32768;
    ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
    ChoreographyParams.OtherTarget = MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor;
    ChoreographyParams.MySequence = SeqNode;
    ChoreographyParams.OtherTargetSequence = none;
    ChoreographyParams.BlendTime = 0.4000000;
    ChoreographyParams.bMyIgnoreAllBlockActorsDuringMove = false;
    ChoreographyParams.bOtherIgnoreAllBlockActorsDuringMove = false;
    ChoreographyParams.OtherTargetMovePercent = 0.0000000;
    ChoreographyParams.RotationMode = 1;
    ChoreographyParams.bOverrideTranslationOffset = false;
    ChoreographyParams.TooCloseTranslationTolerance = 10000.0000000;
    ChoreographyParams.TooFarTranslationTolerance = 10000.0000000;
    ChoreographyParams.AutoShutoffTime = 0.4000000;
    MySPPawn.StartPawnChoreography(ChoreographyParams);
    //return;    
}

event AnimNotifySpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pickup;

    bPickedUpItem = true;
    Pickup = LPCustomizablePickupFactory(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0x9A
    if(Pickup != none)
    {
        Pickup.PickedUpItem(MySPPawn);
    }
    // End:0x103
    if(SoundEventName != 'None')
    {
        MySPPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally(SoundEventName, 'None', MySPPawn, none, none);
    }
    // End:0x17F
    if(FXEventName != 'None')
    {
        MySPPawn.TuneDataPawnFXEventBindings.PlayEventFX(FXEventName, MySPPawn, MySPPawn.Mesh, none);
    }
    //return;    
}

function MissingNotify()
{
    AnimNotifySpecialMove();
    MySPPawn.EndCurrentSpecialMove(self);
    //return;    
}

defaultproperties
{
    AnimTemplateTree=AnimTree'PlayerMoveAnimTemplate.PlayerPickUpAnimations'
    AnimationTemplateNodeNames=/* Array type was not detected. */
}