class LPSM_PlayerVSDeath extends SPSM_PlayAnimBase
    config(Game);

var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDeathDelayFinished;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bPlayingHitReaction;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bDeathAnimDone;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bSkipAnimPlayback;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private bool bHitReactionEndsInDeath;

function SpecialMoveStarted()
{
    local /*0x97E50000-0x00000000*/ private bool bForced[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], MyVSPawn, LPC, Winch;
    local /*0x97E50000-0x00000000*/ private bool bMissionFailed;

    MyVSPawn = LPVSPlayerPawn(MySPPawn);
    MyVSPawn.Mesh.RootMotionMode = 3;
    bSpecialMoveEnded = false;
    Winch = LPWeaponVSWinch(MyVSPawn.FindInventoryType(Class'LPWeaponVSWinch', true));
    // End:0x1B1
    if(Winch != none)
    {
        // End:0x169
        if(Winch.GrabbedPawn != none)
        {
            // End:0x149
            if(int(MyVSPawn.WorldInfo.NetMode) != int(NM_Client))
            {
                Winch.GrabbedPawn.DoVSCrushTossAction(MyVSPawn);
            }
            Winch.GrabbedPawn = none;
        }
        // End:0x1B1
        if(Winch.IsInState('WinchPointInteracting'))
        {
            Winch.GotoState('Retracting');
        }
    }
    // End:0x2C6
    if(int(MyVSPawn.WorldInfo.NetMode) != int(NM_Client))
    {
        LPC = LPPlayerController(MyVSPawn.Controller);
        // End:0x2C6
        if(LPC != none)
        {
            // End:0x2A3
            if(LPC.bIsInVitalSuit && LPC.bIsVitalSuitExitLockedByKismet)
            {
                bMissionFailed = true;
                MyVSPawn.KillPlayerAndVS();                
            }
            else
            {
                LPC.ExitVS(true);
            }
        }
    }
    BlendOutTime = -1.0000000;
    // End:0x4D4
    if(!bMissionFailed)
    {
        MyVSPawn.Health = 1;
        MyVSPawn.SetTimer(MyVSPawn.TuneDataVSPlayerPawn.HealthRegenDelayAfterDeath, false, 'DelayFinished', self);
        // End:0x4C5
        if(MyVSPawn.TuneDataVSPlayerPawn.HealthRegenDelayAfterDeath > float(0))
        {
            MyVSPawn.HealthRegenRate = ((float(MyVSPawn.HealthMax) * 0.0100000) * MyVSPawn.TuneDataVSPlayerPawn.HealthStartingPercentageAfterDeath.GetValue()) / MyVSPawn.TuneDataVSPlayerPawn.HealthRegenDelayAfterDeath;
            MyVSPawn.HealthRegenDelay = 0.0000000;
            MyVSPawn.HealthRegenInfo.HealthRegenDelayTimer = 0.0000000;
            bDeathDelayFinished = false;            
        }
        else
        {
            bDeathDelayFinished = true;
        }        
    }
    else
    {
        bDeathDelayFinished = true;
    }
    // End:0x52A
    if(!MyVSPawn.IsInState('VSShutdown'))
    {
        MyVSPawn.GotoState('VSShutdown');
    }
    bPlayingHitReaction = false;
    // End:0x569
    if(LPSM_PlayerVSUberStrikeVictim(PrevMove) != none)
    {
        bSkipAnimPlayback = true;
        bDeathAnimDone = true;        
    }
    else
    {
        bSkipAnimPlayback = false;
        bDeathAnimDone = false;
    }
    super.SpecialMoveStarted(bForced, PrevMove);
    //return;    
}

function IsHitReactionAdditive()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private class SPDT;

    SPDT = class<SPDamageType>(MySPPawn.TakeDamageParams.DamageType);
    // End:0xED
    if(SPDT != none)
    {
        // End:0xED
        if(((SPDT.default.bAdditiveHitReaction || ClassIsChildOf(SPDT, Class'LPDamageTypeSpitterAcid')) || ClassIsChildOf(SPDT, Class'LPDamageTypeSpitterTalon')) || LPAIPawnDefender(MySPPawn.TakeDamageParams.InstigatedByPawn) != none)
        {
            return true;
        }
    }
    return false;
    //return ReturnValue;    
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
        case Class'LPSMMTypes'.default.SMM_PlayerRequestsEnterVS:
            return true;
        // End:0xBF
        case Class'LPSMMTypes'.default.SMM_VSPlayHitReactionAnimation:
            // End:0xBD
            if(((!bPlayingHitReaction && bDeathAnimDone) && LPVSPlayerPawn(MySPPawn).ShouldAllowHitReaction()) && !IsHitReactionAdditive())
            {
                PlayHitReaction();
            }
            return true;
        // End:0xFFFF
        default:
            return super(SPSpecialMove).ProcessSMMessage(MessageName, Sender, Data);
            break;
    }
    //return ReturnValue;    
}

function Tick()
{
    local /*0x97E50000-0x00000000*/ private float DeltaTime[8388609];
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;

    MyVSPawn = LPVSPlayerPawn(MySPPawn);
    // End:0x11B
    if(bDeathDelayFinished && !bPlayingHitReaction)
    {
        // End:0x11B
        if((MyVSPawn != none) && MyVSPawn.Health >= MyVSPawn.TuneDataVSPlayerPawn.MinHealthForEntry)
        {
            MyVSPawn.TuneDataPawnSoundEventBindings.PlayEventSoundLocally('VSRepaired', 'None', MyVSPawn, none, none);
            MyVSPawn.EndSpecialMove(Class);
        }
    }
    super.Tick(DeltaTime);
    //return;    
}

