class LPSM_SpitterAttackMoves extends SPSM_PlayAnimBase
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MySpitterPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL OtherPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseChoreography;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MySpitterPawn = LPAIPawnSpitter(MySPPawn);
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    // End:0x37
    if(OtherPawn != none)
    {
        OtherPawn.RemoveActiveCombatWindows(MySpitterPawn);
    }
    // End:0x74
    if(bUseChoreography && MySpitterPawn != none)
    {
        MySpitterPawn.StopPawnChoreography();
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    MySpitterPawn = none;
    //return;    
}

function EnableRotation()
{
    local /*0x97E50000-0x00000000*/ private bool bEnable[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL SpitterController;

    // End:0x1F5
    if(MySpitterPawn != none)
    {
        SpitterController = LPAIControllerSpitter(MySpitterPawn.Controller);
        // End:0x1F5
        if(SpitterController != none)
        {
            // End:0x120
            if(bEnable)
            {
                SpitterController.Kynapse_ActivateBot(false);
                MySpitterPawn.SetDesiredRotation(MySpitterPawn.Rotation);
                SpitterController.Kynapse_ActivateBot(true);
                MySpitterPawn.LockDesiredRotation(false);
                MySpitterPawn.ResetRotationRate();                
            }
            else
            {
                SpitterController.Kynapse_ActivateBot(false);
                MySpitterPawn.RotationRate.Yaw = 0;
                SpitterController.Focus = none;
                MySpitterPawn.SetDesiredRotation(MySpitterPawn.Rotation);
                MySpitterPawn.LockDesiredRotation(true);
            }
        }
    }
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], ChoreographyParams, myAIPawn;

    super.AnimationStartedPlaying(SeqNode);
    myAIPawn = LPAIPawnSpitter(MySPPawn);
    OtherPawn = LPPawn(myAIPawn.SpecialMoveState.CurSMInfo.InteractionPawn);
    // End:0xC6
    if(OtherPawn != none)
    {
        myAIPawn.PublishCombatWindowsFromAnimation(SeqNode, OtherPawn);
    }
    // End:0x36E
    if(((bUseChoreography && myAIPawn != none) && myAIPawn.bAllowChoreography) && myAIPawn.SpecialMoveState.CurSMInfo.InteractionActor != none)
    {
        myAIPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        ChoreographyParams.MySequence = SeqNode;
        ChoreographyParams.OtherTarget = myAIPawn.SpecialMoveState.CurSMInfo.InteractionActor;
        ChoreographyParams.RotationMode = 1;
        ChoreographyParams.OtherTargetMovePercent = 0.0000000;
        ChoreographyParams.AlignmentType = 0;
        ChoreographyParams.BlendTime = 0.5000000;
        ChoreographyParams.AutoShutoffTime = -1.0000000;
        ChoreographyParams.TooCloseTranslationTolerance = 0.0000000;
        ChoreographyParams.TooFarTranslationTolerance = 0.0000000;
        ChoreographyParams.bOverrideTranslationOffset = false;
        ChoreographyParams.OverridenDesiredTranslationOffset = 0.0000000;
        OverrideChoreographyParams(ChoreographyParams);
        myAIPawn.StartPawnChoreography(ChoreographyParams);        
    }
    else
    {
        // End:0x39C
        if(myAIPawn != none)
        {
            myAIPawn.StopPawnChoreography();
        }
    }
    //return;    
}

function OverrideChoreographyParams()
{
    local /*0x97E50000-0x00000000*/ private @NULL ChoreographyParams[25165825];

    //return;    
}

defaultproperties
{
    BlendOutTime=1.0000000
}