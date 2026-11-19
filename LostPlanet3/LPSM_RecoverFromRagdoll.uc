class LPSM_RecoverFromRagdoll extends SPSM_RecoverFromRagdoll
    config(Game);

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], LPP, MyLPP;

    super.SpecialMoveStarted(bForced, PrevMove);
    LPP = LPPlayerPawn(MySPPawn.SpecialMoveState.CurSMInfo.InteractionActor);
    // End:0x1C6
    if(LPP != none)
    {
        LPP.bUseRigidBodySync = true;
        MyLPP = LPPlayerPawn(MySPPawn);
        // End:0x1C6
        if(MyLPP != none)
        {
            MyLPP.LocalSoundFX('ReviveIncapacitated');
            MyLPP.LocalParticleFX('ReviveIncapacitated', vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, 0));
            // End:0x1C6
            if(((MyLPP != none) && MyLPP.TuneDataPlayerPawn != none) && MyLPP.TuneDataPlayerPawn.bUseEdgeGlowWhileIncapacitated)
            {
                MyLPP.StopEdgeGlow();
            }
        }
    }
    MySPPawn.GotoState('NoState');
    //return;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(GameSpecialMove).Tick(DeltaTime);
    MySPPawn.bForceFloorCheck = true;
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, A;

    super.SpecialMoveEnded(PrevMove, NextMove);
    // End:0xB6
    if((MySPPawn.Controller != none) && !MySPPawn.Controller.IsInState('RoundEnded'))
    {
        MySPPawn.Controller.GotoState('PlayerWalking');
    }
    // End:0x138
    foreach MySPPawn.TouchingActors(Class'Engine.Actor', A)
    {
        A.Touch(MySPPawn, none, MySPPawn.Location, vect(0.0000000, 0.0000000, 0.0000000));        
    }    
    //return;    
}

event BeginGetUpAnimation()
{
    // End:0x75
    if(!bPlayingGetUp)
    {
        MySPPawn.EndRagdoll();
        CheckCollision();
        MySPPawn.SetPhysics(1);
        bPlayingGetUp = true;
        PlaySequence(AnimIndex + 1, false);
    }
    //return;    
}

defaultproperties
{
    AnimTemplateTree=AnimTree'PlayerMoveAnimTemplate.PlayerRecoveryAnimations'
    OrientationBoneName="JO_Spine_B"
    FacingBoneName="JO_hip"
    AnimationTemplateNodeNames=/* Array type was not detected. */
}