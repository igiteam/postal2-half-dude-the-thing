class LPDamageReactionManagerVsISS extends LPDamageReactionManagerMech
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyVsIsenberg;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MyVsIsenberg = LPAIPawnVSISS(inPawn);
    //return;    
}

function ServerCacheDamageAttributes()
{
    super.ServerCacheDamageAttributes();
    // End:0x89
    if(class<LPDamageTypeBallistic>(MyVsIsenberg.TakeDamageParams.DamageType) != none)
    {
        MyVsIsenberg.TakeDamageParams.Momentum = vect(0.0000000, 0.0000000, 0.0000000);
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
    // End:0x26
    if(MyVsIsenberg.Health <= 0)
    {
        return;
    }
    // End:0x53
    if(HitCoreIndex >= 0)
    {
        SetAIReactionDelegate(DHD_CoreHitReaction);        
    }
    else
    {
        SetAIReactionDelegate(DHD_NonCoreHitReaction);
    }
    //return;    
}

function CoreTakeDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private byte CanDamageCoreOption[9437185];
    local /*0x97E50000-0x00000000*/ private bool ReturnValue[92274689];

    0
    // End:0x165
    if((MyVsIsenberg.bDamageOnlyWhenStunned && !MyVsIsenberg.bStunned) && int(MyVsIsenberg.GetMainCore()) != int(4))
    {
        MyVsIsenberg.StunnedHealth -= float(MyVsIsenberg.TakeDamageParams.Damage);
        MyVsIsenberg.TakeDamageParams.Damage = 0;
        // End:0x163
        if(MyVsIsenberg.StunnedHealth <= float(0))
        {
            LPAIControllerVSISS(MyVsIsenberg.Controller).Stunned();
        }
        return false;
    }
    return super(LPDamageReactionManagerAI).CoreTakeDamage(CoreTag, CanDamageCoreOption);
    //return ReturnValue;    
}

function GetCoreIdToApplyDamage()
{
    local /*0x97E50000-0x00000000*/ private @NULL CoreTag[8388609];
    local /*0x97E50000-0x00000000*/ private int ReturnValue[92274689], CoreID;

    CoreID = CoreTag.GetCoreId();
    // End:0xD4
    if((CoreID == 3) || CoreID == 4)
    {
        // End:0x78
        if(MyVsIsenberg.GetCoreHealth(0) > float(0))
        {
            return 0;            
        }
        else
        {
            // End:0xA7
            if(MyVsIsenberg.GetCoreHealth(2) > float(0))
            {
                return 2;                
            }
            else
            {
                // End:0xD4
                if(MyVsIsenberg.GetCoreHealth(1) > float(0))
                {
                    return 1;                    
                }
            }
        }
    }
    // End:0x15B
    if(CoreID == 1)
    {
        // End:0x15B
        if((MyVsIsenberg.GetCoreHealth(1) / MyVsIsenberg.GetCoreMaxHealth(1)) < 0.5000000)
        {
            // End:0x15B
            if(MyVsIsenberg.GetCoreHealth(2) > float(0))
            {
                return 2;
            }
        }
    }
    return CoreID;
    //return ReturnValue;    
}

function SetHitCoreProperties()
{
    super(LPDamageReactionManagerAI).SetHitCoreProperties();
    //return;    
}

function DHD_CoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x71
    if(LPC != none)
    {
        LPC.NotifyOfCoreHit(HitCoreIndex, PotentialDamage, MyVsIsenberg.TakeDamageParams.DamageType);
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609];

    // End:0x68
    if(LPC != none)
    {
        LPC.NotifyOfNonCoreHit(PotentialDamage, MyVsIsenberg.TakeDamageParams.DamageType);
    }
    //return;    
}
