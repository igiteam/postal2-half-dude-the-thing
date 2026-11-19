class LPSM_PackHunterStaticStrikeBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private float AutoShutOffTimeForStrikeSpecialMove[1073741825];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseChoreography;

function GetAutoShutOffTimeForThisStaticAttack()
{
    local /*0x97E50000-0x00000000*/ private float ReturnValue[92274689];

    return AutoShutOffTimeForStrikeSpecialMove;
    //return ReturnValue;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, MyLPAIPawnPackHunterPawn;
    local /*0x97E50000-0x00000000*/ private editfixedsize array NotifyArray;

    super.AnimationStartedPlaying(SeqNode);
    MyLPAIPawnPackHunterPawn = LPAIPawnPackHunter(MySPPawn);
    // End:0x305
    if((bUseChoreography && MyLPAIPawnPackHunterPawn != none) && MyLPAIPawnPackHunterPawn.SpecialMoveState.CurSMInfo.InteractionActor != none)
    {
        MyLPAIPawnPackHunterPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        ChoreographyParams.MySequence = SeqNode;
        ChoreographyParams.OtherTarget = MyLPAIPawnPackHunterPawn.SpecialMoveState.CurSMInfo.InteractionActor;
        ChoreographyParams.RotationMode = 1;
        ChoreographyParams.OtherTargetMovePercent = 0.0000000;
        ChoreographyParams.AlignmentType = 0;
        ChoreographyParams.BlendTime = -1.0000000;
        ChoreographyParams.AutoShutoffTime = GetAutoShutOffTimeForThisStaticAttack();
        ChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
        ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
        ChoreographyParams.bOverrideTranslationOffset = false;
        ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
        ChoreographyParams.MaxZDistance = MyLPAIPawnPackHunterPawn.TuneDataPackHunter.MinZDistanceToRequireMoveBeforeStrike;
        OverrideChoreographyParams(ChoreographyParams);
        MyLPAIPawnPackHunterPawn.StartPawnChoreography(ChoreographyParams);
    }
    // End:0x39F
    if((MyLPAIPawnPackHunterPawn != none) && SeqNode != none)
    {
        SeqNode.AnimSeq.GetNotifies(Class'LPAnimNotify_PlayerDodgeWindow', NotifyArray);
        // End:0x39F
        if(NotifyArray.Length == 0)
        {
            MyLPAIPawnPackHunterPawn.HandleNotifyPlayerDodgeWindow(10, 0, none);
        }
    }
    //return;    
}

function OverrideChoreographyParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL InParams[25165825];

    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MyLPAIPawnPackHunterPawn;

    MyLPAIPawnPackHunterPawn = LPAIPawnPackHunter(MySPPawn);
    // End:0x6E
    if(MyLPAIPawnPackHunterPawn != none)
    {
        MyLPAIPawnPackHunterPawn.HandleNotifyPlayerDodgeWindow(10, 1, none);
        MyLPAIPawnPackHunterPawn.StopPawnChoreography();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    AutoShutOffTimeForStrikeSpecialMove=-1.0000000
    bUseChoreography=true
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    bManageRootMotionMode=true
    bEnableLedgeCheck=true
    bAllowRotationInterpolation=true
}