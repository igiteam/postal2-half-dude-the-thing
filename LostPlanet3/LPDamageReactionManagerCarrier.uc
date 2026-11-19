class LPDamageReactionManagerCarrier extends LPDamageReactionManagerAkrid
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyCarrierPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SqDistanceGetStunned;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SqDistanceHitReaction;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float DistanceThreshold;

    super.InitWithPawn(inPawn);
    MyCarrierPawn = LPAIPawnCarrier(inPawn);
    DistanceThreshold = MyCarrierPawn.TuneDataCarrier.DistanceGrenadeStunned.GetValue();
    SqDistanceGetStunned = DistanceThreshold * DistanceThreshold;
    DistanceThreshold = MyCarrierPawn.TuneDataCarrier.DistanceGrenadeReaction.GetValue();
    SqDistanceHitReaction = DistanceThreshold * DistanceThreshold;
    //return;    
}

function ServerCacheDamageAttributes()
{
    super.ServerCacheDamageAttributes();
    // End:0x89
    if(class<LPDamageTypeBallistic>(MyCarrierPawn.TakeDamageParams.DamageType) != none)
    {
        MyCarrierPawn.TakeDamageParams.Momentum = vect(0.0000000, 0.0000000, 0.0000000);
    }
    //return;    
}

function CanDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return super(LPDamageReactionManagerAI).CanDamageCore(CoreTag);
    //return ReturnValue;    
}

function StartDotOnOtherCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL DOTInfo[25296897];
    local /*0x97E50000-0x00000000*/ private int CoreIdx[8388609];

    super(LPDamageReactionManagerAI).StartDotOnOtherCore(DOTInfo, CoreIdx);
    // End:0xFF
    if(((ClassIsChildOf(DOTInfo.DamageType, Class'LPDamageTypeVSWelderDOT') || ClassIsChildOf(DOTInfo.DamageType, Class'LPDamageTypeVSWelder')) || ClassIsChildOf(DOTInfo.DamageType, Class'LPDamageTypeARIncendiaryDOT')) || ClassIsChildOf(DOTInfo.DamageType, Class'LPDamageTypeARIncendiary'))
    {
        MyCarrierPawn.FireStartedInCore(DOTInfo, CoreIdx);
    }
    //return;    
}

