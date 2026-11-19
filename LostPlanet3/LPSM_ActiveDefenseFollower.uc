class LPSM_ActiveDefenseFollower extends SPSM_FollowerPawnBase
    config(Game);

function @NULL SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];
    local /*0x97E50000-0x00000400*/ private editfixedsize array ComponentsFound;
    local /*0x97E50000-0x00000400*/ private @NULL Component, AudioComponent, MyLPPawn;

    super.SpecialMoveStarted(bForced, PrevMove);
    MyLPPawn = LPPawn(MySPPawn);
    MySPPawn.GetComponentsOfClass(Class'Engine.AudioComponent', ComponentsFound);
    // End:0x12C
    foreach ComponentsFound(Component)
    {
        AudioComponent = AudioComponent(Component);
        // End:0x12B
        if((AudioComponent != none) && AudioComponent.IsPlaying())
        {
            // End:0x12B
            if(MyLPPawn != none)
            {
                // End:0x12B
                if(!MyLPPawn.IsThisAudioComponentInTheListToNotStopOnFollowerAtStartOfActiveDefenses(AudioComponent))
                {
                    AudioComponent.Stop();
                }
            }
        }        
    }    
    MySPPawn.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
    MySPPawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609], Leader;

    Leader = LPPawn(LeaderPawn);
    // End:0x65
    if(Leader != none)
    {
        LPPawn(MySPPawn).PublishCombatWindowsFromAnimation(SeqNode, Leader);
    }
    super(SPSM_LeaderFollowerBase).AnimationStartedPlaying(SeqNode);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, Leader;

    Leader = LPPawn(LeaderPawn);
    // End:0x5C
    if(Leader != none)
    {
        Leader.RemoveActiveCombatWindows(LPPawn(MySPPawn));
    }
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

defaultproperties
{
    DefaultAICommand=Class'LPAICmd_SpecialMoveBase'
}