class LPSM_PlayerPickUpCourierItem extends LPSM_PlayerPickUpGeneric
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAttachedItemToSelf;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL ChoreographyParams;

event AnimNotifySpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL Pickup;

    Pickup = LPCourierItem(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0xF6
    if(!bPickedUpItem)
    {
        bPickedUpItem = true;
        // End:0xF3
        if(Pickup != none)
        {
            Pickup.AttachToPickupLocation();
            // End:0xF3
            if(int(Pickup.Role) == int(ROLE_Authority))
            {
                Pickup.SetCarrier(MySPPawn);
            }
        }        
    }
    else
    {
        // End:0x140
        if(!bAttachedItemToSelf)
        {
            bAttachedItemToSelf = true;
            // End:0x140
            if(Pickup != none)
            {
                Pickup.AttachToCarryLocation();
            }
        }
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, Pickup;

    Pickup = LPCourierItem(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    MySPPawn.ClearTimer('MissingNotify', self);
    MySPPawn.StopPawnChoreography();
    // End:0xB8
    if(!bPickedUpItem)
    {
        AnimNotifySpecialMove();
    }
    // End:0xD1
    if(!bAttachedItemToSelf)
    {
        AnimNotifySpecialMove();
    }
    Pickup.NotifyPickUpAttemptFinished();
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], LPCI;

    super.AnimationStartedPlaying(SeqNode);
    bPickedUpItem = false;
    bAttachedItemToSelf = false;
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
    ChoreographyParams.OtherTarget = MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor;
    ChoreographyParams.MySequence = SeqNode;
    MySPPawn.StartPawnChoreography(ChoreographyParams);
    //return;    
}

defaultproperties
{
    ChoreographyParams=(bIsChoreographyOn=false,bIsChoreographySlaveOn=false,AlignmentType=EPawnChoreographyAlignmentType.ePCAT_ManualSingleTarget,OtherTarget=none,MySequence=none,OtherTargetSequence=none,bMyIgnoreAllBlockActorsDuringMove=false,bOtherIgnoreAllBlockActorsDuringMove=false,bIgnoreCollisionWithOther=false,OtherTargetMovePercent=0.0000000,BlendTime=0.4000000,StartTime=0.0000000,bLookAtTargetDuringStartTime=false,TooCloseTranslationTolerance=0.0000000,TooFarTranslationTolerance=0.0000000,RotationMode=EPawnChoreographyRotationMode.EPCRM_IgnoreTargetRotation,bOverrideTranslationOffset=false,OverridenDesiredTranslationOffset=0.0000000,AutoShutoffTime=0.4000000,bCounteractSlomo=false,TargetPassThroughPoint=(X=0.0000000,Y=0.0000000,Z=0.0000000),TargetPassThroughActor=none,TargetPassThroughStartBlendTime=0.0000000,TargetPassThroughEndBlendTime=0.0000000,ManualYawDeltaFromCenterline=0,ManualTargetDeltaFromCenterline=-32768,ZMatchType=EPawnChoreographyZMatching.PCZM_LeaveAlone,MaxZDistance=0.0000000,ValidationTag=0,bNoBlendInMeshZ=false,bNoBlendOutMeshZ=false)
}