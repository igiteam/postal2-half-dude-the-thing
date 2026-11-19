class LPDamageReactionManagerPhadyr extends LPDamageReactionManagerAkrid
    editinlinenew;

var(0.25_Pct) /*0x97E50000-0x00000000*/ private @NULL MyPhadyrPawn;

function InitWithPawn()
{
    local /*0x97E50000-0x00000000*/ private @NULL inPawn[8388609];

    super.InitWithPawn(inPawn);
    MyPhadyrPawn = LPAIPawnPhadyr(inPawn);
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
    if(MyPhadyrPawn.Health <= 0)
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

simulated function ClientCacheDamageAttributes()
{
    super.ClientCacheDamageAttributes();
    MyPhadyrPawn.UpdateDamagePustuleSystem();
    //return;    
}

function DHD_CoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], phCon;

    phCon = LPAIControllerPhadyr(LPC);
    MyPhadyrPawn.UpdateDamagePustuleSystem();
    // End:0x13B
    if(phCon != none)
    {
        phCon.NotifyOfCoreHit(HitCoreIndex, float(MyPhadyrPawn.TakeDamageParams.Damage), MyPhadyrPawn.TakeDamageParams.DamageType);
        // End:0x13B
        if(MyPhadyrPawn.TakeDamageParams.DamageType == Class'LPDamageTypeMelee')
        {
            phCon.CmdHitReaction(0.0000000);
        }
    }
    //return;    
}

function DHD_NonCoreHitReaction()
{
    local /*0x97E50000-0x00000000*/ private @NULL LPC[8388609], phCon;

    phCon = LPAIControllerPhadyr(LPC);
    MyPhadyrPawn.UpdateDamagePustuleSystem();
    // End:0x132
    if(phCon != none)
    {
        phCon.NotifyOfNonCoreHit(float(MyPhadyrPawn.TakeDamageParams.Damage), MyPhadyrPawn.TakeDamageParams.DamageType);
        // End:0x132
        if(MyPhadyrPawn.TakeDamageParams.DamageType == Class'LPDamageTypeMelee')
        {
            phCon.CmdHitReaction(0.0000000);
        }
    }
    //return;    
}
