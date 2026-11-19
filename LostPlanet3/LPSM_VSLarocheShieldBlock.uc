class LPSM_VSLarocheShieldBlock extends SPSpecialMove
    config(Game);

enum ELarocheBlockAnims
{
    elbHold,                        // 0
    elbEnd,                         // 1
    elbHitReaction,                 // 2
    ELarocheBlockAnims_MAX          // 3
};

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL VsLarochePawn[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private byte CurrentAnim;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendInTime_Hold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float BlendOutTime_Hold;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL HoldAnimNodeSeq;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float MinHalfAngleCosForProtection;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float StartShieldBlockTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float EndShieldBlockTime;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bButtonReleased;

function InitSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private name InHandle[8388609];

    super.InitSpecialMove(inPawn, InHandle);
    VsLarochePawn = LPAIPawnVsLaroche(MySPPawn);
    MinHalfAngleCosForProtection = Cos(((VsLarochePawn.TuneDataVsLaroche.BlockAngularCoverage * 0.5000000) * 3.1415930) / 180.0000000);
    BlendInTime_Hold = VsLarochePawn.TuneDataVsLaroche.ShieldBlockBlendInTime;
    BlendOutTime_Hold = VsLarochePawn.TuneDataVsLaroche.ShieldBlockBlendOutTime;
    //return;    
}

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609];

    super.SpecialMoveStarted(bForced, PrevMove);
    StartShieldBlockTime = MySPPawn.WorldInfo.TimeSeconds;
    bButtonReleased = false;
    CurrentAnim = 0;
    HoldAnimNodeSeq = MySPPawn.PlayUpperBodyAnimationSequence(GetBestSequenceTemplateByIndex(0),,, 1.0000000, BlendInTime_Hold, 0.1000000, true, false);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove;

    HoldAnimNodeSeq = none;
    PlayEndAnim();
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
            // End:0x95
            break;
        // End:0x71
        case Class'LPSMMTypes'.default.SMM_VSShieldBlockReleased:
            bButtonReleased = true;
            // End:0x95
            break;
        // End:0x92
        case Class'LPSMMTypes'.default.SMM_VSPlayHitReactionAnimation:
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

    super(GameSpecialMove).Tick(DeltaTime);
    // End:0xDD
    if(bButtonReleased)
    {
        // End:0xDD
        if((VsLarochePawn.TuneDataVsLaroche.MinShieldBlockTime <= float(0)) || (MySPPawn.WorldInfo.TimeSeconds - StartShieldBlockTime) > VsLarochePawn.TuneDataVsLaroche.MinShieldBlockTime)
        {
            PlayEndAnim();
        }
    }
    //return;    
}

function PlayEndAnim()
{
    // End:0x16
    if(int(CurrentAnim) == int(1))
    {
        return;
    }
    CurrentAnim = 1;
    MySPPawn.StopUpperBodyAnim(BlendOutTime_Hold);
    EndBlock();
    //return;    
}

function ModifyDamage()
{
    local /*0x97E50000-0x00000000*/ private float CosToTarget;
    local /*0x97E50000-0x00000000*/ private @NULL PawnFacing, ToDamager;
    local /*0x97E50000-0x00000000*/ private class DamageType;
    local /*0x97E50000-0x00000000*/ private bool bFailed, bEndBlock;

    bFailed = false;
    bEndBlock = false;
    // End:0xA1
    if((int(CurrentAnim) == int(0)) && (HoldAnimNodeSeq == none) || HoldAnimNodeSeq.NodeTotalWeight < VsLarochePawn.TuneDataVsLaroche.ShieldBlockBlendWeightForDamageReduction)
    {
        bFailed = true;
    }
    // End:0x1C2
    if(!bFailed)
    {
        PawnFacing = Vector(MySPPawn.Rotation);
        ToDamager = MySPPawn.TakeDamageParams.DamageCauser.Location - MySPPawn.Location;
        ToDamager.Z = 0.0000000;
        ToDamager = Normal(ToDamager);
        CosToTarget = PawnFacing Dot ToDamager;
        // End:0x1C2
        if(CosToTarget < MinHalfAngleCosForProtection)
        {
            bFailed = true;
        }
    }
    // End:0x2FF
    if(!bFailed)
    {
        MySPPawn.TakeDamageParams.Damage *= VsLarochePawn.TuneDataVsLaroche.ShieldBlockDamageMultiplier.GetValue();
        DamageType = class<LPDamageType>(MySPPawn.TakeDamageParams.DamageType);
        // End:0x2FF
        if((DamageType != none) && DamageType.default.bAlternateDamageTypeOnVSBlock)
        {
            MySPPawn.TakeDamageParams.DamageType = Class'LPDamageTypeVSBlockedAttack';
        }
    }
    // End:0x34D
    if(bFailed || bEndBlock)
    {
        PlayEndAnim();
        MySPPawn.StopUpperBodyAnim(BlendOutTime_Hold);
    }
    //return;    
}

function PlayHitReactionAnimation()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize @NULL NewAnimParams;

    NewAnimParams.SequenceTemplate = GetBestSequenceTemplateByIndex(2);
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
    AnimationTemplateNodeNames=/* Array type was not detected. */
}