function DelayFinished()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn;
    local /*0x97E50000-0x00000000*/ private float StartingHealth;

    MyVSPawn = LPVSPlayerPawn(MySPPawn);
    bDeathDelayFinished = true;
    RestoreDefaultHealthRegenValues(MyVSPawn);
    StartingHealth = (float(MyVSPawn.HealthMax) * 0.0100000) * MyVSPawn.TuneDataVSPlayerPawn.HealthStartingPercentageAfterDeath.GetValue();
    StartingHealth = FClamp(StartingHealth, 1.0000000, float(MyVSPawn.HealthMax));
    // End:0x17E
    if((MyVSPawn != none) && float(MyVSPawn.Health) < StartingHealth)
    {
        MyVSPawn.HealDamage(int(StartingHealth - float(MyVSPawn.Health)), none, none);
    }
    //return;    
}

function RestoreDefaultHealthRegenValues()
{
    local /*0x97E50000-0x00000000*/ private @NULL MyVSPawn[8388609];

    MyVSPawn.HealthRegenRate = MyVSPawn.TuneDataPawn.GetHealthRegenRate(MyVSPawn);
    MyVSPawn.HealthRegenDelay = MyVSPawn.TuneDataPawn.GetHealthRegenDelay(MyVSPawn);
    //return;    
}

function SpecialMoveEnded()
{
    local /*0x97E50000-0x00000000*/ private @NULL PrevMove[8388609], NextMove, MyVSPawn;

    bSpecialMoveEnded = true;
    MyVSPawn = LPVSPlayerPawn(MySPPawn);
    MyVSPawn.ClearTimer('DelayFinished', self);
    MyVSPawn.Mesh.RootMotionMode = 2;
    RestoreDefaultHealthRegenValues(MyVSPawn);
    // End:0x118
    if(MyVSPawn.Health > 0)
    {
        MyVSPawn.TriggerEventClass(Class'LPSeqEvent_VSRegenerated', MyVSPawn);
        MyVSPawn.GotoState('None');        
    }
    BlendOutTime = 1.0000000;
    SpecialMoveEndedStopAnimation(PrevMove, NextMove);
    //return;    
}

function PlayAnimation()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689], Seq;

    // End:0x1B
    if(bSkipAnimPlayback)
    {
        bSkipAnimPlayback = false;
        return none;
    }
    Seq = super.PlayAnimation();
    return Seq;
    //return ReturnValue;    
}

function StopFullBodyAnimation()
{
    MySPPawn.StopFullBodyAnim(0.5000000);
    //return;    
}

function PlayHitReaction()
{
    local /*0x97E50000-0x00000000*/ private class HitByDamageType;

    HitByDamageType = MySPPawn.TakeDamageParams.DamageType;
    // End:0x55
    if(class<LPDamageTypeBallistic>(HitByDamageType) != none)
    {
        return;
    }
    // End:0x97
    if(LPPlayerPawn(MySPPawn.TakeDamageParams.DamageCauser) != none)
    {
        return;
    }
    bHitReactionEndsInDeath = ClassIsChildOf(HitByDamageType, Class'LPDamageTypeCrabChargeBrush') || ClassIsChildOf(HitByDamageType, Class'LPDamageTypeCrabChargeStrike');
    MySPPawn.Mesh.RootMotionMode = 3;
    StopFullBodyAnimation();
    bPlayingHitReaction = true;
    UserData = 1;
    PlayAnimation();
    UserData = 0;
    //return;    
}

function GetAnimTemplateToPlay()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x1B
    if(!bPlayingHitReaction)
    {
        return GetBestSequenceTemplateByIndex(0);
    }
    return GetBestSequenceTemplateByIndex(1);
    //return ReturnValue;    
}

function GetAnimTemplateTreeForSpecialMove()
{
    local /*0x97E50000-0x00000000*/ private @NULL ReturnValue[92274689];

    // End:0x61
    if(bPlayingHitReaction)
    {
        // End:0x61
        if((MySPPawn != none) && MySPPawn.HitReactLogicAnimTree != none)
        {
            return MySPPawn.HitReactLogicAnimTree;
        }
    }
    return super.GetAnimTemplateTreeForSpecialMove();
    //return ReturnValue;    
}

function SPSMAnimationFinishedCB()
{
    local /*0x97E50000-0x00000000*/ private @NULL Node[8388609];
    local /*0x97E50000-0x00000000*/ private int InUserData[8388609];
    local /*0x97E50000-0x00000000*/ private bool bInterrupted[8388609];

    super.SPSMAnimationFinishedCB(Node, InUserData, bInterrupted);
    // End:0x5D
    if(InUserData == 1)
    {
        bPlayingHitReaction = false;
        // End:0x5A
        if(!bHitReactionEndsInDeath)
        {
            PlayAnimation();
        }        
    }
    else
    {
        bDeathAnimDone = true;
    }
    //return;    
}

function InitAnimations()
{
    local /*0x97E50000-0x00000000*/ private editfixedsize array Temp;

    super(SPSpecialMove).InitAnimations();
    MySPPawn.HitReactLogicAnimTree.FindAnimNodes(AnimationTemplateNodeNames, Temp, Class'SPEngine.SPAnimNodeTemplateLogicNamedRoot');
    AnimationTemplates[1] = Temp[1];
    //return;    
}

defaultproperties
{
    TranslationExtraction=ERootBoneAxis.RBA_Translate
    RotationExtraction=ERootRotationOption.RRO_Extract
    BlendOutTime=-1.0000000
    bEndSpecialMoveOnAnimFinish=false
    AnimationTemplateNodeNames=/* Array type was not detected. */
}