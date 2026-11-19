class LPDamageReactionManagerDongo extends LPDamageReactionManagerSnowCrab
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyDongoPawn;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    MyDongoPawn = LPAIPawnDongo(inPawn);
    super.InitWithPawn(inPawn);
    //return;    
}

function CanVSMeleeDamageCore()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return true;
    //return ReturnValue;    
}

function CanBeStunnedByGrenade()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return !MyDongoPawn.IsStunned();
    //return ReturnValue;    
}

function CanBeFlippedByGrenade()
{
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    return (!MyDongoPawn.IsDoingSpecialMove(Class'LPSM_DongoGrenadeFlipIn') && !MyDongoPawn.IsDoingSpecialMove(Class'LPSM_DongoGrenadeFlipHold')) && !MyDongoPawn.IsGrabbed();
    //return ReturnValue;    
}

function DHD_GrenadeStunReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], scCon;

    scCon = LPAIControllerBaseSnowCrab(LPC);
    // End:0xE9
    if(scCon != none)
    {
        scCon.CmdHitReactionToStun(MyCrabPawn.TuneDataIceCrab.DurationOfGrenadeStun.GetValue(), Class'LPSM_DongoGrenadeFlipHold', Class'LPSM_DongoGrenadeFlipIn', Class'LPSM_DongoGrenadeFlipOut', LPPawn(MyLPPawn.TakeDamageParams.InstigatedByPawn));
    }
    // End:0x10B
    if(HitCoreIndex >= 0)
    {
        DHD_CoreHitReaction(LPC);
    }
    //return;    
}

function DHD_GrenadeHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], scCon;

    scCon = LPAIControllerBaseSnowCrab(LPC);
    // End:0xE1
    if(scCon != none)
    {
        scCon.CmdHitReactionToStun(MyCrabPawn.TuneDataIceCrab.DurationOfGrenadeStun.GetValue(), Class'LPSM_SnowCrabGrenadeStun', Class'LPSM_SnowCrabGrenadeStun',, LPPawn(MyLPPawn.TakeDamageParams.InstigatedByPawn));
    }
    // End:0x103
    if(HitCoreIndex >= 0)
    {
        DHD_CoreHitReaction(LPC);
    }
    //return;    
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
        if((SqDistanceToDamage < SqDistanceGetStunned) && CanBeFlippedByGrenade())
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
        // End:0x30B
        if(bIsVSMeleeDamage)
        {
            // End:0x20E
            if(MyDongoPawn.IsStunned())
            {
                SetAIReactionDelegate(DHD_NonCoreHitByVSWhileStunned);                
            }
            else
            {
                // End:0x2ED
                if(((MyAkridPawn.TakeDamageParams.DamageType == Class'LPDamageTypeVSMeleeShoulderCharge') || MyAkridPawn.TakeDamageParams.DamageType == Class'LPDamageTypeVSMeleeEndCombo') || MyAkridPawn.TakeDamageParams.DamageType == Class'LPDamageTypeVSMeleeTwoHandBash')
                {
                    SetAIReactionDelegate(DHD_MeleeStunReaction);                    
                }
                else
                {
                    SetAIReactionDelegate(DHD_MeleeHitReaction);
                }
            }            
        }
        else
        {
            // End:0x338
            if(HitCoreIndex >= 0)
            {
                SetAIReactionDelegate(DHD_CoreHitReaction);                
            }
            else
            {
                SetAIReactionDelegate(DHD_NonCoreHitReaction);
                SetAdditiveTemplateRoot(MyCrabPawn.ATL_AdditiveHitReaction);
            }
        }
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], scCon;

    scCon = LPAIControllerBaseSnowCrab(LPC);
    SetAdditiveTemplateRoot(MyCrabPawn.ATL_AdditiveHitReaction);
    // End:0xAC
    if(scCon != none)
    {
        scCon.NotifyOfNonCoreHit(PotentialDamage, MyCrabPawn.TakeDamageParams.DamageType);
    }
    //return;    
}

function DHD_NonCoreHitByVSWhileStunned()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], Con;

    SetAdditiveTemplateRoot(MyCrabPawn.ATL_AdditiveHitReaction);
    // End:0x11D
    if(MyDongoPawn.IsDoingSpecialMove_OF_Class(Class'LPSM_SnowCrabFailedVsChargeStun'))
    {
        Con = LPAIControllerDongo(LPC);
        Con.CmdHitReactionToStun(MyCrabPawn.TuneDataIceCrab.DurationOfGrenadeStun.GetValue(), Class'LPSM_SnowCrabFailedVsChargeStun',,, LPPawn(MyLPPawn.TakeDamageParams.InstigatedByPawn));
    }
    //return;    
}

function DHD_MeleeStunReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], Con;

    Con = LPAIControllerDongo(LPC);
    Con.CmdHitReactionToStun(MyCrabPawn.TuneDataIceCrab.DurationOfGrenadeStun.GetValue(), Class'LPSM_SnowCrabFailedVsChargeStun', Class'LPSM_DirectionalHitReactionAI',, LPPawn(MyLPPawn.TakeDamageParams.InstigatedByPawn));
    //return;    
}
