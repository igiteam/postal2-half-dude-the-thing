class LPDamageReactionManagerSpitter extends LPDamageReactionManagerAkrid
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MySpitterPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SqDistanceGetStunned;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MySpitterPawn = LPAIPawnSpitter(inPawn);
    SqDistanceGetStunned = MySpitterPawn.TuneDataSpitter.DistanceGrenadeStunned.GetValue();
    SqDistanceGetStunned = SqDistanceGetStunned * SqDistanceGetStunned;
    //return;    
}

function ServerCacheDamageAttributes()
{
    super.ServerCacheDamageAttributes();
    // End:0x89
    if(class<LPDamageTypeBallistic>(MySpitterPawn.TakeDamageParams.DamageType) != none)
    {
        MySpitterPawn.TakeDamageParams.Momentum = vect(0.0000000, 0.0000000, 0.0000000);
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

function SetDefaultDamageReaction()
{
    local /*0x97E50000-0x00000000*/ private float SqDistanceToDamage;

    // End:0x26
    if(MySpitterPawn.Health <= 0)
    {
        return;
    }
    // End:0x47
    if(bIsVSMeleeDamage && TryVSMeleeDamageReaction())
    {
        return;        
    }
    else
    {
        // End:0xCC
        if(MySpitterPawn.bTailBreakHitReactionRequired)
        {
            // End:0xA8
            if(!MySpitterPawn.IsStunned())
            {
                SetAIReactionDelegate(DHD_TailBreak);
            }
            MySpitterPawn.bTailBreakHitReactionRequired = false;            
        }
        else
        {
            // End:0x210
            if(class<LPDamageType>(MySpitterPawn.TakeDamageParams.DamageType).default.bCausesExplosiveReactions)
            {
                // End:0x20D
                if(!ClassIsChildOf(MySpitterPawn.TakeDamageParams.DamageType, Class'LPDamageTypeSpitterTailExplosion'))
                {
                    SqDistanceToDamage = VSizeSq2D(MySpitterPawn.TakeDamageParams.DamageCauser.Location - myAIPawn.Location);
                    // End:0x20D
                    if(SqDistanceToDamage < SqDistanceGetStunned)
                    {
                        SetAIReactionDelegate(DHD_GrenadeStunReaction);
                    }
                }                
            }
            else
            {
                // End:0x282
                if(((HitCoreIndex == 1) || HitCoreIndex == 2) && bCoreDestroyed_ServerOnly)
                {
                    // End:0x27F
                    if(!MySpitterPawn.IsStunned())
                    {
                        SetAIReactionDelegate(DHD_FallDownReaction);
                    }                    
                }
                else
                {
                    // End:0x2AF
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
        }
    }
    //return;    
}

function TryVSMeleeDamageReaction()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, VSMeleeInterruptWindow;
    local /*0x97E50000-0x00000000*/ private bool bIsTailDismembered, bIsTailDisabled, bIsShoulderCharge, bIsTooHandBash, bIsEndOfCombo;

    // End:0x11
    if(!bIsVSMeleeDamage)
    {
        return false;
    }
    // End:0x158
    if(ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeFirstHit'))
    {
        vsPawn = LPVSPlayerPawn(myAIPawn.TakeDamageParams.InstigatedByPawn);
        // End:0x158
        if(vsPawn != none)
        {
            // End:0x158
            if(vsPawn.GetBestVSMeleeInterruptCombatWindow(myAIPawn, VSMeleeInterruptWindow))
            {
                myAIPawn.TemplateLogicData.CombatWindowName = VSMeleeInterruptWindow.CombatWindow.WindowName;
                SetAIReactionDelegate(DHD_MeleeInterruptReaction);
                return true;
            }
        }
    }
    bIsTailDismembered = MySpitterPawn.IsTailDestroyed();
    bIsTailDisabled = MySpitterPawn.MySpitterController.IsTailBurning();
    bIsShoulderCharge = ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeShoulderCharge');
    bIsTooHandBash = ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeTwoHandBash');
    bIsEndOfCombo = ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeEndCombo');
    // End:0x330
    if(MySpitterPawn.IsStunned() && (bIsShoulderCharge || bIsTooHandBash) || bIsEndOfCombo)
    {
        SetAIReactionDelegate(None);
        SetAdditiveTemplateRoot(MySpitterPawn.ATL_AdditiveHitReaction);
        return true;        
    }
    else
    {
        // End:0x37D
        if(!bIsTailDismembered && bIsShoulderCharge)
        {
            SetAIReactionDelegate(DHD_MeleeHitReaction);
            AccumulatedMeleeDamageForFullHitReaction = 0.0000000;
            return true;            
        }
        else
        {
            // End:0x3F7
            if((bIsTooHandBash || bIsShoulderCharge) || !bIsTailDisabled && HasReachedVSMeleeStunThreshold())
            {
                SetAIReactionDelegate(DHD_MeleeStunReaction);
                AccumulatedMeleeDamageForStun = 0.0000000;
                AccumulatedMeleeDamageForFullHitReaction = 0.0000000;
                return true;                
            }
            else
            {
                // End:0x47C
                if(HasReachedVSMeleeFullHitReactionThreshold())
                {
                    // End:0x44D
                    if(bIsTailDismembered)
                    {
                        SetAIReactionDelegate(DHD_MeleeStunReaction);
                        AccumulatedMeleeDamageForStun = 0.0000000;
                        AccumulatedMeleeDamageForFullHitReaction = 0.0000000;                        
                    }
                    else
                    {
                        SetAIReactionDelegate(DHD_MeleeHitReaction);
                        AccumulatedMeleeDamageForFullHitReaction = 0.0000000;
                    }
                    return true;                    
                }
                else
                {
                    SetAIReactionDelegate(None);
                    SetAdditiveTemplateRoot(MySpitterPawn.ATL_AdditiveHitReaction);
                    return true;
                }
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function DHD_FallDownReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x47
    if(HitCoreIndex == 1)
    {
        MySpitterPawn.MySpitterController.CmdSpitterHobble();        
    }
    else
    {
        // End:0x8C
        if(HitCoreIndex == 2)
        {
            MySpitterPawn.MySpitterController.CmdSpitterHobble();
        }
    }
    //return;    
}

function DHD_GrenadeStunReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    MySpitterPawn.MySpitterController.CmdSpitterHobble();
    //return;    
}

function DHD_TailBreak()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    MySpitterPawn.MySpitterController.CmdSpitterTailBreakReaction();
    //return;    
}

function DHD_MeleeHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    LPC.CmdHitReaction(MyAkridPawn.TuneDataAIPawn.VSMeleeDamagePauseDuration.GetValue(), Class'LPSM_DirectionalHitReactionSpitter');
    //return;    
}

function DHD_MeleeInterruptReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    LPC.CmdHitReaction(MyAkridPawn.TuneDataAIPawn.VSMeleeDamagePauseDuration.GetValue(), Class'LPSM_DirectionalHitReactionAI_Interrupt');
    //return;    
}

function DHD_MeleeStunReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    LPAIControllerSpitter(LPC).CmdSpitterStun(MySpitterPawn.TakeDamageParams.InstigatedByPawn);
    //return;    
}

function DHD_CoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], SpitterController;
    local /*0x97E50000-0x00000000*/ private bool bHitInterruptingCore;

    SpitterController = LPAIControllerSpitter(LPC);
    // End:0x214
    if(SpitterController != none)
    {
        SpitterController.NotifyOfCoreHit(HitCoreIndex, PotentialDamage, MySpitterPawn.TakeDamageParams.DamageType);
        bHitInterruptingCore = MySpitterPawn.CanCoreDamageInterruptTailAttack(HitCoreIndex, MySpitterPawn.TakeDamageParams.DamageType);
        // End:0x1D2
        if((((bHitInterruptingCore && !MySpitterPawn.IsStunned()) && SpitterController.IsTailIntact()) && MySpitterPawn.IsInInterrupibleTailAttack()) && MySpitterPawn.HaveAccumulatedDamageForTailReaction())
        {
            MySpitterPawn.ResetDamageTracker();
            SpitterController.CmdSpitterTailAttackAbortWithHitReaction();            
        }
        else
        {
            // End:0x214
            if(MySpitterPawn.IsDoingSpitAttack(true))
            {
                MySpitterPawn.StartAdditiveTailHitWhileSpittingAnimation();
            }
        }
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], SpitterController, VsPawnThatHitMe;

    SpitterController = LPAIControllerSpitter(LPC);
    // End:0x205
    if((SpitterController != none) && !MySpitterPawn.IsStunned())
    {
        SpitterController.NotifyOfNonCoreHit(PotentialDamage, MySpitterPawn.TakeDamageParams.DamageType);
        // End:0x205
        if(ClassIsChildOf(MySpitterPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMelee'))
        {
            // End:0x162
            if(!SpitterController.IsTailIntact())
            {
                SpitterController.CmdSpitterStun(MySpitterPawn.TakeDamageParams.InstigatedByPawn);                
            }
            else
            {
                VsPawnThatHitMe = LPBaseVSPlayerPawn(MySpitterPawn.TakeDamageParams.InstigatedByPawn);
                // End:0x205
                if((VsPawnThatHitMe != none) && !SpitterController.IsStriking())
                {
                    SpitterController.CmdTailStingResponseToVsHit(VsPawnThatHitMe);
                }
            }
        }
    }
    //return;    
}
