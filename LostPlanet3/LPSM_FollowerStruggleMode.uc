class LPSM_FollowerStruggleMode extends SPSM_FollowerPawnBase
    abstract
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL PlayerLeaderPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class TuneDataClass;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL TuneData;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array AdditiveAnimIndexes;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private editfixedsize array FullBodyAnimIndexes;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampPlayerDead;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MaxTimeAfterDead;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bCollideWorld;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL tuneDataAnimControl, tuneDataAnim;
    local /*0x97E50000-0x00000000*/ private int I;

    // End:0x40
    if((TuneData == none) && TuneDataClass != Class'LPTuneDataStruggle')
    {
        TuneData = new TuneDataClass;
    }
    // End:0x4E9
    if(TuneData != none)
    {
        AdditiveAnimIndexes.Length = TuneData.StrugglePhases.Length;
        FullBodyAnimIndexes.Length = TuneData.StrugglePhases.Length;
        I = 0;
        J0xAE:

        // End:0x4E9 [Loop If]
        if(I < TuneData.StrugglePhases.Length)
        {
            AdditiveAnimIndexes[I] = -1;
            FullBodyAnimIndexes[I] = -1;
            tuneDataAnim = LPTuneDataStrugglePhaseAnim(TuneData.StrugglePhases[I]);
            // End:0x283
            if((((tuneDataAnim != none) && int(tuneDataAnim.PlayAnimMode) == int(1)) && int(tuneDataAnim.PlayAnimTarget) == int(1)) && tuneDataAnim.AnimTemplateName != 'None')
            {
                FullBodyAnimIndexes[I] = AnimationTemplateNodeNames.Find(tuneDataAnim.AnimTemplateName);                
                // End:0x280
                if(FullBodyAnimIndexes[I] == -1)
                {
                    FullBodyAnimIndexes[I] = AnimationTemplateNodeNames.Length;
                    AnimationTemplateNodeNames.AddItem(tuneDataAnim.AnimTemplateName);                    
                }                
            }
            else
            {
                // End:0x3BE
                if((((tuneDataAnim != none) && int(tuneDataAnim.PlayAnimMode) == int(2)) && int(tuneDataAnim.PlayAnimTarget) == int(1)) && tuneDataAnim.AnimTemplateName != 'None')
                {
                    AdditiveAnimIndexes[I] = AnimationTemplateNodeNames.Find(tuneDataAnim.AnimTemplateName);                    
                    // End:0x3BB
                    if(AdditiveAnimIndexes[I] == -1)
                    {
                        AdditiveAnimIndexes[I] = AnimationTemplateNodeNames.Length;
                        AnimationTemplateNodeNames.AddItem(tuneDataAnim.AnimTemplateName);                        
                    }                    
                }
                else
                {
                    tuneDataAnimControl = LPTuneDataStrugglePhaseAnimControl(TuneData.StrugglePhases[I]);
                    // End:0x4DB
                    if((tuneDataAnimControl != none) && tuneDataAnimControl.AdditiveFollowerTemplateName != 'None')
                    {
                        AdditiveAnimIndexes[I] = AnimationTemplateNodeNames.Find(tuneDataAnimControl.AdditiveFollowerTemplateName);                        
                        // End:0x4DB
                        if(AdditiveAnimIndexes[I] == -1)
                        {
                            AdditiveAnimIndexes[I] = AnimationTemplateNodeNames.Length;
                            AnimationTemplateNodeNames.AddItem(tuneDataAnimControl.AdditiveFollowerTemplateName);                            
                        }
                    }
                }
            }
            ++I;
            // [Loop Continue]
            goto J0xAE;
        }
    }
    super(SPSpecialMove).InitSpecialMove(inPawn, InHandle);
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    TimeStampPlayerDead = -1.0000000;
    super.SpecialMoveStarted(bForced, PrevMove);
    PlayerLeaderPawn = LPPlayerPawn(LeaderPawn);
    // End:0x8B
    if(int(MySPPawn.Physics) == int(2))
    {
        MySPPawn.SetPhysics(1);
    }
    //return;    
}

function StartInteraction()
{
    super(SPSM_LeaderFollowerBase).StartInteraction();
    MySPPawn.bBlockActors = false;
    MySPPawn.bCollideWorld = bCollideWorld;
    LPPawn(MySPPawn).InStruggleMode = true;
    MySPPawn.ZeroMovementVariables();
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    LPPawn(MySPPawn).InStruggleMode = false;
    MySPPawn.bBlockActors = true;
    StopAnimationChoreography(MySPPawn);
    // End:0x8C
    if(LeaderPawn != none)
    {
        LeaderPawn.StopPawnChoreography();
    }
    MySPPawn.Mesh.RootMotionMode = 2;
    MySPPawn.Mesh.RootMotionRotationMode = 0;
    PlayerLeaderPawn = none;
    super.SpecialMoveEnded(PrevMove, NextMove);
    //return;    
}

event Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];

    super(GameSpecialMove).Tick(DeltaTime);
    // End:0x222
    if((LeaderPawn != none) && LPSM_LeadStruggleMode(LeaderPawn.GetCurrentSpecialMoveInstance()) == none)
    {
        // End:0x222
        if(MySPPawn.FullBodyAnimInfo.AnimNodeSlot.bIsPlayingCustomAnim && MySPPawn.FullBodyAnimInfo.AnimNodeSlot.GetCustomAnimNodeSeq().GetTimeLeft() <= 0.0000000)
        {
            // End:0x1C2
            if(TuneData.bKillFollowerOnWin)
            {
                MySPPawn.TakeDamage(MySPPawn.Health + 100000, LeaderPawn.Controller, MySPPawn.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'LPDamageTypePlayerStruggle');                
            }
            else
            {
                MySPPawn.UnlockMeshTranslationZ();
                MySPPawn.LockDesiredRotation(false, false);
            }
            MySPPawn.EndCurrentSpecialMove(self);
        }
    }
    // End:0x2A7
    if((LeaderPawn == none) || LeaderPawn.Health <= 0)
    {
        // End:0x2A7
        if(TimeStampPlayerDead < 0.0000000)
        {
            TimeStampPlayerDead = MySPPawn.WorldInfo.TimeSeconds;
        }
    }
    // End:0x358
    if(TimeStampPlayerDead > 0.0000000)
    {
        // End:0x358
        if((MySPPawn.WorldInfo.TimeSeconds - TimeStampPlayerDead) >= MaxTimeAfterDead)
        {
            // End:0x338
            if(PlayerLeaderPawn != none)
            {
                PlayerLeaderPawn.OnPlayRagDollDeath();                
            }
            else
            {
                MySPPawn.EndCurrentSpecialMove(self);
            }
        }
    }
    //return;    
}

function NotifyFollowersSpecialMoveOfSuccessPctg()
{
    local /*0x97E50000-0x00000000*/ private float CurrentPctgSuccess[8388609];

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
        // End:0x6B
        case Class'LPSMMTypes'.default.SMM_PlayDying:
            // End:0x6B
            if((LeaderPawn != none) && LeaderPawn.Health > 0)
            {
                return true;
            }
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

defaultproperties
{
    TimeStampPlayerDead=-1.0000000
    MaxTimeAfterDead=8.0000000
    bKeepPoseOnDead=true
}