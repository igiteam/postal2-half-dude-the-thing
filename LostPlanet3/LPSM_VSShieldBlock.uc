class LPSM_VSShieldBlock extends SPSpecialMove
    config(Game);

enum EShieldBlockAnims
{
    esbStart,                       // 0
    esbHold,                        // 1
    esbEnd,                         // 2
    esbHitReaction,                 // 3
    EShieldBlockAnims_MAX           // 4
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentAnim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseStartAnim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bUseEndAnim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bButtonReleased;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendInTime_Hold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendOutTime_Hold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendOutTime_HitReaction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HoldAnimNodeSeq;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinHalfAngleCosForProtection;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartShieldBlockTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EndShieldBlockTime;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL VS;

    super.InitSpecialMove(inPawn, InHandle);
    VS = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x115
    if(VS != none)
    {
        MinHalfAngleCosForProtection = Cos(((VS.TuneDataVSPlayerPawn.ShieldBlockAngularCoverage * 0.5000000) * 3.1415930) / 180.0000000);
        BlendInTime_Hold = VS.TuneDataVSPlayerPawn.ShieldBlockBlendInTime;
        BlendOutTime_Hold = VS.TuneDataVSPlayerPawn.ShieldBlockBlendOutTime;
    }
    //return;    
}

protected function InternalCanDoSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL VS;

    VS = LPBaseVSPlayerPawn(MySPPawn);
    // End:0xE0
    if(VS != none)
    {
        // End:0xE0
        if((VS.TuneDataVSPlayerPawn.InterShieldBlockDelayTime > float(0)) && (MySPPawn.WorldInfo.TimeSeconds - EndShieldBlockTime) < VS.TuneDataVSPlayerPawn.InterShieldBlockDelayTime)
        {
            return false;
        }
    }
    return super(GameSpecialMove).InternalCanDoSpecialMove();
    //return ReturnValue;    
}

function CanOverrideMoveWith()
{
    local /*0x97E50000-0x00000000*/ private class NewMove[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.CanOverrideMoveWith(NewMove);
    //return ReturnValue;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], VS;

    super.SpecialMoveStarted(bForced, PrevMove);
    StartShieldBlockTime = MySPPawn.WorldInfo.TimeSeconds;
    bButtonReleased = false;
    PlayStartAnim();
    VS = LPBaseVSPlayerPawn(MySPPawn);
    // End:0xCF
    if(VS != none)
    {
        VS.HealthRegenInfo.bHealthRegenEnabled = false;
    }
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, VS;

    VS = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x5F
    if(VS != none)
    {
        VS.HealthRegenInfo.bHealthRegenEnabled = true;
    }
    LPVSPlayerPawn(MySPPawn).EnableUpperBodyCameraBypass(false);
    HoldAnimNodeSeq = none;
    EndShieldBlockTime = MySPPawn.WorldInfo.TimeSeconds;
    PlayEndAnim(BlendOutTime_Hold);
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
        // End:0x41
        case Class'LPSMMTypes'.default.SMM_TakeDamageSetParams:
            ModifyDamage();
            // End:0xD8
            break;
        // End:0x71
        case Class'LPSMMTypes'.default.SMM_VSShieldBlockReleased:
            bButtonReleased = true;
            // End:0xD8
            break;
        // End:0xA8
        case Class'LPSMMTypes'.default.SMM_PlayerRequestsExitVS:
            PlayEndAnim(BlendOutTime_Hold);
            // End:0xD8
            break;
        // End:0xD5
        case Class'LPSMMTypes'.default.SMM_VSPlayHitReactionAnimation:
            PlayHitReactionAnimation();
            return true;
        // End:0xFFFF
        default:
            break;
    }
    return super.ProcessSMMessage(MessageName, Sender, Data);
    //return ReturnValue;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL VS;

    super(GameSpecialMove).Tick(DeltaTime);
    VS = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x1DA
    if(VS != none)
    {
        // End:0x107
        if((VS.TuneDataVSPlayerPawn.MaxShieldBlockTime > float(0)) && (MySPPawn.WorldInfo.TimeSeconds - StartShieldBlockTime) > VS.TuneDataVSPlayerPawn.MaxShieldBlockTime)
        {
            PlayEndAnim(BlendOutTime_Hold);            
        }
        else
        {
            // End:0x1DA
            if(bButtonReleased)
            {
                // End:0x1DA
                if((VS.TuneDataVSPlayerPawn.MinShieldBlockTime <= float(0)) || (MySPPawn.WorldInfo.TimeSeconds - StartShieldBlockTime) > VS.TuneDataVSPlayerPawn.MinShieldBlockTime)
                {
                    PlayEndAnim(BlendOutTime_Hold);
                }
            }
        }
    }
    //return;    
}

