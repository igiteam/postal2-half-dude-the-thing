class LPSM_SnowCrabAttackHastyPincerBashBase extends SPSM_PlayAnimBase
    config(Game);

enum ECrabAttackType
{
    eCrabAttackType_Primary,        // 0
    eCrabAttackType_Hasty,          // 1
    eCrabAttackType_MAX             // 2
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL CrabPawn[536870913];

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    CrabPawn = LPAIPawnBaseSnowCrab(MySPPawn);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

function ProcessSMMessage()
{
    local /*0x97E50000-0x00000000*/ private name MessageName[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL Sender[8388609];
    local /*0x97E50000-0x00000000*/ private int Data[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    switch(MessageName)
    {
        // End:0x40
        case Class'LPSMMTypes'.default.SMM_SnowCrabStartHastyPincerBash:
            StartAdditiveHastyPincerBach();
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

simulated function StartAdditiveHastyPincerBach()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewAnimParams, SCPawn, scCtrl;

    SCPawn = LPAIPawnBaseSnowCrab(MySPPawn);
    scCtrl = LPAIControllerBaseSnowCrab(SCPawn.Controller);
    // End:0x285
    if((scCtrl != none) && !scCtrl.PincerBashInfo.bPerformingPincerBash)
    {
        scCtrl.PincerBashInfo.bPerformingPincerBash = true;
        NewAnimParams.SequenceTemplate = GetBestSequenceTemplateByIndex(1);
        NewAnimParams.EndDelegate = NotifyDoneWithAdditiveHastyPincerBach;
        NewAnimParams.UserData = 0;
        NewAnimParams.Rate = 1.0000000;
        NewAnimParams.BlendInTime = 0.0000000;
        NewAnimParams.BlendOutTime = 0.0000000;
        NewAnimParams.bLooping = false;
        NewAnimParams.bOverride = false;
        NewAnimParams.TranslationExtraction = 0;
        NewAnimParams.RotationExtraction = 0;
        NewAnimParams.bManageRootMotionMode = false;
        NewAnimParams.RootMotionMode = 3;
        SCPawn.PlayAdditiveAnimationFromParams(NewAnimParams);
    }
    //return;    
}

final simulated function NotifyDoneWithAdditiveHastyPincerBach()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SCPawn, scCtrl;

    SCPawn = LPAIPawnBaseSnowCrab(MySPPawn);
    scCtrl = LPAIControllerBaseSnowCrab(SCPawn.Controller);
    // End:0x90
    if(scCtrl != none)
    {
        scCtrl.PincerBashInfo.bPerformingPincerBash = false;
    }
    //return;    
}

simulated function StopAdditiveHastyPincerBach()
{
    local /*0x97E50000-0x00000000*/ private @NULL SCPawn, scCtrl;

    SCPawn = LPAIPawnBaseSnowCrab(MySPPawn);
    SCPawn.StopAdditiveAnim(0.2500000);
    scCtrl = LPAIControllerBaseSnowCrab(SCPawn.Controller);
    // End:0xB4
    if(scCtrl != none)
    {
        scCtrl.PincerBashInfo.bPerformingPincerBash = false;
    }
    //return;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}