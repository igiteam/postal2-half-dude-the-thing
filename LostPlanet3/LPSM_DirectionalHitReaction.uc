class LPSM_DirectionalHitReaction extends SPSM_DirectionalHitReaction
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyLPPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL DamagedByPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float TimeStampStarted;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bReactionToMeleeHit;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private class HitByDamageType;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    MyLPPawn = LPPawn(MySPPawn);
    TimeStampStarted = MySPPawn.WorldInfo.TimeSeconds;
    DamagedByPawn = LPPawn(MySPPawn.TakeDamageParams.InstigatedByPawn);
    HitByDamageType = MySPPawn.TakeDamageParams.DamageType;
    // End:0x169
    if(ClassIsChildOf(MySPPawn.TakeDamageParams.DamageType, Class'LPDamageTypePlayerMelee') || ClassIsChildOf(MySPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeHumanSoldierMelee'))
    {
        bReactionToMeleeHit = true;        
    }
    else
    {
        bReactionToMeleeHit = false;
    }
    // End:0x1E0
    if(LPPlayerController(MySPPawn.Controller) != none)
    {
        LPPlayerController(MySPPawn.Controller).IgnoreMoveInput(true);
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    super.SpecialMoveEnded(PrevMove, NextMove);
    UnpauseAnims();
    // End:0x91
    if(LPPlayerController(MySPPawn.Controller) != none)
    {
        LPPlayerController(MySPPawn.Controller).IgnoreMoveInput(false);
    }
    //return;    
}

simulated function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PushVelocity;

    // End:0x165
    if(bReactionToMeleeHit)
    {
        // End:0x165
        if(MyLPPawn.TuneDataPawn.PushSpeedWhenMeleeHit > 0.0000000)
        {
            // End:0x165
            if(((MyLPPawn.WorldInfo.TimeSeconds - TimeStampStarted) < 0.2500000) && VSize(MyLPPawn.ExternalVelocity) < 20.0000000)
            {
                PushVelocity = Normal(MyLPPawn.Location - DamagedByPawn.Location) * MyLPPawn.TuneDataPawn.PushSpeedWhenMeleeHit;
                MyLPPawn.SetExternalVelocity(PushVelocity);
            }
        }
    }
    super(SPSM_PlayAnimBase).Tick(DeltaTime);
    //return;    
}

function AnimationStartedPlaying()
{
    local /*0x97E50000-0x00000000*/ private @NULL SeqNode[8388609];
    local /*0x97E50000-0x00000000*/ private float PauseDuration, LastFrameTime;

    super.AnimationStartedPlaying(SeqNode);
    // End:0x14C
    if((SeqNode != none) && bReactionToMeleeHit)
    {
        PauseDuration = LPPawn(MySPPawn).TuneDataPawn.PauseAnimationDurationOnPlayerMeleeDamage;
        // End:0x14C
        if(PauseDuration > float(0))
        {
            LastFrameTime = MySPPawn.WorldInfo.DeltaSeconds;
            LastFrameTime = FMin(LastFrameTime, 0.0666000);
            MySPPawn.Mesh.bPauseAnims = true;
            MySPPawn.SetTimer(PauseDuration + LastFrameTime, false, 'UnpauseAnims', self);
        }
    }
    //return;    
}

function UnpauseAnims()
{
    MySPPawn.ClearTimer('UnpauseAnims', self);
    MySPPawn.Mesh.bPauseAnims = false;
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
        // End:0x36
        case Class'LPSMMTypes'.default.SMM_AllowSMToContinueOnIgnoreMoveInput:
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function CanDodgeOutOfHitReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    // End:0x1A
    if(ClassIsChildOf(HitByDamageType, Class'LPDamageTypeCarrierTalonStabPof'))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

defaultproperties
{
    AnimationTemplateNodeNames=/* Array type was not detected. */
}