function PlayStartAnim()
{
    LPPlayerController(MySPPawn.Controller).ClientPlayCameraShake(LPVSPlayerPawn(MySPPawn).TuneDataVSPlayerPawn.ShieldBlockCameraShakeIn);
    MySPPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('VSShieldIn', 'None', MySPPawn, none, none);
    // End:0xED
    if(!bUseStartAnim)
    {
        StartAnimFinished(none, 0, false);
        return;
    }
    CurrentAnim = 0;
    MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(0), StartAnimFinished,, 1.0000000, 0.2000000, 0.1000000, false, true);
    //return;    
}

function PlayHoldAnim()
{
    LPVSPlayerPawn(MySPPawn).EnableUpperBodyCameraBypass(true);
    CurrentAnim = 1;
    HoldAnimNodeSeq = MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(1),,, 1.0000000, BlendInTime_Hold, 0.1000000, true, false);
    //return;    
}

function PlayEndAnim()
{
    local /*0x97E50000-0x00000000*/ private float BlendTime[8388609];

    // End:0x16
    if(int(CurrentAnim) == int(2))
    {
        return;
    }
    LPVSPlayerPawn(MySPPawn).EnableUpperBodyCameraBypass(false);
    LPPlayerController(MySPPawn.Controller).ClientPlayCameraShake(LPVSPlayerPawn(MySPPawn).TuneDataVSPlayerPawn.ShieldBlockCameraShakeOut);
    MySPPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('VSShieldOut', 'None', MySPPawn, none, none);
    // End:0x16B
    if(!bUseEndAnim || int(CurrentAnim) == int(0))
    {
        CurrentAnim = 2;
        MySPPawn.StopUpperBodyAnim(BlendTime);        
    }
    else
    {
        CurrentAnim = 2;
        MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(2),,, 1.0000000, 0.2000000, 0.1000000, false, true);
    }
    EndBlock();
    //return;    
}

function StartAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    PlayHoldAnim();
    //return;    
}

function EndAnimFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    EndBlock();
    //return;    
}

function ModifyDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL VS;
    local /*0x97E50000-0x00000000*/ private float CosToTarget;
    local /*0x97E50000-0x00000000*/ private @NULL PawnFacing, ToDamager;
    local /*0x97E50000-0x00000000*/ private class DamageType;
    local /*0x97E50000-0x00000000*/ private bool bFailed, bEndBlock;
    local /*0x97E50000-0x00000000*/ private @NULL EnemyCommand;

    bFailed = false;
    bEndBlock = false;
    VS = LPBaseVSPlayerPawn(MySPPawn);
    // End:0x4F
    if(VS == none)
    {
        bFailed = true;
    }
    // End:0x80
    if(!bFailed && int(CurrentAnim) != int(1))
    {
        bFailed = true;
    }
    // End:0x115
    if((!bFailed && !bUseStartAnim) && (HoldAnimNodeSeq == none) || HoldAnimNodeSeq.NodeTotalWeight < VS.TuneDataVSPlayerPawn.ShieldBlockBlendWeightForDamageReduction)
    {
        bFailed = true;
    }
    // End:0x471
    if(!bFailed)
    {
        // End:0x173
        if(ClassIsChildOf(VS.TakeDamageParams.DamageType, Class'LPDamageTypeSpitterTailSting'))
        {
            bEndBlock = true;            
        }
        else
        {
            // End:0x1C2
            if(ClassIsChildOf(VS.TakeDamageParams.DamageType, Class'LPDamageTypeAct1BossMelee'))
            {
                bEndBlock = true;                
            }
            else
            {
                // End:0x211
                if(ClassIsChildOf(VS.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeTwoHandBash'))
                {
                    bEndBlock = true;                    
                }
                else
                {
                    // End:0x260
                    if(ClassIsChildOf(VS.TakeDamageParams.DamageType, Class'LPDamageTypeLarocheVsTwoHandBash'))
                    {
                        bEndBlock = true;                        
                    }
                    else
                    {
                        // End:0x2AF
                        if(ClassIsChildOf(VS.TakeDamageParams.DamageType, Class'LPDamageTypeLarocheVsSuperSawOverHeadSlam'))
                        {
                            bEndBlock = true;                            
                        }
                        else
                        {
                            // End:0x2FE
                            if(ClassIsChildOf(VS.TakeDamageParams.DamageType, Class'LPDamageTypeLarocheVsSuperTaserOverHeadSlam'))
                            {
                                bEndBlock = true;                                
                            }
                            else
                            {
                                // End:0x471
                                if(ClassIsChildOf(VS.TakeDamageParams.DamageType, Class'LPDamageTypeLarocheVsMelee'))
                                {
                                    EnemyCommand = LPAIControllerVsLaroche(Pawn(VS.TakeDamageParams.DamageCauser).Controller).GetActiveCommand();
                                    // End:0x471
                                    if(ClassIsChildOf(EnemyCommand.Class, Class'LPAICmd_VsLarocheComboStrikeBase') && LPAICmd_VsLarocheComboStrikeBase(EnemyCommand).CurrentStrikeKnocksOutOfBlock())
                                    {
                                        bEndBlock = true;
                                        LPAIPawnVsLaroche(VS.TakeDamageParams.DamageCauser).LastTimeAttemptedToGrabOtherPawn = 0.0000000;
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x809
    if(!bFailed)
    {
        PawnFacing = Vector(VS.Rotation);
        ToDamager = VS.TakeDamageParams.DamageCauser.Location - VS.Location;
        ToDamager.Z = 0.0000000;
        ToDamager = Normal(ToDamager);
        CosToTarget = PawnFacing Dot ToDamager;
        // End:0x7FD
        if(CosToTarget >= MinHalfAngleCosForProtection)
        {
            VS.TakeDamageParams.Damage *= VS.TuneDataVSPlayerPawn.ShieldBlockDamageMultiplier.GetValue();
            // End:0x737
            if(bEndBlock && VS.TakeDamageParams.Damage <= 0)
            {
                VS.TakeDamageParams.Damage = 1;
                // End:0x6F9
                if(ClassIsChildOf(VS.TakeDamageParams.DamageType, Class'LPDamageTypeAct1BossMelee'))
                {
                    VS.TakeDamageParams.DamageType = Class'LPDamageTypeVSKnockedOutOfBlockByBoss';                    
                }
                else
                {
                    VS.TakeDamageParams.DamageType = Class'LPDamageTypeVSKnockedOutOfBlock';
                }                
            }
            else
            {
                DamageType = class<LPDamageType>(VS.TakeDamageParams.DamageType);
                // End:0x7FA
                if((!bEndBlock && DamageType != none) && DamageType.default.bAlternateDamageTypeOnVSBlock)
                {
                    VS.TakeDamageParams.DamageType = Class'LPDamageTypeVSBlockedAttack';
                }
            }            
        }
        else
        {
            bFailed = true;
        }
    }
    // End:0x89D
    if(bFailed && VS.TuneDataVSPlayerPawn.bEndShieldBlockOnUnprotectedHit)
    {
        // End:0x89D
        if(!ClassIsChildOf(VS.TakeDamageParams.DamageType, Class'LPDamageTypeSpitterAcid'))
        {
            bEndBlock = true;
        }
    }
    // End:0x8FE
    if(bEndBlock)
    {
        PlayEndAnim(BlendOutTime_HitReaction);
        // End:0x8FE
        if(bUseEndAnim)
        {
            MySPPawn.StopUpperBodyAnim(BlendOutTime_HitReaction);
            bUseEndAnim = false;
        }
    }
    //return;    
}

function PlayHitReactionAnimation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewAnimParams;

    NewAnimParams.SequenceTemplate = GetBestSequenceTemplateByIndex(3);
    NewAnimParams.Rate = 1.0000000;
    NewAnimParams.BlendInTime = 0.1000000;
    NewAnimParams.BlendOutTime = 0.1000000;
    NewAnimParams.bOverride = false;
    MySPPawn.PlayAdditiveAnimationFromParams(NewAnimParams);
    //return;    
}

function EndBlock()
{
    // End:0x45
    if(MySPPawn.IsLocallyControlled())
    {
        MySPPawn.LocalEndCurrentSpecialMove(self);        
    }
    else
    {
        MySPPawn.EndCurrentSpecialMove(self);
    }
    //return;    
}

defaultproperties
{
    BlendInTime_Hold=0.2000000
    BlendOutTime_Hold=0.2000000
    BlendOutTime_HitReaction=0.1000000
    AnimationTemplateNodeNames=/* Array type was not detected. */
    CanOverrideBaseClasses=/* Array type was not detected. */
    CanBeOverridenByClasses=/* Array type was not detected. */
    CanBeOverridenByBaseClasses=/* Array type was not detected. */
}