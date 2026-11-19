class LPDamageReactionManagerSnowCrab extends LPDamageReactionManagerAkrid
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyCrabPawn;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SqDistanceGetStunned;
var(0.25_Pct) /*0x97E50000-0x00000000*/ private float SqDistanceHitReaction;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];
    local /*0x97E50000-0x00000000*/ private float DistanceThreshold;

    super.InitWithPawn(inPawn);
    MyCrabPawn = LPAIPawnBaseSnowCrab(inPawn);
    DistanceThreshold = MyCrabPawn.TuneDataIceCrab.DistanceGrenadeStunned.GetValue();
    SqDistanceGetStunned = DistanceThreshold * DistanceThreshold;
    DistanceThreshold = MyCrabPawn.TuneDataIceCrab.DistanceGrenadeReaction.GetValue();
    SqDistanceHitReaction = DistanceThreshold * DistanceThreshold;
    //return;    
}

function ServerCacheDamageAttributes()
{
    super.ServerCacheDamageAttributes();
    // End:0x89
    if(class<LPDamageTypeBallistic>(MyCrabPawn.TakeDamageParams.DamageType) != none)
    {
        MyCrabPawn.TakeDamageParams.Momentum = vect(0.0000000, 0.0000000, 0.0000000);
    }
    //return;    
}

function CanVSMeleeDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL FacingDir, DeltaToDamager;

    // End:0x135
    if((CoreTag != none) && CoreTag.GetCoreId() == 4)
    {
        FacingDir = Vector(MyAkridPawn.Rotation);
        FacingDir.Z = 0.0000000;
        DeltaToDamager = MyAkridPawn.TakeDamageParams.DamageCauser.Location - MyAkridPawn.Location;
        DeltaToDamager.Z = 0.0000000;
        // End:0x135
        if((FacingDir Dot DeltaToDamager) <= 0.0000000)
        {
            return true;
        }
    }
    return super(LPDamageReactionManagerAI).CanVSMeleeDamageCore(CoreTag);
    //return ReturnValue;    
}

function CanDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];
    local /*0x97E50000-0x00000000*/ private @NULL grenWep, theBoom;

    // End:0x2C
    if(LPAIPawnDongo(MyCrabPawn) != none)
    {
        return super(LPDamageReactionManagerAI).CanDamageCore(CoreTag);
    }
    // End:0x172
    if(((CoreTag != none) && CoreTag.GetCoreId() == 7) && ClassIsChildOf(MyAkridPawn.TakeDamageParams.DamageCauser.Class, Class'LPExplosionActor'))
    {
        theBoom = LPExplosionActor(MyAkridPawn.TakeDamageParams.DamageCauser);
        grenWep = LPProj_Grenade(theBoom.TheWeaponThatSpawnedMe);
        // End:0x172
        if(grenWep != none)
        {
            // End:0x170
            if(MyCrabPawn.DoesAkridHaveThisGrenadeStuckToThisCore(7, grenWep))
            {
                return true;                
            }
            else
            {
                return false;
            }
        }
    }
    return super(LPDamageReactionManagerAI).CanDamageCore(CoreTag);
    //return ReturnValue;    
}

function CanBeStunnedByGrenade()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return Class'SPEngine.SPUtil'.static.IsSinglePlayerGame();
    //return ReturnValue;    
}

