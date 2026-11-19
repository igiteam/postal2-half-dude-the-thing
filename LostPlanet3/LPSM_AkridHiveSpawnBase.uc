class LPSM_AkridHiveSpawnBase extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte PawnPhysics;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bAlternateAnimNode;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    PawnPhysics = MySPPawn.Physics;
    // End:0x68
    if(LPAIPawn(MySPPawn) != none)
    {
        LPAIPawn(MySPPawn).SetGettingBirthedStarted();
    }
    // End:0x100
    if(LPAIPawn(MySPPawn).TuneDataAIPawn.bDisableAllAiWhileSpawningFromHive.GetValue() != float(0))
    {
        SPAIController(MySPPawn.Controller).ForceDisableAI();
    }
    MySPPawn.SetPhysics(4);
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, Hive, ImpulseVector;
    local /*0x97E50000-0x00000000*/ private float AIDelayTime;
    local /*0x97E50000-0x00000000*/ private bool bApplyImpulse;
    local /*0x97E50000-0x00000000*/ private @NULL MyLPAIPawn;

    super.SpecialMoveEnded(PrevMove, NextMove);
    Hive = LPHiveSpawnPoint(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0x2D2
    if(Hive != none)
    {
        MyLPAIPawn = LPAIPawn(MySPPawn);
        // End:0x146
        if(MyLPAIPawn != none)
        {
            MyLPAIPawn.SetGettingBirthedDone();
            MyLPAIPawn.ThingThatGameBirthToMe = Hive;
            MyLPAIPawn.TimeBirthProcessEnded = MySPPawn.WorldInfo.TimeSeconds;
        }
        // End:0x185
        if(Hive.bFallAfterSpawning)
        {
            MySPPawn.SetPhysics(2);            
        }
        else
        {
            MySPPawn.SetPhysics(PawnPhysics);
        }
        bApplyImpulse = Hive.GetSpawnImpulse(ImpulseVector, AIDelayTime);
        // End:0x240
        if(!bApplyImpulse || bLastPlaybackInterrupted)
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

function PrepSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], InteractionActor, Hive;

    // End:0x65
    if(AnimationTemplates.Length > 1)
    {
        Hive = LPHiveSpawnPoint(InteractionActor);
        // End:0x65
        if(Hive != none)
        {
            bAlternateAnimNode = Hive.ShouldPlayCinematic();
        }
    }
    //return;    
}

function PickAnimTemplateToReplicate()
{
    local /*0x97E50000-0x00000000*/ private @NULL out_ReplicatedAnimSeqs[25165826];

    out_ReplicatedAnimSeqs[0] = none;
    // End:0x34
    if(bAlternateAnimNode)
    {
        out_ReplicatedAnimSeqs[0] = GetBestSequenceTemplateByIndex(1);        
    }
    else
    {
        out_ReplicatedAnimSeqs[0] = GetBestSequenceTemplateByIndex(0);
    }
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    RootMotionMode=ERootMotionMode.RMM_Translate
    bManageRootMotionMode=true
    bDisableCollision=true
}