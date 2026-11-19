class LPDamageReactionManagerVsLaroche extends LPDamageReactionManagerMech
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVsLarochePawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int CurrentVSMeleeStunCount[536870913];
var(0.25_Pct) /*0x97E50000-0x00000000*/ private int NumPlayerActiveDefenses[536870913];

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MyVsLarochePawn = LPAIPawnVsLaroche(inPawn);
    CurrentVSMeleeStunCount = 0;
    NumPlayerActiveDefenses = 0;
    //return;    
}

function ServerCacheDamageAttributes()
{
    super.ServerCacheDamageAttributes();
    // End:0x89
    if(class<LPDamageTypeBallistic>(MyVsLarochePawn.TakeDamageParams.DamageType) != none)
    {
        MyVsLarochePawn.TakeDamageParams.Momentum = vect(0.0000000, 0.0000000, 0.0000000);
    }
    //return;    
}

function CanDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super.CanDamageCore(CoreTag);
    //return ReturnValue;    
}

function SetDefaultDamageReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL larCtrl;

    // End:0xD1
    if(MyVsLarochePawn.Health <= 0)
    {
        // End:0xCC
        if(MyVsLarochePawn != none)
        {
            larCtrl = LPAIControllerVsLaroche(MyVsLarochePawn.Controller);
            // End:0xCC
            if(larCtrl != none)
            {
                larCtrl.NeedToShutdown(LPPawn(MyVsLarochePawn.TakeDamageParams.InstigatedByPawn));
            }
        }
        return;        
    }
    else
    {
        // End:0xF0
        if(bIsVSMeleeDamage)
        {
            // End:0xED
            if(TryVSMeleeDamageReaction())
            {
                return;
            }            
        }
        else
        {
            // End:0x11D
            if(HitCoreIndex >= 0)
            {
                SetAIReactionDelegate(DHD_CoreHitReaction);                
            }
            else
            {
                SetAIReactionDelegate(DHD_NonCoreHitReaction);
            }
        }
    }
    //return;    
}

function TryVSMeleeDamageReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689], bIsStunned, bIsTooHandBash, bIsShoulderCharge, bIsEndOfCombo, bAdditive,
	    bFullBody, bStun;

    // End:0x11
    if(!bIsVSMeleeDamage)
    {
        return false;
    }
    bIsShoulderCharge = ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeShoulderCharge');
    bIsTooHandBash = ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeTwoHandBash');
    bIsEndOfCombo = ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeEndCombo');
    bIsStunned = (MyVsLarochePawn.IsDoingSpecialMove_OF_Class(Class'LPSM_VsLarocheDefaultStandingStunStart') || MyVsLarochePawn.IsDoingSpecialMove_OF_Class(Class'LPSM_VsLarocheDefaultStandingStun')) || MyVsLarochePawn.IsDoingSpecialMove_OF_Class(Class'LPSM_VsLarocheDefaultStandingStunEnd');
    // End:0x1BF
    if(bIsStunned && (bIsShoulderCharge || bIsTooHandBash) || bIsEndOfCombo)
    {
        bAdditive = true;        
    }
    else
    {
        // End:0x1DB
        if(bIsShoulderCharge)
        {
            bFullBody = true;            
        }
        else
        {
            // End:0x215
            if((bIsTooHandBash || bIsShoulderCharge) || HasReachedVSMeleeStunThreshold())
            {
                bStun = true;                
            }
            else
            {
                // End:0x231
                if(HasReachedVSMeleeFullHitReactionThreshold())
                {
                    bFullBody = true;                    
                }
                else
                {
                    bAdditive = true;
                }
            }
        }
    }
    // End:0x292
    if(bAdditive)
    {
        SetAIReactionDelegate(None);
        SetAdditiveTemplateRoot(MyVsLarochePawn.ATL_AdditiveHitReaction);
        return true;        
    }
    else
    {
        // End:0x2CE
        if(bFullBody)
        {
            SetAIReactionDelegate(DHD_MeleeHitReaction);
            AccumulatedMeleeDamageForFullHitReaction = 0.0000000;
            return true;            
        }
        else
        {
            // End:0x316
            if(bStun)
            {
                SetAIReactionDelegate(DHD_MeleeStunReaction);
                AccumulatedMeleeDamageForStun = 0.0000000;
                AccumulatedMeleeDamageForFullHitReaction = 0.0000000;
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function HasReachedVSMeleeStunThreshold()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private float MultiplierToUse;

    // End:0x9D
    if((CurrentVSMeleeStunCount > 0) && CurrentVSMeleeStunCount < MyVsLarochePawn.TuneDataVsLaroche.VSMeleeDamageRequiredToStunMultiplierSequence.Length)
    {
        MultiplierToUse = MyVsLarochePawn.TuneDataVsLaroche.VSMeleeDamageRequiredToStunMultiplierSequence[CurrentVSMeleeStunCount];        
    }
    else
    {
        MultiplierToUse = 1.0000000;
    }
    // End:0x110
    if(AccumulatedMeleeDamageForStun >= (MultiplierToUse * MyVsLarochePawn.TuneDataPawn.VSMeleeDamageForStun.GetValue()))
    {
        return true;
    }
    return false;
    //return ReturnValue;    
}

function DHD_MeleeStunReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], scCon;

    scCon = LPAIControllerVsLaroche(LPC);
    // End:0x273
    if(scCon != none)
    {
        // End:0x122
        if(CurrentVSMeleeStunCount == 0)
        {
            scCon.HandleBossFightPhaseEventMessage(scCon.Enemy, 21);
            scCon.TimeForNextNotifySawGeneratorNotDestroyedYetEvent = scCon.WorldInfo.TimeSeconds + scCon.VsLarochePawn.GetTimeBetweenFiringDialogForNotifySawGeneratorNotDestroyedYetEvent();
            scCon.bNotifySawGeneratorNotDestroyedYet1DialogPlayed = false;
        }
        ++CurrentVSMeleeStunCount;
        scCon.bForceNotAllowedToPerformActiveDefense = false;
        LPPlayerController(MyLPPawn.TakeDamageParams.InstigatedByPawn.Controller).CompletedTutorialMode(14);
        scCon.CmdHitReactionToStun(MyVsLarochePawn.TuneDataAIPawn.VSMeleeStunDuration.GetValue(), Class'LPSM_VsLarocheDefaultStandingStun', Class'LPSM_VsLarocheDefaultStandingStunStart', Class'LPSM_VsLarocheDefaultStandingStunEnd', LPPawn(MyLPPawn.TakeDamageParams.InstigatedByPawn));
    }
    //return;    
}

function DHD_MeleeHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    LPC.CmdHitReaction(MyVsLarochePawn.TuneDataAIPawn.VSMeleeDamagePauseDuration.GetValue(), Class'LPSM_DirectionalHitReactionVsLaRocheVs');
    // End:0x97
    if(HitCoreIndex >= 0)
    {
        DHD_CoreHitReaction(LPC);        
    }
    else
    {
        DHD_NonCoreHitReaction(LPC);
    }
    //return;    
}

function DHD_GrenadeHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    LPC.CmdHitReaction(0.0000000);
    // End:0x48
    if(HitCoreIndex >= 0)
    {
        DHD_CoreHitReaction(LPC);
    }
    //return;    
}

function DHD_GrenadeStunReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    //return;    
}

function DHD_CoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x71
    if(LPC != none)
    {
        LPC.NotifyOfCoreHit(HitCoreIndex, PotentialDamage, MyVsLarochePawn.TakeDamageParams.DamageType);
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x68
    if(LPC != none)
    {
        LPC.NotifyOfNonCoreHit(PotentialDamage, MyVsLarochePawn.TakeDamageParams.DamageType);
    }
    //return;    
}
