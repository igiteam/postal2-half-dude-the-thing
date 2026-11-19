class LPDamageReactionManagerSentinel extends LPDamageReactionManagerAkrid
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MySentinelPawn;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MySentinelPawn = LPAIPawnSentinel(inPawn);
    //return;    
}

function ServerCacheDamageAttributes()
{
    super.ServerCacheDamageAttributes();
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
    // End:0x26
    if(MySentinelPawn.Health <= 0)
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
        SetAdditiveTemplateRoot(MySentinelPawn.ATL_AdditiveHitReaction);
    }
    //return;    
}

simulated function ClientCacheDamageAttributes()
{
    super.ClientCacheDamageAttributes();
    //return;    
}

function DHD_CoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], phCon;

    phCon = LPAIControllerSentinel(LPC);
    // End:0x11C
    if(phCon != none)
    {
        phCon.NotifyOfCoreHit(HitCoreIndex, float(MySentinelPawn.TakeDamageParams.Damage), MySentinelPawn.TakeDamageParams.DamageType);
        // End:0x11C
        if(MySentinelPawn.TakeDamageParams.DamageType == Class'LPDamageTypeMelee')
        {
            phCon.CmdHitReaction(0.0000000);
        }
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], phCon;

    phCon = LPAIControllerSentinel(LPC);
    // End:0x113
    if(phCon != none)
    {
        phCon.NotifyOfNonCoreHit(float(MySentinelPawn.TakeDamageParams.Damage), MySentinelPawn.TakeDamageParams.DamageType);
        // End:0x113
        if(MySentinelPawn.TakeDamageParams.DamageType == Class'LPDamageTypeMelee')
        {
            phCon.CmdHitReaction(0.0000000);
        }
    }
    //return;    
}
