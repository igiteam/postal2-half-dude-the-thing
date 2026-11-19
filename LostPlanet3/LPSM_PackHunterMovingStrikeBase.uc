class LPSM_PackHunterMovingStrikeBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDoesThisSmExpectChoreographyToBeStillOnFromPreviousSm;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class ExpectedNextMove;

function GetAutoShutOffTimeForThisMovingAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return -1.0000000;
    //return ReturnValue;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609];

    super.AnimationStartedPlaying(SeqNode);
    // End:0x77
    if(bDoesThisSmExpectChoreographyToBeStillOnFromPreviousSm)
    {
        // End:0x74
        if(MySPPawn.IsInPawnChoreography())
        {
            MySPPawn.StopPawnChoreography();
            StartMovingStrikeChoreography(SeqNode);
        }        
    }
    else
    {
        StartMovingStrikeChoreography(SeqNode);
    }
    //return;    
}

final simulated function StartMovingStrikeChoreography()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, myAIPawn;

    myAIPawn = LPAIPawn(MySPPawn);
    // End:0x280
    if((myAIPawn != none) && myAIPawn.SpecialMoveState.CurSMInfo.InteractionActor != none)
    {
        myAIPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        ChoreographyParams.MySequence = SeqNode;
        ChoreographyParams.OtherTarget = myAIPawn.SpecialMoveState.CurSMInfo.InteractionActor;
        ChoreographyParams.RotationMode = 1;
        ChoreographyParams.OtherTargetMovePercent = 0.0000000;
        ChoreographyParams.AlignmentType = 0;
        ChoreographyParams.BlendTime = 0.5000000;
        ChoreographyParams.AutoShutoffTime = GetAutoShutOffTimeForThisMovingAttack();
        ChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
        ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
        ChoreographyParams.bOverrideTranslationOffset = false;
        ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
        myAIPawn.StartPawnChoreography(ChoreographyParams);
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, myAIPawn;

    myAIPawn = LPAIPawn(MySPPawn);
    // End:0x8C
    if((myAIPawn != none) && (NextMove == none) || !ClassIsChildOf(NextMove.Class, ExpectedNextMove))
    {
        myAIPawn.StopPawnChoreography();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function OnAnimForChainedSpecialMoveFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL myPHCtrl;

    // End:0xAE
    if((MySPPawn != none) && LPAIControllerPackHunter(MySPPawn.Controller) != none)
    {
        myPHCtrl = LPAIControllerPackHunter(MySPPawn.Controller);
        myPHCtrl.NotifyOfSpecialMoveAnimtionComplete(self.Class, bInterrupted);
    }
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    bManageRootMotionMode=true
    bAllowRotationInterpolation=true
}