class LPSM_CreativeSpawnBase extends SPSpecialMove
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PawnPhysics;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAnimFinished;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    PawnPhysics = MySPPawn.Physics;
    SPAIController(MySPPawn.Controller).ForceDisableAI();
    MySPPawn.SetPhysics(4);
    PlaySequence();
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function PlaySequence()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], CurAnimSequence, ChoreographyParams, PlayParams, CSPoint;

    CSPoint = LPCreativeSpawnPoint(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0x44E
    if(CSPoint != none)
    {
        // End:0x44E
        if(CSPoint.AnimationName != 'None')
        {
            PlayParams.AnimName = CSPoint.AnimationName;
            PlayParams.EndDelegate = OnAnimDone;
            PlayParams.Rate = CSPoint.PlayBackRate;
            PlayParams.BlendInTime = 0.0000000;
            PlayParams.BlendOutTime = CSPoint.BlendOutTime;
            PlayParams.bLooping = false;
            PlayParams.bOverride = true;
            PlayParams.bManageRootMotionMode = CSPoint.bManageRootMotionMode;
            PlayParams.TranslationExtraction = CSPoint.TranslationExtraction;
            PlayParams.RotationExtraction = CSPoint.RotationExtraction;
            PlayParams.RootMotionMode = CSPoint.RootMotionMode;
            CurAnimSequence = MySPPawn.PlayFullBodyAnimationFromParams(PlayParams);
            // End:0x444
            if(CSPoint.bUseChoreography)
            {
                ChoreographyParams.AlignmentType = 0;
                ChoreographyParams.MySequence = CurAnimSequence;
                ChoreographyParams.RotationMode = ((CSPoint.bChoreographyIgnoreTargetRot) ? 1 : 0);
                ChoreographyParams.OtherTargetMovePercent = 0.0000000;
                ChoreographyParams.BlendTime = 0.0000000;
                ChoreographyParams.OtherTarget = CSPoint.ChoreographyObject;
                MySPPawn.StartPawnChoreography(ChoreographyParams);
            }
            return CurAnimSequence;
        }
    }
    return none;
    //return ReturnValue;    
}

simulated function OnAnimDone()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    bAnimFinished = !bInterrupted;
    MySPPawn.EndSpecialMove(Class);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, CSPoint, ImpulseVector;
    local /*0x97E50000-0x00000000*/ private float AIDelayTime;
    local /*0x97E50000-0x00000000*/ private bool bApplyImpulse;

    MySPPawn.StopPawnChoreography();
    CSPoint = LPCreativeSpawnPoint(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0x213
    if(CSPoint != none)
    {
        // End:0xC4
        if(CSPoint.bFallAfterSpawning)
        {
            MySPPawn.SetPhysics(2);            
        }
        else
        {
            MySPPawn.SetPhysics(PawnPhysics);
        }
        bApplyImpulse = CSPoint.GetSpawnImpulse(ImpulseVector, AIDelayTime);
        // End:0x181
        if(!bApplyImpulse || !bAnimFinished)
        {
            SPAIController(MySPPawn.Controller).ForceEnableAI();            
        }
        else
        {
            SPAIController(MySPPawn.Controller).SetTimer(AIDelayTime, false, 'ForceEnableAI', MySPPawn.Controller);
            MySPPawn.Velocity = ImpulseVector;
        }        
    }
    else
    {
        SPAIController(MySPPawn.Controller).ForceEnableAI();
        MySPPawn.SetPhysics(PawnPhysics);
    }
    //return;    
}

defaultproperties
{
    bDisableCollision=true
}