function SetDefaultDamageReaction()
{
    local /*0x97E50000-0x00000000*/ private float SqDistanceToDamage;

    // End:0x26
    if(MyCrabPawn.Health <= 0)
    {
        return;
    }
    // End:0x1C1
    if(class<LPDamageType>(MyCrabPawn.TakeDamageParams.DamageType).default.bCausesExplosiveReactions)
    {
        SqDistanceToDamage = VSizeSq2D(MyCrabPawn.TakeDamageParams.DamageCauser.Location - myAIPawn.Location);
        // End:0x137
        if((SqDistanceToDamage < SqDistanceGetStunned) && CanBeStunnedByGrenade())
        {
            SetAIReactionDelegate(DHD_GrenadeStunReaction);            
        }
        else
        {
            // End:0x17B
            if((SqDistanceToDamage < SqDistanceHitReaction) && CanBeStunnedByGrenade())
            {
                SetAIReactionDelegate(DHD_GrenadeHitReaction);                
            }
            else
            {
                SetAIReactionDelegate(None);
                SetAdditiveTemplateRoot(MyCrabPawn.ATL_AdditiveHitReaction);
            }
        }        
    }
    else
    {
        // End:0x23E
        if(bIsVSMeleeDamage)
        {
            // End:0x22C
            if(LPAIControllerBaseSnowCrab(MyCrabPawn.Controller).IsDoingKnockOut())
            {
                SetAIReactionDelegate(DHD_KnockOutVS_NoReaction);                
            }
            else
            {
                // End:0x23B
                if(TryVSMeleeDamageReaction())
                {
                    return;
                }
            }            
        }
        else
        {
            // End:0x26B
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
    local /*0x97E50000-0x00000000*/ private @NULL vsPawn, VSMeleeInterruptWindow;
    local /*0x97E50000-0x00000000*/ private bool bHasAnyClaws;

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
    bHasAnyClaws = !MyCrabPawn.IsClawLeftDismembered() || !MyCrabPawn.IsClawRightDismembered();
    // End:0x219
    if(ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeShoulderCharge'))
    {
        SetAIReactionDelegate(DHD_MeleeHitReaction);
        AccumulatedMeleeDamageForFullHitReaction = 0.0000000;
        return true;        
    }
    else
    {
        // End:0x2A6
        if(ClassIsChildOf(MyLPPawn.TakeDamageParams.DamageType, Class'LPDamageTypeVSMeleeTwoHandBash') || HasReachedVSMeleeStunThreshold())
        {
            SetAIReactionDelegate(DHD_MeleeStunReaction);
            AccumulatedMeleeDamageForStun = 0.0000000;
            AccumulatedMeleeDamageForFullHitReaction = 0.0000000;
            return true;            
        }
        else
        {
            // End:0x32D
            if(HasReachedVSMeleeFullHitReactionThreshold())
            {
                // End:0x2FE
                if(!bHasAnyClaws)
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
                SetAdditiveTemplateRoot(MyCrabPawn.ATL_AdditiveHitReaction);
                return true;
            }
        }
    }
    return false;
    //return ReturnValue;    
}

function DHD_KnockOutVS_NoReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    //return;    
}

function DHD_KnockOutVS_StartReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], scCon;

    scCon = LPAIControllerBaseSnowCrab(LPC);
    scCon.CmdCrabKnockOutStrikeVs(LPPawn(MyCrabPawn.TakeDamageParams.InstigatedByPawn));
    //return;    
}

function DHD_MeleeStunReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    LPC.CmdHitReactionToStun(MyAkridPawn.TuneDataAIPawn.VSMeleeStunDuration.GetValue(), Class'LPSM_SnowCrabFailedVsChargeStun',,, LPPawn(MyLPPawn.TakeDamageParams.InstigatedByPawn));
    // End:0xD3
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

function DHD_MeleeInterruptReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    LPC.CmdHitReaction(MyAkridPawn.TuneDataAIPawn.VSMeleeDamagePauseDuration.GetValue(), Class'LPSM_DirectionalHitReactionAI_Interrupt');
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

function DHD_MeleeHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    LPC.CmdHitReaction(MyAkridPawn.TuneDataAIPawn.VSMeleeDamagePauseDuration.GetValue());
    // End:0x8F
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

    scCon = LPAIControllerBaseSnowCrab(LPC);
    // End:0xA6
    if(scCon != none)
    {
        scCon.CmdCrabHitReactionToStun(MyCrabPawn.TuneDataIceCrab.DurationOfGrenadeStun.GetValue(), Class'LPSM_SnowCrabGrenadeStun', Class'LPSM_SnowCrabFailedChargeStun');
    }
    // End:0xC8
    if(HitCoreIndex >= 0)
    {
        DHD_CoreHitReaction(LPC);
    }
    //return;    
}

function DHD_CoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], scCon;

    scCon = LPAIControllerBaseSnowCrab(LPC);
    // End:0x8D
    if(scCon != none)
    {
        scCon.NotifyOfCoreHit(HitCoreIndex, PotentialDamage, MyCrabPawn.TakeDamageParams.DamageType);
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], scCon;

    scCon = LPAIControllerBaseSnowCrab(LPC);
    // End:0x84
    if(scCon != none)
    {
        scCon.NotifyOfNonCoreHit(PotentialDamage, MyCrabPawn.TakeDamageParams.DamageType);
    }
    //return;    
}
