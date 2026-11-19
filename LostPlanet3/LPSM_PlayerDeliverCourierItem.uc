class LPSM_PlayerDeliverCourierItem extends LPSM_PlayerPickUpGeneric
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ChoreographyParams;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDeliveredItem;

event AnimNotifySpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Deliverable;

    Deliverable = LPCourierItem(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0xA3
    if(!bPickedUpItem)
    {
        bPickedUpItem = true;
        // End:0xA0
        if(Deliverable != none)
        {
            Deliverable.AttachToDeliverLocation();
        }        
    }
    else
    {
        // End:0xEE
        if(!bDeliveredItem)
        {
            bDeliveredItem = true;
            // End:0xEE
            if(Deliverable != none)
            {
                Deliverable.Deliver(true);
            }
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    MySPPawn.ClearTimer('MissingNotify', self);
    MySPPawn.StopPawnChoreography();
    // End:0xEA
    if(LPCourierItem(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor).Carrier == MySPPawn)
    {
        // End:0xD1
        if(!bPickedUpItem)
        {
            AnimNotifySpecialMove();
        }
        // End:0xEA
        if(!bDeliveredItem)
        {
            AnimNotifySpecialMove();
        }
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], LPCI, DestinationActor;

    super.AnimationStartedPlaying(SeqNode);
    bPickedUpItem = false;
    bDeliveredItem = false;
    // End:0x5C
    if(SeqNode == none)
    {
        MySPPawn.EndCurrentSpecialMove(self);
        return;
    }
    LPCI = LPCourierItem(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0xD5
    if((LPCI == none) || !DoesUseChoreography())
    {
        return;
    }
    DestinationActor = LPCI.GetDestinationActor(int(MySPPawn.GetTeamNum()));
    ChoreographyParams.OtherTarget = DestinationActor;
    ChoreographyParams.MySequence = SeqNode;
    // End:0x1F6
    if(DestinationActor != none)
    {
        ChoreographyParams.bOverrideTranslationOffset = true;
        ChoreographyParams.OverridenDesiredTranslationOffset = VSize(DestinationActor.Location - MySPPawn.Location);
    }
    MySPPawn.StartPawnChoreography(ChoreographyParams);
    //return;    
}

defaultproperties
{
    ChoreographyParams=(bIsChoreographyOn=false,bIsChoreographySlaveOn=false,AlignmentType=EPawnChoreographyAlignmentType.ePCAT_ManualSingleTarget,OtherTarget=none,MySequence=none,OtherTargetSequence=none,bMyIgnoreAllBlockActorsDuringMove=false,bOtherIgnoreAllBlockActorsDuringMove=false,bIgnoreCollisionWithOther=false,OtherTargetMovePercent=0.0000000,BlendTime=0.4000000,StartTime=0.0000000,bLookAtTargetDuringStartTime=false,TooCloseTranslationTolerance=0.0000000,TooFarTranslationTolerance=0.0000000,RotationMode=EPawnChoreographyRotationMode.EPCRM_IgnoreTargetRotation,bOverrideTranslationOffset=false,OverridenDesiredTranslationOffset=0.0000000,AutoShutoffTime=0.4000000,bCounteractSlomo=false,TargetPassThroughPoint=(X=0.0000000,Y=0.0000000,Z=0.0000000),TargetPassThroughActor=none,TargetPassThroughStartBlendTime=0.0000000,TargetPassThroughEndBlendTime=0.0000000,ManualYawDeltaFromCenterline=0,ManualTargetDeltaFromCenterline=-32768,ZMatchType=EPawnChoreographyZMatching.PCZM_LeaveAlone,MaxZDistance=0.0000000,ValidationTag=0,bNoBlendInMeshZ=false,bNoBlendOutMeshZ=false)
}