function SetDefaultDamageReaction()
{
    local /*0x97E50000-0x00000000*/ private float SqDistanceToDamage;

    // End:0x26
    if(MyCarrierPawn.Health <= 0)
    {
        return;
    }
    // End:0x1A3
    if(class<LPDamageType>(MyCarrierPawn.TakeDamageParams.DamageType).default.bCausesExplosiveReactions)
    {
        SqDistanceToDamage = VSizeSq2D(MyCarrierPawn.TakeDamageParams.DamageCauser.Location - myAIPawn.Location);
        // End:0x128
        if(SqDistanceToDamage < SqDistanceGetStunned)
        {
            SetAIReactionDelegate(DHD_GrenadeStunReaction);            
        }
        else
        {
            // End:0x15D
            if(SqDistanceToDamage < SqDistanceHitReaction)
            {
                SetAIReactionDelegate(DHD_GrenadeHitReaction);                
            }
            else
            {
                SetAIReactionDelegate(None);
                SetAdditiveTemplateRoot(MyCarrierPawn.ATL_AdditiveHitReaction);
            }
        }        
    }
    else
    {
        // End:0x1C2
        if(bIsVSMeleeDamage)
        {
            // End:0x1BF
            if(TryVSMeleeDamageReaction())
            {
                return;
            }            
        }
        else
        {
            // End:0x1EF
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
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn;
    local /*0x97E50000-0x00000000*/ private bool bIsStunned, bIsTooHandBash, bIsShoulderCharge, bAdditive, bFullBody, bStun,
	    bAllCellsDestroyed;

    local /*0x97E50000-0x00000000*/ private int NumCellsToExpose;

    // End:0x11
    if(!bIsVSMeleeDamage)
    {
        return false;
    }
    vsPawn = LPVSPlayerPawn(myAIPawn.TakeDamageParams.InstigatedByPawn);
    bIsShoulderCharge = ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeShoulderCharge');
    bIsTooHandBash = ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeTwoHandBash');
    bIsStunned = (MyCarrierPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_CarrierStunStart') || MyCarrierPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_CarrierStunHold')) || MyCarrierPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_CarrierStunFinish');
    bAllCellsDestroyed = MyCarrierPawn.AreCellsOnSideDestroyed(2);
    // End:0x22D
    if(bIsStunned && bIsTooHandBash || bAllCellsDestroyed)
    {
        bAdditive = true;
        NumCellsToExpose = int(MyCarrierPawn.TuneDataCarrier.NumCellsToExposeFrom_NormalMelee.GetValue());        
    }
    else
    {
        // End:0x2AF
        if(!bAllCellsDestroyed && bIsShoulderCharge)
        {
            bFullBody = true;
            NumCellsToExpose = int(MyCarrierPawn.TuneDataCarrier.NumCellsToExposeFrom_ShoulderCharge.GetValue());            
        }
        else
        {
            // End:0x408
            if((bIsTooHandBash || bIsShoulderCharge) || HasReachedVSMeleeStunThreshold())
            {
                // End:0x33F
                if(bIsTooHandBash)
                {
                    NumCellsToExpose = int(MyCarrierPawn.TuneDataCarrier.NumCellsToExposeFrom_TwoHandBash.GetValue());                    
                }
                else
                {
                    // End:0x3A4
                    if(bIsShoulderCharge)
                    {
                        NumCellsToExpose = int(MyCarrierPawn.TuneDataCarrier.NumCellsToExposeFrom_ShoulderCharge.GetValue());                        
                    }
                    else
                    {
                        NumCellsToExpose = int(MyCarrierPawn.TuneDataCarrier.NumCellsToExposeFrom_ComboThirdHit.GetValue());
                    }
                }
                bStun = true;                
            }
            else
            {
                // End:0x495
                if(HasReachedVSMeleeFullHitReactionThreshold())
                {
                    // End:0x431
                    if(bAllCellsDestroyed)
                    {
                        bStun = true;                        
                    }
                    else
                    {
                        NumCellsToExpose = int(MyCarrierPawn.TuneDataCarrier.NumCellsToExposeFrom_ComboThirdHit.GetValue());
                        bFullBody = true;
                    }                    
                }
                else
                {
                    bAdditive = true;
                    NumCellsToExpose = int(MyCarrierPawn.TuneDataCarrier.NumCellsToExposeFrom_NormalMelee.GetValue());
                }
            }
        }
    }
    MyCarrierPawn.MyCarrierController.StartArbitraryDefenderLaunch(NumCellsToExpose, vsPawn, MyCarrierPawn.TuneDataCarrier.bShouldSpreadLaunchedDefendersEvenlyOverBothSidesOfHiveWhenTakingVsMeleeHit, MyCarrierPawn.TuneDataCarrier.bShouldBiasLaunchedDefendersTowardsTopOfHiveWhenTakingTakingVsMeleeHit, 0.0000000, MyCarrierPawn.TuneDataCarrier.MinDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit.GetValue(), MyCarrierPawn.TuneDataCarrier.MaxDelayBeforeProtectingCellsAfterDefenderLaunchWhenTakingVsMeleeHit.GetValue(), MyCarrierPawn.TuneDataCarrier.MinDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit.GetValue(), MyCarrierPawn.TuneDataCarrier.MaxDelayBeforeUnclaimingCellsAfterDefenderLaunchWhenTakingVsMeleeHit.GetValue());
    // End:0x725
    if(bAdditive)
    {
        SetAIReactionDelegate(None);
        SetAdditiveTemplateRoot(MyCarrierPawn.ATL_AdditiveHitReaction);
        return true;        
    }
    else
    {
        // End:0x761
        if(bFullBody)
        {
            SetAIReactionDelegate(DHD_MeleeHitReaction);
            AccumulatedMeleeDamageForFullHitReaction = 0.0000000;
            return true;            
        }
        else
        {
            // End:0x7A9
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

function DHD_MeleeStunReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], scCon;

    scCon = LPAIControllerCarrier(LPC);
    // End:0xE9
    if(scCon != none)
    {
        scCon.CmdHitReactionToStun(MyAkridPawn.TuneDataAIPawn.VSMeleeStunDuration.GetValue(), Class'LPSM_CarrierStunHold', Class'LPSM_CarrierStunStart', Class'LPSM_CarrierStunFinish', LPPawn(MyLPPawn.TakeDamageParams.InstigatedByPawn));
    }
    //return;    
}

function DHD_MeleeHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    LPC.CmdHitReaction(MyAkridPawn.TuneDataAIPawn.VSMeleeDamagePauseDuration.GetValue(), Class'LPSM_DirectionalHitReactionCarrierVS');
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
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], scCon;

    scCon = LPAIControllerCarrier(LPC);
    // End:0xE9
    if(scCon != none)
    {
        scCon.CmdHitReactionToStun(MyCarrierPawn.TuneDataCarrier.DurationOfGrenadeStun.GetValue(), Class'LPSM_CarrierStunHold', Class'LPSM_CarrierStunStart', Class'LPSM_CarrierStunFinish', LPPawn(MyLPPawn.TakeDamageParams.InstigatedByPawn));
    }
    //return;    
}

function DHD_CoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x71
    if(LPC != none)
    {
        LPC.NotifyOfCoreHit(HitCoreIndex, PotentialDamage, MyCarrierPawn.TakeDamageParams.DamageType);
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x68
    if(LPC != none)
    {
        LPC.NotifyOfNonCoreHit(PotentialDamage, MyCarrierPawn.TakeDamageParams.DamageType);
    }
    //return;    
}
